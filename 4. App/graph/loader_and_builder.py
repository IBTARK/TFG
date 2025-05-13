import networkx as nx
from sqlalchemy import select, func
from db import Session, Station, Connection, Line, StationCharacteristics, StationsLines, Characteristic
from collections import defaultdict
import itertools

from config import TRANSFER_TIME

def buildBaseSubwayNetwork():

    subway = nx.Graph()
    linesPerStation = defaultdict(set)
    stations = {}

    with Session() as s:

        # Save the information of the stations
        stationsSelect = (
            select(
                Station.id,
                Station.name,
                Station.address,
                Station.description
            )
        )

        for id, name, address, description in s.execute(stationsSelect):
            stations[id] = {
                "name": name,
                "address": address,
                "description": description
            }

        # Save the characteristics by station
        characteristicsSelect = (
            select(
                StationCharacteristics.station_id,
                StationCharacteristics.characteristic_id,
                StationCharacteristics.value
            )
        )
        stations_characteristics = defaultdict(dict)
        for stationId, characteristicId, value in s.execute(characteristicsSelect):
            stations_characteristics[stationId][characteristicId] = value

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

    return subway, linesPerStation, stations