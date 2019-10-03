USE pokedex;
DELIMITER $$

-- displays all of the information of the given pokemon
DROP PROCEDURE IF EXISTS pokemon_details$$
CREATE PROCEDURE pokemon_details(IN pokemon_name VARCHAR(64))
	BEGIN
    DECLARE egg_grp2 INT;
    SELECT egg_group_2 FROM pokemon WHERE p_name = pokemon_name INTO egg_grp2;
    IF egg_grp2 IS NULL THEN
		SELECT p_name AS pokemon_name, pokemon_id, professor_name, height, weight, 
				gender_ratio_wild, ability1, ability2, hidden_ability, egg_group1_name, NULL AS egg_group2_name, pokemon_type_1, pokemon_type_2 FROM
		((SELECT * FROM pokemon WHERE p_name = pokemon_name) AS x
		JOIN
		(SELECT professor_id, professor_name FROM professor) y
		JOIN
		(SELECT egg_group_id, group_name AS egg_group1_name FROM egggroup) g
		ON x.professor_id = y.professor_id AND x.egg_group = g.egg_group_id);
    ELSE
		SELECT p_name AS pokemon_name, pokemon_id, professor_name, height, weight, gender_ratio_wild, ability1, ability2, hidden_ability, egg_group1_name, egg_group2_name, pokemon_type_1, pokemon_type_2 FROM
		((SELECT * FROM pokemon WHERE p_name = pokemon_name) AS x
		JOIN
		(SELECT professor_id, professor_name FROM professor) y
		JOIN
		(SELECT egg_group_id, group_name AS egg_group1_name FROM egggroup) g
		JOIN
		(SELECT egg_group_id, group_name AS egg_group2_name FROM egggroup) j
		ON x.professor_id = y.professor_id AND x.egg_group = g.egg_group_id AND x.egg_group_2 = j.egg_group_id);
    END IF;
    END$$
    
    CALL pokemon_details('xerneas')$$

-- displays all of the pokemon which match the given information
DROP PROCEDURE IF EXISTS group_search$$
CREATE PROCEDURE group_search(IN type1 VARCHAR(32), IN type2 VARCHAR(32), IN egg_grp VARCHAR(32))
	BEGIN
		IF type1 = 'x' AND type2 = 'x' AND egg_grp = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon;
		ELSEIF type1 = 'x' AND type2 = 'x' THEN
			SELECT p_name AS pokemon_name FROM 
				(SELECT * FROM pokemon) x
                JOIN
                (SELECT * FROM egggroup) y
                ON (x.egg_group = y.egg_group_id) OR (x.egg_group_2 = y.egg_group_id)
                GROUP BY pokemon_name;
		ELSEIF type1 = 'x' AND egg_grp = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type2 = pokemon_type_1 OR type2 = pokemon_type_2)
                GROUP BY pokemon_name;
		ELSEIF type2 = 'x' AND egg_grp = 'x' THEN
            SELECT p_name AS pokemon_name FROM pokemon
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2)
                GROUP BY pokemon_name;
		ELSEIF type1 = 'x' THEN
			SELECT p_name AS pokemon_name FROM 
				(SELECT * FROM pokemon) x
                JOIN
                (SELECT * FROM egggroup) y
                ON (x.egg_group = y.egg_group_id) OR (x.egg_group_2 = y.egg_group_id)
                WHERE (type2 = pokemon_type_1 OR type2 = pokemon_type_2)
                GROUP BY pokemon_name;
		ELSEIF type2 = 'x' THEN
			SELECT p_name AS pokemon_name FROM 
				(SELECT * FROM pokemon) x
                JOIN
                (SELECT * FROM egggroup) y
                ON (x.egg_group = y.egg_group_id) OR (x.egg_group_2 = y.egg_group_id)
                WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2)
                GROUP BY pokemon_name;
		ELSEIF egg_grp = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) 
					AND (type2 = pokemon_type_1 OR type2 = pokemon_type_2)
                GROUP BY pokemon_name;
		ELSE
			SELECT p_name AS pokemon_name FROM 
				(SELECT * FROM pokemon) x
                JOIN
                (SELECT * FROM egggroup) y
                ON (x.egg_group = y.egg_group_id) OR (x.egg_group_2 = y.egg_group_id)
                WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) 
					AND (type2 = pokemon_type_1 OR type2 = pokemon_type_2)
                GROUP BY pokemon_name;
		END IF;
	END$$
    
CALL group_search('x', 'ice', 'grass1')$$

-- displays all of the pokemon from the given region
DROP PROCEDURE IF EXISTS pokemon_in_region$$
CREATE PROCEDURE pokemon_in_region(IN region VARCHAR(64))
	BEGIN
		SELECT poke_name AS pokemon_name FROM pokemonlocation
        WHERE region_name = region;
    END$$
    
CALL pokemon_in_region('hoenn')$$
    
-- displays all of the regions in which the given pokemon may reside/be found
DROP PROCEDURE IF EXISTS regions_of_pokemon$$
CREATE PROCEDURE regions_of_pokemon(IN p_name VARCHAR(32))
	BEGIN
		SELECT region_name FROM pokemonlocation
        WHERE poke_name = p_name;
	END$$

-- displays all of the types and multiplyers for a given pokemon's weaknesses
DROP PROCEDURE IF EXISTS poke_weaknesses$$
CREATE PROCEDURE poke_weaknesses(IN pokemon_name VARCHAR(32))
	BEGIN
		DECLARE type1 VARCHAR(32);
		DECLARE type2 VARCHAR(32);
		SELECT pokemon_type_1 FROM pokemon WHERE p_name = pokemon_name INTO type1;
		SELECT pokemon_type_2 FROM pokemon WHERE p_name = pokemon_name INTO type2;
            
		IF (type2 IS NULL) THEN
			SELECT attacking_type AS weakness, multiplier FROM typerelationship 
				WHERE (defending_type = type1) AND (multiplier > 1.0);
		ELSE
			SELECT atype1 AS weakness, (multiplier1 * multiplier2) AS multiplier FROM
				((SELECT attacking_type AS atype1, multiplier AS multiplier1 FROM typerelationship
					WHERE (defending_type = type1)) x
				JOIN
                (SELECT attacking_type AS atype2, multiplier AS multiplier2 FROM typerelationship
					WHERE (defending_type = type2)) y
				ON x.atype1 = y.atype2)
			WHERE (multiplier1 * multiplier2) > 1;
		END IF;
        END$$

CALL poke_weaknesses('charmander')$$

-- Sets the pokemon’s discovered by field to the given professor
DROP PROCEDURE IF EXISTS discover$$
CREATE PROCEDURE discover(IN poke_name VARCHAR(64), IN prof VARCHAR(64))
	BEGIN
    DECLARE prof_id INT;
    SELECT professor_id FROM professor WHERE professor_name = prof INTO prof_id;
    UPDATE pokemon SET professor_id = prof_id WHERE p_name = poke_name;    
    END$$
    
-- displays all of the types and multiplyers for a given pokemon's weaknesses
DROP PROCEDURE IF EXISTS poke_weaknesses$$
CREATE PROCEDURE poke_weaknesses(IN pokemon_name VARCHAR(32))
	BEGIN
		DECLARE type1 VARCHAR(32);
		DECLARE type2 VARCHAR(32);
		SELECT pokemon_type_1 FROM pokemon WHERE p_name = pokemon_name INTO type1;
		SELECT pokemon_type_2 FROM pokemon WHERE p_name = pokemon_name INTO type2;
            
		IF (type2 IS NULL) THEN
			SELECT attacking_type AS weakness, multiplier FROM typerelationship 
				WHERE (defending_type = type1) AND (multiplier > 1.0);
		ELSE
			SELECT atype1 AS weakness, (multiplier1 * multiplier2) AS multiplier FROM
				((SELECT attacking_type AS atype1, multiplier AS multiplier1 FROM typerelationship
					WHERE (defending_type = type1)) x
				JOIN
                (SELECT attacking_type AS atype2, multiplier AS multiplier2 FROM typerelationship
					WHERE (defending_type = type2)) y
				ON x.atype1 = y.atype2)
			WHERE (multiplier1 * multiplier2) > 1;
		END IF;
        END$$

CALL poke_weaknesses('charmander')$$

-- Sets the pokemon’s discovered by field to the given professor
DROP PROCEDURE IF EXISTS discover$$
CREATE PROCEDURE discover(IN poke_name VARCHAR(64), IN prof VARCHAR(64))
	BEGIN
    DECLARE prof_id INT;
    SELECT professor_id FROM professor WHERE professor_name = prof INTO prof_id;
    UPDATE pokemon SET professor_id = prof_id WHERE p_name = poke_name;    
    END$$
    
-- displays all pokemon with given attributes using the given operators
DROP PROCEDURE IF EXISTS size_search$$
CREATE PROCEDURE size_search(IN w_op VARCHAR(1), IN in_weight INT, IN h_op VARCHAR(1), IN in_height INT)
	BEGIN
    IF w_op = "<" AND h_op = "<" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight < in_weight AND height < in_height;
	ELSEIF w_op = ">" AND h_op = ">" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight > in_weight AND height > in_height;
	ELSEIF w_op = "=" AND h_op = "=" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight = in_weight AND height = in_height;
	ELSEIF w_op = "<" AND h_op = "=" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight < in_weight AND height = in_height;
	ELSEIF w_op = ">" AND h_op = "=" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight > in_weight AND height = in_height;
	ELSEIF w_op = "=" AND h_op = "<" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight = in_weight AND height < in_height;
	ELSEIF w_op = "=" AND h_op = ">" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight = in_weight AND height > in_height;
	ELSEIF w_op = "<" AND h_op = ">" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight < in_weight AND height > in_height;
	ELSEIF w_op = ">" AND h_op = "<" THEN
		SELECT p_name AS pokemon_name FROM pokemon WHERE weight > in_weight AND height < in_height;
	END IF;
    END$$

-- register a user as a trainer
DROP PROCEDURE IF EXISTS register_trainer$$
CREATE PROCEDURE register_trainer(IN uname VARCHAR(32))
	BEGIN
		INSERT INTO trainer(trainer_name)
		VALUES(uname);
	END$$
CALL register_trainer('Sophie')$$

-- register a user as a professor
DROP PROCEDURE IF EXISTS register_professor$$
CREATE PROCEDURE register_professor(IN uname VARCHAR(32), IN uname_gender VARCHAR(16), IN region VARCHAR(32), IN town VARCHAR(32))
	BEGIN
		INSERT INTO professor(professor_name, gender, homeregion, hometown)
		VALUES(uname, uname_gender, region, town);
    END$$ 

-- returns the description of the given item    
DROP PROCEDURE IF EXISTS about_item$$
CREATE PROCEDURE about_item(IN i_name VARCHAR(32))
	BEGIN
		SELECT * FROM item WHERE item_name = i_name;
	END$$
CALL about_item('amulet coin')$$
					     
					      

##	>pevolve pokemonname
DROP PROCEDURE IF EXISTS pevolve;
DELIMITER //
CREATE PROCEDURE pevolve
(IN pokemon_name VARCHAR(20))
BEGIN
	SELECT item, evo_description, post_poke_name FROM evolution WHERE pre_poke_name = pokemon_name;
END //
DELIMITER ;
CALL pevolve('piplup');

#INSERT INTO trainer VALUES(1, 'Ferret'); 

##	>createteam teamname
## discord side inserts trainer id and checks to see if the team name and id doesnt already exist
DROP PROCEDURE IF EXISTS createteam;
DELIMITER //
CREATE PROCEDURE createteam
(IN trainer_id INT, IN team_name_in VARCHAR(64))
BEGIN
	INSERT INTO pokemonteam(team_trainer, team_name, pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6) VALUES(trainer_id, team_name_in, NULL, NULL, NULL, NULL, NULL, NULL);
END //
DELIMITER ;
CALL createteam(1, 'best team');

## >deleteteam teamname
## discord side inserts trainer id and checks to see if the team name and id exists
DROP PROCEDURE IF EXISTS deleteteam;
DELIMITER //
CREATE PROCEDURE deleteteam
(IN trainer_id INT, IN team_name_in VARCHAR(64))
BEGIN
	DELETE FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = team_name_in;
END //
DELIMITER ;
CALL deleteteam(1, 'best team');

## >addtoteam teamname pokemonname
## discord side inserts trainer id, and next empty row and checks to see if the pokemon already exists in the team or the team is already full
DROP PROCEDURE IF EXISTS addtoteam;
DELIMITER //
CREATE PROCEDURE addtoteam
(IN trainer_id INT, IN team_name_in VARCHAR(64), IN pokemon_name VARCHAR(64), IN whichrow INT)
BEGIN
	IF     whichrow = 1 THEN UPDATE pokemonteam SET pokemon1 = pokemon_name WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 2 THEN UPDATE pokemonteam SET pokemon2 = pokemon_name WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 3 THEN UPDATE pokemonteam SET pokemon3 = pokemon_name WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 4 THEN UPDATE pokemonteam SET pokemon4 = pokemon_name WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 5 THEN UPDATE pokemonteam SET pokemon5 = pokemon_name WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSE  					 UPDATE pokemonteam SET pokemon6 = pokemon_name WHERE team_trainer = trainer_id AND team_name = team_name_in;
    END IF;
END //
DELIMITER ;

call addtoteam(1, 'best team', 'bidoof', 4);

## >team teamname 
## discord side inserts trainer id
DROP PROCEDURE IF EXISTS team;
DELIMITER //
CREATE PROCEDURE team
(IN trainer_id INT, IN team_name_in VARCHAR(64))
BEGIN
	SELECT team_name, pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = team_name_in;
END //
DELIMITER ;

call team(1, 'best team');


## >removefromteam teamname pokemonname
## discord side inserts trainer id, and column where pokemon is. Checks whether the pokemon is in the team
DROP PROCEDURE IF EXISTS removefromteam;
DELIMITER //
CREATE PROCEDURE removefromteam
(IN trainer_id INT, IN team_name_in VARCHAR(64), IN whichrow INT)
BEGIN
	IF     whichrow = 1 THEN UPDATE pokemonteam SET pokemon1 = NULL WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 2 THEN UPDATE pokemonteam SET pokemon2 = NULL WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 3 THEN UPDATE pokemonteam SET pokemon3 = NULL WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 4 THEN UPDATE pokemonteam SET pokemon4 = NULL WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 5 THEN UPDATE pokemonteam SET pokemon5 = NULL WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSE  					 UPDATE pokemonteam SET pokemon6 = NULL WHERE team_trainer = trainer_id AND team_name = team_name_in;
    END IF;
END //
DELIMITER ;

call removefromteam(1, 'best team', 4);	
					    
DROP FUNCTION IF EXISTS pokemon_exists$$
CREATE FUNCTION pokemon_exists(poke_name VARCHAR(32))
	RETURNS BOOLEAN DETERMINISTIC
	BEGIN
		DECLARE pexists INT;
        SELECT COUNT(*) FROM pokemon WHERE p_name = poke_name INTO pexists;
        IF pexists = 0 THEN
			RETURN FALSE;
		ELSE
			RETURN TRUE;
		END IF;
    END$$
    
DROP FUNCTION IF EXISTS discovered_by$$
CREATE FUNCTION discovered_by(prof_name VARCHAR(32), poke_name VARCHAR(32))
	RETURNS BOOLEAN DETERMINISTIC
    BEGIN
		DECLARE prof_id INT;
        DECLARE prof_poke INT;
        SELECT professor_id FROM professor WHERE professor_name = prof_name INTO prof_id;
        SELECT COUNT(*) FROM 
			(SELECT p_name FROM pokemon WHERE professor_id = prof_id) x
			WHERE p_name = poke_name INTO prof_poke;
        IF prof_poke > 0 THEN
			RETURN TRUE;
		ELSE
			RETURN FALSE;
        END IF;
    END$$

