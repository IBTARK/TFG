# db.py  – conexión + reflexión automática
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.automap import automap_base

# Connection
ENGINE_URI = "mysql+pymysql://user:pass@localhost/metro?charset=utf8mb4"

engine = create_engine(ENGINE_URI, future=True)

# Automap
Base = automap_base()
Base.prepare(engine, reflect = True)          # introspection of all the shcema

# Dinamycally generated classes
Station    = Base.classes.metroDatos
Connection = Base.classes.conexiones

Session = sessionmaker(bind=engine, future=True)
