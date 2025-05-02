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
(1, 1, 2, 3), 
(2, 2, 1, 4),
(3, 2, 3, 2),
(4, 3, 2, 2),
(5, 3, 4, 2),
(6, 4, 3, 2),
(7, 4, 5, 2),
(8, 5, 4, 2),
(9, 5, 6, 2),
(10, 6, 5, 2),
(11, 6, 7, 2),
(12, 7, 6, 2),
(13, 7, 8, 2),
(14, 8, 7, 2),
(15, 8, 9, 2),
(16, 9, 8, 2),
(17, 9, 10, 2),
(18, 10, 9, 2),
(19, 10, 11, 2),
(20, 11, 10, 2),
(21, 11, 12, 2),
(22, 12, 11, 2),
(23, 12, 13, 2),
(24, 13, 12, 2),
(25, 13, 14, 2),
(26, 14, 13, 2),
(27, 14, 15, 1),
(28, 15, 14, 1),
(29, 15, 16, 2),
(30, 16, 15, 2),
(31, 16, 17, 2),
(32, 17, 16, 2),
(33, 17, 18, 2),
(34, 18, 17, 2),
(35, 18, 19, 1),
(36, 19, 18, 1),
(37, 19, 20, 2),
(38, 20, 19, 2),
(39, 20, 21, 2),
(40, 21, 20, 2),
(41, 21, 22, 2),
(42, 22, 21, 2),
(43, 22, 23, 2),
(44, 23, 22, 2),
(45, 23, 24, 2),
(46, 24, 23, 2),
(47, 24, 25, 1),
(48, 25, 24, 1),
(49, 25, 26, 2),
(50, 26, 25, 2),
(51, 26, 27, 2),
(52, 27, 26, 2),
(53, 27, 28, 4),
(54, 28, 27, 4),
(55, 28, 29, 2),
(56, 29, 28, 2),
(57, 29, 30, 3),
(58, 30, 29, 3),
(59, 30, 31, 2),
(60, 31, 30, 2),
(61, 31, 32, 4),
(62, 32, 31, 4),
(63, 32, 33, 2),
(64, 33, 32, 2),
(65, 33, 34),
(66, 34, 33);

-- Linea 2
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(67, 9, 35),
(68, 35, 9),
(69, 35, 36),
(70, 36, 35),
(71, 36, 37),
(72, 37, 36),
(73, 37, 38),
(74, 38, 37),
(75, 38, 39),
(76, 39, 38),
(77, 39, 40),
(78, 40, 39),
(79, 16, 40),
(80, 40, 16),
(81, 16, 41),
(82, 41, 16),
(83, 41, 42),
(84, 42, 41),
(85, 42, 43),
(86, 43, 42),
(87, 43, 44),
(88, 44, 43),
(89, 44, 45),
(90, 45, 44),
(91, 45, 46),
(92, 46, 45),
(93, 46, 47),
(94, 47, 46),
(95, 47, 48),
(96, 48, 47),
(97, 48, 49),
(98, 49, 48),
(99, 49, 50),
(100, 50, 49);
(101, 50, 51),
(102, 51, 50),
(103, 51, 52),
(104, 52, 51);

-- Linea 3
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(105, 53, 54),
(106, 54, 53),
(107, 54, 55),
(108, 55, 54),
(109, 55, 56),
(110, 56, 55),
(111, 56, 57),
(112, 57, 56),
(113, 57, 16),
(114, 16, 57),
(115, 16, 58),
(116, 58, 16),
(117, 58, 59),
(118, 59, 58),
(119, 59, 60),
(120, 60, 59),
(121, 60, 61),
(122, 61, 60),
(123, 61, 62),
(124, 62, 61),
(125, 62, 63),
(126, 63, 62),
(127, 63, 64),
(128, 64, 63),
(129, 64, 65),
(130, 65, 64),
(131, 65, 66),
(132, 66, 65),
(133, 66, 67),
(134, 67, 66),
(135, 67, 68),
(136, 68, 67),
(137, 68, 69),
(138, 69, 68),
(139, 69, 70),
(140, 70, 69);
(141, 70, 71),
(142, 71, 70);

--Linea 4
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(143, 54, 37),
(144, 37, 54),
(145, 37, 13),
(146, 13, 37),
(147, 13, 72),
(148, 72, 13),
(149, 72, 73),
(150, 73, 72),
(151, 73, 74),
(152, 74, 73),
(153, 74, 75),
(154, 75, 74),
(155, 75, 45),
(156, 45, 75),
(157, 45, 76),
(158, 76, 45),
(159, 76, 77),
(160, 77, 76),
(161, 77, 78),
(162, 78, 77),
(163, 78, 79),
(164, 79, 78),
(165, 79, 80),
(166, 80, 79),
(167, 80, 81),
(168, 81, 80),
(169, 81, 82),
(170, 82, 81),
(171, 82, 83),
(172, 83, 82),
(173, 83, 84),
(174, 84, 83),
(175, 84, 85),
(176, 85, 84),
(177, 85, 86),
(178, 86, 85),
(179, 86, 87),
(180, 87, 86),
(181, 87, 88),
(182, 88, 87),
(183, 88, 89),
(184, 89, 88),
(185, 89, 1),
(186, 1, 89);

--Linea 5
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(187, 90, 91),
(188, 91, 90),
(189, 91, 92),
(190, 92, 91),
(191, 92, 93),
(192, 93, 92),
(193, 93, 94),
(194, 94, 93),
(195, 94, 95),
(196, 95, 94),
(197, 95, 96),
(198, 96, 95),
(199, 96, 97),
(200, 97, 96),
(201, 97, 98),
(202, 98, 97),
(203, 98, 47),
(204, 47, 98),
(205, 47, 77),
(206, 77, 47),
(207, 77, 99),
(208, 99, 77),
(209, 99, 100),
(210, 100, 99),
(211, 100, 72),
(212, 72, 100),
(213, 72, 101),
(214, 101, 72),
(215, 101, 15),
(216, 15, 101),
(217, 15, 57),
(218, 57, 15),
(219, 57, 40),
(220, 40, 57), -- Opera - Callao
(221, 40, 102), -- Opera - La Latina
(222, 102, 40),
(223, 102, 103), -- La Latina - Puerta de Toledo
(224, 103, 102),
(225, 103, 60), -- Puerta de Toledo - Acacias (misma estación que Embajadores)
(226, 60, 103), 
(227, 60, 104), 
(228, 104, 60),
(229, 104, 105),
(230, 105, 104),
(231, 105, 106),
(232, 106, 105),
(233, 106, 107),
(234, 107, 106),
(235, 107, 108),
(236, 108, 107),
(237, 108, 109),
(238, 109, 108),
(239, 109, 110),
(240, 110, 109),
(241, 110, 111),
(242, 111, 110),
(243, 111, 112),
(244, 112, 111),
(245, 112, 113),
(246, 113, 112),
(247, 113, 114),
(248, 114, 113);

--Linea 6
INSERT INTO `conexiones` (`id`, `estacion_origen`, `estacion_destino`) VALUES
(249, 115, 116),
(250, 116, 115),
(251, 116, 107),
(252, 107, 116),
(253, 107, 117),
(254, 117, 107),
(255, 117, 118),
(256, 118, 117),
(257, 118, 119),
(258, 119, 118),
(259, 119, 63),
(260, 63, 119),
(261, 63, 120),
(262, 120, 63),
(263, 120, 121),
(264, 121, 120),
(265, 121, 22),
(266, 22, 121),
(267, 22, 122),
(268, 122, 22),
(269, 122, 123),
(270, 123, 122),
(271, 123, 124),
(272, 124, 123),
(273, 124, 46),
(274, 46, 124),
(275, 46, 77),
(276, 77, 46),
(277, 77, 78),
(278, 78, 77),
(279, 78, 125),
(280, 125, 78),
(281, 125, 126),
(282, 126, 125),
(283, 126, 9),
(284, 9, 126),
(285, 9, 127),
(286, 127, 9),
(287, 127, 128),
(288, 128, 127),
(289, 128, 129),
(290, 129, 128),
(291, 129, 53),
(292, 53, 129),
(293, 53, 54),
(294, 54, 53),
(295, 54, 130),
(296, 130, 54),
(297, 130, 131),
(298, 131, 130),
(299, 131, 132),
(300, 132, 131),
(301, 132, 133),
(302, 133, 132),
(303, 133, 115),
(304, 115, 133);

--Linea 7
(305, 134, 135),
(306, 135, 134),
(307, 135, 136),
(308, 136, 135),
(309, 136, 137),
(310, 137, 136),
(311, 137, 138),
(312, 138, 137),
(313, 138, 139),
(314, 139, 138),
(315, 139, 140),
(316, 140, 139),
(317, 140, 141),
(318, 141, 140),
(319, 141, 142),
(320, 142, 141),
(321, 142, 143),
(322, 143, 142),
(323, 143, 144),
(324, 144, 143),
(325, 144, 145),
(326, 145, 144),
(327, 145, 146),
(328, 146, 145),
(329, 146, 96),
(330, 96, 146),
(331, 96, 147),
(332, 147, 96),
(333, 147, 148),
(334, 148, 147),
(335, 148, 149),
(336, 149, 148),
(337, 149, 78),
(338, 78, 149),
(339, 78, 150),
(340, 150, 78),
(341, 150, 151),
(342, 151, 150),
(343, 151, 35),
(344, 35, 151),
(345, 35, 152),
(346, 152, 35),
(347, 152, 127),
(348, 127, 152),
(349, 127, 153),
(350, 153, 127),
(351, 153, 154),
(352, 154, 153),
(353, 154, 155),
(354, 155, 154),
(355, 155, 156),
(356, 156, 155),
(357, 156, 157),
(358, 157, 156),
(359, 157, 158),
(360, 158, 157),
(361, 158, 159),
(362, 159, 158),
(363, 159, 160),
(364, 160, 159);

--Linea 8
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(365, 124, 159),          -- Nuevos Ministerios - Colombia
(366, 159, 124),          -- Colombia - Nuevos Ministerios
(367, 159, 160),          -- Colombia - Pinar del Rey
(368, 160, 159),          -- Pinar del Rey - Colombia 
(369, 160, 82),          -- Pinar del Rey - Mar de Cristal
(370, 82, 160),          -- Mar de Cristal - Pinar del Rey
(371, 82, 161),          -- Mar de Cristal - Feria de Madrid
(372, 161, 82),          -- Feria de Madrid - Mar de Cristal
(373, 161, 162),          -- Feria de Madrid - Aeropuerto T1-T2-T3
(374, 162, 161),          -- Aeropuerto T1-T2-T3 - Feria de Madrid
(375, 162, 163),          -- Aeropuerto T1-T2-T3 - Barajas
(376, 163, 162),          -- Barajas - Aeropuerto T1-T2-T3
(377, 163, 164),          -- Barajas - Aeropuerto T4
(378, 164, 163);          -- Aeropuerto T4 - Barajas

-- Línea 9
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(379, 165, 166),          -- Paco de Lucia - Mirasierra
(380, 166, 165),          -- Mirasierra - Paco de Lucia
(381, 166, 167),          -- Mirasierra - Herrera Oria
(382, 167, 166),          -- Herrera Oria - Mirasierra
(383, 167, 168),          -- Herrera Oria - Barrio del Pilar
(384, 168, 167),          -- Barrio del Pilar - Herrera Oria
(385, 168, 169),          -- Barrio del Pilar - Ventilla
(386, 169, 168),          -- Ventilla - Barrio del Pilar
(387, 169, 4),          -- Ventilla - Plaza Castilla
(388, 4, 169),          -- Plaza Castilla - Ventilla
(389, 4, 170),          -- Plaza Castilla - Duque de Pastrana
(390, 170, 4),          -- Duque de Pastrana - Plaza Castilla
(391, 170, 171),          -- Duque de Pastrana - Pío  XII
(392, 171, 170),          -- Pío  XII - Duque de Pastrana
(393, 171, 159),          -- Pío  XII - Colombia
(394, 159, 171),          -- Colombia - Pío  XII
(395, 159, 172),          -- Colombia - Concha Espina
(396, 172, 159),          -- Concha Espina - Colombia
(397, 172, 173),          -- Concha Espina - Cruz del Rayo
(398, 173, 172),          -- Cruz del Rayo - Concha Espina
(399, 173, 75),          -- Cruz del Rayo - Avenida de América
(400, 75, 173),          -- Avenida de América - Cruz del Rayo
(401, 75, 96),          -- Avenida de América - Núñez de Balboa
(402, 96, 75),          -- Núñez de Balboa - Avenida de América
(403, 96, 42),          -- Núñez de Balboa - Príncipe de Vergara
(404, 42, 96),          -- Príncipe de Vergara - Núñez de Balboa
(405, 42, 174),          -- Príncipe de Vergara - Ibiza
(406, 174, 42),          -- Ibiza - Príncipe de Vergara
(407, 174, 121),          -- Ibiza - Sainz de Baranda
(408, 121, 174),          -- Sainz de Baranda - Ibiza
(409, 121, 175),          -- Sainz de Baranda - Estrella
(410, 175, 121),          -- Estrella - Sainz de Baranda
(411, 175, 176),          -- Estrella - Vinateros
(412, 176, 175),          -- Vinateros - Estrella
(413, 176, 177),          -- Vinateros - Artilleros
(414, 177, 176),          -- Artilleros - Vinateros
(415, 177, 178),          -- Artilleros - Pavones
(416, 178, 177),          -- Pavones - Artilleros
(417, 178, 179),          -- Pavones - Valdebernardo
(418, 179, 178),          -- Valdebernardo - Pavones
(419, 179, 180),          -- Valdebernardo - Vicálvaro
(420, 180, 179),          -- Vicálvaro - Valdebernardo
(421, 180, 181),          -- Vicálvaro - San Cipriano
(422, 181, 180),          -- San Cipriano - Vicálvaro
(423, 181, 182),          -- San Cipriano - Puerta de Arganda
(424, 182, 181),          -- Puerta de Arganda - San Cipriano
(425, 182, 183),          -- Puerta de Arganda - Rivas-Urbanizaciones
(426, 183, 182),          -- Rivas-Urbanizaciones - Puerta de Arganda
(427, 183, 184),          -- Rivas-Urbanizaciones - Rivas Futura
(428, 184, 183),          -- Rivas Futura - Rivas-Urbanizaciones
(429, 184, 185),          -- Rivas Futura - Rivas-Vaciamadrid
(430, 185, 184),          -- Rivas-Vaciamadrid - Rivas Futura
(431, 185, 186),          -- Rivas-Vaciamadrid - La Poveda
(432, 186, 185),          -- La Poveda - Rivas-Vaciamadrid
(433, 186, 187),          -- La Poveda - Arganda del Rey
(434, 187, 186);          -- Arganda del Rey - La Poveda

-- Inserción de conexiones para la Línea 10
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(435, 188, 189),          -- Hospital Infanta Sofía - Reyes Católicos
(436, 189, 188),          -- Reyes Católicos - Hospital Infanta Sofí
(437, 189, 190),          -- Reyes Católicos - Baunatal
(438, 190, 189),          -- Baunatal - Reyes Católicos
(439, 190, 191),          -- Baunatal - Manuel de Falla
(440, 191, 190),          -- Manuel de Falla - Baunatal
(441, 191, 192),          -- Manuel de Falla - Marqués de Valdavia
(442, 192, 191),          -- Marqués de Valdavia - Manuel de Falla
(443, 192, 193),          -- Marqués de Valdavia - La Moraleja
(444, 193, 192),          -- La Moraleja - Marqués de Valdavia
(445, 193, 194),          -- La Moraleja - La Granja
(446, 194, 193),          -- La Granja - La Moraleja
(447, 194, 195),          -- La Granja - Ronda de la Comunicación
(448, 195, 194),          -- Ronda de la Comunicación - La Granja
(449, 195, 196),          -- Ronda de la Comunicación - Las Tablas
(450, 196, 195),          -- Las Tablas - Ronda de la Comunicación
(451, 196, 197),          -- Las Tablas - Montecarmelo
(452, 197, 196),          -- Montecarmelo - Las Tablas
(453, 197, 198),          -- Montecarmelo - Tres Olivos
(454, 198, 197),          -- Tres Olivos - Montecarmelo
(455, 198, 199),          -- Tres Olivos - Fuencarral
(456, 199, 198),          -- Fuencarral - Tres Olivos
(457, 199, 200),          -- Fuencarral - Begoña
(458, 200, 199),          -- Begoñaa - Fuencarral
(459, 200, 3),          -- Begoña - Chamartín
(460, 3, 200),          -- Chamartín - Begoña
(461, 3, 4),          -- Chamartín - Plaza de Castilla
(462, 4, 3),          -- Plaza de Castilla - Chamartín
(463, 4, 201),          -- Plaza de Castilla - Cuzco
(464, 201, 4),          -- Cuzco - Plaza de Castilla
(465, 201, 202),          -- Cuzco - Santiago Bernabéu
(466, 202, 201),          -- Santiago Bernabéu - Cuzco
(467, 202, 124),          -- Santiago Bernabéu - Nuevos Ministerios
(468, 124, 202),          -- Nuevos Ministerios - Santiago Bernabéu
(469, 124, 148),          -- Nuevos Ministerios - Gregorio Marañón
(470, 148, 124),          -- Gregorio Marañón - Nuevos Ministerios
(471, 148, 69),          -- Gregorio Marañón - Alonso Martínez
(472, 69, 148),          -- Alonso Martínez - Gregorio Marañón
(473, 69, 13),          -- Alonso Martínez - Tribunal
(474, 13, 69),          -- Tribunal - Alonso Martínez
(475, 13, 65),          -- Tribunal - Plaza de España
(476, 65, 13),          -- Plaza de España - Tribunal
(477, 65, 128),          -- Plaza de España - Principe Pío
(478, 128, 65),          -- Principe Pío - Plaza de España
(479, 128, 203),          -- Principe Pío - Lago
(480, 203, 128),          -- Lago - Principe Pío
(481, 203, 204),          -- Lago - Batán
(482, 204, 203),          -- Batán - Lago
(483, 204, 112),          -- Batán - Casa de Campo
(484, 112, 204),          -- Casa de Campo - Batán
(485, 112, 205),          -- Casa de Campo - Colonia Jardín
(486, 205, 112),          -- Colonia Jardín - Casa de Campo
(487, 205, 206),          -- Colonia Jardín - Aviación Española
(488, 206, 205),          -- Aviación Española - La Poveda
(489, 206, 207),          -- Aviación Española - Cuatro Vientos
(490, 207, 206),          -- Cuatro Vientos - Aviación Española
(491, 207, 208),          -- Cuatro Vientos - Joaquín Vilumbrales
(492, 208, 207),          -- Joaquín Vilumbrales - Cuatro Vientos
(493, 208, 209),          -- Joaquín Vilumbrales - Puerta del Sur
(494, 209, 208);          -- Puerta del Sur - Joaquín Vilumbrales


-- Inserción de conexiones para la Línea 11
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(495, 116, 210),          -- Plaza Elíptica - Abrantes
(496, 210, 116),          -- Abrantes - Plaza Elíptica
(497, 210, 211),          -- Abrantes - Pan Bendito
(498, 211, 210),          -- Pan Bendito - Abrantes
(499, 211, 212),          -- Pan Bendito - San Francisco
(500, 212, 211),          -- San Francisco - Pan Bendito
(501, 212, 213),          -- San Francisco - Carabanchel Alto
(502, 213, 212),          -- Carabanchel Alto - San Francisco
(503, 213, 214),          -- Carabanchel Alto - La Peseta
(504, 214, 213),          -- La Peseta - Carabanchel Alto
(505, 214, 215),          -- La Peseta - La Fortuna
(506, 215, 214);          -- La Fortuna - La Peseta

-- Inserción de conexiones para la Línea 12
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(507, 209, 216),          -- Puerta del Sur - Parque Lisboa
(508, 216, 209),          -- Parque Lisboa - Puerta del Sur
(509, 216, 217),          -- Parque Lisboa - Alcorcón Central
(510, 217, 216),          -- Alcorcón Central - Parque Lisboa
(511, 217, 218),          -- Alcorcón Central - Parque Oeste
(512, 218, 217),          -- Parque Oeste - Alcorcón Central
(513, 218, 219),          -- Parque Oeste - Universidad Rey Juan Carlos
(514, 219, 218),          -- Universidad Rey Juan Carlos - Parque Oeste
(515, 219, 220),          -- Universidad Rey Juan Carlos - Móstoles Central
(516, 220, 219),          -- Móstoles Central - Universidad Rey Juan Carlos
(517, 220, 221),          -- Móstoles Central - Pradillo
(518, 221, 220),          -- Pradillo - Móstoles Central
(519, 221, 222),          -- Pradillo - Hopital de Móstoles
(520, 222, 221),          -- Hopital de Móstoles - Pradillo
(521, 222, 223),          -- Hopital de Móstoles - Manuel Malasaña
(522, 223, 222),          -- Manuel Malasaña - Hopital de Móstoles
(523, 223, 224),          -- Manuel Malasaña - Loranca
(524, 224, 223),          -- Loranca - Manuel Malasaña
(525, 224, 225),          -- Loranca - Hospital de Fuenlabrada
(526, 225, 224),          -- Hospital de Fuenlabrada - Loranca
(527, 225, 226),          -- Hospital de Fuenlabrada - Parque Europa
(528, 226, 225),          -- Parque Europa - Hospital de Fuenlabrada
(529, 226, 227),          -- Parque Europa - Fuenlabrada Central
(530, 227, 226),          -- Fuenlabrada Central - Parque Europa
(531, 227, 228),          -- Fuenlabrada Central - Parque de los Estados
(532, 228, 227),          -- Parque de los Estados - Fuenlabrada Central
(533, 228, 229),          -- Parque de los Estados - Arroyo Culebro
(534, 229, 228),          -- Arroyo Culebro - Parque de los Estados
(535, 229, 230),          -- Arroyo Culebro - Conservatorio
(536, 230, 229),          -- Conservatorio - Arroyo Culebro
(537, 230, 231),          -- Conservatorio - Alonso de Mendoza
(538, 231, 230),          -- Alonso de Mendoza - Conservatorio
(539, 231, 232),          -- Alonso de Mendoza - Getafe Central
(540, 232, 231),          -- Getafe Central - Alonso de Mendoza
(541, 232, 233),          -- Getafe Central - Juan de la Cierva
(542, 233, 232),          -- Juan de la Cierva - Getafe Central
(543, 233, 234),          -- Juan de la Cierva - El Casar
(544, 234, 233),          -- El Casar - Juan de la Cierva
(545, 234, 235),          -- El Casar - Los Espartales
(546, 235, 234),          -- Los Espartales - El Casar
(547, 235, 236),          -- Los Espartales - El Bercial
(548, 236, 235),          -- El Bercial - Los Espartales
(549, 236, 237),          -- El Bercial - El Carrascal
(550, 237, 236),          -- El Carrascal - El Bercial
(551, 237, 238),          -- El Carrascal - Julián Besteiro
(552, 238, 237),          -- Julián Besteiro - El Carrascal
(553, 238, 239),          -- Julián Besteiro - Casa del Reloj
(554, 239, 238),          -- Casa del Reloj - Julián Besteiro
(555, 239, 240),          -- Casa del Reloj - Hospital Severo Ochoa
(556, 240, 239),          -- Hospital Severo Ochoa - Casa del Reloj
(557, 240, 241),          -- Hospital Severo Ochoa - Leganés Central
(558, 241, 240),          -- Leganés Central - Hospital Severo Ochoa
(559, 241, 242),          -- Leganés Central - San Nicasio
(560, 242, 241);          -- San Nicasio - Leganés Central



-- Inserción de conexiones para la Línea RAMAL
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(561, 46, 128),          -- Ópera - Príncipe Pío
(562, 128, 46);          -- Príncipe Pío - Ópera


-- Inserción de conexiones para la Línea ML1
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(563, 1, 243),          -- Pinar de Chamartín - Fuente de la Mora
(564, 243, 1),          -- Fuente de la Mora - Pinar de Chamartín
(565, 243, 244),          -- Fuente de la Mora - Virgen del Cortijo
(566, 244, 243),          -- Virgen del Cortijo - Fuente de la Mora
(567, 244, 245),          -- Virgen del Cortijo - Antonio Saura
(568, 245, 244),          -- Antonio Saura - Virgen del Cortijo
(569, 245, 246),          -- Antonio Saura - Álvarez de Villaamil
(570, 246, 245),          -- Álvarez de Villaamil - Antonio Saura
(571, 246, 247),          -- Álvarez de Villaamil - Blasco Ibáñez
(572, 247, 246),          -- Blasco Ibáñez - Álvarez de Villaamil
(573, 247, 248),          -- Blasco Ibáñez - María Tudor
(574, 248, 247),          -- María Tudor - Blasco Ibáñez
(575, 248, 249),          -- María Tudor - Palas de Rey
(576, 249, 248),          -- Palas de Rey - María Tudor
(577, 249, 196),          -- Palas de Rey - Las Tablas
(578, 196, 249);          -- Las Tablas - Palas de Rey

-- Inserción de conexiones para la Línea ML2
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(579, 205, 250),          -- Colonia Jardín - Prado de la Vega
(580, 250, 205),          -- Prado de la Vega - Colonia Jardín
(581, 250, 251),          -- Prado de la Vega - Colonia de los Ángeles
(582, 251, 250),          -- Colonia de los Ángeles - Prado de la Vega
(583, 251, 252),          -- Colonia de los Ángeles - Prado del Rey
(584, 252, 251),          -- Prado del Rey - Colonia de los Ángeles
(585, 252, 253),          -- Prado del Rey - Somosaguas Sur
(586, 253, 252),          -- Somosaguas Sur - Prado del Rey
(587, 253, 254),          -- Somosaguas Sur - Somosaguas Centro
(588, 254, 253),          -- Somosaguas Centro - Somosaguas Sur
(589, 254, 255),          -- Somosaguas Centro - Pozuelo Oeste
(590, 255, 254),          -- Pozuelo Oeste - Somosaguas Centro
(591, 255, 256),          -- Pozuelo Oeste - Bélgica
(592, 256, 255),          -- Bélgica - Pozuelo Oeste
(593, 256, 257),          -- Bélgica - Dos Castillas
(594, 257, 256),          -- Dos Castillas - Bélgica
(595, 257, 258),          -- Dos Castillas - Campus de Somosaguas
(596, 258, 257),          -- Campus de Somosaguas - Dos Castillas
(597, 258, 259),          -- Campus de Somosaguas - Avenida de Europa
(598, 259, 258),          -- Avenida de Europa - Campus de Somosaguas
(599, 259, 260),          -- Avenida de Europa - Berna
(600, 260, 259),          -- Berna - Avenida de Europa
(601, 260, 261),          -- Berna - Estación de Aravaca
(602, 261, 260);          -- Estación de Aravaca - Berna

-- Inserción de conexiones para la Línea ML3
INSERT INTO conexiones (id, id_origen, id_destino) VALUES
(603, 205, 262),          -- Colonia Jardín - Ciudad de la Imagen
(604, 262, 205),          -- Ciudad de la Imagen - Colonia Jardín
(605, 262, 263),          -- Ciudad de la Imagen - José Isbert
(606, 263, 262),          -- José Isbert - Ciudad de la Imagen
(607, 263, 264),          -- José Isbert - Ciudad del Cine
(608, 264, 263),          -- Ciudad del Cine - José Isbert
(609, 264, 265),          -- Ciudad del Cine - Cocheras
(610, 265, 264),          -- Cocheras - Ciudad del Cine
(611, 265, 266),          -- Cocheras - Retamares
(612, 266, 265),          -- Retamares - Cocheras
(613, 266, 267),          -- Retamares - Montepríncipe
(614, 267, 266),          -- Montepríncipe - Retamares
(615, 267, 268),          -- Montepríncipe - Ventorro del Cano
(616, 268, 267),          -- Ventorro del Cano - Montepríncipe
(617, 268, 269),          -- Ventorro del Cano - Prado del Espino
(618, 269, 268),          -- Prado del Espino - Ventorro del Cano
(619, 269, 270),          -- Prado del Espino - Cantabria
(620, 270, 269),          -- Cantabria - Prado del Espino
(621, 270, 271),          -- Cantabria - Ferial de Boadilla
(622, 271, 270),          -- Ferial de Boadilla - Cantabria
(623, 271, 272),          -- Ferial de Boadilla - Boadilla Centro
(624, 272, 271),          -- Boadilla Centro - Ferial de Boadilla
(625, 272, 273),          -- Boadilla Centro - Nuevo Mundo
(626, 273, 272),          -- Nuevo Mundo - Boadilla Centro
(628, 273, 274),          -- Nuevo Mundo - Siglo XXI
(629, 274, 273),          -- Siglo XXI - Nuevo Mundo
(630, 274, 275),          -- Siglo XXI - Infante Don Luis
(631, 275, 274),          -- Infante Don Luis - Siglo XXI
(632, 275, 276),          -- Infante Don Luis - Puerta de Boadilla
(633, 276, 275);          -- Puerta de Boadilla - Infante Don Luis