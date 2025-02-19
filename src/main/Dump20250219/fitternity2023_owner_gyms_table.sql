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
-- Table structure for table `owner_gyms_table`
--

DROP TABLE IF EXISTS `owner_gyms_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner_gyms_table` (
  `gymid` int NOT NULL AUTO_INCREMENT,
  `owneremail` varchar(45) DEFAULT NULL,
  `gymname` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitute` varchar(45) DEFAULT NULL,
  `pool` varchar(45) DEFAULT NULL,
  `sauna` varchar(45) DEFAULT NULL,
  `changing_room` varchar(45) DEFAULT NULL,
  `lockers` varchar(45) DEFAULT NULL,
  `parking_facility` varchar(45) DEFAULT NULL,
  `ac` varchar(45) DEFAULT NULL,
  `shower` varchar(45) DEFAULT NULL,
  `washroom` varchar(45) DEFAULT NULL,
  `waterfacility` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gymid`),
  KEY `fk_owneremail_idx` (`owneremail`),
  CONSTRAINT `fk_owneremail` FOREIGN KEY (`owneremail`) REFERENCES `owner_table` (`owneremail`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner_gyms_table`
--

LOCK TABLES `owner_gyms_table` WRITE;
/*!40000 ALTER TABLE `owner_gyms_table` DISABLE KEYS */;
INSERT INTO `owner_gyms_table` VALUES (4,'nirbhay@gmail.com','Mahabali Gold','../myuploads/1680205827657.jpg','Mumbai','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003','31.636533377444717','74.87414478806349','True','True','True','True','False','True','True','False','True'),(10,'nirbhay@gmail.com','Pulse Gold','../myuploads/1680260444883.jpg','Bangalore','Akshaya Nagar 1st Block, Akshya Nagar, Ramamurthy Nagar','13.028603671152457','77.67961033036298','True','False','True','True','True','True','True','False','True'),(14,'subroto@gmail.com','Fit City Energy','../myuploads/1680451587355.jpg','Bangalore','No: 26,2nd floor, Jawaharlal Nehru Rd, BEML Layout 3rd Stage, Rajarajeshwari Nagar','12.927193041009861','77.51938382776024','False','True','False','True','True','True','True','False','True'),(15,'vasu@gmail.com','Fitness Freaks Anytime','../myuploads/1680452233535.jpg','Bangalore','3rd floor, Janatha school down, 4/3 9th Cross, 2nd Main Rd, Chamrajpet','12.966656583956013','77.55886570809753','True','False','True','False','True','True','True','True','False');
/*!40000 ALTER TABLE `owner_gyms_table` ENABLE KEYS */;
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
