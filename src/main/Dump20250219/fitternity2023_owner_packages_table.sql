CREATE DATABASE  IF NOT EXISTS `fitternity2023` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitternity2023`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: fitternity2023
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `owner_packages_table`
--

DROP TABLE IF EXISTS `owner_packages_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner_packages_table` (
  `packageid` int NOT NULL AUTO_INCREMENT,
  `packagename` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `offerprice` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `desc` varchar(400) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `gymid` int DEFAULT NULL,
  PRIMARY KEY (`packageid`),
  KEY `fk_gymid_idx` (`gymid`),
  CONSTRAINT `fk_gymid2` FOREIGN KEY (`gymid`) REFERENCES `owner_gyms_table` (`gymid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner_packages_table`
--

LOCK TABLES `owner_packages_table` WRITE;
/*!40000 ALTER TABLE `owner_packages_table` DISABLE KEYS */;
INSERT INTO `owner_packages_table` VALUES (5,'Basic Plan','2000','1500','30','It\'s a basic plan which include 30 days of personal training with full guidance under best coaches.','../myuploads/1680285608820.jpg',4),(7,'Silver Plan','4000','3000','90','A good gym is a facility that promotes physical activity, provides a safe, functional, and comfortable workout environment','../myuploads/1680287094935.jpg',4);
/*!40000 ALTER TABLE `owner_packages_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19 20:40:07
