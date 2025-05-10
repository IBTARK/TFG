import networkx as nx
from sqlalchemy import select
from db import Session, Station, Connection
import matplotlib.pyplot as plt
import networkx as nx

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