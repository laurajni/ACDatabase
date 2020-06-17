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

INSERT INTO `buyable_item` (`item_id`, `buy_price`, `npc_id`) VALUES (2,900,4),(3,35960,3),(4,3200,3),(105,400,4),(300,490,5),(302,1320,5),(303,2800,5),(306,2640,5),(307,840,5);

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

INSERT INTO `clothing` (`clothing_id`, `clothing_type`) VALUES (300,'Accessories'),(301,'Dresses'),(302,'Bottoms'),(303,'Dresses'),(304,'Hats'),(305,'Shoes'),(306,'Shoes'),(307,'Tops');

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

INSERT INTO `color` (`color_id`, `color`) VALUES (1,'Green'),(2,'Beige'),(3,'Brown'),(4,'White'),(5,'Black'),(6,'Blue'),(7,'Pink');

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

INSERT INTO `craftable_item` (`item_id`, `diy_id`) VALUES (6,1),(7,2),(8,3),(9,4),(10,5),(1,6),(301,7),(304,8),(305,9);

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

INSERT INTO `critter` (`critter_id`, `showup_time`, `showup_place`, `critter_type`) VALUES (200,'4pm-9am','River','Fish'),(201,'4pm-9am','River','Fish'),(202,'All day','River','Fish'),(203,'9pm-4am','Sea','Fish'),(250,'5pm-8am','On ground','Bug'),(251,'All day','Trees (coconut)','Bug'),(252,'8am-5pm','On trees','Bug'),(253,'All day','Flying','Bug');

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

INSERT INTO `critter_time` (`critter_id`, `hemisphere`, `month`) VALUES (200,'N','Jun-Sept'),(200,'S','Dec-Mar'),(201,'N','Jun-Sept'),(201,'S','Dec-Mar'),(202,'N','Nov-Mar'),(202,'S','May-Sep'),(203,'N','Nov-Feb'),(203,'S','May-Aug'),(250,'N','Sep-Oct'),(250,'S','Mar-Apr'),(251,'N','Jul-Aug'),(251,'S','Jan-Feb'),(252,'N','Jul-Aug'),(252,'S','Jan-Feb'),(253,'N','Nov-Feb'),(253,'S','May-Aug');

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

INSERT INTO `diy_recipe` (`diy_id`, `item_id`, `diy_name`, `season`, `event_id`) VALUES (1,6,'Cherry-blossom Branches Recipe','1',1),(2,7,'Cherry-blossom Clock Recipe','1',1),(3,8,'Cherry-blossom-petal Pile Recipe','1',1),(4,9,'Bamboo Bench Recipe','1',2),(5,10,'Bamboo Candleholder Recipe','1',2),(6,1,'Apple Rug Recipe',NULL,NULL),(7,301,'Apple Dress Recipe',NULL,NULL),(8,304,'Apple Hat Recipe',NULL,NULL),(9,305,'Armor Shoes Recipe',NULL,NULL);

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

INSERT INTO `diy_recipe_uses_item` (`diy_id`, `item_id`, `quantity`) VALUES (1,100,8),(1,101,5),(1,102,4),(2,100,5),(2,103,1),(3,100,5),(4,104,8),(5,101,2),(5,104,3),(6,105,6),(7,105,8),(8,105,5),(9,103,6);

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

INSERT INTO `event_drop_recipe` (`event_id`, `diy_id`) VALUES (1,1),(1,2),(1,3),(2,4),(2,5);

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

INSERT INTO `event_time` (`event_id`, `hemisphere`, `start_date`, `end_date`) VALUES (1,'N','04-01','04-10'),(1,'S','10-01','10-10'),(2,'N','03-01','05-31'),(2,'S','09-01','11-31'),(3,'N','Saturday','Saturday'),(3,'S','Saturday','Saturday'),(4,'N','Monday','Friday'),(4,'S','Monday','Friday');

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

INSERT INTO `furniture` (`furniture_id`, `item_category`) VALUES (1,'RUG'),(2,'FLO'),(3,'FUR'),(4,'FUR'),(5,'FUR'),(6,'FUR'),(7,'WAL'),(8,'RUG'),(9,'FUR'),(10,'FUR');

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

INSERT INTO `item` (`item_id`, `item_name`, `obtains`, `item_size`, `item_series_id`, `sell_price`) VALUES (1,'Apple Rug','Crafting','3x3',1,1200),(2,'Aqua Tile Flooring','Buy Nook\'s Cranny','1x1',NULL,225),(3,'Acnh Nintendo Switch','Order Nook Shopping','1x1',NULL,8990),(4,'Agent K.K.','Listen to K.K. Slider','1x1',2,800),(5,'Agrias Butterfly Model','Trade from Flick','1x1',3,9000),(6,'Cherry-blossom Branches','Crafting','2x2',4,4240),(7,'Cherry-blossom Clock','Crafting','1x1',4,2750),(8,'Cherry-blossom-petal Pile','Crafting','1x1',4,2000),(9,'Bamboo Bench','Crafting','2x1',5,1280),(10,'Bamboo Candleholder','Crafting','1x1',5,880),(100,'Cherry-blossom Petal','Cherry Blossom Festival','1x1',4,200),(101,'Clay','Hit rocks','1x1',NULL,100),(102,'Tree Branch','Shake trees','1x1',NULL,5),(103,'Iron Nugget','Hit rocks','1x1',NULL,275),(104,'Bamboo Piece','Hit bamboo with axe','1x1',NULL,200),(105,'Apple','Harvest from trees','1x1',1,100),(200,'Arapaima','Fishing','2x1',NULL,10000),(201,'Arowana','Fishing','1x1',NULL,10000),(202,'Bitterling','Fishing','1x1',NULL,900),(203,'Blowfish','Fishing','1x1',NULL,500),(250,'Bell Cricket','Catch bug','1x1',NULL,430),(251,'Blue Weevil Beetle','Catch bug','1x1',NULL,800),(252,'Brown Cicada','Catch bug','1x1',NULL,350),(253,'Damselfly','Catch bug','1x1',NULL,500),(300,'3D Glasses','Buy from Able Sisters','1x1',NULL,122),(301,'Apple Dress','Crafting','1x1',1,1600),(302,'Acid-washed Jeans','Buy from Able Sisters','1x1',NULL,330),(303,'Adventure Dress','Buy from Able Sisters','1x1',NULL,700),(304,'Apple Hat','Crafting','1x1',1,1000),(305,'Armor Shoes','Crafting','1x1',NULL,3000),(306,'Antique Boots','Buy from Able Sisters','1x1',NULL,660),(307,'Apron','Buy from Able Sisters','1x1',NULL,210);

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

INSERT INTO `item_color` (`item_id`, `color_id`) VALUES (9,1),(10,1),(307,1),(9,2),(10,2),(9,3),(10,3),(307,3),(302,5),(302,6),(307,7);

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

INSERT INTO `item_series` (`item_series_id`, `series_name`) VALUES (5,'Bamboo'),(4,'Cherry-blossom Festival'),(1,'Fruit'),(3,'Models'),(2,'Music');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_user`
--

INSERT INTO `my_user` (`user_id`, `user_name`) VALUES (1,'Laura'),(2,'Yanbo'),(3,'Jett'),(4,'Phoenix');

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

INSERT INTO `npc` (`npc_id`, `npc_name`, `gender`, `species`) VALUES (1,'Flick','M','Chameleon'),(2,'K.K. Slider','M','Dog'),(3,'Tom Nook','M','Tanuki'),(4,'Timmy&Tommy','M','Tanuki'),(5,'Mable','F','Hedgehog'),(100,'Marshal','M','Squirrel'),(101,'Raymond','M','Cat'),(102,'Marina','F','Octopus'),(103,'Merengue','F','Rhino'),(104,'Deirdre','F','Deer');

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

INSERT INTO `npc_gift` (`npc_id`, `diy_id`, `note`) VALUES (100,6,'Found crafting'),(102,8,'Found crafting'),(102,9,'Found crafting'),(103,9,'Found crafting'),(104,6,'Found crafting'),(104,7,'Found crafting'),(104,8,'Found crafting');

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

INSERT INTO `seller` (`npc_id`, `seller_time`) VALUES (3,'All day'),(4,'9am-9pm/9am-10pm'),(5,'9pm-9pm');

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

INSERT INTO `sp_event` (`event_id`, `event_name`, `event_description`) VALUES (1,'Cherry-blossom Festival','Trees turn pink, special recipes in eggs'),(2,'Spring','Bamboo recipes common'),(3,'Saturday Night Concert','K.K. Slider comes to sing'),(4,'Weekly visitor','NPC may come once a week');

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

INSERT INTO `special_npc` (`npc_id`, `task`, `event_id`) VALUES (1,'Buy your bugs and trade models',4),(2,'Request a song',3);

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

INSERT INTO `villager` (`villager_id`, `personality`, `birthday`) VALUES (100,'Smug','0000-09-29'),(101,'Smug','0000-10-01'),(102,'Normal','0000-06-26'),(103,'Normal','0000-03-19'),(104,'Sisterly','0000-05-04');

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
  KEY `user_id` (`user_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `my_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `wishlist_name`, `user_id`) VALUES (1,'Garden',1),(2,'Home',1),(3,'Wishlist',2),(4,'Random',3),(5,'Random2',3);

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

INSERT INTO `wishlist_item` (`list_id`, `item_id`) VALUES (2,1),(3,1),(4,1),(5,1),(3,2),(4,2),(5,2),(3,3),(4,3),(5,3),(3,4),(4,4),(1,5),(2,5),(3,5),(1,6),(3,6),(1,7),(3,7),(1,8),(3,8),(1,9),(3,9),(1,10),(3,10);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
