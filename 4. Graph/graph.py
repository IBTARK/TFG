import networkx as nx
from sqlalchemy import select, func
from db import Session, Station, Connection, Line, StationCharacteristics, StationsLines, Characteristic
import matplotlib.pyplot as plt
import networkx as nx
from collections import defaultdict
from copy import deepcopy
import json
import itertools

from configuration import TRANSFER_TIME, FILTERS_RANKING, REWARDS, PENALTIES

def buildBaseSubwayNetwork():

    subway = nx.Graph()
    linesPerStation = defaultdict(set)

    with Session() as s:

        # Save the characteristics by station
        characteristicsSelect = (
            select(
                StationCharacteristics.station_id,
                StationCharacteristics.value,
                Characteristic.description
            )
            .join(Characteristic, StationCharacteristics.characteristic_id == Characteristic.id)
        )
        stations_characteristics = defaultdict(dict)
        for station_id, value, description in s.execute(characteristicsSelect):
            stations_characteristics[station_id][description] = value

        # Nodes (station, line)
        stationsSelect = (
            select(
                Station.id,
                Station.name,
                Station.address,
                Station.description,
                StationsLines.line_id
            )
            .join(StationsLines, Station.id == StationsLines.station_id)
        )
        for stationId, stationName, stationAddress, stationDescription, lineId in s.execute(stationsSelect):
            subway.add_node(
                (stationId, lineId),
                # Information to save in the node
                name = stationName,
                address = stationAddress,
                description = stationDescription,
                characteristics = stations_characteristics.get(stationId, {})
            )
            
            linesPerStation[stationId].add(lineId)
        
        # Normal edges (the ones in the same line)
        connectionsSelect = (
            select(
                Connection.station_source,
                Connection.station_destination,
                Connection.line,
                Connection.time
            )
        )

        for source, destination, lineId, time in s.execute(connectionsSelect):
            subway.add_edge(
                (source, lineId),
                (destination, lineId),
                # Information to save in the edge
                time = time,
                weight = time, # This will be modified with the filters in real time
                lineId = lineId
            )
        
        # Transfer edges (inside the same station if they have more than one line)
        for station, lines in linesPerStation.items():
            if len(lines) > 1:
                for line1, line2 in itertools.combinations(lines, 2):
                    subway.add_edge(
                        (station, line1),
                        (station, line2),
                        time = TRANSFER_TIME,
                        weight = TRANSFER_TIME,
                        lineId = None
                    )

    return subway, linesPerStation

# Check if a station sitisfies all the filters
def stationOk(subway, stationLine, filters):
    characteristics = subway.nodes[(stationLine[0], stationLine[1])]["characteristics"]
    return all(characteristics.get(filter, None) == 1 for filter in filters)

# Remove the nodes that breach any of the filters (except for the source and destination)
def pruneGraph(subway, sourceNode, destinationNode, filters):

    # Detect all the nodes that breach any of the filters
    badNodes = [
        (station, line) for station, line in subway.nodes if station not in (sourceNode[0], destinationNode[0]) and not stationOk(subway, (station, line), filters)
    ]

    subway.remove_nodes_from(badNodes)
    return subway


# Remove the nodes that are transfer station and breach any of the filters (except for the source and destination)
def pruneTranferStationsGraph(subway, sourceNode, destinationNode, filters, linesPerStation):
    # Detect all the nodes that breach any of the filters
    badNodes = [
        (station, line) for station, line in subway.nodes if len(linesPerStation[station]) > 1 and station not in (sourceNode[0], destinationNode[0]) and not stationOk(subway, station, filters)
    ]

    subway.remove_nodes_from(badNodes)
    return subway


# Modify the weight of the transfer stations based on the filters
def modifyTransferStationsWeights(subway, sourceNode, destinationNode, filters, linesPerStation):

    for firstNode, secondNode, k, data in subway.edges(key = True, data = True):
        penalty = 1
        
        # Check if any of the nodes are a transfer station
        if data["lineId"] == None: # Transfer edge
            if (firstNode[0] != sourceNode[0] and firstNode[0] != destinationNode[0]):
                u_characteristics = subway.nodes[firstNode].get("characteristics", {}) 
                penalty *= calculatePenalty(u_characteristics, filters)  

        data["weight"] = data["weight"] * penalty 

    return subway

# Calculate new weight of the edge (u, v) based on filters 
def calculatePenalty(characteristics, filters):
    penalty = 1

    for filter in filters:
        if filter in characteristics and characteristics[filter] == 1:
            penalty *=  REWARDS[FILTERS_RANKING[filter]]
        else:
            penalty *=  PENALTIES[FILTERS_RANKING[filter]]

    return penalty

# Given the graph, a path and the stations that are transfer stations, return the name of the stattions in the path, the names of the stations that are transfer stations in the path
# the time of the route and a description. The output is a dictionary with the listed values
def getStationsNamesInPath(subway, path, linesPerStation, time, description):
    pathNames = []
    transferStationsInPath = []
    linesIndPath = []

    for stationNode in path:
        if stationNode["lineId"]:
            stationName = subway.nodes[stationNode]["name"]
            pathNames.append(stationName)
            if len(linesPerStation[stationId]) > 1:
                transferStationsInPath.append(stationName)

    return {
                "path": pathNames,
                "transferStations": transferStationsInPath,
                "time": time,
                "description": description
            }

# Add virtual nodes and edges if source and/or destination are transfer stations
def addVirtualNodes(subway, sourceId, destinationId, linesPerStation):

    # Deep copy of the subway
    subwayCpy = deepcopy(subway)

    def createVirtualNode(stationId):
        if len(linesPerStation[stationId]) > 1:
            # Add the virtual node
            subwayCpy.add_node(
                (stationId, None),
                # Information to save in the node
                name = None,
                address = None,
                description = None,
                characteristics = None
            )

            # Add the virtual edges
            for line in linesPerStation[stationId]:
                subwayCpy.add_edge(
                    (stationId, None),
                    (stationId, line),
                    time = 0,
                    weight = 0,
                    lineId = None
                )

            return (stationId, None)

        return (stationId, next(iter(linesPerStation[stationId])))


    sourceNode = createVirtualNode(sourceId)
    destinationNode = createVirtualNode(destinationId)
        

    return subwayCpy, sourceNode, destinationNode


def getRoutes(source, destination, filters):
    subway, linesPerStation = buildBaseSubwayNetwork()

    # Create the duplicates of the subway and get the source and destination nodes (virtual or real)
    subwayVar1, sourceNode, destinationNode = addVirtualNodes(subway, source, destination, linesPerStation)
    subwayVar2 = deepcopy(subwayVar1)
    subwayVar3 = deepcopy(subwayVar1)

    # Modify or reevaluate the graphs (subway)
    elimatedNodesGraph = pruneGraph(subwayVar1, sourceNode, destinationNode, filters)
    eliminateTranferStationsGraph = pruneTranferStationsGraph(subwayVar2, sourceNode, destinationNode, filters, linesPerStation)
    reevalutedEdgesGraph = modifyTransferStationsWeights(subwayVar3, sourceNode, destinationNode, filters, linesPerStation)

    # For each graph find the optimar path
    try:
        dijkstra1path, dijkstra1Cost= nx.single_source_dijkstra(elimatedNodesGraph, sourceNode, target = destinationNode, weight = "weight")
        dijkstra1Time = nx.path_weight(elimatedNodesGraph, dijkstra1path, weight = "time")
    except nx.NetworkXNoPath:
        dijkstra1path = None

    try:
        dijkstra2path, dijkstra2Cost = nx.single_source_dijkstra(eliminateTranferStationsGraph, sourceNode, target = destinationNode, weight = "weight")
        dijkstra2Time = nx.path_weight(eliminateTranferStationsGraph, dijkstra2path, weight = "time")
    except nx.NetworkXNoPath:
        dijkstra2path = None

    dijkstra3path, dijkstra3Cost = nx.single_source_dijkstra(reevalutedEdgesGraph, sourceNode, target = destinationNode, weight = "weight")
    dijkstra3Time = nx.path_weight(reevalutedEdgesGraph, dijkstra3path, weight = "time")

    # Generate result
    alternativePaths = []

    # 1 Possible route
    if not dijkstra1path and not dijkstra2path:
        alternativePaths.append(getStationsNamesInPath(subway, dijkstra3path, transferStations, dijkstra3Time, "Mejor ruta posible"))
    
    # 2 possible routes (dijkstra2 and dijkstra3)
    elif not dijkstra1path:

        alternativePaths.append(getStationsNamesInPath(subway, dijkstra2path, transferStations, dijkstra2Time, "Ruta en la que todas las estaciones de transbordo cumplen con todos los filtros"))
        alternativePaths.append(getStationsNamesInPath(subway, dijkstra3path, transferStations, dijkstra3Time, "Ruta alternativa (no todos los filtros deben cumplirse)"))
    
    # 2 possible routes (dijkstra1 and dijkstra3)
    elif not dijkstra2path:

        alternativePaths.append(getStationsNamesInPath(subway, dijkstra1path, transferStations, dijkstra1Time, "Ruta en la que todas las estaciones cumplen con todos los filtros"))
        alternativePaths.append(getStationsNamesInPath(subway, dijkstra3path, transferStations, dijkstra3Time, "Ruta alternativa (no todos los filtros deben cumplirse)"))

    # 3 possible routes (dijkstra1, dijkstra2 and dijkstra3)
    else:

        alternativePaths.append(getStationsNamesInPath(subway, dijkstra1path, transferStations, dijkstra1Time, "Ruta en la que todas las estaciones cumplen con todos los filtros"))
        alternativePaths.append(getStationsNamesInPath(subway, dijkstra2path, transferStations, dijkstra2Time, "Ruta en la que todas las estaciones de transbordo cumplen con todos los filtros"))
        alternativePaths.append(getStationsNamesInPath(subway, dijkstra3path, transferStations, dijkstra3Time, "Ruta alternativa (no todos los filtros deben cumplirse)"))

    return json.dumps(alternativePaths, ensure_ascii = False)
    

def display():
    subway = buildBaseSubwayNetwork()

    # Si 'subway' ya está en tu namespace, basta con:
    pos = nx.spring_layout(subway)    # calcula una disposición “orgánica”
    plt.figure(figsize=(10, 10))
    nx.draw(
        subway,
        pos,
        with_labels=True,    # muestra el id de cada nodo
        node_size=50,        # tamaño de los puntos
        font_size=6          # tamaño de letra de las etiquetas
    )
    plt.title("Grafo de Metro de Madrid")
    plt.tight_layout()
    plt.show()