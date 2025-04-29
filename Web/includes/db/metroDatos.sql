TRUNCATE TABLE `estaciones`;

-- Inserción de estaciones de la Línea 1 del Metro de Madrid
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(1, 'Pinar de Chamartín', TRUE, 'Calle Arturo Soria, 330', 'Estación terminal de la línea 1 con conexión con la línea 4 y ML1.'),
(2, 'Bambú', TRUE, 'Calle Bambú, 12', 'Estación ubicada en el barrio de Chamartín.'),
(3, 'Chamartín', TRUE, 'Calle Agustín de Foxá, s/n', 'Estación con conexión con la línea 10 y Cercanías Renfe.'),
(4, 'Plaza de Castilla', TRUE, 'Paseo de la Castellana, 189', 'Intercambiador con líneas 1, 9 y 10.'),
(5, 'Valdeacederas', FALSE, 'Calle Bravo Murillo, 297', 'Estación del barrio de Tetuán.'),
(6, 'Tetuán', FALSE, 'Calle Bravo Murillo, 340', 'Ubicada en el distrito de Tetuán.'),
(7, 'Estrecho', FALSE, 'Calle Bravo Murillo, 377', 'Estación cerca de Bravo Murillo.'),
(8, 'Alvarado', FALSE, 'Calle Bravo Murillo, 255', 'Ubicada en la calle Bravo Murillo.'),
(9, 'Cuatro Caminos', TRUE, 'Glorieta de Cuatro Caminos, s/n', 'Conexión con líneas 2 y 6.'),
(10, 'Ríos Rosas', FALSE, 'Calle Ríos Rosas, 47', 'Cerca del Canal de Isabel II.'),
(11, 'Iglesia', FALSE, 'Calle Santa Engracia, 125', 'Estación en Chamberí.'),
(12, 'Chamberí', FALSE, 'Plaza de Chamberí, s/n', 'Estación fantasma, cerrada al público.'),
(13, 'Bilbao', TRUE, 'Glorieta de Bilbao, s/n', 'Conexión con línea 4.'),
(14, 'Tribunal', FALSE, 'Calle Fuencarral, 81', 'Conexión con línea 10.'),
(15, 'Gran Vía', FALSE, 'Calle Gran Vía, 27', 'Conexión con línea 5.'),
(16, 'Sol', TRUE, 'Puerta del Sol, s/n', 'Conexión con líneas 2 y 3.'),
(17, 'Tirso de Molina', FALSE, 'Plaza de Tirso de Molina, s/n', 'Situada en el barrio de Embajadores.'),
(18, 'Antón Martín', FALSE, 'Plaza de Antón Martín, s/n', 'Ubicada en el centro de Madrid.'),
(19, 'Estación del Arte', FALSE, 'Paseo del Prado, s/n', 'Cercana a museos y Atocha.'),
(20, 'Atocha', TRUE, 'Glorieta del Emperador Carlos V, s/n', 'Estación de conexión futura con línea 11.'),
(21, 'Menéndez Pelayo', FALSE, 'Avenida de Menéndez Pelayo, 67', 'Ubicada junto al parque del Retiro.'),
(22, 'Pacífico', TRUE, 'Calle de Cavanilles, 5', 'Conexión con línea 6.'),
(23, 'Puente de Vallecas', FALSE, 'Avenida de la Albufera, 145', 'Estación del distrito de Vallecas.'),
(24, 'Nueva Numancia', FALSE, 'Avenida de la Albufera, 125', 'Zona de Puente de Vallecas.'),
(25, 'Portazgo', FALSE, 'Avenida de la Albufera, 99', 'Junto al estadio del Rayo Vallecano.'),
(26, 'Buenos Aires', FALSE, 'Avenida de la Albufera, 67', 'Ubicada en el barrio de Numancia.'),
(27, 'Alto del Arenal', TRUE, 'Avenida de la Albufera, 45', 'Cerca del centro comercial Albufera Plaza.'),
(28, 'Miguel Hernández', FALSE, 'Avenida de la Albufera, 25', 'Barrio de Entrevías.'),
(29, 'Sierra de Guadalupe', FALSE, 'Calle Sierra de Guadalupe, s/n', 'Conexión con Cercanías Renfe.'),
(30, 'Villa de Vallecas', FALSE, 'Paseo de Federico García Lorca, 2', 'Distrito de Villa de Vallecas.'),
(31, 'Congosto', FALSE, 'Calle Congosto, 1', 'Zona sur de Vallecas.'),
(32, 'La Gavia', TRUE, 'Avenida del Ensanche de Vallecas, s/n', 'Cerca del centro comercial La Gavia.'),
(33, 'Las Suertes', TRUE, 'Avenida del Ensanche de Vallecas, s/n', 'Ubicada en el Ensanche de Vallecas.'),
(34, 'Valdecarros', TRUE, 'Avenida del Ensanche de Vallecas, s/n', 'Estación terminal de la línea 1 al sureste.');

-- Nuevas estaciones Línea 2 (excluyendo Sol y Cuatro Caminos ya insertadas)
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(35, 'Canal', TRUE, 'Calle de Cea Bermúdez, 1', 'Conexión con línea 7.'),
(36, 'Quevedo', FALSE, 'Glorieta de Quevedo, s/n', 'Ubicada en el distrito de Chamberí.'),
(37, 'San Bernardo', TRUE, 'Calle de San Bernardo, 107', 'Conexión con línea 4.'),
(38, 'Noviciado', FALSE, 'Calle de San Bernardo, 63', 'Estación en el barrio de Universidad.'),
(39, 'Santo Domingo', FALSE, 'Plaza de Santo Domingo, s/n', 'Ubicada en el distrito Centro.'),
(40, 'Ópera', TRUE, 'Plaza de Isabel II, s/n', 'Conexión con líneas 5 y Ramal.'),
(41, 'Sevilla', FALSE, 'Calle de Alcalá, 13', 'Ubicada en pleno centro, próxima al Círculo de Bellas Artes.'),
(42, 'Banco de España', TRUE, 'Plaza de Cibeles, s/n', 'Frente al Banco de España y próximo a museos.'),
(43, 'Retiro', TRUE, 'Calle de Alcalá, 83', 'Junto a la entrada del Parque del Retiro.'),
(44, 'Príncipe de Vergara', TRUE, 'Calle Príncipe de Vergara, 5', 'Conexión con línea 9, en el barrio de Salamanca.'),
(45, 'Goya', TRUE, 'Calle de Goya, 1', 'Conexión con línea 4, junto al Palacio de los Deportes.'),
(46, 'Manuel Becerra', TRUE, 'Plaza de Manuel Becerra, s/n', 'Conexión con línea 6, en el distrito de Salamanca.'),
(47, 'Ventas', TRUE, 'Calle de Alcalá, 237', 'Conexión con línea 5 y cerca de la Plaza de Toros.'),
(48, 'La Elipa', TRUE, 'Calle Santa Felicidad, 1', 'Ubicada en el barrio de Ventas.'),
(49, 'La Almudena', TRUE, 'Calle de los Hermanos García Noblejas, 115', 'Estación cercana al cementerio de La Almudena.'),
(50, 'Alsacia', TRUE, 'Avenida de Guadalajara, 26', 'Ubicada en el barrio de San Blas-Canillejas.'),
(51, 'Avenida de Guadalajara', TRUE, 'Avenida de Guadalajara, s/n', 'Estación en expansión urbana al este de Madrid.'),
(52, 'Las Rosas', TRUE, 'Avenida de Niza, s/n', 'Estación terminal de la Línea 2, en el barrio del mismo nombre.');

-- Inserción de estaciones de la Línea 3
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(53, 'Moncloa', TRUE, 'Plaza de Moncloa, s/n', 'Estación terminal en el noroeste de Madrid, con conexiones con las líneas 6 y 10.'),
(54, 'Argüelles', TRUE, 'Calle de Arguelles, 76', 'Ubicada en el distrito de Moncloa-Aravaca, cerca de la Ciudad Universitaria.'),
(55, 'Ventura Rodríguez', TRUE, 'Calle de Ventura Rodríguez, 7', 'Estación que conecta con la línea 2 y está cerca del Templo de Debod.'),
(56, 'Plaza de España', TRUE, 'Plaza de España, s/n', 'Importante intersección con la línea 10 y acceso a la Gran Vía.'),
(57, 'Callao', TRUE, 'Gran Vía, 45', 'Situada en el corazón de la Gran Vía, centro comercial y cultural.'),
(59, 'Lavapiés', TRUE, 'Calle de Lavapiés, 34', 'Estación en un barrio multicultural, con numerosos bares y teatros.'),
(60, 'Embajadores', TRUE, 'Avenida de los Poblados, 23', 'Conexión con la línea 5 y acceso a la estación de Cercanías.'),
(61, 'Palos de la Frontera', TRUE, 'Calle de Palos de la Frontera, 34', 'Anteriormente conocida como Palos de Moguer, conecta con la línea 10.'),
(62, 'Delicias', TRUE, 'Paseo de las Delicias, 61', 'Cerca del Museo del Ferrocarril y estación de Cercanías.'),
(63, 'Legazpi', TRUE, 'Calle de Méndez Álvaro, 83', 'Zona industrial y de ocio, conecta con la línea 6.'),
(64, 'Almendrales', TRUE, 'Avenida de Córdoba, 21', 'Estación en el barrio de Usera, con cuatro vías para mayor capacidad.'),
(65, 'Hospital 12 de Octubre', TRUE, 'Avenida de Córdoba, 61', 'Servicio directo al Hospital 12 de Octubre.'),
(66, 'San Fermín-Orcasur', TRUE, 'Calle de San Fermín, 1', 'Acceso al barrio de Orcasur.'),
(67, 'Ciudad de los Ángeles', TRUE, 'Calle de la Ciudad de los Ángeles, 2', 'Ubicada en el distrito de Villaverde.'),
(68, 'Villaverde Bajo-Cruce', TRUE, 'Calle de Villaverde, 1', 'Conexión con la línea 5 y cercanías.'),
(69, 'San Cristóbal', TRUE, 'Calle de San Cristóbal, 3', 'Acceso al barrio de San Cristóbal.'),
(70, 'Villaverde Alto', TRUE, 'Calle de Villaverde, 4', 'Estación terminal en el sur de Madrid, con conexión a cercanías.'),
(71, 'El Casar', TRUE, 'Calle del Casar, 1', 'Ampliación reciente que conecta con Getafe.');  -- Inaugurada en marzo de 2025

-- Inserción de estaciones de la Línea 4
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(72, 'Alonso Martínez', 1, 'Plaza de Alonso Martínez, s/n', 'Ubicada en el barrio de Justicia, conecta con líneas 4, 5 y 10.'),
(73, 'Colón', 1, 'Calle de Génova, s/n', 'Situada bajo la plaza de Colón.'),
(74, 'Serrano', 1, 'Calle de Serrano, s/n', 'Ubicada en el barrio de Salamanca.'),
(75, 'Velázquez', 1, 'Calle de Velázquez, s/n', 'Situada en el distrito de Salamanca.'),
(76, 'Lista', 1, 'Calle de José Ortega y Gasset, s/n', 'Ubicada en el barrio de Lista.'),
(77, 'Diego de León', 1, 'Calle de Diego de León, s/n', 'Importante estación de intercambio.'),
(78, 'Avenida de América', 1, 'Avenida de América, 9', 'Intercambiador con varias líneas de metro y autobuses.'),
(79, 'Prosperidad', 1, 'Calle de López de Hoyos, s/n', 'Estación ubicada en el distrito de Chamartín.'),
(80, 'Alfonso XIII', 1, 'Calle de López de Hoyos, s/n', 'Estación situada en Chamartín.'),
(81, 'Avenida de la Paz', 1, 'Calle López de Hoyos, s/n', 'Ubicada junto a la M-30.'),
(82, 'Arturo Soria', 1, 'Calle de Arturo Soria, s/n', 'Situada en el distrito de Ciudad Lineal.'),
(83, 'Esperanza', 1, 'Calle de Andrés Obispo, s/n', 'Estación del barrio de Hortaleza.'),
(84, 'Canillas', 1, 'Calle de Silvano, s/n', 'Ubicada en el barrio de Hortaleza.'),
(85, 'Mar de Cristal', 1, 'Glorieta de Mar de Cristal, s/n', 'Conecta con Línea 8.'),
(86, 'San Lorenzo', 1, 'Calle de Santa Virgilia, s/n', 'Estación en el barrio de Hortaleza.'),
(87, 'Parque de Santa María', 1, 'Calle de Santa Virgilia, s/n', 'Ubicada junto al parque homónimo.'),
(88, 'Hortaleza', 1, 'Calle de Santa Susana, s/n', 'Estación en el distrito de Hortaleza.'),
(89, 'Manoteras', 1, 'Calle de Bacares, s/n', 'Situada en el barrio de Hortaleza.');

-- Inserción de estaciones de la Línea 5
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(90, 'Alameda de Osuna', TRUE, 'Calle de la Ribera del Sena, s/n', 'Estación terminal noreste de la Línea 5, situada en el distrito de Barajas.'),
(91, 'El Capricho', TRUE, 'Calle de la Ribera del Sena, s/n', 'Estación próxima al Parque de El Capricho.'),
(92, 'Canillejas', TRUE, 'Calle de Alcalá, s/n', 'Conecta con intercambiador de autobuses interurbanos.'),
(93, 'Torre Arias', TRUE, 'Calle de Alcalá, s/n', 'Ubicada junto al parque y palacio de Torre Arias.'),
(94, 'Suanzes', TRUE, 'Calle de Alcalá, s/n', 'Nombrada en honor al ingeniero Juan de Suanzes.'),
(95, 'Ciudad Lineal', TRUE, 'Calle de Alcalá, s/n', 'Estación en el distrito de Ciudad Lineal.'),
(96, 'Pueblo Nuevo', TRUE, 'Calle de Alcalá, s/n', 'Intercambio con Línea 7.'),
(97, 'Quintana', TRUE, 'Calle de Alcalá, s/n', 'Cerca de la plaza de Quintana.'),
(98, 'El Carmen', TRUE, 'Calle de Alcalá, s/n', 'Situada cerca de la plaza de toros de Las Ventas.'),
(99, 'Núñez de Balboa', TRUE, 'Calle de Núñez de Balboa, s/n', 'Conexión con línea 9.'),
(100, 'Rubén Darío', TRUE, 'Paseo de Eduardo Dato, s/n', 'Cerca del Museo Sorolla.'),
(101, 'Chueca', TRUE, 'Plaza de Chueca, s/n', 'Ubicada en el centro del barrio con el mismo nombre.'),
(102, 'La Latina', TRUE, 'Plaza de la Cebada, s/n', 'En pleno centro histórico de Madrid.'),
(103, 'Puerta de Toledo', TRUE, 'Glorieta de la Puerta de Toledo, s/n', 'Cerca del monumento Puerta de Toledo.'),
(104, 'Pirámides', TRUE, 'Paseo de la Virgen del Puerto, s/n', 'Conexión con Cercanías y acceso al estadio Vicente Calderón.'),
(105, 'Marqués de Vadillo', TRUE, 'Plaza de Marqués de Vadillo, s/n', 'Cerca del Puente de Toledo y Madrid Río.'),
(106, 'Urgel', TRUE, 'Calle General Ricardos, s/n', 'Ubicada en el distrito de Carabanchel.'),
(107, 'Oporto', TRUE, 'Plaza de Oporto, s/n', 'Intercambio con Línea 6.'),
(108, 'Vista Alegre', TRUE, 'Calle General Ricardos, s/n', 'Próxima al Palacio de Vistalegre.'),
(109, 'Carabanchel', TRUE, 'Calle General Ricardos, s/n', 'Una de las estaciones históricas del distrito.'),
(110, 'Eugenia de Montijo', TRUE, 'Avenida de Eugenia de Montijo, s/n', 'Sirve al barrio del mismo nombre.'),
(111, 'Aluche', TRUE, 'Avenida de los Poblados, s/n', 'Intercambio con Cercanías Renfe y numerosas líneas de autobús.'),
(112, 'Empalme', TRUE, 'Calle de Illescas, s/n', 'Estación en el barrio de Aluche.'),
(113, 'Campamento', TRUE, 'Paseo de Extremadura, s/n', 'Cerca del antiguo cuartel militar.'),
(114, 'Casa de Campo', TRUE, 'Paseo de la Puerta del Ángel, s/n', 'Intercambio con la Línea 10, próxima al parque de atracciones y zoológico.');

-- Inserción de estaciones de la Línea 6
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(115, 'Laguna', TRUE, 'Calle Cuart de Poblet', 'Conexión con Cercanías RENFE'),
(116, 'Carpetana', TRUE, 'Vía Carpetana', 'Cerca del museo de los Orígenes'),
(117, 'Opañel', TRUE, 'Calle de Ocaña', 'Ubicada en el distrito de Carabanchel'),
(118, 'Plaza Elíptica', TRUE, 'Plaza Elíptica', 'Intercambiador con Línea 6 y autobuses interurbanos'),
(119, 'Usera', TRUE, 'Calle de Amparo Usera', 'Zona multicultural del distrito Usera'),
(120, 'Arganzuela-Planetario', TRUE, 'Calle Bronce, 1', 'Arganzuela-Planetario es una estación de la línea 6 del Metro de Madrid situada bajo el barrio de los Metales, dentro del distrito madrileño de Arganzuela. La estación abrió al público el 26 de enero de 2007.​'),
(121, 'Méndez Álvaro', TRUE, 'Calle de Méndez Álvaro', 'Conexión con Cercanías RENFE y Estación Sur de Autobuses'),
(122, 'Conde de Casal', TRUE, 'Plaza del Conde de Casal', 'Acceso futuro a ampliación Línea 11'),
(123, 'Sainz de Baranda', TRUE, 'Calle de Sainz de Baranda', 'Conexión con Línea 9'),
(124, 'O Donnell', TRUE, 'Calle de O Donnell', 'Cerca del Hospital Gregorio Marañón'),
(125, 'República Argentina', FALSE, 'Plaza de República Argentina', 'Zona de embajadas y oficinas'),
(126, 'Nuevos Ministerios', TRUE, 'Paseo de la Castellana', 'Conexión con Líneas 8 y 10 y Cercanías RENFE'),
(127, 'Guzmán el Bueno', TRUE, 'Av. de la Reina Victoria', 'Conexión con Línea 7'),
(128, 'Vicente Aleixandre', FALSE, 'Calle Gregorio del Amo, 8', 'Vicente Aleixandre​​ es una estación de la línea 6 del Metro de Madrid situada bajo la Avenida de Gregorio del Amo, en el distrito de Moncloa-Aravaca, si bien uno de sus accesos está en el distrito de Chamberí.'),
(129, 'Ciudad Universitaria', TRUE, 'Avenida Complutense', 'Ubicada en el campus universitario'),
(130, 'Príncipe Pío', TRUE, 'Paseo de la Florida', 'Conexión con Líneas 6 y 10, y Cercanías RENFE. El Ramal Ópera-Príncipe Pío del Metro de Madrid es una línea corta que une dichas estaciones, con andenes de 60 m, situadas en el distrito Centro de la ciudad a través de un túnel de 1092 m de vía doble y gálibo estrecho'),
(131, 'Puerta del Ángel', TRUE, 'Paseo de Extremadura', 'Acceso a zona sur de Madrid Río'),
(132, 'Alto de Extremadura', TRUE, 'Paseo de Extremadura', 'Estación residencial en Latina'),
(133, 'Lucero', TRUE, 'Calle de Latón', 'Zona residencial cercana a Casa de Campo');

TRUNCATE TABLE `estaciones_lineas`;

-- Asignación de estaciones a la Línea 1
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(1, 1, 1),   -- Pinar de Chamartín
(2, 1, 2),   -- Bambú
(3, 1, 3),   -- Chamartín
(4, 1, 4),   -- Plaza de Castilla
(5, 1, 5),   -- Valdeacederas
(6, 1, 6),   -- Tetuán
(7, 1, 7),   -- Estrecho
(8, 1, 8),   -- Alvarado
(9, 1, 9),   -- Cuatro Caminos
(10, 1, 10), -- Ríos Rosas
(11, 1, 11), -- Iglesia
(12, 1, 12), -- Chamberí
(13, 1, 13), -- Bilbao
(14, 1, 14), -- Tribunal
(15, 1, 15), -- Gran Vía
(16, 1, 16), -- Sol
(17, 1, 17), -- Tirso de Molina
(18, 1, 18), -- Antón Martín
(19, 1, 19), -- Estación del Arte
(20, 1, 20), -- Atocha
(21, 1, 21), -- Menéndez Pelayo
(22, 1, 22), -- Pacífico
(23, 1, 23), -- Puente de Vallecas
(24, 1, 24), -- Nueva Numancia
(25, 1, 25), -- Portazgo
(26, 1, 26), -- Buenos Aires
(27, 1, 27), -- Alto del Arenal
(28, 1, 28), -- Miguel Hernández
(29, 1, 29), -- Sierra de Guadalupe
(30, 1, 30), -- Villa de Vallecas
(31, 1, 31), -- Congosto
(32, 1, 32), -- La Gavia
(33, 1, 33), -- Las Suertes
(34, 1, 34); -- Valdecarros

-- Asignación a Línea 2 (ID línea = 2)
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(52, 2, 1),   -- Las Rosas
(51, 2, 2),   -- Avenida de Guadalajara
(50, 2, 3),   -- Alsacia
(49, 2, 4),   -- La Almudena
(48, 2, 5),   -- La Elipa
(47, 2, 6),   -- Ventas
(46, 2, 7),   -- Manuel Becerra
(45, 2, 8),   -- Goya
(44, 2, 9),   -- Príncipe de Vergara
(43, 2, 10),  -- Retiro
(42, 2, 11),  -- Banco de España
(41, 2, 12),  -- Sevilla
(16, 2, 13),  -- Sol (ya insertada previamente)
(40, 2, 14),  -- Ópera
(39, 2, 15),  -- Santo Domingo
(38, 2, 16),  -- Noviciado
(37, 2, 17),  -- San Bernardo
(36, 2, 18),  -- Quevedo
(35, 2, 19),  -- Canal
(9, 2, 20);   -- Cuatro Caminos (ya insertada previamente)

-- Asignación a Línea 3 (ID línea = 3)
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(53, 3, 1),   -- Moncloa
(54, 3, 2),   -- Argüelles
(55, 3, 3),   -- Ventura Rodríguez
(56, 3, 4),   -- Plaza de España
(57, 3, 5),   -- Callao
(16, 3, 6),   -- Sol
(59, 3, 7),   -- Lavapiés
(60, 3, 8),   -- Embajadores
(61, 3, 9),   -- Palos de la Frontera
(62, 3, 10),  -- Delicias
(63, 3, 11),  -- Legazpi
(64, 3, 12),  -- Almendrales
(65, 3, 13),  -- Hospital 12 de Octubre
(66, 3, 14),  -- San Fermín-Orcasur
(67, 3, 15),  -- Ciudad de los Ángeles
(68, 3, 16),  -- Villaverde Bajo-Cruce
(69, 3, 17),  -- San Cristóbal
(70, 3, 18),  -- Villaverde Alto
(71, 3, 19);  -- El Casar (reciente)

-- Asignación a Línea 4 (ID línea = 4)
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(54, 4, 1),   -- Argüelles
(37, 4, 2),   -- San Bernardo
(13, 4, 3),   -- Bilbao
(72, 4, 4),   -- Alonso Martínez
(73, 4, 5),   -- Colón
(74, 4, 6),   -- Serrano
(75, 4, 7),   -- Velázquez
(45, 4, 8),   -- Goya
(76, 4, 9),   -- Lista
(77, 4, 10),  -- Diego de León
(78, 4, 11),  -- Avenida de América
(79, 4, 12),  -- Prosperidad
(80, 4, 13),  -- Alfonso XIII
(81, 4, 14),  -- Avenida de la Paz
(82, 4, 15),  -- Arturo Soria
(83, 4, 16),  -- Esperanza
(84, 4, 17),  -- Canillas
(85, 4, 18),  -- Mar de Cristal
(86, 4, 19),  -- San Lorenzo
(87, 4, 20),  -- Parque de Santa María
(88, 4, 21),  -- Hortaleza
(89, 4, 22),  -- Manoteras
(1, 4, 23);   -- Pinar de Chamartín

-- Inserción de estaciones para la Línea 5 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(5, 90, 1),   -- Alameda de Osuna
(5, 91, 2),   -- El Capricho
(5, 92, 3),   -- Canillejas
(5, 93, 4),   -- Torre Arias
(5, 94, 5),   -- Suanzes
(5, 95, 6),   -- Ciudad Lineal
(5, 96, 7),   -- Pueblo Nuevo
(5, 97, 8),   -- Quintana
(5, 98, 9),   -- El Carmen
(5, 47, 10),  -- Ventas (ya insertada con id 47 en Línea 2)
(5, 46, 11),  -- Manuel Becerra (id 46 en Línea 2)
(5, 45, 12),  -- Goya (id 45 en Línea 2)
(5, 99, 13),  -- Rubén Darío
(5, 100, 14), -- Chueca
(5, 15, 15),  -- Gran Vía (id 15 en Línea 1)
(5, 101, 16), -- La Latina
(5, 102, 17), -- Puerta de Toledo
(5, 60, 18),  -- Embajadores (id 60 en Línea 3)
(5, 103, 19), -- Pirámides
(5, 104, 20), -- Marqués de Vadillo
(5, 105, 21), -- Urgel
(5, 106, 22), -- Oporto
(5, 107, 23), -- Vista Alegre
(5, 108, 24), -- Carabanchel
(5, 109, 25), -- Eugenia de Montijo
(5, 110, 26), -- Aluche
(5, 111, 27), -- Empalme
(5, 112, 28), -- Campamento
(5, 113, 29); -- Casa de Campo

-- Inserción de estaciones para la Línea 6 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(113, 6, 1),
(114, 6, 2),
(105, 6, 3),
(115, 6, 4),
(116, 6, 5),
(117, 6, 6),
(59, 6, 7),
(118, 6, 8),
(119, 6, 9),
(21, 6, 10),
(120, 6, 11),
(121, 6, 12),
(122, 6, 13),
(40, 6, 14),
(74, 6, 15),
(75, 6, 16),
(123, 6, 17),
(124, 6, 18),
(9, 6, 19),
(125, 6, 20),
(126, 6, 21),
(127, 6, 22),
(128, 6, 23),
(129, 6, 24),
(130, 6, 25),
(131, 6, 26);


TRUNCATE TABLE `transbordos`;

-- Transbordos para estaciones de la Línea 1
INSERT INTO `transbordos` (`id`, `id_estacion`, `lineas_trasbordos`) VALUES
('1', '1', '4,14'),         -- Pinar de Chamartín
('2', '3', '10'),           -- Chamartín (solo metro)
('3', '4', '9,10'),         -- Plaza de Castilla
('4', '9', '2,6'),          -- Cuatro Caminos
('5', '13', '4'),           -- Bilbao
('6', '14', '10'),          -- Tribunal
('7', '15', '5'),           -- Gran Vía
('8', '16', '2,3'),         -- Sol
('9', '22', '6');           -- Pacífico

-- Transbordos para estaciones de la Línea 2
INSERT INTO `transbordos` (`id`, `id_estacion`, `lineas_trasbordos`) VALUES
('10', '2', '1,6'),          -- Cuatro Caminos (ya insertada previamente)
('11', '35', '7'),           -- Canal
('12', '37', '4'),           -- San Bernardo
('13', '40', '5,13'),         -- Ópera (Ramal incluido como 'R')
('14', '16', '1,3'),         -- Sol (transbordo con Línea 1 y 3)
('15', '44', '9'),           -- Príncipe de Vergara
('16', '45', '4'),           -- Goya
('17', '46', '6'),           -- Manuel Becerra
('18', '47', '5');           -- Ventas

-- Transbordos para estaciones de la Línea 3
INSERT INTO `transbordos` (`id`, `id_estacion`, `lineas_trasbordos`) VALUES
('19', '35', '6'),            -- Moncloa (transbordo con Línea 6)
('20', '36', '4'),            -- Argüelles (transbordo con Línea 4)
('21', '38', '10'),           -- Plaza de España (transbordo con Línea 10)
('22', '39', '5'),            -- Callao (transbordo con Línea 5)
('23', '16', '1,2'),          -- Sol (transbordo con Línea 1 y 2)
('24', '42', '5'),            -- Embajadores (transbordo con Línea 5)
('25', '45', '6'),            -- Legazpi (transbordo con Línea 6)
('26', '53', '6');            -- El Casar (transbordo con Línea 6)

-- Transbordos para estaciones de la Línea 4
INSERT INTO `transbordos` (`id`, `id_estacion`, `lineas_trasbordos`) VALUES
('27', '54', '3,4,6'),     -- Argüelles
('28', '37', '2,4'),       -- San Bernardo
('29', '13', '1,4'),       -- Bilbao
('30', '72', '4,5,10'),    -- Alonso Martínez
('31', '45', '2,4'),       -- Goya
('32', '77', '4,5,6'),     -- Diego de León
('33', '78', '4,6,7,9'),   -- Avenida de América
('34', '85', '4,8'),       -- Mar de Cristal
('35', '1', '1,4,14');    -- Pinar de Chamartín

-- Transbordos para estaciones de la Línea 5
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('36', '96', '7'),         -- Pueblo Nuevo (transbordo con L7)
('37', '47', '2'),         -- Ventas (transbordo con L2)
('38', '77', '4,6'),       -- Diego de León (transbordo con L4 y L6)
('39', '99', '9'),         -- Núñez de Balboa (transbordo con L9)
('40', '15', '1'),         -- Gran Vía (transbordo con L1)
('41', '57', '3'),         -- Callao (transbordo con L3)
('42', '40', '2,13'),       -- Ópera (transbordo con L2 y Ramal)
('43', '60', '3'),         -- Embajadores (transbordo con L3)
('44', '106', '6'),       -- Oporto (transbordo con L6)
('45', '114', '10');       -- Casa de Campo (transbordo con L10)

-- Transbordos para estaciones de la Línea 6
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('47', '105', '5'),          -- Oporto (transbordo con L10)
('48', '116', '11'),         -- Plaza Elíptica (transbordo con L11)
('49', '59', '3'),           -- Legazpi
('50', '21', '1'),           -- Pacífico
('51', '121', '9'),          -- Sainz de Baranda
('52', '40', '2'),           -- Manuel Becerra
('53', '74', '4,5'),         -- Diego de León (transbordo con L4 y L5))
('54', '75', '4,7,9'),       -- Avenida de América
('55', '124', '8,10'),       -- Nuevos Ministerios
('56', '9', '1,2'),          -- Cuatro Caminos
('57', '125', '7'),          -- Guzmán El Bueno (transbordo con L7)
('55', '68', '3'),           -- Moncloa
('56', '67', '3,4'),         -- Argüelles
('57', '128', '10,13');       -- Principe Pio (transbordo con L10 y Ramal)

INSERT INTO lineas (id, nombre) VALUES 
(1, 'Línea 1', 'L1'),
(2, 'Línea 2', 'L2'),
(3, 'Línea 3', 'L3'),
(4, 'Línea 4', 'L4'),
(5, 'Línea 5', 'L5'),
(6, 'Línea 6', 'L6'),
(7, 'Línea 7', 'L7'),
(8, 'Línea 8', 'L8'),
(9, 'Línea 9', 'L9'),
(10, 'Línea 10', 'L10'),
(11, 'Línea 11', 'L11'),
(12, 'Línea 12', 'L12'),
(13, 'Ramal', 'R'),
(14, 'Metro Ligero 1', 'ML1'),
(15, 'Metro Ligero 2', 'ML2'),
(16, 'Metro Ligero 3', 'ML3');