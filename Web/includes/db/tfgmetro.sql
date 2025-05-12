
CREATE DATABASE IF NOT EXISTS tfgmetro;
USE tfgmetro;

DROP TABLE IF EXISTS estaciones_caracteristicas;
DROP TABLE IF EXISTS conexiones;
DROP TABLE IF EXISTS estaciones;
DROP TABLE IF EXISTS caracteristicas;
DROP TABLE IF EXISTS lineas;
DROP TABLE IF EXISTS estaciones_lineas;

CREATE TABLE caracteristicas (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE estaciones (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(255) DEFAULT NULL,
  descripcion TEXT DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE estaciones_caracteristicas (
  caracteristica_id INT(11) NOT NULL,
  estacion_id INT(11) NOT NULL,
  valor INT(11) NOT NULL,
  PRIMARY KEY (caracteristica_id, estacion_id),
  FOREIGN KEY (caracteristica_id) REFERENCES caracteristicas(id) ON DELETE CASCADE,
  FOREIGN KEY (estacion_id) REFERENCES estaciones(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE conexiones (
  id INT(11) NOT NULL AUTO_INCREMENT,
  estacion_origen INT(11) NOT NULL,
  estacion_destino INT(11) NOT NULL,
  linea INT(11) NOT NULL,
  tiempo INT(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (estacion_origen) REFERENCES estaciones(id) ON DELETE CASCADE,
  FOREIGN KEY (estacion_destino) REFERENCES estaciones(id) ON DELETE CASCADE,
  FOREIGN KEY (linea) REFERENCES lineas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE lineas (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  siglas VARCHAR(10) NOT NULL,
  color VARCHAR(6) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE estaciones_lineas (
  estacion_id int(11) NOT NULL,
  linea_id int(11) NOT NULL,
  orden int(11) NOT NULL,
  PRIMARY KEY (estacion_id, linea_id),
  FOREIGN KEY (estacion_id) REFERENCES estaciones(id) ON DELETE CASCADE,
  FOREIGN KEY (linea_id) REFERENCES lineas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
