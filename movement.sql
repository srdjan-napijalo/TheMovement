CREATE DATABASE  IF NOT EXISTS `movement` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `movement`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: movement
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresa`
--

DROP TABLE IF EXISTS `adresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adresa` (
  `adresa_id` int(11) NOT NULL AUTO_INCREMENT,
  `adresa` varchar(45) DEFAULT NULL,
  `opstina` int(11) NOT NULL,
  PRIMARY KEY (`adresa_id`),
  KEY `fk_adresa_opstina_idx` (`opstina`),
  CONSTRAINT `fk_adresa_opstina` FOREIGN KEY (`opstina`) REFERENCES `opstina` (`opstina_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrazovanje`
--

DROP TABLE IF EXISTS `obrazovanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `obrazovanje` (
  `obrazovanje_id` int(11) NOT NULL AUTO_INCREMENT,
  `nivo` varchar(45) NOT NULL,
  PRIMARY KEY (`obrazovanje_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrazovanje`
--

LOCK TABLES `obrazovanje` WRITE;
/*!40000 ALTER TABLE `obrazovanje` DISABLE KEYS */;
INSERT INTO `obrazovanje` VALUES (1,'Osnovno obrazovanje'),(2,'Srednje obrazovanje'),(3,'Osnovne akademske studije'),(4,'Master akademske studije'),(5,'Specijalističke akademske studije'),(6,'Doktorske studije');
/*!40000 ALTER TABLE `obrazovanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okrug`
--

DROP TABLE IF EXISTS `okrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `okrug` (
  `okrug_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`okrug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okrug`
--

LOCK TABLES `okrug` WRITE;
/*!40000 ALTER TABLE `okrug` DISABLE KEYS */;
INSERT INTO `okrug` VALUES (1,'Borski okrug'),(2,'Braničevsi okrug'),(3,'Grad Beograd');
/*!40000 ALTER TABLE `okrug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opstina`
--

DROP TABLE IF EXISTS `opstina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `opstina` (
  `opstina_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `okrug` int(11) NOT NULL,
  PRIMARY KEY (`opstina_id`),
  KEY `fk_opstina_okrug_idx` (`okrug`),
  CONSTRAINT `fk_opstina_okrug` FOREIGN KEY (`okrug`) REFERENCES `okrug` (`okrug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opstina`
--

LOCK TABLES `opstina` WRITE;
/*!40000 ALTER TABLE `opstina` DISABLE KEYS */;
INSERT INTO `opstina` VALUES (1,'Ostanite anonimni',1);
/*!40000 ALTER TABLE `opstina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokret`
--

DROP TABLE IF EXISTS `pokret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pokret` (
  `pokreti_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `link` varchar(90) NOT NULL,
  `img` varchar(45) NOT NULL,
  PRIMARY KEY (`pokreti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokret`
--

LOCK TABLES `pokret` WRITE;
/*!40000 ALTER TABLE `pokret` DISABLE KEYS */;
INSERT INTO `pokret` VALUES (1,'Pokret za dekriminalizaciju narkotika','www.google.com','imgs/weed.jpg'),(2,'Pokret za prava radnika','www.youtube.com','imgs/labor.jpg'),(3,'Ekološki pokret','www.facebook.com','imgs/eco.jpg'),(4,'Pokret za prava žena','www.google.com','imgs/feminist.jpg');
/*!40000 ALTER TABLE `pokret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proba`
--

DROP TABLE IF EXISTS `proba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proba` (
  `idproba` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) NOT NULL,
  `pw` varchar(45) NOT NULL,
  PRIMARY KEY (`idproba`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proba`
--

LOCK TABLES `proba` WRITE;
/*!40000 ALTER TABLE `proba` DISABLE KEYS */;
INSERT INTO `proba` VALUES (1,'srdjan@gmail.com','srki123');
/*!40000 ALTER TABLE `proba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proba2`
--

DROP TABLE IF EXISTS `proba2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proba2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `datRodjenja` date DEFAULT NULL,
  `mail` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `oblik` varchar(45) NOT NULL,
  `pol` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `jmbg` varchar(45) DEFAULT NULL,
  `opstina` int(11) NOT NULL,
  `okrug` int(11) NOT NULL,
  `obrazovanje` int(11) NOT NULL,
  `profesija` int(11) NOT NULL,
  `pokret` int(11) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkpok_idx` (`pokret`),
  KEY `fkobr_idx` (`obrazovanje`),
  KEY `fkprof_idx` (`profesija`),
  KEY `fkokr_idx` (`okrug`),
  KEY `fkops_idx` (`opstina`),
  CONSTRAINT `fkobr` FOREIGN KEY (`obrazovanje`) REFERENCES `obrazovanje` (`obrazovanje_id`),
  CONSTRAINT `fkokr` FOREIGN KEY (`okrug`) REFERENCES `okrug` (`okrug_id`),
  CONSTRAINT `fkops` FOREIGN KEY (`opstina`) REFERENCES `opstina` (`opstina_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fkpok` FOREIGN KEY (`pokret`) REFERENCES `pokret` (`pokreti_id`),
  CONSTRAINT `fkprof` FOREIGN KEY (`profesija`) REFERENCES `profesija` (`profesija_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proba2`
--

LOCK TABLES `proba2` WRITE;
/*!40000 ALTER TABLE `proba2` DISABLE KEYS */;
INSERT INTO `proba2` VALUES (1,'Ana','Laz','1997-09-22','ana@lazarevic.com','62552123','SMS','Žena','Dr.Srp.Arm23',NULL,1,3,4,3,2,''),(2,'Ana','Lazar','1997-09-22','ana2@lazarevic.com','634552123','Mail','Žena','Dr.Srp.Arm33',NULL,1,2,3,2,2,''),(3,'Srdjan','Napijalo','1995-12-30','srdjan@gmail.com','062662651','Mail','MuÅ¡karac','null','3012995710004',1,3,6,1,3,'srki1234'),(4,'Srdjan','Napijalo','2004-03-04','srdjan_napijalo@gmail.com','1234561235 ','Mail','M','null','null',1,2,1,1,3,'srdjan123'),(5,'SrÄan','Napijalo','1995-12-30','srdjan@yahoo.com',' 38162662651','SMS','M','Stevana FilipoviÄa 48','3012995710004',1,3,3,1,1,'srdjan12345'),(6,'Mihailo','Napijalo',NULL,'mixaLoodak@gmail.com','12345124213','SMS','null','null','null',1,1,2,1,1,'q12345'),(7,'Srdjan','Napijalo','1911-11-11','srdjan2323132@gmail.com','12321323132','Mail','Å½','','null',1,1,4,1,3,'srewq1'),(8,'Ana','Anic','1911-11-11','anaajjawjtat@gmail.com','062662651','Mail','null','','null',1,1,4,1,4,'zaq123'),(9,'Ana','Lazarevic','1977-05-10','anaajjawjtat23@gmail.com','062662651','Mail','Å½','Nigde 23','null',1,2,5,2,3,'qwert123'),(10,'Miha','Mihailovic','1995-12-30','srdjan_napijalo@gmail2.com',' 356466446','Mail','M','Nigde 23','3012995710004',1,3,3,3,2,'12345a'),(12,'Mihailo','Napijalo','1111-11-11','srdjan_napijalo132131@gmail.com','131232131','Mail','null','null','null',1,2,2,2,2,'12345a'),(13,'Srdjan','Napijalo','1111-11-11','srdjan1232131123141512@gmail.com','213121331','Mail','null','null','null',1,3,3,2,3,'srdjan1234'),(14,'Mihailo','Napijalo','1991-02-15','srdjan2132@gmail.com','123541412','Mail','null','','null',1,2,6,2,4,'qwert1'),(15,'Ljubica','Mamuzic- Napijalo','1977-10-10','srdjan44444@gmail.com','123541412','SMS','Å½','','1010977856644',1,2,4,2,1,'12345a'),(16,'Ljubica','Mamuzic- Napijalo','1911-11-11','srdjan111154@gmail.com','123541412','Mail','null','','null',1,2,5,2,2,'qwerty1'),(17,'Ana','Lazarevic Napijalo','1997-09-22','anaann114@gmail.com',' 15554612','SMS','Å½','','2209997554414',1,1,6,2,2,'ana123'),(18,'Ana','Lazarevic Napijalo','1911-11-11','anaann115@gmail.com',' 15554612','Mail','null','','null',1,1,6,1,4,'qwerty1'),(19,'Ana','Lazarevic Napijalo','1911-11-11','anaann116@gmail.com',' 15554612','Mail','Å½','','null',1,1,4,2,2,'qwerty1'),(20,'Ana','Lazarevic Napijalo','1911-11-11','anaa116@gmail.com',' 15554612','Mail','null','','null',1,2,5,1,2,'12345a'),(21,'Ana','Lazarevic Napijalo','1911-11-11','aawkgka116@gmail.com',' 15554612','SMS','null','','null',1,2,4,2,2,'qwert1'),(22,'Srdjan','Napijalo','1911-11-11','srdjanTRIAL@gmail.com','121311313','SMS','M','','null',1,1,2,2,1,'qwert1'),(23,'Srdjan','Napijalo','1911-11-11','srdjanTRIAL2@gmail.com','121311313','SMS','null','','null',1,2,5,1,2,'qwert1'),(24,'Srdjan','Napijalo','1911-11-11','srdjanTRIAL3@gmail.com','121311313','SMS','M','','null',1,1,5,1,1,'qwert1'),(25,'Srdjan','Napijalo','1911-11-11','srdjan333@gmail.com','123132131','SMS','M','','null',1,1,6,2,1,'qwert1'),(26,'Srdjan','Napijalo','1911-11-11','srdjan3334@gmail.com','123132131','SMS','M','','null',1,2,4,2,2,'qwert1');
/*!40000 ALTER TABLE `proba2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesija`
--

DROP TABLE IF EXISTS `profesija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profesija` (
  `profesija_id` int(11) NOT NULL AUTO_INCREMENT,
  `oblast` varchar(45) NOT NULL,
  PRIMARY KEY (`profesija_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesija`
--

LOCK TABLES `profesija` WRITE;
/*!40000 ALTER TABLE `profesija` DISABLE KEYS */;
INSERT INTO `profesija` VALUES (1,'Nezaposlen'),(2,'Građevinski radnik'),(3,'Prosvetni radnik');
/*!40000 ALTER TABLE `profesija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simpatizer`
--

DROP TABLE IF EXISTS `simpatizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `simpatizer` (
  `simpatizer_id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `datRodjenja` date DEFAULT NULL,
  `kontakt` varchar(45) NOT NULL,
  `kontakt2` varchar(45) DEFAULT NULL,
  `jmbg` int(11) DEFAULT NULL,
  `pol` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `opstina` int(11) NOT NULL,
  `okrug` int(11) NOT NULL,
  `obrazovanje` int(11) NOT NULL,
  `profesija` int(11) NOT NULL,
  `pokret` int(11) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`simpatizer_id`),
  KEY `fk_pokret_idx` (`pokret`),
  KEY `fk_okrug_idx` (`okrug`),
  KEY `fk_struka_idx` (`profesija`),
  KEY `fk_obrazovanje_idx` (`obrazovanje`),
  KEY `fk_opstina_idx` (`opstina`),
  CONSTRAINT `fk_obrazovanje` FOREIGN KEY (`obrazovanje`) REFERENCES `obrazovanje` (`obrazovanje_id`),
  CONSTRAINT `fk_okrug` FOREIGN KEY (`okrug`) REFERENCES `okrug` (`okrug_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_opstina` FOREIGN KEY (`opstina`) REFERENCES `opstina` (`opstina_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pokret` FOREIGN KEY (`pokret`) REFERENCES `pokret` (`pokreti_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_struka` FOREIGN KEY (`profesija`) REFERENCES `profesija` (`profesija_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simpatizer`
--

LOCK TABLES `simpatizer` WRITE;
/*!40000 ALTER TABLE `simpatizer` DISABLE KEYS */;
/*!40000 ALTER TABLE `simpatizer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-17 22:49:43
