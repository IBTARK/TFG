from sqlalchemy import create_engine, inspect, select
from sqlalchemy.orm import sessionmaker, DeclarativeBase, mapped_column
from sqlalchemy import Integer, String, ForeignKey, Float

ENGINE_URI = "mysql+pymysql://root@localhost:3306/tfgmetro?charset=utf8mb4"
engine = create_engine(ENGINE_URI, echo = True, pool_pre_ping = True)
Session = sessionmaker(bind = engine, autoflush = False, expire_on_commit = False)

class Base(DeclarativeBase):
    pass


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

class Transfer(Base):
    __tablename__ = "transbordos"

    id = mapped_column("id", Integer, primary_key = True)
    station_id = mapped_column("id_estacion", Integer, ForeignKey("lineas.id", ondelete="CASCADE"))
    lines_transfers = mapped_column("lineas_transbordos", String)

class StationLines(Base):
    __tablename__ = "estaciones_lineas"

    station_id = mapped_column("estacion_id", Integer, ForeignKey("estaciones.id", ondelete="CASCADE"), primary_key = True)
    line_id = mapped_column("linea_id", Integer, ForeignKey("lineas.id", ondelete="CASCADE"), primary_key = True)
    order = mapped_column("orden", Integer)

class StationCharacteristics(Base):
    __tablename__ = "estaciones_caracteristicas"

    station_id = mapped_column("estacion_id", Integer, ForeignKey("estaciones.id", ondelete="CASCADE"), primary_key = True)
    characteristic_id = mapped_column("caracteristica_id", Integer, ForeignKey("caracteristicas.id", ondelete="CASCADE"), primary_key = True)
    value = mapped_column("valor", Integer)

class Connection(Base):
    __tablename__ = "conexiones"
    id               = mapped_column(Integer, primary_key = True)
    estacion_origen  = mapped_column(Integer, ForeignKey("estaciones.id", ondelete="CASCADE"))
    estacion_destino = mapped_column(Integer, ForeignKey("estaciones.id", ondelete="CASCADE"))
    tiempo           = mapped_column(Float)


inspector = inspect(engine)
print(inspector.get_table_names())


with Session() as session:
    stmt = select(Station).limit(5)
    for estacion in session.scalars(stmt):
        print(estacion.id, estacion.name, estacion.address)
