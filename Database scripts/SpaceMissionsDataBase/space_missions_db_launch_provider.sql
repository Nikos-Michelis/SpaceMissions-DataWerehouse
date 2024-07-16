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
-- Table structure for table `launch_provider`
--

DROP TABLE IF EXISTS `launch_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `launch_provider` (
  `provider_id` int NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `provider_type` varchar(255) NOT NULL,
  `provider_country_code` text NOT NULL,
  `provider_administrator` varchar(45) DEFAULT NULL,
  `founding_year` int DEFAULT NULL,
  `total_provider_launches` int NOT NULL,
  `consecutive_successful_launches` int NOT NULL,
  `successful_launches` int NOT NULL,
  `failed_launches` int NOT NULL,
  `pending_launches` int NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `launch_provider`
--

LOCK TABLES `launch_provider` WRITE;
/*!40000 ALTER TABLE `launch_provider` DISABLE KEYS */;
INSERT INTO `launch_provider` VALUES (12,'Brazilian Space Agency','Government','BRA','José Raimundo Coelho',1961,0,0,2,2,0),(27,'European Space Agency','Multinational','FRA,ITA,DEU,ESP,CHE,GBR,AUT,SWE,BEL,PRT,NLD,HUN,POL,DNK,CZE,ROU,NOR,FIN,GRC,EST,IRL,LUX','Director General: Josef Aschbacher',1975,4,5,1,6,1),(29,'German Aerospace Center','Government','DEU','Anke Kaysser-Pyzalla',1969,1,1,0,1,0),(31,'Indian Space Research Organization','Government','IND','Chairman: S. Somanath',1969,12,77,13,90,14),(34,'Iranian Space Agency','Government','IRN','Morteza Barari',2004,1,5,9,14,0),(35,'Israeli Space Agency','Government','ISR',NULL,NULL,1,5,2,7,0),(36,'Italian Space Agency','Government','ITA',NULL,NULL,3,3,0,3,0),(37,'Japan Aerospace Exploration Agency','Government','JPN','Administrator: Hiroshi Yamakawa',2003,1,32,4,36,4),(40,'Korean Committee of Space Technology','Government','PRK',NULL,NULL,1,1,3,4,0),(41,'Korea Aerospace Research Institute','Government','KOR','Cho Gwang-rae',1989,2,4,3,7,0),(44,'National Aeronautics and Space Administration','Government','USA','Administrator: Bill Nelson',1958,11,115,20,135,6),(46,'National Center of Space Research','Government','FRA','Jean-Yves Le Gall',1961,3,12,2,14,0),(63,'Russian Federal Space Agency (ROSCOSMOS)','Government','RUS','Administrator: Yuri Borisov',1992,46,311,11,322,10),(66,'Soviet Space Program','Government','RUS',NULL,1931,17,2285,168,2453,0),(80,'Boeing','Commercial','USA','Leanne Caret',2002,0,1,1,2,0),(82,'Lockheed Martin','Commercial','USA',NULL,1953,38,77,3,80,0),(88,'China Aerospace Science and Technology Corporation','Government','CHN','Chairman & President: Lei Fanpei',1999,11,458,14,472,7),(95,'Israel Aerospace Industries','Commercial','ISR',NULL,NULL,5,5,0,5,0),(96,'Khrunichev State Research and Production Space Center','Government','RUS','Director: Andrey Vladimirovich Kalinovskiy',1916,5,179,15,194,1),(98,'Mitsubishi Heavy Industries','Commercial','JPN','President: Seiji Izumisawa',1884,2,49,1,50,13),(100,'Orbital Sciences Corporation','Commercial','USA',NULL,NULL,0,65,7,72,0),(102,'Rockwell International','Commercial','USA',NULL,NULL,8,8,0,8,0),(106,'General Dynamics','Commercial','USA',NULL,NULL,7,9,2,11,0),(111,'Progress Rocket Space Center','Commercial','RUS','Dmitry Baranov',1996,3,44,1,45,0),(115,'Arianespace','Commercial','FRA','CEO: Stéphane Israël',1980,3,300,15,315,51),(117,'Eurockot Launch Services','Commercial','FRA,RUS',NULL,NULL,8,13,1,14,0),(118,'International Launch Services','Commercial','USA','Kirk Pysher',1995,8,40,2,42,0),(119,'ISC Kosmotras','Commercial','RUS',NULL,NULL,15,21,1,22,0),(121,'SpaceX','Commercial','USA','CEO: Elon Musk',2002,64,352,11,363,134),(122,'Sea Launch','Commercial','RUS',NULL,NULL,3,40,3,43,0),(123,'Starsem SA','Commercial','FRA,RUS',NULL,NULL,5,5,0,5,0),(124,'United Launch Alliance','Commercial','USA','CEO: Tory Bruno',2006,161,161,0,161,45),(141,'Blue Origin','Commercial','USA','CEO: Jeff Bezos',2000,2,24,1,25,2),(147,'Rocket Lab','Commercial','USA','CEO: Peter Beck',2006,6,43,4,47,27),(154,'Production Corporation Polyot','Commercial','RUS',NULL,NULL,21,55,2,57,0),(161,'United States Air Force','Government','USA','Commander-in-Chief: President of the US',1947,68,972,106,1078,0),(163,'Russian Aerospace Defence Forces','Government','RUS',NULL,NULL,17,20,2,22,0),(165,'US Army','Government','USA',NULL,NULL,1,1,0,1,0),(166,'US Navy','Government','USA',NULL,1963,0,3,15,18,0),(179,'Orbital ATK','Commercial','USA','President: David W. Thompson',2015,6,6,0,6,0),(183,'Unknown','Unknown','Unknown',NULL,NULL,0,0,0,0,1),(184,'China Aerospace Science and Industry Corporation','Government','CHN',NULL,NULL,5,5,0,5,0),(187,'GK Launch Services','Commercial','RUS','CEO: Alexander V. Serkin',2017,1,1,0,1,0),(189,'China Aerospace Corporation','Government','CHN',NULL,NULL,15,24,3,27,0),(190,'Antrix Corporation Limited','Commercial','IND',NULL,NULL,4,4,0,4,0),(191,'United Space Alliance','Commercial','USA',NULL,1995,22,50,1,51,0),(192,'Lockheed Space Operations Company','Commercial','USA',NULL,NULL,49,64,1,65,0),(193,'Russian Space Forces','Government','RUS','Commander: Aleksandr Golovko',1992,51,131,8,139,3),(194,'ExPace','Commercial','CHN','CEO: Zhang Di',2016,12,23,3,26,0),(195,'Sandia National Laboratories','Government','USA',NULL,NULL,0,0,1,1,0),(197,'Lockheed Martin Space Operations','Commercial','USA',NULL,NULL,9,9,0,9,0),(199,'Virgin Orbit','Commercial','USA','President: Dan Hart',2017,0,4,2,6,0),(228,'National Space Development Agency of Japan','Government','JPN',NULL,NULL,10,14,1,15,0),(257,'Northrop Grumman Space Systems','Commercial','USA','CEO: Kathy Warden',2015,14,14,0,14,5),(259,'LandSpace','Commercial','CHN','Zhang Changwu',2015,2,2,2,4,0),(263,'OneSpace','Commercial','CHN',NULL,NULL,0,0,1,1,0),(265,'Firefly Aerospace','Commercial','USA','Bill Weber',2014,0,2,2,4,1),(266,'Relativity Space','Commercial','USA','CEO: Tim Ellis',2015,0,0,1,1,3),(270,'Strategic Rocket Forces','Government','RUS',NULL,1959,1,12,3,15,0),(271,'Army Ballistic Missile Agency','Government','USA',NULL,NULL,0,5,7,12,0),(272,'China Rocket Co. Ltd.','Commercial','CHN',NULL,NULL,1,1,0,1,0),(274,'iSpace','Commercial','CHN',NULL,2016,2,3,3,6,0),(285,'Astra Space','Commercial','USA','CEO: Chris Kemp',2005,0,2,5,7,0),(1001,'EXOS Aerospace','Commercial','USA','President: David Mitchell',2014,0,0,4,4,0),(1002,'Interstellar Technologies','Commercial','JPN','President: Takahiro Inagawa',2005,2,3,4,7,1),(1004,'Convair','Commercial','USA',NULL,1943,1,1,0,1,0),(1005,'Royal Aircraft Establishment','Government','GBR',NULL,1904,1,1,1,2,0),(1007,'Space Services Inc.','Commercial','USA',NULL,NULL,0,0,1,1,0),(1009,'Institute of Space and Astronautical Science','Government','JPN',NULL,NULL,1,24,8,32,0),(1013,'Makeyev Rocket Design Bureau','Commercial','RUS',NULL,1947,1,2,1,3,0),(1014,'Martin Marietta','Commercial','USA',NULL,1961,4,4,0,4,0),(1015,'European Launcher Development Organisation','Government','FRA,ITA,DEU,GBR,BEL,NLD,AUS',NULL,1961,0,0,4,4,0),(1016,'Weapons Research Establishment','Government','AUS',NULL,1955,1,1,0,1,0),(1017,'Science and Engineering Research Council','Government','GBR',NULL,1965,6,6,0,6,0),(1018,'National Research Council','Government','ITA','President: Maria Chiara Carrozza',1923,2,2,0,2,0),(1019,'European Space Research Organisation','Multinational','FRA,ITA,DEU,ESP,CHE,GBR,SWE,BEL,NLD,DNK',NULL,1964,4,4,1,5,0),(1021,'Galactic Energy','Commercial','CHN',NULL,2018,1,10,1,11,2),(1024,'Virgin Galactic','Private','USA','Founder: Richard Branson',2004,10,61,5,66,1),(1029,'TiSPACE','Private','TWN','Dr. Yen-Sen Chen',2016,0,0,1,1,0),(1030,'ABL Space Systems','Commercial','USA','CEO: Harry O\'Hanley',2017,0,0,1,1,1),(1032,'Islamic Revolutionary Guard Corps Aerospace Force','Government','IRN','Brigadier General Ali Jafarabadi',1985,2,4,1,5,0),(1033,'Orbex','Commercial','GBR','CEO: Martin Coates',2015,0,0,0,0,1),(1035,'Seventh Ministry of Machine Building Industry','Government','CHN',NULL,1964,1,9,5,14,0),(1036,'Ministry of Space Industry','Government','CHN',NULL,1982,8,10,1,11,0),(1037,'Ministry of Aerospace Industry','Government','CHN',NULL,1988,0,11,2,13,0),(1038,'Equatorial Launch Australia','Commercial','AUS','CEO: Michael Jones',2015,3,3,0,3,0),(1040,'CAS Space','Commercial','CHN',NULL,2018,3,3,0,3,0),(1042,'Skyrora','Private','GBR','CEO: Volodymyr Lvykin',2017,0,0,0,0,1),(1045,'Rocket Factory Augsburg','Private','DEU','COO: Stefan Brieschenk',2018,0,0,0,0,1),(1046,'Isar Aerospace','Private','DEU','CEO: Daniel Metzler',2018,0,0,0,0,1),(1049,'Space Pioneer','Commercial','CHN','CEO: Kang Yonglai',2015,1,1,0,1,0),(1051,'Payload Aerospace S.L.','Commercial','ESP','CEO: Raúl Torres',2011,1,1,0,1,1),(1066,'HyImpulse','Private','DEU','CEO: Mario Kobald',2018,1,1,0,1,0),(1074,'National Aerospace Development Administration','Government','PRK',NULL,2013,1,2,2,4,0),(1079,'Agency for Defense Development','Government','KOR',NULL,1970,1,1,0,1,0),(1080,'Orienspace Technology','Commercial','CHN',NULL,2020,1,1,0,1,0),(1083,'Space One','Commercial','JPN',NULL,2018,0,0,1,1,0);
/*!40000 ALTER TABLE `launch_provider` ENABLE KEYS */;
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
