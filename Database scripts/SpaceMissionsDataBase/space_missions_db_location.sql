-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: space_missions_db
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `location_country_code` varchar(45) NOT NULL,
  `locations_map_image` varchar(255) NOT NULL,
  `location_timezone` varchar(45) DEFAULT NULL,
  `total_location_launch` int NOT NULL,
  `total_landing` int NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Kauai, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_1_20200803142427.jpg','Pacific/Honolulu',1,0),(2,'Semnan Space Center, Islamic Republic of Iran','IRN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_2_20200803142458.jpg','Asia/Tehran',14,0),(3,'Sea Launch','Unknown','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_3_20200803142448.jpg',NULL,49,0),(4,'Palmachim Airbase, State of Israel','ISR','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_4_20200803142418.jpg','Asia/Jerusalem',12,0),(5,'Dombarovskiy, Russian Federation','RUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_5_20200803142425.jpg','Asia/Yekaterinburg',10,0),(6,'Plesetsk Cosmodrome, Russian Federation','RUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_6_20200803142434.jpg','Europe/Moscow',1668,0),(7,'Sohae Satellite Launching Station,  Cholsan County, North Pyongan Province, Democratic People\'s Republic of Korea','PRK','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_7_20200803142414.jpg','Asia/Pyongyang',6,0),(8,'Wenchang Space Launch Site, People\'s Republic of China','CHN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_8_20200803142445.jpg','Asia/Shanghai',29,0),(9,'Naro Space Center, South Korea','KOR','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_9_20200803142441.jpg','Asia/Seoul',7,0),(10,'Onenui Station, Mahia Peninsula, New Zealand','NZL','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_10_20200803142509.jpg','Pacific/Auckland',43,17),(11,'Vandenberg SFB, CA, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_11_20200803142416.jpg','America/Los_Angeles',755,18),(12,'Cape Canaveral, FL, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg','America/New_York',953,51),(13,'Guiana Space Centre, French Guiana','GUF','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_13_20200803142412.jpg','America/Cayenne',320,0),(14,'Satish Dhawan Space Centre, India','IND','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_14_20200803142403.jpg','Asia/Kolkata',94,0),(15,'Baikonur Cosmodrome, Republic of Kazakhstan','KAZ','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_15_20200803142517.jpg','Asia/Qyzylorda',1548,0),(16,'Xichang Satellite Launch Center, People\'s Republic of China','CHN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_16_20200803142513.jpg','Asia/Shanghai',205,0),(17,'Jiuquan Satellite Launch Center, People\'s Republic of China','CHN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_17_20200803142429.jpg','Asia/Shanghai',225,0),(18,'Vostochny Cosmodrome, Siberia, Russian Federation','RUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_18_20200803142401.jpg','Asia/Yakutsk',17,0),(19,'Taiyuan Satellite Launch Center, People\'s Republic of China','CHN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_19_20200803142421.jpg','Asia/Shanghai',126,0),(20,'Air launch to orbit','Unknown','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_20_20200803142433.jpg',NULL,51,0),(21,'Wallops Island, Virginia, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_21_20200803142423.jpg','America/New_York',78,0),(24,'Uchinoura Space Center, Japan','JPN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_24_20200803142411.jpg','Asia/Tokyo',43,0),(25,'Pacific Spaceport Complex, Alaska, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_25_20200803142500.jpg','America/Anchorage',9,0),(26,'Tanegashima Space Center, Japan','JPN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_26_20200803142507.jpg','Asia/Tokyo',90,0),(27,'Kennedy Space Center, FL, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg','America/New_York',237,0),(29,'Corn Ranch, Van Horn, TX, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_29_20200803142436.jpg','America/Chicago',25,25),(30,'Kapustin Yar, Russian Federation','RUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_30_20200803142515.jpg','Europe/Volgograd',101,0),(31,'Spaceport America, NM, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_31_20200803142505.jpg','America/Denver',4,4),(32,'Hokkaido Spaceport, Japan','JPN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_32_20200803142407.jpg','Asia/Tokyo',7,0),(142,'Ronald Reagan Ballistic Missile Defense Test Site, Kwajalein Atoll, Marshall Islands','MHL','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_142_20200803142511.jpg','Pacific/Tarawa',5,0),(143,'SpaceX Starbase, TX, USA','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_143_20200803142438.jpg','America/Chicago',12,9),(144,'Air launch to Suborbital flight','Unknown','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_144_20200803142439.jpg',NULL,85,0),(145,'Shahrud Missile Test Site, Islamic Republic of Iran','IRN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_145_20200803142443.jpg','Asia/Tehran',5,0),(146,'Svobodny Cosmodrome, Russian Federation','RUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_146_20200803142450.jpg','Asia/Yakutsk',5,0),(147,'Interarmy Special Vehicles Test Centre, French Algeria','FRA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_147_20200803142452.jpg','Africa/Algiers',4,0),(150,'Alcântara Launch Center, Federative Republic of Brazil','BRA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_150_20200803142405.jpg','America/Fortaleza',2,0),(151,'Broglio Space Center, Kenya','ITA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_151_20200803142409.jpg','Africa/Nairobi',9,0),(152,'RAAF Woomera Range Complex','AUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_152_20200803142502.jpg','Australia/Adelaide',6,0),(153,'Tonghae Satellite Launching Ground','PRK','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_153_20200803142503.jpg','Asia/Pyongyang',2,0),(155,'White Sands Missile Range','USA','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_white_sands_missile_range_20210901072636.jpg','America/Denver',5,0),(156,'Whalers Way Orbital Launch Complex, South Australia','AUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_whalers_way_orbital_launch_complex_20210910042508.jpg','Australia/Adelaide',1,0),(157,'SaxaVord Spaceport','GBR','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_saxavord_spaceport_20211102161146.jpg','Europe/London',0,0),(159,'Sutherland Spaceport','GBR','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_sutherland_spaceport_20220511180155.jpg','Europe/London',0,0),(160,'Arnhem Space Centre','AUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_arnhem_space_centre_20220622160552.jpg','Australia/Darwin',3,0),(161,'Andøya Spaceport','NOR','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_161_20240109072235.jpg','Europe/Oslo',0,0),(163,'El Arenosillo Test Centre','ESP','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_163_20240111100612.jpg','Europe/Madrid',1,0),(164,'Koonibba Test Range, South Australia','AUS','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_koonibba_test_range252c_south_australia_20231114184328.jpg','Australia/Adelaide',1,0),(165,'Jeju Island, South Korea','KOR','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_jeju_island252c_south_korea_20231204142212.jpg','Asia/Seoul',1,0),(166,'Space Port Kii, Japan','JPN','https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_space_port_kii252c_japan_20240126073749.jpg','Asia/Tokyo',1,0);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01 18:11:32
