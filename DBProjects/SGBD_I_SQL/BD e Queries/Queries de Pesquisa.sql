/* Total de pontos que o Driver Lando Norris adquiriu ao longo de todos os GP's */
SELECT SUM(points_won) AS 'Total de pontos',name FROM driver_grand_prix
INNER JOIN driver ON driver_grand_prix.driver_id = driver.driver_id
WHERE driver.name = "Lando Norris";

/* Total de vezes em que cada Driver Britanico acabou no Top 10 */
SELECT COUNT(starting_position) AS 'TOTAL DE CORRIDAS NO GRAND PRIX',name FROM driver_grand_prix
INNER JOIN driver ON driver_grand_prix.driver_id = driver.driver_id
WHERE driver.nationality = "British"
GROUP BY driver.number;

/* Total de pontos adquiridos no GP da Australia por todos os drivers que correm com motor Mercedes */
SELECT SUM(points_won) AS 'Pontos Ganhos Motor Mercedes' FROM driver_grand_prix
INNER JOIN grand_prix ON driver_grand_prix.grand_prix_id = grand_prix.grand_prix_id
INNER JOIN driver ON driver_grand_prix.driver_id = driver.driver_id
INNER JOIN car ON driver.car_id = car.car_id
INNER JOIN engine ON car.engine_id = engine.engine_id
INNER JOIN manufacturer ON engine.manufacturer_id = manufacturer.manufacturer_id
WHERE (manufacturer.name, grand_prix.country ) = ("MERCEDES","Australia");

/* Lista dos 3 carros que conseguiram mais podios ao londo dos GP's */
SELECT COUNT(driver_grand_prix.finishing_position) AS "Podios_Grand_Prix", car.name FROM driver_grand_prix
INNER JOIN driver ON driver_grand_prix.driver_id = driver.driver_id
INNER JOIN car ON driver.car_id = car.car_id
GROUP BY car.name
ORDER BY Podios_Grand_Prix DESC LIMIT 3;

/* Lista dos drivers que ja Ganharam um, ou mais, GP's */
SELECT driver.name from driver
INNER JOIN driver_grand_prix ON driver.driver_id = driver_grand_prix.driver_id
WHERE finishing_position = 1
GROUP BY driver.name;

/* Total de Pontos por GP adquiridos pela equipa Scuderia Ferrari */
SELECT SUM(driver_grand_prix.points_won) AS 'Total Pontos' , grand_prix.country FROM driver_grand_prix
INNER JOIN grand_prix ON driver_grand_prix.grand_prix_id = grand_prix.grand_prix_id
INNER JOIN driver ON driver_grand_prix.driver_id = driver.driver_id
INNER JOIN driver_team ON driver.driver_id = driver_team.driver_id
INNER JOIN team ON driver_team.team_id = team.team_id
WHERE team.name LIKE '%Ferrari%'
GROUP BY grand_prix.country;

/* Qual o driver que recuperou mais posiçoes num GP */
SELECT MAX(starting_position - finishing_position) AS "Ganhos", driver.name FROM driver_grand_prix
INNER JOIN driver ON driver_grand_prix.driver_id = driver.driver_id
GROUP BY driver.name
ORDER BY Ganhos DESC LIMIT 1;


/* Qual o Driver no Grid mais novo e qual a sua idade */
SELECT MIN(YEAR(CURDATE())-YEAR(driver.date_of_birth)) AS 'Idade_Atual', driver.name FROM driver
INNER JOIN driver_grand_prix ON driver.driver_id = driver_grand_prix.driver_id
WHERE driver_grand_prix.starting_position >= 1
GROUP BY driver.name
ORDER BY Idade_Atual ASC LIMIT 1;

/* Qual a idade dos Driver durante o GP da Austalia */
SELECT YEAR(grand_prix.year) - YEAR(driver.date_of_birth) AS 'Idade_do_Piloto', driver.name FROM driver
INNER JOIN driver_grand_prix ON driver.driver_id = driver_grand_prix.driver_id
INNER JOIN grand_prix ON driver_grand_prix.grand_prix_id = grand_prix.grand_prix_id
WHERE grand_prix.country = "Australia"
GROUP BY driver.name
ORDER BY Idade_do_Piloto ASC;

/* Mostre toda a informação que existe na BD */
SELECT * FROM grand_prix
INNER JOIN driver_grand_prix ON grand_prix.grand_prix_id = driver_grand_prix.grand_prix_id
INNER JOIN driver ON driver_grand_prix.driver_id = driver.driver_id
INNER JOIN driver_team ON driver.driver_id = driver_team.driver_id
INNER JOIN team ON driver_team.team_id = team.team_id
INNER JOIN car ON driver.car_id = car.car_id
INNER JOIN engine ON car.engine_id = engine.engine_id
INNER JOIN manufacturer ON engine.manufacturer_id = manufacturer.manufacturer_id;


/* FAZ A PARTIR DAQUI */ 
/* Lista dos vencedores dos GP's */
SELECT driver.name AS "WINNER", grand_prix.country AS "GP" FROM driver
INNER JOIN driver_grand_prix ON driver.driver_id = driver_grand_prix.driver_id 
INNER JOIN grand_prix ON driver_grand_prix.grand_prix_id = grand_prix.grand_prix_id
WHERE driver_grand_prix.finishing_position = 1;

/* Media da posição final do Driver Valtteri Bottas */
SELECT ROUND(AVG(driver_grand_prix.finishing_position),1) AS "Média da posiçao final" FROM driver_grand_prix
INNER JOIN driver ON driver_grand_prix.driver_id = driver.driver_id
WHERE driver.name = "Valtteri Bottas";

/* Drivers mais velhos que pontuaram fora do podium na China */
SELECT MAX(YEAR(CURDATE())-YEAR(driver.date_of_birth)) AS "idade", driver.name FROM driver
INNER JOIN driver_grand_prix ON driver.driver_id = driver_grand_prix.driver_id
INNER JOIN grand_prix ON driver_grand_prix.grand_prix_id = grand_prix.grand_prix_id
WHERE driver_grand_prix.finishing_position >= 4 AND driver_grand_prix.finishing_position <= 10 AND grand_prix.country="China"
GROUP BY driver.name 
ORDER BY idade DESC 
LIMIT 5;

/* Lista dos drivers e respetivas equipas */
SELECT driver.name AS "Driver", driver.number AS "Number", team.name AS "Team" FROM driver
INNER JOIN driver_team ON driver.driver_id = driver_team.driver_id
INNER JOIN team ON driver_team.team_id = team.team_id
ORDER BY driver.driver_id;


