import networkx as nx
from sqlalchemy import select, func
from db import Session, Station, Connection, Line, StationCharacteristics, StationsLines, Characteristic
import matplotlib.pyplot as plt
import networkx as nx
from collections import defaultdict
from copy import deepcopy
import json

def buildBaseSubwayNetwork():

    subway = nx.MultiGraph()
    linesPerStation = {}
    transferStations = set()

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

        # Nodes
        for station in s.execute(Station):
            subway.add_node(
                station.id,
                # Information to save in the node
                name = getattr(station, "nombre", None),
                address = getattr(station, "direccion", None),
                description = getattr(station, "descripcion", None),
                characteristics = stations_characteristics.get(station.id, {})
            )
        
        # Edges
        conectionsSelect = (
            select(
                Connection.station_source,
                Connection.station_destination,
                Connection.line,
                Connection.time,
                Line.name,
                Line.acronym,
                Line.color,
            )
            .join(Line, Connection.line == Line.id)
        )
        for (source, destination, lineId, time, lineName, lineAcronym, lineColor) in s.execute(conectionsSelect):
            subway.add_edge(
                source,
                destination,
                key = lineId,
                # Information to save in the edge
                time = time,
                weight = time, # This will be modified with the filters in real time
                lineId = lineId,
                lineName = lineName,
                lineAcronym = lineAcronym,
                lineColor = lineColor,
            )

        # Calculate how many lines does a station belong
        stationLinesSelect = (
            select(StationsLines.station_id, func.count(StationsLines.line_id)
            )
            .group_by(StationsLines.station_id)
        )

        result = s.execute(stationLinesSelect)

        # Convert into a dict
        linesPerStation = {station_id: count for station_id, count in result}
        
        for station in linesPerStation:
            if (linesPerStation[station] > 1):
                transferStations.add(station)
    
    return subway, transferStations

# Check if a station sitisfies all the filters
def stationOk(subway, station, filters):
    characteristics = subway.nodes[station]["characteristics"]
    return all(characteristics.get(filter, None) == 1 for filter in filters)

# Remove the nodes that breach any of the filters (except for the source and destination)
def pruneGraph(subway, source, destination, filters):

    # Deep copy of the subway
    subwayCpy = deepcopy(subway)

    # Detect all the nodes that breach any of the filters
    badNodes = [
        station for station in subwayCpy.nodes if station not in (source, destination) and not stationOk(subwayCpy, station, filters)
    ]

    subwayCpy.remove_nodes_from(badNodes)
    return subwayCpy


# Remove the nodes that are transfer station and breach any of the filters (except for the source and destination)
def pruneTranferStationsGraph(subway, source, destination, filters, transferStations):

    # Deep copy of the subway
    subwayCpy = deepcopy(subway)

    # Detect all the nodes that breach any of the filters
    badNodes = [
        station for station in transferStations if station not in (source, destination) and not stationOk(subwayCpy, station, filters)
    ]

    subwayCpy.remove_nodes_from(badNodes)
    return subwayCpy


# Modify the weight of the transfer stations based on the filters
def modifyTransferStationsWeights(subway, source, destination, filters, transferStations):

    # Generate the rewards, penalizations and filter classification
    filtersRanking = {
        "limpio": "medium",
        "grande": "soft",
        "nuevo": "soft",
        "bonito": "soft",
        "accesible": "hard",
        "intransitado": "medium",
        "tranquilo": "medium",
        "seguro": "hard",
        "luminoso": "medium",
        "mecanico": "medium",
        "ascensor": "hard"
    }

    rewards = {
        "hard": 0.6,
        "medium": 0.75,
        "soft": 0.88
    }

    penalties = {
        "hard": 1.5,
        "medium": 1.25,
        "soft": 1.1
    }

    # Deep copy of the subway
    subwayCpy = deepcopy(subway)

    for u, v, k, data in subwayCpy.edges(key = True, data = True):
        penalty = 1
        
        # Check if any of the nodes are a transfer station
        if (u in transferStations and (u != source and u != destination)):
            u_characteristics = subwayCpy.nodes[u].get("characteristics", {}) 
            penalty *= calculatePenalty(u_characteristics, filters, filtersRanking, rewards, penalties)  

        if (v in transferStations and (v != source and v != destination)): # Si lo es la segunda repetimos lo anterior con este nodo
            v_characteristics = subwayCpy.nodes[v].get("characteristics", {})
            penalty *= calculatePenalty(v_characteristics, filters, filtersRanking, rewards, penalties)

        data["weight"] = data["weight"] * penalty 

    return subwayCpy

# Calculate new weight of the edge (u, v) based on filters 
def calculatePenalty(characteristics, filters, filtersRanking, rewards, penalties):
    penalty = 1

    for filter in filters:
        if filter in characteristics and characteristics[filter] == 1:
            penalty *=  rewards[filtersRanking[filter]]
        else:
            penalty *=  penalties[filtersRanking[filter]]

    return penalty

# Given the graph, a path and the stations that are transfer stations, return the name of the stattions in the path, the names of the stations that are transfer stations in the path
# the time of the route and a description. The output is a dictionary with the listed values
def getStationsNamesInPath(subway, path, transferStations, time, description):
    pathNames = []
    transferStationsInPath = []
    linesIndPath = []

    for stationId in path:
        stationName = subway.nodes[stationId]["name"]
        pathNames.append(stationName)
        if stationId in transferStations:
            transferStationsInPath.append(stationName)

    return {
                "path": pathNames,
                "transferStations": transferStationsInPath,
                "time": time,
                "description": description
            }



def getRoutes(source, destination, filters):
    subway, transferStations = buildBaseSubwayNetwork()

    elimatedNodesGraph = pruneGraph(subway, source, destination, filters)
    eliminateTranferStationsGraph = pruneTranferStationsGraph(subway, source, destination, filters, transferStations)
    reevalutedEdgesGraph = modifyTransferStationsWeights(subway, source, destination, filters, transferStations)

    try:
        dijkstra1path, dijkstra1Cost= nx.single_source_dijkstra(elimatedNodesGraph, source, target = destination, weight = "weight")
        dijkstra1Time = nx.path_weight(elimatedNodesGraph, dijkstra1path, weight = "time")
    except nx.NetworkXNoPath:
        dijkstra1path = None

    try:
        dijkstra2path, dijkstra2Cost = nx.single_source_dijkstra(eliminateTranferStationsGraph, source, target = destination, weight = "weight")
        dijkstra2Time = nx.path_weight(eliminateTranferStationsGraph, dijkstra2path, weight = "time")
    except nx.NetworkXNoPath:
        dijkstra2path = None

    dijkstra3path, dijkstra3Cost = nx.single_source_dijkstra(reevalutedEdgesGraph, source, target = destination, weight = "weight")
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