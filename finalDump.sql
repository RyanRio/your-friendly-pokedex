CREATE DATABASE  IF NOT EXISTS `pokedex` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pokedex`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: pokedex
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `egggroup`
--

DROP TABLE IF EXISTS `egggroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `egggroup` (
  `egg_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(256) NOT NULL,
  PRIMARY KEY (`egg_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egggroup`
--

LOCK TABLES `egggroup` WRITE;
/*!40000 ALTER TABLE `egggroup` DISABLE KEYS */;
INSERT INTO `egggroup` VALUES (1,'Monster'),(2,'Water 1'),(3,'Water 2'),(4,'Water 3'),(5,'Bug'),(6,'Flying'),(7,'Field'),(8,'Fairy'),(9,'Grass'),(10,'Human-like'),(11,'Mineral'),(12,'Amorphous'),(13,'Ditto'),(14,'Dragon'),(15,'Undiscovered');
/*!40000 ALTER TABLE `egggroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evolution`
--

DROP TABLE IF EXISTS `evolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evolution` (
  `pre_poke_name` varchar(64) NOT NULL,
  `item` varchar(64) DEFAULT NULL,
  `post_poke_name` varchar(64) NOT NULL,
  `evo_description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`pre_poke_name`,`post_poke_name`),
  KEY `item` (`item`),
  KEY `post_poke_name` (`post_poke_name`),
  CONSTRAINT `evolution_ibfk_1` FOREIGN KEY (`item`) REFERENCES `item` (`item_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evolution_ibfk_2` FOREIGN KEY (`pre_poke_name`) REFERENCES `pokemon` (`p_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evolution_ibfk_3` FOREIGN KEY (`post_poke_name`) REFERENCES `pokemon` (`p_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolution`
--

LOCK TABLES `evolution` WRITE;
/*!40000 ALTER TABLE `evolution` DISABLE KEYS */;
INSERT INTO `evolution` VALUES ('Abomasnow','Razor Claw','Weavile','Night Level '),('Abra',NULL,'Kadabra','Lv. 16'),('Aerodactyl',NULL,'Snorlax','Friendship'),('Ampharos','Sun Stone','Bellossom',NULL),('Anorith',NULL,'Armaldo','Lv. 40'),('Arbok',NULL,'Pikachu','Friendship'),('Archen',NULL,'Archeops','Lv. 37'),('Ariados',NULL,'Crobat','Friendship'),('Aron',NULL,'Lairon','Lv. 32'),('Axew',NULL,'Fraxure','Lv. 38'),('Azumarill',NULL,'Sudowoodo','Level w/ Mimic'),('Bagon',NULL,'Shelgon','Lv. 30'),('Baltoy',NULL,'Claydol','Lv. 36'),('Barboach',NULL,'Whiscash','Lv. 30'),('Bayleef',NULL,'Meganium','Lv. 32'),('Beautifly',NULL,'Cascoon','Lv. 7'),('Beldum',NULL,'Metang','Lv. 20'),('Bellossom',NULL,'Marill','Friendship'),('Bellsprout',NULL,'Weepinbell','Lv. 21'),('Bidoof',NULL,'Bibarel','Lv. 15'),('Blitzle',NULL,'Zebstrika','Lv. 27'),('Boldore',NULL,'Gigalith','Trade'),('Braixen',NULL,'Delphox','Lv. 36'),('Bronzor',NULL,'Bronzong','Lv. 33'),('Buizel',NULL,'Floatzel','Lv. 26'),('Bulbasaur',NULL,'Ivysaur','Lv. 16'),('Buneary',NULL,'Lopunny','Friendship'),('Bunnelby',NULL,'Diggersby','Lv. 20'),('Burmy',NULL,'Mothim','Lv. 20M'),('Burmy','Plant Cloak','Wormadam (P)','Lv. 20F '),('Burmy','Sand Cloak','Wormadam (S)','Lv. 20F '),('Burmy','Trash Cloak','Wormadam (T)','Lv. 20F '),('Cacnea',NULL,'Cacturne','Lv. 32'),('Carvanha',NULL,'Sharpedo','Lv. 30'),('Cascoon',NULL,'Dustox','Lv. 10'),('Caterpie',NULL,'Metapod','Lv. 7'),('Charmander',NULL,'Charmeleon','Lv. 16'),('Charmeleon',NULL,'Squirtle','Lv. 36'),('Cherubi',NULL,'Cherrim','Lv. 25'),('Chespin',NULL,'Quilladin','Lv. 16'),('Chikorita',NULL,'Bayleef','Lv. 16'),('Chimchar',NULL,'Monferno','Lv. 14'),('Chinchou',NULL,'Lanturn','Lv. 27'),('Chingling',NULL,'Chimecho','Night Friendship'),('Clamperl','Deepseatooth','Huntail','Trade '),('Clefairy','Moon Stone','Clefable',NULL),('Combee',NULL,'Vespiquen','Lv. 21F'),('Combusken',NULL,'Blaziken','Lv. 36'),('Corphish',NULL,'Crawdaunt','Lv. 30'),('Cottonee','Sun Stone','Whimsicott',NULL),('Cranidos',NULL,'Rampardos','Lv. 30'),('Croagunk',NULL,'Toxicroak','Lv. 37'),('Croconaw',NULL,'Feraligatr','Lv. 30'),('Cubchoo',NULL,'Beartic','Lv. 37'),('Cubone',NULL,'Marowak','Lv. 28'),('Cyndaquil',NULL,'Quilava','Lv. 14'),('Darumaka',NULL,'Darmanitan','Lv. 35'),('Deerling',NULL,'Sawsbuck','Lv. 34'),('Deino',NULL,'Zweilous','Lv. 50'),('Dewott',NULL,'Samurott','Lv. 36'),('Diglett',NULL,'Dugtrio','Lv. 26'),('Doduo',NULL,'Dodrio','Lv. 31'),('Donphan','Up Grade','Porygon2','Trade'),('Dragonair',NULL,'Dragonite','Lv. 55'),('Dratini',NULL,'Dragonair','Lv. 30'),('Drifloon',NULL,'Drifblim','Lv. 28'),('Drilbur',NULL,'Excadrill','Lv. 31'),('Drowzee',NULL,'Hypno','Lv. 26'),('Ducklett',NULL,'Swanna','Lv. 35'),('Duosion',NULL,'Reuniclus','Lv. 41'),('Dusclops',NULL,'Froslass','Dawn StoneF'),('Duskull',NULL,'Dusclops','Lv. 37'),('Dwebble',NULL,'Crustle','Lv. 34'),('Eelektrik','Thunderstone','Eelektross',NULL),('Ekans',NULL,'Arbok','Lv. 22'),('Electabuzz','Electrizer','Electivire','Trade'),('Electabuzz',NULL,'Magmar','Lv. 30'),('Electrike',NULL,'Manectric','Lv. 26'),('Elgyem',NULL,'Beheeyem','Lv. 42'),('Exeggcute','Leaf Stone','Exeggutor',NULL),('Feebas',NULL,'Milotic','Level w/ Max Beauty'),('Fennekin',NULL,'Braixen','Lv. 16'),('Ferroseed',NULL,'Ferrothorn','Lv. 40'),('Finneon',NULL,'Lumineon','Lv. 31'),('Flaaffy',NULL,'Ampharos','Lv. 30'),('Fletchinder',NULL,'Talonflame','Lv. 35'),('Fletchling',NULL,'Fletchinder','Lv. 17'),('Foongus',NULL,'Amoonguss','Lv. 39'),('Fraxure',NULL,'Haxorus','Lv. 48'),('Frillish',NULL,'Jellicent','Lv. 40'),('Froakie',NULL,'Frogadier','Lv. 16'),('Frogadier',NULL,'Greninja','Lv. 36'),('Gabite',NULL,'Garchomp','Lv. 48'),('Gardevoir','Dawn Stone','Gallade',NULL),('Gastly',NULL,'Haunter','Lv. 25'),('Gastrodon',NULL,'Ambipom','Level w/ Double Hit'),('Geodude',NULL,'Graveler','Lv. 25'),('Gible',NULL,'Gabite','Lv. 24'),('Glameow',NULL,'Purugly','Lv. 38'),('Gligar','Metal Coat','Steelix','Trade '),('Gloom','Leaf Stone','Vileplume',NULL),('Goldeen',NULL,'Seaking','Lv. 33'),('Golett',NULL,'Golurk','Lv. 43'),('Gothita',NULL,'Gothorita','Lv. 32'),('Gothorita',NULL,'Gothitelle','Lv. 41'),('Graveler',NULL,'Golem','Trade'),('Grimer',NULL,'Muk','Lv. 38'),('Grotle',NULL,'Torterra','Lv. 32'),('Grovyle',NULL,'Sceptile','Lv. 36'),('Growlithe','Fire Stone','Arcanine',NULL),('Gulpin',NULL,'Swalot','Lv. 26'),('Gurdurr',NULL,'Conkeldurr','Trade'),('Haunter',NULL,'Gengar','Trade'),('Herdier',NULL,'Stoutland','Lv. 32'),('Hippopotas',NULL,'Hippowdon','Lv. 34'),('Hitmonlee',NULL,'Hitmonchan','Lv. 20 (Atk<Def)'),('Hoothoot',NULL,'Noctowl','Lv. 20'),('Hoppip',NULL,'Skiploom','Lv. 18'),('Horsea',NULL,'Seadra','Lv. 32'),('Houndoom','Dragon Scale','Kingdra','Trade'),('Houndour',NULL,'Houndoom','Lv. 24'),('Illumise',NULL,'Roselia','Morn/Day Friendship'),('Jigglypuff','Moon Stone','Wigglytuff',NULL),('Joltik',NULL,'Galvantula','Lv. 36'),('Jynx',NULL,'Electabuzz','Lv. 30'),('Kabuto',NULL,'Kabutops','Lv. 40'),('Kadabra',NULL,'Alakazam','Trade'),('Kakuna',NULL,'Beedrill','Lv. 10'),('Karrablast',NULL,'Escavalier','Trade shelmet'),('Kirlia',NULL,'Gardevoir','Lv. 30'),('Klang',NULL,'Klinklang','Lv. 49'),('Klink',NULL,'Klang','Lv. 38'),('Koffing',NULL,'Weezing','Lv. 35'),('Krabby',NULL,'Kingler','Lv. 28'),('Kricketot',NULL,'Kricketune','Lv. 10'),('Krokorok',NULL,'Krookodile','Lv. 40'),('Lairon',NULL,'Aggron','Lv. 42'),('Lampent','Dusk Stone','Chandelure',NULL),('Larvesta',NULL,'Volcarona','Lv. 59'),('Larvitar',NULL,'Pupitar','Lv. 30'),('Ledyba',NULL,'Ledian','Lv. 18'),('Lickitung',NULL,'Lickilicky','Level w/ Rollout'),('Lileep',NULL,'Cradily','Lv. 40'),('Lillipup',NULL,'Herdier','Lv. 16'),('Litwick',NULL,'Lampent','Lv. 41'),('Lombre','Water Stone','Ludicolo',NULL),('Lopunny','Dusk Stone','Mismagius',NULL),('Lotad',NULL,'Lombre','Lv. 14'),('Loudred',NULL,'Exploud','Lv. 40'),('Luxio',NULL,'Luxray','Lv. 30'),('Machoke',NULL,'Machamp','Trade'),('Machop',NULL,'Machoke','Lv. 28'),('Magikarp',NULL,'Gyarados','Lv. 20'),('Magmar','Magmarizer','Magmortar','Trade'),('Magnemite',NULL,'Magneton','Lv. 30'),('Makuhita',NULL,'Hariyama','Lv. 24'),('Mankey',NULL,'Primeape','Lv. 28'),('Mantyke',NULL,'Mantine','Level t/ Remoraid'),('Mareep',NULL,'Flaaffy','Lv. 15'),('Marill',NULL,'Azumarill','Lv. 18'),('Marowak',NULL,'Hitmonlee','Lv. 20 (Atk>Def)'),('Marshtomp',NULL,'Swampert','Lv. 36'),('Meditite',NULL,'Medicham','Lv. 37'),('Meowth',NULL,'Persian','Lv. 28'),('Metang',NULL,'Metagross','Lv. 45'),('Metapod',NULL,'Butterfree','Lv. 10'),('Mienfoo',NULL,'Mienshao','Lv. 50'),('Miltank',NULL,'Blissey','Friendship'),('Minccino','Shiny Stone','Cinccino',NULL),('Misdreavus','Dusk Stone','Mismagius',NULL),('Mismagius','Dusk Stone','Honchkrow',NULL),('Monferno',NULL,'Infernape','Lv. 36'),('Mudkip',NULL,'Marshtomp','Lv. 16'),('Munna','Moon Stone','Musharna',NULL),('Natu',NULL,'Xatu','Lv. 25'),('Nidoking',NULL,'Clefairy','Friendship'),('Nidoran(F)',NULL,'Nidorina','Lv. 16'),('Nidoran(M)',NULL,'Nidorino','Lv. 16'),('Nidorina','Moon Stone','Nidoqueen',NULL),('Nidorino','Moon Stone','Nidoking',NULL),('Nincada',NULL,'Ninjask','Lv. 20'),('Ninetales',NULL,'Jigglypuff','Friendship'),('Ninjask',NULL,'Shedinja','Lv. 20 t/ Empty Space'),('Nosepass',NULL,'Probopass','Level a/ Mt. Coronet'),('Numel',NULL,'Camerupt','Lv. 33'),('Nuzleaf','Leaf Stone','Shiftry',NULL),('Oddish',NULL,'Gloom','Lv. 22'),('Omanyte',NULL,'Omastar','Lv. 40'),('Oshawott',NULL,'Dewott','Lv. 17'),('Palpitoad',NULL,'Seismitoad','Lv. 36'),('Pansage','Water Stone','Simipour',NULL),('Pansage','Leaf Stone','Simisage',NULL),('Pansage','Fire Stone','Simisear',NULL),('Paras',NULL,'Parasect','Lv. 24'),('Patrat',NULL,'Watchog','Lv. 20'),('Pawniard',NULL,'Bisharp','Lv. 52'),('Petilil','Sun Stone','Lilligant',NULL),('Phanpy',NULL,'Donphan','Lv. 25'),('Pidgeotto',NULL,'Pidgeot','Lv. 36'),('Pidgey',NULL,'Pidgeotto','Lv. 18'),('Pidove',NULL,'Tranquill','Lv. 21'),('Pignite',NULL,'Emboar','Lv. 36'),('Pikachu','Thunderstone','Raichu',NULL),('Pineco',NULL,'Forretress','Lv. 31'),('Piplup',NULL,'Prinplup','Lv. 16'),('Poliwag',NULL,'Poliwhirl','Lv. 25'),('Poliwhirl','Water Stone','Poliwrath',NULL),('Ponyta',NULL,'Rapidash','Lv. 40'),('Poochyena',NULL,'Mightyena','Lv. 18'),('Porygon','Dubious Disc','Porygon-Z','Trade'),('Prinplup',NULL,'Empoleon','Lv. 36'),('Psyduck',NULL,'Golduck','Lv. 33'),('Pupitar',NULL,'Tyranitar','Lv. 55'),('Purrloin',NULL,'Liepard','Lv. 20'),('Quilava',NULL,'Typhlosion','Lv. 36'),('Quilladin',NULL,'Chesnaught','Lv. 36'),('Ralts',NULL,'Kirlia','Lv. 20'),('Rattata',NULL,'Raticate','Lv. 20'),('Remoraid',NULL,'Octillery','Lv. 25'),('Rhydon','Oval Stone','Chansey','Morn/Day Fr. '),('Rhydon','Protector','Rhyperior','Trade'),('Rhyhorn',NULL,'Rhydon','Lv. 42'),('Riolu',NULL,'Lucario','Morn/Day Friendship'),('Roggenrola',NULL,'Boldore','Lv. 25'),('Roselia','Shiny Stone','Roserade',NULL),('Rufflet',NULL,'Braviary','Lv. 54'),('Sandile',NULL,'Krokorok','Lv. 29'),('Sandshrew',NULL,'Sandslash','Lv. 22'),('Scatterbug',NULL,'Spewpa','Lv. 9'),('Scyther',NULL,'Jynx','Lv. 30'),('Scyther','Metal Coat','Scizor','Trade'),('Sealeo',NULL,'Walrein','Lv. 44'),('Seedot',NULL,'Nuzleaf','Lv. 14'),('Seel',NULL,'Dewgong','Lv. 34'),('Sentret',NULL,'Furret','Lv. 15'),('Servine',NULL,'Serperior','Lv. 36'),('Sewaddle',NULL,'Swadloon','Lv. 20'),('Shelgon',NULL,'Salamence','Lv. 50'),('Shellder','Water Stone','Cloyster',NULL),('Shellos',NULL,'Gastrodon','Lv. 30'),('Shelmet',NULL,'Accelgor','Trade karrablast'),('Shieldon',NULL,'Bastiodon','Lv. 30'),('Shinx',NULL,'Luxio','Lv. 15'),('Shroomish',NULL,'Breloom','Lv. 23'),('Shuppet',NULL,'Banette','Lv. 37'),('Silcoon',NULL,'Beautifly','Lv. 10'),('Skiploom',NULL,'Jumpluff','Lv. 27'),('Skitty','Moon Stone','Delcatty',NULL),('Skorupi',NULL,'Drapion','Lv. 40'),('Slakoth',NULL,'Vigoroth','Lv. 18'),('Slowpoke',NULL,'Slowbro','Lv. 37'),('Slugma',NULL,'Magcargo','Lv. 38'),('Snivy',NULL,'Servine','Lv. 17'),('Snorunt',NULL,'Glalie','Lv. 42'),('Snover',NULL,'Abomasnow','Lv. 40'),('Snubbull',NULL,'Granbull','Lv. 23'),('Solosis',NULL,'Duosion','Lv. 32'),('Spearow',NULL,'Fearow','Lv. 20'),('Spheal',NULL,'Sealeo','Lv. 32'),('Spinarak',NULL,'Ariados','Lv. 22'),('Spoink',NULL,'Grumpig','Lv. 32'),('Squirtle',NULL,'Wartortle','Lv. 16'),('Staravia',NULL,'Staraptor','Lv. 34'),('Starly',NULL,'Staravia','Lv. 14'),('Starmie',NULL,'Mr. Mime','Level w/ Mimic'),('Staryu','Water Stone','Starmie',NULL),('Stunky',NULL,'Skuntank','Lv. 34'),('Sunkern','Sun Stone','Sunflora',NULL),('Surskit',NULL,'Masquerain','Lv. 22'),('Swablu',NULL,'Altaria','Lv. 35'),('Swadloon',NULL,'Leavanny','Friendship'),('Swinub',NULL,'Piloswine','Lv. 33'),('Taillow',NULL,'Swellow','Lv. 22'),('Tangela',NULL,'Tangrowth','Level w/ Ancientpower'),('Teddiursa',NULL,'Ursaring','Lv. 30'),('Tentacool',NULL,'Tentacruel','Lv. 30'),('Tepig',NULL,'Pignite','Lv. 17'),('Timburr',NULL,'Gurdurr','Lv. 25'),('Tirtouga',NULL,'Carracosta','Lv. 37'),('Togepi','Shiny Stone','Togekiss',NULL),('Togepi',NULL,'Togetic','Friendship'),('Torchic',NULL,'Combusken','Lv. 16'),('Totodile',NULL,'Croconaw','Lv. 18'),('Tranquill',NULL,'Unfezant','Lv. 32'),('Trapinch',NULL,'Vibrava','Lv. 35'),('Treecko',NULL,'Grovyle','Lv. 16'),('Trubbish',NULL,'Garbodor','Lv. 36'),('Turtwig',NULL,'Grotle','Lv. 18'),('Tympole',NULL,'Palpitoad','Lv. 25'),('Tynamo',NULL,'Eelektrik','Lv. 39'),('Tyrogue',NULL,'Hitmontop','Lv. 20 (Atk=Def)'),('Unown',NULL,'Wobbuffet','Lv. 15'),('Vanillish',NULL,'Vanilluxe','Lv. 47'),('Vanillite',NULL,'Vanillish','Lv. 35'),('Venipede',NULL,'Whirlipede','Lv. 22'),('Venonat',NULL,'Venomoth','Lv. 31'),('Vibrava',NULL,'Flygon','Lv. 45'),('Vigoroth',NULL,'Slaking','Lv. 36'),('Voltorb',NULL,'Electrode','Lv. 30'),('Vullaby',NULL,'Mandibuzz','Lv. 54'),('Vulpix','Fire Stone','Ninetales',NULL),('Wailmer',NULL,'Wailord','Lv. 40'),('Wartortle',NULL,'Blastoise','Lv. 36'),('Weavile',NULL,'Magnezone','Level a/ Mt. Coronet'),('Weedle',NULL,'Kakuna','Lv. 7'),('Weepinbell','Leaf Stone','Victreebel',NULL),('Whirlipede',NULL,'Scolipede','Lv. 30'),('Whismur',NULL,'Loudred','Lv. 20'),('Wingull',NULL,'Pelipper','Lv. 25'),('Woobat',NULL,'Swoobat','Friendship'),('Wooper',NULL,'Quagsire','Lv. 20'),('Wurmple',NULL,'Silcoon','Lv. 7'),('Yamask',NULL,'Cofagrigus','Lv. 34'),('Zigzagoon',NULL,'Linoone','Lv. 20'),('Zorua',NULL,'Zoroark','Lv. 30'),('Zubat',NULL,'Golbat','Lv. 22'),('Zweilous',NULL,'Hydreigon','Lv. 64');
/*!40000 ALTER TABLE `evolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `item_name` varchar(64) NOT NULL,
  `item_description` varchar(256) NOT NULL,
  PRIMARY KEY (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('Absorb Bulb','A one-time use item which increases the user\'s Special Attack Stat when hit by a Water-type Attack.'),('Air Balloon','Makes the holder immune to Ground-type Attacks until they are attacked.'),('Amulet Coin','Doubles the amount of money received after winning a battle. The Pokemon holding the Amulet Coin must be in battle to get the money boost.'),('Assault Vest','An item that increases the Special Defense of the user, but prevents them from using Status Moves.'),('Big Root','Increases the amount of HP absorbed from HP Absorbing moves by 30%.'),('Binding Band','Doubles the amount of damage caused by multiturn Trapping attacks.'),('Black Belt','Increases Fighting-type Moves by 20% (1.2x).'),('Black Glasses','Increases Dark-type Moves by 20% (1.2x).'),('Black Sludge','Restores 1/16th of a Poison-type Pokemon\'s Max HP every turn. If held by any other type, it will reduce the Pokemon\'s Max HP by 1/8th each turn.'),('Bright Powder','Increases the user\'s Evasion.'),('Cell Battery','A one-time use item which increases the user\'s Attack Stat when hit by an Electric-type Attack.'),('Charcoal','Increases Fire-type Moves by 20% (1.2x).'),('Choice Band','Increases the user\'s Attack Stat by 50%; however, the user can only use the first move he selected for the remainder of the battle.'),('Choice Scarf','Increases the user\'s Speed Stat by 50%; however, the user can only use the first move he selected for the remainder of the battle.'),('Choice Specs','Increases the user\'s Special Attack Stat by 50%; however, the user can only use the first move he selected for the remainder of the battle.'),('Cleanse Tag','Place on the leader of the Party to encounter less Pokemon in the wild. Only effective if wild Pokemon are at a lower level than the user.'),('Damp Rock','Increases the duration of Rain Dance from five to eight turns.'),('Dawn Stone','Evolves some pokemon'),('Deapseascale','Evolves some pokemon'),('Deep Sea Scale','Doubles Clamperl\'s Special Defense Stat.'),('Deep Sea Tooth','Doubles Clamperl\'s Special Attack Stat.'),('Deepseatooth','Evolves some pokemon'),('Destiny Knot','Causes the target to become Infatuated if the user is inflicted with Infatuation.'),('Dragon Fang','Increases Dragon-type Moves by 20% (1.2x).'),('Dragon Scale','Evolves some pokemon'),('Dubious Disc','Evolves some pokemon'),('Dusk Stone','Evolves some pokemon'),('Eject Button','A one-time use item which allows the user to switch to another Pokemon in their party after being hit by a direct attack.'),('Electrizer','Evolves some pokemon'),('Everstone','Prevents any Pokemon holding it from evolving. Everstone also passes on that Pokemon\'s nature to eggs when left at the daycare'),('Eviolite','Increases the user\'s Defense and Special Defense Stats by 50% if the user can still evolve.'),('Expert Belt','Increases the power of Super Effective moves by 20%.'),('Fire Stone','Evolves some pokemon'),('Flame Orb','Causes the Burned condition to the user after one turn.'),('Float Stone','Halves the weight of the user.'),('Focus Band','May allow the user to endure attacks that would cause them to faint, leaving them with 1 HP.'),('Focus Sash','Allows the user to endure an attack that would cause them to faint, leaving them with 1 HP. However, it only works if they had full HP before the move was used.'),('Full Incense','Forces the user to move last'),('Grip Claw','Allows multiturn attacks to hit five times every time.'),('Hard Stone','Increases Rock-type Moves by 20% (1.2x).'),('Heat Rock','Increases the duration of Sunny Day from five to eight turns.'),('Icy Rock','Increases the duration of Hail from five to eight turns.'),('Iron Ball','Cuts the user\'s Speed Stat in half and prevents immunity from Ground-type Attacks.'),('King\'s Rock','Increases the user\'s chance of causing Flinch when using Attacks that cause Flinch.'),('Lagging Tail','Allows / Forces the user to attack last in battle.'),('Lax Incense','User Evasion increases by 10%'),('Leaf Stone','Evolves some pokemon'),('Leftovers','Restores 1/6th of the user\'s Max HP after every turn.'),('Life Orb','Increases the power of Attacks by around 30%, but at the cost of 10% of the user\'s Max HP each turn.'),('Light Ball','Doubles the Attack and Special Attack Stats of Pikachu. Also necessary to learn Volt Tackle when breeding.'),('Light Clay','Increases the duration of Reflect and Light Screen from five to eight turns.'),('Luck Incense','Doubles the amount of money you receive after battle.'),('Lucky Egg','Increases the amount of EXP earned in battle by about 50%.'),('Macho Brace','Doubles the Effort Value Points obtained in battle, but halves the Speed of the holder.'),('Magmarizer','Evolves some pokemon'),('Magnet','Increases Electric-type Moves by 20% (1.2x).'),('Mental Herb','A one-time use item that cures the effects of Cursed Body, Disable, Encore, Infatuation, Taunt, and Torment'),('Metal Coat','Increases Steel-type Moves by 20% (1.2x).'),('Metal Powder','Increases the Defense and Special Defense Stats of Ditto.'),('Metronome','Increases the power of Attacks by 20% when used in succession. The power stops increasing after the fifth consecutive turn (100% increase).'),('Miracle Seed',''),('Moon Stone','Evolves some pokemon'),('Muscle Band','Increases Physical Attacks by 10%.'),('Mystic Water','Increases Water-type Moves by 20% (1.2x).'),('Never-Melt Ice','Increases Ice-type Moves by 20% (1.2x).'),('Odd Incense','Increase the power of Psychic-type moves.'),('Oval Stone','Evolves some pokemon'),('Plant Cloak','Evolves some pokemon'),('Poison Barb','Increases Poison-type Moves by 20% (1.2x).'),('Power Anklet','Adds four Speed Effort Value Points to all other EV Points gained at the end of a battle, but halves the speed of the holder.'),('Power Band','Adds four Special Defense Effort Value Points to all other EV Points gained at the end of a battle, but halves the speed of the holder.'),('Power Belt','Adds four Defense Effort Value Points to all other EV Points gained at the end of a battle, but halves the speed of the holder.'),('Power Bracer','Adds four Attack Effort Value Points to all other EV Points gained at the end of a battle, but halves the speed of the holder.'),('Power Herb','A one-time use item that allows the user to skip the first turn of a two turn move, e.g. Dig and Fly.'),('Power Lens','Adds four Special Attack Effort Value Points to all other EV Points gained at the end of a battle, but halves the speed of the holder.'),('Power Weight','Adds four HP Effort Value Points to all other EV Points gained at the end of a battle, but halves the speed of the holder.'),('Protector','Evolves some pokemon'),('Pure Incense','Causes wild Pokemon to show up less.'),('Quick Claw','May allow the user to attack first in a battle.'),('Quick Powder','Doubles the Speed of Ditto.'),('Razor Claw','Increases the user\'s Critical Hit Ratio.'),('Razor Fang','Increases the user\'s chance of causing Flinch when using Attacks that cause Flinch.'),('Reaper Cloth','Evolves some pokemon'),('Red Card','A one-time use item that forces the enemy Pokemon to switch to a random Pokemon from their team when the user is directly attacked.'),('Ring Target','Prevents immunity to any Type. This would allow a Poison-type move to hit a Steel-type Pokemon.'),('Rock Incense','Increase the power of Rock-type moves.'),('Rocky Helmet','Causes damage equal to 1/6th of Max HP to the opponent when they use a direct attack on the user.'),('Rose Incense','Increases the power of Grass-type moves.'),('Sachet','Evolves some pokemon'),('Safety Goggles','An items that protects the holder from both weather-related damage and powder status moves.'),('Sand Cloak','Evolves some pokemon'),('Scope Lens','Increases the user\'s Critical Hit Ratio.'),('Sea Incense','Increases the power of Water-type moves.'),('Sharp Beak','Increases Flying-type Moves by 20% (1.2x).'),('Shed Shell','Allows the user to switch out of battle, even if trapped by specific moves or abilities.'),('Shell Bell','Restores HP equal to 1/8th of the damage dealt by the user. If the user deals 40 HP of damage to a target, 5 HP will be restored to the user.'),('Shiny Stone','Evolves some pokemon'),('Silk Scarf','Increases Normal-type Moves by 20% (1.2x).'),('Silver Powder','Increases Bug-type Moves by 20% (1.2x).'),('Smoke Ball','Allows the user to run away from a Wild Pokemon.'),('Smooth Rock','Increases the duration of Sandstorm from five to eight turns.'),('Soft Sand','Increases Ground-type Moves by 20% (1.2x).'),('Soothe Bell','Increases the Friendship of a Pokemon'),('Spell Tag','Increases Ghost-type Moves by 20% (1.2x).'),('Stick','Increases the Critical Hit ratio two stages for Farfetch\'d.'),('Sticky Barb','Causes damage equal to 12.5% of the user\'s Max HP each turn. If an opponent Pokemon uses a direct attack, they will receive the same damage. If the Pokemon has no held item, Sticky Barb may jump over to that Pokemon when using a Direct Attack.'),('Sun Stone','Evolves some pokemon'),('Thunderstone','Evolves some pokemon'),('Toxic Orb','Causes the Badly Poisoned condition to the user after one turn.'),('Trash Cloak','Evolves some pokemon'),('Twisted Spoon','Increases Psychic-type Moves by 20% (1.2x).'),('Up Grade','Evolves some pokemon'),('Water Stone','Evolves some pokemon'),('Wave Incense','Increases the power of Water-type moves.'),('Weakness Policy','A one-time use item that increases the user\'s Attack and Special Attack two stages if hit with a move the user is weak to.'),('Whipped Dream','Evolves some pokemon'),('White Herb','A one-time use item that cures any reduced Stats.'),('Wide Lens','Increases the user\'s Accuracy Stat by 10%.'),('Wise Glasses','Increases the user\'s Special Attack Stat by 10%.'),('Zoom Lens','Increases the user\'s Accuracy Stat by 20% if the user moves after the opponent Pokemon.');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokemon` (
  `pokemon_id` int(11) NOT NULL,
  `p_name` varchar(64) NOT NULL,
  `professor_id` varchar(64) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` decimal(7,2) NOT NULL,
  `gender_ratio_wild` decimal(6,3) NOT NULL,
  `ability1` varchar(64) NOT NULL,
  `ability2` varchar(64) DEFAULT NULL,
  `hidden_ability` varchar(64) DEFAULT NULL,
  `egg_group` int(11) NOT NULL,
  `egg_group_2` int(11) DEFAULT NULL,
  `ev_health` tinyint(4) NOT NULL,
  `ev_atk` tinyint(4) NOT NULL,
  `ev_def` tinyint(4) NOT NULL,
  `ev_spatk` tinyint(4) NOT NULL,
  `ev_spdef` tinyint(4) NOT NULL,
  `ev_spd` tinyint(4) NOT NULL,
  `pokemon_type_1` varchar(32) NOT NULL,
  `pokemon_type_2` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`p_name`),
  KEY `professor_id` (`professor_id`),
  KEY `egg_group` (`egg_group`),
  KEY `egg_group_2` (`egg_group_2`),
  KEY `pokemon_type_1` (`pokemon_type_1`),
  KEY `pokemon_type_2` (`pokemon_type_2`),
  CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemon_ibfk_2` FOREIGN KEY (`egg_group`) REFERENCES `egggroup` (`egg_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemon_ibfk_3` FOREIGN KEY (`egg_group_2`) REFERENCES `egggroup` (`egg_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemon_ibfk_4` FOREIGN KEY (`pokemon_type_1`) REFERENCES `pokemontype` (`type_name`),
  CONSTRAINT `pokemon_ibfk_5` FOREIGN KEY (`pokemon_type_2`) REFERENCES `pokemontype` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (460,'Abomasnow','1',20,135.50,0.500,'Snow Warning',NULL,'Soundproof',1,9,0,1,0,1,0,0,'Ice','Grass'),(63,'Abra','1',9,19.50,0.750,'Synchronize','Inner Focus','Magic Guard',10,NULL,0,0,0,1,0,0,'Psychic',NULL),(359,'Absol','1',12,47.00,0.500,'Pressure','Super Luck','Justified',7,NULL,0,2,0,0,0,0,'Dark',NULL),(617,'Accelgor','1',12,25.30,0.500,'Hydration','Sticky Hold','Unburden',5,NULL,0,0,0,0,0,2,'Bug',NULL),(681,'Aegislash','1',10,53.00,0.500,'Stance Change',NULL,NULL,11,NULL,0,0,2,0,1,0,'Steel','Ghost'),(142,'Aerodactyl','1',18,59.00,0.875,'Rock Head','Pressure','Unnerve',6,NULL,0,0,0,0,0,2,'Rock','Flying'),(306,'Aggron','1',21,360.00,0.500,'Sturdy','Rock Head','Heavy Metal',1,NULL,0,0,3,0,0,0,'Steel','Rock'),(190,'Aipom','1',8,11.50,0.500,'Run Away','Pickup','Skill Link',7,NULL,0,0,0,0,0,1,'Normal',NULL),(65,'Alakazam','1',15,48.00,0.750,'Synchronize','Inner Focus','Magic Guard',10,NULL,0,0,0,3,0,0,'Psychic',NULL),(594,'Alomomola','1',3,31.60,0.500,'Healer','Hydration','Regenerator',2,3,2,0,0,0,0,0,'Water',NULL),(334,'Altaria','1',11,20.60,0.500,'Natural Cure',NULL,'Cloud Nine',6,14,0,0,0,0,2,0,'Dragon','Flying'),(698,'Amaura','1',10,25.20,0.875,'Refrigerate',NULL,'Snow Warning',1,NULL,1,0,0,0,0,0,'Rock','Ice'),(424,'Ambipom','1',9,20.30,0.500,'Technician','Pickup','Skill Link',7,NULL,0,0,0,0,0,2,'Normal',NULL),(591,'Amoonguss','1',21,10.50,0.500,'Effect Spore',NULL,'Regenerator',9,NULL,2,0,0,0,0,0,'Grass','Poison'),(181,'Ampharos','1',14,61.50,0.500,'Static',NULL,'Plus',1,7,0,0,0,3,0,0,'Electric',NULL),(347,'Anorith','1',7,12.50,0.875,'Battle Armor',NULL,'Swift Swim',4,NULL,0,1,0,0,0,0,'Rock','Bug'),(24,'Arbok','1',35,65.00,0.500,'Intimidate','Shed Skin','Unnerve',7,14,0,2,0,0,0,0,'Poison',NULL),(59,'Arcanine','1',19,155.00,0.750,'Intimidate','Flash Fire','Justified',7,NULL,0,2,0,0,0,0,'Fire',NULL),(493,'Arceus','1',11,320.00,-1.000,'Multitype',NULL,NULL,15,NULL,3,0,0,0,0,0,'Normal',NULL),(566,'Archen','1',10,9.50,0.875,'Defeatist',NULL,NULL,6,4,0,1,0,0,0,0,'Rock','Flying'),(567,'Archeops','1',5,32.00,0.875,'Defeatist',NULL,NULL,6,4,0,2,0,0,0,0,'Rock','Flying'),(168,'Ariados','1',11,33.50,0.500,'Swarm','Insomnia','Sniper',5,NULL,0,2,0,0,0,0,'Bug','Poison'),(348,'Armaldo','1',15,68.20,0.875,'Battle Armor',NULL,'Swift Swim',4,NULL,0,2,0,0,0,0,'Rock','Bug'),(683,'Aromatisse','1',25,15.50,0.500,'Healer',NULL,'Aroma Veil',8,NULL,2,0,0,0,0,0,'Fairy',NULL),(304,'Aron','1',4,60.00,0.500,'Sturdy','Rock Head','Heavy Metal',1,NULL,0,0,1,0,0,0,'Steel','Rock'),(144,'Articuno','1',17,55.40,-1.000,'Pressure',NULL,'Snow Cloak',15,NULL,0,0,0,0,3,0,'Ice','Flying'),(531,'Audino','1',4,31.00,0.500,'Healer','Regenerator','Klutz',8,NULL,2,0,0,0,0,0,'Normal',NULL),(699,'Aurorus','1',20,225.00,0.875,'Refrigerate',NULL,'Snow Warning',1,NULL,2,0,0,0,0,0,'Rock','Ice'),(713,'Avalugg','1',18,505.00,0.500,'Own Tempo','Ice Body','Sturdy',1,NULL,0,0,2,0,0,0,'Ice',NULL),(610,'Axew','1',28,18.00,0.500,'Rivalry','Mold Breaker','Unnerve',1,14,0,1,0,0,0,0,'Dragon',NULL),(482,'Azelf','1',2,0.30,-1.000,'Levitate',NULL,NULL,15,NULL,0,2,0,1,0,0,'Psychic',NULL),(184,'Azumarill','1',8,28.50,0.500,'Thick Fat','Huge Power','Sap Sipper',2,8,3,0,0,0,0,0,'Water','Fairy'),(298,'Azurill','1',2,2.00,0.750,'Thick Fat','Huge Power','Sap Sipper',15,NULL,1,0,0,0,0,0,'Normal','Fairy'),(371,'Bagon','1',6,42.10,0.500,'Rock Head',NULL,'Sheer Force',14,NULL,0,1,0,0,0,0,'Dragon',NULL),(343,'Baltoy','1',5,21.50,-1.000,'Levitate',NULL,NULL,11,NULL,0,0,0,0,1,0,'Ground','Psychic'),(354,'Banette','1',11,12.50,0.500,'Insomnia','Frisk','Cursed Body',12,NULL,0,2,0,0,0,0,'Ghost',NULL),(689,'Barbaracle','1',3,96.00,0.500,'Sniper','Tough Claws','Pickpocket',4,NULL,0,2,0,0,0,0,'Rock','Water'),(339,'Barboach','1',4,1.90,0.500,'Oblivious','Anticipate','Hydration',3,NULL,1,0,0,0,0,0,'Water','Ground'),(550,'Basculin','1',5,18.00,0.500,'Reckless','Adaptability','Mold Breaker',3,NULL,0,0,0,0,0,2,'Water',NULL),(411,'Bastiodon','1',9,149.50,0.875,'Sturdy',NULL,'Soundproof',1,NULL,0,0,2,0,0,0,'Rock','Steel'),(153,'Bayleef','1',12,15.80,0.875,'Overgrow',NULL,'Leaf Guard',1,9,0,0,1,0,1,0,'Grass',NULL),(614,'Beartic','1',5,260.00,0.500,'Snow Cloak',NULL,'Swift Swim',7,NULL,0,2,0,0,0,0,'Ice',NULL),(267,'Beautifly','1',10,28.40,0.500,'Swarm',NULL,'Rivalry',5,NULL,0,0,0,3,0,0,'Bug','Flying'),(15,'Beedrill','1',10,29.50,0.500,'Swarm',NULL,'Sniper',5,NULL,0,2,0,0,1,0,'Bug','Poison'),(606,'Beheeyem','1',9,34.50,0.500,'Telepathy','Synchronize','Analytic',10,NULL,0,0,0,2,0,0,'Psychic',NULL),(374,'Beldum','1',6,95.20,-1.000,'Clear Body',NULL,'Light Metal',11,NULL,0,0,1,0,0,0,'Steel','Psychic'),(182,'Bellossom','1',4,5.80,0.500,'Chlorophyll',NULL,'Healer',9,NULL,0,0,0,0,3,0,'Grass',NULL),(69,'Bellsprout','1',7,4.00,0.500,'Chlorophyll',NULL,'Gluttony',9,NULL,0,1,0,0,0,0,'Grass','Poison'),(712,'Bergmite','1',7,99.50,0.500,'Own Tempo','Ice Body','Sturdy',1,NULL,0,0,1,0,0,0,'Ice',NULL),(400,'Bibarel','1',5,31.50,0.500,'Simple','Unaware','Moody',2,7,0,2,0,0,0,0,'Normal','Water'),(399,'Bidoof','1',10,20.00,0.500,'Simple','Unaware','Moody',2,7,1,0,0,0,0,0,'Normal',NULL),(688,'Binacle','1',2,31.00,0.500,'Sniper','Tough Claws','Pickpocket',4,NULL,0,1,0,0,0,0,'Rock','Water'),(625,'Bisharp','1',21,70.00,0.500,'Defiant','Inner Focus','Pressure',10,NULL,0,2,0,0,0,0,'Dark','Steel'),(9,'Blastoise','1',16,85.50,0.875,'Torrent',NULL,'Rain Dish',1,2,0,0,0,0,3,0,'Water',NULL),(257,'Blaziken','1',19,52.00,0.875,'Blaze',NULL,'Speed Boost',7,NULL,0,3,0,0,0,0,'Fire','Fighting'),(242,'Blissey','1',15,46.80,0.000,'Natural Cure','Serene Grace','Healer',8,NULL,3,0,0,0,0,0,'Normal',NULL),(522,'Blitzle','1',14,29.80,0.500,'Lightningrod','Motor Drive','Sap Sipper',7,NULL,0,0,0,0,0,1,'Electric',NULL),(525,'Boldore','1',15,102.00,0.500,'Sturdy',NULL,'Sand Force',11,NULL,0,1,1,0,0,0,'Rock',NULL),(438,'Bonsly','1',7,15.00,0.500,'Sturdy','Rock Head','Rattled',15,NULL,0,0,1,0,0,0,'Rock',NULL),(626,'Bouffalant','1',19,94.60,0.500,'Reckless','Sap Sipper','Soundproof',7,NULL,0,2,0,0,0,0,'Normal',NULL),(654,'Braixen','1',15,14.50,0.875,'Blaze',NULL,'Magician',7,NULL,0,0,0,2,0,0,'Fire',NULL),(628,'Braviary','1',15,41.00,1.000,'Keen Eye','Sheer Force','Defiant',6,NULL,0,2,0,0,0,0,'Normal','Flying'),(286,'Breloom','1',12,39.20,0.500,'Effect Spore','Poison Heal','Technician',8,9,0,2,0,0,0,0,'Grass','Fighting'),(437,'Bronzong','1',10,187.00,-1.000,'Levitate','Heatproof','Heavy Metal',11,NULL,0,0,1,0,1,0,'Steel','Psychic'),(436,'Bronzor','1',5,60.50,-1.000,'Levitate','Heatproof','Heavy Metal',11,NULL,0,0,1,0,0,0,'Steel','Psychic'),(406,'Budew','1',16,1.20,0.500,'Natural Cure','Poison Point','Leaf Guard',15,NULL,0,0,0,1,0,0,'Grass','Poison'),(418,'Buizel','1',9,29.50,0.500,'Swift Swim',NULL,'Water Veil',2,7,0,0,0,0,0,1,'Water',NULL),(1,'Bulbasaur','1',7,6.90,0.875,'Overgrow',NULL,'Chlorophyll',1,9,0,0,0,1,0,0,'Grass','Poison'),(427,'Buneary','1',10,5.50,0.500,'Run Away','Klutz','Limber',7,10,0,0,0,0,0,1,'Normal',NULL),(659,'Bunnelby','1',17,5.00,0.500,'Pickup','Cheek Pouch','Huge Power',7,NULL,0,0,0,0,0,1,'Normal',NULL),(412,'Burmy','1',3,3.40,0.500,'Shed Skin',NULL,'Overcoat',5,NULL,0,0,0,0,1,0,'Bug',NULL),(12,'Butterfree','1',11,32.00,0.500,'Compoundeyes',NULL,'Tinted Lens',5,NULL,0,0,0,2,1,0,'Bug','Flying'),(331,'Cacnea','1',4,51.30,0.500,'Sand Veil',NULL,'Water Absorb',9,10,0,0,0,1,0,0,'Grass',NULL),(332,'Cacturne','1',13,77.40,0.500,'Sand Veil',NULL,'Water Absorb',9,10,0,1,0,1,0,0,'Grass','Dark'),(323,'Camerupt','1',19,220.00,0.500,'Magma Armor','Solid Rock','Anger Point',7,NULL,0,1,0,1,0,0,'Fire','Ground'),(703,'Carbink','1',58,5.70,-1.000,'Clear Body',NULL,'Sturdy',8,11,0,0,1,0,1,0,'Rock','Fairy'),(455,'Carnivine','1',22,27.00,0.500,'Levitate',NULL,NULL,9,NULL,0,2,0,0,0,0,'Grass',NULL),(565,'Carracosta','1',6,81.00,0.875,'Solid Rock','Sturdy','Swift Swim',2,4,0,0,2,0,0,0,'Water','Rock'),(318,'Carvanha','1',8,20.80,0.500,'Rough Skin',NULL,'Speed Boost',3,NULL,0,1,0,0,0,0,'Water','Dark'),(268,'Cascoon','1',7,11.50,0.500,'Shed Skin',NULL,NULL,5,NULL,0,0,2,0,0,0,'Bug',NULL),(351,'Castform','1',3,0.80,0.500,'Forecast',NULL,NULL,8,12,1,0,0,0,0,0,'Normal',NULL),(10,'Caterpie','1',3,2.90,0.500,'Shield Dust',NULL,'Run Away',5,NULL,1,0,0,0,0,0,'Bug',NULL),(251,'Celebi','1',6,5.00,-1.000,'Natural Cure',NULL,NULL,15,NULL,3,0,0,0,0,0,'Psychic','Grass'),(609,'Chandelure','1',10,34.30,0.500,'Flash Fire','Flame Body','Shadow Tag',12,NULL,0,0,0,3,0,0,'Ghost','Fire'),(113,'Chansey','1',11,34.60,0.000,'Natural Cure','Serene Grace','Healer',8,NULL,2,0,0,0,0,0,'Normal',NULL),(6,'Charizard','1',17,90.50,0.875,'Blaze',NULL,'Solar Power',1,14,0,0,0,3,0,0,'Fire','Flying'),(4,'Charmander','1',6,8.50,0.875,'Blaze',NULL,'Solar Power',1,14,0,0,0,0,0,1,'Fire',NULL),(5,'Charmeleon','1',11,19.00,0.875,'Blaze',NULL,'Solar Power',1,14,0,0,0,1,0,1,'Fire',NULL),(441,'Chatot','1',6,1.90,0.500,'Keen Eye','Tangled Feet','Big Pecks',6,NULL,0,1,0,0,0,0,'Normal','Flying'),(421,'Cherrim','1',12,9.30,0.500,'Flower Gift',NULL,NULL,8,9,0,0,0,2,0,0,'Grass',NULL),(420,'Cherubi','1',4,3.30,0.500,'Chlorophyll',NULL,NULL,8,9,0,0,0,1,0,0,'Grass',NULL),(652,'Chesnaught','1',12,90.00,0.875,'Overgrow',NULL,'Bulletproof',7,NULL,0,0,3,0,0,0,'Grass','Fighting'),(650,'Chespin','1',3,9.00,0.875,'Overgrow',NULL,'Bulletproof',7,NULL,0,0,1,0,0,0,'Grass',NULL),(152,'Chikorita','1',9,6.40,0.875,'Overgrow',NULL,'Leaf Guard',1,9,0,0,0,0,1,0,'Grass',NULL),(390,'Chimchar','1',4,6.20,0.875,'Blaze',NULL,'Iron Fist',7,10,0,0,0,0,0,1,'Fire',NULL),(358,'Chimecho','1',6,1.00,0.500,'Levitate',NULL,NULL,12,NULL,0,0,0,1,1,0,'Psychic',NULL),(170,'Chinchou','1',5,12.00,0.500,'Volt Absorb','Illuminate','Water Absorb',3,NULL,1,0,0,0,0,0,'Water','Electric'),(433,'Chingling','1',5,0.60,0.500,'Levitate',NULL,NULL,15,NULL,0,0,0,1,0,0,'Psychic',NULL),(573,'Cinccino','1',19,7.50,0.250,'Cute Charm','Technician','Skill Link',7,NULL,0,0,0,0,0,2,'Normal',NULL),(366,'Clamperl','1',4,52.50,0.500,'Shell Armor',NULL,'Rattled',2,NULL,0,0,1,0,0,0,'Water',NULL),(692,'Clauncher','1',20,8.30,0.500,'Mega Launcher',NULL,NULL,2,4,0,0,0,1,0,0,'Water',NULL),(693,'Clawitzer','1',2,35.30,0.500,'Mega Launcher',NULL,NULL,2,4,0,0,0,2,0,0,'Water',NULL),(344,'Claydol','1',15,108.00,-1.000,'Levitate',NULL,NULL,11,NULL,0,0,0,0,2,0,'Ground','Psychic'),(36,'Clefable','1',13,40.00,0.250,'Cute Charm','Magic Guard','Unaware',8,NULL,3,0,0,0,0,0,'Fairy',NULL),(35,'Clefairy','1',6,7.50,0.250,'Cute Charm','Magic Guard','Friend Guard',8,NULL,2,0,0,0,0,0,'Fairy',NULL),(173,'Cleffa','1',3,3.00,0.250,'Cute Charm','Magic Guard','Friend Guard',15,NULL,0,0,0,0,1,0,'Fairy',NULL),(91,'Cloyster','1',15,132.50,0.500,'Shell Armor','Skill Link','Overcoat',4,NULL,0,0,2,0,0,0,'Water','Ice'),(638,'Cobalion','1',7,250.00,-1.000,'Justified',NULL,NULL,15,NULL,0,0,3,0,0,0,'Steel','Fighting'),(563,'Cofagrigus','1',15,76.50,0.500,'Mummy',NULL,NULL,11,12,0,0,2,0,0,0,'Ghost',NULL),(415,'Combee','1',4,5.50,0.875,'Honey Gather',NULL,'Hustle',5,NULL,0,0,0,0,0,1,'Bug','Flying'),(256,'Combusken','1',9,19.50,0.875,'Blaze',NULL,'Speed Boost',7,NULL,0,1,0,1,0,0,'Fire','Fighting'),(534,'Conkeldurr','1',3,87.00,0.750,'Guts','Sheer Force','Iron Fist',10,NULL,0,3,0,0,0,0,'Fighting',NULL),(341,'Corphish','1',6,11.50,0.500,'Hyper Cutter','Shell Armor','Adaptability',2,4,0,1,0,0,0,0,'Water',NULL),(222,'Corsola','1',6,5.00,0.250,'Hustle','Natural Cure','Regenerator',2,4,0,0,1,0,1,0,'Water','Rock'),(546,'Cottonee','1',14,0.60,0.500,'Prankster','Infiltrator','Chlorophyll',9,8,0,0,0,0,0,1,'Grass','Fairy'),(346,'Cradily','1',15,60.40,0.875,'Suction Cups',NULL,'Storm Drain',4,NULL,0,0,0,0,2,0,'Rock','Grass'),(408,'Cranidos','1',13,31.50,0.875,'Mold Breaker',NULL,'Sheer Force',1,NULL,0,1,0,0,0,0,'Rock',NULL),(342,'Crawdaunt','1',11,32.80,0.500,'Hyper Cutter','Shell Armor','Adaptability',2,4,0,2,0,0,0,0,'Water','Dark'),(488,'Cresselia','1',10,85.60,0.000,'Levitate',NULL,NULL,15,NULL,0,0,0,0,3,0,'Psychic',NULL),(453,'Croagunk','1',10,23.00,0.500,'Anticipate','Dry Skin','Poison Touch',10,NULL,0,1,0,0,0,0,'Poison','Fighting'),(169,'Crobat','1',18,75.00,0.500,'Inner Focus',NULL,'Infiltrator',6,NULL,0,0,0,0,0,3,'Poison','Flying'),(159,'Croconaw','1',11,25.00,0.875,'Torrent',NULL,'Sheer Force',1,2,0,1,1,0,0,0,'Water',NULL),(558,'Crustle','1',16,200.00,0.500,'Sturdy','Shell Armor','Weak Armor',5,11,0,0,2,0,0,0,'Bug','Rock'),(615,'Cryogonal','1',15,148.00,-1.000,'Levitate',NULL,NULL,11,NULL,0,0,0,0,2,0,'Ice',NULL),(613,'Cubchoo','1',16,8.50,0.500,'Snow Cloak',NULL,'Rattled',7,NULL,0,1,0,0,0,0,'Ice',NULL),(104,'Cubone','1',4,6.50,0.500,'Rock Head','Lightningrod','Battle Armor',1,NULL,0,0,1,0,0,0,'Ground',NULL),(155,'Cyndaquil','1',5,7.90,0.875,'Blaze',NULL,'Flash Fire',7,NULL,0,0,0,0,0,1,'Fire',NULL),(491,'Darkrai','1',8,50.50,-1.000,'Bad Dreams',NULL,NULL,15,NULL,0,0,0,2,0,1,'Dark',NULL),(555,'Darmanitan','1',14,92.90,0.500,'Sheer Force',NULL,'Zen Mode',7,NULL,0,2,0,0,0,0,'Fire',NULL),(554,'Darumaka','1',5,37.50,0.500,'Hustle',NULL,'Inner Focus',7,NULL,0,1,0,0,0,0,'Fire',NULL),(702,'Dedenne','1',30,2.20,0.500,'Cheek Pouch','Pickup','Plus',7,8,0,0,0,0,0,2,'Electric','Fairy'),(585,'Deerling','1',10,19.50,0.500,'Chlorophyll','Sap Sipper','Serene Grace',7,NULL,0,0,0,0,0,1,'Normal','Grass'),(633,'Deino','1',30,17.30,0.500,'Hustle',NULL,NULL,14,NULL,0,1,0,0,0,0,'Dark','Dragon'),(301,'Delcatty','1',11,32.60,0.250,'Cute Charm','Normalize','Wonder Skin',7,8,1,0,0,0,0,1,'Normal',NULL),(225,'Delibird','1',9,16.00,0.500,'Vital Spirit','Hustle','Insomnia',2,7,0,0,0,0,0,1,'Ice','Flying'),(655,'Delphox','1',1,39.00,0.875,'Blaze',NULL,'Magician',7,NULL,0,0,0,3,0,0,'Fire','Psychic'),(386,'Deoxys (A)','1',4,60.80,-1.000,'Pressure',NULL,NULL,15,NULL,0,0,0,0,0,0,'Psychic',NULL),(386,'Deoxys (D)','1',11,60.80,-1.000,'Pressure',NULL,NULL,15,NULL,0,0,0,0,0,0,'Psychic',NULL),(386,'Deoxys (N)','1',17,60.80,-1.000,'Pressure',NULL,NULL,15,NULL,0,1,0,1,0,1,'Psychic',NULL),(386,'Deoxys (S)','1',22,60.80,-1.000,'Pressure',NULL,NULL,15,NULL,0,0,0,0,0,0,'Psychic',NULL),(87,'Dewgong','1',17,120.00,0.500,'Thick Fat','Hydration','Ice Body',2,7,0,0,0,0,2,0,'Water','Ice'),(502,'Dewott','1',10,24.50,0.875,'Torrent',NULL,'Shell Armor',7,NULL,0,0,0,2,0,0,'Water',NULL),(483,'Dialga','1',32,683.00,-1.000,'Pressure',NULL,'Telepathy',15,NULL,0,0,0,3,0,0,'Steel','Dragon'),(719,'Diancie','1',11,8.80,-1.000,'Clear Body',NULL,'Magic Bounce (Mega)',15,NULL,0,0,1,0,2,0,'Rock','Fairy'),(660,'Diggersby','1',6,42.40,0.500,'Pickup','Cheek Pouch','Huge Power',7,NULL,0,2,0,0,0,0,'Normal','Ground'),(50,'Diglett','1',2,0.80,0.500,'Sand Veil','Arena Trap','Sand Force',7,NULL,0,0,0,0,0,1,'Ground',NULL),(132,'Ditto','1',3,4.00,-1.000,'Limber',NULL,'Imposter',13,NULL,1,0,0,0,0,0,'Normal',NULL),(85,'Dodrio','1',18,85.20,0.500,'Run Away','Early Bird','Tangled Feet',6,NULL,0,2,0,0,0,0,'Normal','Flying'),(84,'Doduo','1',14,39.20,0.500,'Run Away','Early Bird','Tangled Feet',6,NULL,0,1,0,0,0,0,'Normal','Flying'),(232,'Donphan','1',11,120.00,0.500,'Sturdy',NULL,'Sand Veil',7,NULL,0,1,1,0,0,0,'Ground',NULL),(680,'Doublade','1',5,4.50,0.500,'No Guard',NULL,NULL,11,NULL,0,0,2,0,0,0,'Steel','Ghost'),(691,'Dragalge','1',8,81.50,0.500,'Poison Point','Poison Touch','Adaptability',2,14,0,0,0,0,2,0,'Poison','Dragon'),(148,'Dragonair','1',40,16.50,0.500,'Shed Skin',NULL,'Marvel Scale',2,14,0,2,0,0,0,0,'Dragon',NULL),(149,'Dragonite','1',22,210.00,0.500,'Inner Focus',NULL,'Multiscale',2,14,0,3,0,0,0,0,'Dragon','Flying'),(452,'Drapion','1',12,61.50,0.500,'Battle Armor','Sniper','Keen Eye',5,4,0,0,2,0,0,0,'Poison','Dark'),(147,'Dratini','1',18,3.30,0.500,'Shed Skin',NULL,'Marvel Scale',2,14,0,1,0,0,0,0,'Dragon',NULL),(426,'Drifblim','1',5,15.00,0.500,'Aftermath','Unburden','Flare Boost',12,NULL,2,0,0,0,0,0,'Ghost','Flying'),(425,'Drifloon','1',9,1.20,0.500,'Aftermath','Unburden','Flare Boost',12,NULL,1,0,0,0,0,0,'Ghost','Flying'),(529,'Drilbur','1',5,8.50,0.500,'Sand Rush','Sand Force','Mold Breaker',7,NULL,0,1,0,0,0,0,'Ground',NULL),(96,'Drowzee','1',10,32.40,0.500,'Insomnia','Forewarn','Inner Focus',10,NULL,0,0,0,0,1,0,'Psychic',NULL),(621,'Druddigon','1',14,139.00,0.500,'Rough Skin','Sheer Force','Mold Breaker',14,1,0,2,0,0,0,0,'Dragon',NULL),(580,'Ducklett','1',22,5.50,0.500,'Keen Eye','Big Pecks','Hydration',2,6,1,0,0,0,0,0,'Water','Flying'),(51,'Dugtrio','1',7,33.30,0.500,'Sand Veil','Arena Trap','Sand Force',7,NULL,0,0,0,0,0,2,'Ground',NULL),(206,'Dunsparce','1',15,14.00,0.500,'Serene Grace','Run Away','Rattled',7,NULL,1,0,0,0,0,0,'Normal',NULL),(578,'Duosion','1',6,8.00,0.500,'Overcoat','Magic Guard','Regenerator',12,NULL,0,0,0,2,0,0,'Psychic',NULL),(632,'Durant','1',15,33.00,0.500,'Swarm','Hustle','Truant',5,NULL,0,0,2,0,0,0,'Bug','Steel'),(356,'Dusclops','1',16,30.60,0.500,'Pressure',NULL,NULL,12,NULL,0,0,1,0,1,0,'Ghost',NULL),(477,'Dusknoir','1',3,106.60,0.500,'Pressure',NULL,NULL,12,NULL,0,0,1,0,2,0,'Ghost',NULL),(355,'Duskull','1',8,15.00,0.500,'Levitate',NULL,NULL,12,NULL,0,0,0,0,1,0,'Ghost',NULL),(269,'Dustox','1',12,31.60,0.500,'Shield Dust',NULL,'Compoundeyes',5,NULL,0,0,0,0,3,0,'Bug','Poison'),(557,'Dwebble','1',7,14.50,0.500,'Sturdy','Shell Armor','Weak Armor',5,11,0,0,1,0,0,0,'Bug','Rock'),(603,'Eelektrik','1',4,22.00,0.500,'Levitate',NULL,NULL,12,NULL,0,2,0,0,0,0,'Electric',NULL),(604,'Eelektross','1',8,80.50,0.500,'Levitate',NULL,NULL,12,NULL,0,3,0,0,0,0,'Electric',NULL),(133,'Eevee','1',3,6.50,0.875,'Run Away','Adaptability','Anticipation',7,NULL,0,0,0,0,1,0,'Normal',NULL),(23,'Ekans','1',20,6.90,0.500,'Intimidate','Shed Skin','Unnerve',7,14,0,1,0,0,0,0,'Poison',NULL),(125,'Electabuzz','1',11,30.00,0.750,'Static',NULL,'Vital Spirit',10,NULL,0,0,0,0,0,2,'Electric',NULL),(466,'Electivire','1',8,138.60,0.750,'Motor Drive',NULL,'Vital Spirit',10,NULL,0,3,0,0,0,0,'Electric',NULL),(309,'Electrike','1',6,15.20,0.500,'Static','Lightningrod','Minus',7,NULL,0,0,0,0,0,1,'Electric',NULL),(101,'Electrode','1',12,66.60,-1.000,'Soundproof','Static','Aftermath',11,NULL,0,0,0,0,0,2,'Electric',NULL),(239,'Elekid','1',6,23.50,0.750,'Static',NULL,'Vital Spirit',15,NULL,0,0,0,0,0,1,'Electric',NULL),(605,'Elgyem','1',7,9.00,0.500,'Telepathy','Synchronize','Analytic',10,NULL,0,0,0,1,0,0,'Psychic',NULL),(500,'Emboar','1',11,150.00,0.875,'Blaze',NULL,'Reckless',7,NULL,0,3,0,0,0,0,'Fire','Fighting'),(587,'Emolga','1',6,5.00,0.500,'Static',NULL,'Motor Drive',7,NULL,0,0,0,0,0,2,'Electric','Flying'),(395,'Empoleon','1',12,84.50,0.875,'Torrent',NULL,'Defiant',2,7,0,0,0,3,0,0,'Water','Steel'),(244,'Entei','1',21,198.00,-1.000,'Pressure',NULL,'Flash Fire',15,NULL,1,2,0,0,0,0,'Fire',NULL),(589,'Escavalier','1',2,33.00,0.500,'Swarm','Shell Armor','Overcoat',5,NULL,0,2,0,0,0,0,'Bug','Steel'),(196,'Espeon','1',9,26.50,0.875,'Synchronize',NULL,'Magic Bounce',7,NULL,0,0,0,2,0,0,'Psychic',NULL),(677,'Espurr','1',18,3.50,0.500,'Keen Eye','Infiltrator','Own Tempo',7,NULL,0,0,0,0,0,1,'Psychic',NULL),(530,'Excadrill','1',12,40.40,0.500,'Sand Rush','Sand Force','Mold Breaker',7,NULL,0,2,0,0,0,0,'Ground','Steel'),(102,'Exeggcute','1',4,2.50,0.500,'Chlorophyll',NULL,'Harvest',9,NULL,0,0,1,0,0,0,'Grass','Psychic'),(103,'Exeggutor','1',20,120.00,0.500,'Chlorophyll',NULL,'Harvest',9,NULL,0,0,0,2,0,0,'Grass','Psychic'),(295,'Exploud','1',15,84.00,0.500,'Soundproof',NULL,'Scrappy',1,7,3,0,0,0,0,0,'Normal',NULL),(83,'Farfetch\'d','1',8,15.00,0.500,'Keen Eye','Inner Focus','Defiant',6,7,0,1,0,0,0,0,'Normal','Flying'),(22,'Fearow','1',12,38.00,0.500,'Keen Eye',NULL,'Sniper',6,NULL,0,0,0,0,0,2,'Normal','Flying'),(349,'Feebas','1',6,7.40,0.500,'Swift Swim',NULL,'Adaptability',2,14,0,0,0,0,0,1,'Water',NULL),(653,'Fennekin','1',6,9.40,0.875,'Blaze',NULL,'Magician',7,NULL,0,0,0,1,0,0,'Fire',NULL),(160,'Feraligatr','1',23,88.80,0.875,'Torrent',NULL,'Sheer Force',1,2,0,2,1,0,0,0,'Water',NULL),(597,'Ferroseed','1',6,18.80,0.500,'Iron Barbs',NULL,NULL,9,11,0,0,1,0,0,0,'Grass','Steel'),(598,'Ferrothorn','1',10,110.00,0.500,'Iron Barbs',NULL,NULL,9,11,0,0,2,0,0,0,'Grass','Steel'),(456,'Finneon','1',11,7.00,0.500,'Swift Swim','Storm Drain','Water Veil',3,NULL,0,0,0,0,0,1,'Water',NULL),(180,'Flaaffy','1',8,13.30,0.500,'Static',NULL,'Plus',1,7,0,0,0,2,0,0,'Electric',NULL),(669,'Flabebe','1',8,0.10,0.000,'Flower Veil',NULL,'Symbiosis',8,NULL,0,0,0,0,1,0,'Fairy',NULL),(136,'Flareon','1',9,25.00,0.875,'Flash Fire',NULL,'Guts',7,NULL,0,2,0,0,0,0,'Fire',NULL),(662,'Fletchinder','1',12,16.00,0.500,'Flame Body',NULL,'Gale Wings',6,NULL,0,0,0,0,0,2,'Fire','Flying'),(661,'Fletchling','1',21,1.70,0.500,'Big Pecks',NULL,'Gale Wings',6,NULL,0,0,0,0,0,1,'Normal','Flying'),(419,'Floatzel','1',12,33.50,0.500,'Swift Swim',NULL,'Water Veil',2,7,0,0,0,0,0,2,'Water',NULL),(670,'Floette','1',4,0.90,0.000,'Flower Veil',NULL,'Symbiosis',8,NULL,0,0,0,0,2,0,'Fairy',NULL),(671,'Florges','1',8,10.00,0.000,'Flower Veil',NULL,'Symbiosis',8,NULL,0,0,0,0,2,0,'Fairy',NULL),(330,'Flygon','1',20,82.00,0.500,'Levitate',NULL,NULL,5,NULL,0,1,0,0,0,2,'Ground','Dragon'),(590,'Foongus','1',12,1.00,0.500,'Effect Spore',NULL,'Regenerator',9,NULL,1,0,0,0,0,0,'Grass','Poison'),(205,'Forretress','1',12,125.80,0.500,'Sturdy',NULL,'Overcoat',5,NULL,0,0,2,0,0,0,'Bug','Steel'),(611,'Fraxure','1',5,36.00,0.500,'Rivalry','Mold Breaker','Unnerve',1,14,0,2,0,0,0,0,'Dragon',NULL),(592,'Frillish','1',5,33.00,0.500,'Water Absorb','Cursed Body',NULL,12,NULL,0,0,0,0,1,0,'Water','Ghost'),(656,'Froakie','1',2,7.00,0.875,'Torrent',NULL,'Protean',2,NULL,0,0,0,0,0,1,'Water',NULL),(657,'Frogadier','1',11,10.90,0.875,'Torrent',NULL,'Protean',2,NULL,0,0,0,0,0,2,'Water',NULL),(478,'Froslass','1',54,26.60,0.000,'Snow Cloak',NULL,'Cursed Body',8,11,0,0,0,0,0,2,'Ice','Ghost'),(676,'Furfrou','1',5,28.00,0.500,'Fur Coat',NULL,NULL,7,NULL,0,0,0,0,0,1,'Normal',NULL),(162,'Furret','1',18,32.50,0.500,'Run Away','Keen Eye','Frisk',7,NULL,0,0,0,0,0,2,'Normal',NULL),(444,'Gabite','1',8,56.00,0.500,'Sand Veil',NULL,'Rough Skin',1,14,0,2,0,0,0,0,'Dragon','Ground'),(475,'Gallade','1',3,52.00,1.000,'Steadfast',NULL,'Justified',12,NULL,0,3,0,0,0,0,'Psychic','Fighting'),(596,'Galvantula','1',10,14.30,0.500,'Compoundeyes','Unnerve','Swarm',5,NULL,0,0,0,0,0,2,'Bug','Electric'),(569,'Garbodor','1',4,107.30,0.500,'Stench','Weak Armor','Aftermath',11,NULL,0,2,0,0,0,0,'Poison',NULL),(445,'Garchomp','1',20,95.00,0.500,'Sand Veil',NULL,'Rough Skin',1,14,0,3,0,0,0,0,'Dragon','Ground'),(282,'Gardevoir','1',16,48.40,0.500,'Synchronize','Trace','Telepathy',12,NULL,0,0,0,3,0,0,'Psychic','Fairy'),(92,'Gastly','1',13,0.10,0.500,'Levitate',NULL,NULL,12,NULL,0,0,0,1,0,0,'Ghost','Poison'),(423,'Gastrodon','1',12,29.90,0.500,'Sticky Hold','Storm Drain','Sand Force',2,12,2,0,0,0,0,0,'Water','Ground'),(649,'Genesect','1',12,82.50,-1.000,'Download',NULL,NULL,15,NULL,0,1,0,1,0,1,'Bug','Steel'),(94,'Gengar','1',15,40.50,0.500,'Levitate',NULL,NULL,12,NULL,0,0,0,3,0,0,'Ghost','Poison'),(74,'Geodude','1',4,20.00,0.500,'Rock Head','Sturdy','Sand Veil',11,NULL,0,0,1,0,0,0,'Rock','Ground'),(443,'Gible','1',12,20.50,0.500,'Sand Veil',NULL,'Rough Skin',1,14,0,1,0,0,0,0,'Dragon','Ground'),(526,'Gigalith','1',13,260.00,0.500,'Sturdy',NULL,'Sand Force',11,NULL,0,3,0,0,0,0,'Rock',NULL),(203,'Girafarig','1',15,41.50,0.500,'Inner Focus','Early Bird','Sap Sipper',7,NULL,0,0,0,2,0,0,'Normal','Psychic'),(487,'Giratina','1',33,750.00,-1.000,'Pressure',NULL,'Telepathy',15,NULL,3,0,0,0,0,0,'Ghost','Dragon'),(487,'Giratina (O)','1',5,650.00,-1.000,'Levitate',NULL,NULL,15,NULL,0,0,0,0,0,0,'Ghost','Dragon'),(471,'Glaceon','1',14,25.90,0.875,'Snow Cloak',NULL,'Ice Body',7,NULL,0,0,0,2,0,0,'Ice',NULL),(362,'Glalie','1',15,256.50,0.500,'Inner Focus','Ice Body','Moody',8,11,2,0,0,0,0,0,'Ice',NULL),(431,'Glameow','1',5,3.90,0.250,'Limber','Own Tempo','Keen Eye',7,NULL,0,0,0,0,0,1,'Normal',NULL),(207,'Gligar','1',11,64.80,0.500,'Hyper Cutter','Sand Veil','Immunity',5,NULL,0,0,1,0,0,0,'Ground','Flying'),(472,'Gliscor','1',22,42.50,0.500,'Hyper Cutter','Sand Veil','Poison Heal',5,NULL,0,0,2,0,0,0,'Ground','Flying'),(44,'Gloom','1',8,8.60,0.500,'Chlorophyll',NULL,'Stench',9,NULL,0,0,0,2,0,0,'Grass','Poison'),(673,'Gogoat','1',15,91.00,0.500,'Sap Sipper',NULL,'Grass Pelt',7,NULL,2,0,0,0,0,0,'Grass',NULL),(42,'Golbat','1',16,55.00,0.500,'Inner Focus',NULL,'Infiltrator',6,NULL,0,0,0,0,0,2,'Poison','Flying'),(118,'Goldeen','1',6,15.00,0.500,'Swift Swim','Water Veil','Lightningrod',3,NULL,0,1,0,0,0,0,'Water',NULL),(55,'Golduck','1',17,76.60,0.500,'Damp','Cloud Nine','Swift Swim',2,7,0,0,0,2,0,0,'Water',NULL),(76,'Golem','1',14,300.00,0.500,'Rock Head','Sturdy','Sand Veil',11,NULL,0,0,3,0,0,0,'Rock','Ground'),(622,'Golett','1',18,92.00,-1.000,'Iron Fist','Klutz','No Guard',11,NULL,0,1,0,0,0,0,'Ground','Ghost'),(623,'Golurk','1',11,330.00,-1.000,'Iron Fist','Klutz','No Guard',11,NULL,0,2,0,0,0,0,'Ground','Ghost'),(706,'Goodra','1',5,150.50,0.500,'Sap Sipper','Hydration','Gooey',14,NULL,0,0,0,0,3,0,'Dragon',NULL),(704,'Goomy','1',50,2.80,0.500,'Sap Sipper','Hydration','Gooey',14,NULL,0,0,0,0,1,0,'Dragon',NULL),(368,'Gorebyss','1',18,22.60,0.500,'Swift Swim',NULL,'Hydration',2,NULL,0,0,0,2,0,0,'Water',NULL),(574,'Gothita','1',4,5.80,0.250,'Frisk',NULL,'Shadow Tag',10,NULL,0,0,0,0,1,0,'Psychic',NULL),(576,'Gothitelle','1',10,44.00,0.250,'Frisk',NULL,'Shadow Tag',10,NULL,0,0,0,0,3,0,'Psychic',NULL),(575,'Gothorita','1',5,18.00,0.250,'Frisk',NULL,'Shadow Tag',10,NULL,0,0,0,0,2,0,'Psychic',NULL),(711,'Gourgeist','1',4,39.00,0.500,'Pickup','Frisk','Insomnia',12,NULL,0,0,2,0,0,0,'Ghost','Grass'),(210,'Granbull','1',14,48.70,0.250,'Intimidate','Quick Feet','Rattled',7,8,0,2,0,0,0,0,'Fairy',NULL),(75,'Graveler','1',10,105.00,0.500,'Rock Head','Sturdy','Sand Veil',11,NULL,0,0,2,0,0,0,'Rock','Ground'),(658,'Greninja','1',9,40.00,0.875,'Torrent',NULL,'Protean',2,NULL,0,0,0,0,0,3,'Water','Dark'),(88,'Grimer','1',9,30.00,0.500,'Stench','Sticky Hold','Poison Touch',12,NULL,1,0,0,0,0,0,'Poison',NULL),(388,'Grotle','1',9,97.00,0.875,'Overgrow',NULL,'Shell Armor',1,9,0,1,1,0,0,0,'Grass',NULL),(383,'Groudon','1',35,950.00,-1.000,'Drought',NULL,NULL,15,NULL,0,3,0,0,0,0,'Ground',NULL),(253,'Grovyle','1',9,21.60,0.875,'Overgrow',NULL,'Unburden',1,14,0,0,0,0,0,2,'Grass',NULL),(58,'Growlithe','1',7,19.00,0.750,'Intimidate','Flash Fire','Justified',7,NULL,0,1,0,0,0,0,'Fire',NULL),(326,'Grumpig','1',9,71.50,0.500,'Thick Fat','Own Tempo','Gluttony',7,NULL,0,0,0,0,2,0,'Psychic',NULL),(316,'Gulpin','1',4,10.30,0.500,'Liquid Ooze','Sticky Hold','Gluttony',12,NULL,1,0,0,0,0,0,'Poison',NULL),(533,'Gurdurr','1',25,40.00,0.750,'Guts','Sheer Force','Iron Fist',10,NULL,0,2,0,0,0,0,'Fighting',NULL),(130,'Gyarados','1',65,235.00,0.500,'Intimidate',NULL,'Moxie',3,14,0,2,0,0,0,0,'Water','Flying'),(440,'Happiny','1',19,24.40,0.000,'Natural Cure','Serene Grace','Friend Guard',15,NULL,1,0,0,0,0,0,'Normal',NULL),(297,'Hariyama','1',23,253.80,0.750,'Thick Fat','Guts','Sheer Force',10,NULL,2,0,0,0,0,0,'Fighting',NULL),(93,'Haunter','1',16,0.10,0.500,'Levitate',NULL,NULL,12,NULL,0,0,0,2,0,0,'Ghost','Poison'),(701,'Hawlucha','1',15,21.50,0.500,'Unburden','Limber','Mold Breaker',10,NULL,0,2,0,0,0,0,'Fighting','Flying'),(612,'Haxorus','1',16,105.50,0.500,'Rivalry','Mold Breaker','Unnerve',1,14,0,3,0,0,0,0,'Dragon',NULL),(631,'Heatmor','1',29,58.00,0.500,'Gluttony','Flash Fire','White Smoke',7,NULL,0,0,0,2,0,0,'Fire',NULL),(485,'Heatran','1',6,430.00,0.500,'Flash Fire',NULL,'Flame Body',15,NULL,0,0,0,3,0,0,'Fire','Steel'),(695,'Heliolisk','1',15,21.00,0.500,'Dry Skin','Sand Veil','Solar Power',1,14,0,0,0,1,0,1,'Electric','Normal'),(694,'Helioptile','1',4,6.00,0.500,'Dry Skin','Sand Veil','Solar Power',1,14,0,0,0,0,0,1,'Electric','Normal'),(214,'Heracross','1',15,54.00,0.500,'Swarm','Guts','Moxie',5,NULL,0,2,0,0,0,0,'Bug','Fighting'),(507,'Herdier','1',3,14.70,0.500,'Intimidate','Sand Rush','Scrappy',7,NULL,0,2,0,0,0,0,'Normal',NULL),(449,'Hippopotas','1',13,49.50,0.500,'Sand Stream',NULL,'Sand Force',7,NULL,0,0,1,0,0,0,'Ground',NULL),(450,'Hippowdon','1',14,300.00,0.500,'Sand Stream',NULL,'Sand Force',7,NULL,0,0,2,0,0,0,'Ground',NULL),(107,'Hitmonchan','1',14,50.20,1.000,'Keen Eye','Iron Fist','Inner Focus',10,NULL,0,0,0,0,2,0,'Fighting',NULL),(106,'Hitmonlee','1',15,49.80,1.000,'Limber','Reckless','Unburden',10,NULL,0,2,0,0,0,0,'Fighting',NULL),(237,'Hitmontop','1',14,48.00,1.000,'Intimidate','Technician','Steadfast',10,NULL,0,0,0,0,2,0,'Fighting',NULL),(250,'Ho-oh','1',38,199.00,-1.000,'Pressure',NULL,'Regenerator',15,NULL,0,0,0,0,3,0,'Fire','Flying'),(430,'Honchkrow','1',10,27.30,0.500,'Insomnia','Super Luck','Moxie',6,NULL,0,2,0,0,0,0,'Dark','Flying'),(679,'Honedge','1',13,2.00,0.500,'No Guard',NULL,NULL,11,NULL,0,0,1,0,0,0,'Steel','Ghost'),(720,'Hoopa (C)','1',4,9.00,-1.000,'Magician',NULL,NULL,15,NULL,0,0,0,3,0,0,'Psychic','Ghost'),(720,'Hoopa (U)','1',7,190.00,-1.000,'Magician',NULL,NULL,15,NULL,0,0,0,3,0,0,'Psychic','Dark'),(163,'Hoothoot','1',7,21.20,0.500,'Insomnia','Keen Eye','Tinted Lens',6,NULL,1,0,0,0,0,0,'Normal','Flying'),(187,'Hoppip','1',4,0.50,0.500,'Chlorophyll','Leaf Guard','Infiltrator',8,9,0,0,0,0,1,0,'Grass','Flying'),(116,'Horsea','1',4,8.00,0.500,'Swift Swim','Sniper','Damp',2,14,0,0,0,1,0,0,'Water',NULL),(229,'Houndoom','1',14,35.00,0.500,'Early Bird','Flash Fire','Unnerve',7,NULL,0,0,0,2,0,0,'Dark','Fire'),(228,'Houndour','1',6,10.80,0.500,'Early Bird','Flash Fire','Unnerve',7,NULL,0,0,0,1,0,0,'Dark','Fire'),(367,'Huntail','1',17,27.00,0.500,'Swift Swim',NULL,'Water Veil',2,NULL,0,1,1,0,0,0,'Water',NULL),(635,'Hydreigon','1',6,160.00,0.500,'Levitate',NULL,NULL,14,NULL,0,0,0,3,0,0,'Dark','Dragon'),(97,'Hypno','1',16,75.60,0.500,'Insomnia','Forewarn','Inner Focus',10,NULL,0,0,0,0,2,0,'Psychic',NULL),(174,'Igglybuff','1',3,1.00,0.250,'Cute Charm',NULL,'Friend Guard',15,NULL,1,0,0,0,0,0,'Normal','Fairy'),(314,'Illumise','1',6,17.70,0.000,'Oblivious','Tinted Lens','Prankster',5,10,0,0,0,0,0,1,'Bug',NULL),(392,'Infernape','1',17,55.00,0.875,'Blaze',NULL,'Iron Fist',7,10,0,1,0,1,0,1,'Fire','Fighting'),(686,'Inkay','1',10,3.50,0.500,'Suction Cups','Contrary','Infiltrator',2,3,0,1,0,0,0,0,'Dark','Psychic'),(2,'Ivysaur','1',10,13.00,0.875,'Overgrow',NULL,'Chlorophyll',1,9,0,0,0,1,1,0,'Grass','Poison'),(593,'Jellicent','1',10,135.00,0.500,'Water Absorb','Cursed Body','Damp',12,NULL,0,0,0,0,2,0,'Water','Ghost'),(39,'Jigglypuff','1',5,5.50,0.250,'Cute Charm',NULL,'Friend Guard',8,NULL,2,0,0,0,0,0,'Normal','Fairy'),(385,'Jirachi','1',3,1.10,-1.000,'Serene Grace',NULL,NULL,15,NULL,3,0,0,0,0,0,'Steel','Psychic'),(135,'Jolteon','1',8,24.50,0.875,'Volt Absorb',NULL,'Quick Feet',7,NULL,0,0,0,0,0,2,'Electric',NULL),(595,'Joltik','1',6,0.60,0.500,'Compoundeyes','Unnerve','Swarm',5,NULL,0,0,0,0,0,1,'Bug','Electric'),(189,'Jumpluff','1',8,3.00,0.500,'Chlorophyll','Leaf Guard','Infiltrator',8,9,0,0,0,0,0,3,'Grass','Flying'),(124,'Jynx','1',14,40.60,0.000,'Oblivious','Forewarn','Dry Skin',10,NULL,0,0,0,2,0,0,'Ice','Psychic'),(140,'Kabuto','1',5,11.50,0.875,'Swift Swim','Battle Armor','Weak Armor',2,4,0,0,1,0,0,0,'Rock','Water'),(141,'Kabutops','1',13,40.50,0.875,'Swift Swim','Battle Armor','Weak Armor',2,4,0,2,0,0,0,0,'Rock','Water'),(64,'Kadabra','1',13,56.50,0.750,'Synchronize','Inner Focus','Magic Guard',10,NULL,0,0,0,2,0,0,'Psychic',NULL),(14,'Kakuna','1',6,10.00,0.500,'Shed Skin',NULL,NULL,5,NULL,0,0,2,0,0,0,'Bug','Poison'),(115,'Kangaskhan','1',22,80.00,0.000,'Early Bird','Scrappy','Inner Focus',1,NULL,2,0,0,0,0,0,'Normal',NULL),(588,'Karrablast','1',6,5.90,0.500,'Swarm','Shed Skin','No Guard',5,NULL,0,1,0,0,0,0,'Bug',NULL),(352,'Kecleon','1',10,22.00,0.500,'Color Change',NULL,NULL,7,NULL,0,0,0,0,1,0,'Normal',NULL),(647,'Keldeo','1',10,48.50,-1.000,'Justified',NULL,NULL,15,NULL,0,0,0,3,0,0,'Water','Fighting'),(230,'Kingdra','1',18,152.00,0.500,'Swift Swim','Sniper','Damp',2,14,0,1,0,1,1,0,'Water','Dragon'),(99,'Kingler','1',13,60.00,0.500,'Hyper Cutter','Shell Armor','Sheer Force',4,NULL,0,2,0,0,0,0,'Water',NULL),(281,'Kirlia','1',8,20.20,0.500,'Synchronize','Trace','Telepathy',12,NULL,0,0,0,2,0,0,'Psychic','Fairy'),(600,'Klang','1',5,51.00,-1.000,'Plus','Minus','Clear Body',11,NULL,0,0,2,0,0,0,'Steel',NULL),(707,'Klefki','1',17,3.00,0.500,'Prankster',NULL,'Magician',11,NULL,0,0,1,0,0,0,'Steel','Fairy'),(599,'Klink','1',18,21.00,-1.000,'Plus','Minus','Clear Body',11,NULL,0,0,1,0,0,0,'Steel',NULL),(601,'Klinklang','1',26,81.00,-1.000,'Plus','Minus','Clear Body',11,NULL,0,0,3,0,0,0,'Steel',NULL),(109,'Koffing','1',6,1.00,0.500,'Levitate',NULL,NULL,12,NULL,0,0,1,0,0,0,'Poison',NULL),(98,'Krabby','1',4,6.50,0.500,'Hyper Cutter','Shell Armor','Sheer Force',4,NULL,0,1,0,0,0,0,'Water',NULL),(401,'Kricketot','1',9,2.20,0.500,'Shed Skin',NULL,'Run Away',5,NULL,0,0,1,0,0,0,'Bug',NULL),(402,'Kricketune','1',14,25.50,0.500,'Swarm',NULL,'Technician',5,NULL,0,2,0,0,0,0,'Bug',NULL),(552,'Krokorok','1',7,33.40,0.500,'Intimidate','Moxie','Anger Point',7,NULL,0,2,0,0,0,0,'Ground','Dark'),(553,'Krookodile','1',12,96.30,0.500,'Intimidate','Moxie','Anger Point',7,NULL,0,3,0,0,0,0,'Ground','Dark'),(382,'Kyogre','1',45,352.00,-1.000,'Drizzle',NULL,NULL,15,NULL,0,0,0,3,0,0,'Water',NULL),(646,'Kyurem','1',4,325.00,-1.000,'Pressure',NULL,NULL,15,NULL,1,1,0,1,0,0,'Dragon','Ice'),(305,'Lairon','1',9,120.00,0.500,'Sturdy','Rock Head','Heavy Metal',1,NULL,0,0,2,0,0,0,'Steel','Rock'),(608,'Lampent','1',16,13.00,0.500,'Flash Fire','Flame Body','Shadow Tag',12,NULL,0,0,0,2,0,0,'Ghost','Fire'),(645,'Landorus','1',15,68.00,1.000,'Sand Force',NULL,'Sheer Force',15,NULL,0,0,0,3,0,0,'Ground','Flying'),(171,'Lanturn','1',12,22.50,0.500,'Volt Absorb','Illuminate','Water Absorb',3,NULL,2,0,0,0,0,0,'Water','Electric'),(131,'Lapras','1',25,220.00,0.500,'Water Absorb','Shell Armor','Hydration',1,2,2,0,0,0,0,0,'Water','Ice'),(636,'Larvesta','1',15,28.80,0.500,'Flame Body',NULL,'Swarm',5,NULL,0,1,0,0,0,0,'Bug','Fire'),(246,'Larvitar','1',6,72.00,0.500,'Guts',NULL,'Sand Veil',1,NULL,0,1,0,0,0,0,'Rock','Ground'),(380,'Latias','1',14,40.00,0.000,'Levitate',NULL,NULL,15,NULL,0,0,0,0,3,0,'Dragon','Psychic'),(381,'Latios','1',20,60.00,1.000,'Levitate',NULL,NULL,15,NULL,0,0,0,3,0,0,'Dragon','Psychic'),(470,'Leafeon','1',16,25.50,0.875,'Leaf Guard',NULL,'Chlorophyll',7,NULL,0,0,2,0,0,0,'Grass',NULL),(542,'Leavanny','1',6,20.50,0.500,'Swarm','Chlorophyll','Overcoat',5,NULL,0,3,0,0,0,0,'Bug','Grass'),(166,'Ledian','1',14,35.60,0.500,'Swarm','Early Bird','Iron Fist',5,NULL,0,0,0,0,2,0,'Bug','Flying'),(165,'Ledyba','1',10,10.80,0.500,'Swarm','Early Bird','Rattled',5,NULL,0,0,0,0,1,0,'Bug','Flying'),(463,'Lickilicky','1',15,140.00,0.500,'Own Tempo','Oblivious','Cloud Nine',1,NULL,3,0,0,0,0,0,'Normal',NULL),(108,'Lickitung','1',12,65.50,0.500,'Own Tempo','Oblivious','Cloud Nine',1,NULL,2,0,0,0,0,0,'Normal',NULL),(510,'Liepard','1',8,37.50,0.500,'Limber','Unburden','Prankster',7,NULL,0,0,0,0,0,2,'Dark',NULL),(345,'Lileep','1',10,23.80,0.875,'Suction Cups',NULL,'Storm Drain',4,NULL,0,0,0,0,1,0,'Rock','Grass'),(549,'Lilligant','1',14,16.30,0.000,'Chlorophyll','Own Tempo','Leaf Guard',9,NULL,0,0,0,2,0,0,'Grass',NULL),(506,'Lillipup','1',11,4.10,0.500,'Vital Spirit','Pickup','Run Away',7,NULL,0,1,0,0,0,0,'Normal',NULL),(264,'Linoone','1',5,32.50,0.500,'Pickup','Gluttony','Quick Feet',7,NULL,0,0,0,0,0,2,'Normal',NULL),(667,'Litleo','1',17,13.50,0.250,'Rivalry','Unnerve','Moxie',7,NULL,0,0,0,1,0,0,'Fire','Normal'),(607,'Litwick','1',14,3.10,0.500,'Flash Fire','Flame Body','Shadow Tag',12,NULL,0,0,0,1,0,0,'Ghost','Fire'),(271,'Lombre','1',12,32.50,0.500,'Swift Swim','Rain Dish','Own Tempo',2,9,0,0,0,0,2,0,'Water','Grass'),(428,'Lopunny','1',2,33.30,0.500,'Cute Charm','Klutz','Limber',7,10,0,0,0,0,0,2,'Normal',NULL),(270,'Lotad','1',5,2.60,0.500,'Swift Swim','Rain Dish','Own Tempo',2,9,0,0,0,0,1,0,'Water','Grass'),(294,'Loudred','1',10,40.50,0.500,'Soundproof',NULL,'Scrappy',1,7,2,0,0,0,0,0,'Normal',NULL),(448,'Lucario','1',7,54.00,0.875,'Steadfast','Inner Focus','Justified',7,10,0,1,0,1,0,0,'Fighting','Steel'),(272,'Ludicolo','1',15,55.00,0.500,'Swift Swim','Rain Dish','Own Tempo',2,9,0,0,0,0,3,0,'Water','Grass'),(249,'Lugia','1',52,216.00,-1.000,'Pressure',NULL,'Multiscale',15,NULL,0,0,0,0,3,0,'Psychic','Flying'),(457,'Lumineon','1',12,24.00,0.500,'Swift Swim','Storm Drain','Water Veil',3,NULL,0,0,0,0,0,2,'Water',NULL),(337,'Lunatone','1',10,168.00,-1.000,'Levitate',NULL,NULL,11,NULL,0,0,0,2,0,0,'Rock','Psychic'),(370,'Luvdisc','1',6,8.70,0.250,'Swift Swim',NULL,'Hydration',3,NULL,0,0,0,0,0,1,'Water',NULL),(404,'Luxio','1',9,30.50,0.500,'Rivalry','Intimidate','Guts',7,NULL,0,2,0,0,0,0,'Electric',NULL),(405,'Luxray','1',9,42.00,0.500,'Rivalry','Intimidate','Guts',7,NULL,0,3,0,0,0,0,'Electric',NULL),(68,'Machamp','1',16,130.00,0.750,'Guts','No Guard','Steadfast',10,NULL,0,3,0,0,0,0,'Fighting',NULL),(67,'Machoke','1',15,70.50,0.750,'Guts','No Guard','Steadfast',10,NULL,0,2,0,0,0,0,'Fighting',NULL),(66,'Machop','1',8,19.50,0.750,'Guts','No Guard','Steadfast',10,NULL,0,1,0,0,0,0,'Fighting',NULL),(240,'Magby','1',7,21.40,0.750,'Flame Body',NULL,'Vital Spirit',15,NULL,0,0,0,0,0,1,'Fire',NULL),(219,'Magcargo','1',8,55.00,0.500,'Magma Armor','Flame Body','Weak Armor',12,NULL,0,0,2,0,0,0,'Fire','Rock'),(129,'Magikarp','1',9,10.00,0.500,'Swift Swim',NULL,'Rattled',3,14,0,0,0,0,0,1,'Water',NULL),(126,'Magmar','1',13,44.50,0.750,'Flame Body',NULL,'Vital Spirit',10,NULL,0,0,0,2,0,0,'Fire',NULL),(467,'Magmortar','1',20,68.00,0.750,'Flame Body',NULL,'Vital Spirit',10,NULL,0,0,0,3,0,0,'Fire',NULL),(81,'Magnemite','1',3,6.00,-1.000,'Magnet Pull','Sturdy','Analytic',11,NULL,0,0,0,1,0,0,'Electric','Steel'),(82,'Magneton','1',10,60.00,-1.000,'Magnet Pull','Sturdy','Analytic',11,NULL,0,0,0,2,0,0,'Electric','Steel'),(462,'Magnezone','1',16,180.00,-1.000,'Magnet Pull','Sturdy','Analytic',11,NULL,0,0,0,3,0,0,'Electric','Steel'),(296,'Makuhita','1',10,86.40,0.750,'Thick Fat','Guts','Sheer Force',10,NULL,1,0,0,0,0,0,'Fighting',NULL),(687,'Malamar','1',8,47.00,0.500,'Suction Cups','Contrary','Infiltrator',2,3,0,2,0,0,0,0,'Dark','Psychic'),(473,'Mamoswine','1',13,291.00,0.500,'Oblivious','Snow Cloak','Thick Fat',7,NULL,0,3,0,0,0,0,'Ice','Ground'),(490,'Manaphy','1',5,1.40,-1.000,'Hydration',NULL,NULL,2,8,3,0,0,0,0,0,'Water',NULL),(630,'Mandibuzz','1',32,39.50,0.000,'Big Pecks','Overcoat','Weak Armor',6,NULL,0,0,0,2,0,0,'Dark','Flying'),(310,'Manectric','1',15,40.20,0.500,'Static','Lightningrod','Minus',7,NULL,0,0,0,0,0,2,'Electric',NULL),(56,'Mankey','1',5,28.00,0.500,'Vital Spirit','Anger Point','Defiant',7,NULL,0,1,0,0,0,0,'Fighting',NULL),(226,'Mantine','1',21,220.00,0.500,'Swift Swim','Water Absorb','Water Veil',2,NULL,0,0,0,0,2,0,'Water','Flying'),(458,'Mantyke','1',17,65.00,0.500,'Swift Swim','Water Absorb',NULL,15,NULL,0,0,0,0,1,0,'Water','Flying'),(556,'Maractus','1',19,28.00,0.500,'Water Absorb','Chlorophyll','Storm Drain',9,NULL,0,0,0,2,0,0,'Grass',NULL),(179,'Mareep','1',6,7.80,0.500,'Static',NULL,'Plus',1,7,0,0,0,1,0,0,'Electric',NULL),(183,'Marill','1',4,8.50,0.500,'Thick Fat','Huge Power','Sap Sipper',2,8,2,0,0,0,0,0,'Water','Fairy'),(105,'Marowak','1',10,45.00,0.500,'Rock Head','Lightningrod','Battle Armor',1,NULL,0,0,2,0,0,0,'Ground',NULL),(259,'Marshtomp','1',7,28.00,0.875,'Torrent',NULL,'Damp',1,2,0,2,0,0,0,0,'Water','Ground'),(284,'Masquerain','1',8,3.60,0.500,'Intimidate',NULL,'Unnerve',2,5,0,0,0,1,1,0,'Bug','Flying'),(303,'Mawile','1',6,11.50,0.500,'Hyper Cutter','Intimidate','Sheer Force',7,8,0,1,1,0,0,0,'Steel','Fairy'),(308,'Medicham','1',13,31.50,0.500,'Pure Power',NULL,'Telepathy',10,NULL,0,0,0,0,0,2,'Fighting','Psychic'),(307,'Meditite','1',6,11.20,0.500,'Pure Power',NULL,'Telepathy',10,NULL,0,0,0,0,0,1,'Fighting','Psychic'),(154,'Meganium','1',18,100.50,0.875,'Overgrow',NULL,'Leaf Guard',1,9,0,0,1,0,2,0,'Grass',NULL),(648,'Meloetta (A)','1',3,6.50,-1.000,'Serene Grace',NULL,NULL,15,NULL,0,0,0,1,1,1,'Normal','Psychic'),(648,'Meloetta (P)','1',7,6.50,-1.000,'Serene Grace',NULL,NULL,15,NULL,0,0,0,0,0,0,'Normal','Fighting'),(678,'Meowstic','1',5,8.50,0.500,'Keen Eye','Infiltrator','Prankster (M) or Competitive (F)',7,NULL,0,0,0,0,0,2,'Psychic',NULL),(52,'Meowth','1',4,4.20,0.500,'Pickup','Technician','Unnerve',7,NULL,0,0,0,0,0,1,'Normal',NULL),(481,'Mesprit','1',15,0.30,-1.000,'Levitate',NULL,NULL,15,NULL,0,1,0,1,1,0,'Psychic',NULL),(376,'Metagross','1',16,550.00,-1.000,'Clear Body',NULL,'Light Metal',11,NULL,0,0,3,0,0,0,'Steel','Psychic'),(375,'Metang','1',12,202.50,-1.000,'Clear Body',NULL,'Light Metal',11,NULL,0,0,2,0,0,0,'Steel','Psychic'),(11,'Metapod','1',7,9.90,0.500,'Shed Skin',NULL,NULL,5,NULL,0,0,2,0,0,0,'Bug',NULL),(151,'Mew','1',4,4.00,-1.000,'Synchronize',NULL,NULL,15,NULL,3,0,0,0,0,0,'Psychic',NULL),(150,'Mewtwo','1',20,122.00,-1.000,'Pressure',NULL,'Unnerve',15,NULL,0,0,0,3,0,0,'Psychic',NULL),(619,'Mienfoo','1',3,20.00,0.500,'Inner Focus','Regenerator','Reckless',7,10,0,1,0,0,0,0,'Fighting',NULL),(620,'Mienshao','1',8,35.50,0.500,'Inner Focus','Regenerator','Reckless',7,10,0,2,0,0,0,0,'Fighting',NULL),(262,'Mightyena','1',10,37.00,0.500,'Intimidate','Quick Feet','Moxie',7,NULL,0,2,0,0,0,0,'Dark',NULL),(350,'Milotic','1',62,162.00,0.500,'Marvel Scale',NULL,'Cute Charm',2,14,0,0,0,0,2,0,'Water',NULL),(241,'Miltank','1',12,75.50,0.000,'Thick Fat','Scrappy','Sap Sipper',7,NULL,0,0,2,0,0,0,'Normal',NULL),(439,'Mime Jr.','1',14,13.00,0.500,'Soundproof','Filter','Technician',15,NULL,0,0,0,0,1,0,'Psychic','Fairy'),(572,'Minccino','1',6,5.80,0.250,'Cute Charm','Technician','Skill Link',7,NULL,0,0,0,0,0,1,'Normal',NULL),(312,'Minun','1',4,4.20,0.500,'Minus',NULL,NULL,8,NULL,0,0,0,0,0,1,'Electric',NULL),(200,'Misdreavus','1',7,1.00,0.500,'Levitate',NULL,NULL,12,NULL,0,0,0,0,1,0,'Ghost',NULL),(429,'Mismagius','1',4,4.40,0.500,'Levitate',NULL,NULL,12,NULL,0,0,0,1,1,0,'Ghost',NULL),(146,'Moltres','1',20,60.00,-1.000,'Pressure',NULL,'Flame Body',15,NULL,0,0,0,3,0,0,'Fire','Flying'),(391,'Monferno','1',8,22.00,0.875,'Blaze',NULL,'Iron Fist',7,10,0,0,0,1,0,1,'Fire','Fighting'),(414,'Mothim','1',11,23.30,1.000,'Swarm',NULL,'Tinted Lens',5,NULL,0,1,0,1,0,0,'Bug','Flying'),(122,'Mr. Mime','1',13,54.50,0.500,'Soundproof','Filter','Technician',10,NULL,0,0,0,0,2,0,'Psychic','Fairy'),(258,'Mudkip','1',4,7.60,0.875,'Torrent',NULL,'Damp',1,2,0,1,0,0,0,0,'Water',NULL),(89,'Muk','1',12,30.00,0.500,'Stench','Sticky Hold','Poison Touch',12,NULL,1,1,0,0,0,0,'Poison',NULL),(446,'Munchlax','1',8,105.00,0.875,'Pickup','Thick Fat','Gluttony',15,NULL,1,0,0,0,0,0,'Normal',NULL),(517,'Munna','1',3,23.30,0.500,'Forewarn','Synchronize','Telepathy',7,NULL,1,0,0,0,0,0,'Psychic',NULL),(198,'Murkrow','1',5,2.10,0.500,'Insomnia','Super Luck','Prankster',6,NULL,0,0,0,0,0,1,'Dark','Flying'),(518,'Musharna','1',7,60.50,0.500,'Forewarn','Synchronize','Telepathy',7,NULL,2,0,0,0,0,0,'Psychic',NULL),(177,'Natu','1',2,2.00,0.500,'Synchronize','Early Bird','Magic Bounce',6,NULL,0,0,0,1,0,0,'Psychic','Flying'),(34,'Nidoking','1',14,62.00,1.000,'Poison Point','Rivalry','Sheer Force',1,7,0,3,0,0,0,0,'Poison','Ground'),(31,'Nidoqueen','1',13,60.00,0.000,'Poison Point','Rivalry','Sheer Force',15,NULL,3,0,0,0,0,0,'Poison','Ground'),(32,'Nidoran(F)','1',5,9.00,1.000,'Poison Point','Rivalry','Hustle',1,7,0,1,0,0,0,0,'Poison',NULL),(29,'Nidoran(M)','1',4,7.00,0.000,'Poison Point','Rivalry','Hustle',1,7,1,0,0,0,0,0,'Poison',NULL),(30,'Nidorina','1',8,20.00,0.000,'Poison Point','Rivalry','Hustle',15,NULL,2,0,0,0,0,0,'Poison',NULL),(33,'Nidorino','1',9,19.50,1.000,'Poison Point','Rivalry','Hustle',1,7,0,2,0,0,0,0,'Poison',NULL),(290,'Nincada','1',5,5.50,0.500,'Compoundeyes',NULL,'Run Away',5,NULL,0,0,1,0,0,0,'Bug','Ground'),(38,'Ninetales','1',11,19.90,0.250,'Flash Fire',NULL,'Drought',7,NULL,0,0,0,0,1,1,'Fire',NULL),(291,'Ninjask','1',8,12.00,0.500,'Speed Boost',NULL,'Infiltrator',5,NULL,0,0,0,0,0,2,'Bug','Flying'),(164,'Noctowl','1',16,40.80,0.500,'Insomnia','Keen Eye','Tinted Lens',6,NULL,2,0,0,0,0,0,'Normal','Flying'),(714,'Noibat','1',4,8.00,0.500,'Frisk','Infiltrator','Telepathy',6,NULL,0,0,0,0,0,1,'Flying','Dragon'),(715,'Noivern','1',6,85.00,0.500,'Frisk','Infiltrator','Telepathy',6,NULL,0,0,0,0,0,2,'Flying','Dragon'),(299,'Nosepass','1',10,97.00,0.500,'Sturdy','Magnet Pull','Sand Force',11,NULL,0,0,1,0,0,0,'Rock',NULL),(322,'Numel','1',7,24.00,0.500,'Oblivious','Simple','Own Tempo',7,NULL,0,0,0,1,0,0,'Fire','Ground'),(274,'Nuzleaf','1',10,28.00,0.500,'Chlorophyll','Early Bird','Pickpocket',7,9,0,2,0,0,0,0,'Grass','Dark'),(224,'Octillery','1',9,28.50,0.500,'Suction Cups','Sniper','Moody',2,3,0,1,0,1,0,0,'Water',NULL),(43,'Oddish','1',5,5.40,0.500,'Chlorophyll',NULL,'Run Away',9,NULL,0,0,0,1,0,0,'Grass','Poison'),(138,'Omanyte','1',4,7.50,0.875,'Swift Swim','Shell Armor','Weak Armor',2,4,0,0,1,0,0,0,'Rock','Water'),(139,'Omastar','1',10,35.00,0.875,'Swift Swim','Shell Armor','Weak Armor',2,4,0,0,2,0,0,0,'Rock','Water'),(95,'Onix','1',88,210.00,0.500,'Rock Head','Sturdy','Weak Armor',11,NULL,0,0,1,0,0,0,'Rock','Ground'),(501,'Oshawott','1',6,5.90,0.875,'Torrent',NULL,'Shell Armor',7,NULL,0,0,0,1,0,0,'Water',NULL),(417,'Pachirisu','1',3,3.90,0.500,'Run Away','Pickup','Volt Absorb',7,8,0,0,0,0,0,1,'Electric',NULL),(484,'Palkia','1',4,336.00,-1.000,'Pressure',NULL,'Telepathy',15,NULL,0,0,0,3,0,0,'Water','Dragon'),(536,'Palpitoad','1',5,17.00,0.500,'Swift Swim','Hydration','Water Absorb',2,NULL,2,0,0,0,0,0,'Water','Ground'),(674,'Pancham','1',5,8.00,0.500,'Iron Fist','Mold Breaker','Scrappy',7,10,0,1,0,0,0,0,'Fighting',NULL),(675,'Pangoro','1',13,136.00,0.500,'Iron Fist','Mold Breaker','Scrappy',7,10,0,2,0,0,0,0,'Fighting','Dark'),(515,'Panpour','1',4,13.50,0.875,'Gluttony',NULL,'Torrent',7,NULL,0,0,0,0,0,1,'Water',NULL),(511,'Pansage','1',16,10.50,0.875,'Gluttony',NULL,'Overgrow',7,NULL,0,0,0,0,0,1,'Grass',NULL),(513,'Pansear','1',9,11.00,0.875,'Gluttony',NULL,'Blaze',7,NULL,0,0,0,0,0,1,'Fire',NULL),(46,'Paras','1',3,5.40,0.500,'Effect Spore','Dry Skin','Damp',5,9,0,1,0,0,0,0,'Bug','Grass'),(47,'Parasect','1',10,29.50,0.500,'Effect Spore','Dry Skin','Damp',5,9,0,2,1,0,0,0,'Bug','Grass'),(504,'Patrat','1',10,11.60,0.500,'Run Away','Keen Eye','Analytic',7,NULL,0,1,0,0,0,0,'Normal',NULL),(624,'Pawniard','1',16,10.20,0.500,'Defiant','Inner Focus','Pressure',10,NULL,0,1,0,0,0,0,'Dark','Steel'),(279,'Pelipper','1',12,28.00,0.500,'Keen Eye',NULL,'Rain Dish',2,6,0,0,2,0,0,0,'Water','Flying'),(53,'Persian','1',10,32.00,0.500,'Limber','Technician','Unnerve',7,NULL,0,0,0,0,0,2,'Normal',NULL),(548,'Petilil','1',11,6.60,0.000,'Chlorophyll','Own Tempo','Leaf Guard',9,NULL,0,0,0,1,0,0,'Grass',NULL),(231,'Phanpy','1',5,33.50,0.500,'Pickup',NULL,'Sand Veil',7,NULL,1,0,0,0,0,0,'Ground',NULL),(708,'Phantump','1',3,7.00,0.500,'Natural Cure','Frisk','Harvest',9,12,0,1,0,0,0,0,'Ghost','Grass'),(489,'Phione','1',16,3.10,-1.000,'Hydration',NULL,NULL,2,8,1,0,0,0,0,0,'Water',NULL),(172,'Pichu','1',3,2.00,0.500,'Static',NULL,'Lightningrod',15,NULL,0,0,0,0,0,1,'Electric',NULL),(18,'Pidgeot','1',15,39.50,0.500,'Keen Eye','Tangled Feet','Big Pecks',6,NULL,0,0,0,0,0,3,'Normal','Flying'),(17,'Pidgeotto','1',11,30.00,0.500,'Keen Eye','Tangled Feet','Big Pecks',6,NULL,0,0,0,0,0,2,'Normal','Flying'),(16,'Pidgey','1',3,1.80,0.500,'Keen Eye','Tangled Feet','Big Pecks',6,NULL,0,0,0,0,0,1,'Normal','Flying'),(519,'Pidove','1',11,2.10,0.500,'Big Pecks','Super Luck','Rivalry',6,NULL,0,1,0,0,0,0,'Normal','Flying'),(499,'Pignite','1',6,55.50,0.875,'Blaze',NULL,'Thick Fat',7,NULL,0,2,0,0,0,0,'Fire','Fighting'),(25,'Pikachu','1',4,6.00,0.500,'Static',NULL,'Lightningrod',7,8,0,0,0,0,0,2,'Electric',NULL),(221,'Piloswine','1',11,55.80,0.500,'Oblivious','Snow Cloak','Thick Fat',7,NULL,1,1,0,0,0,0,'Ice','Ground'),(204,'Pineco','1',6,7.20,0.500,'Sturdy',NULL,'Overcoat',5,NULL,0,0,1,0,0,0,'Bug',NULL),(127,'Pinsir','1',15,55.00,0.500,'Hyper Cutter','Mold Breaker','Moxie',5,NULL,0,2,0,0,0,0,'Bug',NULL),(393,'Piplup','1',3,5.20,0.875,'Torrent',NULL,'Defiant',2,7,0,0,0,1,0,0,'Water',NULL),(311,'Plusle','1',4,4.20,0.500,'Plus',NULL,NULL,8,NULL,0,0,0,0,0,1,'Electric',NULL),(186,'Politoed','1',11,33.90,0.500,'Water Absorb','Damp','Drizzle',2,NULL,0,0,0,0,3,0,'Water',NULL),(60,'Poliwag','1',6,12.40,0.500,'Water Absorb','Damp','Swift Swim',2,NULL,0,0,0,0,0,1,'Water',NULL),(61,'Poliwhirl','1',10,20.00,0.500,'Water Absorb','Damp','Swift Swim',2,NULL,0,0,0,0,0,2,'Water',NULL),(62,'Poliwrath','1',13,54.00,0.500,'Water Absorb','Damp','Swift Swim',2,NULL,0,0,3,0,0,0,'Water','Fighting'),(77,'Ponyta','1',10,30.00,0.500,'Run Away','Flash Fire','Flame Body',7,NULL,0,0,0,0,0,1,'Fire',NULL),(261,'Poochyena','1',5,13.60,0.500,'Run Away','Quick Feet','Rattled',7,NULL,0,1,0,0,0,0,'Dark',NULL),(137,'Porygon','1',8,36.50,-1.000,'Trace','Download','Analytic',11,NULL,0,0,0,1,0,0,'Normal',NULL),(474,'Porygon-Z','1',3,34.00,-1.000,'Adaptability','Download','Analytic',11,NULL,0,0,0,3,0,0,'Normal',NULL),(233,'Porygon2','1',6,32.50,-1.000,'Trace','Download','Analytic',11,NULL,0,0,0,2,0,0,'Normal',NULL),(57,'Primeape','1',10,32.00,0.500,'Vital Spirit','Anger Point','Defiant',7,NULL,0,2,0,0,0,0,'Fighting',NULL),(394,'Prinplup','1',6,23.00,0.875,'Torrent',NULL,'Defiant',2,7,0,0,0,2,0,0,'Water',NULL),(476,'Probopass','1',3,340.00,0.500,'Sturdy','Magnet Pull','Sand Force',11,NULL,0,0,1,0,2,0,'Rock','Steel'),(54,'Psyduck','1',8,19.60,0.500,'Damp','Cloud Nine','Swift Swim',2,7,0,0,0,1,0,0,'Water',NULL),(710,'Pumpkaboo','1',16,5.00,0.500,'Pickup','Frisk','Insomnia',12,NULL,0,0,1,0,0,0,'Ghost','Grass'),(247,'Pupitar','1',12,152.00,0.500,'Shed Skin',NULL,NULL,1,NULL,0,2,0,0,0,0,'Rock','Ground'),(509,'Purrloin','1',12,10.10,0.500,'Limber','Unburden','Prankster',7,NULL,0,0,0,0,0,1,'Dark',NULL),(432,'Purugly','1',13,43.80,0.250,'Thick Fat','Own Tempo','Defiant',7,NULL,0,0,0,0,0,2,'Normal',NULL),(668,'Pyroar','1',2,81.50,0.250,'Rivalry','Unnerve','Moxie',7,NULL,0,0,0,2,0,0,'Fire','Normal'),(195,'Quagsire','1',14,75.00,0.500,'Damp','Water Absorb','Unaware',2,7,2,0,0,0,0,0,'Water','Ground'),(156,'Quilava','1',9,19.00,0.875,'Blaze',NULL,'Flash Fire',7,NULL,0,0,0,1,0,1,'Fire',NULL),(651,'Quilladin','1',3,29.00,0.875,'Overgrow',NULL,'Bulletproof',7,NULL,0,0,2,0,0,0,'Grass',NULL),(211,'Qwilfish','1',5,3.90,0.500,'Poison Point','Swift Swim','Intimidate',3,NULL,0,1,0,0,0,0,'Water','Poison'),(26,'Raichu','1',8,30.00,0.500,'Static',NULL,'Lightningrod',7,8,0,0,0,0,0,3,'Electric',NULL),(243,'Raikou','1',19,178.00,-1.000,'Pressure',NULL,'Volt Absorb',15,NULL,0,0,0,1,0,2,'Electric',NULL),(280,'Ralts','1',4,6.60,0.500,'Synchronize','Trace','Telepathy',12,NULL,0,0,0,1,0,0,'Psychic','Fairy'),(409,'Rampardos','1',2,102.50,0.875,'Mold Breaker',NULL,'Sheer Force',1,NULL,0,2,0,0,0,0,'Rock',NULL),(78,'Rapidash','1',17,95.00,0.500,'Run Away','Flash Fire','Flame Body',7,NULL,0,0,0,0,0,2,'Fire',NULL),(20,'Raticate','1',7,18.50,0.500,'Run Away','Guts','Hustle',7,NULL,0,0,0,0,0,2,'Normal',NULL),(19,'Rattata','1',3,3.50,0.500,'Run Away','Guts','Hustle',7,NULL,0,0,0,0,0,1,'Normal',NULL),(384,'Rayquaza','1',70,206.50,-1.000,'Air Lock',NULL,NULL,15,NULL,0,2,0,1,0,0,'Dragon','Flying'),(378,'Regice','1',18,175.00,-1.000,'Clear Body',NULL,'Ice Body',15,NULL,0,0,0,0,3,0,'Ice',NULL),(486,'Regigigas','1',8,420.00,-1.000,'Slow Start',NULL,NULL,15,NULL,0,3,0,0,0,0,'Normal',NULL),(377,'Regirock','1',17,230.00,-1.000,'Clear Body',NULL,'Sturdy',15,NULL,0,0,3,0,0,0,'Rock',NULL),(379,'Registeel','1',19,205.00,-1.000,'Clear Body',NULL,'Light Metal',15,NULL,0,0,2,0,1,0,'Steel',NULL),(369,'Relicanth','1',10,23.40,0.875,'Swift Swim','Rock Head','Sturdy',2,3,1,0,1,0,0,0,'Water','Rock'),(223,'Remoraid','1',6,12.00,0.500,'Hustle','Sniper','Moody',2,3,0,0,0,1,0,0,'Water',NULL),(643,'Reshiram','1',3,330.00,-1.000,'Turboblaze',NULL,NULL,15,NULL,0,0,0,3,0,0,'Dragon','Fire'),(579,'Reuniclus','1',12,20.10,0.500,'Overcoat','Magic Guard','Regenerator',12,NULL,0,0,0,3,0,0,'Psychic',NULL),(112,'Rhydon','1',19,120.00,0.500,'Lightningrod','Rock Head','Reckless',1,7,0,2,0,0,0,0,'Ground','Rock'),(111,'Rhyhorn','1',10,115.00,0.500,'Lightningrod','Rock Head','Reckless',1,7,0,0,1,0,0,0,'Ground','Rock'),(464,'Rhyperior','1',19,282.80,0.500,'Lightningrod','Solid Rock','Reckless',1,7,0,3,0,0,0,0,'Ground','Rock'),(447,'Riolu','1',13,20.20,0.875,'Steadfast','Inner Focus','Prankster',15,NULL,0,1,0,0,0,0,'Fighting',NULL),(524,'Roggenrola','1',8,18.00,0.500,'Sturdy',NULL,'Sand Force',11,NULL,0,0,1,0,0,0,'Rock',NULL),(315,'Roselia','1',3,2.00,0.500,'Natural Cure','Poison Point','Leaf Guard',8,9,0,0,0,2,0,0,'Grass','Poison'),(407,'Roserade','1',5,14.50,0.500,'Natural Cure','Poison Point','Technician',8,9,0,0,0,3,0,0,'Grass','Poison'),(479,'Rotom','1',42,0.30,-1.000,'Levitate',NULL,NULL,12,NULL,0,0,0,1,0,1,'Electric','Ghost'),(479,'Rotom (Cut)','1',4,0.30,-1.000,'Levitate',NULL,NULL,12,NULL,0,0,0,0,0,0,'Electric','Grass'),(479,'Rotom (Frost)','1',45,0.30,-1.000,'Levitate',NULL,NULL,12,NULL,0,0,0,0,0,0,'Electric','Ice'),(479,'Rotom (Heat)','1',17,0.30,-1.000,'Levitate',NULL,NULL,12,NULL,0,0,0,0,0,0,'Electric','Fire'),(479,'Rotom (Spin)','1',15,0.30,-1.000,'Levitate',NULL,NULL,12,NULL,0,0,0,0,0,0,'Electric','Flying'),(479,'Rotom (Wash)','1',37,0.30,-1.000,'Levitate',NULL,NULL,12,NULL,0,0,0,0,0,0,'Electric','Water'),(627,'Rufflet','1',20,10.50,1.000,'Keen Eye','Sheer Force','Hustle',6,NULL,0,1,0,0,0,0,'Normal','Flying'),(302,'Sableye','1',5,11.00,0.500,'Keen Eye','Stall','Prankster',10,NULL,0,1,1,0,0,0,'Dark','Ghost'),(373,'Salamence','1',15,102.60,0.500,'Intimidate',NULL,'Moxie',14,NULL,0,3,0,0,0,0,'Dragon','Flying'),(503,'Samurott','1',6,94.60,0.875,'Torrent',NULL,'Shell Armor',7,NULL,0,0,0,3,0,0,'Water',NULL),(551,'Sandile','1',17,15.20,0.500,'Intimidate','Moxie','Anger Point',7,NULL,0,1,0,0,0,0,'Ground','Dark'),(27,'Sandshrew','1',6,12.00,0.500,'Sand Veil',NULL,'Sand Rush',7,NULL,0,0,1,0,0,0,'Ground',NULL),(28,'Sandslash','1',10,29.50,0.500,'Sand Veil',NULL,'Sand Rush',7,NULL,0,0,2,0,0,0,'Ground',NULL),(539,'Sawk','1',7,51.00,1.000,'Sturdy','Inner Focus','Mold Breaker',10,NULL,0,2,0,0,0,0,'Fighting',NULL),(586,'Sawsbuck','1',3,92.50,0.500,'Chlorophyll','Sap Sipper','Serene Grace',7,NULL,0,2,0,0,0,0,'Normal','Grass'),(664,'Scatterbug','1',6,2.50,0.500,'Shield Dust','Compound Eyes','Friend Guard',5,NULL,0,0,1,0,0,0,'Bug',NULL),(254,'Sceptile','1',17,52.20,0.875,'Overgrow',NULL,'Unburden',1,14,0,0,0,0,0,3,'Grass',NULL),(212,'Scizor','1',18,118.00,0.500,'Swarm','Technician','Light Metal',5,NULL,0,2,0,0,0,0,'Bug','Steel'),(545,'Scolipede','1',3,200.50,0.500,'Poison Point','Swarm','Quick Feet',5,NULL,0,0,0,0,0,3,'Bug','Poison'),(560,'Scrafty','1',5,30.00,0.500,'Shed Skin','Moxie','Intimidate',7,14,0,0,1,0,1,0,'Dark','Fighting'),(559,'Scraggy','1',4,11.80,0.500,'Shed Skin','Moxie','Intimidate',7,14,0,1,0,0,0,0,'Dark','Fighting'),(123,'Scyther','1',15,56.00,0.500,'Swarm','Technician','Steadfast',5,NULL,0,1,0,0,0,0,'Bug','Flying'),(117,'Seadra','1',12,25.00,0.500,'Poison Point','Sniper','Damp',2,14,0,0,1,1,0,0,'Water',NULL),(119,'Seaking','1',13,39.00,0.500,'Swift Swim','Water Veil','Lightningrod',3,NULL,0,2,0,0,0,0,'Water',NULL),(364,'Sealeo','1',11,87.60,0.500,'Thick Fat','Ice Body','Oblivious',2,7,2,0,0,0,0,0,'Ice','Water'),(273,'Seedot','1',5,4.00,0.500,'Chlorophyll','Early Bird','Pickpocket',7,9,0,0,1,0,0,0,'Grass',NULL),(86,'Seel','1',11,90.00,0.500,'Thick Fat','Hydration','Ice Body',2,7,0,0,0,0,1,0,'Water',NULL),(537,'Seismitoad','1',11,62.00,0.500,'Swift Swim','Poison Touch','Water Absorb',2,NULL,3,0,0,0,0,0,'Water','Ground'),(161,'Sentret','1',8,6.00,0.500,'Run Away','Keen Eye','Frisk',7,NULL,0,1,0,0,0,0,'Normal',NULL),(497,'Serperior','1',4,63.00,0.875,'Overgrow',NULL,'Contrary',7,9,0,0,0,0,0,3,'Grass',NULL),(496,'Servine','1',12,16.00,0.875,'Overgrow',NULL,'Contrary',7,9,0,0,0,0,0,2,'Grass',NULL),(336,'Seviper','1',27,52.50,0.500,'Shed Skin',NULL,'Infiltrator',7,14,0,1,0,1,0,0,'Poison',NULL),(540,'Sewaddle','1',10,2.50,0.500,'Swarm','Chlorophyll','Overcoat',5,NULL,0,0,1,0,0,0,'Bug','Grass'),(319,'Sharpedo','1',18,88.80,0.500,'Rough Skin',NULL,'Speed Boost',3,NULL,0,2,0,0,0,0,'Water','Dark'),(492,'Shaymin','1',15,2.10,-1.000,'Natural Cure',NULL,NULL,15,NULL,3,0,0,0,0,0,'Grass',NULL),(492,'Shaymin (S)','1',5,5.20,-1.000,'Serene Grace',NULL,NULL,15,NULL,0,0,0,0,0,0,'Grass','Flying'),(292,'Shedinja','1',8,1.20,-1.000,'Wonder Guard',NULL,NULL,11,NULL,2,0,0,0,0,0,'Bug','Ghost'),(372,'Shelgon','1',11,110.50,0.500,'Rock Head',NULL,'Overcoat',14,NULL,0,0,2,0,0,0,'Dragon',NULL),(90,'Shellder','1',3,4.00,0.500,'Shell Armor','Skill Link','Overcoat',4,NULL,0,0,1,0,0,0,'Water',NULL),(422,'Shellos','1',4,6.30,0.500,'Sticky Hold','Storm Drain','Sand Force',2,12,1,0,0,0,0,0,'Water',NULL),(616,'Shelmet','1',5,7.70,0.500,'Hydration','Shell Armor','Overcoat',5,NULL,0,0,1,0,0,0,'Bug',NULL),(410,'Shieldon','1',5,57.00,0.875,'Sturdy',NULL,'Soundproof',1,NULL,0,0,1,0,0,0,'Rock','Steel'),(275,'Shiftry','1',13,59.60,0.500,'Chlorophyll','Early Bird','Pickpocket',7,9,0,3,0,0,0,0,'Grass','Dark'),(403,'Shinx','1',2,9.50,0.500,'Rivalry','Intimidate','Guts',7,NULL,0,1,0,0,0,0,'Electric',NULL),(285,'Shroomish','1',4,4.50,0.500,'Effect Spore','Poison Heal','Quick Feet',8,9,1,0,0,0,0,0,'Grass',NULL),(213,'Shuckle','1',6,20.50,0.500,'Sturdy','Gluttony','Contrary',5,NULL,0,0,1,0,1,0,'Bug','Rock'),(353,'Shuppet','1',6,2.30,0.500,'Insomnia','Frisk','Cursed Body',12,NULL,0,1,0,0,0,0,'Ghost',NULL),(561,'Sigilyph','1',4,14.00,0.500,'Wonder Skin','Magic Guard','Tinted Lens',6,NULL,0,0,0,2,0,0,'Psychic','Flying'),(266,'Silcoon','1',6,10.00,0.500,'Shed Skin',NULL,NULL,5,NULL,0,0,2,0,0,0,'Bug',NULL),(516,'Simipour','1',9,29.00,0.875,'Gluttony',NULL,'Torrent',7,NULL,0,0,0,0,0,2,'Water',NULL),(512,'Simisage','1',4,30.50,0.875,'Gluttony',NULL,'Overgrow',7,NULL,0,0,0,0,0,2,'Grass',NULL),(514,'Simisear','1',17,28.00,0.875,'Gluttony',NULL,'Blaze',7,NULL,0,0,0,0,0,2,'Fire',NULL),(227,'Skarmory','1',17,50.50,0.500,'Keen Eye','Sturdy','Weak Armor',6,NULL,0,0,2,0,0,0,'Steel','Flying'),(672,'Skiddo','1',4,31.00,0.500,'Sap Sipper',NULL,'Grass Pelt',7,NULL,1,0,0,0,0,0,'Grass',NULL),(188,'Skiploom','1',6,1.00,0.500,'Chlorophyll','Leaf Guard','Infiltrator',8,9,0,0,0,0,0,2,'Grass','Flying'),(300,'Skitty','1',6,11.00,0.250,'Cute Charm','Normalize','Wonder Skin',7,8,0,0,0,0,0,1,'Normal',NULL),(451,'Skorupi','1',4,12.00,0.500,'Battle Armor','Sniper','Keen Eye',5,4,0,0,1,0,0,0,'Poison','Bug'),(690,'Skrelp','1',3,7.30,0.500,'Poison Point','Poison Touch','Adaptability',2,14,0,0,0,0,1,0,'Poison','Water'),(435,'Skuntank','1',6,38.00,0.500,'Stench','Aftermath','Keen Eye',7,NULL,2,0,0,0,0,0,'Poison','Dark'),(289,'Slaking','1',20,130.50,0.500,'Truant',NULL,NULL,7,NULL,3,0,0,0,0,0,'Normal',NULL),(287,'Slakoth','1',8,24.00,0.500,'Truant',NULL,NULL,7,NULL,1,0,0,0,0,0,'Normal',NULL),(705,'Sliggoo','1',7,17.50,0.500,'Sap Sipper','Hydration','Gooey',14,NULL,0,0,0,0,2,0,'Dragon',NULL),(80,'Slowbro','1',16,78.50,0.500,'Oblivious','Own Tempo','Regenerator',1,2,0,0,2,0,0,0,'Water','Psychic'),(199,'Slowking','1',20,79.50,0.500,'Oblivious','Own Tempo','Regenerator',1,2,0,0,0,0,3,0,'Water','Psychic'),(79,'Slowpoke','1',12,36.00,0.500,'Oblivious','Own Tempo','Regenerator',1,2,1,0,0,0,0,0,'Water','Psychic'),(218,'Slugma','1',7,35.00,0.500,'Magma Armor','Flame Body','Weak Armor',12,NULL,0,0,0,1,0,0,'Fire',NULL),(685,'Slurpuff','1',27,5.00,0.500,'Sweet Veil',NULL,'Unburden',8,NULL,0,0,2,0,0,0,'Fairy',NULL),(235,'Smeargle','1',12,58.00,0.500,'Own Tempo','Technician','Moody',7,NULL,0,0,0,0,0,1,'Normal',NULL),(238,'Smoochum','1',4,6.00,0.000,'Oblivious','Forewarn','Hydration',15,NULL,0,0,0,1,0,0,'Ice','Psychic'),(215,'Sneasel','1',9,28.00,0.500,'Inner Focus','Keen Eye','Pickpocket',7,NULL,0,0,0,0,0,1,'Dark','Ice'),(495,'Snivy','1',9,8.10,0.875,'Overgrow',NULL,'Contrary',7,9,0,0,0,0,0,1,'Grass',NULL),(143,'Snorlax','1',21,460.00,0.875,'Immunity','Thick Fat','Gluttony',1,NULL,2,0,0,0,0,0,'Normal',NULL),(361,'Snorunt','1',7,16.80,0.500,'Inner Focus','Ice Body','Moody',8,11,1,0,0,0,0,0,'Ice',NULL),(459,'Snover','1',24,50.50,0.500,'Snow Warning',NULL,'Soundproof',1,9,0,1,0,0,0,0,'Ice','Grass'),(209,'Snubbull','1',6,7.80,0.250,'Intimidate','Run Away','Rattled',7,8,0,1,0,0,0,0,'Fairy',NULL),(577,'Solosis','1',2,1.00,0.500,'Overcoat','Magic Guard','Regenerator',12,NULL,0,0,0,1,0,0,'Psychic',NULL),(338,'Solrock','1',12,154.00,-1.000,'Levitate',NULL,NULL,11,NULL,0,2,0,0,0,0,'Rock','Psychic'),(21,'Spearow','1',3,2.00,0.500,'Keen Eye',NULL,'Sniper',6,NULL,0,0,0,0,0,1,'Normal','Flying'),(665,'Spewpa','1',8,8.40,0.500,'Shed Skin',NULL,'Friend Guard',5,NULL,0,0,2,0,0,0,'Bug',NULL),(363,'Spheal','1',8,39.50,0.500,'Thick Fat','Ice Body','Oblivious',2,7,1,0,0,0,0,0,'Ice','Water'),(167,'Spinarak','1',5,8.50,0.500,'Swarm','Insomnia','Sniper',5,NULL,0,1,0,0,0,0,'Bug','Poison'),(327,'Spinda','1',11,5.00,0.500,'Own Tempo','Tangled Feet','Contrary',7,10,0,0,0,1,0,0,'Normal',NULL),(442,'Spiritomb','1',7,108.00,0.500,'Pressure',NULL,'Infiltrator',12,NULL,0,0,1,0,1,0,'Ghost','Dark'),(325,'Spoink','1',7,30.60,0.500,'Thick Fat','Own Tempo','Gluttony',7,NULL,0,0,0,0,1,0,'Psychic',NULL),(682,'Spritzee','1',8,0.50,0.500,'Healer',NULL,'Aroma Veil',8,NULL,1,0,0,0,0,0,'Fairy',NULL),(7,'Squirtle','1',5,9.00,0.875,'Torrent',NULL,'Rain Dish',1,2,0,0,1,0,0,0,'Water',NULL),(234,'Stantler','1',14,71.20,0.500,'Intimidate','Frisk','Sap Sipper',7,NULL,0,1,0,0,0,0,'Normal',NULL),(398,'Staraptor','1',3,24.90,0.500,'Intimidate',NULL,'Reckless',6,NULL,0,3,0,0,0,0,'Normal','Flying'),(397,'Staravia','1',10,15.50,0.500,'Intimidate',NULL,'Reckless',6,NULL,0,0,0,0,0,2,'Normal','Flying'),(396,'Starly','1',5,2.00,0.500,'Keen Eye',NULL,NULL,6,NULL,0,0,0,0,0,1,'Normal','Flying'),(121,'Starmie','1',11,80.00,-1.000,'Illuminate','Natural Cure','Analytic',4,NULL,0,0,0,0,0,2,'Water','Psychic'),(120,'Staryu','1',8,34.50,-1.000,'Illuminate','Natural Cure','Analytic',4,NULL,0,0,0,0,0,1,'Water',NULL),(208,'Steelix','1',92,400.00,0.500,'Rock Head','Sturdy','Sheer Force',11,NULL,0,0,2,0,0,0,'Steel','Ground'),(508,'Stoutland','1',6,61.00,0.500,'Intimidate','Sand Rush','Scrappy',7,NULL,0,3,0,0,0,0,'Normal',NULL),(618,'Stunfisk','1',14,11.00,0.500,'Static','Limber','Sand Veil',2,12,2,0,0,0,0,0,'Ground','Electric'),(434,'Stunky','1',6,19.20,0.500,'Stench','Aftermath','Keen Eye',7,NULL,0,0,0,0,0,1,'Poison','Dark'),(185,'Sudowoodo','1',12,38.00,0.500,'Sturdy','Rock Head','Rattled',11,NULL,0,0,2,0,0,0,'Rock',NULL),(245,'Suicune','1',20,187.00,-1.000,'Pressure',NULL,'Water Absorb',15,NULL,0,0,1,0,2,0,'Water',NULL),(192,'Sunflora','1',8,8.50,0.500,'Chlorophyll','Solar Power','Early Bird',9,NULL,0,0,0,2,0,0,'Grass',NULL),(191,'Sunkern','1',3,1.80,0.500,'Chlorophyll','Solar Power','Early Bird',9,NULL,0,0,0,1,0,0,'Grass',NULL),(283,'Surskit','1',5,1.70,0.500,'Swift Swim',NULL,'Rain Dish',2,5,0,0,0,0,0,1,'Bug','Water'),(333,'Swablu','1',4,1.20,0.500,'Natural Cure',NULL,'Cloud Nine',6,14,0,0,0,0,1,0,'Normal','Flying'),(541,'Swadloon','1',15,7.30,0.500,'Leaf Guard','Chlorophyll','Overcoat',5,NULL,0,0,2,0,0,0,'Bug','Grass'),(317,'Swalot','1',17,80.00,0.500,'Liquid Ooze','Sticky Hold','Gluttony',12,NULL,2,0,0,0,0,0,'Poison',NULL),(260,'Swampert','1',15,81.90,0.875,'Torrent',NULL,'Damp',1,2,0,3,0,0,0,0,'Water','Ground'),(581,'Swanna','1',12,24.20,0.500,'Keen Eye','Big Pecks','Hydration',2,6,0,0,0,0,0,2,'Water','Flying'),(277,'Swellow','1',7,19.80,0.500,'Guts',NULL,'Scrappy',6,NULL,0,0,0,0,0,2,'Normal','Flying'),(220,'Swinub','1',4,6.50,0.500,'Oblivious','Snow Cloak','Thick Fat',7,NULL,0,1,0,0,0,0,'Ice','Ground'),(684,'Swirlix','1',13,3.50,0.500,'Sweet Veil',NULL,'Unburden',8,NULL,0,0,1,0,0,0,'Fairy',NULL),(528,'Swoobat','1',3,10.50,0.500,'Unaware','Klutz','Simple',7,6,0,0,0,0,0,2,'Psychic','Flying'),(700,'Sylveon','1',5,23.50,0.875,'Cute Charm',NULL,'Pixilate',7,NULL,0,0,0,0,2,0,'Fairy',NULL),(276,'Taillow','1',3,2.30,0.500,'Guts',NULL,'Scrappy',6,NULL,0,0,0,0,0,1,'Normal','Flying'),(663,'Talonflame','1',3,24.50,0.500,'Flame Body',NULL,'Gale Wings',6,NULL,0,0,0,0,0,3,'Fire','Flying'),(114,'Tangela','1',10,35.00,0.500,'Chlorophyll','Leaf Guard','Regenerator',9,NULL,0,0,1,0,0,0,'Grass',NULL),(465,'Tangrowth','1',10,128.60,0.500,'Chlorophyll','Leaf Guard','Regenerator',9,NULL,0,0,2,0,0,0,'Grass',NULL),(128,'Tauros','1',14,88.40,1.000,'Intimidate','Anger Point','Sheer Force',7,NULL,0,1,0,0,0,1,'Normal',NULL),(216,'Teddiursa','1',6,8.80,0.500,'Pickup','Quick Feet','Honey Gather',7,NULL,0,1,0,0,0,0,'Normal',NULL),(72,'Tentacool','1',9,45.50,0.500,'Clear Body','Liquid Ooze','Rain Dish',4,NULL,0,0,0,0,1,0,'Water','Poison'),(73,'Tentacruel','1',16,55.00,0.500,'Clear Body','Liquid Ooze','Rain Dish',4,NULL,0,0,0,0,2,0,'Water','Poison'),(498,'Tepig','1',11,9.90,0.875,'Blaze',NULL,'Thick Fat',7,NULL,1,0,0,0,0,0,'Fire',NULL),(639,'Terrakion','1',16,260.00,-1.000,'Justified',NULL,NULL,15,NULL,0,3,0,0,0,0,'Rock','Fighting'),(538,'Throh','1',10,55.50,1.000,'Guts','Inner Focus','Mold Breaker',10,NULL,2,0,0,0,0,0,'Fighting',NULL),(642,'Thundurus','1',15,61.00,1.000,'Prankster',NULL,'Defiant',15,NULL,0,3,0,0,0,0,'Electric','Flying'),(532,'Timburr','1',12,12.50,0.750,'Guts','Sheer Force','Iron Fist',10,NULL,0,1,0,0,0,0,'Fighting',NULL),(564,'Tirtouga','1',3,16.50,0.875,'Solid Rock','Sturdy','Swift Swim',2,4,0,0,1,0,0,0,'Water','Rock'),(468,'Togekiss','1',25,38.00,0.875,'Hustle','Serene Grace','Super Luck',6,8,0,0,0,2,1,0,'Fairy','Flying'),(175,'Togepi','1',3,1.50,0.875,'Hustle','Serene Grace','Super Luck',15,NULL,0,0,0,0,1,0,'Fairy',NULL),(176,'Togetic','1',6,3.20,0.875,'Hustle','Serene Grace','Super Luck',6,8,0,0,0,0,2,0,'Fairy','Flying'),(255,'Torchic','1',4,2.50,0.875,'Blaze',NULL,'Speed Boost',7,NULL,0,0,0,1,0,0,'Fire',NULL),(324,'Torkoal','1',5,80.40,0.500,'White Smoke',NULL,'Shell Armor',7,NULL,0,0,2,0,0,0,'Fire',NULL),(641,'Tornadus','1',10,63.00,1.000,'Prankster',NULL,'Defiant',15,NULL,0,3,0,0,0,0,'Flying',NULL),(389,'Torterra','1',12,310.00,0.875,'Overgrow',NULL,'Shell Armor',1,9,0,2,1,0,0,0,'Grass','Ground'),(158,'Totodile','1',6,9.50,0.875,'Torrent',NULL,'Sheer Force',1,2,0,1,0,0,0,0,'Water',NULL),(454,'Toxicroak','1',10,44.40,0.500,'Anticipate','Dry Skin','Poison Touch',10,NULL,0,2,0,0,0,0,'Poison','Fighting'),(520,'Tranquill','1',6,15.00,0.500,'Big Pecks','Super Luck','Rivalry',6,NULL,0,2,0,0,0,0,'Normal','Flying'),(328,'Trapinch','1',7,15.00,0.500,'Hyper Cutter','Arena Trap','Sheer Force',5,NULL,0,1,0,0,0,0,'Ground',NULL),(252,'Treecko','1',5,5.00,0.875,'Overgrow',NULL,'Unburden',1,14,0,0,0,0,0,1,'Grass',NULL),(709,'Trevenant','1',7,71.00,0.500,'Natural Cure','Frisk','Harvest',9,12,0,2,0,0,0,0,'Ghost','Grass'),(357,'Tropius','1',20,100.00,0.500,'Chlorophyll','Solar Power','Harvest',1,9,2,0,0,0,0,0,'Grass','Flying'),(568,'Trubbish','1',13,31.00,0.500,'Stench','Sticky Hold','Aftermath',11,NULL,0,0,0,0,0,1,'Poison',NULL),(387,'Turtwig','1',5,10.20,0.875,'Overgrow',NULL,'Shell Armor',1,9,0,1,0,0,0,0,'Grass',NULL),(535,'Tympole','1',7,4.50,0.500,'Swift Swim','Hydration','Water Absorb',2,NULL,0,0,0,0,0,1,'Water',NULL),(602,'Tynamo','1',11,0.30,0.500,'Levitate',NULL,NULL,12,NULL,0,0,0,0,0,1,'Electric',NULL),(157,'Typhlosion','1',17,79.50,0.875,'Blaze',NULL,'Flash Fire',7,NULL,0,0,0,3,0,0,'Fire',NULL),(248,'Tyranitar','1',20,202.00,0.500,'Sand Stream',NULL,'Unnerve',1,NULL,0,3,0,0,0,0,'Rock','Dark'),(697,'Tyrantrum','1',9,270.00,0.875,'Strong Jaw',NULL,'Sturdy',1,14,0,2,0,0,0,0,'Rock','Dragon'),(236,'Tyrogue','1',7,21.00,1.000,'Guts','Steadfast','Vital Spirit',15,NULL,0,1,0,0,0,0,'Fighting',NULL),(696,'Tyrunt','1',4,26.00,0.875,'Strong Jaw',NULL,'Sturdy',1,14,0,1,0,0,0,0,'Rock','Dragon'),(197,'Umbreon','1',10,27.00,0.875,'Synchronize',NULL,'Inner Focus',7,NULL,0,0,0,0,2,0,'Dark',NULL),(521,'Unfezant','1',12,29.00,0.500,'Big Pecks','Super Luck','Rivalry',6,NULL,0,3,0,0,0,0,'Normal','Flying'),(201,'Unown','1',5,5.00,-1.000,'Levitate',NULL,NULL,15,NULL,0,1,0,1,0,0,'Psychic',NULL),(217,'Ursaring','1',18,125.80,0.500,'Guts','Quick Feet','Unnerve',7,NULL,0,2,0,0,0,0,'Normal',NULL),(480,'Uxie','1',3,0.30,-1.000,'Levitate',NULL,NULL,15,NULL,0,0,2,0,1,0,'Psychic',NULL),(583,'Vanillish','1',8,41.00,0.500,'Ice Body',NULL,'Weak Armor',11,NULL,0,0,0,2,0,0,'Ice',NULL),(582,'Vanillite','1',1,5.70,0.500,'Ice Body',NULL,'Weak Armor',11,NULL,0,0,0,1,0,0,'Ice',NULL),(584,'Vanilluxe','1',6,57.50,0.500,'Ice Body',NULL,'Weak Armor',11,NULL,0,0,0,3,0,0,'Ice',NULL),(134,'Vaporeon','1',10,29.00,0.875,'Water Absorb',NULL,'Hydration',7,NULL,2,0,0,0,0,0,'Water',NULL),(543,'Venipede','1',13,5.30,0.500,'Poison Point','Swarm','Quick Feet',5,NULL,0,0,1,0,0,0,'Bug','Poison'),(49,'Venomoth','1',15,12.50,0.500,'Shield Dust','Tinted Lens','Wonder Skin',5,NULL,0,0,0,1,0,1,'Bug','Poison'),(48,'Venonat','1',10,30.00,0.500,'Compoundeyes','Tinted Lens','Run Away',5,NULL,0,0,0,0,1,0,'Bug','Poison'),(3,'Venusaur','1',20,100.00,0.875,'Overgrow',NULL,'Chlorophyll',1,9,0,0,0,2,1,0,'Grass','Poison'),(416,'Vespiquen','1',5,38.50,0.000,'Pressure',NULL,'Unnerve',5,NULL,0,0,1,0,1,0,'Bug','Flying'),(329,'Vibrava','1',11,15.30,0.500,'Levitate',NULL,NULL,5,NULL,0,1,0,0,0,1,'Ground','Dragon'),(494,'Victini','1',4,4.00,-1.000,'Victory Star',NULL,NULL,15,NULL,3,0,0,0,0,0,'Psychic','Fire'),(71,'Victreebel','1',17,15.50,0.500,'Chlorophyll',NULL,'Gluttony',9,NULL,0,3,0,0,0,0,'Grass','Poison'),(288,'Vigoroth','1',14,46.50,0.500,'Vital Spirit',NULL,NULL,7,NULL,0,0,0,0,0,2,'Normal',NULL),(45,'Vileplume','1',12,18.60,0.500,'Chlorophyll',NULL,'Effect Spore',9,NULL,0,0,0,3,0,0,'Grass','Poison'),(640,'Virizion','1',4,200.00,-1.000,'Justified',NULL,NULL,15,NULL,0,0,0,0,3,0,'Grass','Fighting'),(666,'Vivillon','1',8,17.00,0.500,'Shield Dust','Compound Eyes','Friend Guard',5,NULL,1,0,0,1,0,1,'Bug','Flying'),(313,'Volbeat','1',7,17.70,1.000,'Illuminate','Swarm','Prankster',5,10,0,0,0,0,0,1,'Bug',NULL),(721,'Volcanion','1',4,195.00,-1.000,'Water Absorb',NULL,NULL,15,NULL,0,0,0,3,0,0,'Fire','Water'),(637,'Volcarona','1',4,46.00,0.500,'Flame Body',NULL,'Swarm',5,NULL,0,0,0,3,0,0,'Bug','Fire'),(100,'Voltorb','1',5,10.40,-1.000,'Soundproof','Static','Aftermath',11,NULL,0,0,0,0,0,1,'Electric',NULL),(629,'Vullaby','1',15,9.00,0.000,'Big Pecks','Overcoat','Weak Armor',6,NULL,0,0,1,0,0,0,'Dark','Flying'),(37,'Vulpix','1',6,9.90,0.250,'Flash Fire',NULL,'Drought',7,NULL,0,0,0,0,0,1,'Fire',NULL),(320,'Wailmer','1',20,130.00,0.500,'Water Veil','Oblivious','Pressure',7,3,1,0,0,0,0,0,'Water',NULL),(321,'Wailord','1',145,398.00,0.500,'Water Veil','Oblivious','Pressure',7,3,2,0,0,0,0,0,'Water',NULL),(365,'Walrein','1',14,150.60,0.500,'Thick Fat','Ice Body','Oblivious',2,7,3,0,0,0,0,0,'Ice','Water'),(8,'Wartortle','1',10,22.50,0.875,'Torrent',NULL,'Rain Dish',1,2,0,0,1,0,1,0,'Water',NULL),(505,'Watchog','1',6,27.00,0.500,'Illuminate','Keen Eye','Analytic',7,NULL,0,2,0,0,0,0,'Normal',NULL),(461,'Weavile','1',18,34.00,0.500,'Pressure',NULL,'Pickpocket',7,NULL,0,1,0,0,0,1,'Dark','Ice'),(13,'Weedle','1',3,3.20,0.500,'Shield Dust',NULL,'Run Away',5,NULL,0,0,0,0,0,1,'Bug','Poison'),(70,'Weepinbell','1',10,6.40,0.500,'Chlorophyll',NULL,'Gluttony',9,NULL,0,2,0,0,0,0,'Grass','Poison'),(110,'Weezing','1',12,9.50,0.500,'Levitate',NULL,NULL,12,NULL,0,0,2,0,0,0,'Poison',NULL),(547,'Whimsicott','1',6,6.60,0.500,'Prankster','Infiltrator','Chlorophyll',9,8,0,0,0,0,0,2,'Grass','Fairy'),(544,'Whirlipede','1',10,58.50,0.500,'Poison Point','Swarm','Quick Feet',5,NULL,0,0,2,0,0,0,'Bug','Poison'),(340,'Whiscash','1',9,23.60,0.500,'Oblivious','Anticipate','Hydration',3,NULL,2,0,0,0,0,0,'Water','Ground'),(293,'Whismur','1',6,16.30,0.500,'Soundproof',NULL,'Rattled',1,7,1,0,0,0,0,0,'Normal',NULL),(40,'Wigglytuff','1',10,12.00,0.250,'Cute Charm',NULL,'Frisk',8,NULL,3,0,0,0,0,0,'Normal','Fairy'),(278,'Wingull','1',6,9.50,0.500,'Keen Eye',NULL,'Rain Dish',2,6,0,0,0,0,0,1,'Water','Flying'),(202,'Wobbuffet','1',13,28.50,0.500,'Shadow Tag',NULL,'Telepathy',12,NULL,2,0,0,0,0,0,'Psychic',NULL),(527,'Woobat','1',14,2.10,0.500,'Unaware','Klutz','Simple',7,6,0,0,0,0,0,1,'Psychic','Flying'),(194,'Wooper','1',4,8.50,0.500,'Damp','Water Absorb','Unaware',2,7,1,0,0,0,0,0,'Water','Ground'),(413,'Wormadam (P)','1',12,6.50,0.000,'Anticipate',NULL,'Overcoat',5,NULL,0,0,0,0,2,0,'Bug','Grass'),(413,'Wormadam (S)','1',4,6.50,0.000,'Anticipate',NULL,'Overcoat',5,NULL,0,0,0,0,0,0,'Bug','Ground'),(413,'Wormadam (T)','1',7,6.50,0.000,'Anticipate',NULL,'Overcoat',5,NULL,0,0,0,0,0,0,'Bug','Steel'),(265,'Wurmple','1',3,3.60,0.500,'Shield Dust',NULL,'Run Away',5,NULL,1,0,0,0,0,0,'Bug',NULL),(360,'Wynaut','1',6,14.00,0.500,'Shadow Tag',NULL,'Telepathy',15,NULL,1,0,0,0,0,0,'Psychic',NULL),(178,'Xatu','1',15,15.00,0.500,'Synchronize','Early Bird','Magic Bounce',6,NULL,0,0,0,1,0,1,'Psychic','Flying'),(716,'Xerneas','1',18,215.00,-1.000,'Fairy Aura',NULL,NULL,15,NULL,3,0,0,0,0,0,'Fairy',NULL),(562,'Yamask','1',7,1.50,0.500,'Mummy',NULL,NULL,11,12,0,0,1,0,0,0,'Ghost',NULL),(193,'Yanma','1',12,38.00,0.500,'Speed Boost','Compoundeyes','Frisk',5,NULL,0,0,0,0,0,1,'Bug','Flying'),(469,'Yanmega','1',9,51.50,0.500,'Speed Boost','Tinted Lens','Frisk',5,NULL,0,2,0,0,0,0,'Bug','Flying'),(717,'Yveltal','1',3,203.00,-1.000,'Dark Aura',NULL,NULL,15,NULL,3,0,0,0,0,0,'Dark','Flying'),(335,'Zangoose','1',13,40.30,0.500,'Immunity',NULL,'Poison Rampage',7,NULL,0,2,0,0,0,0,'Normal',NULL),(145,'Zapdos','1',16,52.60,-1.000,'Pressure',NULL,'Lightningrod',15,NULL,0,0,0,3,0,0,'Electric','Flying'),(523,'Zebstrika','1',5,79.50,0.500,'Lightningrod','Motor Drive','Sap Sipper',7,NULL,0,0,0,0,0,2,'Electric',NULL),(644,'Zekrom','1',6,345.00,-1.000,'Teravolt',NULL,NULL,15,NULL,0,3,0,0,0,0,'Dragon','Electric'),(263,'Zigzagoon','1',4,17.50,0.500,'Pickup','Gluttony','Quick Feet',7,NULL,0,0,0,0,0,1,'Normal',NULL),(571,'Zoroark','1',13,81.10,0.875,'Illusion',NULL,NULL,7,NULL,0,0,0,2,0,0,'Dark',NULL),(570,'Zorua','1',11,12.50,0.875,'Illusion',NULL,NULL,7,NULL,0,0,0,1,0,0,'Dark',NULL),(41,'Zubat','1',8,7.50,0.500,'Inner Focus',NULL,'Infiltrator',6,NULL,0,0,0,0,0,1,'Poison','Flying'),(634,'Zweilous','1',14,50.00,0.500,'Hustle',NULL,NULL,14,NULL,0,2,0,0,0,0,'Dark','Dragon'),(718,'Zygarde','1',6,305.00,-1.000,'Aura Break',NULL,NULL,15,NULL,3,0,0,0,0,0,'Dragon','Ground');
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonlocation`
--

DROP TABLE IF EXISTS `pokemonlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokemonlocation` (
  `poke_name` varchar(64) NOT NULL,
  `region_name` varchar(64) NOT NULL,
  PRIMARY KEY (`poke_name`,`region_name`),
  KEY `region_name` (`region_name`),
  CONSTRAINT `pokemonlocation_ibfk_1` FOREIGN KEY (`poke_name`) REFERENCES `pokemon` (`p_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemonlocation_ibfk_2` FOREIGN KEY (`region_name`) REFERENCES `region` (`region_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonlocation`
--

LOCK TABLES `pokemonlocation` WRITE;
/*!40000 ALTER TABLE `pokemonlocation` DISABLE KEYS */;
INSERT INTO `pokemonlocation` VALUES ('Absol','Hoenn'),('Aggron','Hoenn'),('Altaria','Hoenn'),('Anorith','Hoenn'),('Armaldo','Hoenn'),('Aron','Hoenn'),('Azurill','Hoenn'),('Bagon','Hoenn'),('Baltoy','Hoenn'),('Banette','Hoenn'),('Barboach','Hoenn'),('Beautifly','Hoenn'),('Beldum','Hoenn'),('Blaziken','Hoenn'),('Breloom','Hoenn'),('Cacnea','Hoenn'),('Cacturne','Hoenn'),('Camerupt','Hoenn'),('Carvanha','Hoenn'),('Cascoon','Hoenn'),('Castform','Hoenn'),('Chimecho','Hoenn'),('Clamperl','Hoenn'),('Claydol','Hoenn'),('Combusken','Hoenn'),('Corphish','Hoenn'),('Cradily','Hoenn'),('Crawdaunt','Hoenn'),('Delcatty','Hoenn'),('Deoxys (A)','Hoenn'),('Deoxys (D)','Hoenn'),('Deoxys (N)','Hoenn'),('Deoxys (S)','Hoenn'),('Dusclops','Hoenn'),('Duskull','Hoenn'),('Dustox','Hoenn'),('Electrike','Hoenn'),('Exploud','Hoenn'),('Feebas','Hoenn'),('Flygon','Hoenn'),('Gardevoir','Hoenn'),('Glalie','Hoenn'),('Gorebyss','Hoenn'),('Groudon','Hoenn'),('Grovyle','Hoenn'),('Grumpig','Hoenn'),('Gulpin','Hoenn'),('Hariyama','Hoenn'),('Huntail','Hoenn'),('Illumise','Hoenn'),('Jirachi','Hoenn'),('Kecleon','Hoenn'),('Kirlia','Hoenn'),('Kyogre','Hoenn'),('Lairon','Hoenn'),('Latias','Hoenn'),('Latios','Hoenn'),('Lileep','Hoenn'),('Linoone','Hoenn'),('Lombre','Hoenn'),('Lotad','Hoenn'),('Loudred','Hoenn'),('Ludicolo','Hoenn'),('Lunatone','Hoenn'),('Luvdisc','Hoenn'),('Makuhita','Hoenn'),('Manectric','Hoenn'),('Marshtomp','Hoenn'),('Masquerain','Hoenn'),('Mawile','Hoenn'),('Medicham','Hoenn'),('Meditite','Hoenn'),('Metagross','Hoenn'),('Metang','Hoenn'),('Mightyena','Hoenn'),('Milotic','Hoenn'),('Minun','Hoenn'),('Mudkip','Hoenn'),('Nincada','Hoenn'),('Ninjask','Hoenn'),('Nosepass','Hoenn'),('Numel','Hoenn'),('Nuzleaf','Hoenn'),('Pelipper','Hoenn'),('Plusle','Hoenn'),('Poochyena','Hoenn'),('Ralts','Hoenn'),('Rayquaza','Hoenn'),('Regice','Hoenn'),('Regirock','Hoenn'),('Registeel','Hoenn'),('Relicanth','Hoenn'),('Roselia','Hoenn'),('Sableye','Hoenn'),('Salamence','Hoenn'),('Sceptile','Hoenn'),('Sealeo','Hoenn'),('Seedot','Hoenn'),('Seviper','Hoenn'),('Sharpedo','Hoenn'),('Shedinja','Hoenn'),('Shelgon','Hoenn'),('Shiftry','Hoenn'),('Shroomish','Hoenn'),('Shuppet','Hoenn'),('Silcoon','Hoenn'),('Skitty','Hoenn'),('Slaking','Hoenn'),('Slakoth','Hoenn'),('Snorunt','Hoenn'),('Solrock','Hoenn'),('Spheal','Hoenn'),('Spinda','Hoenn'),('Spoink','Hoenn'),('Surskit','Hoenn'),('Swablu','Hoenn'),('Swalot','Hoenn'),('Swampert','Hoenn'),('Swellow','Hoenn'),('Taillow','Hoenn'),('Torchic','Hoenn'),('Torkoal','Hoenn'),('Trapinch','Hoenn'),('Treecko','Hoenn'),('Tropius','Hoenn'),('Vibrava','Hoenn'),('Vigoroth','Hoenn'),('Volbeat','Hoenn'),('Wailmer','Hoenn'),('Wailord','Hoenn'),('Walrein','Hoenn'),('Whiscash','Hoenn'),('Whismur','Hoenn'),('Wingull','Hoenn'),('Wurmple','Hoenn'),('Wynaut','Hoenn'),('Zangoose','Hoenn'),('Zigzagoon','Hoenn'),('Aipom','Johto'),('Ampharos','Johto'),('Ariados','Johto'),('Azumarill','Johto'),('Bayleef','Johto'),('Bellossom','Johto'),('Blissey','Johto'),('Celebi','Johto'),('Chikorita','Johto'),('Chinchou','Johto'),('Cleffa','Johto'),('Corsola','Johto'),('Crobat','Johto'),('Croconaw','Johto'),('Cyndaquil','Johto'),('Delibird','Johto'),('Donphan','Johto'),('Dunsparce','Johto'),('Elekid','Johto'),('Entei','Johto'),('Espeon','Johto'),('Feraligatr','Johto'),('Flaaffy','Johto'),('Forretress','Johto'),('Furret','Johto'),('Girafarig','Johto'),('Gligar','Johto'),('Granbull','Johto'),('Heracross','Johto'),('Hitmontop','Johto'),('Ho-oh','Johto'),('Hoothoot','Johto'),('Hoppip','Johto'),('Houndoom','Johto'),('Houndour','Johto'),('Igglybuff','Johto'),('Jumpluff','Johto'),('Kingdra','Johto'),('Lanturn','Johto'),('Larvitar','Johto'),('Ledian','Johto'),('Ledyba','Johto'),('Lugia','Johto'),('Magby','Johto'),('Magcargo','Johto'),('Mantine','Johto'),('Mareep','Johto'),('Marill','Johto'),('Meganium','Johto'),('Miltank','Johto'),('Misdreavus','Johto'),('Murkrow','Johto'),('Natu','Johto'),('Noctowl','Johto'),('Octillery','Johto'),('Phanpy','Johto'),('Pichu','Johto'),('Piloswine','Johto'),('Pineco','Johto'),('Politoed','Johto'),('Porygon2','Johto'),('Pupitar','Johto'),('Quagsire','Johto'),('Quilava','Johto'),('Qwilfish','Johto'),('Raikou','Johto'),('Remoraid','Johto'),('Scizor','Johto'),('Sentret','Johto'),('Shuckle','Johto'),('Skarmory','Johto'),('Skiploom','Johto'),('Slowking','Johto'),('Slugma','Johto'),('Smeargle','Johto'),('Smoochum','Johto'),('Sneasel','Johto'),('Snubbull','Johto'),('Spinarak','Johto'),('Stantler','Johto'),('Steelix','Johto'),('Sudowoodo','Johto'),('Suicune','Johto'),('Sunflora','Johto'),('Sunkern','Johto'),('Swinub','Johto'),('Teddiursa','Johto'),('Togepi','Johto'),('Togetic','Johto'),('Totodile','Johto'),('Typhlosion','Johto'),('Tyranitar','Johto'),('Tyrogue','Johto'),('Umbreon','Johto'),('Unown','Johto'),('Ursaring','Johto'),('Wobbuffet','Johto'),('Wooper','Johto'),('Xatu','Johto'),('Yanma','Johto'),('Braixen','Kalos'),('Bunnelby','Kalos'),('Chesnaught','Kalos'),('Chespin','Kalos'),('Delphox','Kalos'),('Diggersby','Kalos'),('Fennekin','Kalos'),('Fletchinder','Kalos'),('Fletchling','Kalos'),('Froakie','Kalos'),('Frogadier','Kalos'),('Greninja','Kalos'),('Quilladin','Kalos'),('Scatterbug','Kalos'),('Talonflame','Kalos'),('Abra','Kanto'),('Aerodactyl','Kanto'),('Alakazam','Kanto'),('Arbok','Kanto'),('Arcanine','Kanto'),('Articuno','Kanto'),('Beedrill','Kanto'),('Bellsprout','Kanto'),('Blastoise','Kanto'),('Bulbasaur','Kanto'),('Butterfree','Kanto'),('Caterpie','Kanto'),('Chansey','Kanto'),('Charizard','Kanto'),('Charmander','Kanto'),('Charmeleon','Kanto'),('Clefable','Kanto'),('Clefairy','Kanto'),('Cloyster','Kanto'),('Cubone','Kanto'),('Dewgong','Kanto'),('Diglett','Kanto'),('Ditto','Kanto'),('Dodrio','Kanto'),('Doduo','Kanto'),('Dragonair','Kanto'),('Dragonite','Kanto'),('Dratini','Kanto'),('Drowzee','Kanto'),('Dugtrio','Kanto'),('Eevee','Kanto'),('Ekans','Kanto'),('Electabuzz','Kanto'),('Electrode','Kanto'),('Exeggcute','Kanto'),('Exeggutor','Kanto'),('Farfetch\'d','Kanto'),('Fearow','Kanto'),('Flareon','Kanto'),('Gastly','Kanto'),('Gengar','Kanto'),('Geodude','Kanto'),('Gloom','Kanto'),('Golbat','Kanto'),('Goldeen','Kanto'),('Golduck','Kanto'),('Golem','Kanto'),('Graveler','Kanto'),('Grimer','Kanto'),('Growlithe','Kanto'),('Gyarados','Kanto'),('Haunter','Kanto'),('Hitmonchan','Kanto'),('Hitmonlee','Kanto'),('Horsea','Kanto'),('Hypno','Kanto'),('Ivysaur','Kanto'),('Jigglypuff','Kanto'),('Jolteon','Kanto'),('Jynx','Kanto'),('Kabuto','Kanto'),('Kabutops','Kanto'),('Kadabra','Kanto'),('Kakuna','Kanto'),('Kangaskhan','Kanto'),('Kingler','Kanto'),('Koffing','Kanto'),('Krabby','Kanto'),('Lapras','Kanto'),('Lickitung','Kanto'),('Machamp','Kanto'),('Machoke','Kanto'),('Machop','Kanto'),('Magikarp','Kanto'),('Magmar','Kanto'),('Magnemite','Kanto'),('Magneton','Kanto'),('Mankey','Kanto'),('Marowak','Kanto'),('Meowth','Kanto'),('Metapod','Kanto'),('Mew','Kanto'),('Mewtwo','Kanto'),('Moltres','Kanto'),('Mr. Mime','Kanto'),('Muk','Kanto'),('Nidoking','Kanto'),('Nidoqueen','Kanto'),('Nidoran(F)','Kanto'),('Nidoran(M)','Kanto'),('Nidorina','Kanto'),('Nidorino','Kanto'),('Ninetales','Kanto'),('Oddish','Kanto'),('Omanyte','Kanto'),('Omastar','Kanto'),('Onix','Kanto'),('Paras','Kanto'),('Parasect','Kanto'),('Persian','Kanto'),('Pidgeot','Kanto'),('Pidgeotto','Kanto'),('Pidgey','Kanto'),('Pikachu','Kanto'),('Pinsir','Kanto'),('Poliwag','Kanto'),('Poliwhirl','Kanto'),('Poliwrath','Kanto'),('Ponyta','Kanto'),('Porygon','Kanto'),('Primeape','Kanto'),('Psyduck','Kanto'),('Raichu','Kanto'),('Rapidash','Kanto'),('Raticate','Kanto'),('Rattata','Kanto'),('Rhydon','Kanto'),('Rhyhorn','Kanto'),('Sandshrew','Kanto'),('Sandslash','Kanto'),('Scyther','Kanto'),('Seadra','Kanto'),('Seaking','Kanto'),('Seel','Kanto'),('Shellder','Kanto'),('Slowbro','Kanto'),('Slowpoke','Kanto'),('Snorlax','Kanto'),('Spearow','Kanto'),('Squirtle','Kanto'),('Starmie','Kanto'),('Staryu','Kanto'),('Tangela','Kanto'),('Tauros','Kanto'),('Tentacool','Kanto'),('Tentacruel','Kanto'),('Vaporeon','Kanto'),('Venomoth','Kanto'),('Venonat','Kanto'),('Venusaur','Kanto'),('Victreebel','Kanto'),('Vileplume','Kanto'),('Voltorb','Kanto'),('Vulpix','Kanto'),('Wartortle','Kanto'),('Weedle','Kanto'),('Weepinbell','Kanto'),('Weezing','Kanto'),('Wigglytuff','Kanto'),('Zapdos','Kanto'),('Zubat','Kanto'),('Abomasnow','Sinnoh'),('Ambipom','Sinnoh'),('Arceus','Sinnoh'),('Azelf','Sinnoh'),('Bastiodon','Sinnoh'),('Bibarel','Sinnoh'),('Bidoof','Sinnoh'),('Bonsly','Sinnoh'),('Bronzong','Sinnoh'),('Bronzor','Sinnoh'),('Budew','Sinnoh'),('Buizel','Sinnoh'),('Buneary','Sinnoh'),('Burmy','Sinnoh'),('Carnivine','Sinnoh'),('Chatot','Sinnoh'),('Cherrim','Sinnoh'),('Cherubi','Sinnoh'),('Chimchar','Sinnoh'),('Chingling','Sinnoh'),('Combee','Sinnoh'),('Cranidos','Sinnoh'),('Cresselia','Sinnoh'),('Croagunk','Sinnoh'),('Darkrai','Sinnoh'),('Dialga','Sinnoh'),('Drapion','Sinnoh'),('Drifblim','Sinnoh'),('Drifloon','Sinnoh'),('Dusknoir','Sinnoh'),('Electivire','Sinnoh'),('Empoleon','Sinnoh'),('Finneon','Sinnoh'),('Floatzel','Sinnoh'),('Froslass','Sinnoh'),('Gabite','Sinnoh'),('Gallade','Sinnoh'),('Garchomp','Sinnoh'),('Gastrodon','Sinnoh'),('Gible','Sinnoh'),('Giratina','Sinnoh'),('Giratina (O)','Sinnoh'),('Glaceon','Sinnoh'),('Glameow','Sinnoh'),('Gliscor','Sinnoh'),('Grotle','Sinnoh'),('Happiny','Sinnoh'),('Heatran','Sinnoh'),('Hippopotas','Sinnoh'),('Hippowdon','Sinnoh'),('Honchkrow','Sinnoh'),('Infernape','Sinnoh'),('Kricketot','Sinnoh'),('Kricketune','Sinnoh'),('Leafeon','Sinnoh'),('Lickilicky','Sinnoh'),('Lopunny','Sinnoh'),('Lucario','Sinnoh'),('Lumineon','Sinnoh'),('Luxio','Sinnoh'),('Luxray','Sinnoh'),('Magmortar','Sinnoh'),('Magnezone','Sinnoh'),('Mamoswine','Sinnoh'),('Manaphy','Sinnoh'),('Mantyke','Sinnoh'),('Mesprit','Sinnoh'),('Mime Jr.','Sinnoh'),('Mismagius','Sinnoh'),('Monferno','Sinnoh'),('Mothim','Sinnoh'),('Munchlax','Sinnoh'),('Pachirisu','Sinnoh'),('Palkia','Sinnoh'),('Phione','Sinnoh'),('Piplup','Sinnoh'),('Porygon-Z','Sinnoh'),('Prinplup','Sinnoh'),('Probopass','Sinnoh'),('Purugly','Sinnoh'),('Rampardos','Sinnoh'),('Regigigas','Sinnoh'),('Rhyperior','Sinnoh'),('Riolu','Sinnoh'),('Roserade','Sinnoh'),('Rotom','Sinnoh'),('Rotom (Cut)','Sinnoh'),('Rotom (Frost)','Sinnoh'),('Rotom (Heat)','Sinnoh'),('Rotom (Spin)','Sinnoh'),('Rotom (Wash)','Sinnoh'),('Shaymin','Sinnoh'),('Shaymin (S)','Sinnoh'),('Shellos','Sinnoh'),('Shieldon','Sinnoh'),('Shinx','Sinnoh'),('Skorupi','Sinnoh'),('Skuntank','Sinnoh'),('Snover','Sinnoh'),('Spiritomb','Sinnoh'),('Staraptor','Sinnoh'),('Staravia','Sinnoh'),('Starly','Sinnoh'),('Stunky','Sinnoh'),('Tangrowth','Sinnoh'),('Togekiss','Sinnoh'),('Torterra','Sinnoh'),('Toxicroak','Sinnoh'),('Turtwig','Sinnoh'),('Uxie','Sinnoh'),('Vespiquen','Sinnoh'),('Weavile','Sinnoh'),('Wormadam (P)','Sinnoh'),('Wormadam (S)','Sinnoh'),('Wormadam (T)','Sinnoh'),('Yanmega','Sinnoh'),('Accelgor','Unova'),('Alomomola','Unova'),('Amoonguss','Unova'),('Archen','Unova'),('Archeops','Unova'),('Audino','Unova'),('Axew','Unova'),('Basculin','Unova'),('Beartic','Unova'),('Beheeyem','Unova'),('Bisharp','Unova'),('Blitzle','Unova'),('Boldore','Unova'),('Bouffalant','Unova'),('Braviary','Unova'),('Carracosta','Unova'),('Chandelure','Unova'),('Cinccino','Unova'),('Cobalion','Unova'),('Cofagrigus','Unova'),('Conkeldurr','Unova'),('Cottonee','Unova'),('Crustle','Unova'),('Cryogonal','Unova'),('Cubchoo','Unova'),('Darmanitan','Unova'),('Darumaka','Unova'),('Deerling','Unova'),('Deino','Unova'),('Dewott','Unova'),('Drilbur','Unova'),('Druddigon','Unova'),('Ducklett','Unova'),('Duosion','Unova'),('Durant','Unova'),('Dwebble','Unova'),('Eelektrik','Unova'),('Eelektross','Unova'),('Elgyem','Unova'),('Emboar','Unova'),('Emolga','Unova'),('Escavalier','Unova'),('Excadrill','Unova'),('Ferroseed','Unova'),('Ferrothorn','Unova'),('Foongus','Unova'),('Fraxure','Unova'),('Frillish','Unova'),('Galvantula','Unova'),('Garbodor','Unova'),('Genesect','Unova'),('Gigalith','Unova'),('Golett','Unova'),('Golurk','Unova'),('Gothita','Unova'),('Gothitelle','Unova'),('Gothorita','Unova'),('Gurdurr','Unova'),('Haxorus','Unova'),('Heatmor','Unova'),('Herdier','Unova'),('Hydreigon','Unova'),('Jellicent','Unova'),('Joltik','Unova'),('Karrablast','Unova'),('Keldeo','Unova'),('Klang','Unova'),('Klink','Unova'),('Klinklang','Unova'),('Krokorok','Unova'),('Krookodile','Unova'),('Kyurem','Unova'),('Lampent','Unova'),('Landorus','Unova'),('Larvesta','Unova'),('Leavanny','Unova'),('Liepard','Unova'),('Lilligant','Unova'),('Lillipup','Unova'),('Litwick','Unova'),('Mandibuzz','Unova'),('Maractus','Unova'),('Meloetta (A)','Unova'),('Meloetta (P)','Unova'),('Mienfoo','Unova'),('Mienshao','Unova'),('Minccino','Unova'),('Munna','Unova'),('Musharna','Unova'),('Oshawott','Unova'),('Palpitoad','Unova'),('Panpour','Unova'),('Pansage','Unova'),('Pansear','Unova'),('Patrat','Unova'),('Pawniard','Unova'),('Petilil','Unova'),('Pidove','Unova'),('Pignite','Unova'),('Purrloin','Unova'),('Reshiram','Unova'),('Reuniclus','Unova'),('Roggenrola','Unova'),('Rufflet','Unova'),('Samurott','Unova'),('Sandile','Unova'),('Sawk','Unova'),('Sawsbuck','Unova'),('Scolipede','Unova'),('Scrafty','Unova'),('Scraggy','Unova'),('Seismitoad','Unova'),('Serperior','Unova'),('Servine','Unova'),('Sewaddle','Unova'),('Shelmet','Unova'),('Sigilyph','Unova'),('Simipour','Unova'),('Simisage','Unova'),('Simisear','Unova'),('Snivy','Unova'),('Solosis','Unova'),('Stoutland','Unova'),('Stunfisk','Unova'),('Swadloon','Unova'),('Swanna','Unova'),('Swoobat','Unova'),('Tepig','Unova'),('Terrakion','Unova'),('Throh','Unova'),('Thundurus','Unova'),('Timburr','Unova'),('Tirtouga','Unova'),('Tornadus','Unova'),('Tranquill','Unova'),('Trubbish','Unova'),('Tympole','Unova'),('Tynamo','Unova'),('Unfezant','Unova'),('Vanillish','Unova'),('Vanillite','Unova'),('Vanilluxe','Unova'),('Venipede','Unova'),('Victini','Unova'),('Virizion','Unova'),('Volcarona','Unova'),('Vullaby','Unova'),('Watchog','Unova'),('Whimsicott','Unova'),('Whirlipede','Unova'),('Woobat','Unova'),('Yamask','Unova'),('Zebstrika','Unova'),('Zekrom','Unova'),('Zoroark','Unova'),('Zorua','Unova'),('Zweilous','Unova');
/*!40000 ALTER TABLE `pokemonlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonmove`
--

DROP TABLE IF EXISTS `pokemonmove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokemonmove` (
  `move_id` int(11) NOT NULL,
  `power` int(11) DEFAULT NULL,
  `move_name` varchar(32) NOT NULL,
  `atk_type` enum('Physical','Special','Status') DEFAULT NULL,
  `move_pp` int(11) NOT NULL,
  `type_name` varchar(32) NOT NULL,
  `accuracy` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`move_id`),
  KEY `type_name` (`type_name`),
  CONSTRAINT `pokemonmove_ibfk_1` FOREIGN KEY (`type_name`) REFERENCES `pokemontype` (`type_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonmove`
--

LOCK TABLES `pokemonmove` WRITE;
/*!40000 ALTER TABLE `pokemonmove` DISABLE KEYS */;
INSERT INTO `pokemonmove` VALUES (1,40,'Pound','Physical',35,'Normal',1.00),(2,50,'Karate Chop','Physical',25,'Fighting',1.00),(3,15,'Double Slap','Physical',10,'Normal',0.85),(4,18,'Comet Punch','Physical',15,'Normal',0.85),(5,80,'Mega Punch','Physical',20,'Normal',0.85),(6,40,'Pay Day','Physical',20,'Normal',1.00),(7,75,'Fire Punch','Physical',15,'Fire',1.00),(8,75,'Ice Punch','Physical',15,'Ice',1.00),(9,75,'Thunder Punch','Physical',15,'Electric',1.00),(10,40,'Scratch','Physical',35,'Normal',1.00),(11,55,'Vice Grip','Physical',30,'Normal',1.00),(12,NULL,'Guillotine','Physical',5,'Normal',NULL),(13,80,'Razor Wind','Special',10,'Normal',1.00),(14,NULL,'Swords Dance','Status',20,'Normal',NULL),(15,50,'Cut','Physical',30,'Normal',0.95),(16,40,'Gust','Special',35,'Flying',1.00),(17,60,'Wing Attack','Physical',35,'Flying',1.00),(18,NULL,'Whirlwind','Status',20,'Normal',NULL),(19,90,'Fly','Physical',15,'Flying',0.95),(20,15,'Bind','Physical',20,'Normal',0.85),(21,80,'Slam','Physical',20,'Normal',0.75),(22,45,'Vine Whip','Physical',25,'Grass',1.00),(23,65,'Stomp','Physical',20,'Normal',1.00),(24,30,'Double Kick','Physical',30,'Fighting',1.00),(25,120,'Mega Kick','Physical',5,'Normal',0.75),(26,100,'Jump Kick','Physical',10,'Fighting',0.95),(27,60,'Rolling Kick','Physical',15,'Fighting',0.85),(28,NULL,'Sand Attack','Status',15,'Ground',1.00),(29,70,'Headbutt','Physical',15,'Normal',1.00),(30,65,'Horn Attack','Physical',25,'Normal',1.00),(31,15,'Fury Attack','Physical',20,'Normal',0.85),(32,NULL,'Horn Drill','Physical',5,'Normal',NULL),(33,50,'Tackle','Physical',35,'Normal',1.00),(34,85,'Body Slam','Physical',15,'Normal',1.00),(35,15,'Wrap','Physical',20,'Normal',0.90),(36,90,'Take Down','Physical',20,'Normal',0.85),(37,120,'Thrash','Physical',10,'Normal',1.00),(38,120,'Double-Edge','Physical',15,'Normal',1.00),(39,NULL,'Tail Whip','Status',30,'Normal',1.00),(40,15,'Poison Sting','Physical',35,'Poison',1.00),(41,25,'Twineedle','Physical',20,'Bug',1.00),(42,25,'Pin Missile','Physical',20,'Bug',0.95),(43,NULL,'Leer','Status',30,'Normal',1.00),(44,60,'Bite','Physical',25,'Dark',1.00),(45,NULL,'Growl','Status',40,'Normal',1.00),(46,NULL,'Roar','Status',20,'Normal',NULL),(47,NULL,'Sing','Status',15,'Normal',0.55),(48,NULL,'Supersonic','Status',20,'Normal',0.55),(49,NULL,'Sonic Boom','Special',20,'Normal',0.90),(50,NULL,'Disable','Status',20,'Normal',1.00),(51,40,'Acid','Special',30,'Poison',1.00),(52,40,'Ember','Special',25,'Fire',1.00),(53,90,'Flamethrower','Special',15,'Fire',1.00),(54,NULL,'Mist','Status',30,'Ice',NULL),(55,40,'Water Gun','Special',25,'Water',1.00),(56,110,'Hydro Pump','Special',5,'Water',0.80),(57,90,'Surf','Special',15,'Water',1.00),(58,90,'Ice Beam','Special',10,'Ice',1.00),(59,110,'Blizzard','Special',5,'Ice',0.70),(60,65,'Psybeam','Special',20,'Psychic',1.00),(61,65,'Bubble Beam','Special',20,'Water',1.00),(62,65,'Aurora Beam','Special',20,'Ice',1.00),(63,150,'Hyper Beam','Special',5,'Normal',0.90),(64,35,'Peck','Physical',35,'Flying',1.00),(65,80,'Drill Peck','Physical',20,'Flying',1.00),(66,80,'Submission','Physical',25,'Fighting',0.80),(67,NULL,'Low Kick','Physical',20,'Fighting',1.00),(68,NULL,'Counter','Physical',20,'Fighting',1.00),(69,NULL,'Seismic Toss','Physical',20,'Fighting',1.00),(70,80,'Strength','Physical',15,'Normal',1.00),(71,20,'Absorb','Special',25,'Grass',1.00),(72,40,'Mega Drain','Special',15,'Grass',1.00),(73,NULL,'Leech Seed','Status',10,'Grass',0.90),(74,NULL,'Growth','Status',20,'Normal',NULL),(75,55,'Razor Leaf','Physical',25,'Grass',0.95),(76,120,'Solar Beam','Special',10,'Grass',1.00),(77,NULL,'Poison Powder','Status',35,'Poison',0.75),(78,NULL,'Stun Spore','Status',30,'Grass',0.75),(79,NULL,'Sleep Powder','Status',15,'Grass',0.75),(80,120,'Petal Dance','Special',10,'Grass',1.00),(81,NULL,'String Shot','Status',40,'Bug',0.95),(82,NULL,'Dragon Rage','Special',10,'Dragon',1.00),(83,35,'Fire Spin','Special',15,'Fire',0.85),(84,40,'Thunder Shock','Special',30,'Electric',1.00),(85,90,'Thunderbolt','Special',15,'Electric',1.00),(86,NULL,'Thunder Wave','Status',20,'Electric',1.00),(87,110,'Thunder','Special',10,'Electric',0.70),(88,50,'Rock Throw','Physical',15,'Rock',0.90),(89,100,'Earthquake','Physical',10,'Ground',1.00),(90,NULL,'Fissure','Physical',5,'Ground',NULL),(91,80,'Dig','Physical',10,'Ground',1.00),(92,NULL,'Toxic','Status',10,'Poison',0.90),(93,50,'Confusion','Special',25,'Psychic',1.00),(94,90,'Psychic','Special',10,'Psychic',1.00),(95,NULL,'Hypnosis','Status',20,'Psychic',0.60),(96,NULL,'Meditate','Status',40,'Psychic',NULL),(97,NULL,'Agility','Status',30,'Psychic',NULL),(98,40,'Quick Attack','Physical',30,'Normal',1.00),(99,20,'Rage','Physical',20,'Normal',1.00),(100,NULL,'Teleport','Status',20,'Psychic',NULL),(101,NULL,'Night Shade','Special',15,'Ghost',1.00),(102,NULL,'Mimic','Status',10,'Normal',1.00),(103,NULL,'Screech','Status',40,'Normal',0.85),(104,NULL,'Double Team','Status',15,'Normal',NULL),(105,NULL,'Recover','Status',10,'Normal',NULL),(106,NULL,'Harden','Status',30,'Normal',NULL),(107,NULL,'Minimize','Status',10,'Normal',NULL),(108,NULL,'Smokescreen','Status',20,'Normal',1.00),(109,NULL,'Confuse Ray','Status',10,'Ghost',1.00),(110,NULL,'Withdraw','Status',40,'Water',NULL),(111,NULL,'Defense Curl','Status',40,'Normal',NULL),(112,NULL,'Barrier','Status',20,'Psychic',NULL),(113,NULL,'Light Screen','Status',30,'Psychic',NULL),(114,NULL,'Haze','Status',30,'Ice',NULL),(115,NULL,'Reflect','Status',20,'Psychic',NULL),(116,NULL,'Focus Energy','Status',30,'Normal',NULL),(117,NULL,'Bide','Physical',10,'Normal',1.00),(118,NULL,'Metronome','Status',10,'Normal',NULL),(119,NULL,'Mirror Move','Status',20,'Flying',NULL),(120,200,'Self-Destruct','Physical',5,'Normal',1.00),(121,100,'Egg Bomb','Physical',10,'Normal',0.75),(122,30,'Lick','Physical',30,'Ghost',1.00),(123,30,'Smog','Special',20,'Poison',0.70),(124,65,'Sludge','Special',20,'Poison',1.00),(125,65,'Bone Club','Physical',20,'Ground',0.85),(126,110,'Fire Blast','Special',5,'Fire',0.85),(127,80,'Waterfall','Physical',15,'Water',1.00),(128,35,'Clamp','Physical',10,'Water',0.85),(129,60,'Swift','Special',20,'Normal',NULL),(130,130,'Skull Bash','Physical',10,'Normal',1.00),(131,20,'Spike Cannon','Physical',15,'Normal',1.00),(132,10,'Constrict','Physical',35,'Normal',1.00),(133,NULL,'Amnesia','Status',20,'Psychic',NULL),(134,NULL,'Kinesis','Status',15,'Psychic',0.80),(135,NULL,'Soft-Boiled','Status',10,'Normal',NULL),(136,130,'High Jump Kick','Physical',10,'Fighting',0.90),(137,NULL,'Glare','Status',30,'Normal',1.00),(138,100,'Dream Eater','Special',15,'Psychic',1.00),(139,NULL,'Poison Gas','Status',40,'Poison',0.90),(140,15,'Barrage','Physical',20,'Normal',0.85),(141,20,'Leech Life','Physical',15,'Bug',1.00),(142,NULL,'Lovely Kiss','Status',10,'Normal',0.75),(143,140,'Sky Attack','Physical',5,'Flying',0.90),(144,NULL,'Transform','Status',10,'Normal',NULL),(145,40,'Bubble','Special',30,'Water',1.00),(146,70,'Dizzy Punch','Physical',10,'Normal',1.00),(147,NULL,'Spore','Status',15,'Grass',1.00),(148,NULL,'Flash','Status',20,'Normal',1.00),(149,NULL,'Psywave','Special',15,'Psychic',1.00),(150,NULL,'Splash','Status',40,'Normal',NULL),(151,NULL,'Acid Armor','Status',20,'Poison',NULL),(152,100,'Crabhammer','Physical',10,'Water',0.90),(153,250,'Explosion','Physical',5,'Normal',1.00),(154,18,'Fury Swipes','Physical',15,'Normal',0.80),(155,50,'Bonemerang','Physical',10,'Ground',0.90),(156,NULL,'Rest','Status',10,'Psychic',NULL),(157,75,'Rock Slide','Physical',10,'Rock',0.90),(158,80,'Hyper Fang','Physical',15,'Normal',0.90),(159,NULL,'Sharpen','Status',30,'Normal',NULL),(160,NULL,'Conversion','Status',30,'Normal',NULL),(161,80,'Tri Attack','Special',10,'Normal',1.00),(162,NULL,'Super Fang','Physical',10,'Normal',0.90),(163,70,'Slash','Physical',20,'Normal',1.00),(164,NULL,'Substitute','Status',10,'Normal',NULL),(165,50,'Struggle','Physical',1,'Normal',1.00),(166,NULL,'Sketch','Status',1,'Normal',NULL),(167,10,'Triple Kick','Physical',10,'Fighting',0.90),(168,60,'Thief','Physical',25,'Dark',1.00),(169,NULL,'Spider Web','Status',10,'Bug',1.00),(170,NULL,'Mind Reader','Status',5,'Normal',1.00),(171,NULL,'Nightmare','Status',15,'Ghost',1.00),(172,60,'Flame Wheel','Physical',25,'Fire',1.00),(173,50,'Snore','Special',15,'Normal',1.00),(174,NULL,'Curse','Status',10,'Ghost',NULL),(175,NULL,'Flail','Physical',15,'Normal',1.00),(176,NULL,'Conversion 2','Status',30,'Normal',1.00),(177,100,'Aeroblast','Special',5,'Flying',0.95),(178,NULL,'Cotton Spore','Status',40,'Grass',1.00),(179,NULL,'Reversal','Physical',15,'Fighting',1.00),(180,NULL,'Spite','Status',10,'Ghost',1.00),(181,40,'Powder Snow','Special',25,'Ice',1.00),(182,NULL,'Protect','Status',10,'Normal',NULL),(183,40,'Mach Punch','Physical',30,'Fighting',1.00),(184,NULL,'Scary Face','Status',10,'Normal',1.00),(185,60,'Feint Attack','Physical',20,'Dark',NULL),(186,NULL,'Sweet Kiss','Status',10,'Fairy',0.75),(187,NULL,'Belly Drum','Status',10,'Normal',NULL),(188,90,'Sludge Bomb','Special',10,'Poison',1.00),(189,20,'Mud-Slap','Special',10,'Ground',1.00),(190,65,'Octazooka','Special',10,'Water',0.85),(191,NULL,'Spikes','Status',20,'Ground',NULL),(192,120,'Zap Cannon','Special',5,'Electric',0.50),(193,NULL,'Foresight','Status',40,'Normal',1.00),(194,NULL,'Destiny Bond','Status',5,'Ghost',NULL),(195,NULL,'Perish Song','Status',5,'Normal',NULL),(196,55,'Icy Wind','Special',15,'Ice',0.95),(197,NULL,'Detect','Status',5,'Fighting',NULL),(198,25,'Bone Rush','Physical',10,'Ground',0.90),(199,NULL,'Lock-On','Status',5,'Normal',1.00),(200,120,'Outrage','Physical',15,'Dragon',1.00),(201,NULL,'Sandstorm','Status',10,'Rock',NULL),(202,75,'Giga Drain','Special',10,'Grass',1.00),(203,NULL,'Endure','Status',10,'Normal',NULL),(204,NULL,'Charm','Status',20,'Fairy',1.00),(205,30,'Rollout','Physical',20,'Rock',0.90),(206,40,'False Swipe','Physical',40,'Normal',1.00),(207,NULL,'Swagger','Status',15,'Normal',0.90),(208,NULL,'Milk Drink','Status',10,'Normal',NULL),(209,65,'Spark','Physical',20,'Electric',1.00),(210,40,'Fury Cutter','Physical',20,'Bug',0.95),(211,70,'Steel Wing','Physical',25,'Steel',0.90),(212,NULL,'Mean Look','Status',5,'Normal',1.00),(213,NULL,'Attract','Status',15,'Normal',1.00),(214,NULL,'Sleep Talk','Status',10,'Normal',NULL),(215,NULL,'Heal Bell','Status',5,'Normal',NULL),(216,NULL,'Return','Physical',20,'Normal',1.00),(217,NULL,'Present','Physical',15,'Normal',0.90),(218,NULL,'Frustration','Physical',20,'Normal',1.00),(219,NULL,'Safeguard','Status',25,'Normal',NULL),(220,NULL,'Pain Split','Status',20,'Normal',1.00),(221,100,'Sacred Fire','Physical',5,'Fire',0.95),(222,NULL,'Magnitude','Physical',30,'Ground',1.00),(223,100,'Dynamic Punch','Physical',5,'Fighting',0.50),(224,120,'Megahorn','Physical',10,'Bug',0.85),(225,60,'Dragon Breath','Special',20,'Dragon',1.00),(226,NULL,'Baton Pass','Status',40,'Normal',NULL),(227,NULL,'Encore','Status',5,'Normal',1.00),(228,40,'Pursuit','Physical',20,'Dark',1.00),(229,20,'Rapid Spin','Physical',40,'Normal',1.00),(230,NULL,'Sweet Scent','Status',20,'Normal',1.00),(231,100,'Iron Tail','Physical',15,'Steel',0.75),(232,50,'Metal Claw','Physical',35,'Steel',0.95),(233,70,'Vital Throw','Physical',10,'Fighting',1.00),(234,NULL,'Morning Sun','Status',5,'Normal',NULL),(235,NULL,'Synthesis','Status',5,'Grass',NULL),(236,NULL,'Moonlight','Status',5,'Fairy',NULL),(237,60,'Hidden Power','Special',15,'Normal',1.00),(238,100,'Cross Chop','Physical',5,'Fighting',0.80),(239,40,'Twister','Special',20,'Dragon',1.00),(240,NULL,'Rain Dance','Status',5,'Water',NULL),(241,NULL,'Sunny Day','Status',5,'Fire',NULL),(242,80,'Crunch','Physical',15,'Dark',1.00),(243,NULL,'Mirror Coat','Special',20,'Psychic',1.00),(244,NULL,'Psych Up','Status',10,'Normal',NULL),(245,80,'Extreme Speed','Physical',5,'Normal',1.00),(246,60,'Ancient Power','Special',5,'Rock',1.00),(247,80,'Shadow','Special',15,'Ghost',1.00),(248,120,'Future Sight','Special',10,'Psychic',1.00),(249,40,'Rock Smash','Physical',15,'Fighting',1.00),(250,35,'Whirlpool','Special',15,'Water',0.85),(251,NULL,'Beat Up','Physical',10,'Dark',1.00),(252,40,'Fake Out','Physical',10,'Normal',1.00),(253,90,'Uproar','Special',10,'Normal',1.00),(254,NULL,'Stockpile','Status',20,'Normal',NULL),(255,NULL,'Spit Up','Special',10,'Normal',1.00),(256,NULL,'Swallow','Status',10,'Normal',NULL),(257,95,'Heat Wave','Special',10,'Fire',0.90),(258,NULL,'Hail','Status',10,'Ice',NULL),(259,NULL,'Torment','Status',15,'Dark',1.00),(260,NULL,'Flatter','Status',15,'Dark',1.00),(261,NULL,'Will-O-Wisp','Status',15,'Fire',0.85),(262,NULL,'Memento','Status',10,'Dark',1.00),(263,70,'Facade','Physical',20,'Normal',1.00),(264,150,'Focus Punch','Physical',20,'Fighting',1.00),(265,70,'Smelling Salts','Physical',10,'Normal',1.00),(266,NULL,'Follow Me','Status',20,'Normal',1.00),(267,NULL,'Nature Power','Status',20,'Normal',NULL),(268,NULL,'Charge','Status',20,'Electric',NULL),(269,NULL,'Taunt','Status',20,'Dark',1.00),(270,NULL,'Helping Hand','Status',20,'Normal',NULL),(271,NULL,'Trick','Status',10,'Psychic',1.00),(272,NULL,'Role Play','Status',10,'Psychic',NULL),(273,NULL,'Wish','Status',10,'Normal',NULL),(274,NULL,'Assist','Status',20,'Normal',NULL),(275,NULL,'Ingrain','Status',20,'Grass',NULL),(276,120,'Superpower','Physical',5,'Fighting',1.00),(277,NULL,'Magic Coat','Status',15,'Psychic',NULL),(278,NULL,'Recycle','Status',10,'Normal',1.00),(279,60,'Revenge','Physical',10,'Fighting',1.00),(280,75,'Brick Break','Physical',15,'Fighting',1.00),(281,NULL,'Yawn','Status',10,'Normal',1.00),(282,65,'Knock Off','Physical',20,'Dark',1.00),(283,NULL,'Endeavor','Physical',5,'Normal',1.00),(284,NULL,'Eruption','Special',5,'Fire',1.00),(285,NULL,'Skill Swap','Status',10,'Psychic',1.00),(286,NULL,'Imprison','Status',10,'Psychic',1.00),(287,NULL,'Refresh','Status',20,'Normal',1.00),(288,NULL,'Grudge','Status',5,'Ghost',1.00),(289,NULL,'Snatch','Status',10,'Dark',1.00),(290,70,'Secret Power','Physical',20,'Normal',1.00),(291,80,'Dive','Physical',10,'Water',1.00),(292,15,'Arm Thrust','Physical',20,'Fighting',1.00),(293,NULL,'Camouflage','Status',20,'Normal',1.00),(294,NULL,'Tail Glow','Status',20,'Bug',1.00),(295,70,'Luster Purge','Special',5,'Psychic',1.00),(296,70,'Mist','Special',5,'Psychic',1.00),(297,NULL,'Feather Dance','Status',15,'Flying',1.00),(298,NULL,'Teeter Dance','Status',20,'Normal',1.00),(299,85,'Blaze Kick','Physical',10,'Fire',0.90),(300,NULL,'Mud Sport','Status',15,'Ground',1.00),(301,30,'Ice','Physical',20,'Ice',0.90),(302,60,'Needle Arm','Physical',15,'Grass',1.00),(303,NULL,'Slack Off','Status',10,'Normal',1.00),(304,90,'Hyper Voice','Special',10,'Normal',1.00),(305,50,'Poison Fang','Physical',15,'Poison',1.00),(306,75,'Crush Claw','Physical',10,'Normal',0.95),(307,150,'Blast Burn','Special',5,'Fire',0.90),(308,150,'Hydro Cannon','Special',5,'Water',0.90),(309,90,'Meteor Mash','Physical',10,'Steel',0.90),(310,30,'Astonish','Physical',15,'Ghost',1.00),(311,50,'Weather','Special',10,'Normal',1.00),(312,NULL,'Aromatherapy','Status',5,'Grass',NULL),(313,NULL,'Fake Tears','Status',20,'Dark',1.00),(314,60,'Air Cutter','Special',25,'Flying',0.95),(315,130,'Overheat','Special',5,'Fire',0.90),(316,NULL,'Odor Sleuth','Status',40,'Normal',1.00),(317,60,'Rock Tomb','Physical',15,'Rock',0.95),(318,60,'Silver Wind','Special',5,'Bug',1.00),(319,NULL,'Metal Sound','Status',40,'Steel',0.85),(320,NULL,'Grass Whistle','Status',15,'Grass',0.55),(321,NULL,'Tickle','Status',20,'Normal',1.00),(322,NULL,'Cosmic Power','Status',20,'Psychic',NULL),(323,NULL,'Water Spout','Special',5,'Water',1.00),(324,75,'Signal Beam','Special',15,'Bug',1.00),(325,60,'Shadow Punch','Physical',20,'Ghost',NULL),(326,80,'Extrasensory','Special',20,'Psychic',1.00),(327,85,'Sky Uppercut','Physical',15,'Fighting',0.90),(328,35,'Sand Tomb','Physical',15,'Ground',0.85),(329,NULL,'Sheer Cold','Special',5,'Ice',NULL),(330,90,'Muddy Water','Special',10,'Water',0.85),(331,25,'Bullet Seed','Physical',30,'Grass',1.00),(332,60,'Aerial Ace','Physical',20,'Flying',NULL),(333,25,'Icicle Spear','Physical',30,'Ice',1.00),(334,NULL,'Iron Defense','Status',15,'Steel',NULL),(335,NULL,'Block','Status',5,'Normal',1.00),(336,NULL,'Howl','Status',40,'Normal',NULL),(337,80,'Dragon Claw','Physical',15,'Dragon',1.00),(338,150,'Frenzy Plant','Special',5,'Grass',0.90),(339,NULL,'Bulk Up','Status',20,'Fighting',NULL),(340,85,'Bounce','Physical',5,'Flying',0.85),(341,55,'Mud Shot','Special',15,'Ground',0.95),(342,50,'Poison Tail','Physical',25,'Poison',1.00),(343,60,'Covet','Physical',25,'Normal',1.00),(344,120,'Volt Tackle','Physical',15,'Electric',1.00),(345,60,'Magical Leaf','Special',20,'Grass',NULL),(346,NULL,'Water Sport','Status',15,'Water',1.00),(347,NULL,'Calm Mind','Status',20,'Psychic',NULL),(348,90,'Leaf Blade','Physical',15,'Grass',1.00),(349,NULL,'Dragon Dance','Status',20,'Dragon',NULL),(350,25,'Rock Blast','Physical',10,'Rock',0.90),(351,60,'Shock Wave','Special',20,'Electric',NULL),(352,60,'Water Pulse','Special',20,'Water',1.00),(353,140,'Doom Desire','Special',5,'Steel',1.00),(354,140,'Psycho Boost','Special',5,'Psychic',0.90),(355,NULL,'Roost','Status',10,'Flying',NULL),(356,NULL,'Gravity','Status',5,'Psychic',NULL),(357,NULL,'Miracle Eye','Status',40,'Psychic',NULL),(358,70,'Wake-Up Slap','Physical',10,'Fighting',1.00),(359,100,'Hammer Arm','Physical',10,'Fighting',0.90),(360,NULL,'Gyro','Physical',5,'Steel',1.00),(361,NULL,'Healing Wish','Status',10,'Psychic',NULL),(362,65,'Brine','Special',10,'Water',1.00),(363,NULL,'Natural Gift','Physical',15,'Normal',1.00),(364,30,'Feint','Physical',10,'Normal',1.00),(365,60,'Pluck','Physical',20,'Flying',1.00),(366,NULL,'Tailwind','Status',15,'Flying',NULL),(367,NULL,'Acupressure','Status',30,'Normal',NULL),(368,NULL,'Metal Burst','Physical',10,'Steel',1.00),(369,70,'U-turn','Physical',20,'Bug',1.00),(370,120,'Close Combat','Physical',5,'Fighting',1.00),(371,50,'Payback','Physical',10,'Dark',1.00),(372,60,'Assurance','Physical',10,'Dark',1.00),(373,NULL,'Embargo','Status',15,'Dark',1.00),(374,NULL,'Fling','Physical',10,'Dark',1.00),(375,NULL,'Psycho Shift','Status',10,'Psychic',1.00),(376,NULL,'Trump Card','Special',5,'Normal',NULL),(377,NULL,'Heal Block','Status',15,'Psychic',1.00),(378,NULL,'Wring Out','Special',5,'Normal',1.00),(379,NULL,'Power Trick','Status',10,'Psychic',NULL),(380,NULL,'Gastro Acid','Status',10,'Poison',1.00),(381,NULL,'Lucky Chant','Status',30,'Normal',NULL),(382,NULL,'Me First','Status',20,'Normal',NULL),(383,NULL,'Copycat','Status',20,'Normal',NULL),(384,NULL,'Power Swap','Status',10,'Psychic',NULL),(385,NULL,'Guard Swap','Status',10,'Psychic',NULL),(386,NULL,'Punishment','Physical',5,'Dark',1.00),(387,140,'Last Resort','Physical',5,'Normal',1.00),(388,NULL,'Worry Seed','Status',10,'Grass',1.00),(389,80,'Sucker Punch','Physical',5,'Dark',1.00),(390,NULL,'Toxic Spikes','Status',20,'Poison',NULL),(391,NULL,'Heart Swap','Status',10,'Psychic',NULL),(392,NULL,'Aqua Ring','Status',20,'Water',NULL),(393,NULL,'Magnet Rise','Status',10,'Electric',NULL),(394,120,'Flare Blitz','Physical',15,'Fire',1.00),(395,60,'Force Palm','Physical',10,'Fighting',1.00),(396,80,'Aura Sphere','Special',20,'Fighting',NULL),(397,NULL,'Rock Polish','Status',20,'Rock',NULL),(398,80,'Poison Jab','Physical',20,'Poison',1.00),(399,80,'Dark Pulse','Special',15,'Dark',1.00),(400,70,'Night Slash','Physical',15,'Dark',1.00),(401,90,'Aqua Tail','Physical',10,'Water',0.90),(402,80,'Seed Bomb','Physical',15,'Grass',1.00),(403,75,'Air Slash','Special',15,'Flying',0.95),(404,80,'X-Scissor','Physical',15,'Bug',1.00),(405,90,'Bug Buzz','Special',10,'Bug',1.00),(406,85,'Dragon Pulse','Special',10,'Dragon',1.00),(407,100,'Dragon Rush','Physical',10,'Dragon',0.75),(408,80,'Power Gem','Special',20,'Rock',1.00),(409,75,'Drain Punch','Physical',10,'Fighting',1.00),(410,40,'Vacuum Wave','Special',30,'Fighting',1.00),(411,120,'Focus Blast','Special',5,'Fighting',0.70),(412,90,'Energy','Special',10,'Grass',1.00),(413,120,'Brave Bird','Physical',15,'Flying',1.00),(414,90,'Earth Power','Special',10,'Ground',1.00),(415,NULL,'Switcheroo','Status',10,'Dark',1.00),(416,150,'Giga Impact','Physical',5,'Normal',0.90),(417,NULL,'Nasty Plot','Status',20,'Dark',NULL),(418,40,'Bullet Punch','Physical',30,'Steel',1.00),(419,60,'Avalanche','Physical',10,'Ice',1.00),(420,40,'Ice Shard','Physical',30,'Ice',1.00),(421,70,'Shadow Claw','Physical',15,'Ghost',1.00),(422,65,'Thunder Fang','Physical',15,'Electric',0.95),(423,65,'Ice Fang','Physical',15,'Ice',0.95),(424,65,'Fire Fang','Physical',15,'Fire',0.95),(425,40,'Shadow Sneak','Physical',30,'Ghost',1.00),(426,65,'Mud Bomb','Special',10,'Ground',0.85),(427,70,'Psycho Cut','Physical',20,'Psychic',1.00),(428,80,'Zen Headbutt','Physical',15,'Psychic',0.90),(429,65,'Mirror Shot','Special',10,'Steel',0.85),(430,80,'Flash Cannon','Special',10,'Steel',1.00),(431,90,'Rock Climb','Physical',20,'Normal',0.85),(432,NULL,'Defog','Status',15,'Flying',NULL),(433,NULL,'Trick Room','Status',5,'Psychic',NULL),(434,130,'Draco Meteor','Special',5,'Dragon',0.90),(435,80,'Discharge','Special',15,'Electric',1.00),(436,80,'Lava Plume','Special',15,'Fire',1.00),(437,130,'Leaf Storm','Special',5,'Grass',0.90),(438,120,'Power Whip','Physical',10,'Grass',0.85),(439,150,'Rock Wrecker','Physical',5,'Rock',0.90),(440,70,'Cross Poison','Physical',20,'Poison',1.00),(441,120,'Gunk Shot','Physical',5,'Poison',0.80),(442,80,'Iron Head','Physical',15,'Steel',1.00),(443,60,'Magnet Bomb','Physical',20,'Steel',NULL),(444,100,'Stone Edge','Physical',5,'Rock',0.80),(445,NULL,'Captivate','Status',20,'Normal',1.00),(446,NULL,'Stealth Rock','Status',20,'Rock',NULL),(447,NULL,'Grass Knot','Special',20,'Grass',1.00),(448,65,'Chatter','Special',20,'Flying',1.00),(449,100,'Judgment','Special',10,'Normal',1.00),(450,60,'Bug Bite','Physical',20,'Bug',1.00),(451,50,'Charge Beam','Special',10,'Electric',0.90),(452,120,'Wood Hammer','Physical',15,'Grass',1.00),(453,40,'Aqua Jet','Physical',20,'Water',1.00),(454,90,'Attack Order','Physical',15,'Bug',1.00),(455,NULL,'Defend Order','Status',10,'Bug',NULL),(456,NULL,'Heal Order','Status',10,'Bug',NULL),(457,150,'Head Smash','Physical',5,'Rock',0.80),(458,35,'Double Hit','Physical',10,'Normal',0.90),(459,150,'Roar of Time','Special',5,'Dragon',0.90),(460,100,'Spacial Rend','Special',5,'Dragon',0.95),(461,NULL,'Lunar Dance','Status',10,'Psychic',NULL),(462,NULL,'Crush Grip','Physical',5,'Normal',1.00),(463,120,'Magma Storm','Special',5,'Fire',0.75),(464,NULL,'Dark Void','Status',10,'Dark',0.80),(465,120,'Seed Flare','Special',5,'Grass',0.85),(466,60,'Ominous Wind','Special',5,'Ghost',1.00),(467,120,'Shadow Force','Physical',5,'Ghost',1.00);
/*!40000 ALTER TABLE `pokemonmove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonteam`
--

DROP TABLE IF EXISTS `pokemonteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokemonteam` (
  `team_trainer` varchar(64) NOT NULL,
  `team_name` varchar(64) NOT NULL,
  `pokemon1` varchar(64) DEFAULT NULL,
  `pokemon2` varchar(64) DEFAULT NULL,
  `pokemon3` varchar(64) DEFAULT NULL,
  `pokemon4` varchar(64) DEFAULT NULL,
  `pokemon5` varchar(64) DEFAULT NULL,
  `pokemon6` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`team_trainer`,`team_name`),
  KEY `pokemon1` (`pokemon1`,`team_trainer`),
  KEY `pokemon2` (`pokemon2`,`team_trainer`),
  KEY `pokemon3` (`pokemon3`,`team_trainer`),
  KEY `pokemon4` (`pokemon4`,`team_trainer`),
  KEY `pokemon5` (`pokemon5`,`team_trainer`),
  KEY `pokemon6` (`pokemon6`,`team_trainer`),
  CONSTRAINT `pokemonteam_ibfk_1` FOREIGN KEY (`team_trainer`) REFERENCES `trainer` (`trainer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemonteam_ibfk_2` FOREIGN KEY (`pokemon1`, `team_trainer`) REFERENCES `pokestat` (`nick_name`, `trainer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemonteam_ibfk_3` FOREIGN KEY (`pokemon2`, `team_trainer`) REFERENCES `pokestat` (`nick_name`, `trainer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemonteam_ibfk_4` FOREIGN KEY (`pokemon3`, `team_trainer`) REFERENCES `pokestat` (`nick_name`, `trainer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemonteam_ibfk_5` FOREIGN KEY (`pokemon4`, `team_trainer`) REFERENCES `pokestat` (`nick_name`, `trainer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemonteam_ibfk_6` FOREIGN KEY (`pokemon5`, `team_trainer`) REFERENCES `pokestat` (`nick_name`, `trainer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemonteam_ibfk_7` FOREIGN KEY (`pokemon6`, `team_trainer`) REFERENCES `pokestat` (`nick_name`, `trainer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonteam`
--

LOCK TABLES `pokemonteam` WRITE;
/*!40000 ALTER TABLE `pokemonteam` DISABLE KEYS */;
INSERT INTO `pokemonteam` VALUES ('179370789169004546','blazes','blaze1','blaze2','test','blaze',NULL,NULL);
/*!40000 ALTER TABLE `pokemonteam` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `removeStat` AFTER UPDATE ON `pokemonteam` FOR EACH ROW begin
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
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `removeStatRow` AFTER DELETE ON `pokemonteam` FOR EACH ROW begin
	delete from pokestat where old.team_trainer = pokestat.trainer_id and
		(pokestat.nick_name = old.pokemon1 or 
        pokestat.nick_name = old.pokemon2 or 
        pokestat.nick_name = old.pokemon3 or 
        pokestat.nick_name = old.pokemon4 or 
        pokestat.nick_name = old.pokemon5 or 
        pokestat.nick_name = old.pokemon6);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pokemontype`
--

DROP TABLE IF EXISTS `pokemontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokemontype` (
  `type_name` varchar(32) NOT NULL,
  PRIMARY KEY (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemontype`
--

LOCK TABLES `pokemontype` WRITE;
/*!40000 ALTER TABLE `pokemontype` DISABLE KEYS */;
INSERT INTO `pokemontype` VALUES ('bug'),('dark'),('dragon'),('electric'),('fairy'),('fighting'),('fire'),('flying'),('ghost'),('grass'),('ground'),('ice'),('normal'),('poison'),('psychic'),('rock'),('steel'),('water');
/*!40000 ALTER TABLE `pokemontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokestat`
--

DROP TABLE IF EXISTS `pokestat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokestat` (
  `nick_name` varchar(64) NOT NULL,
  `poke_name` varchar(64) NOT NULL,
  `trainer_id` varchar(64) NOT NULL,
  `move1` int(11) DEFAULT NULL,
  `move2` int(11) DEFAULT NULL,
  `move3` int(11) DEFAULT NULL,
  `move4` int(11) DEFAULT NULL,
  `health` int(11) NOT NULL,
  `spdef` int(11) NOT NULL,
  `def` int(11) NOT NULL,
  `atk` int(11) NOT NULL,
  `spd` int(11) NOT NULL,
  `spatk` int(11) NOT NULL,
  `iv_health` tinyint(4) NOT NULL,
  `iv_spdef` tinyint(4) NOT NULL,
  `iv_def` tinyint(4) NOT NULL,
  `iv_atk` tinyint(4) NOT NULL,
  `iv_spd` tinyint(4) NOT NULL,
  `iv_spatk` tinyint(4) NOT NULL,
  `gender` enum('F','M','Genderless') NOT NULL,
  `pokemon_level` int(11) NOT NULL,
  PRIMARY KEY (`nick_name`,`trainer_id`),
  KEY `poke_name` (`poke_name`),
  KEY `trainer_id` (`trainer_id`),
  KEY `move1` (`move1`),
  KEY `move2` (`move2`),
  KEY `move3` (`move3`),
  KEY `move4` (`move4`),
  CONSTRAINT `pokestat_ibfk_1` FOREIGN KEY (`poke_name`) REFERENCES `pokemon` (`p_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokestat_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokestat_ibfk_3` FOREIGN KEY (`move1`) REFERENCES `pokemonmove` (`move_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokestat_ibfk_4` FOREIGN KEY (`move2`) REFERENCES `pokemonmove` (`move_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokestat_ibfk_5` FOREIGN KEY (`move3`) REFERENCES `pokemonmove` (`move_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokestat_ibfk_6` FOREIGN KEY (`move4`) REFERENCES `pokemonmove` (`move_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokestat`
--

LOCK TABLES `pokestat` WRITE;
/*!40000 ALTER TABLE `pokestat` DISABLE KEYS */;
INSERT INTO `pokestat` VALUES ('blaze','skarmory','179370789169004546',NULL,NULL,NULL,NULL,268,109,79,75,88,118,21,8,7,11,7,13,'M',78),('blaze1','blaziken','179370789169004546',NULL,NULL,NULL,NULL,272,158,166,172,99,114,13,25,30,14,16,26,'Genderless',88),('blaze2','blaziken','179370789169004546',NULL,NULL,NULL,NULL,153,85,168,157,162,125,14,19,30,17,7,30,'Genderless',77),('test','blaziken','179370789169004546',NULL,NULL,NULL,NULL,12,6,7,6,7,6,21,29,29,13,6,24,'F',1);
/*!40000 ALTER TABLE `pokestat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `professor` (
  `professor_id` varchar(64) NOT NULL,
  `professor_name` varchar(128) NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `homeregion` varchar(64) NOT NULL,
  `hometown` varchar(64) NOT NULL,
  PRIMARY KEY (`professor_id`),
  KEY `homeregion` (`homeregion`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`homeregion`) REFERENCES `region` (`region_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('1','Professor Oak','Male','Kanto','Pallet Town'),('179370789169004546','ryan','Male','Unova','Pallet'),('2','Professor Elm','Male','Johto','New Bark Town'),('3','Professor Birch','Male','Hoenn','Littleroot Town'),('4','Professor Rowan','Male','Sinnoh','Sandgem Town'),('5','Professor Aurea Juniper','Female','Unova','Nuvema Town'),('6','Professor Augustine Sycamore','Male','Kalos','Lumiose City'),('7','Professor Kukui','Male','Alola','Hau\'oli Outskirts');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `region` (
  `region_name` varchar(64) NOT NULL,
  `region_description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Alola','Alola is a region of the Pokemon world. It is the setting of Pokemon Sun, Moon, Ultra Sun, and Ultra Moon. It was the seventh main series region to be introduced. The Alola region is made up of four natural islands and one artificial island: Melemele Island, Akala Island, Ula\'ula Island, Poni Island, and Aether Paradise. It is a popular resort destination and attracts a lot of tourists from other regions. In Alola, humans and Pokemon coexist in a very close relationship, and a culture has developed that is different from other regions.'),('Hoenn','The Hoenn region is a region of the Pokemon world. It is located south of Sinnoh. It is the setting of Pokemon Ruby, Sapphire, Emerald, Omega Ruby, and Alpha Sapphire. It was the third main series region to be introduced.'),('Johto','The Johto region is a region of the Pokemon world. It is located west of Kanto, and as revealed by the radio show Sinnoh Sound, is located south of Sinnoh. It is the setting of Pokemon Gold, Silver, Crystal, HeartGold, and SoulSilver. Johto and Kanto are part of a large landmass, with everything west of Indigo Plateau falling in the Johto region. It was the second main series region to be introduced.'),('Kalos','Kalos is a region of the Pokemon world. It is the setting of Pokemon X and Y. It was the sixth main series region to be introduced. The Kalos region is shaped like a five-pointed star, with one of its biggest cities being Lumiose City in the north-central part of the region. It features a vast network of rivers and waterways snaking through much of its landscape, cities and towns. North-east of Lumiose City lies a mountain range where more frigid temperatures exist, extending down into the plains below. Western Kalos features a vast ocean, where the shoreside city of Shalour City lies in the middle of a cove.'),('Kanto','The Kanto region is a region of the Pokemon world. It is located east of Johto, and as revealed by the radio show Sinnoh Sound, is located south of Sinnoh. It was the first region to be introduced. It is the setting of the Generation I games, FireRed and LeafGreen, and Let\'s Go, Pikachu! and Let\'s Go, Eevee!; it is also accessible in Pokemon Gold, Silver, Crystal, HeartGold, and SoulSilver after the quest in Johto is completed.'),('Sinnoh','The Sinnoh region is a region of the Pokemon world. It is located north of Kanto, Johto, and Hoenn. It is the setting of Pokemon Diamond, Pearl, and Platinum. It was the fourth main series region to be introduced. Sinnoh is composed of the large mainland, the north-eastern island of the Battle Zone, and several smaller islands on both sides of the region. Most of Sinnoh\'s routes are on land, having very few water routes, in vast contrast to Hoenn. The region is divided by Mt. Coronet, roughly comparable to how the continent that Kanto and Johto make up is essentially a contiguous region.'),('Unova','The Unova region is a region of the Pokemon world. It is the setting of Pokemon Black and White and Pokemon Black 2 and White 2. It was the fifth main series region to be introduced. It is far away from the four other large regions, and the Pokemon which inhabit Unova are diverse and different from those of Kanto, Johto, Hoenn, and Sinnoh. In his director\'s column, Junichi Masuda suggested that the geographical and social background for Unova draws inspiration from the New York City metropolitan area. Although it is geographically based on New York City, it draws inspiration for its landmarks from the entire state of New York, which features a mixture of rural locations and urban areas as well as factory towns and industrial complexes.');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trainer` (
  `trainer_id` varchar(64) NOT NULL,
  `trainer_name` varchar(128) NOT NULL,
  PRIMARY KEY (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES ('170293231890857984','Sophie'),('179370789169004546','ryan'),('184805093940396042','ferret'),('424225320372011008','thiccDaddy'),('590725303421239307','Ash');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typerelationship`
--

DROP TABLE IF EXISTS `typerelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `typerelationship` (
  `attacking_type` varchar(32) NOT NULL,
  `defending_type` varchar(32) NOT NULL,
  `multiplier` decimal(3,2) NOT NULL,
  PRIMARY KEY (`attacking_type`,`defending_type`),
  KEY `defending_type` (`defending_type`),
  CONSTRAINT `typerelationship_ibfk_1` FOREIGN KEY (`attacking_type`) REFERENCES `pokemontype` (`type_name`) ON UPDATE CASCADE,
  CONSTRAINT `typerelationship_ibfk_2` FOREIGN KEY (`defending_type`) REFERENCES `pokemontype` (`type_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typerelationship`
--

LOCK TABLES `typerelationship` WRITE;
/*!40000 ALTER TABLE `typerelationship` DISABLE KEYS */;
INSERT INTO `typerelationship` VALUES ('bug','bug',1.00),('bug','dark',2.00),('bug','dragon',1.00),('bug','electric',1.00),('bug','fairy',0.50),('bug','fighting',0.50),('bug','fire',0.50),('bug','flying',0.50),('bug','ghost',0.50),('bug','grass',2.00),('bug','ground',1.00),('bug','ice',1.00),('bug','normal',1.00),('bug','poison',0.50),('bug','psychic',2.00),('bug','rock',1.00),('bug','steel',0.50),('bug','water',1.00),('dark','bug',1.00),('dark','dark',0.50),('dark','dragon',1.00),('dark','electric',1.00),('dark','fairy',0.50),('dark','fighting',0.50),('dark','fire',1.00),('dark','flying',1.00),('dark','ghost',2.00),('dark','grass',1.00),('dark','ground',1.00),('dark','ice',1.00),('dark','normal',1.00),('dark','poison',1.00),('dark','psychic',2.00),('dark','rock',1.00),('dark','steel',1.00),('dark','water',1.00),('dragon','bug',1.00),('dragon','dark',1.00),('dragon','dragon',2.00),('dragon','electric',1.00),('dragon','fairy',0.00),('dragon','fighting',1.00),('dragon','fire',1.00),('dragon','flying',1.00),('dragon','ghost',1.00),('dragon','grass',1.00),('dragon','ground',1.00),('dragon','ice',1.00),('dragon','normal',1.00),('dragon','poison',1.00),('dragon','psychic',1.00),('dragon','rock',1.00),('dragon','steel',0.50),('dragon','water',1.00),('electric','bug',1.00),('electric','dark',1.00),('electric','dragon',0.50),('electric','electric',0.50),('electric','fairy',1.00),('electric','fighting',1.00),('electric','fire',1.00),('electric','flying',2.00),('electric','ghost',1.00),('electric','grass',0.50),('electric','ground',0.00),('electric','ice',1.00),('electric','normal',1.00),('electric','poison',1.00),('electric','psychic',1.00),('electric','rock',1.00),('electric','steel',1.00),('electric','water',2.00),('fairy','bug',1.00),('fairy','dark',2.00),('fairy','dragon',2.00),('fairy','electric',1.00),('fairy','fairy',1.00),('fairy','fighting',2.00),('fairy','fire',0.50),('fairy','flying',1.00),('fairy','ghost',1.00),('fairy','grass',1.00),('fairy','ground',1.00),('fairy','ice',1.00),('fairy','normal',1.00),('fairy','poison',0.50),('fairy','psychic',1.00),('fairy','rock',1.00),('fairy','steel',0.50),('fairy','water',1.00),('fighting','bug',0.50),('fighting','dark',2.00),('fighting','dragon',1.00),('fighting','electric',1.00),('fighting','fairy',0.50),('fighting','fighting',1.00),('fighting','fire',1.00),('fighting','flying',0.50),('fighting','ghost',0.00),('fighting','grass',1.00),('fighting','ground',1.00),('fighting','ice',2.00),('fighting','normal',2.00),('fighting','poison',0.50),('fighting','psychic',0.50),('fighting','rock',2.00),('fighting','steel',2.00),('fighting','water',1.00),('fire','bug',2.00),('fire','dark',1.00),('fire','dragon',0.50),('fire','electric',1.00),('fire','fairy',1.00),('fire','fighting',1.00),('fire','fire',0.50),('fire','flying',1.00),('fire','ghost',1.00),('fire','grass',2.00),('fire','ground',1.00),('fire','ice',2.00),('fire','normal',1.00),('fire','poison',1.00),('fire','psychic',1.00),('fire','rock',0.50),('fire','steel',2.00),('fire','water',0.50),('flying','bug',2.00),('flying','dark',1.00),('flying','dragon',1.00),('flying','electric',0.50),('flying','fairy',1.00),('flying','fighting',2.00),('flying','fire',1.00),('flying','flying',1.00),('flying','ghost',1.00),('flying','grass',2.00),('flying','ground',1.00),('flying','ice',1.00),('flying','normal',1.00),('flying','poison',1.00),('flying','psychic',1.00),('flying','rock',0.50),('flying','steel',0.50),('flying','water',1.00),('ghost','bug',1.00),('ghost','dark',0.50),('ghost','dragon',1.00),('ghost','electric',1.00),('ghost','fairy',1.00),('ghost','fighting',1.00),('ghost','fire',1.00),('ghost','flying',1.00),('ghost','ghost',2.00),('ghost','grass',1.00),('ghost','ground',1.00),('ghost','ice',1.00),('ghost','normal',0.00),('ghost','poison',1.00),('ghost','psychic',2.00),('ghost','rock',1.00),('ghost','steel',1.00),('ghost','water',1.00),('grass','bug',0.50),('grass','dark',1.00),('grass','dragon',0.50),('grass','electric',1.00),('grass','fairy',1.00),('grass','fighting',1.00),('grass','fire',0.50),('grass','flying',0.50),('grass','ghost',1.00),('grass','grass',0.50),('grass','ground',2.00),('grass','ice',1.00),('grass','normal',1.00),('grass','poison',0.50),('grass','psychic',1.00),('grass','rock',2.00),('grass','steel',0.50),('grass','water',2.00),('ground','bug',0.50),('ground','dark',1.00),('ground','dragon',1.00),('ground','electric',2.00),('ground','fairy',1.00),('ground','fighting',1.00),('ground','fire',2.00),('ground','flying',0.00),('ground','ghost',1.00),('ground','grass',0.50),('ground','ground',1.00),('ground','ice',1.00),('ground','normal',1.00),('ground','poison',2.00),('ground','psychic',1.00),('ground','rock',2.00),('ground','steel',2.00),('ground','water',1.00),('ice','bug',1.00),('ice','dark',1.00),('ice','dragon',2.00),('ice','electric',1.00),('ice','fairy',1.00),('ice','fighting',1.00),('ice','fire',0.50),('ice','flying',2.00),('ice','ghost',1.00),('ice','grass',2.00),('ice','ground',2.00),('ice','ice',0.50),('ice','normal',1.00),('ice','poison',1.00),('ice','psychic',1.00),('ice','rock',1.00),('ice','steel',0.50),('ice','water',0.50),('normal','bug',1.00),('normal','dark',1.00),('normal','dragon',1.00),('normal','electric',1.00),('normal','fairy',1.00),('normal','fighting',1.00),('normal','fire',1.00),('normal','flying',1.00),('normal','ghost',0.00),('normal','grass',1.00),('normal','ground',1.00),('normal','ice',1.00),('normal','normal',1.00),('normal','poison',1.00),('normal','psychic',1.00),('normal','rock',0.50),('normal','steel',0.50),('normal','water',1.00),('poison','bug',1.00),('poison','dark',1.00),('poison','dragon',1.00),('poison','electric',1.00),('poison','fairy',2.00),('poison','fighting',1.00),('poison','fire',1.00),('poison','flying',1.00),('poison','ghost',0.50),('poison','grass',2.00),('poison','ground',0.50),('poison','ice',1.00),('poison','normal',1.00),('poison','poison',0.50),('poison','psychic',1.00),('poison','rock',0.50),('poison','steel',0.00),('poison','water',1.00),('psychic','bug',1.00),('psychic','dark',0.00),('psychic','dragon',1.00),('psychic','electric',1.00),('psychic','fairy',1.00),('psychic','fighting',2.00),('psychic','fire',1.00),('psychic','flying',1.00),('psychic','ghost',1.00),('psychic','grass',1.00),('psychic','ground',1.00),('psychic','ice',1.00),('psychic','normal',1.00),('psychic','poison',2.00),('psychic','psychic',0.50),('psychic','rock',1.00),('psychic','steel',0.50),('psychic','water',1.00),('rock','bug',2.00),('rock','dark',1.00),('rock','dragon',1.00),('rock','electric',1.00),('rock','fairy',1.00),('rock','fighting',0.50),('rock','fire',2.00),('rock','flying',2.00),('rock','ghost',1.00),('rock','grass',1.00),('rock','ground',0.50),('rock','ice',2.00),('rock','normal',1.00),('rock','poison',1.00),('rock','psychic',1.00),('rock','rock',1.00),('rock','steel',0.50),('rock','water',1.00),('steel','bug',1.00),('steel','dark',1.00),('steel','dragon',1.00),('steel','electric',0.50),('steel','fairy',2.00),('steel','fighting',1.00),('steel','fire',0.50),('steel','flying',1.00),('steel','ghost',1.00),('steel','grass',1.00),('steel','ground',1.00),('steel','ice',2.00),('steel','normal',1.00),('steel','poison',1.00),('steel','psychic',1.00),('steel','rock',2.00),('steel','steel',0.50),('steel','water',0.50),('water','bug',1.00),('water','dark',1.00),('water','dragon',0.50),('water','electric',1.00),('water','fairy',1.00),('water','fighting',1.00),('water','fire',2.00),('water','flying',1.00),('water','ghost',1.00),('water','grass',0.50),('water','ground',2.00),('water','ice',1.00),('water','normal',1.00),('water','poison',1.00),('water','psychic',1.00),('water','rock',2.00),('water','steel',1.00),('water','water',0.50);
/*!40000 ALTER TABLE `typerelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pokedex'
--

--
-- Dumping routines for database 'pokedex'
--
/*!50003 DROP FUNCTION IF EXISTS `pokemon_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pokemon_exists`(poke_name varchar(64)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF EXISTS (SELECT p_name from pokemon where p_name = poke_name) then
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `team_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `team_exists`(trainer_id varchar(64), tname varchar(64)) RETURNS tinyint(1)
    DETERMINISTIC
begin
	if exists (select * from pokemonteam where team_trainer = trainer_id and team_name = tname) then
    return true;
    else
    return false;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `team_has` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `team_has`(trainer_id varchar(64), tname varchar(64), nickname varchar(64)) RETURNS tinyint(1)
    DETERMINISTIC
begin
	IF EXISTS(select * from pokemonteam WHERE team_trainer = trainer_id AND team_name = tname
				AND (pokemon1 = nickname or pokemon2 = nickname or pokemon3 = nickname or pokemon4 = nickname
					or pokemon5 = nickname or pokemon6 = nickname)) then
		return true;
	else
		return false;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `trainer_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `trainer_exists`(disc_id VARCHAR(64)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
        DECLARE exist INT;
        SELECT COUNT(*) FROM trainer WHERE trainer_id = disc_id INTO exist;
        IF exist > 0 THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `which_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `which_row`(trainer_id varchar(64), tname varchar(64)) RETURNS int(11)
    DETERMINISTIC
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `which_rowname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `which_rowname`(trainer_id varchar(64), tname varchar(64), nickname varchar(64)) RETURNS int(11)
    DETERMINISTIC
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `about_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `about_item`(IN i_name VARCHAR(32))
BEGIN
		SELECT * FROM item WHERE item_name = i_name;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addtoteam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addtoteam`(IN trainer_id varchar(64), IN team_name_in VARCHAR(64), IN nickname VARCHAR(64), IN whichrow INT)
BEGIN
	IF     whichrow = 1 THEN UPDATE pokemonteam SET pokemon1 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 2 THEN UPDATE pokemonteam SET pokemon2 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 3 THEN UPDATE pokemonteam SET pokemon3 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 4 THEN UPDATE pokemonteam SET pokemon4 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 5 THEN UPDATE pokemonteam SET pokemon5 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSE  					 UPDATE pokemonteam SET pokemon6 = nickname WHERE team_trainer = trainer_id AND team_name = team_name_in;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createStat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createStat`(in nick_name varchar(64), in poke_name varchar(64), in trainer_id varchar(64),
	in health INT, in spdef INT, in def INT, in atk INT, in spd INT, in spatk INT, in iv_health TINYINT,
    in iv_spdef TINYINT, in iv_def TINYINT, in iv_atk TINYINT, in iv_spd TINYINT, in iv_spatk TINYINT,
    in gender ENUM('F', 'M', 'Genderless'), in pokemon_level INT)
BEGIN
	INSERT INTO `pokedex`.`pokestat` (`nick_name`, `poke_name`, `trainer_id`, `health`, `spdef`, `def`,
		`atk`, `spd`, `spatk`, `iv_health`, `iv_spdef`, `iv_def`, `iv_atk`, `iv_spd`, `iv_spatk`, `gender`, `pokemon_level`)
VALUES (nick_name, poke_name, trainer_id, health, spdef, def, atk, spd, spatk, iv_health, iv_spdef, iv_def,
		iv_atk, iv_spd, iv_spatk, gender, pokemon_level);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createteam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createteam`(IN trainer_id varchar(64), IN team_name_in VARCHAR(64))
BEGIN
	INSERT INTO pokemonteam(team_trainer, team_name, pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6) VALUES(trainer_id, team_name_in, NULL, NULL, NULL, NULL, NULL, NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletefromteam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletefromteam`(IN trainer_id varchar(64), IN team_name_in VARCHAR(64), IN whichrow INT)
BEGIN
	IF     whichrow = 1 THEN UPDATE pokemonteam SET pokemon1 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 2 THEN UPDATE pokemonteam SET pokemon2 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 3 THEN UPDATE pokemonteam SET pokemon3 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 4 THEN UPDATE pokemonteam SET pokemon4 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSEIF whichrow = 5 THEN UPDATE pokemonteam SET pokemon5 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    ELSE  					 UPDATE pokemonteam SET pokemon6 = null WHERE team_trainer = trainer_id AND team_name = team_name_in;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteteam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteteam`(IN trainer_id VARCHAR(64), IN team_name_in VARCHAR(64))
BEGIN
	DELETE FROM pokemonteam WHERE team_trainer = trainer_id AND team_name = team_name_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `greatestweakness` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `greatestweakness`(IN trainer_id_in varchar(64), IN team_name_in VARCHAR(64))
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `group_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `group_search`(IN type1 VARCHAR(32), IN type2 VARCHAR(32), IN egg_grp VARCHAR(32))
BEGIN
		IF type1 = 'x' AND type2 = 'x' AND egg_grp = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon;
		ELSEIF type1 = 'x' AND type2 = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (egg_grp = egg_group OR egg_grp = egg_group_2);
		ELSEIF type1 = 'x' AND egg_grp = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type2 = pokemon_type_1 OR type2 = pokemon_type_2);
		ELSEIF type2 = 'x' AND egg_grp = 'x' THEN
            SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2);
		ELSEIF type1 = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type2 = pokemon_type_1 OR type2 = pokemon_type_2)
					AND (egg_grp = egg_group OR egg_grp = egg_group_2);
		ELSEIF type2 = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) 
					AND (egg_grp = egg_group OR egg_grp = egg_group_2);
		ELSEIF egg_grp = 'x' THEN
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) 
					AND (type2 = pokemon_type_1 OR type2 = pokemon_type_2);
		ELSE
			SELECT p_name AS pokemon_name FROM pokemon 
				WHERE (type1 = pokemon_type_1 OR type1 = pokemon_type_2) 
					AND (type2 = pokemon_type_1 OR type2 = pokemon_type_2)
					AND (egg_grp = egg_group OR egg_grp = egg_group_2);
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pevolve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pevolve`(IN pokemon_name VARCHAR(20))
BEGIN
	SELECT item, evo_description, post_poke_name FROM evolution WHERE pre_poke_name = pokemon_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pokemon_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pokemon_details`(IN pokemon_name VARCHAR(64))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pokemon_in_region` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pokemon_in_region`(IN region VARCHAR(64))
BEGIN
		SELECT poke_name AS pokemon_name FROM pokemonlocation
        WHERE region_name = region;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `poke_weak` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `poke_weak`(IN pokemon_name VARCHAR(32))
BEGIN
		DECLARE type1 VARCHAR(32);
		DECLARE type2 VARCHAR(32);
		SELECT pokemon_type_1 FROM pokemon WHERE p_name = pokemon_name INTO type1;
		SELECT pokemon_type_2 FROM pokemon WHERE p_name = pokemon_name INTO type2;
		
		IF type2 IS NULL THEN
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
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `poke_weak2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `poke_weak2`(IN pokemon_name VARCHAR(32))
BEGIN
		DECLARE type1 VARCHAR(32);
		DECLARE type2 VARCHAR(32);
		SELECT pokemon_type_2 FROM pokemon WHERE p_name = pokemon_name INTO type2;
        SELECT pokemon_type_1 FROM pokemon WHERE p_name = pokemon_name INTO type1;
        select type2;
        if type2 is null then
			select type1;
		end if;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `poke_weaknesses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `poke_weaknesses`(IN pokemon_name VARCHAR(32))
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
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_professor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_professor`(IN prof_id varchar(64), IN uname VARCHAR(32), IN uname_gender VARCHAR(16), IN region VARCHAR(32), IN town VARCHAR(32))
BEGIN
		INSERT INTO professor
		VALUES(prof_id, uname, uname_gender, region, town);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_trainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_trainer`(IN id varchar(64), IN uname VARCHAR(32))
BEGIN
		INSERT INTO trainer
		VALUES(id, uname);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `size_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `size_search`(IN w_op VARCHAR(1), IN in_weight INT, IN h_op VARCHAR(1), IN in_height INT)
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `team`(IN trainer_id_in varchar(64), IN team_name_in VARCHAR(64))
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
        
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-20 16:36:59
