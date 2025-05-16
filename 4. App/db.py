from sqlalchemy import create_engine, inspect, select
from sqlalchemy.orm import scoped_session, sessionmaker, DeclarativeBase, mapped_column
from sqlalchemy import Integer, String, ForeignKey, Float
from config import ENGINE_URI

engine = create_engine(ENGINE_URI, echo = True, pool_pre_ping = True)

Session: scoped_session = scoped_session(
    sessionmaker(bind=engine, autoflush=False, expire_on_commit=False)
)

class Base(DeclarativeBase):
    pass


# Models

class Station(Base):
    __tablename__ = "estaciones"

    id = mapped_column("id", Integer, primary_key = True)
    name = mapped_column("nombre", String)
    address = mapped_column("direccion", String)
    description = mapped_column("descripcion", String)

class Line(Base):
    __tablename__ = "lineas"

    id = mapped_column("id", Integer, primary_key = True)
    name = mapped_column("nombre", String)
    acronym = mapped_column("siglas", String)
    color = mapped_column("color", String)

class Characteristic(Base):
    __tablename__ = "caracteristicas"

    id = mapped_column("id", Integer, primary_key = True)
    description = mapped_column("descripcion", String)

class StationCharacteristics(Base):
    __tablename__ = "estaciones_caracteristicas"

    station_id = mapped_column("estacion_id", Integer, ForeignKey("estaciones.id", ondelete="CASCADE"), primary_key = True)
    characteristic_id = mapped_column("caracteristica_id", Integer, ForeignKey("caracteristicas.id", ondelete="CASCADE"), primary_key = True)
    value = mapped_column("valor", Integer)

class StationsLines(Base):
    __tablename__ = "estaciones_lineas"

    station_id = mapped_column("estacion_id", Integer, ForeignKey("estaciones.id", ondelete="CASCADE"), primary_key = True)
    line_id = mapped_column("linea_id", Integer, ForeignKey("lineas.id", ondelete="CASCADE"), primary_key = True)

class Connection(Base):
    __tablename__ = "conexiones"

    station_source  = mapped_column("estacion_origen", Integer, ForeignKey("estaciones.id", ondelete="CASCADE"),  primary_key = True)
    station_destination = mapped_column("estacion_destino", Integer, ForeignKey("estaciones.id", ondelete="CASCADE"), primary_key = True)
    line = mapped_column("linea", Integer, ForeignKey("lineas.id", ondelete="CASCADE"),  primary_key = True)
    time = mapped_column("tiempo", Integer)


inspector = inspect(engine)
print(inspector.get_table_names())


with Session() as session:
    # TODO delete
    stationsSelect = (
        select(
            Station.id,
            Station.name,
            StationsLines.line_id
        )
        .join(StationsLines, Station.id == StationsLines.station_id)
        .where(StationsLines.line_id == 6)
    )
    print("Consulta\n\n\n")
    for id, name, line_id in session.execute(stationsSelect):
        print(id, name, line_id)
    print("\n\n\n")
