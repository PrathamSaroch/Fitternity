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
-- Table structure for table `owner_table`
--

DROP TABLE IF EXISTS `owner_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner_table` (
  `ownername` varchar(45) NOT NULL,
  `owneremail` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `phoneno` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `franchisename` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`owneremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner_table`
--

LOCK TABLES `owner_table` WRITE;
/*!40000 ALTER TABLE `owner_table` DISABLE KEYS */;
INSERT INTO `owner_table` VALUES ('Aryan','aryan@gmail.com','123','Mumbai','1234567890','Approved','Stay Fit','../myuploads/1680262507310.jpg'),('Jasman','jasman@gmail.com','123','Bangalore','1234567890','Approved','Hammer Gym','../myuploads/1680262507310.jpg'),('Nirbhay','nirbhay@gmail.com','123','Mumbai','1234567890','Approved','Gold Gym','../myuploads/1680157808277.jpg'),('Subhroto','subroto@gmail.com','123','Bangalore','1234567890','Approved','Energy Fitness','../myuploads/1680451155840.jpg'),('Tania','tania@gmail.com','123','Mumbai','1234567890','Approved','Cult Fitness','../myuploads/1680262507310.jpg'),('Vasu','vasu@gmail.com','123','Chennai','1234567890','Approved','Anytime Fitness','../myuploads/1680262507310.jpg');
/*!40000 ALTER TABLE `owner_table` ENABLE KEYS */;
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
