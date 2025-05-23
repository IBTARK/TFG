from graph.loader_and_builder import buildBaseSubwayNetwork

# Private variables form the module
_graph = None
_lines_per_station = None
_stations_info = None
_connections = None

def getSubway():
    """
    Returns (graph, lines_per_station, stations_info).
    The graph is built once and then cached.
    """
    global _graph, _lines_per_station, _stations_info, _connections

    if _graph is None:
        _graph, _lines_per_station, _stations_info, _connections = buildBaseSubwayNetwork()
    return _graph, _lines_per_station, _stations_info, _connections
