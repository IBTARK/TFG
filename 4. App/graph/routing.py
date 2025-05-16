import networkx as nx
import matplotlib.pyplot as plt
from copy import deepcopy
import json

from display_graph.display_graph import printSimpleGraph

from config import TRANSFER_TIME, FILTERS_RANKING, REWARDS, PENALTIES

# Check if a station sitisfies all the filters
def stationOk(subway, stationLine, filters):
    
    characteristics = subway.nodes[(stationLine[0], stationLine[1])]["characteristics"]
    return all(characteristics.get(filterChar, None) == 1 for filterChar in filters)

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
        (station, line) for station, line in subway.nodes if len(linesPerStation[station]) > 1 and station not in (sourceNode[0], destinationNode[0]) and not stationOk(subway, (station, line), filters)
    ]

    subway.remove_nodes_from(badNodes)
    return subway


# Modify the weight of the transfer stations based on the filters
def modifyTransferStationsWeights(subway, sourceNode, destinationNode, filters, linesPerStation):
    cont = 0
    for firstNode, secondNode, data in subway.edges(data = True):
        penalty = 1
        
        # Check if any of the nodes are a transfer station
        if data["lineId"] == None: # Transfer edge
            if (firstNode[0] != sourceNode[0] and firstNode[0] != destinationNode[0]):
                u_characteristics = subway.nodes[firstNode].get("characteristics", {}) 
                penalty *= calculatePenalty(u_characteristics, filters)
            cont +=1  

        data["weight"] = data["time"] * penalty 
    print(cont)

    return subway

# Calculate new weight of the edge (u, v) based on filters 
def calculatePenalty(characteristics, filters):
    penalty = 1

    for filterChar in filters:
        if filterChar in characteristics and characteristics[filterChar] == 1:
            penalty *=  REWARDS[FILTERS_RANKING[filterChar]]
        else:
            penalty *=  PENALTIES[FILTERS_RANKING[filterChar]]

    return penalty

# Given the graph, a path and the stations that are transfer stations, return the name of the stattions in the path, the names of the stations that are transfer stations in the path
# the time of the route and a description. The output is a dictionary with the listed values
def getStationsNamesInPath(path, stations, time, description):
    pathNames = []

    for idx in range(len(path)):
        if idx != 0 and idx != len(path) -1 or ((idx == 0 or idx == len(path) -1) and path[idx][1] != None):
            pathNames.append(
                {
                    "station_id": path[idx][0],
                    "station_name": stations[path[idx][0]]["name"],
                    "line": path[idx][1],
                }
            )

    return {
                "path": pathNames,
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
                (stationId, -1),
                # Information to save in the node
                name = None,
                address = None,
                description = None,
                characteristics = {}
            )

            # Add the virtual edges
            for line in linesPerStation[stationId]:
                subwayCpy.add_edge(
                    (stationId, -1),
                    (stationId, line),
                    time = 0,
                    weight = 0,
                    lineId = None
                )

            return (stationId, -1)

        return (stationId, next(iter(linesPerStation[stationId])))


    sourceNode = createVirtualNode(sourceId)
    destinationNode = createVirtualNode(destinationId)
        

    return subwayCpy, sourceNode, destinationNode


def getRoutes(subway, linesPerStation, stations, source, destination, filters):
    # Create the duplicates of the subway and get the source and destination nodes (virtual or real)
    subwayVar1, sourceNode, destinationNode = addVirtualNodes(subway, source, destination, linesPerStation)
    subwayVar2 = deepcopy(subwayVar1)
    subwayVar3 = deepcopy(subwayVar1)

    print(len(list(nx.connected_components(subwayVar1))))

    print(len(subway.nodes))
    print(len(subway.edges))
    print(len(subwayVar1.nodes))
    print(len(subwayVar1.edges))

    print(sourceNode)
    print(destinationNode)
    print(filters)
    # TODO delete
    #printSimpleGraph(subwayVar3, align_lines = True, show_labels = False, show_transfers = True, nodes_size=20)

    # Modify or reevaluate the graphs (subway)
    elimatedNodesGraph = pruneGraph(subwayVar1, sourceNode, destinationNode, filters)
    eliminateTranferStationsGraph = pruneTranferStationsGraph(subwayVar2, sourceNode, destinationNode, filters, linesPerStation)
    reevalutedEdgesGraph = modifyTransferStationsWeights(subwayVar3, sourceNode, destinationNode, filters, linesPerStation)

    print(len(list(nx.connected_components(reevalutedEdgesGraph))))

    # For each graph find the optimar path
    try:
        dijkstra1Cost, dijkstra1path= nx.single_source_dijkstra(elimatedNodesGraph, sourceNode, target = destinationNode, weight = "weight")
        dijkstra1Time = nx.path_weight(elimatedNodesGraph, dijkstra1path, weight = "time")
    except nx.NetworkXNoPath:
        dijkstra1path = None

    try:
        dijkstra2Cost, dijkstra2path = nx.single_source_dijkstra(eliminateTranferStationsGraph, sourceNode, target = destinationNode, weight = "weight")
        dijkstra2Time = nx.path_weight(eliminateTranferStationsGraph, dijkstra2path, weight = "time")
    except nx.NetworkXNoPath:
        dijkstra2path = None

    try:
        print(reevalutedEdgesGraph.has_node(sourceNode))
        print(reevalutedEdgesGraph.has_node(destinationNode))
        print(nx.has_path(reevalutedEdgesGraph, sourceNode, destinationNode))
        dijkstra3Cost, dijkstra3path = nx.single_source_dijkstra(reevalutedEdgesGraph, sourceNode, target = destinationNode, weight = "weight")
        dijkstra3Time = nx.path_weight(reevalutedEdgesGraph, dijkstra3path, weight = "time")
    except nx.NetworkXNoPath:
        print("No encontrado")
        raise

    # Generate result
    alternativePaths = []

    # 1 Possible route
    if not dijkstra1path and not dijkstra2path:
        alternativePaths.append(getStationsNamesInPath(dijkstra3path, stations, dijkstra3Time, "Mejor ruta posible"))
    
    # 2 possible routes (dijkstra2 and dijkstra3)
    elif not dijkstra1path:

        alternativePaths.append(getStationsNamesInPath(dijkstra2path, stations, dijkstra2Time, "Ruta en la que todas las estaciones de transbordo cumplen con todos los filtros"))
        alternativePaths.append(getStationsNamesInPath(dijkstra3path, stations, dijkstra3Time, "Ruta alternativa (no todos los filtros deben cumplirse)"))
    
    # 2 possible routes (dijkstra1 and dijkstra3)
    elif not dijkstra2path:

        alternativePaths.append(getStationsNamesInPath(dijkstra1path, stations, dijkstra1Time, "Ruta en la que todas las estaciones cumplen con todos los filtros"))
        alternativePaths.append(getStationsNamesInPath(dijkstra3path, stations, dijkstra3Time, "Ruta alternativa (no todos los filtros deben cumplirse)"))

    # 3 possible routes (dijkstra1, dijkstra2 and dijkstra3)
    else:

        alternativePaths.append(getStationsNamesInPath(dijkstra1path, stations, dijkstra1Time, "Ruta en la que todas las estaciones cumplen con todos los filtros"))
        alternativePaths.append(getStationsNamesInPath(dijkstra2path, stations, dijkstra2Time, "Ruta en la que todas las estaciones de transbordo cumplen con todos los filtros"))
        alternativePaths.append(getStationsNamesInPath(dijkstra3path, stations, dijkstra3Time, "Ruta alternativa (no todos los filtros deben cumplirse)"))
    
    print(alternativePaths)

    return alternativePaths
    

def display(subway):
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