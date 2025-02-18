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
-- Table structure for table `ts1_riclassifica_progetto`
--

DROP TABLE IF EXISTS `ts1_riclassifica_progetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts1_riclassifica_progetto` (
  `PK_PROGRESSIVO` int NOT NULL AUTO_INCREMENT,
  `FK_MACROGRUPPO` int NOT NULL DEFAULT '0',
  `FLAG_ATTIVO` char(1) NOT NULL DEFAULT 'S',
  `NOTE` varchar(300) DEFAULT NULL,
  `DEFINIZIONE_RICLASSIFICATO` varchar(250) NOT NULL,
  `NSAL_UFFICIALI` smallint NOT NULL DEFAULT '1',
  `NSAL_INTERNI` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`PK_PROGRESSIVO`),
  UNIQUE KEY `FK_MACROGRUPPO_UNIQUE` (`FK_MACROGRUPPO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts1_riclassifica_progetto`
--

LOCK TABLES `ts1_riclassifica_progetto` WRITE;
/*!40000 ALTER TABLE `ts1_riclassifica_progetto` DISABLE KEYS */;
INSERT INTO `ts1_riclassifica_progetto` VALUES (3,1,'S','Progetto finanziato con DM. XX/yy','MYSQL Rendicontazione PNR Ecosistema Marino e Costiero',8,12),(4,6,'S','Finanziamento XY','MYSQL Riclassificazione progetto CanCovid',4,8);
/*!40000 ALTER TABLE `ts1_riclassifica_progetto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-21 14:00:44
