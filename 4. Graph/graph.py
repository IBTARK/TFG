import networkx as nx
from sqlalchemy import select, func
from db import Session, Station, Connection, Line, StationCharacteristics, StationsLines
import matplotlib.pyplot as plt
import networkx as nx
from collections import defaultdict
from copy import deepcopy

def buildBaseSubwayNetwork():

    subway = nx.MultiGraph()
    linesPerStation = {}
    transferStations = []

    with Session() as s:

        # Save the characteristics by station
        stations_characteristics = defaultdict(dict)
        for characteristic in s.scalars(select(StationCharacteristics)):
            stations_characteristics[characteristic.station_id][characteristic.characteristic_id] = characteristic.value

        # Nodes
        for station in s.scalars(select(Station)):
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

    for u, v, data in subwayCpy.edges(data = True):
        penalty = 1
        
        # Check if any of the nodes are a transfer station
        if (u in transferStations and (u != source and u != destination)):
            u_characteristics = subwayCpy.nodes[u].get("characteristics", {}) 
            penalty *= calculatePenalty(u_characteristics, filters)  

        if (v in transferStations and (v != source and v != destination)): # Si lo es la segunda repetimos lo anterior con este nodo
            v_characteristics = subwayCpy.nodes[v].get("characteristics", {})
            penalty *= calculatePenalty(v_characteristics, filters)

        data["weight"] = data["weight"] * penalty 

    return subwayCpy

# Esta fucion esta por determinar debido a que no hemos aclarado bien como se iba a implementar del todo
# Calculate new weight of the edge (u, v) based on filters 
def calculatePenalty(characteristics, filters, filtersRanking, rewards, penalties):
    penalty = 1

    for filter in filters:
        if filter in characteristics:
            if characteristics[filter] == 1:
                penalty *=  rewards[filtersRanking[filter]]
            else:
                penalty *= penalties[filtersRanking[filter]]

    return penalty

def getRute(source, destination, filters):
    (subway, tranferStations) = buildBaseSubwayNetwork()

    elimatedNodesGraph = pruneGraph(subway, source, destination, filters)
    eliminateTranferStationsGraph = pruneTranferStationsGraph(subway, source, destination, filters, tranferStations)
    reevalutedEdgesGraph = modifyTransferStationsWeights(subway, source, destination, filters, tranferStations)

    djistra1path = nx.dijkstra_path(elimatedNodesGraph, source, destination, weight='weight')
    djistra1length = nx.dijkstra_path_length(elimatedNodesGraph, source, destination, weight='weight')
    djistra2path = nx.dijkstra_path(eliminateTranferStationsGraph, source, destination, weight='weight')
    djistra2length = nx.dijkstra_path_length(elimatedNodesGraph, source, destination, weight='weight')
    djistra3path = nx.dijkstra_path(reevalutedEdgesGraph, source, destination, weight='weight')
    djistra3length = nx.dijkstra_path_length(elimatedNodesGraph, source, destination, weight='weight')





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