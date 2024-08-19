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
-- Table structure for table `combobox_test`
--

DROP TABLE IF EXISTS `combobox_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combobox_test` (
  `PK_1` int NOT NULL,
  `PK_2` int NOT NULL,
  `PK_3` int NOT NULL,
  UNIQUE KEY `PK_1` (`PK_1`,`PK_2`,`PK_3`),
  KEY `PK_2` (`PK_2`),
  KEY `PK_3` (`PK_3`),
  CONSTRAINT `combobox_test_ibfk_1` FOREIGN KEY (`PK_1`) REFERENCES `ts1_riclassifica_progetto` (`PK_PROGRESSIVO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `combobox_test_ibfk_2` FOREIGN KEY (`PK_2`) REFERENCES `ts1_riclassifica_progetto_detail` (`PK_PROGRESSIVO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `combobox_test_ibfk_3` FOREIGN KEY (`PK_3`) REFERENCES `ts1_riclassifica_progetto_dett_allert` (`PK_PROGRESSIVO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combobox_test`
--

LOCK TABLES `combobox_test` WRITE;
/*!40000 ALTER TABLE `combobox_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `combobox_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 13:03:50
