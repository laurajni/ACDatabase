-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: acnh
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buyable_item`
--

DROP TABLE IF EXISTS `buyable_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyable_item` (
  `item_id` int NOT NULL,
  `buy_price` int DEFAULT NULL,
  `npc_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `npc_id` (`npc_id`),
  CONSTRAINT `buyable_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `buyable_item_ibfk_2` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyable_item`
--

INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (2,900,4);
INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (3,35960,3);
INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (4,3200,3);
INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (105,400,4);
INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (300,490,5);
INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (302,1320,5);
INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (303,2800,5);
INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (306,2640,5);
INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (307,840,5);

--
-- Table structure for table `clothing`
--

DROP TABLE IF EXISTS `clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothing` (
  `clothing_id` int NOT NULL,
  `clothing_type` char(20) DEFAULT NULL,
  PRIMARY KEY (`clothing_id`),
  CONSTRAINT `clothing_ibfk_1` FOREIGN KEY (`clothing_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing`
--

INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (300,'Accessories');
INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (301,'Dresses');
INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (302,'Bottoms');
INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (303,'Dresses');
INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (304,'Hats');
INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (305,'Shoes');
INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (306,'Shoes');
INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (307,'Tops');

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int NOT NULL,
  `color` char(10) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color`) VALUES (1,'Green');
INSERT INTO `color` (`color_id`, `color`) VALUES (2,'Beige');
INSERT INTO `color` (`color_id`, `color`) VALUES (3,'Brown');
INSERT INTO `color` (`color_id`, `color`) VALUES (4,'White');
INSERT INTO `color` (`color_id`, `color`) VALUES (5,'Black');
INSERT INTO `color` (`color_id`, `color`) VALUES (6,'Blue');
INSERT INTO `color` (`color_id`, `color`) VALUES (7,'Pink');

--
-- Table structure for table `craftable_item`
--

DROP TABLE IF EXISTS `craftable_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftable_item` (
  `item_id` int NOT NULL,
  `diy_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `diy_id` (`diy_id`),
  CONSTRAINT `craftable_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `craftable_item_ibfk_2` FOREIGN KEY (`diy_id`) REFERENCES `diy_recipe` (`diy_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftable_item`
--

INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (6,1);
INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (7,2);
INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (8,3);
INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (9,4);
INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (10,5);
INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (1,6);
INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (301,7);
INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (304,8);
INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (305,9);

--
-- Table structure for table `critter`
--

DROP TABLE IF EXISTS `critter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `critter` (
  `critter_id` int NOT NULL,
  `showup_time` char(10) DEFAULT NULL,
  `showup_place` char(20) DEFAULT NULL,
  `critter_type` char(4) DEFAULT NULL,
  PRIMARY KEY (`critter_id`),
  CONSTRAINT `critter_ibfk_1` FOREIGN KEY (`critter_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critter`
--

INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (200,'4pm-9am','River','Fish');
INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (201,'4pm-9am','River','Fish');
INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (202,'All day','River','Fish');
INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (203,'9pm-4am','Sea','Fish');
INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (250,'5pm-8am','On ground','Bug');
INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (251,'All day','Trees (coconut)','Bug');
INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (252,'8am-5pm','On trees','Bug');
INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (253,'All day','Flying','Bug');

--
-- Table structure for table `critter_time`
--

DROP TABLE IF EXISTS `critter_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `critter_time` (
  `critter_id` int NOT NULL,
  `hemisphere` char(1) NOT NULL,
  `month` char(10) NOT NULL,
  PRIMARY KEY (`critter_id`,`hemisphere`,`month`),
  CONSTRAINT `critter_time_ibfk_1` FOREIGN KEY (`critter_id`) REFERENCES `critter` (`critter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critter_time`
--

INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (200,'N','Jun-Sept');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (200,'S','Dec-Mar');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (201,'N','Jun-Sept');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (201,'S','Dec-Mar');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (202,'N','Nov-Mar');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (202,'S','May-Sep');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (203,'N','Nov-Feb');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (203,'S','May-Aug');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (250,'N','Sep-Oct');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (250,'S','Mar-Apr');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (251,'N','Jul-Aug');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (251,'S','Jan-Feb');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (252,'N','Jul-Aug');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (252,'S','Jan-Feb');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (253,'N','Nov-Feb');
INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (253,'S','May-Aug');

--
-- Table structure for table `diy_recipe`
--

DROP TABLE IF EXISTS `diy_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diy_recipe` (
  `diy_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `diy_name` char(80) DEFAULT NULL,
  `season` char(1) DEFAULT '1',
  `event_id` int DEFAULT NULL,
  PRIMARY KEY (`diy_id`),
  UNIQUE KEY `diy_name` (`diy_name`),
  KEY `item_id` (`item_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `diy_recipe_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `diy_recipe_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `sp_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diy_recipe`
--

INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (1,6,'Cherry-blossom Branches Recipe','1',1);
INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (2,7,'Cherry-blossom Clock Recipe','1',1);
INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (3,8,'Cherry-blossom-petal Pile Recipe','1',1);
INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (4,9,'Bamboo Bench Recipe','1',2);
INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (5,10,'Bamboo Candleholder Recipe','1',2);
INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (6,1,'Apple Rug Recipe',NULL,NULL);
INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (7,301,'Apple Dress Recipe',NULL,NULL);
INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (8,304,'Apple Hat Recipe',NULL,NULL);
INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (9,305,'Armor Shoes Recipe',NULL,NULL);

--
-- Table structure for table `diy_recipe_uses_item`
--

DROP TABLE IF EXISTS `diy_recipe_uses_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diy_recipe_uses_item` (
  `diy_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`diy_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `diy_recipe_uses_item_ibfk_1` FOREIGN KEY (`diy_id`) REFERENCES `diy_recipe` (`diy_id`),
  CONSTRAINT `diy_recipe_uses_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diy_recipe_uses_item`
--

INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (1,100,8);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (1,101,5);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (1,102,4);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (2,100,5);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (2,103,1);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (3,100,5);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (4,104,8);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (5,101,2);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (5,104,3);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (6,105,6);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (7,105,8);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (8,105,5);
INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (9,103,6);

--
-- Table structure for table `event_drop_recipe`
--

DROP TABLE IF EXISTS `event_drop_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_drop_recipe` (
  `event_id` int NOT NULL,
  `diy_id` int NOT NULL,
  PRIMARY KEY (`event_id`,`diy_id`),
  KEY `diy_id` (`diy_id`),
  CONSTRAINT `event_drop_recipe_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `sp_event` (`event_id`),
  CONSTRAINT `event_drop_recipe_ibfk_2` FOREIGN KEY (`diy_id`) REFERENCES `diy_recipe` (`diy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_drop_recipe`
--

INSERT INTO `event_drop_recipe` (`event_id`, `diy_id`) VALUES (1,1);
INSERT INTO `event_drop_recipe` (`event_id`, `diy_id`) VALUES (1,2);
INSERT INTO `event_drop_recipe` (`event_id`, `diy_id`) VALUES (1,3);
INSERT INTO `event_drop_recipe` (`event_id`, `diy_id`) VALUES (2,4);
INSERT INTO `event_drop_recipe` (`event_id`, `diy_id`) VALUES (2,5);

--
-- Table structure for table `event_time`
--

DROP TABLE IF EXISTS `event_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_time` (
  `event_id` int NOT NULL,
  `hemisphere` char(1) NOT NULL,
  `start_date` char(10) DEFAULT NULL,
  `end_date` char(10) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`hemisphere`),
  CONSTRAINT `event_time_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `sp_event` (`event_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_time`
--

INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (1,'N','04-01','04-10');
INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (1,'S','10-01','10-10');
INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (2,'N','03-01','05-31');
INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (2,'S','09-01','11-31');
INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (3,'N','Saturday','Saturday');
INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (3,'S','Saturday','Saturday');
INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (4,'N','Monday','Friday');
INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (4,'S','Monday','Friday');

--
-- Table structure for table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture` (
  `furniture_id` int NOT NULL,
  `item_category` char(3) DEFAULT NULL,
  PRIMARY KEY (`furniture_id`),
  CONSTRAINT `furniture_ibfk_1` FOREIGN KEY (`furniture_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture`
--

INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (1,'RUG');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (2,'FLO');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (3,'FUR');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (4,'FUR');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (5,'FUR');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (6,'FUR');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (7,'WAL');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (8,'RUG');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (9,'FUR');
INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (10,'FUR');

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL,
  `item_name` char(30) DEFAULT NULL,
  `obtains` char(30) DEFAULT NULL,
  `item_size` char(3) DEFAULT NULL,
  `item_series_id` int DEFAULT NULL,
  `sell_price` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_name` (`item_name`),
  KEY `item_series_id` (`item_series_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_series_id`) REFERENCES `item_series` (`item_series_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (1,'Apple Rug','Crafting','3x3',1,1200);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (2,'Aqua Tile Flooring','Buy Nook\'s Cranny','1x1',NULL,225);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (3,'Acnh Nintendo Switch','Order Nook Shopping','1x1',NULL,8990);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (4,'Agent K.K.','Listen to K.K. Slider','1x1',2,800);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (5,'Agrias Butterfly Model','Trade from Flick','1x1',3,9000);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (6,'Cherry-blossom Branches','Crafting','2x2',4,4240);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (7,'Cherry-blossom Clock','Crafting','1x1',4,2750);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (8,'Cherry-blossom-petal Pile','Crafting','1x1',4,2000);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (9,'Bamboo Bench','Crafting','2x1',5,1280);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (10,'Bamboo Candleholder','Crafting','1x1',5,880);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (100,'Cherry-blossom Petal','Cherry Blossom Festival','1x1',4,200);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (101,'Clay','Hit rocks','1x1',NULL,100);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (102,'Tree Branch','Shake trees','1x1',NULL,5);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (103,'Iron Nugget','Hit rocks','1x1',NULL,275);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (104,'Bamboo Piece','Hit bamboo with axe','1x1',NULL,200);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (105,'Apple','Harvest from trees','1x1',1,100);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (200,'Arapaima','Fishing','2x1',NULL,10000);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (201,'Arowana','Fishing','1x1',NULL,10000);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (202,'Bitterling','Fishing','1x1',NULL,900);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (203,'Blowfish','Fishing','1x1',NULL,500);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (250,'Bell Cricket','Catch bug','1x1',NULL,430);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (251,'Blue Weevil Beetle','Catch bug','1x1',NULL,800);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (252,'Brown Cicada','Catch bug','1x1',NULL,350);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (253,'Damselfly','Catch bug','1x1',NULL,500);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (300,'3D Glasses','Buy from Able Sisters','1x1',NULL,122);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (301,'Apple Dress','Crafting','1x1',1,1600);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (302,'Acid-washed Jeans','Buy from Able Sisters','1x1',NULL,330);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (303,'Adventure Dress','Buy from Able Sisters','1x1',NULL,700);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (304,'Apple Hat','Crafting','1x1',1,1000);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (305,'Armor Shoes','Crafting','1x1',NULL,3000);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (306,'Antique Boots','Buy from Able Sisters','1x1',NULL,660);
INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (307,'Apron','Buy from Able Sisters','1x1',NULL,210);

--
-- Table structure for table `item_color`
--

DROP TABLE IF EXISTS `item_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_color` (
  `item_id` int NOT NULL,
  `color_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`color_id`),
  KEY `color_id` (`color_id`),
  CONSTRAINT `item_color_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`) ON DELETE CASCADE,
  CONSTRAINT `item_color_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `item_color_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  CONSTRAINT `item_color_ibfk_5` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_color`
--

INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (9,1);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (10,1);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (307,1);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (9,2);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (10,2);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (9,3);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (10,3);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (307,3);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (302,5);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (302,6);
INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (307,7);

--
-- Table structure for table `item_series`
--

DROP TABLE IF EXISTS `item_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_series` (
  `item_series_id` int NOT NULL,
  `series_name` char(30) DEFAULT NULL,
  PRIMARY KEY (`item_series_id`),
  UNIQUE KEY `series_name` (`series_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_series`
--

INSERT INTO `item_series` (`item_series_id`, `series_name`) VALUES (5,'Bamboo');
INSERT INTO `item_series` (`item_series_id`, `series_name`) VALUES (4,'Cherry-blossom Festival');
INSERT INTO `item_series` (`item_series_id`, `series_name`) VALUES (1,'Fruit');
INSERT INTO `item_series` (`item_series_id`, `series_name`) VALUES (3,'Models');
INSERT INTO `item_series` (`item_series_id`, `series_name`) VALUES (2,'Music');

--
-- Table structure for table `my_user`
--

DROP TABLE IF EXISTS `my_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` char(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_user`
--

INSERT INTO `my_user` (`user_id`, `user_name`) VALUES (1,'Laura');
INSERT INTO `my_user` (`user_id`, `user_name`) VALUES (2,'Yanbo');
INSERT INTO `my_user` (`user_id`, `user_name`) VALUES (3,'Jett');
INSERT INTO `my_user` (`user_id`, `user_name`) VALUES (6,'Phoenix');
INSERT INTO `my_user` (`user_id`, `user_name`) VALUES (7,'Guest');

--
-- Table structure for table `npc`
--

DROP TABLE IF EXISTS `npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc` (
  `npc_id` int NOT NULL,
  `npc_name` char(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `species` char(10) DEFAULT NULL,
  PRIMARY KEY (`npc_id`),
  UNIQUE KEY `npc_name` (`npc_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npc`
--

INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (1,'Flick','M','Chameleon');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (2,'K.K. Slider','M','Dog');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (3,'Tom Nook','M','Tanuki');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (4,'Timmy&Tommy','M','Tanuki');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (5,'Mable','F','Hedgehog');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (100,'Marshal','M','Squirrel');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (101,'Raymond','M','Cat');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (102,'Marina','F','Octopus');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (103,'Merengue','F','Rhino');
INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (104,'Deirdre','F','Deer');

--
-- Table structure for table `npc_gift`
--

DROP TABLE IF EXISTS `npc_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_gift` (
  `npc_id` int NOT NULL,
  `diy_id` int NOT NULL,
  `note` char(50) DEFAULT NULL,
  PRIMARY KEY (`npc_id`,`diy_id`),
  KEY `diy_id` (`diy_id`),
  CONSTRAINT `npc_gift_ibfk_1` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`),
  CONSTRAINT `npc_gift_ibfk_2` FOREIGN KEY (`diy_id`) REFERENCES `diy_recipe` (`diy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npc_gift`
--

INSERT INTO `npc_gift` (`npc_id`, `diy_id`, `note`) VALUES (100,6,'Found crafting');
INSERT INTO `npc_gift` (`npc_id`, `diy_id`, `note`) VALUES (102,8,'Found crafting');
INSERT INTO `npc_gift` (`npc_id`, `diy_id`, `note`) VALUES (102,9,'Found crafting');
INSERT INTO `npc_gift` (`npc_id`, `diy_id`, `note`) VALUES (103,9,'Found crafting');
INSERT INTO `npc_gift` (`npc_id`, `diy_id`, `note`) VALUES (104,6,'Found crafting');
INSERT INTO `npc_gift` (`npc_id`, `diy_id`, `note`) VALUES (104,7,'Found crafting');
INSERT INTO `npc_gift` (`npc_id`, `diy_id`, `note`) VALUES (104,8,'Found crafting');

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `npc_id` int NOT NULL,
  `seller_time` char(20) DEFAULT NULL,
  PRIMARY KEY (`npc_id`),
  CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`) ON DELETE CASCADE,
  CONSTRAINT `seller_ibfk_2` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`npc_id`, `seller_time`) VALUES (3,'All day');
INSERT INTO `seller` (`npc_id`, `seller_time`) VALUES (4,'9am-9pm/9am-10pm');
INSERT INTO `seller` (`npc_id`, `seller_time`) VALUES (5,'9pm-9pm');

--
-- Table structure for table `sp_event`
--

DROP TABLE IF EXISTS `sp_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_event` (
  `event_id` int NOT NULL,
  `event_name` char(40) DEFAULT NULL,
  `event_description` char(100) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_event`
--

INSERT INTO `sp_event` (`event_id`, `event_name`, `event_description`) VALUES (1,'Cherry-blossom Festival','Trees turn pink, special recipes in eggs');
INSERT INTO `sp_event` (`event_id`, `event_name`, `event_description`) VALUES (2,'Spring','Bamboo recipes common');
INSERT INTO `sp_event` (`event_id`, `event_name`, `event_description`) VALUES (3,'Saturday Night Concert','K.K. Slider comes to sing');
INSERT INTO `sp_event` (`event_id`, `event_name`, `event_description`) VALUES (4,'Weekly visitor','NPC may come once a week');

--
-- Table structure for table `special_npc`
--

DROP TABLE IF EXISTS `special_npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_npc` (
  `npc_id` int NOT NULL,
  `task` char(100) DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  PRIMARY KEY (`npc_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `special_npc_ibfk_1` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`) ON DELETE CASCADE,
  CONSTRAINT `special_npc_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `sp_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_npc`
--

INSERT INTO `special_npc` (`npc_id`, `task`, `event_id`) VALUES (1,'Buy your bugs and trade models',4);
INSERT INTO `special_npc` (`npc_id`, `task`, `event_id`) VALUES (2,'Request a song',3);

--
-- Table structure for table `villager`
--

DROP TABLE IF EXISTS `villager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villager` (
  `villager_id` int NOT NULL,
  `personality` char(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`villager_id`),
  CONSTRAINT `villager_ibfk_1` FOREIGN KEY (`villager_id`) REFERENCES `npc` (`npc_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villager`
--

INSERT INTO `villager` (`villager_id`, `personality`, `birthday`) VALUES (100,'Smug','0000-09-29');
INSERT INTO `villager` (`villager_id`, `personality`, `birthday`) VALUES (101,'Smug','0000-10-01');
INSERT INTO `villager` (`villager_id`, `personality`, `birthday`) VALUES (102,'Normal','0000-06-26');
INSERT INTO `villager` (`villager_id`, `personality`, `birthday`) VALUES (103,'Normal','0000-03-19');
INSERT INTO `villager` (`villager_id`, `personality`, `birthday`) VALUES (104,'Sisterly','0000-05-04');

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `wishlist_name` char(20) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`,`wishlist_name`),
  UNIQUE KEY `wishlist_name` (`wishlist_name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `my_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `wishlist_name`, `user_id`) VALUES (1,'Outdoor',1);
INSERT INTO `wishlist` (`wishlist_id`, `wishlist_name`, `user_id`) VALUES (2,'Home',1);
INSERT INTO `wishlist` (`wishlist_id`, `wishlist_name`, `user_id`) VALUES (3,'Wishlist',2);
INSERT INTO `wishlist` (`wishlist_id`, `wishlist_name`, `user_id`) VALUES (4,'Random',3);
INSERT INTO `wishlist` (`wishlist_id`, `wishlist_name`, `user_id`) VALUES (5,'Random2',3);
INSERT INTO `wishlist` (`wishlist_id`, `wishlist_name`, `user_id`) VALUES (8,'List',7);

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_item` (
  `list_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`list_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `wishlist_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `wishlist_item_ibfk_3` FOREIGN KEY (`list_id`) REFERENCES `wishlist` (`wishlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (2,1);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,1);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (4,1);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (5,1);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,2);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (4,2);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (5,2);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,3);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (4,3);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (5,3);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,4);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (4,4);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (1,5);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (2,5);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,5);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (1,6);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (2,6);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,6);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (1,7);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,7);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (1,8);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,8);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (1,9);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (2,9);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,9);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (1,10);
INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (3,10);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
