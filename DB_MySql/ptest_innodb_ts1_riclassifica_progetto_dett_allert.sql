CREATE DATABASE  IF NOT EXISTS `ptest_innodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ptest_innodb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ptest_innodb
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `ts1_riclassifica_progetto_dett_allert`
--

DROP TABLE IF EXISTS `ts1_riclassifica_progetto_dett_allert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts1_riclassifica_progetto_dett_allert` (
  `PK_PROGRESSIVO` int NOT NULL AUTO_INCREMENT,
  `FK_PARAM_PROGETTO_DETAIL` int NOT NULL DEFAULT '0',
  `FLAG_ATTIVO` char(1) NOT NULL DEFAULT 'N',
  `DATA_IN` date NOT NULL,
  `DATA_FI` date NOT NULL,
  `BUDGET` double NOT NULL DEFAULT '0',
  `BUDGET_UTILIZZATO` double NOT NULL DEFAULT '0',
  `FK_ANAG` int NOT NULL DEFAULT '0',
  `FLAG_EMAIL` char(1) NOT NULL DEFAULT 'N',
  `GG_ALLERT` smallint NOT NULL DEFAULT '15',
  PRIMARY KEY (`PK_PROGRESSIVO`),
  KEY `ts1_riclassifica_progetto_dett_allert_ibfk_1` (`FK_PARAM_PROGETTO_DETAIL`),
  CONSTRAINT `ts1_riclassifica_progetto_dett_allert_ibfk_1` FOREIGN KEY (`FK_PARAM_PROGETTO_DETAIL`) REFERENCES `ts1_riclassifica_progetto_detail` (`PK_PROGRESSIVO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts1_riclassifica_progetto_dett_allert`
--

LOCK TABLES `ts1_riclassifica_progetto_dett_allert` WRITE;
/*!40000 ALTER TABLE `ts1_riclassifica_progetto_dett_allert` DISABLE KEYS */;
INSERT INTO `ts1_riclassifica_progetto_dett_allert` VALUES (1,6,'S','2023-01-01','2023-06-30',25000,0,17,'S',15),(2,6,'S','2023-07-01','2023-12-31',15000,0,17,'S',15),(3,6,'S','2024-01-01','2024-04-30',5000,0,17,'S',15),(4,6,'S','2024-05-01','2024-10-31',7000,0,17,'S',15),(5,6,'S','2024-11-01','2024-12-31',8000,0,17,'S',15),(6,6,'S','2025-01-01','2025-06-30',25000,0,17,'S',15),(7,6,'S','2025-07-01','2025-12-31',15000,0,17,'S',15),(8,7,'S','2023-01-01','2023-06-30',50000,0,17,'S',15),(9,7,'S','2023-07-01','2023-12-31',75000,0,17,'F',15),(10,7,'S','2024-01-01','2024-04-30',30000,0,18,'F',15),(11,7,'S','2024-05-01','2024-10-31',90000,0,18,'S',15),(12,8,'S','2023-01-01','2023-12-31',10000,0,81,'S',15),(14,8,'S','2024-01-01','2024-12-31',7000,0,81,'S',15),(19,8,'S','2025-01-01','2025-12-31',2000,0,81,'S',15),(20,9,'S','2025-01-01','2025-12-31',5000,0,303,'S',20),(21,10,'S','2023-01-01','2023-12-31',15000,0,18,'S',15),(22,10,'S','2024-01-01','2024-12-31',7000,0,18,'S',15),(23,10,'S','2025-01-01','2025-12-31',3000,0,81,'S',15),(24,12,'S','2023-01-01','2023-02-28',10000,0,87,'S',15),(25,12,'S','2023-03-01','2023-06-30',8500,0,86,'N',15),(28,14,'S','2023-01-01','2025-12-31',2500,0,86,'S',15),(33,111,'S','2022-09-01','2023-12-31',30,0,0,'N',10);
/*!40000 ALTER TABLE `ts1_riclassifica_progetto_dett_allert` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 13:18:07
