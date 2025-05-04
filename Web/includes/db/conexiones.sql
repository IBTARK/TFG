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
(65, 9, 34), -- Cuatro Caminos - Canal
(66, 34, 9), -- Canal - Cuatro Caminos
(67, 34, 35), -- Canal - Quevedo
(68, 35, 34), -- Quevedo - Canal
(69, 35, 36), -- Quevedo - San Bernardo
(70, 36, 35), -- San Bernardo - Quevedo
(71, 36, 37), -- San Bernardo - Noviciado
(72, 37, 36), -- Noviciado - San Bernardo
(73, 37, 38), -- Noviciado - Santo Domingo 
(74, 38, 37), -- Santo Domingo - Noviciado
(75, 38, 39), -- Santo Domingo - Ópera
(76, 39, 38), -- Ópera - Santo Domingo
(77, 39, 15), -- Ópera - Sol
(78, 15, 39), -- Sol - Ópera
(79, 15, 40), -- Sol - Sevilla
(80, 40, 15), -- Sevilla - Sol
(81, 40, 41), -- Sevilla - Banco de España
(82, 41, 40), -- Banco de España - Sevilla
(83, 41, 42), -- Banco de España - Retiro
(84, 42, 41), -- Retiro - Banco de España 
(85, 42, 43), -- Retiro - Príncipe de Vergara
(86, 43, 42), -- Principe de Vergara - Retiro
(87, 43, 44), -- Príncipe de Vergara - Goya
(88, 44, 43), -- Goya - Príncipe de Vergara
(89, 44, 45), -- Goya - Manuel Becerra
(90, 45, 44), -- Manuel Becerra - Goya
(91, 45, 46), -- Manuel Becerra - Ventas
(92, 46, 45), -- Ventas - Manuel Becerra
(93, 46, 47), -- Ventas - La Elipa
(94, 47, 46), -- La Elipa - Ventas
(95, 47, 48), -- La Elipa - La Almudena
(96, 48, 47), -- La Almudena - La Elipa
(97, 48, 49), -- La Almudena - Alsacia
(98, 49, 48), -- Alsacia - La Almudena
(99, 49, 50), -- Alsacia - Avenida de Guadalajara
(100, 50, 49), -- Avenida de Guadalajara - Alsacia
(101, 50, 51), -- Avenida de Guadalajara - Las Rosas
(102, 51, 50); -- Las Rosas - Avenida de Guadalajara

-- Linea 3
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(103, 52, 53), -- Moncloa - Argüelles
(104, 53, 52), -- Argüelles - Moncloa
(105, 53, 54), -- Argüelles - Ventura Rodríguez
(106, 54, 53), -- Ventura Rodríguez - Argüelles
(107, 54, 55), -- Ventura Rodríguez - Plaza de España
(108, 55, 54), -- Plaza de España - Ventura Rodríguez
(109, 55, 56), -- Plaza de España - Callao
(110, 56, 55), -- Callao - Plaza de España
(111, 56, 15), -- Callao - Sol
(112, 15, 56), -- Sol - Callao
(113, 15, 57), -- Sol - Lavapiés
(114, 57, 15), -- Lavapiés - Sol
(115, 57, 58), -- Lavapiés - Embajadores
(116, 58, 57), -- Embajadores - Lavapiés
(117, 58, 59), -- Embajadores - Palos de la Frontera
(118, 59, 58), -- Palos de la Frontera - Embajadores
(119, 59, 60), -- Palos de la Frontera - Delicias
(120, 60, 59), -- Delicias - Palos de la Frontera
(121, 60, 61), -- Delicias - Legazpi
(122, 61, 60), -- Legazpi - Delicias
(123, 61, 62), -- Legazpi - Almendrales
(124, 62, 61), -- Almendrales - Legazpi
(125, 62, 63), -- Almendrales - Hospital 12 de Octubre
(126, 63, 62), -- Hospital 12 de Octubre - Almendrales
(127, 63, 64), -- Hospital 12 de Octubre - San Fermín-Orcasur
(128, 64, 63), -- San Fermín-Orcasur - Hospital 12 de Octubre
(129, 64, 65), -- San Fermín-Orcasur - Ciudad de los Ángeles
(130, 65, 64), -- Ciudad de los Ángeles - San Fermín-Orcasur
(131, 65, 66), -- Ciudad de los Ángeles - Villaverde Bajo-Cruce
(132, 66, 65), -- Villaverde Bajo-Cruce - Ciudad de los Ángeles
(133, 66, 67), -- Villaverde Bajo-Cruce - San Cristóbal
(134, 67, 66), -- San Cristóbal - Villaverde Bajo-Cruce
(135, 67, 68), -- San Cristóbal - Villaverde Alto
(136, 68, 67), -- Villaverde Alto - San Cristóbal
(137, 68, 69), -- Villaverde ALto - El Casar
(138, 69, 68); -- El Casar - Villaverde Alto

--Linea 4
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(139, 53, 36), -- Argüelles - San Bernardo
(140, 36, 53), -- San Bernardo - Argüelles
(141, 36, 12), -- San Bernardo - Bilbao
(142, 12, 36), -- Bilbao - San Bernardo
(143, 12, 70), -- Bilbao - Alonso Martínez
(144, 70, 12), -- Alonso Martínez - Bilbao
(145, 70, 71), -- Alonso Martínez - Colón
(146, 71, 70), -- Colón - Alonso Martínez
(147, 71, 72), -- Colón - Serrano
(148, 72, 71), -- Serrano - Colón
(149, 72, 73), -- Serrano - Velázquez
(150, 73, 72), -- Velázquez - Serrano
(151, 73, 44), -- Velázquez - Goya
(152, 44, 73), -- Goya - Velázquez
(153, 44, 74), -- Goya - Lista
(154, 74, 44), -- Lista - Goya
(155, 74, 75), -- Lista - Diego de León
(156, 75, 74), -- Diego de León - Lista
(157, 75, 76), -- Diego de León - Avenida de América
(158, 76, 75), -- Avenida de América - Diego de León
(159, 76, 77), -- Avenida de América - Prosperidad
(160, 77, 76), -- Prosperidad - Avenida de América
(161, 77, 78), -- Prosperidad - Alfonso XIII
(162, 78, 77), -- Alfonso XIII - Prosperidad
(163, 78, 79), -- Alfonso XIII - Avenida de la Paz
(164, 79, 78), -- Avenida de la Paz - Alfonso XIII
(165, 79, 80), -- Avenida de la Paz - Arturo Soria
(166, 80, 79), -- Arturo Soria - Avenida de la Paz
(167, 80, 81), -- Arturo Soria - Esperanza
(168, 81, 80), -- Esperanza - Arturo Soria
(169, 81, 82), -- Esperanza - Canillas
(170, 82, 81), -- Canillas - Esperanza
(171, 82, 83), -- Canillas - Mar de Cristal
(172, 83, 82), -- Mar de Cristal - Canillas
(173, 83, 84), -- Mar de Cristal - San Lorenzo
(174, 84, 83), -- San Lorenzo - Mar de Cristal
(175, 84, 85), -- San Lorenzo - Parque de Santa María
(176, 85, 84), -- Parque de Santa María - San Lorenzo
(177, 85, 86), -- Parque de Santa María - Hortaleza
(178, 86, 85), -- Hortaleza - Parque de Santa María
(179, 86, 87), -- Hortaleza - Manoteras
(180, 87, 86), -- Manoteras - Hortaleza
(181, 87, 1), -- Manoteras - Pinar de Chamartín
(182, 1, 87); -- Pinar de Chamartín - Manoteras

--Linea 5
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(183, 88, 89), -- Alameda de Osuna - El Capricho
(184, 89, 88), -- El Capricho - Alameda de Osuna
(185, 89, 90), -- El Capricho - Canillejas
(186, 90, 89), -- Canillejas - El Capricho
(187, 90, 91), -- Canillejas - Torre Arias 
(188, 91, 90), -- Torre Arias - Canillejas
(189, 91, 92), -- Torre Arias - Suanzes
(190, 92, 91), -- Suanzes - Torre Arias
(191, 92, 93), -- Suanzes - Ciudad Lineal
(192, 93, 92), -- Ciudad Lineal - Suanzes
(193, 93, 94), -- Ciudad Lineal - Pueblo Nuevo
(194, 94, 93), -- Pueblo Nuevo - Ciudad Lineal
(195, 94, 95), -- Pueblo Nuevo - Quintana
(196, 95, 94), -- Quintana - Pueblo Nuevo
(197, 95, 96), -- Quintana - El Carmen
(198, 96, 95), -- El Carmen - Quintana
(199, 96, 46), -- El Carmen - Ventas
(200, 46, 96), -- Ventas - El Carmen
(201, 46, 75), -- Ventas - Diego de León
(202, 75, 46), -- Diego de León - Ventas
(203, 75, 97), -- Diego de León - Núñez de Balboa
(204, 97, 75), -- Núñez de Balboa - Diego de León
(205, 97, 98), -- Núñez de Balboa - Rubñen Darío
(206, 98, 97), -- Rubén Darío - Núñez de Balboa
(207, 98, 70), -- Rubén Darío - Alonso Martínez
(208, 70, 98), -- Alonso Martínez - Rubén Darío
(209, 70, 99), -- Alonso Martínez - Chueca
(210, 99, 70), -- Chueca - Alonso Martínez
(211, 99, 14), -- Chueca - Gran Vía
(212, 14, 99), -- Gran Vía - Chueca
(213, 14, 56), -- Gran Vía - Callao
(214, 56, 14), -- Callao - Gran Vía
(215, 56, 39), -- Callao - Ópera
(216, 39, 56), -- Opera - Callao
(217, 39, 100), -- Opera - La Latina
(218, 100, 39), -- La Latina - Ópera
(219, 100, 101), -- La Latina - Puerta de Toledo
(220, 101, 100), -- Puerta de Toledo - La Latina
(221, 101, 58), -- Puerta de Toledo - Acacias (misma estación que Embajadores)
(222, 58, 101), -- Acacias - Puerta de Toledo
(223, 58, 102), -- Acacias - Pirámides
(224, 102, 58), -- Pirámides - Acacias
(225, 102, 103), -- Pirámides - Marqués de Vadillo
(226, 103, 102), -- Marqués de Vadillo - Pirámides
(227, 103, 104), -- Marqués de Vadillo - Urgel
(228, 104, 103), -- Urgel - Marqués de Vadillo
(229, 104, 105), -- Urgel - Oporto
(230, 105, 104), -- Oporto - Urgel
(231, 105, 106), -- Oporto - Vista Alegre
(232, 106, 105), -- Vista Alegre - Oporto
(233, 106, 107), -- Vista Alegre - Carabanchel
(234, 107, 106), -- Carabanchel - Vista Alegre
(235, 107, 108), -- Carabanchel - Eugenia de Montijo
(236, 108, 107), -- Eugenia de Montijo - Carabanchel
(237, 108, 109), -- Eugenia de Montijo - Aluche
(238, 109, 108), -- Aluche - Eugenia de Montijo
(239, 109, 110), -- Aluche - Empalme
(240, 110, 109), -- Empalme - Aluche
(241, 110, 111), -- Empalme - Campamento
(242, 111, 110), -- Campamento - Empalme
(243, 111, 112), -- Campamento - Casa de Campo
(244, 112, 111); -- Casa de Campo - Campamento

--Linea 6
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(245, 115, 116),
(246, 116, 115),
(247, 116, 107),
(248, 107, 116),
(249, 107, 117),
(250, 117, 107),
(251, 117, 118),
(252, 118, 117),
(253, 118, 119),
(254, 119, 118),
(255, 119, 63),
(256, 63, 119),
(257, 63, 120),
(258, 120, 63),
(259, 120, 121),
(260, 121, 120),
(261, 121, 22),
(262, 22, 121),
(263, 22, 122),
(264, 122, 22),
(265, 122, 123),
(266, 123, 122),
(267, 123, 124),
(268, 124, 123),
(269, 124, 46),
(270, 46, 124),
(271, 46, 77),
(272, 77, 46),
(273, 77, 78),
(274, 78, 77),
(275, 78, 125),
(276, 125, 78),
(277, 125, 126),
(278, 126, 125),
(279, 126, 9),
(280, 9, 126),
(281, 9, 127),
(282, 127, 9),
(283, 127, 128),
(284, 128, 127),
(285, 128, 129),
(286, 129, 128),
(287, 129, 53),
(288, 53, 129),
(289, 53, 54),
(290, 54, 53),
(291, 54, 130),
(292, 130, 54),
(293, 130, 131),
(294, 131, 130),
(295, 131, 132),
(296, 132, 131),
(297, 132, 133),
(298, 133, 132),
(299, 133, 115),
(300, 115, 133);

--Linea 7
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(301, 134, 135),
(302, 135, 134),
(303, 135, 136),
(304, 136, 135),
(305, 136, 137),
(306, 137, 136),
(307, 137, 138),
(308, 138, 137),
(309, 138, 139),
(310, 139, 138),
(311, 139, 140),
(312, 140, 139),
(313, 140, 141),
(314, 141, 140),
(315, 141, 142),
(316, 142, 141),
(317, 142, 143),
(318, 143, 142),
(319, 143, 144),
(320, 144, 143),
(321, 144, 145),
(322, 145, 144),
(323, 145, 146),
(324, 146, 145),
(325, 146, 96),
(326, 96, 146),
(327, 96, 147),
(328, 147, 96),
(329, 147, 148),
(330, 148, 147),
(331, 148, 149),
(332, 149, 148),
(333, 149, 78),
(334, 78, 149),
(335, 78, 150),
(336, 150, 78),
(337, 150, 151),
(338, 151, 150),
(339, 151, 35),
(340, 35, 151),
(341, 35, 152),
(342, 152, 35),
(343, 152, 127),
(344, 127, 152),
(345, 127, 153),
(346, 153, 127),
(347, 153, 154),
(348, 154, 153),
(349, 154, 155),
(350, 155, 154),
(351, 155, 156),
(352, 156, 155),
(353, 156, 157),
(354, 157, 156),
(355, 157, 158),
(356, 158, 157),
(357, 158, 159),
(358, 159, 158),
(359, 159, 160),
(360, 160, 159);

--Linea 8
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(361, 124, 159),          -- Nuevos Ministerios - Colombia
(362, 159, 124),          -- Colombia - Nuevos Ministerios
(363, 159, 160),          -- Colombia - Pinar del Rey
(364, 160, 159),          -- Pinar del Rey - Colombia 
(365, 160, 82),          -- Pinar del Rey - Mar de Cristal
(366, 82, 160),          -- Mar de Cristal - Pinar del Rey
(367, 82, 161),          -- Mar de Cristal - Feria de Madrid
(368, 161, 82),          -- Feria de Madrid - Mar de Cristal
(369, 161, 162),          -- Feria de Madrid - Aeropuerto T1-T2-T3
(370, 162, 161),          -- Aeropuerto T1-T2-T3 - Feria de Madrid
(371, 162, 163),          -- Aeropuerto T1-T2-T3 - Barajas
(372, 163, 162),          -- Barajas - Aeropuerto T1-T2-T3
(373, 163, 164),          -- Barajas - Aeropuerto T4
(374, 164, 163);          -- Aeropuerto T4 - Barajas

-- Línea 9
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(375, 165, 166),          -- Paco de Lucia - Mirasierra
(376, 166, 165),          -- Mirasierra - Paco de Lucia
(377, 166, 167),          -- Mirasierra - Herrera Oria
(378, 167, 166),          -- Herrera Oria - Mirasierra
(379, 167, 168),          -- Herrera Oria - Barrio del Pilar
(380, 168, 167),          -- Barrio del Pilar - Herrera Oria
(381, 168, 169),          -- Barrio del Pilar - Ventilla
(382, 169, 168),          -- Ventilla - Barrio del Pilar
(383, 169, 4),          -- Ventilla - Plaza Castilla
(384, 4, 169),          -- Plaza Castilla - Ventilla
(385, 4, 170),          -- Plaza Castilla - Duque de Pastrana
(386, 170, 4),          -- Duque de Pastrana - Plaza Castilla
(387, 170, 171),          -- Duque de Pastrana - Pío  XII
(388, 171, 170),          -- Pío  XII - Duque de Pastrana
(389, 171, 159),          -- Pío  XII - Colombia
(390, 159, 171),          -- Colombia - Pío  XII
(391, 159, 172),          -- Colombia - Concha Espina
(392, 172, 159),          -- Concha Espina - Colombia
(393, 172, 173),          -- Concha Espina - Cruz del Rayo
(394, 173, 172),          -- Cruz del Rayo - Concha Espina
(395, 173, 75),          -- Cruz del Rayo - Avenida de América
(396, 75, 173),          -- Avenida de América - Cruz del Rayo
(397, 75, 96),          -- Avenida de América - Núñez de Balboa
(398, 96, 75),          -- Núñez de Balboa - Avenida de América
(399, 96, 42),          -- Núñez de Balboa - Príncipe de Vergara
(400, 42, 96),          -- Príncipe de Vergara - Núñez de Balboa
(401, 42, 174),          -- Príncipe de Vergara - Ibiza
(402, 174, 42),          -- Ibiza - Príncipe de Vergara
(403, 174, 121),          -- Ibiza - Sainz de Baranda
(404, 121, 174),          -- Sainz de Baranda - Ibiza
(405, 121, 175),          -- Sainz de Baranda - Estrella
(406, 175, 121),          -- Estrella - Sainz de Baranda
(407, 175, 176),          -- Estrella - Vinateros
(408, 176, 175),          -- Vinateros - Estrella
(409, 176, 177),          -- Vinateros - Artilleros
(410, 177, 176),          -- Artilleros - Vinateros
(411, 177, 178),          -- Artilleros - Pavones
(412, 178, 177),          -- Pavones - Artilleros
(413, 178, 179),          -- Pavones - Valdebernardo
(414, 179, 178),          -- Valdebernardo - Pavones
(415, 179, 180),          -- Valdebernardo - Vicálvaro
(416, 180, 179),          -- Vicálvaro - Valdebernardo
(417, 180, 181),          -- Vicálvaro - San Cipriano
(418, 181, 180),          -- San Cipriano - Vicálvaro
(419, 181, 182),          -- San Cipriano - Puerta de Arganda
(420, 182, 181),          -- Puerta de Arganda - San Cipriano
(421, 182, 183),          -- Puerta de Arganda - Rivas-Urbanizaciones
(422, 183, 182),          -- Rivas-Urbanizaciones - Puerta de Arganda
(423, 183, 184),          -- Rivas-Urbanizaciones - Rivas Futura
(424, 184, 183),          -- Rivas Futura - Rivas-Urbanizaciones
(425, 184, 185),          -- Rivas Futura - Rivas-Vaciamadrid
(426, 185, 184),          -- Rivas-Vaciamadrid - Rivas Futura
(427, 185, 186),          -- Rivas-Vaciamadrid - La Poveda
(428, 186, 185),          -- La Poveda - Rivas-Vaciamadrid
(429, 186, 187),          -- La Poveda - Arganda del Rey
(430, 187, 186);          -- Arganda del Rey - La Poveda

-- Inserción de conexiones para la Línea 10
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(431, 188, 189),          -- Hospital Infanta Sofía - Reyes Católicos
(432, 189, 188),          -- Reyes Católicos - Hospital Infanta Sofía
(433, 189, 190),          -- Reyes Católicos - Baunatal
(434, 190, 189),          -- Baunatal - Reyes Católicos
(435, 190, 191),          -- Baunatal - Manuel de Falla
(436, 191, 190),          -- Manuel de Falla - Baunatal
(437, 191, 192),          -- Manuel de Falla - Marqués de Valdavia
(438, 192, 191),          -- Marqués de Valdavia - Manuel de Falla
(439, 192, 193),          -- Marqués de Valdavia - La Moraleja
(440, 193, 192),          -- La Moraleja - Marqués de Valdavia
(441, 193, 194),          -- La Moraleja - La Granja
(442, 194, 193),          -- La Granja - La Moraleja
(443, 194, 195),          -- La Granja - Ronda de la Comunicación
(444, 195, 194),          -- Ronda de la Comunicación - La Granja
(445, 195, 196),          -- Ronda de la Comunicación - Las Tablas
(446, 196, 195),          -- Las Tablas - Ronda de la Comunicación
(447, 196, 197),          -- Las Tablas - Montecarmelo
(448, 197, 196),          -- Montecarmelo - Las Tablas
(449, 197, 198),          -- Montecarmelo - Tres Olivos
(450, 198, 197),          -- Tres Olivos - Montecarmelo
(451, 198, 199),          -- Tres Olivos - Fuencarral
(452, 199, 198),          -- Fuencarral - Tres Olivos
(453, 199, 200),          -- Fuencarral - Begoña
(454, 200, 199),          -- Begoñaa - Fuencarral
(455, 200, 3),          -- Begoña - Chamartín
(456, 3, 200),          -- Chamartín - Begoña
(457, 3, 4),          -- Chamartín - Plaza de Castilla
(458, 4, 3),          -- Plaza de Castilla - Chamartín
(459, 4, 201),          -- Plaza de Castilla - Cuzco
(460, 201, 4),          -- Cuzco - Plaza de Castilla
(461, 201, 202),          -- Cuzco - Santiago Bernabéu
(462, 202, 201),          -- Santiago Bernabéu - Cuzco
(463, 202, 124),          -- Santiago Bernabéu - Nuevos Ministerios
(464, 124, 202),          -- Nuevos Ministerios - Santiago Bernabéu
(465, 124, 148),          -- Nuevos Ministerios - Gregorio Marañón
(466, 148, 124),          -- Gregorio Marañón - Nuevos Ministerios
(467, 148, 69),          -- Gregorio Marañón - Alonso Martínez
(468, 69, 148),          -- Alonso Martínez - Gregorio Marañón
(469, 69, 13),          -- Alonso Martínez - Tribunal
(470, 13, 69),          -- Tribunal - Alonso Martínez
(471, 13, 65),          -- Tribunal - Plaza de España
(472, 65, 13),          -- Plaza de España - Tribunal
(473, 65, 128),          -- Plaza de España - Principe Pío
(474, 128, 65),          -- Principe Pío - Plaza de España
(475, 128, 203),          -- Principe Pío - Lago
(476, 203, 128),          -- Lago - Principe Pío
(477, 203, 204),          -- Lago - Batán
(478, 204, 203),          -- Batán - Lago
(479, 204, 112),          -- Batán - Casa de Campo
(480, 112, 204),          -- Casa de Campo - Batán
(481, 112, 205),          -- Casa de Campo - Colonia Jardín
(482, 205, 112),          -- Colonia Jardín - Casa de Campo
(483, 205, 206),          -- Colonia Jardín - Aviación Española
(484, 206, 205),          -- Aviación Española - La Poveda
(485, 206, 207),          -- Aviación Española - Cuatro Vientos
(486, 207, 206),          -- Cuatro Vientos - Aviación Española
(487, 207, 208),          -- Cuatro Vientos - Joaquín Vilumbrales
(488, 208, 207),          -- Joaquín Vilumbrales - Cuatro Vientos
(489, 208, 209),          -- Joaquín Vilumbrales - Puerta del Sur
(490, 209, 208);          -- Puerta del Sur - Joaquín Vilumbrales


-- Inserción de conexiones para la Línea 11
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(491, 116, 210),          -- Plaza Elíptica - Abrantes
(492, 210, 116),          -- Abrantes - Plaza Elíptica
(493, 210, 211),          -- Abrantes - Pan Bendito
(494, 211, 210),          -- Pan Bendito - Abrantes
(495, 211, 212),          -- Pan Bendito - San Francisco
(496, 212, 211),          -- San Francisco - Pan Bendito
(497, 212, 213),          -- San Francisco - Carabanchel Alto
(498, 213, 212),          -- Carabanchel Alto - San Francisco
(499, 213, 214),          -- Carabanchel Alto - La Peseta
(500, 214, 213),          -- La Peseta - Carabanchel Alto
(501, 214, 215),          -- La Peseta - La Fortuna
(502, 215, 214);          -- La Fortuna - La Peseta

-- Inserción de conexiones para la Línea 12
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(503, 209, 216),          -- Puerta del Sur - Parque Lisboa
(504, 216, 209),          -- Parque Lisboa - Puerta del Sur
(505, 216, 217),          -- Parque Lisboa - Alcorcón Central
(506, 217, 216),          -- Alcorcón Central - Parque Lisboa
(507, 217, 218),          -- Alcorcón Central - Parque Oeste
(508, 218, 217),          -- Parque Oeste - Alcorcón Central
(509, 218, 219),          -- Parque Oeste - Universidad Rey Juan Carlos
(510, 219, 218),          -- Universidad Rey Juan Carlos - Parque Oeste
(511, 219, 220),          -- Universidad Rey Juan Carlos - Móstoles Central
(512, 220, 219),          -- Móstoles Central - Universidad Rey Juan Carlos
(513, 220, 221),          -- Móstoles Central - Pradillo
(514, 221, 220),          -- Pradillo - Móstoles Central
(515, 221, 222),          -- Pradillo - Hospital de Móstoles
(516, 222, 221),          -- Hospital de Móstoles - Pradillo
(517, 222, 223),          -- Hospital de Móstoles - Manuel Malasaña
(518, 223, 222),          -- Manuel Malasaña - Hopital de Móstoles
(519, 223, 224),          -- Manuel Malasaña - Loranca
(520, 224, 223),          -- Loranca - Manuel Malasaña
(521, 224, 225),          -- Loranca - Hospital de Fuenlabrada
(522, 225, 224),          -- Hospital de Fuenlabrada - Loranca
(523, 225, 226),          -- Hospital de Fuenlabrada - Parque Europa
(524, 226, 225),          -- Parque Europa - Hospital de Fuenlabrada
(525, 226, 227),          -- Parque Europa - Fuenlabrada Central
(526, 227, 226),          -- Fuenlabrada Central - Parque Europa
(527, 227, 228),          -- Fuenlabrada Central - Parque de los Estados
(528, 228, 227),          -- Parque de los Estados - Fuenlabrada Central
(529, 228, 229),          -- Parque de los Estados - Arroyo Culebro
(530, 229, 228),          -- Arroyo Culebro - Parque de los Estados
(531, 229, 230),          -- Arroyo Culebro - Conservatorio
(532, 230, 229),          -- Conservatorio - Arroyo Culebro
(533, 230, 231),          -- Conservatorio - Alonso de Mendoza
(534, 231, 230),          -- Alonso de Mendoza - Conservatorio
(535, 231, 232),          -- Alonso de Mendoza - Getafe Central
(536, 232, 231),          -- Getafe Central - Alonso de Mendoza
(537, 232, 233),          -- Getafe Central - Juan de la Cierva
(538, 233, 232),          -- Juan de la Cierva - Getafe Central
(539, 233, 234),          -- Juan de la Cierva - El Casar
(540, 234, 233),          -- El Casar - Juan de la Cierva
(541, 234, 235),          -- El Casar - Los Espartales
(542, 235, 234),          -- Los Espartales - El Casar
(543, 235, 236),          -- Los Espartales - El Bercial
(544, 236, 235),          -- El Bercial - Los Espartales
(545, 236, 237),          -- El Bercial - El Carrascal
(546, 237, 236),          -- El Carrascal - El Bercial
(547, 237, 238),          -- El Carrascal - Julián Besteiro
(548, 238, 237),          -- Julián Besteiro - El Carrascal
(549, 238, 239),          -- Julián Besteiro - Casa del Reloj
(550, 239, 238),          -- Casa del Reloj - Julián Besteiro
(551, 239, 240),          -- Casa del Reloj - Hospital Severo Ochoa
(552, 240, 239),          -- Hospital Severo Ochoa - Casa del Reloj
(553, 240, 241),          -- Hospital Severo Ochoa - Leganés Central
(554, 241, 240),          -- Leganés Central - Hospital Severo Ochoa
(555, 241, 242),          -- Leganés Central - San Nicasio
(556, 242, 241);          -- San Nicasio - Leganés Central

-- Inserción de conexiones para la Línea RAMAL
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(557, 46, 128),          -- Ópera - Príncipe Pío
(558, 128, 46);          -- Príncipe Pío - Ópera

-- Inserción de conexiones para la Línea ML1
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(559, 1, 243),          -- Pinar de Chamartín - Fuente de la Mora
(560, 243, 1),          -- Fuente de la Mora - Pinar de Chamartín
(561, 243, 244),          -- Fuente de la Mora - Virgen del Cortijo
(562, 244, 243),          -- Virgen del Cortijo - Fuente de la Mora
(563, 244, 245),          -- Virgen del Cortijo - Antonio Saura
(564, 245, 244),          -- Antonio Saura - Virgen del Cortijo
(565, 245, 246),          -- Antonio Saura - Álvarez de Villaamil
(566, 246, 245),          -- Álvarez de Villaamil - Antonio Saura
(567, 246, 247),          -- Álvarez de Villaamil - Blasco Ibáñez
(568, 247, 246),          -- Blasco Ibáñez - Álvarez de Villaamil
(569, 247, 248),          -- Blasco Ibáñez - María Tudor
(570, 248, 247),          -- María Tudor - Blasco Ibáñez
(571, 248, 249),          -- María Tudor - Palas de Rey
(572, 249, 248),          -- Palas de Rey - María Tudor
(573, 249, 196),          -- Palas de Rey - Las Tablas
(574, 196, 249);          -- Las Tablas - Palas de Rey

-- Inserción de conexiones para la Línea ML2
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(575, 205, 250),          -- Colonia Jardín - Prado de la Vega
(576, 250, 205),          -- Prado de la Vega - Colonia Jardín
(577, 250, 251),          -- Prado de la Vega - Colonia de los Ángeles
(578, 251, 250),          -- Colonia de los Ángeles - Prado de la Vega
(579, 251, 252),          -- Colonia de los Ángeles - Prado del Rey
(580, 252, 251),          -- Prado del Rey - Colonia de los Ángeles
(581, 252, 253),          -- Prado del Rey - Somosaguas Sur
(582, 253, 252),          -- Somosaguas Sur - Prado del Rey
(583, 253, 254),          -- Somosaguas Sur - Somosaguas Centro
(584, 254, 253),          -- Somosaguas Centro - Somosaguas Sur
(585, 254, 255),          -- Somosaguas Centro - Pozuelo Oeste
(586, 255, 254),          -- Pozuelo Oeste - Somosaguas Centro
(587, 255, 256),          -- Pozuelo Oeste - Bélgica
(588, 256, 255),          -- Bélgica - Pozuelo Oeste
(589, 256, 257),          -- Bélgica - Dos Castillas
(590, 257, 256),          -- Dos Castillas - Bélgica
(591, 257, 258),          -- Dos Castillas - Campus de Somosaguas
(592, 258, 257),          -- Campus de Somosaguas - Dos Castillas
(593, 258, 259),          -- Campus de Somosaguas - Avenida de Europa
(594, 259, 258),          -- Avenida de Europa - Campus de Somosaguas
(595, 259, 260),          -- Avenida de Europa - Berna
(596, 260, 259),          -- Berna - Avenida de Europa
(597, 260, 261),          -- Berna - Estación de Aravaca
(598, 261, 260);          -- Estación de Aravaca - Berna

-- Inserción de conexiones para la Línea ML3
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(599, 205, 262),          -- Colonia Jardín - Ciudad de la Imagen
(600, 262, 205),          -- Ciudad de la Imagen - Colonia Jardín
(601, 262, 263),          -- Ciudad de la Imagen - José Isbert
(602, 263, 262),          -- José Isbert - Ciudad de la Imagen
(603, 263, 264),          -- José Isbert - Ciudad del Cine
(604, 264, 263),          -- Ciudad del Cine - José Isbert
(605, 264, 265),          -- Ciudad del Cine - Cocheras
(606, 265, 264),          -- Cocheras - Ciudad del Cine
(607, 265, 266),          -- Cocheras - Retamares
(608, 266, 265),          -- Retamares - Cocheras
(609, 266, 267),          -- Retamares - Montepríncipe
(610, 267, 266),          -- Montepríncipe - Retamares
(611, 267, 268),          -- Montepríncipe - Ventorro del Cano
(612, 268, 267),          -- Ventorro del Cano - Montepríncipe
(613, 268, 269),          -- Ventorro del Cano - Prado del Espino
(614, 269, 268),          -- Prado del Espino - Ventorro del Cano
(615, 269, 270),          -- Prado del Espino - Cantabria
(616, 270, 269),          -- Cantabria - Prado del Espino
(617, 270, 271),          -- Cantabria - Ferial de Boadilla
(618, 271, 270),          -- Ferial de Boadilla - Cantabria
(619, 271, 272),          -- Ferial de Boadilla - Boadilla Centro
(620, 272, 271),          -- Boadilla Centro - Ferial de Boadilla
(621, 272, 273),          -- Boadilla Centro - Nuevo Mundo
(622, 273, 272),          -- Nuevo Mundo - Boadilla Centro
(623, 273, 274),          -- Nuevo Mundo - Siglo XXI
(624, 274, 273),          -- Siglo XXI - Nuevo Mundo
(625, 274, 275),          -- Siglo XXI - Infante Don Luis
(626, 275, 274),          -- Infante Don Luis - Siglo XXI
(627, 275, 276),          -- Infante Don Luis - Puerta de Boadilla
(628, 276, 275);          -- Puerta de Boadilla - Infante Don Luis