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
-- Table structure for table `orbit`
--

DROP TABLE IF EXISTS `orbit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orbit` (
  `orbit_id` int NOT NULL,
  `orbit_name` varchar(45) NOT NULL,
  `orbit_abbrev` varchar(45) NOT NULL,
  PRIMARY KEY (`orbit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orbit`
--

LOCK TABLES `orbit` WRITE;
/*!40000 ALTER TABLE `orbit` DISABLE KEYS */;
INSERT INTO `orbit` VALUES (1,'Elliptical Orbit','Elliptical'),(2,'Geostationary Orbit','Direct-GEO'),(3,'Geostationary Transfer Orbit','GTO'),(4,'Geosynchronous Orbit','GSO'),(5,'Geosynchronous Transfer Orbit','GSTO'),(6,'Heliocentric L1','L1-point'),(7,'Heliocentric N/A','Helio-N/A'),(8,'High Earth Orbit','HEO'),(9,'Low Earth Orbit','LEO'),(10,'Lunar flyby','Lunar flyby'),(11,'Lunar Impactor','Lunar Impactor'),(12,'Lunar Orbit','LO'),(13,'Medium Earth Orbit','MEO'),(14,'Polar Orbit','PO'),(15,'Solar Escape Trajectory','Solar Esc.'),(16,'Suborbital','Sub'),(17,'Sun-Earth L2','L2'),(18,'Sun-Synchronous Orbit','SSO'),(19,'Supersynchronous Transfer Orbit','Super-GTO'),(20,'Mars Orbit','Mars'),(21,'Venus Orbit','Venus'),(22,'Asteroid','Asteroid'),(23,'Venus flyby','Venus flyby'),(24,'Mars flyby','Mars flyby'),(25,'Mercury flyby','Mercury flyby'),(26,'Unknown','N/A'),(27,'Enhanced Geostationary Transfer Orbit','Enhanced-GTO'),(28,'Jupiter Orbit','Jupiter Orbit');
/*!40000 ALTER TABLE `orbit` ENABLE KEYS */;
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
