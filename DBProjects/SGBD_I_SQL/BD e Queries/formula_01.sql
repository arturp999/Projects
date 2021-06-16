
CREATE DATABASE formula_01;
USE formula_01;

/* CRIAÇÃO DA TABELA *//* CRIAÇÃO DA TABELA *//* CRIAÇÃO DA TABELA *//* CRIAÇÃO DA TABELA *//* CRIAÇÃO DA TABELA *//* CRIAÇÃO DA TABELA *//* CRIAÇÃO DA TABELA */
CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `competition_year` year(4) NOT NULL,
  `weight` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `engine_id` int(11) NOT NULL
);

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `driver_championships` int(11) NOT NULL DEFAULT 0,
  `car_id` int(11) NOT NULL
);

CREATE TABLE `driver_grand_prix` (
  `driver_id` int(11) NOT NULL,
  `grand_prix_id` int(11) NOT NULL,
  `starting_position` int(11) NOT NULL,
  `finishing_position` int(11),
  `points_won` int(11) NOT NULL DEFAULT 0
);

CREATE TABLE `driver_team` (
  `driver_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
);

CREATE TABLE `engine` (
  `engine_id` int(11) NOT NULL,
  `displacement` int(11) NOT NULL,
  `engine_layout` varchar(45) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
);

CREATE TABLE `grand_prix` (
  `grand_prix_id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `track_name` varchar(100) NOT NULL,
  `laps` int(11) NOT NULL,
  `fastest_lap` timestamp(6) DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `year` year(4) NOT NULL
);

CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
);

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `base` varchar(45) NOT NULL,
  `constructor_championships` int(11) NOT NULL DEFAULT 0,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
) ;

/* INSERTS DA INFORMAÇÃO *//* INSERTS DA INFORMAÇÃO *//* INSERTS DA INFORMAÇÃO *//* INSERTS DA INFORMAÇÃO *//* INSERTS DA INFORMAÇÃO *//* INSERTS DA INFORMAÇÃO */
INSERT INTO `car` (`car_id`, `name`, `competition_year`, `weight`, `team_id`, `engine_id`) VALUES
(1, 'Mercedes-AMG F1 W10 EQ POWER+', 2019, 743, 1, 1),
(2, 'Ferrari SF90', 2019, 743, 7, 3),
(3, 'McLaren MCL34', 2019, 743, 3, 4),
(4, 'Red Bull RB15', 2019, 743, 5, 2),
(5, 'Haas VF-19', 2019, 743, 2, 3),
(6, 'Scuderia Toro Rosso STR14', 2019, 743, 8, 2),
(7, 'Williams FW42', 2019, 745, 9, 1),
(8, 'Racing Point RP19', 2019, 743, 10, 1),
(9, 'Alfa Romeu Racing C38', 2019, 743, 4, 3),
(10, 'Renault R.S.19', 2019, 743, 6, 4);

INSERT INTO `driver` (`driver_id`, `name`, `date_of_birth`, `nationality`, `number`, `driver_championships`, `car_id`) VALUES
(1, 'Lewis Hamilton', '1985-01-07', 'British', 44, 6, 1),
(2, 'Valtteri Bottas', '1989-08-28', 'Finnish', 77, 0, 1),
(3, 'Sebastian Vettel', '1987-07-03', 'German', 5, 4, 2),
(4, 'Charles Leclerc', '1997-10-16', 'Monegasque', 16, 0, 2),
(5, 'Lando Norris', '1999-11-13', 'British', 4, 0, 3),
(6, 'Carlos Sainz', '1994-09-01', 'Spanish', 55, 0, 3),
(7, 'Alexander Albon', '1996-03-23', 'British', 23, 0, 4),
(8, 'Max Verstappen', '1997-09-30', 'Dutch', 33, 0, 4),
(9, 'Daniel Ricciardo', '1989-07-01', 'Australian', 3, 0, 10),
(10, 'Nico Hulkenberg', '1987-08-17', 'German', 27, 0, 10),
(11, 'Pierre Gasly', '1996-02-07', 'French', 10, 0, 6),
(12, 'Daniil Kvyat', '1994-04-26', 'Russian', 26, 0, 6),
(13, 'Sergio Perez', '1990-01-26', 'Mexican', 11, 0, 8),
(14, 'Lance Stroll', '1998-10-29', 'Canadian', 18, 0, 8),
(15, 'Kimi Raikkonen', '1979-10-17', 'Finnish', 7, 1, 9),
(16, 'Antonio Giovinazzi', '1993-12-14', 'Italian', 99, 0, 9),
(17, 'Romain Grosjean', '1986-04-17', 'French', 8, 0, 5),
(18, 'Kevin Magnussen', '1992-10-05', 'Danish', 20, 0, 5),
(19, 'George Russell', '1998-02-15', 'British', 63, 0, 7),
(20, 'Robert Kubica', '1984-12-07', 'Polish', 88, 0, 7);

INSERT INTO `driver_grand_prix` (`driver_id`, `grand_prix_id`, `starting_position`, `finishing_position`, `points_won`) VALUES
(1, 2, 1, 2, 18),
(1, 3, 3, 1, 25),
(1, 4, 2, 1, 25),
(1, 5, 2, 2, 18),
(1, 6, 2, 1, 26),
(1, 7, 1, 1, 25),
(1, 8, 2, 1, 25),
(1, 9, 1, 1, 25),
(1, 10, 4, 5, 10),
(1, 11, 2, 1, 26),
(1, 12, 1, 9, 2),
(1, 13, 3, 1, 25),
(2, 2, 2, 1, 26),
(2, 3, 4, 2, 18),
(2, 4, 1, 2, 18),
(2, 5, 1, 1, 25),
(2, 6, 1, 2, 18),
(2, 7, 2, 3, 15),
(2, 8, 6, 4, 13),
(2, 9, 2, 2, 18),
(2, 10, 3, 3, 15),
(2, 11, 1, 2, 18),
(2, 13, 2, 8, 4),
(3, 2, 3, 4, 12),
(3, 3, 2, 5, 10),
(3, 4, 3, 3, 15),
(3, 5, 3, 3, 15),
(3, 6, 3, 4, 12),
(3, 7, 4, 2, 18),
(3, 8, 1, 2, 18),
(3, 9, 7, 5, 11),
(3, 10, 9, 4, 12),
(3, 12, 20, 2, 18),
(3, 13, 5, 3, 15),
(4, 2, 5, 5, 10),
(4, 3, 1, 3, 16),
(4, 4, 4, 5, 10),
(4, 5, 8, 5, 11),
(4, 6, 5, 5, 10),
(4, 8, 3, 3, 15),
(4, 9, 3, 3, 15),
(4, 10, 1, 2, 18),
(4, 11, 3, 3, 15),
(4, 13, 4, 4, 12),
(5, 3, 9, 6, 8),
(5, 5, 7, 8, 4),
(5, 9, 5, 9, 2),
(5, 10, 5, 6, 8),
(5, 13, 7, 9, 2),
(6, 5, 9, 7, 6),
(6, 6, 12, 8, 4),
(6, 7, 9, 6, 8),
(6, 9, 6, 6, 8),
(6, 10, 19, 8, 4),
(6, 11, 13, 6, 8),
(6, 12, 7, 5, 10),
(6, 13, 8, 5, 10),
(7, 3, 12, 9, 2),
(7, 4, 20, 10, 1),
(7, 7, 10, 8, 4),
(7, 12, 16, 6, 8),
(7, 13, 12, 10, 1),
(8, 2, 4, 3, 15),
(8, 3, 5, 4, 12),
(8, 4, 5, 4, 12),
(8, 5, 4, 4, 12),
(8, 6, 4, 3, 15),
(8, 7, 3, 4, 12),
(8, 8, 9, 5, 10),
(8, 9, 4, 4, 12),
(8, 10, 2, 1, 26),
(8, 11, 4, 5, 10),
(8, 12, 2, 1, 26),
(8, 13, 1, 2, 19),
(9, 4, 7, 7, 6),
(9, 7, 6, 9, 2),
(9, 8, 4, 6, 8),
(9, 11, 7, 7, 6),
(10, 2, 11, 7, 6),
(10, 8, 7, 7, 6),
(10, 9, 13, 8, 4),
(10, 11, 10, 10, 1),
(11, 3, 13, 8, 4),
(11, 4, 6, 6, 9),
(11, 6, 6, 6, 8),
(11, 7, 8, 5, 11),
(11, 8, 5, 8, 4),
(11, 9, 9, 10, 1),
(11, 10, 8, 7, 6),
(11, 11, 5, 4, 12),
(11, 13, 6, 6, 8),
(12, 2, 15, 10, 1),
(12, 6, 9, 9, 2),
(12, 7, 7, 7, 6),
(12, 8, 10, 10, 1),
(12, 11, 17, 9, 2),
(12, 12, 14, 3, 15),
(13, 3, 14, 10, 1),
(13, 4, 12, 8, 4),
(13, 5, 5, 6, 8),
(14, 2, 16, 9, 2),
(14, 5, 13, 9, 2),
(14, 8, 17, 9, 2),
(14, 12, 15, 4, 12),
(15, 2, 9, 8, 4),
(15, 3, 8, 7, 6),
(15, 4, 13, 9, 2),
(15, 5, 19, 10, 1),
(15, 9, 12, 7, 6),
(15, 10, 6, 9, 2),
(15, 11, 12, 8, 4),
(15, 13, 10, 7, 6),
(16, 10, 7, 10, 1),
(17, 6, 7, 10, 1),
(17, 7, 13, 10, 1),
(17, 12, 6, 7, 6),
(18, 2, 7, 6, 8),
(18, 6, 8, 7, 6),
(18, 12, 12, 8, 4),
(20, 12, 18, 10, 1);

INSERT INTO `driver_team` (`driver_id`, `team_id`) VALUES
(1, 1),
(2, 1),
(3, 7),
(4, 7),
(5, 3),
(6, 3),
(7, 5),
(8, 5),
(9, 6),
(10, 6),
(11, 8),
(12, 8),
(13, 10),
(14, 10),
(15, 4),
(16, 4),
(17, 2),
(18, 2),
(19, 9),
(20, 9);

INSERT INTO `engine` (`engine_id`, `displacement`, `engine_layout`, `manufacturer_id`) VALUES
(1, 1600, 'V6 TURBO HYBRID', 1),
(2, 1600, 'V6 TURBO HYBRID', 2),
(3, 1600, 'V6 TURBO HYBRID', 3),
(4, 1600, 'V6 TURBO HYBRID', 4);

INSERT INTO `grand_prix` (`grand_prix_id`, `country`, `track_name`, `laps`, `fastest_lap`, `year`) VALUES
(2, 'Australia', 'Melbourne Grand Prix Circuit', 58, '2019-03-17 00:01:25.580000', 2019),
(3, 'Bahrain', 'Sakhir', 57, '2019-03-31 00:01:33.411000', 2019),
(4, 'China', 'Shanghai International Circuit', 56, '2019-04-13 23:01:34.742000', 2019),
(5, 'Azerbaijan', 'Baku City Circuit', 51, '2019-04-27 23:01:43.009000', 2019),
(6, 'Spain', 'Circuit de Barcelona', 66, '2019-05-11 23:01:18.492000', 2019),
(7, 'Monaco', 'Circuit de Monaco', 78, '2019-06-11 23:01:14.279000', 2019),
(8, 'Canada', 'Circuit Gilles', 70, '2019-06-08 23:01:13.078000', 2019),
(9, 'France', 'Circuit Paul Ricard', 53, '2019-06-22 23:01:32.740000', 2019),
(10, 'Austria', 'Red Bull Ring', 71, '2019-06-29 23:01:07.475000', 2019),
(11, 'Great Britain', 'Silverstone Circuit', 52, '2019-07-13 23:01:27.369000', 2019),
(12, 'Germany', 'Hockenheimring', 67, '2019-07-27 23:01:16.645000', 2019),
(13, 'Hungary', 'Hungaroring', 70, '2019-08-03 23:01:17.103000', 2019),
(14, 'Belgium', 'Circuit de Spa', 44, '2019-08-31 23:01:46.409000', 2019),
(15, 'Italy', 'Autodromo Nazionale Monza', 53, '2019-09-07 23:01:21.779000', 2019),
(16, 'Singapore', 'Marina Bay Street Circuit', 61, '2019-09-21 23:01:42.301000', 2019),
(17, 'Russia', 'Sochi Autodrom', 53, '2019-09-28 23:01:35.761000', 2019),
(18, 'Japan', 'Suzuka International Racing Course', 53, '2019-10-12 23:01:30.983000', 2019),
(19, 'Mexico', 'Autódromo Hermanos Rodríguez', 71, '2019-10-26 23:01:19.232000', 2019),
(20, 'United States', 'Circuit of The Americas', 56, '2019-11-03 00:01:36.169000', 2019),
(21, 'Brasil', 'Autódromo José Carlos Pace', 71, '2019-11-17 00:01:10.698000', 2019),
(22, 'Abu Dhabi', 'Yas Marina Circuit', 55, '2019-12-01 00:01:34.715000', 2019);

INSERT INTO `manufacturer` (`manufacturer_id`, `name`) VALUES
(1, 'Mercedes'),
(2, 'Honda'),
(3, 'Ferrari'),
(4, 'Renault');

INSERT INTO `team` (`team_id`, `name`, `base`, `constructor_championships`) VALUES
(1, 'Mercedes-AMG Petronas F1 Team', 'United Kingdom', 6),
(2, 'Haas F1 Team', 'United States', 0),
(3, 'McLaren F1 Team', 'United Kingdom', 8),
(4, 'Alfa Romeo Racing ORLEN', 'Switzerland', 0),
(5, 'Aston Martin Red Bull Racing', 'United Kingdom', 4),
(6, 'Renault DP World F1 Team', 'United Kingdom', 2),
(7, 'Scuderia Ferrari Mission Winnow', 'Italy', 16),
(8, 'Scuderia AlphaTauri Honda', 'Italy', 0),
(9, 'Williams Racing', 'United Kingdom', 9),
(10, 'BWT Racing Point F1 Team', 'United Kingdom', 0);

/* ALTER TABLE PARA CRICAO DE PK E FK */ /* ALTER TABLE PARA CRICAO DE PK E FK */ /* ALTER TABLE PARA CRICAO DE PK E FK */ /* ALTER TABLE PARA CRICAO DE PK E FK */
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`,`team_id`,`engine_id`),
  ADD UNIQUE KEY `car_id_UNIQUE` (`car_id`),
  ADD KEY `fk_car_team_idx` (`team_id`),
  ADD KEY `fk_car_engine1_idx` (`engine_id`);

ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`,`car_id`),
  ADD UNIQUE KEY `driver_id_UNIQUE` (`driver_id`),
  ADD KEY `fk_driver_car1_idx` (`car_id`);

ALTER TABLE `driver_grand_prix`
  ADD PRIMARY KEY (`driver_id`,`grand_prix_id`),
  ADD KEY `fk_driver_has_grand_prix_grand_prix1_idx` (`grand_prix_id`),
  ADD KEY `fk_driver_has_grand_prix_driver_idx` (`driver_id`);

ALTER TABLE `driver_team`
  ADD PRIMARY KEY (`driver_id`,`team_id`),
  ADD KEY `fk_driver_has_team_team1_idx` (`team_id`),
  ADD KEY `fk_driver_has_team_driver1_idx` (`driver_id`);

ALTER TABLE `engine`
  ADD PRIMARY KEY (`engine_id`,`manufacturer_id`),
  ADD UNIQUE KEY `idengine_UNIQUE` (`engine_id`),
  ADD KEY `fk_engine_manufacturer1_idx` (`manufacturer_id`);

ALTER TABLE `grand_prix`
  ADD PRIMARY KEY (`grand_prix_id`),
  ADD UNIQUE KEY `grand_prix_id_UNIQUE` (`grand_prix_id`);

ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`),
  ADD UNIQUE KEY `idmanufacturer_UNIQUE` (`manufacturer_id`);

ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `team_id_UNIQUE` (`team_id`);

ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `engine`
  MODIFY `engine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `grand_prix`
  MODIFY `grand_prix_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

ALTER TABLE `manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `car`
  ADD CONSTRAINT `fk_car_engine1` FOREIGN KEY (`engine_id`) REFERENCES `engine` (`engine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_car_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `driver`
  ADD CONSTRAINT `fk_driver_car1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `driver_grand_prix`
  ADD CONSTRAINT `fk_driver_has_grand_prix_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_driver_has_grand_prix_grand_prix1` FOREIGN KEY (`grand_prix_id`) REFERENCES `grand_prix` (`grand_prix_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `driver_team`
  ADD CONSTRAINT `fk_driver_has_team_driver1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_driver_has_team_team1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `engine`
  ADD CONSTRAINT `fk_engine_manufacturer1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`manufacturer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
