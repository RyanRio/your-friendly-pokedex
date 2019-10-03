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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area` (
  `area_name` varchar(256) NOT NULL,
  `region_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`area_name`),
  KEY `region_name` (`region_name`),
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`region_name`) REFERENCES `region` (`region_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egggroup`
--

LOCK TABLES `egggroup` WRITE;
/*!40000 ALTER TABLE `egggroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `egggroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evolution`
--

DROP TABLE IF EXISTS `evolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evolution` (
  `pre_pokemon_id` int(11) NOT NULL,
  `item` varchar(64) DEFAULT NULL,
  `post_pokemon_id` int(11) NOT NULL,
  `evo_description` varchar(256) NOT NULL,
  PRIMARY KEY (`pre_pokemon_id`,`post_pokemon_id`),
  KEY `item` (`item`),
  KEY `post_pokemon_id` (`post_pokemon_id`),
  CONSTRAINT `evolution_ibfk_1` FOREIGN KEY (`item`) REFERENCES `item` (`item_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evolution_ibfk_2` FOREIGN KEY (`pre_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evolution_ibfk_3` FOREIGN KEY (`post_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolution`
--

LOCK TABLES `evolution` WRITE;
/*!40000 ALTER TABLE `evolution` DISABLE KEYS */;
/*!40000 ALTER TABLE `evolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game` (
  `game_name` varchar(16) NOT NULL,
  `generation` int(11) NOT NULL,
  PRIMARY KEY (`game_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(256) NOT NULL,
  `item_effect` varchar(256) NOT NULL,
  PRIMARY KEY (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
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
  `professor_id` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `gender` enum('F','M','Genderless') DEFAULT NULL,
  `pokemon_level` int(11) NOT NULL,
  `gender_ratio_wild` double NOT NULL,
  `poke_description` varchar(256) NOT NULL,
  `egg_group` int(11) NOT NULL,
  PRIMARY KEY (`pokemon_id`),
  KEY `professor_id` (`professor_id`),
  KEY `egg_group` (`egg_group`),
  CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemon_ibfk_2` FOREIGN KEY (`egg_group`) REFERENCES `egggroup` (`egg_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonlocation`
--

DROP TABLE IF EXISTS `pokemonlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokemonlocation` (
  `pokemon_id` int(11) NOT NULL,
  `area_id` varchar(256) NOT NULL,
  PRIMARY KEY (`pokemon_id`,`area_id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `pokemonlocation_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pokemonlocation_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonlocation`
--

LOCK TABLES `pokemonlocation` WRITE;
/*!40000 ALTER TABLE `pokemonlocation` DISABLE KEYS */;
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
  `power` int(11) NOT NULL,
  `atk_type` enum('Physical','Special','Status') DEFAULT NULL,
  `move_description` varchar(256) NOT NULL,
  `type_name` varchar(10) NOT NULL,
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
/*!40000 ALTER TABLE `pokemonmove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemontype`
--

DROP TABLE IF EXISTS `pokemontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokemontype` (
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemontype`
--

LOCK TABLES `pokemontype` WRITE;
/*!40000 ALTER TABLE `pokemontype` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokestat`
--

DROP TABLE IF EXISTS `pokestat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokestat` (
  `pokestat_id` int(11) NOT NULL AUTO_INCREMENT,
  `pokemon_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
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
  PRIMARY KEY (`pokestat_id`),
  KEY `pokemon_id` (`pokemon_id`),
  KEY `trainer_id` (`trainer_id`),
  KEY `move1` (`move1`),
  KEY `move2` (`move2`),
  KEY `move3` (`move3`),
  KEY `move4` (`move4`),
  CONSTRAINT `pokestat_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
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
/*!40000 ALTER TABLE `pokestat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL,
  `pokemon_discovered` int(11) NOT NULL,
  `professor_name` varchar(128) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
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
  `region_description` varchar(256) NOT NULL,
  `game_name` varchar(16) NOT NULL,
  PRIMARY KEY (`region_name`),
  KEY `game_name` (`game_name`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`game_name`) REFERENCES `game` (`game_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trainer` (
  `trainer_id` int(11) NOT NULL,
  `trainer_type` varchar(256) NOT NULL,
  `trainer_name` varchar(128) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typerelationship`
--

DROP TABLE IF EXISTS `typerelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `typerelationship` (
  `attacking_type` varchar(10) NOT NULL,
  `defending_type` varchar(10) NOT NULL,
  `multiplier` double NOT NULL,
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
/*!40000 ALTER TABLE `typerelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pokedex'
--

--
-- Dumping routines for database 'pokedex'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-15 15:48:42
