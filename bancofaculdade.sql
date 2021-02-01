-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bancofaculdade
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbalunos`
--

DROP TABLE IF EXISTS `tbalunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbalunos` (
  `RA` varchar(45) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `DataNasc` varchar(45) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Telefone` varchar(45) DEFAULT NULL,
  `eMail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbalunos`
--

LOCK TABLES `tbalunos` WRITE;
/*!40000 ALTER TABLE `tbalunos` DISABLE KEYS */;
INSERT INTO `tbalunos` VALUES ('1801703007','anthony gerorge da conceição','22/03/2019','Barretos','sp','17991282895','Anthony_agc@hotmail.com');
/*!40000 ALTER TABLE `tbalunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbemprestimo`
--

DROP TABLE IF EXISTS `tbemprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbemprestimo` (
  `EmpISBN` varchar(45) NOT NULL,
  `EmpAluno` varchar(45) DEFAULT NULL,
  `EmpData` date DEFAULT NULL,
  `EmpDevolucao` date DEFAULT NULL,
  PRIMARY KEY (`EmpISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbemprestimo`
--

LOCK TABLES `tbemprestimo` WRITE;
/*!40000 ALTER TABLE `tbemprestimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbemprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblivros`
--

DROP TABLE IF EXISTS `tblivros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblivros` (
  `ISBN` varchar(45) NOT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Autor` varchar(45) DEFAULT NULL,
  `Editora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblivros`
--

LOCK TABLES `tblivros` WRITE;
/*!40000 ALTER TABLE `tblivros` DISABLE KEYS */;
INSERT INTO `tblivros` VALUES ('123456','todos','jose','vaiquevai');
/*!40000 ALTER TABLE `tblivros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbusuario`
--

DROP TABLE IF EXISTS `tbusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbusuario` (
  `usuario` varchar(30) NOT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbusuario`
--

LOCK TABLES `tbusuario` WRITE;
/*!40000 ALTER TABLE `tbusuario` DISABLE KEYS */;
INSERT INTO `tbusuario` VALUES ('evandro','evandro');
/*!40000 ALTER TABLE `tbusuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19  0:47:22
