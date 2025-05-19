from display_graph import printSimpleGraph
import networkx as nx

subway = nx.Graph()

nodos = [
    ('San Bernardo', 4),
    ('Ventura Rodríguez',   3),
    ('Príncipe Pío', 6),
    ('Argüelles',    4),
    ('Argüelles',    6),
    ('Argüelles',    3),
    ('Moncloa',      6),
    ('Moncloa',      3),
    ('Ciudad Universitaria', 6),
]

subway.add_nodes_from(nodos)

# Línea 4 (marrón)
subway.add_edge(('San Bernardo', 4), ('Argüelles', 4), lineId=4)

# Línea 6 (gris)
subway.add_edge(('Príncipe Pío', 6), ('Argüelles', 6), lineId=6)
subway.add_edge(('Argüelles',6), ('Moncloa', 6), lineId=6)
subway.add_edge(('Moncloa',6), ('Ciudad Universitaria', 6), lineId=6)

# Línea 3 (amarillo)
subway.add_edge(('Ventura Rodríguez', 3), ('Argüelles', 3), lineId=3)
subway.add_edge(('Argüelles', 3), ('Moncloa', 3), lineId=3)

transbordos_arguelles = [
    (('Argüelles', 4), ('Argüelles', 6)),
    (('Argüelles', 4), ('Argüelles', 3)),
    (('Argüelles', 6), ('Argüelles', 3)),
]
# En Moncloa línea 6 ↔ línea 3
transbordos_moncloa = [
    (('Moncloa', 6), ('Moncloa', 3)),
]

nodo_virtual = [
    ("Virtual Moncloa", -1)
]

subway.add_node(("Virtual Moncloa", -1))

for u, v in transbordos_arguelles + transbordos_moncloa:
    subway.add_edge(u, v, lineId=None)

subway.add_edge(
                ("Virtual Moncloa", -1),
                ("Moncloa", 6),
                time = 0,
                weight = 0,
                lineId = None
            )

subway.add_edge(
                ("Virtual Moncloa", -1),
                ("Moncloa", 3),
                time = 0,
                weight = 0,
                lineId = None
            )

printSimpleGraph(subway)

