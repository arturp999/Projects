UPDATE driver
SET driver.name = "Valteri Botas"
WHERE driver.name = "Valtteri Bottas";

UPDATE engine
SET engine.displacement = 6000, engine_layout = "V12 BITURBO"
WHERE engine.manufacturer_id = 1;

UPDATE team
SET team.name = "Pay to Win F1 Team"
WHERE team.team_id = 10;

UPDATE car
SET car.name = "Renault Unreliable.19"
WHERE car.name like "Renault %";

UPDATE manufacturer
SET manufacturer.name = "Toyota"
WHERE manufacturer.name = "Honda";

UPDATE grand_prix
SET grand_prix.country = "Portugal" , grand_prix.track_name = "Autodromo do Estoril"
WHERE grand_prix.country = "Singapore";

UPDATE car
SET car.weight = 1500
WHERE car.name like "Will%";