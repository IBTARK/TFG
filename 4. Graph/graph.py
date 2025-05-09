import networkx as nx
from sqlalchemy import select
from db import Session, Station, Connection

def buildBaseSubwayNetwork():

    subway = nx.Graph()

    with Session() as s:

        # Nodes
        for station in s.scalars(select(Station)):
            subway.add_node(
                station.id,
                name = getattr(station, "nombre", None),
                address = getattr(station, "direccion", None),
                description = getattr(station, "descripcion", None)
            )
        
        # Edges
        for connection in s.scalars(select(Connection)):
            subway.add_edge(
                connection.estacion_origen,
                connection.estacion_destino,
                weight = connection.tiempo
            )
    
    return subway