CREATE USER IF NOT EXISTS 'discord'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pswd';
GRANT ALL PRIVILEGES ON pokedex.* TO 'discord'@'localhost';
flush privileges;

drop database if exists pokedex;
create database pokedex;
use pokedex;

CREATE TABLE Region (
    region_name VARCHAR(64) PRIMARY KEY,
    region_description VARCHAR(1024) NULL
);

insert into region values
("Kanto","The Kanto region is a region of the Pokemon world. It is located east of Johto, and as revealed by the radio show Sinnoh Sound, is located south of Sinnoh. It was the first region to be introduced. It is the setting of the Generation I games, FireRed and LeafGreen, and Let's Go, Pikachu! and Let's Go, Eevee!; it is also accessible in Pokemon Gold, Silver, Crystal, HeartGold, and SoulSilver after the quest in Johto is completed."),
("Johto","The Johto region is a region of the Pokemon world. It is located west of Kanto, and as revealed by the radio show Sinnoh Sound, is located south of Sinnoh. It is the setting of Pokemon Gold, Silver, Crystal, HeartGold, and SoulSilver. Johto and Kanto are part of a large landmass, with everything west of Indigo Plateau falling in the Johto region. It was the second main series region to be introduced."),
("Hoenn","The Hoenn region is a region of the Pokemon world. It is located south of Sinnoh. It is the setting of Pokemon Ruby, Sapphire, Emerald, Omega Ruby, and Alpha Sapphire. It was the third main series region to be introduced."),
("Sinnoh","The Sinnoh region is a region of the Pokemon world. It is located north of Kanto, Johto, and Hoenn. It is the setting of Pokemon Diamond, Pearl, and Platinum. It was the fourth main series region to be introduced. Sinnoh is composed of the large mainland, the north-eastern island of the Battle Zone, and several smaller islands on both sides of the region. Most of Sinnoh's routes are on land, having very few water routes, in vast contrast to Hoenn. The region is divided by Mt. Coronet, roughly comparable to how the continent that Kanto and Johto make up is essentially a contiguous region."),
("Unova","The Unova region is a region of the Pokemon world. It is the setting of Pokemon Black and White and Pokemon Black 2 and White 2. It was the fifth main series region to be introduced. It is far away from the four other large regions, and the Pokemon which inhabit Unova are diverse and different from those of Kanto, Johto, Hoenn, and Sinnoh. In his director's column, Junichi Masuda suggested that the geographical and social background for Unova draws inspiration from the New York City metropolitan area. Although it is geographically based on New York City, it draws inspiration for its landmarks from the entire state of New York, which features a mixture of rural locations and urban areas as well as factory towns and industrial complexes."),
("Kalos","Kalos is a region of the Pokemon world. It is the setting of Pokemon X and Y. It was the sixth main series region to be introduced. The Kalos region is shaped like a five-pointed star, with one of its biggest cities being Lumiose City in the north-central part of the region. It features a vast network of rivers and waterways snaking through much of its landscape, cities and towns. North-east of Lumiose City lies a mountain range where more frigid temperatures exist, extending down into the plains below. Western Kalos features a vast ocean, where the shoreside city of Shalour City lies in the middle of a cove."),
("Alola","Alola is a region of the Pokemon world. It is the setting of Pokemon Sun, Moon, Ultra Sun, and Ultra Moon. It was the seventh main series region to be introduced. The Alola region is made up of four natural islands and one artificial island: Melemele Island, Akala Island, Ula'ula Island, Poni Island, and Aether Paradise. It is a popular resort destination and attracts a lot of tourists from other regions. In Alola, humans and Pokemon coexist in a very close relationship, and a culture has developed that is different from other regions.");

drop table professor;
CREATE TABLE Professor (
    professor_id varchar(64) not null, #discord id string
	professor_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (professor_id),
    gender ENUM("Female", "Male") null,
    homeregion varchar(64) not null,
    hometown varchar(64) not null,
    foreign key (homeregion) references Region (region_name)
    on update restrict on delete restrict
);

#person subclass
drop table trainer;
CREATE TABLE Trainer (
    trainer_id varchar(64) not null, #discord id string
    PRIMARY KEY (trainer_id),
	trainer_name VARCHAR(128) NOT NULL
);

CREATE TABLE EggGroup (
    egg_group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(256) NOT NULL
);
select * from egggroup;

CREATE TABLE Item (
    item_name VARCHAR(64) PRIMARY KEY,
    item_description VARCHAR(256) NOT NULL
);
select * from item;

CREATE TABLE PokemonType (
    type_name VARCHAR(32) PRIMARY KEY
);

drop table typerelationship;
CREATE TABLE TypeRelationship (
    attacking_type VARCHAR(32) NOT NULL,
    defending_type VARCHAR(32) NOT NULL,
    multiplier decimal(3,2) NOT NULL,
    PRIMARY KEY (attacking_type , defending_type),
    FOREIGN KEY (attacking_type)
        REFERENCES PokemonType (type_name)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (defending_type)
        REFERENCES PokemonType (type_name)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

drop table pokemonmove;
CREATE TABLE PokemonMove (
    move_id INT PRIMARY KEY,
    power INT NULL,
    move_name varchar(32) not null,
    atk_type ENUM('Physical', 'Special', 'Status'),
    move_pp int not null,
    type_name VARCHAR(32) NOT NULL,
    accuracy decimal(3,2) null,
    FOREIGN KEY (type_name)
        REFERENCES PokemonType (type_name)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

drop table pokemon;
CREATE TABLE Pokemon (
    pokemon_id INT NOT NULL,
	p_name VARCHAR(64) NOT NULL,
    PRIMARY KEY (p_name),
    professor_id varchar(64) NOT NULL,
    FOREIGN KEY (professor_id)
        REFERENCES Professor (professor_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	height INT NOT NULL,
    weight decimal(7,2) NOT NULL,
    gender_ratio_wild decimal(6,3) NOT NULL,
    ability1 varchar(64) not null,
    ability2 varchar(64) null,
    hidden_ability varchar(64) null,
	egg_group INT NOT NULL,
    egg_group_2 INT NULL,
	FOREIGN KEY (egg_group)
        REFERENCES EggGroup (egg_group_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (egg_group_2)
        REFERENCES EggGroup (egg_group_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	ev_health TINYINT NOT NULL, # all amt given by feinting this pokemon
	ev_atk TINYINT NOT NULL,
    ev_def TINYINT NOT NULL,
    ev_spatk TINYINT NOT NULL,
	ev_spdef TINYINT NOT NULL,
	ev_spd TINYINT NOT NULL,
	pokemon_type_1 varchar(32) not null,
    pokemon_type_2 varchar(32) null,
    foreign key (pokemon_type_1) references PokemonType (type_name),
	foreign key (pokemon_type_2) references PokemonType (type_name)
);

select * from pokemon;
drop table pokemonlocation;
CREATE TABLE PokemonLocation (
    poke_name varchar(64) NOT NULL,
    region_name VARCHAR(64) not null,
    PRIMARY KEY (poke_name, region_name),
    FOREIGN KEY (poke_name)
        REFERENCES Pokemon (p_name)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (region_name)
        REFERENCES Region (region_name)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

select count(*) from pokemonlocation;
select * from pokemon where p_name = "spewpa";
# this should only be created once a pokemon has been caught
drop table pokestat;
CREATE TABLE PokeStat (
    nick_name varchar(64) not null,
	poke_name varchar(64) not null,
    FOREIGN KEY (poke_name)
        REFERENCES Pokemon (p_name)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    trainer_id varchar(64) NOT NULL,
    FOREIGN KEY (trainer_id)
        REFERENCES Trainer (trainer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	primary key (nick_name, trainer_id),
    move1 INT NULL,
    FOREIGN KEY (move1)
        REFERENCES PokemonMove (move_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    move2 INT NULL,
    FOREIGN KEY (move2)
        REFERENCES PokemonMove (move_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    move3 INT NULL,
    FOREIGN KEY (move3)
        REFERENCES PokemonMove (move_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    move4 INT NULL,
    FOREIGN KEY (move4)
        REFERENCES PokemonMove (move_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    health INT NOT NULL,
    spdef INT NOT NULL,
    def INT NOT NULL,
    atk INT NOT NULL,
    spd INT NOT NULL,
    spatk INT NOT NULL,
    iv_health TINYINT NOT NULL,
    iv_spdef TINYINT NOT NULL,
    iv_def TINYINT NOT NULL,
    iv_atk TINYINT NOT NULL,
    iv_spd TINYINT NOT NULL,
    iv_spatk TINYINT NOT NULL,
    gender ENUM('F', 'M', 'Genderless') NOT NULL,
    pokemon_level INT NOT NULL
);

delimiter //
drop procedure createStat //
create procedure createStat(in nick_name varchar(64), in poke_name varchar(64), in trainer_id varchar(64),
	in health INT, in spdef INT, in def INT, in atk INT, in spd INT, in spatk INT, in iv_health TINYINT,
    in iv_spdef TINYINT, in iv_def TINYINT, in iv_atk TINYINT, in iv_spd TINYINT, in iv_spatk TINYINT,
    in gender ENUM('F', 'M', 'Genderless'), in pokemon_level INT)
	BEGIN
	INSERT INTO `pokedex`.`pokestat` (`nick_name`, `poke_name`, `trainer_id`, `health`, `spdef`, `def`,
		`atk`, `spd`, `spatk`, `iv_health`, `iv_spdef`, `iv_def`, `iv_atk`, `iv_spd`, `iv_spatk`, `gender`, `pokemon_level`)
VALUES (nick_name, poke_name, trainer_id, health, spdef, def, atk, spd, spatk, iv_health, iv_spdef, iv_def,
		iv_atk, iv_spd, iv_spatk, gender, pokemon_level);
END//

delimiter ;
drop table evolution;
CREATE TABLE Evolution (
    pre_poke_name VARCHAR(64) NOT NULL,
    item VARCHAR(64) NULL,
    post_poke_name VARCHAR(64) NOT NULL,
    evo_description VARCHAR(256) NULL,
    PRIMARY KEY (pre_poke_name , post_poke_name),
    FOREIGN KEY (item)
        REFERENCES Item (item_name)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (pre_poke_name)
        REFERENCES Pokemon (p_name)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (post_poke_name)
        REFERENCES Pokemon (p_name)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

drop table PokemonTeam;
CREATE TABLE PokemonTeam (
    team_trainer varchar(64) NOT NULL,
    team_name VARCHAR(64) NOT NULL,
    FOREIGN KEY (team_trainer)
        REFERENCES Trainer (trainer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    PRIMARY KEY (team_trainer , team_name),
    pokemon1 VARCHAR(64) NULL, #nick name
    pokemon2 VARCHAR(64) NULL,
    pokemon3 VARCHAR(64) NULL,
    pokemon4 VARCHAR(64) NULL,
    pokemon5 VARCHAR(64) NULL,
    pokemon6 VARCHAR(64) NULL,
    FOREIGN KEY (pokemon1, team_trainer)
        REFERENCES PokeStat (nick_name, trainer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (pokemon2, team_trainer)
        REFERENCES PokeStat (nick_name, trainer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (pokemon3, team_trainer)
        REFERENCES PokeStat (nick_name, trainer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (pokemon4, team_trainer)
        REFERENCES PokeStat (nick_name, trainer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (pokemon5, team_trainer)
        REFERENCES PokeStat (nick_name, trainer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (pokemon6, team_trainer)
        REFERENCES PokeStat (nick_name, trainer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);
select * from trainer;
select * from pokestat;
select * from pokemonteam;

delimiter // 

drop trigger removeStatRow //
create trigger removeStatRow
AFTER DELETE ON pokemonteam for each row
begin
	delete from pokestat where old.team_trainer = pokestat.trainer_id and
		(pokestat.nick_name = old.pokemon1 or 
        pokestat.nick_name = old.pokemon2 or 
        pokestat.nick_name = old.pokemon3 or 
        pokestat.nick_name = old.pokemon4 or 
        pokestat.nick_name = old.pokemon5 or 
        pokestat.nick_name = old.pokemon6);
end //

drop trigger removeStat //
create trigger removeStat
AFTER update ON pokemonteam for each row
begin
	if new.pokemon1 is null and old.pokemon1 is not null then
		delete from pokestat where old.pokemon1 = pokestat.nick_name and old.team_trainer=pokestat.trainer_id;
        
	elseif new.pokemon2 is null and old.pokemon2 is not null then
		delete from pokestat where old.pokemon2 = pokestat.nick_name and old.team_trainer=pokestat.trainer_id;
        
	elseif new.pokemon3 is null and old.pokemon3 is not null then
		delete from pokestat where old.pokemon3 = pokestat.nick_name and old.team_trainer=pokestat.trainer_id;
        
	elseif new.pokemon4 is null and old.pokemon4 is not null then
		delete from pokestat where old.pokemon4 = pokestat.nick_name and old.team_trainer=pokestat.trainer_id;
        
	elseif new.pokemon5 is null and old.pokemon5 is not null then
		delete from pokestat where old.pokemon5 = pokestat.nick_name and old.team_trainer=pokestat.trainer_id;
        
	elseif new.pokemon6 is null and old.pokemon6 is not null then
		delete from pokestat where old.pokemon6 = pokestat.nick_name and old.team_trainer=pokestat.trainer_id;
	end if;
end //

delimiter ;

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
			SELECT p_name AS pokemon_name FROM pokemon LIMIT 50;
		ELSEIF type1 = 'x' AND type2 = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (egg_grp = egg_group OR egg_grp = egg_group_2) LIMIT 50;
		ELSEIF type1 = 'x' AND egg_grp = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type2 = pokemon_type_1 OR type2 = pokemon_type_2) LIMIT 50;
		ELSEIF type2 = 'x' AND egg_grp = 'x' THEN
            SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) LIMIT 50;
		ELSEIF type1 = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type2 = pokemon_type_1 OR type2 = pokemon_type_2)
					AND (egg_grp = egg_group OR egg_grp = egg_group_2) LIMIT 50;
		ELSEIF type2 = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) 
					AND (egg_grp = egg_group OR egg_grp = egg_group_2) LIMIT 50;
		ELSEIF egg_grp = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) 
					AND (type2 = pokemon_type_1 OR type2 = pokemon_type_2) LIMIT 50;
		ELSE
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) 
					AND (type2 = pokemon_type_1 OR type2 = pokemon_type_2)
					AND (egg_grp = egg_group OR egg_grp = egg_group_2) LIMIT 50;
		END IF;
	END$$
    
CALL group_search('x', 'fire', 'x')$$
CALL group_search('fire', 'fighting', 'x')$$

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
    

call size_search('>', '10', '<', '50'); $$

-- displays all of the pokemon from the given region
DROP PROCEDURE IF EXISTS pokemon_in_region$$
CREATE PROCEDURE pokemon_in_region(IN region VARCHAR(64))
	BEGIN
		SELECT poke_name AS pokemon_name FROM pokemonlocation
        WHERE region_name = region;
    END$$
    
DROP FUNCTION IF EXISTS trainer_exists$$
CREATE FUNCTION trainer_exists(disc_id VARCHAR(64))
    RETURNS BOOLEAN DETERMINISTIC
    BEGIN
        DECLARE exist INT;
        SELECT COUNT(*) FROM trainer WHERE trainer_id = disc_id INTO exist;
        IF exist > 0 THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END$$
    
-- register a user as a trainer
DROP PROCEDURE IF EXISTS register_trainer$$
CREATE PROCEDURE register_trainer(IN id varchar(64), IN uname VARCHAR(32))
	BEGIN
		INSERT INTO trainer
		VALUES(id, uname);
	END$$
CALL register_trainer('Sophie')$$

select * from trainer $$

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

DROP PROCEDURE IF EXISTS greatestweakness $$
DELIMITER //
CREATE PROCEDURE greatestweakness
(IN trainer_id_in varchar(64), IN team_name_in VARCHAR(64))
BEGIN
	#names of all pokemon on the team
	DECLARE p1 VARCHAR(64);
    DECLARE p2 VARCHAR(64);
    DECLARE p3 VARCHAR(64);
    DECLARE p4 VARCHAR(64);
    DECLARE p5 VARCHAR(64);
    DECLARE p6 VARCHAR(64);
    
    #types of all the pokemon on the team
	DECLARE p1type1 VARCHAR(32);
	DECLARE p1type2 VARCHAR(32);
    DECLARE p2type1 VARCHAR(32);
	DECLARE p2type2 VARCHAR(32);
    DECLARE p3type1 VARCHAR(32);
	DECLARE p3type2 VARCHAR(32);
    DECLARE p4type1 VARCHAR(32);
	DECLARE p4type2 VARCHAR(32);
    DECLARE p5type1 VARCHAR(32);
	DECLARE p5type2 VARCHAR(32);
    DECLARE p6type1 VARCHAR(32);
	DECLARE p6type2 VARCHAR(32);
    
    
    #getting the pokemon nicknames from the given team

    SELECT pokemon1 FROM pokemonteam WHERE team_trainer = trainer_id_in AND team_name = team_name_in into p1;
    SELECT pokemon2 FROM pokemonteam WHERE team_trainer = trainer_id_in AND team_name = team_name_in into p2;
    SELECT pokemon3 FROM pokemonteam WHERE team_trainer = trainer_id_in AND team_name = team_name_in into p3;
    SELECT pokemon4 FROM pokemonteam WHERE team_trainer = trainer_id_in AND team_name = team_name_in into p4;
    SELECT pokemon5 FROM pokemonteam WHERE team_trainer = trainer_id_in AND team_name = team_name_in into p5;
    SELECT pokemon6 FROM pokemonteam WHERE team_trainer = trainer_id_in AND team_name = team_name_in into p6;
    
    #getting the pokemon types from the given team
    SELECT pokemon_type_1 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p1 and trainer_id = trainer_id_in INTO p1type1;
    
    SELECT pokemon_type_2 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p1 and trainer_id = trainer_id_in INTO p1type2;
    
    SELECT pokemon_type_1 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p2 and trainer_id = trainer_id_in INTO p2type1;
    
    SELECT pokemon_type_2 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p2 and trainer_id = trainer_id_in INTO p2type2;
    
    SELECT pokemon_type_1 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p3 and trainer_id = trainer_id_in INTO p3type1;
    
    SELECT pokemon_type_2 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p3 and trainer_id = trainer_id_in INTO p3type2;
    
    SELECT pokemon_type_1 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p4 and trainer_id = trainer_id_in INTO p4type1;
    
    SELECT pokemon_type_2 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p4 and trainer_id = trainer_id_in INTO p4type2;
    
	SELECT pokemon_type_1 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p5 and trainer_id = trainer_id_in INTO p5type1;
    
    SELECT pokemon_type_2 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p5 and trainer_id = trainer_id_in INTO p5type2;
    
	SELECT pokemon_type_1 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p6 and trainer_id = trainer_id_in INTO p6type1;
    
    SELECT pokemon_type_2 FROM 
	(SELECT * FROM pokestat) as t
	LEFT JOIN
	(SELECT p_name, pokemon_type_1, pokemon_type_2 FROM pokemon) as ta
	on t.poke_name = ta.p_name WHERE nick_name = p6 and trainer_id = trainer_id_in INTO p6type2;
    
	SELECT pokemon_type_1 FROM pokemon WHERE p_name = p1 INTO p1type1;
	SELECT pokemon_type_2 FROM pokemon WHERE p_name = p1 INTO p1type2;
    SELECT pokemon_type_1 FROM pokemon WHERE p_name = p2 INTO p2type1;
	SELECT pokemon_type_2 FROM pokemon WHERE p_name = p2 INTO p2type2;
    SELECT pokemon_type_1 FROM pokemon WHERE p_name = p3 INTO p3type1;
	SELECT pokemon_type_2 FROM pokemon WHERE p_name = p3 INTO p3type2;
    SELECT pokemon_type_1 FROM pokemon WHERE p_name = p4 INTO p4type1;
	SELECT pokemon_type_2 FROM pokemon WHERE p_name = p4 INTO p4type2;
    SELECT pokemon_type_1 FROM pokemon WHERE p_name = p5 INTO p5type1;
	SELECT pokemon_type_2 FROM pokemon WHERE p_name = p5 INTO p5type2;
    SELECT pokemon_type_1 FROM pokemon WHERE p_name = p6 INTO p6type1;
	SELECT pokemon_type_2 FROM pokemon WHERE p_name = p6 INTO p6type2;
      
	#table of all the weakness
    DROP temporary TABLE if exists temp_table;
    CREATE temporary TABLE temp_table (weakness VARCHAR(64), multiplier double);
    

    #inserts first pokemons types
	IF (p1type2 IS NULL) THEN
			INSERT INTO temp_table (weakness, multiplier)
			SELECT attacking_type AS weakness, multiplier FROM typerelationship 
				WHERE (defending_type = p1type1) AND (multiplier > 1.0);
		ELSE
			INSERT INTO temp_table (weakness, multiplier)
			SELECT atype1 AS weakness, (multiplier1 * multiplier2) AS multiplier FROM
				((SELECT attacking_type AS atype1, multiplier AS multiplier1 FROM typerelationship
					WHERE (defending_type = p1type1)) x
				JOIN
                (SELECT attacking_type AS atype2, multiplier AS multiplier2 FROM typerelationship
					WHERE (defending_type = p1type2)) y
				ON x.atype1 = y.atype2)
			WHERE (multiplier1 * multiplier2) > 1;
		END IF;
    
    #inserts second pokemons types
	IF (p2type2 IS NULL) THEN
			INSERT INTO temp_table (weakness, multiplier)
			SELECT attacking_type AS weakness, multiplier FROM typerelationship 
				WHERE (defending_type = p2type1) AND (multiplier > 1.0);
		ELSE
			INSERT INTO temp_table (weakness, multiplier)
			SELECT atype1 AS weakness, (multiplier1 * multiplier2) AS multiplier FROM
				((SELECT attacking_type AS atype1, multiplier AS multiplier1 FROM typerelationship
					WHERE (defending_type = p2type1)) x
				JOIN
                (SELECT attacking_type AS atype2, multiplier AS multiplier2 FROM typerelationship
					WHERE (defending_type = p2type2)) y
				ON x.atype1 = y.atype2)
			WHERE (multiplier1 * multiplier2) > 1;
		END IF;
	 #inserts third pokemons types
	IF (p3type2 IS NULL) THEN
			INSERT INTO temp_table (weakness, multiplier)
			SELECT attacking_type AS weakness, multiplier FROM typerelationship 
				WHERE (defending_type = p3type1) AND (multiplier > 1.0);
		ELSE
			INSERT INTO temp_table (weakness, multiplier)
			SELECT atype1 AS weakness, (multiplier1 * multiplier2) AS multiplier FROM
				((SELECT attacking_type AS atype1, multiplier AS multiplier1 FROM typerelationship
					WHERE (defending_type = p3type1)) x
				JOIN
                (SELECT attacking_type AS atype2, multiplier AS multiplier2 FROM typerelationship
					WHERE (defending_type = p3type2)) y
				ON x.atype1 = y.atype2)
			WHERE (multiplier1 * multiplier2) > 1;
		END IF;
	
     #inserts fourth pokemons types
	IF (p4type2 IS NULL) THEN
			INSERT INTO temp_table (weakness, multiplier)
			SELECT attacking_type AS weakness, multiplier FROM typerelationship 
				WHERE (defending_type = p4type1) AND (multiplier > 1.0);
		ELSE
			INSERT INTO temp_table (weakness, multiplier)
			SELECT atype1 AS weakness, (multiplier1 * multiplier2) AS multiplier FROM
				((SELECT attacking_type AS atype1, multiplier AS multiplier1 FROM typerelationship
					WHERE (defending_type = p4type1)) x
				JOIN
                (SELECT attacking_type AS atype2, multiplier AS multiplier2 FROM typerelationship
					WHERE (defending_type = p4type2)) y
				ON x.atype1 = y.atype2)
			WHERE (multiplier1 * multiplier2) > 1;
		END IF;
	
     #inserts fifth pokemons types
	IF (p5type2 IS NULL) THEN
			INSERT INTO temp_table (weakness, multiplier)
			SELECT attacking_type AS weakness, multiplier FROM typerelationship 
				WHERE (defending_type = p5type1) AND (multiplier > 1.0);
		ELSE
			INSERT INTO temp_table (weakness, multiplier)
			SELECT atype1 AS weakness, (multiplier1 * multiplier2) AS multiplier FROM
				((SELECT attacking_type AS atype1, multiplier AS multiplier1 FROM typerelationship
					WHERE (defending_type = p5type1)) x
				JOIN
                (SELECT attacking_type AS atype2, multiplier AS multiplier2 FROM typerelationship
					WHERE (defending_type = p5type2)) y
				ON x.atype1 = y.atype2)
			WHERE (multiplier1 * multiplier2) > 1;
		END IF;
	
     #inserts sixth pokemons types
	IF (p6type2 IS NULL) THEN
			INSERT INTO temp_table (weakness, multiplier)
			SELECT attacking_type AS weakness, multiplier FROM typerelationship 
				WHERE (defending_type = p6type1) AND (multiplier > 1.0);
		ELSE
			INSERT INTO temp_table (weakness, multiplier)
			SELECT atype1 AS weakness, (multiplier1 * multiplier2) AS multiplier FROM
				((SELECT attacking_type AS atype1, multiplier AS multiplier1 FROM typerelationship
					WHERE (defending_type = p6type1)) x
				JOIN
                (SELECT attacking_type AS atype2, multiplier AS multiplier2 FROM typerelationship
					WHERE (defending_type = p6type2)) y
				ON x.atype1 = y.atype2)
			WHERE (multiplier1 * multiplier2) > 1;
		END IF;
	SELECT weakness, SUM(multiplier) as multiplier FROM temp_table GROUP BY weakness;
END //

delimiter ;
select * from trainer;
select * from pokemonteam;
select * from pokestat;
call greatestweakness("179370789169004546", "blazes");

## >team teamname 
## discord side inserts trainer id
delimiter ;
SELECT * FROM pokemonteam;
call greatestdefense("170293231890857984", "hewwo");
SELECT * FROM pokemonteam;
## >team teamname 
## discord side inserts trainer id
DROP PROCEDURE IF EXISTS team;
DELIMITER //
CREATE PROCEDURE team
(IN trainer_id_in varchar(64), IN team_name_in VARCHAR(64))
BEGIN
	DECLARE p1nickname VARCHAR(64);
    DECLARE p2nickname VARCHAR(64);
    DECLARE p3nickname VARCHAR(64);
    DECLARE p4nickname VARCHAR(64);
    DECLARE p5nickname VARCHAR(64);
    DECLARE p6nickname VARCHAR(64);
    
    #get nicknames of pokemon in the team
    SELECT pokemon1 FROM pokemonteam where team_trainer=trainer_id_in and team_name = team_name_in into p1nickname;
    SELECT pokemon2 FROM pokemonteam where team_trainer=trainer_id_in and team_name = team_name_in into p2nickname;
    SELECT pokemon3 FROM pokemonteam where team_trainer=trainer_id_in and team_name = team_name_in into p3nickname;
    SELECT pokemon4 FROM pokemonteam where team_trainer=trainer_id_in and team_name = team_name_in into p4nickname;
    SELECT pokemon5 FROM pokemonteam where team_trainer=trainer_id_in and team_name = team_name_in into p5nickname;  
    SELECT pokemon6 FROM pokemonteam where team_trainer=trainer_id_in and team_name = team_name_in into p6nickname;    
	SELECT team_trainer, team_name, p1_nickname, p1, p2_nickname, p2, p3_nickname, p3, p4_nickname, p4, p5_nickname, p5, p6_nickname, poke_name as p6 FROM
		(SELECT team_trainer, team_name, p1_nickname, p1, p2_nickname, p2, p3_nickname, p3, p4_nickname, p4, p5_nickname, poke_name as p5, p6_nickname FROM
			(SELECT team_trainer, team_name, p1_nickname, p1, p2_nickname, p2, p3_nickname, p3, p4_nickname, poke_name as p4, p5_nickname, p6_nickname FROM
				(SELECT team_trainer, team_name, p1_nickname, p1, p2_nickname, p2, p3_nickname, poke_name as p3, p4_nickname, p5_nickname, p6_nickname FROM
					(SELECT team_trainer, team_name, p1_nickname, p1, p2_nickname, poke_name as p2, p3_nickname, p4_nickname, p5_nickname, p6_nickname FROM
						(SELECT team_trainer, team_name, pokemon1 as p1_nickname, poke_name as p1, pokemon2 as p2_nickname, pokemon3 as p3_nickname, pokemon4 as p4_nickname, pokemon5 as p5_nickname, pokemon6 as p6_nickname FROM
							(SELECT * FROM pokemonteam where team_trainer=trainer_id_in and team_name = team_name_in) as t1
							LEFT JOIN
							(SELECT * FROM pokestat WHERE nick_name = p1nickname and trainer_id = trainer_id_in) as t2
							on  t1.pokemon1 = t2.nick_name) as t3
						LEFT JOIN
						(SELECT * FROM pokestat WHERE nick_name = p2nickname and trainer_id = trainer_id_in) as t4
						on t3.p2_nickname = t4.nick_name) as t5
					LEFT JOIN
					(SELECT * FROM pokestat  WHERE nick_name = p3nickname and trainer_id = trainer_id_in) as t6
					on t5.p3_nickname = t6.nick_name) as t7
				LEFT JOIN
				(SELECT * FROM pokestat WHERE nick_name = p4nickname and trainer_id = trainer_id_in) as t8
				on t7.p4_nickname = t8.nick_name) as t9
			LEFT JOIN
            (SELECT * FROM pokestat WHERE nick_name = p5nickname and trainer_id = trainer_id_in) as t10
            on t9.p5_nickname = t10.nick_name) as t11
		LEFT JOIN
        (SELECT * FROM pokestat WHERE nick_name = p6nickname and trainer_id = trainer_id_in) as t12
        on t11.p6_nickname = t12.nick_name;
        
			
END //
DELIMITER ;

call team("179370789169004546", 'test');
select * from pokestat;
select * from pokemonteam;

delimiter //
drop function if exists team_exists//
create function team_exists(trainer_id varchar(64), tname varchar(64))
returns boolean deterministic
begin
	if exists (select * from pokemonteam where team_trainer = trainer_id and team_name = tname) then
    return true;
    else
    return false;
    end if;
end//
delimiter ;
select team_exists("179370789169004546", 'ketadsfchup');

DROP PROCEDURE IF EXISTS createteam;
DELIMITER //
CREATE PROCEDURE createteam
(IN trainer_id varchar(64), IN team_name_in VARCHAR(64))
BEGIN
	INSERT INTO pokemonteam VALUES(trainer_id, team_name_in);
END //
DELIMITER ;

## >deleteteam teamname
## discord side inserts trainer id and checks to see if the team name and id exists
DROP PROCEDURE IF EXISTS deleteteam;
DELIMITER //
CREATE PROCEDURE deleteteam
(IN trainer_id VARCHAR(64), IN team_name_in VARCHAR(64))
BEGIN
	DELETE FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = team_name_in;
END //
DELIMITER ;
select * from pokemonteam;
select * from pokestat;
call deleteteam("179370789169004546", "BLAZIKENRULES");

delimiter //

DROP FUNCTION IF EXISTS pokemon_exists//
CREATE FUNCTION pokemon_exists(poke_name varchar(64))
returns boolean DETERMINISTIC
BEGIN
	IF EXISTS (SELECT p_name from pokemon where p_name = poke_name) then
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END //

select pokemon_exists(';') //
DROP FUNCTION IF EXISTS which_row //
# returns the free row in a team
CREATE FUNCTION which_row(trainer_id varchar(64), tname varchar(64))
returns int deterministic
BEGIN
	#names of all pokemon on the team
	DECLARE p1 VARCHAR(64);
    DECLARE p2 VARCHAR(64);
    DECLARE p3 VARCHAR(64);
    DECLARE p4 VARCHAR(64);
    DECLARE p5 VARCHAR(64);
    DECLARE p6 VARCHAR(64);
    
    #getting the pokemon names from the given team
    SELECT pokemon1 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p1;
    SELECT pokemon2 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p2;
    SELECT pokemon3 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p3;
    SELECT pokemon4 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p4;
    SELECT pokemon5 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p5;
    SELECT pokemon6 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p6;
    
    if p1 is null 
		then return 1;
    elseif p2 is null 
		then return 2;
    elseif p3 is null 
		then return 3;
    elseif p4 is null 
		then return 4;
    elseif p5 is null
		then return 5;
    else
		return 6;
    end if;
end //
delimiter ;

delimiter //
DROP FUNCTION IF EXISTS team_has //
CREATE FUNCTION team_has(trainer_id varchar(64), tname varchar(64), nickname varchar(64))
returns boolean deterministic
begin
	IF EXISTS(select * from pokemonteam WHERE team_trainer = trainer_id AND team_name = tname
				AND (pokemon1 = nickname or pokemon2 = nickname or pokemon3 = nickname or pokemon4 = nickname
					or pokemon5 = nickname or pokemon6 = nickname)) then
		return true;
	else
		return false;
	end if;
end //
Delimiter ;


Delimiter //
DROP FUNCTION IF EXISTS which_rowname //
# returns the free row in a team
CREATE FUNCTION which_rowname(trainer_id varchar(64), tname varchar(64), nickname varchar(64))
returns int deterministic
BEGIN
	#names of all pokemon on the team
	DECLARE p1 VARCHAR(64);
    DECLARE p2 VARCHAR(64);
    DECLARE p3 VARCHAR(64);
    DECLARE p4 VARCHAR(64);
    DECLARE p5 VARCHAR(64);
    DECLARE p6 VARCHAR(64);
    
    #getting the pokemon names from the given team
    SELECT pokemon1 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p1;
    SELECT pokemon2 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p2;
    SELECT pokemon3 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p3;
    SELECT pokemon4 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p4;
    SELECT pokemon5 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p5;
    SELECT pokemon6 FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = tname into p6;
    
    if p1 = nickname 
		then return 1;
    elseif p2 = nickname
		then return 2;
    elseif p3 = nickname
		then return 3;
    elseif p4 = nickname 
		then return 4;
    elseif p5 = nickname
		then return 5;
    else
		return 6;
    end if;
end //

## >addtoteam teamname pokemonname
## discord side inserts trainer id
DROP PROCEDURE IF EXISTS deletefromteam;
DELIMITER //
CREATE PROCEDURE deletefromteam
(IN trainer_id varchar(64), IN team_name_in VARCHAR(64), IN whichrow INT)
BEGIN
	IF     whichrow = 1 THEN UPDATE pokemonteam SET pokemon1 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 2 THEN UPDATE pokemonteam SET pokemon2 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 3 THEN UPDATE pokemonteam SET pokemon3 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 4 THEN UPDATE pokemonteam SET pokemon4 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 5 THEN UPDATE pokemonteam SET pokemon5 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSE  					 UPDATE pokemonteam SET pokemon6 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    END IF;
END //
DELIMITER ;

## >addtoteam teamname pokemonname
## discord side inserts trainer id, and next empty row and checks to see if the pokemon already exists in the team or the team is already full
DROP PROCEDURE IF EXISTS addtoteam;
DELIMITER //
CREATE PROCEDURE addtoteam
(IN trainer_id varchar(64), IN team_name_in VARCHAR(64), IN nickname VARCHAR(64), IN whichrow INT)
BEGIN
	IF     whichrow = 1 THEN UPDATE pokemonteam SET pokemon1 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 2 THEN UPDATE pokemonteam SET pokemon2 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 3 THEN UPDATE pokemonteam SET pokemon3 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 4 THEN UPDATE pokemonteam SET pokemon4 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 5 THEN UPDATE pokemonteam SET pokemon5 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSE  					 UPDATE pokemonteam SET pokemon6 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    END IF;
END //
DELIMITER ;

delimiter $$
-- register a user as a professor
DROP PROCEDURE IF EXISTS register_professor$$
CREATE PROCEDURE register_professor(IN prof_id varchar(64), IN uname VARCHAR(32), IN uname_gender VARCHAR(16), IN region VARCHAR(32), IN town VARCHAR(32))
	BEGIN
		INSERT INTO professor
		VALUES(prof_id, uname, uname_gender, region, town);
    END$$ 
select * from professor $$

-- returns the description of the given item    
DROP PROCEDURE IF EXISTS about_item$$
CREATE PROCEDURE about_item(IN i_name VARCHAR(32))
	BEGIN
		SELECT * FROM item WHERE item_name = i_name;
	END$$
select * from item $$
delimiter //
##	>pevolve pokemonname
DROP PROCEDURE IF EXISTS pevolve;
DELIMITER //
CREATE PROCEDURE pevolve
(IN pokemon_name VARCHAR(20))
BEGIN
	SELECT item, evo_description, post_poke_name FROM evolution WHERE pre_poke_name = pokemon_name;
END //
DELIMITER ;
call pevolve('piplup');