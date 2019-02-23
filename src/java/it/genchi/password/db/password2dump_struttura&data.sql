-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: password2
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `Email` varchar(30) NOT NULL,
  `Password` char(20) NOT NULL,
  `utente` varchar(20) NOT NULL,
  PRIMARY KEY (`Email`),
  KEY `utenteEmail_idx` (`utente`),
  CONSTRAINT `Utente-Email` FOREIGN KEY (`utente`) REFERENCES `login` (`Utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES ('giovanni@gmail.com','giovanni','giovanni'),('giovanni@pec.it','giovanni','giovanni'),('pippo@gmail.com','pippo','pippo'),('pippo@pec.it','oippo','pippo'),('pippo@tim.it','pippo','pippo'),('rossi@gmail.com','rossi','Rossi'),('rossi@pec.it','rossi','Rossi');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `Utente` varchar(20) NOT NULL,
  `Password` char(10) NOT NULL,
  PRIMARY KEY (`Utente`),
  UNIQUE KEY `Utente_UNIQUE` (`Utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('giovanni','giovanni'),('pippo','pippo'),('Rossi','rossi');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotto` (
  `idProdotto` varchar(40) NOT NULL,
  `Articolo` varchar(45) DEFAULT NULL,
  `Marca` varchar(20) DEFAULT NULL,
  `Data_Acquisto` datetime DEFAULT NULL,
  `Durata garanzia` int(2) DEFAULT NULL,
  `idSito` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProdotto`),
  UNIQUE KEY `idProdotto_UNIQUE` (`idProdotto`),
  KEY `fk_idProdotto_idx` (`idSito`),
  CONSTRAINT `fk_idProdotto` FOREIGN KEY (`idSito`) REFERENCES `sito` (`idSito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sito`
--

DROP TABLE IF EXISTS `sito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sito` (
  `idSito` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(40) NOT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `utente` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `idTipo` varchar(4) NOT NULL,
  `Login` varchar(20) NOT NULL,
  PRIMARY KEY (`idSito`),
  UNIQUE KEY `idSito_UNIQUE` (`idSito`),
  KEY `fk_idtipo_idx` (`idTipo`),
  KEY `fk_Login_idx` (`Login`),
  CONSTRAINT `fk_idtipo` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sito_login1` FOREIGN KEY (`Login`) REFERENCES `login` (`Utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sito`
--

LOCK TABLES `sito` WRITE;
/*!40000 ALTER TABLE `sito` DISABLE KEYS */;
INSERT INTO `sito` VALUES (264,'Amazon','www.amazon.com/it','giovanni@gmail.com','giovanni','AQ','Giovanni'),(266,'Amazon','www.amazon.com/it','rossi@gmail.com','rossi','AQ','rossi'),(267,'bancaprova','www.bancaprova.it','pippo@gmail.com','pippo','BN','pippo'),(268,'Amazon','www.amazon.com/it','pippo@gmail.com','pippo','AQ','pippo'),(269,'Ebay','www.ebay.it','pippo@gmail.com','pippo','AQ','pippo'),(270,'Ebay','www.ebay.it','giovanni@gmail.com','giovanni','AQ','giovanni'),(271,'ebay','www.ebay.it','rossi@gmail.com','rossi','AQ','rossi'),(272,'bancaprova','www.bancaprova.it','giovanni@gmail.com','giovanni','BN','giovanni'),(279,'bancaprova','www.bancaprova.it','rossi@gmail.com','rossi','BN','rossi');
/*!40000 ALTER TABLE `sito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `idTipo` varchar(4) NOT NULL,
  `descrizione` varchar(45) NOT NULL,
  UNIQUE KEY `idTipo_UNIQUE` (`idTipo`),
  UNIQUE KEY `descrizione_UNIQUE` (`descrizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES ('AQ','ACQUISTO'),('BN','BANCA'),('CL','CLOUD'),('CN','CONTRATTO'),('DV','DISPOSITIVO'),('GL','GIORNALE'),('LV','LAVORO'),('DF','NULLO'),('PR','PRENOTAZIONE'),('SF','PROGRAMMA'),('NT','RETE'),('SL','SALUTE'),('SP','SPID'),('TS','TASSE E UTENZE');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'password2'
--

--
-- Dumping routines for database 'password2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-23 15:48:50
