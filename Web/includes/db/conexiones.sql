DROP TABLE IF EXISTS `conexiones`;

CREATE TABLE `conexiones` (
  `id` int(11) NOT NULL,
  `estacion_origen` int(11) NOT NULL,
  `estacion_destino` int(11) NOT NULL,
  `tiempo` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `conexiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estacion_origen_id` (`estacion_origen`),
  ADD KEY `estacion_destino_id` (`estacion_destino`);

ALTER TABLE `conexiones`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `conexiones`
  ADD CONSTRAINT `conexiones_ibfk_1` FOREIGN KEY (`estacion_origen`) REFERENCES `estaciones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conexiones_ibfk_2` FOREIGN KEY (`estacion_destino`) REFERENCES `estaciones` (`id`) ON DELETE CASCADE;
COMMIT;

-- Linea 1
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`, `tiempo`) VALUES
(1, 1, 2, 3), -- Pinar de Chamartín - Bambú
(2, 2, 1, 4), -- Bambú - Pinar de Chamartín
(3, 2, 3, 2), -- Bambú - Chamartín 
(4, 3, 2, 2), -- Chamartín - Bambú
(5, 3, 4, 2), -- Chamartín - Plaza de Castilla
(6, 4, 3, 2), -- Plaza de Castilla - Chamartín
(7, 4, 5, 2), -- Plaza de Castilla - Valdeacederas
(8, 5, 4, 2), -- Valdeacederas - Plaza de Castilla
(9, 5, 6, 2), -- Valdeacederas - Tetuán
(10, 6, 5, 2), -- Tetuán - Valdeacederas
(11, 6, 7, 2), -- Tetuán - Estrecho
(12, 7, 6, 2), -- Estrecho - Tetuán
(13, 7, 8, 2), -- Estrecho - Alvarado
(14, 8, 7, 2), -- Alvarado - Estrecho
(15, 8, 9, 2), -- Alvarado - Cuatro Caminos
(16, 9, 8, 2), -- Cuatro Caminos - Alvarado
(17, 9, 10, 2), -- Cuatro Caminos - Ríos Rosas
(18, 10, 9, 2), -- Ríos Rosas - Cuatro Caminos
(19, 10, 11, 2), -- Ríos Rosas - Iglesia
(20, 11, 10, 2), -- Iglesia - Ríos Rosas
(21, 11, 12, 2), -- Iglesia - Bilbao
(22, 12, 11, 2), -- Bilbao - Iglesia
(23, 12, 13, 2), -- Bilbao - Tribunal
(24, 13, 12, 2), -- Tribunal - Bilbao
(25, 13, 14, 2), -- Tribunal - Gran Vía
(26, 14, 13, 2), -- Gran Vía - Tribunal
(27, 14, 15, 1), -- Gran Vía - Sol
(28, 15, 14, 1), -- Sol - Gran Vía
(29, 15, 16, 2), -- Sol - Tirso de Molina
(30, 16, 15, 2), -- Tirso de Molina - Sol
(31, 16, 17, 2), -- Tirso de Molina - Antón Martín
(32, 17, 16, 2), -- Antón Martín - Tirso de Molina
(33, 17, 18, 2), -- Antón Martín - Estación del Arte
(34, 18, 17, 2), -- Estación del Arte - Antón Martín
(35, 18, 19, 1), -- Estación del Arte - Atocha
(36, 19, 18, 1), -- Atocha - Estación del Arte
(37, 19, 20, 2), -- Atocha - Menéndez Pelayo
(38, 20, 19, 2), -- Menéndez Pelayo - Atocha
(39, 20, 21, 2), -- Menéndez Pelayo - Pacífico
(40, 21, 20, 2), -- Pacífico - Menéndez Pelayo
(41, 21, 22, 2), -- Pacífico - Puente de Vallecas
(42, 22, 21, 2), -- Puente de Vallecas - Pacífico
(43, 22, 23, 2), -- Puente de Vallecas - Nueva Numancia
(44, 23, 22, 2), -- Nueva Numancia - Puente de Vallecas
(45, 23, 24, 2), -- Nueva Numancia - Portazgo
(46, 24, 23, 2), -- Portazgo - Nueva Numancia
(47, 24, 25, 1), -- Portazgo - Buenos Aires
(48, 25, 24, 1), -- Buenos Aires - Portazgo
(49, 25, 26, 2), -- Buenos Aires - Alto del Arenal
(50, 26, 25, 2), -- Alto del Arenal - Buenos Aires
(51, 26, 27, 2), -- Alto del Arenal - Miguel Hernández
(52, 27, 26, 2), -- Miguel Hernández - Alto del Arenal
(53, 27, 28, 4), -- Miguel Hernández - Sierra de Guadalupe
(54, 28, 27, 4), -- Sierra de Guadalupe - Miguel Hernández
(55, 28, 29, 2), -- Sierra de Guadalupe - Villa de Vallecas
(56, 29, 28, 2), -- Villa de Vallecas - Sierra de Guadalupe
(57, 29, 30, 3), -- Villa de Vallecas - Congosto
(58, 30, 29, 3), -- Congosto - Villa de Vallecas
(59, 30, 31, 2), -- Congosto - La Gavia
(60, 31, 30, 2), -- La Gavia - Congosto
(61, 31, 32, 4), -- La Gavia - Las Suertes
(62, 32, 31, 4), -- Las Suertes - La Gavia
(63, 32, 33, 2), -- Las Suertes - Valdecarros
(64, 33, 32, 2); -- Valdecarros - Las Suertes

-- Linea 2
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(65, 9, 34, 2), -- Cuatro Caminos - Canal
(66, 34, 9, 2), -- Canal - Cuatro Caminos
(67, 34, 35, 2), -- Canal - Quevedo
(68, 35, 34, 2), -- Quevedo - Canal
(69, 35, 36, 1), -- Quevedo - San Bernardo
(70, 36, 35, 1), -- San Bernardo - Quevedo
(71, 36, 37, 2), -- San Bernardo - Noviciado
(72, 37, 36, 2), -- Noviciado - San Bernardo
(73, 37, 38, 1), -- Noviciado - Santo Domingo 
(74, 38, 37, 1), -- Santo Domingo - Noviciado
(75, 38, 39, 2), -- Santo Domingo - Ópera
(76, 39, 38, 2), -- Ópera - Santo Domingo
(77, 39, 15, 2), -- Ópera - Sol
(78, 15, 39, 2), -- Sol - Ópera
(79, 15, 40, 1), -- Sol - Sevilla
(80, 40, 15, 1), -- Sevilla - Sol
(81, 40, 41, 2), -- Sevilla - Banco de España
(82, 41, 40, 2), -- Banco de España - Sevilla
(83, 41, 42, 2), -- Banco de España - Retiro
(84, 42, 41, 2), -- Retiro - Banco de España 
(85, 42, 43, 2), -- Retiro - Príncipe de Vergara
(86, 43, 42, 2), -- Principe de Vergara - Retiro
(87, 43, 44, 2), -- Príncipe de Vergara - Goya
(88, 44, 43, 2), -- Goya - Príncipe de Vergara
(89, 44, 45, 2), -- Goya - Manuel Becerra
(90, 45, 44, 2), -- Manuel Becerra - Goya
(91, 45, 46, 2), -- Manuel Becerra - Ventas
(92, 46, 45, 2), -- Ventas - Manuel Becerra
(93, 46, 47, 4), -- Ventas - La Elipa
(94, 47, 46, 4), -- La Elipa - Ventas
(95, 47, 48, 3), -- La Elipa - La Almudena
(96, 48, 47, 3), -- La Almudena - La Elipa
(97, 48, 49, 4), -- La Almudena - Alsacia
(98, 49, 48, 4), -- Alsacia - La Almudena
(99, 49, 50, 3), -- Alsacia - Avenida de Guadalajara
(100, 50, 49, 3), -- Avenida de Guadalajara - Alsacia
(101, 50, 51, 3), -- Avenida de Guadalajara - Las Rosas
(102, 51, 50, 3); -- Las Rosas - Avenida de Guadalajara

-- Linea 3
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(103, 52, 53, 1), -- Moncloa - Argüelles
(104, 53, 52, 1), -- Argüelles - Moncloa
(105, 53, 54, 2), -- Argüelles - Ventura Rodríguez
(106, 54, 53, 2), -- Ventura Rodríguez - Argüelles
(107, 54, 55, 2), -- Ventura Rodríguez - Plaza de España
(108, 55, 54, 2), -- Plaza de España - Ventura Rodríguez
(109, 55, 56, 2), -- Plaza de España - Callao
(110, 56, 55, 2), -- Callao - Plaza de España
(111, 56, 15, 2), -- Callao - Sol
(112, 15, 56, 2), -- Sol - Callao
(113, 15, 57, 3), -- Sol - Lavapiés
(114, 57, 15, 3), -- Lavapiés - Sol
(115, 57, 58, 2), -- Lavapiés - Embajadores
(116, 58, 57, 2), -- Embajadores - Lavapiés
(117, 58, 59, 2), -- Embajadores - Palos de la Frontera
(118, 59, 58, 2), -- Palos de la Frontera - Embajadores
(119, 59, 60, 2), -- Palos de la Frontera - Delicias
(120, 60, 59, 2), -- Delicias - Palos de la Frontera
(121, 60, 61, 2), -- Delicias - Legazpi
(122, 61, 60, 2), -- Legazpi - Delicias
(123, 61, 62, 3), -- Legazpi - Almendrales
(124, 62, 61, 3), -- Almendrales - Legazpi
(125, 62, 63, 3), -- Almendrales - Hospital 12 de Octubre
(126, 63, 62, 3), -- Hospital 12 de Octubre - Almendrales
(127, 63, 64, 2), -- Hospital 12 de Octubre - San Fermín-Orcasur
(128, 64, 63, 2), -- San Fermín-Orcasur - Hospital 12 de Octubre
(129, 64, 65, 3), -- San Fermín-Orcasur - Ciudad de los Ángeles
(130, 65, 64, 3), -- Ciudad de los Ángeles - San Fermín-Orcasur
(131, 65, 66, 3), -- Ciudad de los Ángeles - Villaverde Bajo-Cruce
(132, 66, 65, 3), -- Villaverde Bajo-Cruce - Ciudad de los Ángeles
(133, 66, 67, 2), -- Villaverde Bajo-Cruce - San Cristóbal
(134, 67, 66, 2), -- San Cristóbal - Villaverde Bajo-Cruce
(135, 67, 68, 5), -- San Cristóbal - Villaverde Alto
(136, 68, 67, 4), -- Villaverde Alto - San Cristóbal
(137, 68, 69, 4), -- Villaverde ALto - El Casar
(138, 69, 68, 4); -- El Casar - Villaverde Alto

--Linea 4
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(139, 53, 36, 2), -- Argüelles - San Bernardo
(140, 36, 53, 2), -- San Bernardo - Argüelles
(141, 36, 12, 1), -- San Bernardo - Bilbao
(142, 12, 36, 1), -- Bilbao - San Bernardo
(143, 12, 70, 1), -- Bilbao - Alonso Martínez
(144, 70, 12, 1), -- Alonso Martínez - Bilbao
(145, 70, 71, 1), -- Alonso Martínez - Colón
(146, 71, 70, 1), -- Colón - Alonso Martínez
(147, 71, 72, 1), -- Colón - Serrano
(148, 72, 71, 1), -- Serrano - Colón
(149, 72, 73, 1), -- Serrano - Velázquez
(150, 73, 72, 1), -- Velázquez - Serrano
(151, 73, 44, 1), -- Velázquez - Goya
(152, 44, 73, 1), -- Goya - Velázquez
(153, 44, 74, 2), -- Goya - Lista
(154, 74, 44, 2), -- Lista - Goya
(155, 74, 75, 1), -- Lista - Diego de León
(156, 75, 74, 1), -- Diego de León - Lista
(157, 75, 76, 1), -- Diego de León - Avenida de América
(158, 76, 75, 1), -- Avenida de América - Diego de León
(159, 76, 77, 2), -- Avenida de América - Prosperidad
(160, 77, 76, 2), -- Prosperidad - Avenida de América
(161, 77, 78, 2), -- Prosperidad - Alfonso XIII
(162, 78, 77, 2), -- Alfonso XIII - Prosperidad
(163, 78, 79, 2), -- Alfonso XIII - Avenida de la Paz
(164, 79, 78, 2), -- Avenida de la Paz - Alfonso XIII
(165, 79, 80, 2), -- Avenida de la Paz - Arturo Soria
(166, 80, 79, 2), -- Arturo Soria - Avenida de la Paz
(167, 80, 81, 2), -- Arturo Soria - Esperanza
(168, 81, 80, 2), -- Esperanza - Arturo Soria
(169, 81, 82, 3), -- Esperanza - Canillas
(170, 82, 81, 3), -- Canillas - Esperanza
(171, 82, 83, 2), -- Canillas - Mar de Cristal
(172, 83, 82, 2), -- Mar de Cristal - Canillas
(173, 83, 84, 1), -- Mar de Cristal - San Lorenzo
(174, 84, 83, 1), -- San Lorenzo - Mar de Cristal
(175, 84, 85, 2), -- San Lorenzo - Parque de Santa María
(176, 85, 84, 2), -- Parque de Santa María - San Lorenzo
(177, 85, 86, 2), -- Parque de Santa María - Hortaleza
(178, 86, 85, 2), -- Hortaleza - Parque de Santa María
(179, 86, 87, 3), -- Hortaleza - Manoteras
(180, 87, 86, 3), -- Manoteras - Hortaleza
(181, 87, 1, 2), -- Manoteras - Pinar de Chamartín
(182, 1, 87, 2); -- Pinar de Chamartín - Manoteras

--Linea 5
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(183, 88, 89, 2), -- Alameda de Osuna - El Capricho
(184, 89, 88, 2), -- El Capricho - Alameda de Osuna
(185, 89, 90, 3), -- El Capricho - Canillejas
(186, 90, 89, 3), -- Canillejas - El Capricho
(187, 90, 91, 3), -- Canillejas - Torre Arias 
(188, 91, 90, 3), -- Torre Arias - Canillejas
(189, 91, 92, 2), -- Torre Arias - Suanzes
(190, 92, 91, 2), -- Suanzes - Torre Arias
(191, 92, 93, 3), -- Suanzes - Ciudad Lineal
(192, 93, 92, 3), -- Ciudad Lineal - Suanzes
(193, 93, 94, 2), -- Ciudad Lineal - Pueblo Nuevo
(194, 94, 93, 2), -- Pueblo Nuevo - Ciudad Lineal
(195, 94, 95, 2), -- Pueblo Nuevo - Quintana
(196, 95, 94, 2), -- Quintana - Pueblo Nuevo
(197, 95, 96, 2), -- Quintana - El Carmen
(198, 96, 95, 2), -- El Carmen - Quintana
(199, 96, 46, 2), -- El Carmen - Ventas
(200, 46, 96, 2), -- Ventas - El Carmen
(201, 46, 75, 3), -- Ventas - Diego de León
(202, 75, 46, 3), -- Diego de León - Ventas
(203, 75, 97, 2), -- Diego de León - Núñez de Balboa
(204, 97, 75, 2), -- Núñez de Balboa - Diego de León
(205, 97, 98, 2), -- Núñez de Balboa - Rubñen Darío
(206, 98, 97, 2), -- Rubén Darío - Núñez de Balboa
(207, 98, 70, 2), -- Rubén Darío - Alonso Martínez
(208, 70, 98, 2), -- Alonso Martínez - Rubén Darío
(209, 70, 99, 2), -- Alonso Martínez - Chueca
(210, 99, 70, 2), -- Chueca - Alonso Martínez
(211, 99, 14, 2), -- Chueca - Gran Vía
(212, 14, 99, 2), -- Gran Vía - Chueca
(213, 14, 56, 1), -- Gran Vía - Callao
(214, 56, 14, 1), -- Callao - Gran Vía
(215, 56, 39, 2), -- Callao - Ópera
(216, 39, 56, 2), -- Opera - Callao
(217, 39, 100, 2), -- Opera - La Latina
(218, 100, 39, 2), -- La Latina - Ópera
(219, 100, 101, 2), -- La Latina - Puerta de Toledo
(220, 101, 100, 2), -- Puerta de Toledo - La Latina
(221, 101, 58, 4), -- Puerta de Toledo - Acacias (misma estación que Embajadores)
(222, 58, 101, 4), -- Acacias - Puerta de Toledo
(223, 58, 102, 2), -- Acacias - Pirámides
(224, 102, 58, 2), -- Pirámides - Acacias
(225, 102, 103, 2), -- Pirámides - Marqués de Vadillo
(226, 103, 102, 2), -- Marqués de Vadillo - Pirámides
(227, 103, 104, 2), -- Marqués de Vadillo - Urgel
(228, 104, 103, 2), -- Urgel - Marqués de Vadillo
(229, 104, 105, 2), -- Urgel - Oporto
(230, 105, 104, 2), -- Oporto - Urgel
(231, 105, 106, 2), -- Oporto - Vista Alegre
(232, 106, 105, 2), -- Vista Alegre - Oporto
(233, 106, 107, 2), -- Vista Alegre - Carabanchel
(234, 107, 106, 2), -- Carabanchel - Vista Alegre
(235, 107, 108, 2), -- Carabanchel - Eugenia de Montijo
(236, 108, 107, 2), -- Eugenia de Montijo - Carabanchel
(237, 108, 109, 3), -- Eugenia de Montijo - Aluche
(238, 109, 108, 3), -- Aluche - Eugenia de Montijo
(239, 109, 110, 2), -- Aluche - Empalme
(240, 110, 109, 2), -- Empalme - Aluche
(241, 110, 111, 2), -- Empalme - Campamento
(242, 111, 110, 2), -- Campamento - Empalme
(243, 111, 112, 4), -- Campamento - Casa de Campo
(244, 112, 111, 4); -- Casa de Campo - Campamento

--Linea 6
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(245, 113, 114, 2), -- Laguna - Carpetana
(246, 114, 113, 2), -- Carpetana - Laguna
(247, 114, 105, 3), -- Carpetana - Oporto
(248, 105, 114, 3), -- Oporto - Carpetana
(249, 105, 115, 2), -- Oporto - Opañel
(250, 115, 105, 2), -- Opañel - Oporto
(251, 115, 116, 2), -- Opañel - Plaza Elíptica
(252, 116, 115, 2), -- Plaza Elíptica - Opañel
(253, 116, 117, 3), -- Plaza Elíptica - Usera
(254, 117, 116, 3), -- Usera - Plaza Elíptica
(255, 117, 61, 3), -- Usera - Legazpi
(256, 61, 117, 3), -- Legazpi - Usera
(257, 61, 118, 2), -- Legazpi - Arganzuela-Planetario
(258, 118, 61, 2), -- Arganzuela-Planetario - Legazpi
(259, 118, 119, 2), -- Arganzuela-Planetario - Méndez Álvaro
(260, 119, 118, 2), -- Méndez Álvaro - Arganzuela-Planetario
(261, 119, 21, 2), -- Méndez Álvaro - Pacífico
(262, 21, 119, 2), -- Pacífico - Méndez Álvaro
(263, 21, 120, 2), -- Pacífico - Conde de Casal
(264, 120, 21, 2), -- Conde de Casal - Pacífico
(265, 120, 121, 2), -- Conde de Casal - Sainz de Baranda
(266, 121, 120, 2), -- Sainz de Baranda - Conde de Casal
(267, 121, 122, 2), -- Sainz de Baranda - O'Donnell
(268, 122, 121, 2), -- O'Donnell - Sainz de Baranda
(269, 122, 45, 2), -- O'Donnell - Manuel Becerra
(270, 45, 122, 2), -- Manuel Becerra - O'Donnell
(271, 45, 75, 2), -- Manuel Becerra - Diego de León
(272, 75, 45, 2), -- Diego de León - Manuel Becerra
(273, 75, 76, 2), -- Diego de León - Avenida de América
(274, 76, 75, 2), -- Avenida de América - Diego de León
(275, 76, 123, 3), -- Avenida de América - República Argentina
(276, 123, 76, 3), -- República Argentina - Avenida de América
(277, 123, 124, 3), -- República Argentina - Nuevos Ministerios
(278, 124, 123, 3), -- Nuevos Ministerios - República Argentina
(279, 124, 9, 2), -- Nuevos Ministerios - Cuatro Caminos
(280, 9, 124, 2), -- Cuatro Caminos - Nuevos Ministerios
(281, 9, 125, 2), -- Cuatro Caminos - Guzmán el Bueno
(282, 125, 9, 2), -- Guzmán el Bueno - Cuatro Caminos
(283, 125, 126, 2), -- Guzmán el Bueno - Vicente Aleixandre
(284, 126, 125, 2), -- Vicente Aleixandre - Guzmán el Bueno
(285, 126, 127, 2), -- Vicente Aleixandre - Ciudad Universitaria
(286, 127, 126, 2), -- Ciudad Universitaria - Vicente Aleixandre
(287, 127, 52, 4), -- Ciudad Universitaria - Moncloa
(288, 52, 127, 4), -- Moncloa - Ciudad Universitaria
(289, 52, 53, 1), -- Moncloa - Argüelles
(290, 53, 52, 1), -- Argüelles - Moncloa
(291, 53, 128, 4), -- Argüelles - Príncipe Pío
(292, 128, 53, 4), -- Príncipe Pío - Argüelles
(293, 128, 129, 3), -- Príncipe Pío - Puerta del Ángel
(294, 129, 128, 3), -- Puerta del Ángel - Príncipe Pío
(295, 129, 130, 3), -- Puerta del Ángel - Alto de Extremadura
(296, 130, 129, 3), -- Alto de Extremadura - Puerta del Ángel
(297, 130, 131, 3), -- Alto de Extremadura - Lucero
(298, 131, 130, 3), -- Lucero - Alto de Extremadura
(299, 131, 113, 2), -- Lucero - Laguna
(300, 113, 131, 2); -- Laguna - Lucero

--Linea 7
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(301, 132, 133, 2), -- Hospital del Henares - Henares
(302, 133, 132, 2), -- Henares - Hospital del Henares
(303, 133, 134, 2), -- Henares - Jarama
(304, 134, 133, 2), -- Jarama - Henares
(305, 134, 135, 2), -- Jarama - San Fernando
(306, 135, 134, 2), -- San Fernando - Jarama
(307, 135, 136, 2), -- San Fernando - La Rambla
(308, 136, 135, 2), -- La Rambla - San Fernando
(309, 136, 137, 2), -- La Rambla - Coslada Central
(310, 137, 136, 2), -- Coslada Central - La Rambla
(311, 137, 138, 2), -- Coslada Central - Barrio del Puerto
(312, 138, 137, 2), -- Barrio del Puerto - Coslada Central
(313, 138, 139, 5), -- Barrio del Puerto - Estadio Metropolitano
(314, 139, 138, 5), -- Estadio Metropolitano - Barrio del Puerto
(315, 139, 140, 3), -- Estadio Metropolitano - Las Musas
(316, 140, 139, 3), -- Las Musas - Estadio Metropolitano
(317, 140, 141, 2), -- Las Musas - San Blas
(318, 141, 140, 2), -- San Blas - Las Musas
(319, 141, 142, 2), -- San Blas - Simancas
(320, 142, 141, 2), -- Simancas - San Blas
(321, 142, 143, 2), -- Simancas - García Noblejas
(322, 143, 142, 2), -- García Noblejas - Simancas
(323, 143, 144, 2), -- García Noblejas - Ascao
(324, 144, 143, 2), -- Ascao - García Noblejas
(325, 144, 94, 2), -- Ascao - Pueblo Nuevo
(326, 94, 144, 2), -- Pueblo Nuevo - Ascao
(327, 94, 145, 3), -- Pueblo Nuevo - Barrio de la Concepción
(328, 145, 94, 3), -- Barrio de la Concepción - Pueblo Nuevo
(329, 145, 146, 2), -- Barrio de la Concepción - Parque de las Avenidas
(330, 146, 145, 2), -- Parque de las Avenidas - Barrio de la Concepción
(331, 146, 147, 2), -- Parque de las Avenidas - Cartagena
(332, 147, 146, 2), -- Cartagena - Parque de las Avenidas
(333, 147, 76, 2), -- Cartagena - Avenida de América
(334, 76, 147, 2), -- Avenida de América - Cartagena
(335, 76, 148, 3), -- Avenida de América - Gregorio Marañón
(336, 148, 76, 3), -- Gregorio Marañón - Avenida de América
(337, 148, 149, 2), -- Gregorio Marañón - Alonso Cano
(338, 149, 148, 2), -- Alonso Cano - Gregorio Marañón
(339, 149, 34, 2), -- Alonso Cano - Canal
(340, 34, 149, 2), -- Canal - Alonso Cano
(341, 34, 150, 2), -- Canal - Islas Filipinas
(342, 150, 34, 2), -- Islas Filipinas - Canal
(343, 150, 125, 3), -- Islas Filipinas - Guzmán el Bueno
(344, 125, 150, 3), -- Guzmán el Bueno - Islas Filipinas
(345, 125, 151, 3), -- Guzmán el Bueno - Francos Rodríguez
(346, 151, 125, 3), -- Francos Rodríguez - Guzmán el Bueno
(347, 151, 152, 3), -- Francos Rodríguez - Valdezarza
(348, 152, 151, 3), -- Valdezarza - Francos Rodríguez
(349, 152, 153, 2), -- Valdezarza - Antonio Machado
(350, 153, 152, 2), -- Antonio Machado - Valdezarza
(351, 153, 154, 2), -- Antonio Machado - Peñagrande
(352, 154, 153, 2), -- Peñagrande - Antonio Machado
(353, 154, 155, 2), -- Peñagrande - Avenida de la Ilustración
(354, 155, 154, 2), -- Avenida de la Ilustración - Peñagrande
(355, 155, 156, 2), -- Avenida de la Ilustración - Lacoma
(356, 156, 155, 2), -- Lacoma - Avenida de la Ilustración
(357, 156, 157, 2), -- Lacoma - Arroyofresno
(358, 157, 156, 2), -- Arroyofresno - Lacoma
(359, 157, 158, 2), -- Arroyofresno - Pitis
(360, 158, 157, 2); -- Pitis - Arroyofresno

-- Inserción de conexiones para la Línea 8
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(361, 124, 159, 3),          -- Nuevos Ministerios - Colombia
(362, 159, 124, 3),          -- Colombia - Nuevos Ministerios
(363, 159, 160, 4),          -- Colombia - Pinar del Rey
(364, 160, 159, 4),          -- Pinar del Rey - Colombia 
(365, 160, 82, 2),          -- Pinar del Rey - Mar de Cristal
(366, 82, 160, 2),          -- Mar de Cristal - Pinar del Rey
(367, 82, 161, 3),          -- Mar de Cristal - Feria de Madrid
(368, 161, 82, 3),          -- Feria de Madrid - Mar de Cristal
(369, 161, 162, 5),          -- Feria de Madrid - Aeropuerto T1-T2-T3
(370, 162, 161, 5),          -- Aeropuerto T1-T2-T3 - Feria de Madrid
(371, 162, 163, 2),          -- Aeropuerto T1-T2-T3 - Barajas
(372, 163, 162, 2),          -- Barajas - Aeropuerto T1-T2-T3
(373, 163, 164, 3),          -- Barajas - Aeropuerto T4
(374, 164, 163, 3);          -- Aeropuerto T4 - Barajas

-- Inserción de conexiones para la Línea 9
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(375, 165, 166, 3),          -- Paco de Lucia - Mirasierra
(376, 166, 165, 3),          -- Mirasierra - Paco de Lucia
(377, 166, 167, 6),          -- Mirasierra - Herrera Oria
(378, 167, 166, 6),          -- Herrera Oria - Mirasierra
(379, 167, 168, 2),          -- Herrera Oria - Barrio del Pilar
(380, 168, 167, 2),          -- Barrio del Pilar - Herrera Oria
(381, 168, 169, 3),          -- Barrio del Pilar - Ventilla
(382, 169, 168, 3),          -- Ventilla - Barrio del Pilar
(383, 169, 4, 2),            -- Ventilla - Plaza Castilla
(384, 4, 169, 2),            -- Plaza Castilla - Ventilla
(385, 4, 170, 1),            -- Plaza Castilla - Duque de Pastrana
(386, 170, 4, 1),            -- Duque de Pastrana - Plaza Castilla
(387, 170, 171, 1),          -- Duque de Pastrana - Pío XII
(388, 171, 170, 1),          -- Pío XII - Duque de Pastrana
(389, 171, 159, 2),          -- Pío XII - Colombia
(390, 159, 171, 2),          -- Colombia - Pío XII
(391, 159, 172, 2),          -- Colombia - Concha Espina
(392, 172, 159, 2),          -- Concha Espina - Colombia
(393, 172, 173, 2),          -- Concha Espina - Cruz del Rayo
(394, 173, 172, 2),          -- Cruz del Rayo - Concha Espina
(395, 173, 75, 2),           -- Cruz del Rayo - Avenida de América
(396, 75, 173, 2),           -- Avenida de América - Cruz del Rayo
(397, 75, 96, 1),            -- Avenida de América - Núñez de Balboa
(398, 96, 75, 1),            -- Núñez de Balboa - Avenida de América
(399, 96, 42, 2),            -- Núñez de Balboa - Príncipe de Vergara
(400, 42, 96, 2),            -- Príncipe de Vergara - Núñez de Balboa
(401, 42, 174, 2),           -- Príncipe de Vergara - Ibiza
(402, 174, 42, 2),           -- Ibiza - Príncipe de Vergara
(403, 174, 121, 2),          -- Ibiza - Sainz de Baranda
(404, 121, 174, 2),          -- Sainz de Baranda - Ibiza
(405, 121, 175, 2),          -- Sainz de Baranda - Estrella
(406, 175, 121, 2),          -- Estrella - Sainz de Baranda
(407, 175, 176, 2),          -- Estrella - Vinateros
(408, 176, 175, 2),          -- Vinateros - Estrella
(409, 176, 177, 2),          -- Vinateros - Artilleros
(410, 177, 176, 2),          -- Artilleros - Vinateros
(411, 177, 178, 2),          -- Artilleros - Pavones
(412, 178, 177, 2),          -- Pavones - Artilleros
(413, 178, 179, 3),          -- Pavones - Valdebernardo
(414, 179, 178, 3),          -- Valdebernardo - Pavones
(415, 179, 180, 3),          -- Valdebernardo - Vicálvaro
(416, 180, 179, 3),          -- Vicálvaro - Valdebernardo
(417, 180, 181, 1),          -- Vicálvaro - San Cipriano
(418, 181, 180, 1),          -- San Cipriano - Vicálvaro
(419, 181, 182, 2),          -- San Cipriano - Puerta de Arganda
(420, 182, 181, 2),          -- Puerta de Arganda - San Cipriano
(421, 182, 183, 7),          -- Puerta de Arganda - Rivas-Urbanizaciones
(422, 183, 182, 7),          -- Rivas-Urbanizaciones - Puerta de Arganda
(423, 183, 184, 4),          -- Rivas-Urbanizaciones - Rivas Futura
(424, 184, 183, 4),          -- Rivas Futura - Rivas-Urbanizaciones
(425, 184, 185, 2),          -- Rivas Futura - Rivas-Vaciamadrid
(426, 185, 184, 2),          -- Rivas-Vaciamadrid - Rivas Futura
(427, 185, 186, 4),          -- Rivas-Vaciamadrid - La Poveda
(428, 186, 185, 4),          -- La Poveda - Rivas-Vaciamadrid
(429, 186, 187, 4),          -- La Poveda - Arganda del Rey
(430, 187, 186, 4);          -- Arganda del Rey - La Poveda


-- Inserción de conexiones para la Línea 10
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(431, 188, 189, 3),          -- Hospital Infanta Sofía - Reyes Católicos
(432, 189, 188, 3),          -- Reyes Católicos - Hospital Infanta Sofía
(433, 189, 190, 2),          -- Reyes Católicos - Baunatal
(434, 190, 189, 2),          -- Baunatal - Reyes Católicos
(435, 190, 191, 1),          -- Baunatal - Manuel de Falla
(436, 191, 190, 1),          -- Manuel de Falla - Baunatal
(437, 191, 192, 3),          -- Manuel de Falla - Marqués de Valdavia
(438, 192, 191, 3),          -- Marqués de Valdavia - Manuel de Falla
(439, 192, 193, 3),          -- Marqués de Valdavia - La Moraleja
(440, 193, 192, 3),          -- La Moraleja - Marqués de Valdavia
(441, 193, 194, 3),          -- La Moraleja - La Granja
(442, 194, 193, 3),          -- La Granja - La Moraleja
(443, 194, 195, 3),          -- La Granja - Ronda de la Comunicación
(444, 195, 194, 3),          -- Ronda de la Comunicación - La Granja
(445, 195, 196, 2),          -- Ronda de la Comunicación - Las Tablas
(446, 196, 195, 2),          -- Las Tablas - Ronda de la Comunicación
(447, 196, 197, 6),          -- Las Tablas - Montecarmelo
(448, 197, 196, 6),          -- Montecarmelo - Las Tablas
(449, 197, 198, 1),          -- Montecarmelo - Tres Olivos
(450, 198, 197, 1),          -- Tres Olivos - Montecarmelo
(451, 198, 199, 2),          -- Tres Olivos - Fuencarral
(452, 199, 198, 2),          -- Fuencarral - Tres Olivos
(453, 199, 200, 3),          -- Fuencarral - Begoña
(454, 200, 199, 3),          -- Begoña - Fuencarral
(455, 200, 3, 2),            -- Begoña - Chamartín
(456, 3, 200, 2),            -- Chamartín - Begoña
(457, 3, 4, 2),              -- Chamartín - Plaza de Castilla
(458, 4, 3, 2),              -- Plaza de Castilla - Chamartín
(459, 4, 201, 2),            -- Plaza de Castilla - Cuzco
(460, 201, 4, 2),            -- Cuzco - Plaza de Castilla
(461, 201, 202, 1),          -- Cuzco - Santiago Bernabéu
(462, 202, 201, 1),          -- Santiago Bernabéu - Cuzco
(463, 202, 124, 2),          -- Santiago Bernabéu - Nuevos Ministerios
(464, 124, 202, 2),          -- Nuevos Ministerios - Santiago Bernabéu
(465, 124, 148, 2),          -- Nuevos Ministerios - Gregorio Marañón
(466, 148, 124, 2),          -- Gregorio Marañón - Nuevos Ministerios
(467, 148, 69, 2),           -- Gregorio Marañón - Alonso Martínez
(468, 69, 148, 2),           -- Alonso Martínez - Gregorio Marañón
(469, 69, 13, 1),            -- Alonso Martínez - Tribunal
(470, 13, 69, 1),            -- Tribunal - Alonso Martínez
(471, 13, 65, 2),            -- Tribunal - Plaza de España
(472, 65, 13, 2),            -- Plaza de España - Tribunal
(473, 65, 128, 1),           -- Plaza de España - Principe Pío
(474, 128, 65, 1),           -- Principe Pío - Plaza de España
(475, 128, 203, 3),          -- Principe Pío - Lago
(476, 203, 128, 3),          -- Lago - Principe Pío
(477, 203, 204, 4),          -- Lago - Batán
(478, 204, 203, 4),          -- Batán - Lago
(479, 204, 112, 2),          -- Batán - Casa de Campo
(480, 112, 204, 2),          -- Casa de Campo - Batán
(481, 112, 205, 2),          -- Casa de Campo - Colonia Jardín
(482, 205, 112, 2),          -- Colonia Jardín - Casa de Campo
(483, 205, 206, 4),          -- Colonia Jardín - Aviación Española
(484, 206, 205, 4),          -- Aviación Española - Colonia Jardín
(485, 206, 207, 2),          -- Aviación Española - Cuatro Vientos
(486, 207, 206, 2),          -- Cuatro Vientos - Aviación Española
(487, 207, 208, 7),          -- Cuatro Vientos - Joaquín Vilumbrales
(488, 208, 207, 7),          -- Joaquín Vilumbrales - Cuatro Vientos
(489, 208, 209, 1),          -- Joaquín Vilumbrales - Puerta del Sur
(490, 209, 208, 1);          -- Puerta del Sur - Joaquín Vilumbrales


-- Inserción de conexiones para la Línea 11
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(491, 116, 210, 2),          -- Plaza Elíptica - Abrantes
(492, 210, 116, 2),          -- Abrantes - Plaza Elíptica
(493, 210, 211, 1),          -- Abrantes - Pan Bendito
(494, 211, 210, 1),          -- Pan Bendito - Abrantes
(495, 211, 212, 1),          -- Pan Bendito - San Francisco
(496, 212, 211, 1),          -- San Francisco - Pan Bendito
(497, 212, 213, 3),          -- San Francisco - Carabanchel Alto
(498, 213, 212, 3),          -- Carabanchel Alto - San Francisco
(499, 213, 214, 2),          -- Carabanchel Alto - La Peseta
(500, 214, 213, 2),          -- La Peseta - Carabanchel Alto
(501, 214, 215, 5),          -- La Peseta - La Fortuna
(502, 215, 214, 5);          -- La Fortuna - La Peseta

-- Inserción de conexiones para la Línea 12
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(503, 209, 216, 1),          -- Puerta del Sur - Parque Lisboa
(504, 216, 209, 1),          -- Parque Lisboa - Puerta del Sur
(505, 216, 217, 2),          -- Parque Lisboa - Alcorcón Central
(506, 217, 216, 2),          -- Alcorcón Central - Parque Lisboa
(507, 217, 218, 2),          -- Alcorcón Central - Parque Oeste
(508, 218, 217, 2),          -- Parque Oeste - Alcorcón Central
(509, 218, 219, 4),          -- Parque Oeste - Universidad Rey Juan Carlos
(510, 219, 218, 4),          -- Universidad Rey Juan Carlos - Parque Oeste
(511, 219, 220, 2),          -- Universidad Rey Juan Carlos - Móstoles Central
(512, 220, 219, 2),          -- Móstoles Central - Universidad Rey Juan Carlos
(513, 220, 221, 1),          -- Móstoles Central - Pradillo
(514, 221, 220, 1),          -- Pradillo - Móstoles Central
(515, 221, 222, 1),          -- Pradillo - Hopital de Móstoles
(516, 222, 221, 1),          -- Hopital de Móstoles - Pradillo
(517, 222, 223, 2),          -- Hopital de Móstoles - Manuel Malasaña
(518, 223, 222, 2),          -- Manuel Malasaña - Hopital de Móstoles
(519, 223, 224, 4),          -- Manuel Malasaña - Loranca
(520, 224, 223, 4),          -- Loranca - Manuel Malasaña
(521, 224, 225, 3),          -- Loranca - Hospital de Fuenlabrada
(522, 225, 224, 3),          -- Hospital de Fuenlabrada - Loranca
(523, 225, 226, 1),          -- Hospital de Fuenlabrada - Parque Europa
(524, 226, 225, 1),          -- Parque Europa - Hospital de Fuenlabrada
(525, 226, 227, 1),          -- Parque Europa - Fuenlabrada Central
(526, 227, 226, 1),          -- Fuenlabrada Central - Parque Europa
(527, 227, 228, 2),          -- Fuenlabrada Central - Parque de los Estados
(528, 228, 227, 2),          -- Parque de los Estados - Fuenlabrada Central
(529, 228, 229, 4),          -- Parque de los Estados - Arroyo Culebro
(530, 229, 228, 4),          -- Arroyo Culebro - Parque de los Estados
(531, 229, 230, 1),          -- Arroyo Culebro - Conservatorio
(532, 230, 229, 1),          -- Conservatorio - Arroyo Culebro
(533, 230, 231, 2),          -- Conservatorio - Alonso de Mendoza
(534, 231, 230, 2),          -- Alonso de Mendoza - Conservatorio
(535, 231, 232, 2),          -- Alonso de Mendoza - Getafe Central
(536, 232, 231, 2),          -- Getafe Central - Alonso de Mendoza
(537, 232, 233, 1),          -- Getafe Central - Juan de la Cierva
(538, 233, 232, 1),          -- Juan de la Cierva - Getafe Central
(539, 233, 234, 2),          -- Juan de la Cierva - El Casar
(540, 234, 233, 2),          -- El Casar - Juan de la Cierva
(541, 234, 235, 1),          -- El Casar - Los Espartales
(542, 235, 234, 1),          -- Los Espartales - El Casar
(543, 235, 236, 2),          -- Los Espartales - El Bercial
(544, 236, 235, 2),          -- El Bercial - Los Espartales
(545, 236, 237, 2),          -- El Bercial - El Carrascal
(546, 237, 236, 2),          -- El Carrascal - El Bercial
(547, 237, 238, 1),          -- El Carrascal - Julián Besteiro
(548, 238, 237, 1),          -- Julián Besteiro - El Carrascal
(549, 238, 239, 2),          -- Julián Besteiro - Casa del Reloj
(550, 239, 238, 2),          -- Casa del Reloj - Julián Besteiro
(551, 239, 240, 2),          -- Casa del Reloj - Hospital Severo Ochoa
(552, 240, 239, 2),          -- Hospital Severo Ochoa - Casa del Reloj
(553, 240, 241, 1),          -- Hospital Severo Ochoa - Leganés Central
(554, 241, 240, 1),          -- Leganés Central - Hospital Severo Ochoa
(555, 241, 242, 2),          -- Leganés Central - San Nicasio
(556, 242, 241, 2);          -- San Nicasio - Leganés Central



-- Inserción de conexiones para la Línea RAMAL
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(557, 46, 128, 3),          -- Ópera - Príncipe Pío
(558, 128, 46, 3);          -- Príncipe Pío - Ópera


-- Inserción de conexiones para la Línea ML1
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(559, 1, 243, 1),          -- Pinar de Chamartín - Fuente de la Mora
(560, 243, 1, 1),          -- Fuente de la Mora - Pinar de Chamartín
(561, 243, 244, 2),        -- Fuente de la Mora - Virgen del Cortijo
(562, 244, 243, 2),        -- Virgen del Cortijo - Fuente de la Mora
(563, 244, 245, 2),        -- Virgen del Cortijo - Antonio Saura
(564, 245, 244, 2),        -- Antonio Saura - Virgen del Cortijo
(565, 245, 246, 1),        -- Antonio Saura - Álvarez de Villaamil
(566, 246, 245, 1),        -- Álvarez de Villaamil - Antonio Saura
(567, 246, 247, 2),        -- Álvarez de Villaamil - Blasco Ibáñez
(568, 247, 246, 2),        -- Blasco Ibáñez - Álvarez de Villaamil
(569, 247, 248, 2),        -- Blasco Ibáñez - María Tudor
(570, 248, 247, 2),        -- María Tudor - Blasco Ibáñez
(571, 248, 249, 3),        -- María Tudor - Palas de Rey
(572, 249, 248, 3),        -- Palas de Rey - María Tudor
(573, 249, 196, 2),        -- Palas de Rey - Las Tablas
(574, 196, 249, 2);        -- Las Tablas - Palas de Rey

-- Inserción de conexiones para la Línea ML2
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(575, 205, 250, 2),          -- Colonia Jardín - Prado de la Vega
(576, 250, 205, 2),          -- Prado de la Vega - Colonia Jardín
(577, 250, 251, 1),          -- Prado de la Vega - Colonia de los Ángeles
(578, 251, 250, 1),          -- Colonia de los Ángeles - Prado de la Vega
(579, 251, 252, 1),          -- Colonia de los Ángeles - Prado del Rey
(580, 252, 251, 1),          -- Prado del Rey - Colonia de los Ángeles
(581, 252, 253, 2),          -- Prado del Rey - Somosaguas Sur
(582, 253, 252, 2),          -- Somosaguas Sur - Prado del Rey
(583, 253, 254, 2),          -- Somosaguas Sur - Somosaguas Centro
(584, 254, 253, 2),          -- Somosaguas Centro - Somosaguas Sur
(585, 254, 255, 2),          -- Somosaguas Centro - Pozuelo Oeste
(586, 255, 254, 2),          -- Pozuelo Oeste - Somosaguas Centro
(587, 255, 256, 4),          -- Pozuelo Oeste - Bélgica
(588, 256, 255, 4),          -- Bélgica - Pozuelo Oeste
(589, 256, 257, 1),          -- Bélgica - Dos Castillas
(590, 257, 256, 1),          -- Dos Castillas - Bélgica
(591, 257, 258, 1),          -- Dos Castillas - Campus de Somosaguas
(592, 258, 257, 1),          -- Campus de Somosaguas - Dos Castillas
(593, 258, 259, 2),          -- Campus de Somosaguas - Avenida de Europa
(594, 259, 258, 2),          -- Avenida de Europa - Campus de Somosaguas
(595, 259, 260, 1),          -- Avenida de Europa - Berna
(596, 260, 259, 1),          -- Berna - Avenida de Europa
(597, 260, 261, 1),          -- Berna - Estación de Aravaca
(598, 261, 260, 1);          -- Estación de Aravaca - Berna

-- Inserción de conexiones para la Línea ML3
INSERT INTO conexiones (id, id_origen, id_destino, tiempo) VALUES
(599, 205, 262, 3),          -- Colonia Jardín - Ciudad de la Imagen
(600, 262, 205, 3),          -- Ciudad de la Imagen - Colonia Jardín
(601, 262, 263, 1),          -- Ciudad de la Imagen - José Isbert
(602, 263, 262, 1),          -- José Isbert - Ciudad de la Imagen
(603, 263, 264, 1),          -- José Isbert - Ciudad del Cine
(604, 264, 263, 1),          -- Ciudad del Cine - José Isbert
(605, 264, 265, 2),          -- Ciudad del Cine - Cocheras
(606, 265, 264, 2),          -- Cocheras - Ciudad del Cine
(607, 265, 266, 4),          -- Cocheras - Retamares
(608, 266, 265, 4),          -- Retamares - Cocheras
(609, 266, 267, 4),          -- Retamares - Montepríncipe
(610, 267, 266, 4),          -- Montepríncipe - Retamares
(611, 267, 268, 2),          -- Montepríncipe - Ventorro del Cano
(612, 268, 267, 2),          -- Ventorro del Cano - Montepríncipe
(613, 268, 269, 1),          -- Ventorro del Cano - Prado del Espino
(614, 269, 268, 1),          -- Prado del Espino - Ventorro del Cano
(615, 269, 270, 3),          -- Prado del Espino - Cantabria
(616, 270, 269, 3),          -- Cantabria - Prado del Espino
(617, 270, 271, 5),          -- Cantabria - Ferial de Boadilla
(618, 271, 270, 5),          -- Ferial de Boadilla - Cantabria
(619, 271, 272, 2),          -- Ferial de Boadilla - Boadilla Centro
(620, 272, 271, 2),          -- Boadilla Centro - Ferial de Boadilla
(621, 272, 273, 2),          -- Boadilla Centro - Nuevo Mundo
(622, 273, 272, 2),          -- Nuevo Mundo - Boadilla Centro
(623, 273, 274, 1),          -- Nuevo Mundo - Siglo XXI
(624, 274, 273, 1),          -- Siglo XXI - Nuevo Mundo
(625, 274, 275, 2),          -- Siglo XXI - Infante Don Luis
(626, 275, 274, 2),          -- Infante Don Luis - Siglo XXI
(627, 275, 276, 1),          -- Infante Don Luis - Puerta de Boadilla
(628, 276, 275, 1);          -- Puerta de Boadilla - Infante Don Luis