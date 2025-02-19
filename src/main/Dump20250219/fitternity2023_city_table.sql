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
-- Table structure for table `city_table`
--

DROP TABLE IF EXISTS `city_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_table` (
  `cityname` varchar(45) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `desc` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`cityname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_table`
--

LOCK TABLES `city_table` WRITE;
/*!40000 ALTER TABLE `city_table` DISABLE KEYS */;
INSERT INTO `city_table` VALUES ('Bangalore','../myuploads/1680112171081.jpg','A gym is a place where people go to train and exercise, but also to unwind, socialize, and recharge. Therefore, a good gym is a facility that promotes physical activity, provides a safe, functional, and comfortable workout environment, and creates a pleasant and enjoyable atmosphere for recreation and socialization'),('Chennai','../myuploads/1680112264972.jpg','Nowadays, everyone is obsessed with having a good body. Dieting, exercising and lots of stuff they do to achieve their goal. Gym memberships usually grow especially after the holidays when people eat so much. Then they go to the gym to burn the fat.'),('Mumbai','../myuploads/1680112332551.jpg','“The Advantages of Going to the Gym Every Day”, says at least 30 minutes of moderate exercise should be done by adults five days in a week so going to the gym everyday will meet that goal. It will result in good physical and mental health.'),('Pune','../myuploads/1680113586291.jpg','However, every person would like to go to the gym that has a wide range of available equipment.  This equipment must be new, and professional. It must also be completely safe for every visitor.');
/*!40000 ALTER TABLE `city_table` ENABLE KEYS */;
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
