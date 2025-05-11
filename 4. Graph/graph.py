import networkx as nx
from sqlalchemy import select
from db import Session, Station, Connection, Line, StationCharacteristics
import matplotlib.pyplot as plt
import networkx as nx
from collections import defaultdict
from copy import deepcopy

def buildBaseSubwayNetwork():

    subway = nx.MultiGraph()
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
    
    return subway

# Check if a station sitisfies all the filters
def stationOk(subway, station, filters):
    characteristics = subway.nodes[station][characteristics]
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