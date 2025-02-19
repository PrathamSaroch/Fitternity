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
-- Table structure for table `payment_table`
--

DROP TABLE IF EXISTS `payment_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_table` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `owneremail` varchar(45) DEFAULT NULL,
  `useremail` varchar(45) DEFAULT NULL,
  `packageid` int DEFAULT NULL,
  `packagename` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `paymenttype` varchar(45) DEFAULT NULL,
  `startdate` varchar(45) DEFAULT NULL,
  `enddate` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`paymentid`),
  KEY `fk_packageid_idx` (`packageid`),
  CONSTRAINT `fk_packageid` FOREIGN KEY (`packageid`) REFERENCES `owner_packages_table` (`packageid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_table`
--

LOCK TABLES `payment_table` WRITE;
/*!40000 ALTER TABLE `payment_table` DISABLE KEYS */;
INSERT INTO `payment_table` VALUES (17,'nirbhay@gmail.com','kanishrajput123@gmail.com',5,'Basic Plan','1500','Online Payment','4/10/2023','5/10/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(18,'nirbhay@gmail.com','kanishrajput123@gmail.com',5,'Basic Plan','1500','Online Payment','4/10/2023','5/10/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(19,'nirbhay@gmail.com','kanishrajput123@gmail.com',5,'Basic Plan','1500','Online Payment','4/19/2023','5/19/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(20,'nirbhay@gmail.com','kanishrajput123@gmail.com',5,'Basic Plan','1500','Online Payment','4/18/2023','5/18/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(21,'nirbhay@gmail.com','kanishrajput123@gmail.com',5,'Basic Plan','1500','Online Payment','4/10/2023','5/10/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(22,'nirbhay@gmail.com','kanishrajput123@gmail.com',5,'Basic Plan','1500','Online Payment','4/10/2023','5/10/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(23,'nirbhay@gmail.com','Kanish@gmail.com',5,'Basic Plan','1500','Online Payment','4/18/2023','5/18/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(24,'nirbhay@gmail.com','meghasaroch44@gmail.com',5,'Basic Plan','1500','Online Payment','4/26/2023','5/26/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(25,'nirbhay@gmail.com','meghasaroch44@gmail.com',7,'Silver Plan','3000','Online Payment','5/3/2023','8/1/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(26,'nirbhay@gmail.com','meghasaroch44@gmail.com',7,'Silver Plan','3000','Online Payment','5/9/2023','8/7/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(27,'nirbhay@gmail.com','kanishrajput123@gmail.com',5,'Basic Plan','1500','Online Payment','5/17/2023','6/16/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(28,'nirbhay@gmail.com','Kanish@gmail.com',5,'Basic Plan','1500','Online Payment','6/6/2023','7/6/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(29,'nirbhay@gmail.com','Kanish@gmail.com',7,'Silver Plan','3000','Online Payment','7/11/2023','10/9/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(30,'nirbhay@gmail.com','kanish@gmail.com',5,'Basic Plan','1500','Online Payment','7/11/2023','8/10/2023','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003'),(31,'nirbhay@gmail.com','gurpreet@gmail.com',7,'Silver Plan','3000','Online Payment','2/20/2025','5/21/2025','6, opp. P.R. Automobiles, Shanti Nagar, Ulhasnagar, Maharashtra 421003');
/*!40000 ALTER TABLE `payment_table` ENABLE KEYS */;
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
