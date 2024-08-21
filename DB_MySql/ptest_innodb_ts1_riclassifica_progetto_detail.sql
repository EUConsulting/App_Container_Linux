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
-- Table structure for table `ts1_riclassifica_progetto_detail`
--

DROP TABLE IF EXISTS `ts1_riclassifica_progetto_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts1_riclassifica_progetto_detail` (
  `PK_PROGRESSIVO` int NOT NULL AUTO_INCREMENT,
  `FK_PARAM_PROGETTO` int NOT NULL DEFAULT '0',
  `FK_TIPO_COSTO` int NOT NULL DEFAULT '0',
  `FLAG_ATTIVO` char(1) NOT NULL DEFAULT 'N',
  `DATA_IN` date NOT NULL,
  `DATA_FI` date NOT NULL,
  `BUDGET` double NOT NULL DEFAULT '0',
  `BUDGET_UTILIZZATO` double NOT NULL DEFAULT '0',
  `QUOTA_DETRAIBILE` float NOT NULL DEFAULT '100',
  `GG_TMP` smallint GENERATED ALWAYS AS ((`DATA_FI` - `DATA_IN`)) VIRTUAL,
  `BUDGET_GG_TMP` double GENERATED ALWAYS AS ((`BUDGET` / `GG_TMP`)) VIRTUAL,
  `BUDGET_TMP_CALCOLI` double NOT NULL DEFAULT '0',
  `DATA_IN_TMP` date NOT NULL,
  `FK_ANAG` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PK_PROGRESSIVO`),
  KEY `FK_PARAM_PROGETTO` (`FK_PARAM_PROGETTO`),
  CONSTRAINT `ts1_riclassifica_progetto_detail_ibfk_1` FOREIGN KEY (`FK_PARAM_PROGETTO`) REFERENCES `ts1_riclassifica_progetto` (`PK_PROGRESSIVO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts1_riclassifica_progetto_detail`
--

LOCK TABLES `ts1_riclassifica_progetto_detail` WRITE;
/*!40000 ALTER TABLE `ts1_riclassifica_progetto_detail` DISABLE KEYS */;
INSERT INTO `ts1_riclassifica_progetto_detail` (`PK_PROGRESSIVO`, `FK_PARAM_PROGETTO`, `FK_TIPO_COSTO`, `FLAG_ATTIVO`, `DATA_IN`, `DATA_FI`, `BUDGET`, `BUDGET_UTILIZZATO`, `QUOTA_DETRAIBILE`, `BUDGET_TMP_CALCOLI`, `DATA_IN_TMP`, `FK_ANAG`) VALUES (6,3,8,'S','2023-01-01','2025-12-31',100000,0,100,0,'2024-04-23',0),(7,3,14,'S','2023-01-01','2024-10-31',250000,10630,100,0,'2023-01-01',0),(8,3,15,'S','2023-01-01','2025-12-31',20000,2200,100,0,'2023-01-01',0),(9,3,16,'S','2023-01-01','2025-12-31',5000,0,50,0,'2023-01-01',0),(10,3,18,'S','2023-01-01','2025-12-31',25000,12371,75,0,'2023-01-01',0),(12,3,20,'S','2023-01-01','2023-06-30',18500,3035,75,0,'2023-01-01',0),(13,3,23,'S','2023-01-01','2025-12-31',5000,37,50,0,'2024-04-23',0),(14,3,24,'S','2023-01-01','2025-12-31',2500,0,50,0,'2023-01-01',0),(15,4,8,'S','2022-09-01','2023-12-31',3353,0,100,0,'1858-11-17',0),(16,4,14,'S','2022-09-01','2023-12-31',20000,1000,100,0,'2024-07-18',18),(104,4,15,'N','2022-09-01','2023-12-31',10,0,100,0,'2024-07-18',0),(111,4,19,'S','2022-09-01','2023-12-31',30,0,100,0,'2024-07-16',0);
/*!40000 ALTER TABLE `ts1_riclassifica_progetto_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-21 14:00:45
