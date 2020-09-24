-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `eshop`
--

/*!40000 DROP DATABASE IF EXISTS `eshop`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `eshop`;

--
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faktura` (
  `fakturanummer` int NOT NULL,
  `kundId` int NOT NULL,
  `pris` int NOT NULL,
  `datum` date DEFAULT NULL,
  `orderId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fakturanummer`),
  KEY `kundId` (`kundId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `faktura_ibfk_1` FOREIGN KEY (`kundId`) REFERENCES `kund` (`id`),
  CONSTRAINT `faktura_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakturarader`
--

DROP TABLE IF EXISTS `fakturarader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fakturarader` (
  `antprodukter1` int NOT NULL,
  `fakturanummer1` int NOT NULL,
  `produktId` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`fakturanummer1`,`produktId`),
  KEY `produktId` (`produktId`),
  CONSTRAINT `fakturarader_ibfk_1` FOREIGN KEY (`produktId`) REFERENCES `produkt` (`id`),
  CONSTRAINT `fakturarader_ibfk_2` FOREIGN KEY (`fakturanummer1`) REFERENCES `faktura` (`fakturanummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakturarader`
--

LOCK TABLES `fakturarader` WRITE;
/*!40000 ALTER TABLE `fakturarader` DISABLE KEYS */;
/*!40000 ALTER TABLE `fakturarader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id` varchar(40) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('kaffe'),('kaffebland'),('mugg'),('porslin'),('te');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund`
--

DROP TABLE IF EXISTS `kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kund` (
  `id` int NOT NULL,
  `fornamn` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `efternamn` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `adress` varchar(80) COLLATE utf8_swedish_ci NOT NULL,
  `postnummer` int NOT NULL,
  `ort` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `land` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `fodd` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund`
--

LOCK TABLES `kund` WRITE;
/*!40000 ALTER TABLE `kund` DISABLE KEYS */;
INSERT INTO `kund` VALUES (1,'Mikael ','Roos','Centrumgatan 1',11522,'Avesta','Sverige','070 42 42 42','0000-00-00'),(2,'John','Doe','Skogen 1',17443,'Sundbyberg','Sverige','070 555 555','0000-00-00'),(3,'Jane','Doe','Skogen 1',77551,'Syva','Norge','070 556 556','2001-01-00'),(4,'Mumintrollet','Mumin','skogen 3',25964,'huga','Danmark','070 111 111','2009-11-01');
/*!40000 ALTER TABLE `kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lagerhylla`
--

DROP TABLE IF EXISTS `lagerhylla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lagerhylla` (
  `plats1` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`plats1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lagerhylla`
--

LOCK TABLES `lagerhylla` WRITE;
/*!40000 ALTER TABLE `lagerhylla` DISABLE KEYS */;
INSERT INTO `lagerhylla` VALUES ('A:101'),('B:101'),('C:101');
/*!40000 ALTER TABLE `lagerhylla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logg`
--

DROP TABLE IF EXISTS `logg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `when` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `what` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `produkt` char(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `prodnamn` varchar(40) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg`
--

LOCK TABLES `logg` WRITE;
/*!40000 ALTER TABLE `logg` DISABLE KEYS */;
INSERT INTO `logg` VALUES (1,'2020-03-27 19:05:52','addera produkt','cappuccino5','Kaffemugg med dbwebb-tryck'),(2,'2020-03-27 19:05:52','ta bort produkt','cappuccino5','Kaffemugg med dbwebb-tryck'),(3,'2020-03-27 19:06:01','addera produkt','kaffe1','Kaffemugg med dbwebb-tryck '),(4,'2020-03-27 19:06:01','addera produkt','te1','Temugg med dbwebb-tryck '),(5,'2020-03-27 19:06:01','addera produkt','kaffemix1','Kaffeblandning med dbwebb-krydda '),(6,'2020-03-27 19:07:26','addera produkt','fa','f'),(7,'2020-03-27 19:07:32','uppdatera','fa','f'),(8,'2020-03-27 19:07:37','ta bort produkt','fa','f'),(9,'2020-03-27 19:20:43','addera produkt','f','fgf'),(10,'2020-03-27 19:20:49','ta bort produkt','f','fgf');
/*!40000 ALTER TABLE `logg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kundId` int NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  `orderd` datetime DEFAULT NULL,
  `delivered` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kundId` (`kundId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`kundId`) REFERENCES `kund` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (2,1,'2020-03-27 19:09:35','2020-03-27 20:07:10',NULL,'2020-03-27 21:07:10','2020-03-27 20:26:07'),(4,2,'2020-03-27 19:23:02','2020-03-27 20:07:10',NULL,'2020-03-27 21:07:10','2020-03-27 20:44:52'),(5,4,'2020-03-27 19:33:40','2020-03-27 20:07:10',NULL,'2020-03-27 21:07:10','2020-03-27 20:34:15'),(6,2,'2020-03-27 20:10:36',NULL,NULL,NULL,NULL),(7,4,'2020-03-27 20:10:42','2020-03-27 20:14:21',NULL,NULL,'2020-03-27 21:14:21');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderrader`
--

DROP TABLE IF EXISTS `orderrader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderrader` (
  `antprodukter` int NOT NULL,
  `orderId` int NOT NULL,
  `produktId` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  KEY `orderId` (`orderId`),
  KEY `produktId` (`produktId`),
  CONSTRAINT `orderrader_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`),
  CONSTRAINT `orderrader_ibfk_2` FOREIGN KEY (`produktId`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderrader`
--

LOCK TABLES `orderrader` WRITE;
/*!40000 ALTER TABLE `orderrader` DISABLE KEYS */;
INSERT INTO `orderrader` VALUES (1,2,'kaffemix1'),(0,2,'kaffe1'),(1,2,'kaffe1'),(50,4,'kaffe1'),(100,4,'kaffemix1'),(240,5,'kaffe1'),(1,5,'kaffemix1'),(1,5,'kaffe1'),(12,5,'kaffe1'),(1,7,'te1'),(12,7,'te1'),(18,7,'kaffe1');
/*!40000 ALTER TABLE `orderrader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt` (
  `id` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `pris` int NOT NULL,
  `prodnamn` varchar(40) COLLATE utf8_swedish_ci NOT NULL,
  `bildlank` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `beskrivning` varchar(100) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES ('kaffe1',69,'Kaffemugg med dbwebb-tryck ','/img/eshop/kaffekopp.png','En vacker snovit keramisk kaffemugg.'),('kaffemix1',49,'Kaffeblandning med dbwebb-krydda ','/img/eshop/kaffe.png','En egenbryggd kaffeblandning for aktiva studiedagara, utan paus, spetsad med dbwebb-krydda.'),('te1',79,'Temugg med dbwebb-tryck ','/img/eshop/temugg.png','En stotlig matt helsvart temugg, extra stor, med gron dbwebb-logo.');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `addera_produkt_logg` AFTER INSERT ON `produkt` FOR EACH ROW BEGIN
    INSERT INTO logg (`what`, `produkt`, `prodnamn`)
    VALUES ('addera produkt',  NEW.id, NEW.prodnamn);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `uppdatera_produkt_logg` AFTER UPDATE ON `produkt` FOR EACH ROW INSERT INTO logg (`what`, `produkt`, `prodnamn`)
        VALUES ('uppdatera', NEW.id, NEW.prodnamn) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `tabort_produkt_logg` AFTER DELETE ON `produkt` FOR EACH ROW BEGIN
    INSERT INTO logg (`what`, `produkt`, `prodnamn`)
    VALUES ('ta bort produkt', OLD.id, OLD.prodnamn);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produkt2kategori`
--

DROP TABLE IF EXISTS `produkt2kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt2kategori` (
  `produkt_id` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `kategori_id` varchar(40) COLLATE utf8_swedish_ci NOT NULL,
  KEY `produkt_id` (`produkt_id`),
  KEY `kategori_id` (`kategori_id`),
  CONSTRAINT `produkt2kategori_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`),
  CONSTRAINT `produkt2kategori_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2kategori`
--

LOCK TABLES `produkt2kategori` WRITE;
/*!40000 ALTER TABLE `produkt2kategori` DISABLE KEYS */;
INSERT INTO `produkt2kategori` VALUES ('kaffe1','kaffe'),('kaffe1','mugg'),('kaffe1','porslin'),('te1','te'),('kaffemix1','kaffebland'),('kaffemix1','kaffe'),('te1','mugg');
/*!40000 ALTER TABLE `produkt2kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt2lager`
--

DROP TABLE IF EXISTS `produkt2lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt2lager` (
  `produkt_id` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `plats` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `antal` int DEFAULT NULL,
  KEY `produkt_id` (`produkt_id`),
  KEY `plats` (`plats`),
  CONSTRAINT `produkt2lager_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`),
  CONSTRAINT `produkt2lager_ibfk_2` FOREIGN KEY (`plats`) REFERENCES `lagerhylla` (`plats1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2lager`
--

LOCK TABLES `produkt2lager` WRITE;
/*!40000 ALTER TABLE `produkt2lager` DISABLE KEYS */;
INSERT INTO `produkt2lager` VALUES ('kaffe1','A:101',7),('te1','B:101',12),('kaffemix1','C:101',20);
/*!40000 ALTER TABLE `produkt2lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `produkter_i_lagret`
--

DROP TABLE IF EXISTS `produkter_i_lagret`;
/*!50001 DROP VIEW IF EXISTS `produkter_i_lagret`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `produkter_i_lagret` AS SELECT 
 1 AS `id`,
 1 AS `namn`,
 1 AS `plats`,
 1 AS `antal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `akronym` char(8) NOT NULL,
  `password` char(32) DEFAULT NULL,
  PRIMARY KEY (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3'),('doe','2829fc16ad8ca5a79da932f910afad1c');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eshop'
--
/*!50003 DROP FUNCTION IF EXISTS `order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` FUNCTION `order_status`(
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    orderd  TIMESTAMP,
    delivered TIMESTAMP
) RETURNS varchar(20) CHARSET utf8mb4
    NO SQL
BEGIN
    IF delivered IS NOT NULL THEN
    RETURN "deliverd";
    ELSEIF orderd IS NOT NULL THEN
    RETURN "orderd";
    ELSEIF deleted IS NOT NULL THEN
    RETURN "deleted";
    ELSEIF updated != created THEN
    RETURN "updated";
    END IF;
    RETURN "created";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addera_till_lagret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `addera_till_lagret`(
    a_produkt_id VARCHAR(20),
    a_plats VARCHAR(15),
    a_antal INT
)
BEGIN
    INSERT INTO produkt2lager(produkt_id, plats, antal)
    VALUES(a_produkt_id, a_plats, a_antal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `frakt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `frakt`(
    ett_kund_id INT
)
BEGIN
UPDATE `order` AS r
INNER JOIN orderrader s
ON s.orderId = r.id
SET r.delivered = NOW() WHERE s.orderId = ett_kund_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hela_produkt_information` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `hela_produkt_information`()
BEGIN
    SELECT
        p.id,
        GROUP_CONCAT(p_k.kategori_id) AS kategori,
        p.prodnamn,
        p.pris,
        p.beskrivning,
        p_l.antal
    FROM produkt AS p
        LEFT JOIN produkt2lager AS p_l
            ON p.id = p_l.produkt_id
        LEFT JOIN produkt2kategori AS p_k
            ON p.id = p_k.produkt_id
    GROUP BY p.id
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bash`@`localhost` PROCEDURE `loginUser`(
	aUsername CHAR(8),
    aPassword CHAR(32)
)
BEGIN
    SELECT
		akronym AS acronym
    FROM user
    WHERE
		akronym = aUsername
        AND password = MD5(aPassword)
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `plock_lista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `plock_lista`(
    a_order_id INT
)
BEGIN

SELECT
    r.orderId AS orderId,
    r.produktId AS produktId,
    r.antprodukter AS `bestallt`,
    s.antal AS `antal`,
    s.plats AS lagerhylla,
    (s.antal - r.antprodukter) AS lagerDiff,
    IF(r.antprodukter>s.antal, "Tog slut", "Finns pa lagret" ) AS `status`
        FROM orderrader AS r
        INNER JOIN produkt2lager s
        ON s.produkt_id = r.produktId
        WHERE r.orderId = a_order_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sandning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `sandning`(
    a_kund_id INT
)
BEGIN
UPDATE `order` AS r
INNER JOIN orderrader s
ON s.orderId = r.id
SET r.delivered = NOW() WHERE s.orderId = a_kund_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `skapad_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `skapad_order`()
BEGIN
UPDATE `order` AS r
INNER JOIN orderrader s
ON s.orderId = r.id
SET r.orderd = NOW() WHERE s.orderId = s.orderId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `skapa_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `skapa_order`(
    ett_kund_id INT
)
BEGIN
    INSERT INTO `order`(kundId) VALUES(ett_kund_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `skapa_orderrad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `skapa_orderrad`(
    ett_order_id INT,
    ett_prod_id VARCHAR(20),
    ett_antal INT
)
BEGIN
    INSERT INTO orderrader(orderId, produktId, antprodukter) VALUES(ett_order_id, ett_prod_id, ett_antal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `skapa_produkt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `skapa_produkt`(
    ett_id VARCHAR(20),
    ett_pris INT,
    ett_prodnamn VARCHAR(40),
    en_bildlank VARCHAR(50),
    en_beskrivning VARCHAR(100)
)
BEGIN
    INSERT INTO produkt VALUES (ett_id, ett_pris, ett_prodnamn, en_bildlank, en_beskrivning);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `skapa_produkt_med_hylla_och_antal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `skapa_produkt_med_hylla_och_antal`(
    ett_prodnamn VARCHAR(40),
    ett_beskrivning VARCHAR(100),
    ett_lagerhylla VARCHAR(20),
    ett_antal INT
)
BEGIN
    INSERT INTO produkter_i_lagret VALUES (ett_prodnamn, ett_beskrivning, ett_lagerhylla, ett_antal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sok_i_lagret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `sok_i_lagret`(
    search VARCHAR(50)
)
BEGIN
    SELECT * FROM produkter_i_lagret
    WHERE id LIKE search OR
    namn LIKE search OR
    plats LIKE search;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sok_logg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `sok_logg`(
    search VARCHAR (50)
)
BEGIN
    SELECT * FROM logg
        WHERE produkt LIKE search;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tabort_fron_lagret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `tabort_fron_lagret`(
    a_produkt_id VARCHAR(20),
    a_plats VARCHAR(15),
    a_antal INT
)
BEGIN
    DELETE FROM produkt2lager
    WHERE
        produkt_id = a_produkt_id AND
        plats = a_plats AND
        antal = a_antal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tabort_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `tabort_order`(
    ett_id INT
)
BEGIN
    
    DELETE FROM `order`
    WHERE id = ett_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tabort_produkt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `tabort_produkt`(
    ett_id CHAR(20)
)
BEGIN
    DELETE FROM produkt
    WHERE
        `id` = ett_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uppdatera_produkt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `uppdatera_produkt`(
    ett_id VARCHAR(20),
    ett_pris INT,
    ett_prodnamn VARCHAR(40),
    en_bildlank VARCHAR(50),
    en_beskrivning VARCHAR(100)
)
BEGIN
    UPDATE produkt SET
        `pris` = ett_pris,
        `prodnamn` = ett_prodnamn,
        `bildlank` = en_bildlank,
        `beskrivning` = en_beskrivning
    WHERE
        `id` = ett_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vald_orderrad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `vald_orderrad`(
    a_order_id INT
)
BEGIN
    SELECT * FROM orderrader o INNER JOIN produkt p
    ON o.produktId = p.id
    WHERE o.orderId = a_order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_alla_ordrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_alla_ordrar`()
BEGIN
SELECT *, o.id AS order_id,
        order_status(created, updated, deleted, orderd, delivered) AS status,
        (SELECT COUNT(produktId) FROM orderrader WHERE orderId = o.id) AS antal
        FROM `order` o
        INNER JOIN kund K
        ON K.id = o.kundId
        GROUP BY order_id
        ORDER BY K.fornamn DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_alla_ordrar_terminal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_alla_ordrar_terminal`()
BEGIN
SELECT
    o.id AS order_id,
    o.kundId AS kundId,
    o.created AS created,
    order_status(created, updated, deleted, orderd, delivered) AS `status`,
    (SELECT COUNT(produktId) FROM orderrader WHERE orderId = o.id) AS antal
    FROM `order` o
    INNER JOIN kund K
    ON K.id = o.kundId
    GROUP BY order_id
    ORDER BY K.fornamn DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_en_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_en_order`(
    ett_id INT
)
BEGIN
SELECT *, o.id AS order_id FROM `order` o
    INNER JOIN kund K
    ON K.id = o.kundId
    WHERE o.id = ett_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_hela_kund` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_hela_kund`(
    ett_id INT
)
BEGIN
    SELECT
        *
    FROM kund
    WHERE
    ett_id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_id_kategori` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_id_kategori`(
    ett_id CHAR(20)
)
BEGIN
    SELECT produkt_id FROM produkt2kategori
    WHERE `kategori_id` = ett_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_id_produkt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_id_produkt`(
    ett_id CHAR(20)
)
BEGIN
    SELECT * FROM produkt
    WHERE `id` = ett_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_kund` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_kund`()
BEGIN
    SELECT
    id,
    fornamn,
    efternamn,
    adress,
    telefon
    FROM kund;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_lagerhylla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_lagerhylla`()
BEGIN
    SELECT * FROM lagerhylla;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_ordrar_sok_terminal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_ordrar_sok_terminal`(
    ett_kund_id INT
)
BEGIN
SELECT
    o.id AS order_id,
    o.kundId AS kundId,
    o.created AS created,
    order_status(created, updated, deleted, orderd, delivered) AS `status`,
    (SELECT COUNT(produktId) FROM orderrader WHERE orderId = o.id) AS antal
    FROM `order` o
    WHERE kundId = ett_kund_id
    OR o.id = ett_kund_id
    GROUP BY order_id
    ORDER BY order_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_produkt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_produkt`()
BEGIN
    SELECT * FROM produkt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_produkter_i_lagret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_produkter_i_lagret`()
BEGIN
    SELECT * FROM produkter_i_lagret;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visa_produkt_logg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `visa_produkt_logg`(
    a_limit INT
)
BEGIN
    SELECT 
        * 
    FROM logg
    ORDER BY id DESC
    LIMIT a_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `eshop`
--

USE `eshop`;

--
-- Final view structure for view `produkter_i_lagret`
--

/*!50001 DROP VIEW IF EXISTS `produkter_i_lagret`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `produkter_i_lagret` AS select `p`.`id` AS `id`,`p`.`prodnamn` AS `namn`,`p_l`.`plats` AS `plats`,`p_l`.`antal` AS `antal` from (`produkt` `p` left join `produkt2lager` `p_l` on((`p`.`id` = `p_l`.`produkt_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-27 21:18:40
