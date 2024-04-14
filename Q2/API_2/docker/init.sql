CREATE DATABASE  IF NOT EXISTS `poc` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `poc`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: poc
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `bitstreams`
--

DROP TABLE IF EXISTS `bitstreams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitstreams` (
  `idbitstreams` int NOT NULL AUTO_INCREMENT,
  `nomeArquivo` varchar(45) DEFAULT NULL,
  `pacote` varchar(45) DEFAULT NULL,
  `itens_iditens` int NOT NULL,
  PRIMARY KEY (`idbitstreams`),
  KEY `fk_bitstreams_itens1_idx` (`itens_iditens`),
  CONSTRAINT `fk_bitstreams_itens1` FOREIGN KEY (`itens_iditens`) REFERENCES `itens` (`iditens`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitstreams`
--

LOCK TABLES `bitstreams` WRITE;
/*!40000 ALTER TABLE `bitstreams` DISABLE KEYS */;
INSERT INTO `bitstreams` VALUES (1,'doom.exe','instalador',1),(2,'doom.jpg','thumbnail',1),(3,'doom.ico','icone',1),(4,'goldeneyen64.exe','instalador',2),(5,'goldeneye.jpg','thumbnail',2),(6,'goldeneye.ico','icone',2),(7,'cs16.exe','instalador',3),(8,'counterstrike.png','thumbnail',3),(9,'cs16.ico','icone',3),(10,'Install Valorant.exe','instalador',4),(11,'sage.png','thumbnail',4),(12,'valorant.ico','icone',4),(13,'thesurge.exe','instalador',5),(14,'thesurge.png','thumbnail',5),(15,'thesurge.ico','icone',5),(16,'eldenring.exe','instalador',6),(17,'eldenring.png','thumbnail',6),(18,'eldenring.ico','icone',6),(19,'ds3.exe','instalador',7),(20,'irithyll.gif','thumbnail',7),(21,'ds3.ico','icone',7),(22,'naruto.mp4','trailer',8),(23,'naruto.gif','wallpapper',8),(24,'naruto.png','thumbnail',8),(25,'weare.mp4','trailer',9),(26,'nami.gif','wallpapper',9),(27,'goingMerry.png','thumbnail',9),(28,'bnha.mp4','trailer',10),(29,'bnha.gif','wallpapper',10),(30,'bnha.pnh','thumbnail',10),(31,'marcas.mp4','trailer',11),(32,'marcas.txt','fichaTecnica',11),(33,'marcas.png','thumbnail',11),(34,'mestreDosDesejos.mp4','trailer',12),(35,'mestreDosDesejos.html','fichaTecnica',12),(36,'mestreDosDesejos.png','thumbnail',12),(37,'chainsaw.mp4','trailer',13),(38,'chainsaw.html','fichaTecnica',13),(39,'leatherface.png','thumbnail',13),(40,'borat.mxf','trailer',14),(41,'borat.html','fichaTecnica',14),(42,'borat.jpg','thumbnail',14),(43,'mr-bean.mp4','trailer',15),(44,'mr-bean.txt','fichaTecnica',15),(45,'mr-bean.jpg','thumbnail',15),(46,'dark.mp4','trailer',16),(47,'dark.txt','fichaTecnica',16),(48,'dark.png','thumbnail',16);
/*!40000 ALTER TABLE `bitstreams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colecoes`
--

DROP TABLE IF EXISTS `colecoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colecoes` (
  `idcolecoes` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `comunidades_idcomunidades` int NOT NULL,
  PRIMARY KEY (`idcolecoes`),
  KEY `fk_colecoes_comunidades_idx` (`comunidades_idcomunidades`),
  CONSTRAINT `fk_colecoes_comunidades` FOREIGN KEY (`comunidades_idcomunidades`) REFERENCES `comunidades` (`idcomunidades`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colecoes`
--

LOCK TABLES `colecoes` WRITE;
/*!40000 ALTER TABLE `colecoes` DISABLE KEYS */;
INSERT INTO `colecoes` VALUES (1,'FPS',1),(2,'Soulslike',1),(3,'Shonen',2),(4,'Terror',3),(5,'Comédia',3),(6,'Sci-Fi',4);
/*!40000 ALTER TABLE `colecoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunidades`
--

DROP TABLE IF EXISTS `comunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidades` (
  `idcomunidades` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcomunidades`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidades`
--

LOCK TABLES `comunidades` WRITE;
/*!40000 ALTER TABLE `comunidades` DISABLE KEYS */;
INSERT INTO `comunidades` VALUES (1,'Jogos'),(2,'Animes'),(3,'Filmes'),(4,'Séries');
/*!40000 ALTER TABLE `comunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `iditens` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `colecoes_idcolecoes` int NOT NULL,
  PRIMARY KEY (`iditens`),
  KEY `fk_itens_colecoes1_idx` (`colecoes_idcolecoes`),
  CONSTRAINT `fk_itens_colecoes1` FOREIGN KEY (`colecoes_idcolecoes`) REFERENCES `colecoes` (`idcolecoes`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` VALUES (1,'Doom',1),(2,'007 - GoldenEye',1),(3,'Counter-Strike',1),(4,'Valorant',1),(5,'The Surge',2),(6,'Elden Ring',2),(7,'Dark Souls III',2),(8,'Naruto',3),(9,'One Piece',3),(10,'Boku no Hero Academia',3),(11,'Marcas da maldição',4),(12,'Mestre dos desejos',4),(13,'Massacre da Serra Elétrica',4),(14,'Borat',5),(15,'As férias de Mr. Bean',5),(16,'Dark',6);
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 20:22:45
