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
(12, 'Bilbao', TRUE, 'Glorieta de Bilbao, s/n', 'Conexión con línea 4.'),
(13, 'Tribunal', FALSE, 'Calle Fuencarral, 81', 'Conexión con línea 10.'),
(14, 'Gran Vía', FALSE, 'Calle Gran Vía, 27', 'Conexión con línea 5.'),
(15, 'Sol', TRUE, 'Puerta del Sol, s/n', 'Conexión con líneas 2 y 3.'),
(16, 'Tirso de Molina', FALSE, 'Plaza de Tirso de Molina, s/n', 'Situada en el barrio de Embajadores.'),
(17, 'Antón Martín', FALSE, 'Plaza de Antón Martín, s/n', 'Ubicada en el centro de Madrid.'),
(18, 'Estación del Arte', FALSE, 'Paseo del Prado, s/n', 'Cercana a museos y Atocha.'),
(19, 'Atocha', TRUE, 'Glorieta del Emperador Carlos V, s/n', 'Estación de conexión futura con línea 11.'),
(20, 'Menéndez Pelayo', FALSE, 'Avenida de Menéndez Pelayo, 67', 'Ubicada junto al parque del Retiro.'),
(21, 'Pacífico', TRUE, 'Calle de Cavanilles, 5', 'Conexión con línea 6.'),
(22, 'Puente de Vallecas', FALSE, 'Avenida de la Albufera, 145', 'Estación del distrito de Vallecas.'),
(23, 'Nueva Numancia', FALSE, 'Avenida de la Albufera, 125', 'Zona de Puente de Vallecas.'),
(24, 'Portazgo', FALSE, 'Avenida de la Albufera, 99', 'Junto al estadio del Rayo Vallecano.'),
(25, 'Buenos Aires', FALSE, 'Avenida de la Albufera, 67', 'Ubicada en el barrio de Numancia.'),
(26, 'Alto del Arenal', TRUE, 'Avenida de la Albufera, 45', 'Cerca del centro comercial Albufera Plaza.'),
(27, 'Miguel Hernández', FALSE, 'Avenida de la Albufera, 25', 'Barrio de Entrevías.'),
(28, 'Sierra de Guadalupe', FALSE, 'Calle Sierra de Guadalupe, s/n', 'Conexión con Cercanías Renfe.'),
(29, 'Villa de Vallecas', FALSE, 'Paseo de Federico García Lorca, 2', 'Distrito de Villa de Vallecas.'),
(30, 'Congosto', FALSE, 'Calle Congosto, 1', 'Zona sur de Vallecas.'),
(31, 'La Gavia', TRUE, 'Avenida del Ensanche de Vallecas, s/n', 'Cerca del centro comercial La Gavia.'),
(32, 'Las Suertes', TRUE, 'Avenida del Ensanche de Vallecas, s/n', 'Ubicada en el Ensanche de Vallecas.'),
(33, 'Valdecarros', TRUE, 'Avenida del Ensanche de Vallecas, s/n', 'Estación terminal de la línea 1 al sureste.');

-- Nuevas estaciones Línea 2 (excluyendo Sol y Cuatro Caminos ya insertadas)
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(34, 'Canal', TRUE, 'Calle de Cea Bermúdez, 1', 'Conexión con línea 7.'),
(35, 'Quevedo', FALSE, 'Glorieta de Quevedo, s/n', 'Ubicada en el distrito de Chamberí.'),
(36, 'San Bernardo', TRUE, 'Calle de San Bernardo, 107', 'Conexión con línea 4.'),
(37, 'Noviciado', FALSE, 'Calle de San Bernardo, 63', 'Estación en el barrio de Universidad.'),
(38, 'Santo Domingo', FALSE, 'Plaza de Santo Domingo, s/n', 'Ubicada en el distrito Centro.'),
(39, 'Ópera', TRUE, 'Plaza de Isabel II, s/n', 'Conexión con líneas 5 y Ramal.'),
(40, 'Sevilla', FALSE, 'Calle de Alcalá, 13', 'Ubicada en pleno centro, próxima al Círculo de Bellas Artes.'),
(41, 'Banco de España', TRUE, 'Plaza de Cibeles, s/n', 'Frente al Banco de España y próximo a museos.'),
(42, 'Retiro', TRUE, 'Calle de Alcalá, 83', 'Junto a la entrada del Parque del Retiro.'),
(43, 'Príncipe de Vergara', TRUE, 'Calle Príncipe de Vergara, 5', 'Conexión con línea 9, en el barrio de Salamanca.'),
(44, 'Goya', TRUE, 'Calle de Goya, 1', 'Conexión con línea 4, junto al Palacio de los Deportes.'),
(45, 'Manuel Becerra', TRUE, 'Plaza de Manuel Becerra, s/n', 'Conexión con línea 6, en el distrito de Salamanca.'),
(46, 'Ventas', TRUE, 'Calle de Alcalá, 237', 'Conexión con línea 5 y cerca de la Plaza de Toros.'),
(47, 'La Elipa', TRUE, 'Calle Santa Felicidad, 1', 'Ubicada en el barrio de Ventas.'),
(48, 'La Almudena', TRUE, 'Calle de los Hermanos García Noblejas, 115', 'Estación cercana al cementerio de La Almudena.'),
(49, 'Alsacia', TRUE, 'Avenida de Guadalajara, 26', 'Ubicada en el barrio de San Blas-Canillejas.'),
(50, 'Avenida de Guadalajara', TRUE, 'Avenida de Guadalajara, s/n', 'Estación en expansión urbana al este de Madrid.'),
(51, 'Las Rosas', TRUE, 'Avenida de Niza, s/n', 'Estación terminal de la Línea 2, en el barrio del mismo nombre.');

-- Inserción de estaciones de la Línea 3
(52, 'Moncloa', TRUE, 'Plaza de Moncloa, s/n', 'Estación terminal en el noroeste de Madrid, con conexiones con las líneas 6 y 10.'),
(53, 'Argüelles', TRUE, 'Calle de Arguelles, 76', 'Ubicada en el distrito de Moncloa-Aravaca, cerca de la Ciudad Universitaria.'),
(54, 'Ventura Rodríguez', TRUE, 'Calle de Ventura Rodríguez, 7', 'Estación que conecta con la línea 2 y está cerca del Templo de Debod.'),
(55, 'Plaza de España', TRUE, 'Plaza de España, s/n', 'Importante intersección con la línea 10 y acceso a la Gran Vía.'),
(56, 'Callao', TRUE, 'Gran Vía, 45', 'Situada en el corazón de la Gran Vía, centro comercial y cultural.'),
(58, 'Lavapiés', TRUE, 'Calle de Lavapiés, 34', 'Estación en un barrio multicultural, con numerosos bares y teatros.'),
(59, 'Embajadores', TRUE, 'Avenida de los Poblados, 23', 'Conexión con la línea 5 y acceso a la estación de Cercanías.'),
(60, 'Palos de la Frontera', TRUE, 'Calle de Palos de la Frontera, 34', 'Anteriormente conocida como Palos de Moguer, conecta con la línea 10.'),
(61, 'Delicias', TRUE, 'Paseo de las Delicias, 61', 'Cerca del Museo del Ferrocarril y estación de Cercanías.'),
(62, 'Legazpi', TRUE, 'Calle de Méndez Álvaro, 83', 'Zona industrial y de ocio, conecta con la línea 6.'),
(63, 'Almendrales', TRUE, 'Avenida de Córdoba, 21', 'Estación en el barrio de Usera, con cuatro vías para mayor capacidad.'),
(64, 'Hospital 12 de Octubre', TRUE, 'Avenida de Córdoba, 61', 'Servicio directo al Hospital 12 de Octubre.'),
(65, 'San Fermín-Orcasur', TRUE, 'Calle de San Fermín, 1', 'Acceso al barrio de Orcasur.'),
(66, 'Ciudad de los Ángeles', TRUE, 'Calle de la Ciudad de los Ángeles, 2', 'Ubicada en el distrito de Villaverde.'),
(67, 'Villaverde Bajo-Cruce', TRUE, 'Calle de Villaverde, 1', 'Conexión con la línea 5 y cercanías.'),
(68, 'San Cristóbal', TRUE, 'Calle de San Cristóbal, 3', 'Acceso al barrio de San Cristóbal.'),
(69, 'Villaverde Alto', TRUE, 'Calle de Villaverde, 4', 'Estación terminal en el sur de Madrid, con conexión a cercanías.'),
(70, 'El Casar', TRUE, 'Calle del Casar, 1', 'Ampliación reciente que conecta con Getafe.');

-- Inserción de estaciones de la Línea 4
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(71, 'Alonso Martínez', 1, 'Plaza de Alonso Martínez, s/n', 'Ubicada en el barrio de Justicia, conecta con líneas 4, 5 y 10.'),
(72, 'Colón', 1, 'Calle de Génova, s/n', 'Situada bajo la plaza de Colón.'),
(73, 'Serrano', 1, 'Calle de Serrano, s/n', 'Ubicada en el barrio de Salamanca.'),
(74, 'Velázquez', 1, 'Calle de Velázquez, s/n', 'Situada en el distrito de Salamanca.'),
(75, 'Lista', 1, 'Calle de José Ortega y Gasset, s/n', 'Ubicada en el barrio de Lista.'),
(76, 'Diego de León', 1, 'Calle de Diego de León, s/n', 'Importante estación de intercambio.'),
(77, 'Avenida de América', 1, 'Avenida de América, 9', 'Intercambiador con varias líneas de metro y autobuses.'),
(78, 'Prosperidad', 1, 'Calle de López de Hoyos, s/n', 'Estación ubicada en el distrito de Chamartín.'),
(79, 'Alfonso XIII', 1, 'Calle de López de Hoyos, s/n', 'Estación situada en Chamartín.'),
(80, 'Avenida de la Paz', 1, 'Calle López de Hoyos, s/n', 'Ubicada junto a la M-30.'),
(81, 'Arturo Soria', 1, 'Calle de Arturo Soria, s/n', 'Situada en el distrito de Ciudad Lineal.'),
(82, 'Esperanza', 1, 'Calle de Andrés Obispo, s/n', 'Estación del barrio de Hortaleza.'),
(83, 'Canillas', 1, 'Calle de Silvano, s/n', 'Ubicada en el barrio de Hortaleza.'),
(84, 'Mar de Cristal', 1, 'Glorieta de Mar de Cristal, s/n', 'Conecta con Línea 8.'),
(85, 'San Lorenzo', 1, 'Calle de Santa Virgilia, s/n', 'Estación en el barrio de Hortaleza.'),
(86, 'Parque de Santa María', 1, 'Calle de Santa Virgilia, s/n', 'Ubicada junto al parque homónimo.'),
(87, 'Hortaleza', 1, 'Calle de Santa Susana, s/n', 'Estación en el distrito de Hortaleza.'),
(88, 'Manoteras', 1, 'Calle de Bacares, s/n', 'Situada en el barrio de Hortaleza.');

-- Inserción de estaciones de la Línea 5
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(89, 'Alameda de Osuna', TRUE, 'Calle de la Ribera del Sena, s/n', 'Estación terminal noreste de la Línea 5, situada en el distrito de Barajas.'),
(90, 'El Capricho', TRUE, 'Calle de la Ribera del Sena, s/n', 'Estación próxima al Parque de El Capricho.'),
(91, 'Canillejas', TRUE, 'Calle de Alcalá, s/n', 'Conecta con intercambiador de autobuses interurbanos.'),
(92, 'Torre Arias', TRUE, 'Calle de Alcalá, s/n', 'Ubicada junto al parque y palacio de Torre Arias.'),
(93, 'Suanzes', TRUE, 'Calle de Alcalá, s/n', 'Nombrada en honor al ingeniero Juan de Suanzes.'),
(94, 'Ciudad Lineal', TRUE, 'Calle de Alcalá, s/n', 'Estación en el distrito de Ciudad Lineal.'),
(95, 'Pueblo Nuevo', TRUE, 'Calle de Alcalá, s/n', 'Intercambio con Línea 7.'),
(96, 'Quintana', TRUE, 'Calle de Alcalá, s/n', 'Cerca de la plaza de Quintana.'),
(97, 'El Carmen', TRUE, 'Calle de Alcalá, s/n', 'Situada cerca de la plaza de toros de Las Ventas.'),
(98, 'Núñez de Balboa', TRUE, 'Calle de Núñez de Balboa, s/n', 'Conexión con línea 9.'),
(99, 'Rubén Darío', TRUE, 'Paseo de Eduardo Dato, s/n', 'Cerca del Museo Sorolla.'),
(100, 'Chueca', TRUE, 'Plaza de Chueca, s/n', 'Ubicada en el centro del barrio con el mismo nombre.'),
(101, 'La Latina', TRUE, 'Plaza de la Cebada, s/n', 'En pleno centro histórico de Madrid.'),
(102, 'Puerta de Toledo', TRUE, 'Glorieta de la Puerta de Toledo, s/n', 'Cerca del monumento Puerta de Toledo.'),
(103, 'Pirámides', TRUE, 'Paseo de la Virgen del Puerto, s/n', 'Conexión con Cercanías y acceso al estadio Vicente Calderón.'),
(104, 'Marqués de Vadillo', TRUE, 'Plaza de Marqués de Vadillo, s/n', 'Cerca del Puente de Toledo y Madrid Río.'),
(105, 'Urgel', TRUE, 'Calle General Ricardos, s/n', 'Ubicada en el distrito de Carabanchel.'),
(106, 'Oporto', TRUE, 'Plaza de Oporto, s/n', 'Intercambio con Línea 6.'),
(107, 'Vista Alegre', TRUE, 'Calle General Ricardos, s/n', 'Próxima al Palacio de Vistalegre.'),
(108, 'Carabanchel', TRUE, 'Calle General Ricardos, s/n', 'Una de las estaciones históricas del distrito.'),
(109, 'Eugenia de Montijo', TRUE, 'Avenida de Eugenia de Montijo, s/n', 'Sirve al barrio del mismo nombre.'),
(110, 'Aluche', TRUE, 'Avenida de los Poblados, s/n', 'Intercambio con Cercanías Renfe y numerosas líneas de autobús.'),
(111, 'Empalme', TRUE, 'Calle de Illescas, s/n', 'Estación en el barrio de Aluche.'),
(112, 'Campamento', TRUE, 'Paseo de Extremadura, s/n', 'Cerca del antiguo cuartel militar.'),
(113, 'Casa de Campo', TRUE, 'Paseo de la Puerta del Ángel, s/n', 'Intercambio con la Línea 10, próxima al parque de atracciones y zoológico.');

-- Inserción de estaciones de la Línea 6
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(114, 'Laguna', TRUE, 'Calle Cuart de Poblet', 'Conexión con Cercanías RENFE'),
(115, 'Carpetana', TRUE, 'Vía Carpetana', 'Cerca del museo de los Orígenes'),
(116, 'Opañel', TRUE, 'Calle de Ocaña', 'Ubicada en el distrito de Carabanchel'),
(117, 'Plaza Elíptica', TRUE, 'Plaza Elíptica', 'Intercambiador con Línea 6 y autobuses interurbanos'),
(118, 'Usera', TRUE, 'Calle de Amparo Usera', 'Zona multicultural del distrito Usera'),
(119, 'Arganzuela-Planetario', TRUE, 'Calle Bronce, 1', 'Arganzuela-Planetario es una estación de la línea 6 del Metro de Madrid situada bajo el barrio de los Metales, dentro del distrito madrileño de Arganzuela. La estación abrió al público el 26 de enero de 2007.​'),
(120, 'Méndez Álvaro', TRUE, 'Calle de Méndez Álvaro', 'Conexión con Cercanías RENFE y Estación Sur de Autobuses'),
(121, 'Conde de Casal', TRUE, 'Plaza del Conde de Casal', 'Acceso futuro a ampliación Línea 11'),
(122, 'Sainz de Baranda', TRUE, 'Calle de Sainz de Baranda', 'Conexión con Línea 9'),
(123, 'O Donnell', TRUE, 'Calle de O Donnell', 'Cerca del Hospital Gregorio Marañón'),
(124, 'República Argentina', FALSE, 'Plaza de República Argentina', 'Zona de embajadas y oficinas'),
(125, 'Nuevos Ministerios', TRUE, 'Paseo de la Castellana', 'Conexión con Líneas 8 y 10 y Cercanías RENFE'),
(126, 'Guzmán el Bueno', TRUE, 'Av. de la Reina Victoria', 'Conexión con Línea 7'),
(127, 'Vicente Aleixandre', FALSE, 'Calle Gregorio del Amo, 8', 'Vicente Aleixandre​​ es una estación de la línea 6 del Metro de Madrid situada bajo la Avenida de Gregorio del Amo, en el distrito de Moncloa-Aravaca, si bien uno de sus accesos está en el distrito de Chamberí.'),
(128, 'Ciudad Universitaria', TRUE, 'Avenida Complutense', 'Ubicada en el campus universitario'),
(129, 'Príncipe Pío', TRUE, 'Paseo de la Florida', 'Conexión con Líneas 6 y 10, y Cercanías RENFE. El Ramal Ópera-Príncipe Pío del Metro de Madrid es una línea corta que une dichas estaciones, con andenes de 60 m, situadas en el distrito Centro de la ciudad a través de un túnel de 1092 m de vía doble y gálibo estrecho'),
(130, 'Puerta del Ángel', TRUE, 'Paseo de Extremadura', 'Acceso a zona sur de Madrid Río'),
(131, 'Alto de Extremadura', TRUE, 'Paseo de Extremadura', 'Estación residencial en Latina'),
(132, 'Lucero', TRUE, 'Calle de Latón', 'Zona residencial cercana a Casa de Campo');

-- Inserción de estaciones de la Línea 7
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(133, 'Hospital de Henares', TRUE, 'Camino Labor, s/n', 'Hospital del Henares es una estación de la línea 7 del Metro de Madrid situada junto al Hospital del Henares de Coslada.'),
(134, 'Henares', TRUE, 'Avenida Algorta, 12', 'Henares es una estación de la Línea 7 de Metro de Madrid situada bajo la avenida de Algorta, en San Fernando de Henares, próxima al cauce del río Henares.'),
(135, 'Jarama', TRUE, 'Plaza Guernica', 'Jarama es una estación de la línea 7 del Metro de Madrid situada bajo la Plaza de Guernica, junto al Parque Dolores Ibárruri de San Fernando de Henares. El nombre de la estación se debe a que en sus proximidades, aunque alejado, pasa el río Jarama.'),
(136, 'San Fernando', TRUE, 'Plaza Echebeste, 33', 'San Fernando es una estación de la línea 7 del Metro de Madrid situada bajo la Plaza de la Real Fábrica de Paños de San Fernando, en el casco histórico de San Fernando de Henares. Junto a la estación se encuentra el Ayuntamiento de San Fernando de Henares.'),
(137, 'La Rambla', TRUE, 'Calle Honduras', 'La Rambla es una estación de la Línea 7 del Metro de Madrid situada bajo la intersección de las calles Honduras y México, en el municipio de Coslada.'),
(138, 'Coslada Central', TRUE, 'Calle Doctor Fleming', 'Coslada Central es una estación de la línea 7 del Metro de Madrid, situada entre la calle de Pablo Neruda y el paseo de Francisco Javier Sauquillo, en el municipio madrileño de Coslada.'),
(139, 'Barrio del Puerto', TRUE, 'Avenida de España', 'Barrio del Puerto es una estación de la línea 7 del Metro de Madrid situada bajo la avenida de España en el barrio del mismo nombre del municipio de Coslada.'),
(140, 'Estadio Metropolitano', TRUE, 'Avenida de Arcentales', 'Acceso al estadio del Atlético de Madrid'),
(141, 'Las Musas', TRUE, 'Calle Estocolmo', 'Zona residencial de San Blas'),
(142, 'San Blas', TRUE, 'Calle Amposta', 'Centro del distrito San Blas-Canillejas'),
(143, 'Simancas', FALSE, 'Calle de Simancas', 'Zona residencial'),
(144, 'García Noblejas', FALSE, 'Calle de los Hermanos García Noblejas', 'Zona residencial'),
(145, 'Ascao', FALSE, 'Calle de Ascao', 'Zona residencial del barrio Pueblo Nuevo'),
(146, 'Barrio de la Concepción', TRUE, 'Plaza Virgen del Romero, 1', 'Barrio de la Concepción es una estación de la línea 7 del Metro de Madrid situada en el barrio de la Concepción, en el distrito de Ciudad Lineal.'),
(147, 'Parque de las Avenidas', FALSE, 'Avenida de Bruselas, 56', 'Parque de las Avenidas es una estación de la línea 7 del Metro de Madrid situada bajo la avenida de Bruselas, en el barrio de La Guindalera, perteneciente al madrileño distrito de Salamanca.'),
(148, 'Cartagena', FALSE, 'Avenida de América, 32', 'Cartagena es una estación de la Línea 7 del Metro de Madrid, situada entre los barrios de Prosperidad y La Guindalera bajo la intersección de la Avenida de América con la calle Cartagena.'),
(149, 'Gregorio Marañón', TRUE, 'Calle de José Abascal', 'Conexión con Línea 10'),
(150, 'Alonso Cano', FALSE, 'Calle de Alonso Cano', 'Barrio de Chamberí'),
(151, 'Islas Filipinas', FALSE, 'Calle de Islas Filipinas', 'Distrito de Chamberí'),
(152, 'Francos Rodríguez', FALSE, 'Calle de Francos Rodríguez', 'Zona residencial de Moncloa-Aravaca'),
(153, 'Valdezarza', FALSE, 'Calle de Ofelia Nieto', 'Distrito Moncloa-Aravaca'),
(154, 'Antonio Machado', FALSE, 'Calle de Antonio Machado', 'Zona residencial'),
(155, 'Peñagrande', FALSE, 'Calle de Joaquín Lorenzo', 'Zona residencial de Fuencarral-El Pardo'),
(156, 'Avenida de la Ilustración', TRUE, 'Av. de la Ilustración', 'Zona norte de Madrid junto a M-30'),
(157, 'Lacoma', FALSE, 'Calle de Lacoma', 'Zona residencial del distrito Fuencarral-El Pardo'),
(158, 'Arroyofresno', TRUE, 'Calle María de Maeztu, 52', 'Arroyofresno es una estación de la línea 7 del Metro de Madrid, situada en el área residencial de Arroyo del Fresno que forma parte del barrio de Mirasierra (distrito Fuencarral-El Pardo).'),
(159, 'Pitis', FALSE, 'Calle Senda del Infante', 'Estación terminal con conexión a Cercanías');

-- Inserción de estaciones de la Línea 8
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(160, 'Colombia', TRUE, 'Calle de Colombia', 'Conexión con Línea 9, zona empresarial y residencial'),
(161, 'Pinar del Rey', TRUE, 'Calle de Pinar del Rey', 'Ubicada en el distrito de Hortaleza'),
(162, 'Feria de Madrid', TRUE, 'Avenida del Partenón', 'Acceso al recinto ferial IFEMA'),
(163, 'Aeropuerto T1-T2-T3', TRUE, 'Aeropuerto Adolfo Suárez Madrid-Barajas, Terminal 2', 'Acceso a terminales T1, T2 y T3'),
(164, 'Barajas', TRUE, 'Plaza del Mercurio', 'Estación en el casco antiguo de Barajas'),
(165, 'Aeropuerto T4', TRUE, 'Aeropuerto Adolfo Suárez Madrid-Barajas, Terminal 4', 'Conexión con Cercanías RENFE');

-- Inserción de estaciones de la Línea 9
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(166, 'Paco de Lucía', TRUE, 'Calle Costa Brava', 'Terminal norte de Línea 9, conexión con Cercanías'),
(167, 'Mirasierra', TRUE, 'Av. Ventisquero de la Condesa', 'Barrio residencial, cerca del hospital Ruber Internacional'),
(168, 'Herrera Oria', FALSE, 'Calle Fermín Caballero', 'Zona residencial, también aparece en Línea 7'),
(169, 'Barrio del Pilar', TRUE, 'Av. Betanzos', 'Conexión con centro comercial La Vaguada'),
(170, 'Ventilla', FALSE, 'Calle de Asturias', 'Zona residencial de Tetuán'),
(171, 'Duque de Pastrana', FALSE, 'Paseo de la Habana', 'Zona empresarial de Chamartín'),
(172, 'Pío XII', FALSE, 'Avenida de Pío XII', 'Zona empresarial y residencial'),
(173, 'Concha Espina', FALSE, 'Calle Concha Espina', 'Próxima al estadio Santiago Bernabéu'),
(174, 'Cruz del Rayo', FALSE, 'Calle Serrano', 'Zona residencial de Salamanca'),
(175, 'Ibiza', FALSE, 'Calle Ibiza', 'Junto al Hospital Gregorio Marañón'),
(176, 'Estrella', FALSE, 'Calle Estrella Polar', 'Zona residencial'),
(177, 'Vinateros', FALSE, 'Calle Marroquina', 'Zona residencial'),
(178, 'Artilleros', FALSE, 'Calle Pico de Artilleros', 'Zona residencial'),
(179, 'Pavones', FALSE, 'Calle de los Pavones', 'Barrio de Moratalaz'),
(180, 'Valdebernardo', FALSE, 'Calle Ladera de los Almendros', 'Distrito Vicálvaro'),
(181, 'Vicálvaro', FALSE, 'Plaza de Alonso', 'Centro del barrio de Vicálvaro'),
(182, 'San Cipriano', FALSE, 'Calle de San Cipriano', 'Zona residencial'),
(183, 'Puerta de Arganda', TRUE, 'Calle Pico Artilleros', 'Transbordo entre Metro y MetroEste'),
(184, 'Rivas-Urbanizaciones', TRUE, 'Av. de Levante', 'Urbanizaciones de Rivas Vaciamadrid'),
(185, 'Rivas Futura', TRUE, 'Av. de Levante', 'Nuevo desarrollo urbanístico de Rivas-Vaciamadrid'),
(186, 'Rivas Vaciamadrid', TRUE, 'Calle de la Fundición', 'Centro urbano de Rivas'),
(187, 'La Poveda', TRUE, 'Calle Camino de la Poveda', 'Zona residencial de Arganda del Rey'),
(188, 'Arganda del Rey', TRUE, 'Calle del Real', 'Terminal este de Línea 9');


-- Inserción de estaciones de la Línea 10
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(189, 'Hospital Infanta Sofía', TRUE, 'Av. de la Sierra, San Sebastián de los Reyes', 'Terminal norte de Línea 10'),
(190, 'Reyes Católicos', TRUE, 'Av. de Reyes Católicos', 'Zona céntrica de San Sebastián de los Reyes'),
(191, 'Baunatal', TRUE, 'Av. de España', 'Zona residencial y comercial'),
(192, 'Manuel de Falla', TRUE, 'Av. de España, San Sebastián de los Reyes', 'Zona residencial'),
(193, 'Marqués de la Valdavia', TRUE, 'Av. de España', 'Zona residencial de Alcobendas'),
(194, 'La Moraleja', TRUE, 'Camino del Cura', 'Zona residencial de alto nivel'),
(195, 'La Granja', TRUE, 'C/ Sepúlveda, 3', 'Situada en el municipio de Alcobendas en el polígono industrial Vereda del Pobre'),
(196, 'Ronda de la Comunicación', TRUE, 'Distrito Telefónica', 'Sede central de Telefónica'),
(197, 'Las Tablas', TRUE, 'Calle de Castiello de Jaca', 'Conexión con ML1'),
(198, 'Montecarmelo', TRUE, 'Av. del Monte del Gozo', 'Barrio residencial al norte de Madrid'),
(199, 'Tres Olivos', TRUE, 'Calle de Antonio Cabezón', 'Transbordo entre ramales de Línea 10'),
(200, 'Fuencarral', TRUE, 'Calle de Nuestra Señora de Valverde', 'Zona norte tradicional'),
(201, 'Begoña', TRUE, 'Av. de la Ilustración', 'Acceso al Hospital La Paz'),
(202, 'Cuzco', TRUE, 'Paseo de la Castellana', 'Zona financiera'),
(203, 'Santiago Bernabéu', TRUE, 'Paseo de la Castellana', 'Estadio del Real Madrid'),
(204, 'Lago', TRUE, 'Paseo del Embarcadero', 'Acceso al Lago de la Casa de Campo'),
(205, 'Batán', TRUE, 'Paseo de la Puerta del Ángel', 'Acceso al Parque de Atracciones'),
(206, 'Colonia Jardín', TRUE, 'Calle del Oropéndola', 'Conexión con ML2 y ML3'),
(207, 'Aviación Española', TRUE, 'Av. Aviación Española', 'Zona residencial'),
(208, 'Cuatro Vientos', TRUE, 'Calle de Cuatro Vientos', 'Zona sur de Madrid'),
(209, 'Joaquín Vilumbrales', TRUE, 'Av. de los Castillos', 'Alcorcón'),
(210, 'Puerta del Sur', TRUE, 'Av. de Leganés', 'Conexión con Línea 12, Alcorcón');

-- Inserción de estaciones de la Línea 11
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(211, 'Abrantes', TRUE, 'Calle de Abrantes', 'Barrio de Carabanchel, zona residencial'),
(212, 'Pan Bendito', TRUE, 'Calle del Cristo de Lepanto', 'Barrio Pan Bendito, zona sur de Madrid'),
(213, 'San Francisco', TRUE, 'Calle de Camino Viejo de Leganés', 'Barrio de San Francisco, zona residencial'),
(214, 'Carabanchel Alto', TRUE, 'Calle de Alfonso Fernández', 'Antiguo municipio anexionado a Madrid'),
(215, 'La Peseta', TRUE, 'Avenida de La Peseta', 'Barrio de Carabanchel, junto al PAU'),
(216, 'La Fortuna', TRUE, 'Avenida de la Libertad', 'Única estación de Metro en Leganés');


-- Inserción de estaciones de la Línea 12
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(217, 'Parque Lisboa', TRUE, 'Calle Porto Cristo', 'Zona residencial en Alcorcón'),
(218, 'Alcorcón Central', TRUE, 'Calle del Retamas', 'Conexión con Cercanías RENFE'),
(219, 'Parque Oeste', TRUE, 'Av. de la Libertad', 'Junto al centro comercial X-Madrid'),
(220, 'Universidad Rey Juan Carlos', TRUE, 'Av. de Atenas', 'Campus de la URJC en Móstoles'),
(221, 'Móstoles Central', TRUE, 'Calle del Cristo', 'Conexión con Cercanías RENFE'),
(222, 'Pradillo', TRUE, 'Plaza del Pradillo', 'Centro de Móstoles'),
(223, 'Hospital de Móstoles', TRUE, 'Av. de la Constitución', 'Acceso al hospital de Móstoles'),
(224, 'Manuela Malasaña', TRUE, 'Calle Alfonso XII', 'Zona residencial de Móstoles'),
(225, 'Loranca', TRUE, 'Av. Pablo Iglesias', 'Distrito de Loranca, Fuenlabrada'),
(226, 'Hospital de Fuenlabrada', TRUE, 'Calle del Molino', 'Situada junto al Hospital de Fuenlabrada y el campus de la Universidad Rey Juan Carlos en Fuenlabrada'),
(227, 'Parque Europa', TRUE, 'Calle Grecia', 'Zona nueva en Fuenlabrada'),
(228, 'Fuenlabrada Central', TRUE, 'Plaza de la Constitución', 'Conexión con Cercanías RENFE'),
(229, 'Parque de los Estados', TRUE, 'Calle Francia', 'Zona residencial de Fuenlabrada'),
(230, 'Arroyo Culebro', TRUE, 'Av. del Hospital', 'Distrito de Leganés'),
(231, 'Conservatorio', TRUE, 'Avenida de las Arcas del Agua, 9', 'El nombre se puso porque muy cerca de ella está el Conservatorio Profesional de Música de Getafe.'),
(232, 'Alonso de Mendoza', TRUE, 'Calle El Greco, 2', 'Alonso de Mendoza es una estación de la línea 12 del Metro de Madrid ubicada bajo la calle del mismo nombre, en la zona sur del barrio de Alhóndiga de Getafe.'),
(233, 'Getafe Central', TRUE, 'Av. Juan de la Cierva', 'Conexión con Cercanías RENFE'),
(234, 'Juan de la Cierva', TRUE, 'Av. de Juan de la Cierva', 'Zona residencial de Getafe'),
(235, 'Los Espartales', TRUE, 'Av. Rigoberta Menchú', 'Barrio nuevo en Getafe'),
(236, 'El Bercial', TRUE, 'Calle Islas Cíes', 'Zona residencial y comercial'),
(237, 'El Carrascal', TRUE, 'Av. Rey Juan Carlos I', 'Cerca del centro comercial Parquesur'),
(238, 'Julián Besteiro', TRUE, 'Av. de Juan XXIII', 'Zona sur de Leganés'),
(239, 'Casa del Reloj', TRUE, 'Calle del Maestro', 'Zona residencial'),
(240, 'Hospital Severo Ochoa', TRUE, 'Calle del Río Tajo', 'Acceso al hospital Severo Ochoa'),
(241, 'Leganés Central', TRUE, 'Av. Fuenlabrada', 'Conexión con Cercanías RENFE'),
(242, 'San Nicasio', TRUE, 'Calle La Encina', 'San Nicasio es una estación de la línea 12 del Metro de Madrid situada en la confluencia de la parte antigua y el ensanche del barrio homónimo de Leganés. La estación abrió al público el 11 de abril de 2003.');


-- Inserción de estaciones de la Línea ML1
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(243, 'Fuente de la Mora', TRUE, 'Calle Fuente de la Mora', 'Conexión con Cercanías RENFE'),
(244, 'Virgen del Cortijo', TRUE, 'Calle de Oña', 'Barrio residencial en Hortaleza'),
(245, 'Antonio Saura', TRUE, 'Calle Antonio Saura', 'Zona empresarial de Sanchinarro'),
(246, 'Álvarez de Villaamil', TRUE, 'Calle Álvarez de Villaamil', 'Sanchinarro'),
(247, 'Blasco Ibáñez', TRUE, 'Calle Blasco Ibáñez', 'Barrio residencial de reciente construcción'),
(248, 'María Tudor', TRUE, 'Calle María Tudor', 'Zona residencial de Sanchinarro'),
(249, 'Palas de Rey', TRUE, 'Calle Palas de Rey', 'Zona norte de Sanchinarro');


-- Inserción de estaciones de la Línea ML2
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(250, 'Prado de la Vega', TRUE, 'Calle Prado de la Vega', 'Zona residencial cerca de Ciudad de la Imagen'),
(251, 'Colonia de los Ángeles', TRUE, 'Av. del Talgo', 'Zona residencial en Pozuelo de Alarcón'),
(252, 'Prado del Rey', TRUE, 'Av. de Radio Televisión', 'Centro de RTVE en Pozuelo'),
(253, 'Somosaguas Sur', TRUE, 'Calle Isaac Albéniz', 'Zona residencial del Campus de Somosaguas'),
(254, 'Somosaguas Centro', TRUE, 'Calle de la Libertad', 'Zona universitaria de Somosaguas'),
(255, 'Pozuelo Oeste', TRUE, 'Calle Portugal', 'Zona comercial de Pozuelo'),
(256, 'Bélgica', TRUE, 'Av. de Europa', 'Barrio de Pozuelo de Alarcón'),
(257, 'Dos Castillas', TRUE, 'Av. de Europa', 'Zona empresarial de Pozuelo'),
(258, 'Campus de Somosaguas', TRUE, 'Campus de Somosaguas', 'Universidad Complutense de Madrid'),
(259, 'Avenida de Europa', TRUE, 'Av. de Europa', 'Zona residencial y de oficinas'),
(260, 'Berna', TRUE, 'Calle de Berna', 'Zona residencial y empresarial'),
(261, 'Estación de Aravaca', TRUE, 'Av. de la Osa Mayor', 'Conexión con Cercanías RENFE');


-- Inserción de estaciones de la Línea ML3
INSERT INTO estaciones (id, nombre, accesibilidad, direccion, descripcion) VALUES
(262, 'Ciudad de la Imagen', TRUE, 'Calle Luis Buñuel', 'Centro audiovisual y comercial'),
(263, 'José Isbert', TRUE, 'Calle José Isbert', 'Zona de ocio y cines'),
(264, 'Ciudad del Cine', TRUE, 'Calle Juan de Orduña', 'Zona audiovisual'),
(265, 'Cocheras', TRUE, 'Camino de las Huertas', 'Depósito y talleres del metro ligero'),
(266, 'Retamares', TRUE, 'Calle Retamares', 'Zona empresarial'),
(267, 'Montepríncipe', TRUE, 'Av. de Montepríncipe', 'Campus universitario y hospital'),
(268, 'Ventorro del Cano', TRUE, 'Pol. Ind. Ventorro del Cano', 'Zona empresarial'),
(269, 'Prado del Espino', TRUE, 'Calle Prado del Espino', 'Zona industrial y empresarial'),
(270, 'Cantabria', TRUE, 'Calle Cantabria', 'Barrio residencial'),
(271, 'Ferial de Boadilla', TRUE, 'Av. Infante Don Luis', 'Zona del recinto ferial'),
(272, 'Boadilla Centro', TRUE, 'Plaza de la Constitución', 'Centro histórico de Boadilla'),
(273, 'Nuevo Mundo', TRUE, 'Calle Nuevo Mundo', 'Zona residencial'),
(274, 'Siglo XXI', TRUE, 'Calle Siglo XXI', 'Barrio moderno en expansión'),
(275, 'Infante Don Luis', TRUE, 'Av. Infante Don Luis', 'Zona comercial'),
(276, 'Puerta de Boadilla', TRUE, 'Calle Valle del Silencio', 'Terminal de ML3');


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
(12, 1, 12), -- Bilbao
(13, 1, 13), -- Tribunal
(14, 1, 14), -- Gran Vía
(15, 1, 15), -- Sol
(16, 1, 16), -- Tirso de Molina
(17, 1, 17), -- Antón Martín
(18, 1, 18), -- Estación del Arte
(19, 1, 19), -- Atocha
(20, 1, 20), -- Menéndez Pelayo
(21, 1, 21), -- Pacífico
(22, 1, 22), -- Puente de Vallecas
(23, 1, 23), -- Nueva Numancia
(24, 1, 24), -- Portazgo
(25, 1, 25), -- Buenos Aires
(26, 1, 26), -- Alto del Arenal
(27, 1, 27), -- Miguel Hernández
(28, 1, 28), -- Sierra de Guadalupe
(29, 1, 29), -- Villa de Vallecas
(30, 1, 30), -- Congosto
(31, 1, 31), -- La Gavia
(32, 1, 32), -- Las Suertes
(33, 1, 33); -- Valdecarros

-- Asignación a Línea 2 (ID línea = 2)
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(51, 2, 1),   -- Las Rosas
(50, 2, 2),   -- Avenida de Guadalajara
(49, 2, 3),   -- Alsacia
(48, 2, 4),   -- La Almudena
(47, 2, 5),   -- La Elipa
(46, 2, 6),   -- Ventas
(45, 2, 7),   -- Manuel Becerra
(44, 2, 8),   -- Goya
(43, 2, 9),   -- Príncipe de Vergara
(42, 2, 10),  -- Retiro
(41, 2, 11),  -- Banco de España
(40, 2, 12),  -- Sevilla
(15, 2, 13),  -- Sol (ya insertada previamente)
(39, 2, 14),  -- Ópera
(38, 2, 15),  -- Santo Domingo
(37, 2, 16),  -- Noviciado
(36, 2, 17),  -- San Bernardo
(35, 2, 18),  -- Quevedo
(34, 2, 19),  -- Canal
(9, 2, 20);   -- Cuatro Caminos (ya insertada previamente)

-- Asignación a Línea 3 (ID línea = 3)
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(52, 3, 1),   -- Moncloa
(53, 3, 2),   -- Argüelles
(54, 3, 3),   -- Ventura Rodríguez
(55, 3, 4),   -- Plaza de España
(56, 3, 5),   -- Callao
(15, 3, 6),   -- Sol
(58, 3, 7),   -- Lavapiés
(59, 3, 8),   -- Embajadores
(60, 3, 9),   -- Palos de la Frontera
(61, 3, 10),  -- Delicias
(62, 3, 11),  -- Legazpi
(63, 3, 12),  -- Almendrales
(64, 3, 13),  -- Hospital 12 de Octubre
(65, 3, 14),  -- San Fermín-Orcasur
(66, 3, 15),  -- Ciudad de los Ángeles
(67, 3, 16),  -- Villaverde Bajo-Cruce
(68, 3, 17),  -- San Cristóbal
(69, 3, 18),  -- Villaverde Alto
(70, 3, 19);  -- El Casar (reciente)

-- Asignación a Línea 4 (ID línea = 4)
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(53, 4, 1),   -- Argüelles
(36, 4, 2),   -- San Bernardo
(13, 4, 3),   -- Bilbao
(71, 4, 4),   -- Alonso Martínez
(72, 4, 5),   -- Colón
(73, 4, 6),   -- Serrano
(74, 4, 7),   -- Velázquez
(44, 4, 8),   -- Goya
(75, 4, 9),   -- Lista
(76, 4, 10),  -- Diego de León
(77, 4, 11),  -- Avenida de América
(78, 4, 12),  -- Prosperidad
(79, 4, 13),  -- Alfonso XIII
(80, 4, 14),  -- Avenida de la Paz
(81, 4, 15),  -- Arturo Soria
(82, 4, 16),  -- Esperanza
(83, 4, 17),  -- Canillas
(84, 4, 18),  -- Mar de Cristal
(85, 4, 19),  -- San Lorenzo
(86, 4, 20),  -- Parque de Santa María
(87, 4, 21),  -- Hortaleza
(88, 4, 22),  -- Manoteras
(1, 4, 23);   -- Pinar de Chamartín

-- Inserción de estaciones para la Línea 5 en lineas_estaciones
INSERT INTO estaciones_lineas (linea_id, estacion_id, orden) VALUES
(89, 5, 1),   -- Alameda de Osuna
(90, 5, 2),   -- El Capricho
(91, 5, 3),   -- Canillejas
(92, 5, 4),   -- Torre Arias
(93, 5, 5),   -- Suanzes
(94, 5, 6),   -- Ciudad Lineal
(95, 5, 7),   -- Pueblo Nuevo
(96, 5, 8),   -- Quintana
(97, 5, 9),   -- El Carmen
(46, 5, 10)   -- Ventas
(77, 5, 11),  -- Diego de León (id 77 en Línea 4)
(98, 5, 12),  -- Núñez de Balboa (id 98 en Línea 9)
(99, 5, 13),  -- Rubén Darío
(100, 5, 14), -- Chueca
(15, 5, 15),  -- Gran Vía (id 15 en Línea 1)
(101, 5, 16), -- La Latina
(102, 5, 17), -- Puerta de Toledo
(60, 5, 18),  -- Embajadores (id 60 en Línea 3)
(103, 5, 19), -- Pirámides
(104, 5, 20), -- Marqués de Vadillo
(105, 5, 21), -- Urgel
(106, 5, 22), -- Oporto
(107, 5, 23), -- Vista Alegre
(108, 5, 24), -- Carabanchel
(109, 5, 25), -- Eugenia de Montijo
(110, 5, 26), -- Aluche
(111, 5, 27), -- Empalme
(112, 5, 28), -- Campamento
(113, 5, 29); -- Casa de Campo

-- Inserción de estaciones para la Línea 6 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(114, 6, 1), -- Laguna
(115, 6, 2), -- Carpetana
(116, 6, 3), -- Oporto
(117, 6, 4), -- Opañel
(118, 6, 5), -- Plaza Eliptica
(119, 6, 6), -- Usera
(59, 6, 7), -- Legazpi
(120, 6, 8), -- Arganzuela-Planetario
(121, 6, 9), -- Mendez Alvaro
(21, 6, 10), -- Pacifico
(121, 6, 11), -- Conde de Casal
(122, 6, 12), -- Sainz de Baranda
(123, 6, 13), -- O'Donnell
(40, 6, 14), -- Manuel Becerra
(74, 6, 15), -- Diego de León
(75, 6, 16), -- Avenida de América
(124, 6, 17), -- República Argentina
(125, 6, 18), -- Nuevos Ministerios
(9, 6, 19), -- Cuatro Caminos
(126, 6, 20), -- Guzman el Bueno
(127, 6, 21), -- Vicente Aleixandre
(128, 6, 22), -- Ciudad Universitaria
(52, 6, 23), -- Moncloa
(53, 6, 24), -- Argüelles
(129, 6, 25), -- Principe Pío
(130, 6, 26), -- Puerta del Angel
(131, 6, 27); -- Alto de Extremadura
(132, 6, 27); -- Lucero

-- Inserción de estaciones para la Línea 7 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(132, 7, 1),
(133, 7, 2),
(134, 7, 3),
(135, 7, 4),
(136, 7, 5),
(137, 7, 6),
(138, 7, 7),
(139, 7, 8),
(140, 7, 9),
(141, 7, 10),
(142, 7, 11),
(143, 7, 12),
(144, 7, 13),
(93, 7, 14),
(145, 7, 15),
(146, 7, 16),
(147, 7, 17),
(75, 7, 18),
(148, 7, 19),
(149, 7, 20),
(51, 7, 21),
(150, 7, 22),
(125, 7, 23),
(151, 7, 24),
(152, 7, 25),
(153, 7, 26),
(154, 7, 27),
(155, 7, 28),
(156, 7, 29),
(157, 7, 30),
(158, 7, 31);

-- Inserción de estaciones para la Línea 8 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(124, 8, 1),
(159, 8, 2),
(160, 8, 3),
(82, 8, 4),
(161, 8, 5),
(162, 8, 6),
(163, 8, 7),
(164, 8, 8);

-- Inserción de estaciones para la Línea 9 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(165, 9, 1),
(166, 9, 2),
(167, 9, 3),
(168, 9, 4),
(169, 9, 5),
(4, 9, 6),
(170, 9, 7),
(171, 9, 8),
(159, 9, 9),
(172, 9, 10),
(173, 9, 11),
(75, 9, 12),
(96, 9, 13),
(42, 9, 14),
(174, 9, 15),
(121, 9, 16),
(175, 9, 17),
(176, 9, 18),
(177, 9, 19),
(178, 9, 20),
(179, 9, 21),
(180, 9, 22),
(181, 9, 23),
(182, 9, 24),
(183, 9, 25),
(184, 9, 26),
(185, 9, 27),
(186, 9, 28),
(187, 9, 29);

-- Inserción de estaciones para la Línea 10 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(188, 10, 1),
(189, 10, 2),
(190, 10, 3),
(191, 10, 4),
(192, 10, 5),
(192, 10, 6),
(194, 10, 7),
(195, 10, 8),
(196, 10, 9),
(197, 10, 10),
(198, 10, 11),
(199, 10, 12),
(200, 10, 13),
(3, 10, 14),
(4, 10, 15),
(201, 10, 16),
(202, 10, 17),
(124, 10, 18),
(148, 10, 19),
(69, 10, 20),
(13, 10, 21),
(65, 10, 22),
(128, 10, 23),
(203, 10, 24),
(204, 10, 25),
(112, 10, 26),
(205, 10, 27),
(206, 10, 28),
(207, 10, 29),
(208, 10, 30),
(209, 10, 31);

-- Inserción de estaciones para la Línea 11 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(116, 11, 1),
(210, 11, 2),
(211, 11, 3),
(212, 11, 4),
(213, 11, 5),
(214, 11, 6),
(215, 11, 7);

-- Inserción de estaciones para la Línea 12 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(209, 12, 1),
(216, 12, 2),
(217, 12, 3),
(218, 12, 4),
(219, 12, 5),
(220, 12, 6),
(221, 12, 7),
(222, 12, 8),
(223, 12, 9),
(224, 12, 10),
(225, 12, 11),
(226, 12, 12),
(227, 12, 13),
(228, 12, 14),
(229, 12, 15),
(230, 12, 16),
(231, 12, 17),
(232, 12, 18),
(233, 12, 19),
(234, 12, 20),
(235, 12, 21),
(236, 12, 22),
(237, 12, 23),
(238, 12, 24),
(239, 12, 25),
(240, 12, 26),
(241, 12, 27),
(242, 12, 28);

-- Inserción de estaciones para la Línea RAMAL en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(46, 13, 1),
(128, 13, 2);


-- Inserción de estaciones para la Línea ML1 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(1, 14, 1),
(243, 14, 2),
(244, 14, 3),
(245, 14, 4),
(246, 14, 5),
(247, 14, 6),
(248, 14, 7),
(249, 14, 8),
(196, 14, 9);

-- Inserción de estaciones para la Línea ML2 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(205, 15, 1),
(250, 15, 2),
(251, 15, 3),
(252, 15, 4),
(253, 15, 5),
(254, 15, 6),
(255, 15, 7),
(256, 15, 8),
(257, 15, 9),
(258, 15, 10),
(259, 15, 11),
(260, 15, 12),
(261, 15, 13);

-- Inserción de estaciones para la Línea ML3 en lineas_estaciones
INSERT INTO estaciones_lineas (estacion_id, linea_id, orden) VALUES
(205, 16, 1),
(262, 16, 2),
(263, 16, 3),
(264, 16, 4),
(265, 16, 5),
(266, 16, 6),
(267, 16, 7),
(268, 16, 8),
(269, 16, 9),
(270, 16, 10),
(271, 16, 11),
(272, 16, 12),
(273, 16, 13),
(274, 16, 14),
(275, 16, 15),
(276, 16, 16);


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

-- Transbordos para estaciones de la Línea 7
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('58', '93', '5'),           -- Pueblo Nuevo
('59', '75', '4,6,9'),         -- Avenida de América
('60', '148', '10'),           -- Gregorio Marañón
('61', '51', '2');          -- Canal

-- Transbordos para estaciones de la Línea 8
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('62', '124', '6,10'),           -- Nuevos Ministerios
('63', '159', '9'),         -- Colombia
('64', '82', '10');          -- Mar de Cristal

-- Transbordos para estaciones de la Línea 9
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('65', '4', '1,10'),           -- Plaza Castilla
('66', '159', '8'),         -- Colombia
('67', '75', '4,6,7'),          -- Avenida de América
('68', '96', '5'),            -- Núñez de Balboa (transbordo con L9)
('69', '42', '2'),           -- Príncipe de Vergara
('70', '121', '6');           -- Sainz de Baranda

-- Transbordos para estaciones de la Línea 10
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('71', '196', '14'),           -- Las Tablas
('72', '3', '1'),        -- Chamartín (solo metro)
('73', '4', '1,9'),          -- Plaza de Castilla
('74', '124', '6,8'),            -- Nuevos Ministerios
('75', '148', '7'),           -- Gregorio Marañón
('76', '69', '4,5'),           -- Alonso Martínez
('77', '13', '1'),          -- Tribunal
('78', '65', '2,3'),            -- Plaza España
('79', '128', '6,13'),           -- Principe Pio
('80', '112', '5'),          -- Casa de Campo (transbordo con L10)
('81', '205', '15,16'),            -- Colonia Jardín
('82', '209', '12');          -- Puerta del Sur

-- Transbordos para estaciones de la Línea 11
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('83', '116', '6');           -- Plaza Elíptica (transbordo con L11)

-- Transbordos para estaciones de la Línea 12
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('84', '209', '10');           -- Puerta del Sur

-- Transbordos para estaciones de la Línea Ramal
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('85', '46', '2,5'),          -- Ópera (transbordo con L2 y Ramal)
('86', '128', '6,10');          -- Principe Pio

-- Transbordos para estaciones de la Línea ML1
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('87', '1', '1,4'),          -- Pinar de Chamartín
('88', '196', '10');          -- Las Tablas

-- Transbordos para estaciones de la Línea ML2
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('89', '205', '10,16');          -- Colonia Jardín


-- Transbordos para estaciones de la Línea ML3
INSERT INTO transbordos (id, id_estacion, lineas_trasbordos) VALUES
('90', '205', '10,15');          -- Colonia Jardín


INSERT INTO lineas (id, nombre, siglas) VALUES 
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