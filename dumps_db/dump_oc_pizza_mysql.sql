-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: oc_pizza
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Database :  `oc_pizza`
--

CREATE DATABASE IF NOT EXISTS `oc_pizza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `oc_pizza`;


--
-- Table structure for table `oc_bill`
--

DROP TABLE IF EXISTS `oc_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bill` (
  `order_id` int(10) unsigned NOT NULL,
  `payment_type_id` int(11) NOT NULL DEFAULT '4',
  `restaurant_id` int(10) unsigned NOT NULL,
  `rate_vat100` decimal(4,2) NOT NULL DEFAULT '10.00',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `fk_bill_restaurant1_idx` (`restaurant_id`),
  KEY `fk_bill_payment1_idx` (`payment_type_id`),
  CONSTRAINT `fk_bill_order1` FOREIGN KEY (`order_id`) REFERENCES `oc_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_payment1` FOREIGN KEY (`payment_type_id`) REFERENCES `oc_payment_type` (`payment_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `oc_restaurant` (`restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bill`
--

LOCK TABLES `oc_bill` WRITE;
/*!40000 ALTER TABLE `oc_bill` DISABLE KEYS */;
INSERT INTO `oc_bill` VALUES (1,1,5,10.00,'2019-03-06 13:54:01'),(2,4,2,10.00,'2018-01-21 19:10:53'),(3,1,3,10.00,'2019-04-29 13:22:57'),(4,1,2,10.00,'2019-03-10 21:07:26'),(5,4,5,10.00,'2019-04-19 18:32:02'),(6,1,3,10.00,'2019-12-28 11:42:00'),(7,1,5,10.00,'2018-07-18 19:34:30'),(8,2,3,10.00,'2018-09-05 12:10:43'),(9,1,5,10.00,'2019-09-26 11:48:02'),(10,1,2,10.00,'2018-11-06 13:25:06'),(11,4,3,10.00,'2019-10-01 13:52:47'),(12,1,2,10.00,'2018-03-20 19:09:02'),(13,1,2,10.00,'2019-07-14 21:17:01'),(14,4,4,10.00,'2020-05-15 11:36:14'),(15,1,4,10.00,'2019-11-02 20:56:31'),(16,1,3,10.00,'2018-05-09 20:56:29'),(17,1,4,10.00,'2020-03-24 12:17:50'),(18,1,1,10.00,'2020-01-13 19:24:25'),(19,4,2,10.00,'2018-05-02 12:36:59'),(20,4,4,10.00,'2018-03-06 11:50:01'),(21,1,2,10.00,'2019-12-15 12:02:16'),(22,4,1,10.00,'2018-09-03 13:50:12'),(23,4,2,10.00,'2018-09-29 19:06:26'),(24,1,4,10.00,'2018-09-22 20:53:05'),(25,1,5,10.00,'2019-04-15 18:52:39'),(26,2,3,10.00,'2018-01-25 19:18:08'),(27,1,2,10.00,'2018-06-12 19:54:35'),(28,1,3,10.00,'2018-10-02 11:58:17'),(29,1,2,10.00,'2019-12-23 12:31:14'),(30,4,3,10.00,'2020-05-24 12:10:13'),(31,1,3,10.00,'2020-04-06 13:25:37'),(32,1,5,10.00,'2018-07-07 20:30:52'),(33,1,4,10.00,'2020-06-17 20:25:21'),(34,4,2,10.00,'2019-09-17 19:30:31'),(35,3,1,10.00,'2019-11-22 18:54:28'),(36,4,5,10.00,'2020-01-31 19:16:14'),(37,4,3,10.00,'2020-03-08 13:48:44'),(38,4,4,10.00,'2020-05-26 12:27:10'),(39,1,2,10.00,'2020-05-29 18:56:50'),(40,1,2,10.00,'2019-11-28 12:15:59'),(41,1,2,10.00,'2020-06-27 13:05:51'),(42,1,1,10.00,'2019-09-26 18:52:34'),(43,1,4,10.00,'2019-06-24 18:58:05'),(44,4,5,10.00,'2020-05-23 19:12:55'),(45,4,2,10.00,'2020-06-05 20:51:55'),(46,1,2,10.00,'2019-08-03 20:20:04'),(47,1,4,10.00,'2020-01-14 19:04:00'),(48,1,3,10.00,'2018-10-24 12:38:08'),(49,1,5,10.00,'2018-07-05 13:56:02'),(50,1,3,10.00,'2018-10-10 12:14:42'),(51,1,4,10.00,'2018-12-30 19:49:05'),(52,4,2,10.00,'2020-03-19 20:47:55'),(53,1,5,10.00,'2020-01-26 11:51:36'),(54,1,2,10.00,'2018-02-19 20:49:35'),(55,1,2,10.00,'2020-03-15 12:06:33'),(56,4,5,10.00,'2018-05-31 19:13:50'),(57,1,4,10.00,'2020-01-20 19:59:09'),(58,1,1,10.00,'2018-06-10 12:28:09'),(59,1,2,10.00,'2018-06-07 12:11:49'),(60,1,1,10.00,'2020-03-19 12:36:34'),(61,1,5,10.00,'2020-05-06 19:57:46'),(62,1,1,10.00,'2019-11-20 19:49:51'),(63,1,5,10.00,'2019-03-07 12:39:09'),(64,1,2,10.00,'2018-10-03 20:20:08'),(65,1,2,10.00,'2020-07-05 11:50:01'),(66,4,2,10.00,'2019-06-17 12:29:50'),(67,1,1,10.00,'2019-12-08 11:51:01'),(68,1,5,10.00,'2019-09-18 19:21:19'),(69,1,2,10.00,'2019-07-27 19:30:52'),(70,1,5,10.00,'2020-01-05 12:27:30'),(71,2,1,10.00,'2019-12-31 12:13:20'),(72,4,1,10.00,'2018-04-14 19:53:29'),(73,4,3,10.00,'2020-04-02 12:37:11'),(74,1,5,10.00,'2019-05-15 12:53:03'),(75,1,3,10.00,'2018-12-04 20:18:44'),(76,4,2,10.00,'2018-03-22 12:12:57'),(77,1,1,10.00,'2019-03-26 12:05:04'),(78,4,3,10.00,'2020-01-03 20:11:34'),(79,1,1,10.00,'2019-05-07 13:14:08'),(80,4,2,10.00,'2019-10-02 12:21:37'),(81,1,3,10.00,'2018-05-05 19:28:46'),(82,1,4,10.00,'2018-03-22 12:53:33'),(83,1,1,10.00,'2019-06-21 20:45:34'),(84,1,1,10.00,'2018-11-10 19:02:17'),(85,4,4,10.00,'2020-08-15 11:47:08'),(86,1,1,10.00,'2018-03-19 20:00:45'),(87,1,2,10.00,'2020-05-28 12:06:41'),(88,4,3,10.00,'2019-04-18 20:11:46'),(89,2,3,10.00,'2018-01-08 12:48:54'),(90,4,2,10.00,'2019-11-21 20:04:46'),(91,1,1,10.00,'2020-04-19 12:19:03'),(92,3,1,10.00,'2018-10-15 12:00:06'),(93,1,3,10.00,'2018-01-28 19:39:56'),(94,1,4,10.00,'2019-12-15 19:02:06'),(95,1,3,10.00,'2019-09-20 20:49:32'),(96,4,2,10.00,'2019-01-31 12:02:49'),(97,1,1,10.00,'2020-04-30 19:07:17'),(98,2,5,10.00,'2020-08-12 20:24:09'),(99,3,1,10.00,'2018-06-02 11:42:48'),(100,1,5,10.00,'2020-07-27 11:46:35');
/*!40000 ALTER TABLE `oc_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_contact`
--

DROP TABLE IF EXISTS `oc_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_contact` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(10) DEFAULT NULL,
  `street_number` varchar(4) DEFAULT NULL,
  `street_name` varchar(60) DEFAULT NULL,
  `address_complement` varchar(90) DEFAULT NULL,
  `postal_code` varchar(5) NOT NULL,
  `city` varchar(15) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_contact`
--

LOCK TABLES `oc_contact` WRITE;
/*!40000 ALTER TABLE `oc_contact` DISABLE KEYS */;
INSERT INTO `oc_contact` VALUES (1,'0333333344','12','rue des jacobins','NULL','80000','Amiens'),(2,'0111111122','165','place pigalle','NULL','75000','Paris'),(3,'0333333344','226','rue de la republique','NULL','69000','Lyon'),(4,'0222222233','271','rue de la fonderie','NULL','31000','Toulouse'),(5,'0555555566','63','rue voltaire','NULL','29000','Brest'),(6,'0747038672','148','Boulevard des Bardes','NULL','69000','Lyon'),(7,'0756531619','72','Voie du Pré','NULL','31000','Toulouse'),(8,'0659665315','278','Rue de la Falaise','NULL','80000','Amiens'),(9,'0602621602','271','Voie de la Nova','NULL','75000','Paris'),(10,'0670301198','215','Route des Saules','Apt 23','75000','Paris'),(11,'0614248936','223','Rue d\"Automne','NULL','69000','Lyon'),(12,'0699555306','50','Chemin des Marchés','NULL','29000','Brest'),(13,'0661933840','276','Boulevard d\"Espoir','NULL','69000','Lyon'),(14,'0749365735','184','Rue du Peuplier','Apt 02','75000','Paris'),(15,'0756865047','496','Rue des Fleurs','NULL','29000','Brest'),(16,'0686756838','182','Rue d Archer','NULL','80000','Amiens'),(17,'0632902652','185','Voie du Canal','NULL','80000','Amiens'),(18,'0779897733','223','Rue des Noisettes','NULL','75000','Paris'),(19,'0734321299','21','Rue des Séquoias','NULL','80000','Amiens'),(20,'0747574962','198','Rue de l\"Olivier','NULL','69000','Lyon'),(21,'0672997100','233','Boulevard du Phare','NULL','80000','Amiens'),(22,'0657590904','114','Route du Palmier','Apt 38','29000','Brest'),(23,'0710796659','70','Rue du Fleuve','NULL','69000','Lyon'),(24,'0792847896','371','Voie de la Mer','NULL','29000','Brest'),(25,'0610643157','334','Rue du Parc','NULL','75000','Paris'),(26,'0790245589','225','Rue des Merchands','Apt 75','75000','Paris'),(27,'0702202519','113','Route de Merveilles','NULL','80000','Amiens'),(28,'0765576504','380','Rue des Cottages','NULL','29000','Brest'),(29,'0625075942','95','Route des Rossignols','NULL','69000','Lyon'),(30,'0707552634','55','Rue de Pierre','NULL','69000','Lyon'),(31,'0636081303','462','Voie d\"Ombre','NULL','29000','Brest'),(32,'0637460834','23','Chemin de la Croix','Apt 08','31000','Toulouse'),(33,'0717731973','76','Voie des Montagnes','NULL','75000','Paris'),(34,'0660172310','453','Rue des Fêtes','NULL','75000','Paris'),(35,'0709682610','109','Chemin du Lycée','NULL','69000','Lyon'),(36,'0643458832','440','Route de Gravier','NULL','75000','Paris'),(37,'0745762455','134','Chemin de Grâce','NULL','75000','Paris'),(38,'0790448748','148','Voie de Triomphe','NULL','80000','Amiens'),(39,'0719046722','206','Rue du Musée','Apt 17','80000','Amiens'),(40,'0797633822','285','Rue du Juge','NULL','69000','Lyon'),(41,'0683907800','336','Rue de la Côte','NULL','29000','Brest'),(42,'0631031912','478','Voie de Répit','NULL','75000','Paris'),(43,'0735717179','296','Boulevard de la Princesse','Apt 03','31000','Toulouse'),(44,'0669910813','394','Rue d\"Automne','NULL','31000','Toulouse'),(45,'0747600313','494','Rue de la Place','NULL','75000','Paris'),(46,'0602221677','343','Chemin de Romarin','NULL','80000','Amiens'),(47,'0727279345','357','Rue de Grenat','Apt 11','75000','Paris'),(48,'0723141124','346','Rue du Stade','NULL','31000','Toulouse'),(49,'0655748051','405','Route de l\"Arcade','NULL','31000','Toulouse'),(50,'0731895022','463','Chemin du Fleuve','Apt 52','75000','Paris'),(51,'0699782126','348','Rue de Givre','NULL','80000','Amiens'),(52,'0745384157','189','Chemin du Pin','NULL','80000','Amiens'),(53,'0726579413','410','Rue du Laurier','NULL','69000','Lyon'),(54,'0666751713','117','Rue du Globe','NULL','80000','Amiens'),(55,'0771323205','479','Boulevard du Nord','NULL','31000','Toulouse'),(56,'0796813062','228','Rue des Pelouses','Apt 39','31000','Toulouse'),(57,'0650601914','151','Rue des Vergers','NULL','69000','Lyon'),(58,'0693234810','379','Chemin d\"Espérance','NULL','80000','Amiens'),(59,'0767939859','119','Voie du Syndicat','NULL','69000','Lyon'),(60,'0678835343','105','Boulevard de la Croix','Apt 02','29000','Brest'),(61,'0668506108','4','Rue des Plumes','NULL','29000','Brest'),(62,'0776042491','428','Voie des Quais','NULL','29000','Brest'),(63,'0663612408','441','Rue de Providence','NULL','75000','Paris'),(64,'0725358208','195','Voie de Tonnerre','NULL','80000','Amiens'),(65,'0736621307','236','Rue de la Reine','NULL','31000','Toulouse'),(66,'0771633748','370','Rue de Mugissement','NULL','29000','Brest'),(67,'0794706578','54','Rue de Printemps','NULL','31000','Toulouse'),(68,'0761806853','174','Rue du Noyer','NULL','75000','Paris'),(69,'0756202950','340','Boulevard de Gravier','Apt 40','80000','Amiens'),(70,'0722217163','60','Rue du Croissant','NULL','29000','Brest'),(71,'0709167806','389','Rue de la Faculté','NULL','80000','Amiens'),(72,'0733907561','372','Rue de Sérénité','NULL','29000','Brest'),(73,'0764099271','348','Rue des Bains','NULL','69000','Lyon'),(74,'0783781881','79','Voie d\"Ambre','NULL','75000','Paris'),(75,'0738300609','47','Rue de Clair de Lune','Apt 67','75000','Paris'),(76,'0634813675','481','Rue de Givre','NULL','69000','Lyon'),(77,'0762494221','105','Rue du Roi','NULL','75000','Paris'),(78,'0709684438','186','Chemin du Pégase','NULL','69000','Lyon'),(79,'0658094892','126','Rue de Chance','NULL','31000','Toulouse'),(80,'0662547970','161','Chemin des Guildes','NULL','75000','Paris'),(81,'0786850840','261','Boulevard du Stade','Apt 6','29000','Brest'),(82,'0799455205','287','Chemin de Diamant','NULL','31000','Toulouse'),(83,'0632415874','395','Route de la Couronne','NULL','80000','Amiens'),(84,'0681397480','81','Voie de la Terre de Fer','NULL','69000','Lyon'),(85,'0738503158','338','Rue d\"Innovation','Apt 15','69000','Lyon'),(86,'0612152831','217','Chemin de l\"Étoile','NULL','29000','Brest'),(87,'0726857546','215','Route de Crasse','NULL','29000','Brest'),(88,'0664904734','367','Rue de Lavande','NULL','31000','Toulouse'),(89,'0732403726','398','Rue des Anges','NULL','69000','Lyon');
/*!40000 ALTER TABLE `oc_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customer_contact1_idx` (`contact_id`),
  KEY `fk_customer_user1_idx` (`user_id`),
  CONSTRAINT `fk_customer_contact1` FOREIGN KEY (`contact_id`) REFERENCES `oc_contact` (`contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_user1` FOREIGN KEY (`user_id`) REFERENCES `oc_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer`
--

LOCK TABLES `oc_customer` WRITE;
/*!40000 ALTER TABLE `oc_customer` DISABLE KEYS */;
INSERT INTO `oc_customer` VALUES (1,6,1),(2,7,2),(3,8,5),(4,9,6),(5,10,8),(6,11,9),(7,12,10),(8,13,12),(9,14,14),(10,15,15),(11,16,16),(12,17,17),(13,18,18),(14,19,19),(15,20,20),(16,21,22),(17,22,23),(18,23,24),(19,24,25),(20,25,26),(21,26,27),(22,27,28),(23,28,30),(24,29,31),(25,30,32),(26,31,34),(27,32,35),(28,33,36),(29,34,37),(30,35,38),(31,36,39),(32,37,40),(33,38,41),(34,39,42),(35,40,43),(36,41,46),(37,42,47),(38,43,48),(39,44,49),(40,45,50),(41,46,51),(42,47,52),(43,48,53),(44,49,55),(45,50,57),(46,51,58),(47,52,60),(48,53,61),(49,54,62),(50,55,63),(51,56,64),(52,57,66),(53,58,70),(54,59,72),(55,60,73),(56,61,75),(57,62,76),(58,63,77),(59,64,78),(60,65,79),(61,66,84),(62,67,85),(63,68,86),(64,69,87),(65,70,90),(66,71,92),(67,72,93);
/*!40000 ALTER TABLE `oc_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_employee`
--

DROP TABLE IF EXISTS `oc_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_employee` (
  `employee_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employee_restaurant1_idx` (`restaurant_id`),
  KEY `fk_employee_user1_idx` (`user_id`),
  KEY `fk_employee_role1_idx` (`role_id`),
  CONSTRAINT `fk_employee_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `oc_restaurant` (`restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_role1` FOREIGN KEY (`role_id`) REFERENCES `oc_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_user1` FOREIGN KEY (`user_id`) REFERENCES `oc_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_employee`
--

LOCK TABLES `oc_employee` WRITE;
/*!40000 ALTER TABLE `oc_employee` DISABLE KEYS */;
INSERT INTO `oc_employee` VALUES (1,1,3,2),(2,1,4,3),(3,1,7,1),(4,1,11,2),(5,1,13,3),(6,2,21,1),(7,2,29,2),(8,2,33,2),(9,2,44,3),(10,2,45,3),(11,3,54,1),(12,3,56,2),(13,3,59,2),(14,3,65,3),(15,3,67,3),(16,4,68,1),(17,4,69,2),(18,4,71,2),(19,4,74,3),(20,4,80,3),(21,5,81,1),(22,5,82,2),(23,5,83,2),(24,5,88,3),(25,5,89,3),(26,2,91,2),(27,2,94,3);
/*!40000 ALTER TABLE `oc_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ingredient`
--

DROP TABLE IF EXISTS `oc_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ingredient` (
  `ingredient_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`ingredient_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ingredient`
--

LOCK TABLES `oc_ingredient` WRITE;
/*!40000 ALTER TABLE `oc_ingredient` DISABLE KEYS */;
INSERT INTO `oc_ingredient` VALUES (21,'Anchois'),(7,'Artichaut'),(22,'Câpre'),(3,'Champignon'),(15,'Creme fraiche'),(2,'Jambon'),(4,'Merguez'),(18,'Miel'),(1,'Mozzarella'),(19,'Noix'),(23,'Oeuf'),(10,'Oignon'),(5,'Oignon rouge'),(11,'Olive'),(16,'Poire'),(6,'Poivron'),(9,'Poulet'),(17,'Roquefort'),(14,'Sauce curry'),(20,'Sauce tomate'),(12,'Saumon fumé'),(8,'Tomate'),(13,'Viande haché');
/*!40000 ALTER TABLE `oc_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_item`
--

DROP TABLE IF EXISTS `oc_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `pizza_id` int(10) unsigned NOT NULL,
  `quantity` tinyint(3) unsigned NOT NULL,
  `rate_vat100` decimal(4,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_item_order1_idx` (`order_id`),
  KEY `fk_item_pizza1_idx` (`pizza_id`),
  CONSTRAINT `fk_item_order1` FOREIGN KEY (`order_id`) REFERENCES `oc_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `oc_pizza` (`pizza_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_item`
--

LOCK TABLES `oc_item` WRITE;
/*!40000 ALTER TABLE `oc_item` DISABLE KEYS */;
INSERT INTO `oc_item` VALUES (1,76,4,3,10.00),(2,59,10,4,10.00),(3,66,3,3,10.00),(4,40,2,1,10.00),(5,67,7,5,10.00),(6,34,7,5,10.00),(7,26,7,4,10.00),(8,21,5,4,10.00),(9,52,7,3,10.00),(10,34,3,2,10.00),(11,70,8,1,10.00),(12,75,3,3,10.00),(13,48,8,2,10.00),(14,71,9,2,10.00),(15,98,7,4,10.00),(16,49,5,5,10.00),(17,94,5,4,10.00),(18,62,1,4,10.00),(19,56,3,4,10.00),(20,17,3,3,10.00),(21,13,3,2,10.00),(22,91,5,1,10.00),(23,45,6,4,10.00),(24,45,3,5,10.00),(25,75,8,2,10.00),(26,52,2,3,10.00),(27,40,10,4,10.00),(28,87,5,4,10.00),(29,41,7,1,10.00),(30,95,1,2,10.00),(31,58,10,2,10.00),(32,10,5,2,10.00),(33,38,3,3,10.00),(34,64,10,1,10.00),(35,4,8,1,10.00),(36,98,7,2,10.00),(37,100,6,1,10.00),(38,40,2,2,10.00),(39,50,4,1,10.00),(40,38,8,2,10.00),(41,62,1,1,10.00),(42,15,7,3,10.00),(43,44,2,2,10.00),(44,73,3,5,10.00),(45,34,5,2,10.00),(46,7,6,4,10.00),(47,79,4,1,10.00),(48,37,4,5,10.00),(49,60,3,5,10.00),(50,88,2,4,10.00),(51,13,4,1,10.00),(52,46,2,3,10.00),(53,98,9,3,10.00),(54,47,9,1,10.00),(55,11,10,1,10.00),(56,45,9,4,10.00),(57,24,1,5,10.00),(58,92,10,1,10.00),(59,36,6,4,10.00),(60,5,8,1,10.00),(61,95,9,1,10.00),(62,96,3,5,10.00),(63,78,4,3,10.00),(64,85,1,4,10.00),(65,53,5,2,10.00),(66,14,7,3,10.00),(67,95,4,4,10.00),(68,6,1,4,10.00),(69,84,7,4,10.00),(70,98,10,5,10.00),(71,71,3,2,10.00),(72,100,9,1,10.00),(73,53,1,3,10.00),(74,6,6,5,10.00),(75,80,7,2,10.00),(76,90,4,5,10.00),(77,23,4,4,10.00),(78,81,8,1,10.00),(79,54,3,4,10.00),(80,70,10,3,10.00),(81,66,1,5,10.00),(82,94,5,5,10.00),(83,53,8,1,10.00),(84,25,5,2,10.00),(85,92,9,3,10.00),(86,68,9,4,10.00),(87,89,4,4,10.00),(88,88,1,5,10.00),(89,14,7,3,10.00),(90,77,5,1,10.00),(91,66,1,2,10.00),(92,69,9,1,10.00),(93,45,2,5,10.00),(94,95,2,5,10.00),(95,87,6,4,10.00),(96,46,4,5,10.00),(97,91,9,2,10.00),(98,55,4,2,10.00),(99,61,7,5,10.00),(100,19,4,1,10.00);
/*!40000 ALTER TABLE `oc_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `order_state_id` int(11) NOT NULL,
  `paid_online` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `added_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_customer1_idx` (`customer_id`),
  KEY `fk_order_state1_idx` (`order_state_id`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `oc_customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_state1` FOREIGN KEY (`order_state_id`) REFERENCES `oc_order_state` (`order_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order`
--

LOCK TABLES `oc_order` WRITE;
/*!40000 ALTER TABLE `oc_order` DISABLE KEYS */;
INSERT INTO `oc_order` VALUES (1,65,5,1,0,'2019-03-06 13:54:01'),(2,5,3,0,1,'2018-01-21 19:10:53'),(3,1,5,0,1,'2019-04-29 13:22:57'),(4,37,2,1,0,'2019-03-10 21:07:26'),(5,23,3,0,1,'2019-04-19 18:32:02'),(6,35,5,1,0,'2019-12-28 11:42:00'),(7,57,2,1,0,'2018-07-18 19:34:30'),(8,48,5,0,0,'2018-09-05 12:10:43'),(9,55,4,1,1,'2019-09-26 11:48:02'),(10,9,4,1,1,'2018-11-06 13:25:06'),(11,8,4,0,1,'2019-10-01 13:52:47'),(12,4,5,1,0,'2018-03-20 19:09:02'),(13,9,1,1,1,'2019-07-14 21:17:01'),(14,62,1,0,0,'2020-05-15 11:36:14'),(15,62,2,1,0,'2019-11-02 20:56:31'),(16,18,1,1,0,'2018-05-09 20:56:29'),(17,43,2,1,0,'2020-03-24 12:17:50'),(18,22,5,1,1,'2020-01-13 19:24:25'),(19,40,4,0,1,'2018-05-02 12:36:59'),(20,60,3,0,1,'2018-03-06 11:50:01'),(21,63,3,1,1,'2019-12-15 12:02:16'),(22,46,2,0,1,'2018-09-03 13:50:12'),(23,21,3,0,1,'2018-09-29 19:06:26'),(24,43,1,1,1,'2018-09-22 20:53:05'),(25,10,1,1,1,'2019-04-15 18:52:39'),(26,35,5,0,0,'2018-01-25 19:18:08'),(27,5,3,1,1,'2018-06-12 19:54:35'),(28,1,5,1,1,'2018-10-02 11:58:17'),(29,42,3,1,1,'2019-12-23 12:31:14'),(30,35,1,0,0,'2020-05-24 12:10:13'),(31,24,5,1,0,'2020-04-06 13:25:37'),(32,55,1,1,1,'2018-07-07 20:30:52'),(33,60,5,1,0,'2020-06-17 20:25:21'),(34,32,4,0,1,'2019-09-17 19:30:31'),(35,49,5,0,0,'2019-11-22 18:54:28'),(36,36,3,0,1,'2020-01-31 19:16:14'),(37,15,2,0,0,'2020-03-08 13:48:44'),(38,27,2,0,1,'2020-05-26 12:27:10'),(39,31,2,1,0,'2020-05-29 18:56:50'),(40,63,2,1,1,'2019-11-28 12:15:59'),(41,37,2,1,1,'2020-06-27 13:05:51'),(42,12,5,1,1,'2019-09-26 18:52:34'),(43,60,5,1,0,'2019-06-24 18:58:05'),(44,23,3,0,1,'2020-05-23 19:12:55'),(45,63,1,0,1,'2020-06-05 20:51:55'),(46,5,1,1,0,'2019-08-03 20:20:04'),(47,2,5,1,0,'2020-01-14 19:04:00'),(48,8,5,1,0,'2018-10-24 12:38:08'),(49,56,1,1,1,'2018-07-05 13:56:02'),(50,6,5,1,0,'2018-10-10 12:14:42'),(51,39,2,1,1,'2018-12-30 19:49:05'),(52,63,2,0,0,'2020-03-19 20:47:55'),(53,61,1,1,1,'2020-01-26 11:51:36'),(54,45,5,1,1,'2018-02-19 20:49:35'),(55,4,1,1,0,'2020-03-15 12:06:33'),(56,55,1,0,0,'2018-05-31 19:13:50'),(57,43,3,1,1,'2020-01-20 19:59:09'),(58,16,1,1,1,'2018-06-10 12:28:09'),(59,31,5,1,0,'2018-06-07 12:11:49'),(60,47,2,1,1,'2020-03-19 12:36:34'),(61,19,2,1,0,'2020-05-06 19:57:46'),(62,64,5,1,0,'2019-11-20 19:49:51'),(63,61,5,1,0,'2019-03-07 12:39:09'),(64,40,2,1,1,'2018-10-03 20:20:08'),(65,63,2,1,1,'2020-07-05 11:50:01'),(66,29,2,0,1,'2019-06-17 12:29:50'),(67,41,4,1,1,'2019-12-08 11:51:01'),(68,19,5,1,0,'2019-09-18 19:21:19'),(69,29,3,1,1,'2019-07-27 19:30:52'),(70,56,1,1,0,'2020-01-05 12:27:30'),(71,12,5,0,1,'2019-12-31 12:13:20'),(72,66,1,0,0,'2018-04-14 19:53:29'),(73,15,2,0,0,'2020-04-02 12:37:11'),(74,55,3,1,1,'2019-05-15 12:53:03'),(75,48,2,1,0,'2018-12-04 20:18:44'),(76,37,2,0,0,'2018-03-22 12:12:57'),(77,12,5,0,0,'2019-03-26 12:05:04'),(78,48,2,0,0,'2020-01-03 20:11:34'),(79,33,5,1,0,'2019-05-07 13:14:08'),(80,21,1,0,1,'2019-10-02 12:21:37'),(81,6,2,1,0,'2018-05-05 19:28:46'),(82,50,1,1,1,'2018-03-22 12:53:33'),(83,41,5,1,0,'2019-06-21 20:45:34'),(84,34,1,1,0,'2018-11-10 19:02:17'),(85,60,2,0,0,'2020-08-15 11:47:08'),(86,11,1,1,0,'2018-03-19 20:00:45'),(87,29,5,1,0,'2020-05-28 12:06:41'),(88,1,3,0,1,'2019-04-18 20:11:46'),(89,8,5,0,0,'2018-01-08 12:48:54'),(90,45,4,0,1,'2019-11-21 20:04:46'),(91,34,2,1,0,'2020-04-19 12:19:03'),(92,64,5,0,0,'2018-10-15 12:00:06'),(93,48,2,1,0,'2018-01-28 19:39:56'),(94,43,5,1,0,'2019-12-15 19:02:06'),(95,8,3,1,0,'2019-09-20 20:49:32'),(96,42,4,0,1,'2019-01-31 12:02:49'),(97,59,1,1,1,'2020-04-30 19:07:17'),(98,55,5,0,1,'2020-08-12 20:24:09'),(99,53,5,0,1,'2018-06-02 11:42:48'),(100,61,2,1,1,'2020-07-27 11:46:35');
/*!40000 ALTER TABLE `oc_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_state`
--

DROP TABLE IF EXISTS `oc_order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_state` (
  `order_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_state` varchar(45) NOT NULL,
  PRIMARY KEY (`order_state_id`),
  UNIQUE KEY `order_state_UNIQUE` (`order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_state`
--

LOCK TABLES `oc_order_state` WRITE;
/*!40000 ALTER TABLE `oc_order_state` DISABLE KEYS */;
INSERT INTO `oc_order_state` VALUES (3,'Awaiting for delivery'),(1,'Awaiting for preparation'),(4,'Delivery in progress'),(5,'Order delivered'),(2,'Preparation in progress');
/*!40000 ALTER TABLE `oc_order_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_payment_type`
--

DROP TABLE IF EXISTS `oc_payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_payment_type` (
  `payment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_type_id`),
  UNIQUE KEY `type_UNIQUE` (`payment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_payment_type`
--

LOCK TABLES `oc_payment_type` WRITE;
/*!40000 ALTER TABLE `oc_payment_type` DISABLE KEYS */;
INSERT INTO `oc_payment_type` VALUES (2,'Cash'),(3,'Check'),(1,'Credit card'),(4,'Payment Pending');
/*!40000 ALTER TABLE `oc_payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_pizza`
--

DROP TABLE IF EXISTS `oc_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_pizza` (
  `pizza_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `unit_price_ht` decimal(5,2) NOT NULL,
  `added_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pizza_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_pizza`
--

LOCK TABLES `oc_pizza` WRITE;
/*!40000 ALTER TABLE `oc_pizza` DISABLE KEYS */;
INSERT INTO `oc_pizza` VALUES (1,'Margherita','Mozzarella',6.90,'2015-12-15 14:02:11'),(2,'Reine','Mozzarella - Jambon - Champignons',10.90,'2015-12-15 14:09:23'),(3,'Orientale','Mozzarella - Merguez - Oignons rouges - Poivrons',10.90,'2015-12-15 14:13:45'),(4,'Végétarienne','Mozzarella - Artichaut - Champignons - Poivrons - Tomates',10.90,'2015-12-15 14:26:02'),(5,'Chicken','Mozzarella - Poulet curry - Poivrons - Oignons - Olives',11.50,'2015-12-15 14:34:35'),(6,'Pacifico','Mozzarella - Saumon fumé',11.50,'2015-12-15 14:42:58'),(7,'Royale','Mozzarella - Viande haché - Merguez - Poulet - Oignons',11.50,'2015-12-15 14:49:34'),(8,'Gourmande','Creme fraiche - Mozzarella - Poire - Roquefort - Miel - Noix',12.50,'2015-12-15 14:57:18'),(9,'Napolitaine','Sauce tomate - Mozzarella - Anchois - Câpres - Olives',12.50,'2015-12-15 15:06:48'),(10,'Calzone','Mozzarella - Jambon - Champignons - Oeuf',9.00,'2015-12-15 15:28:17');
/*!40000 ALTER TABLE `oc_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_pizza_ingredient`
--

DROP TABLE IF EXISTS `oc_pizza_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_pizza_ingredient` (
  `pizza_id` int(10) unsigned NOT NULL,
  `ingredient_id` int(10) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`pizza_id`,`ingredient_id`),
  KEY `fk_pizza_has_ingredient_ingredient1_idx` (`ingredient_id`),
  KEY `fk_pizza_has_ingredient_pizza1_idx` (`pizza_id`),
  CONSTRAINT `fk_pizza_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `oc_ingredient` (`ingredient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_has_ingredient_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `oc_pizza` (`pizza_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_pizza_ingredient`
--

LOCK TABLES `oc_pizza_ingredient` WRITE;
/*!40000 ALTER TABLE `oc_pizza_ingredient` DISABLE KEYS */;
INSERT INTO `oc_pizza_ingredient` VALUES (1,1,200),(2,1,200),(2,2,100),(2,3,100),(3,1,200),(3,4,150),(3,5,100),(3,6,100),(4,1,200),(4,3,100),(4,6,100),(4,7,100),(4,8,150),(5,1,200),(5,6,100),(5,9,350),(5,10,100),(5,11,100),(5,14,250),(6,1,200),(6,12,300),(7,1,200),(7,4,250),(7,9,250),(7,10,100),(7,13,250),(8,1,200),(8,15,200),(8,16,150),(8,17,150),(8,18,100),(8,19,100),(9,1,200),(9,11,100),(9,20,150),(9,21,150),(9,22,150),(10,1,200),(10,2,200),(10,3,150),(10,23,100);
/*!40000 ALTER TABLE `oc_pizza_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_reminder`
--

DROP TABLE IF EXISTS `oc_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_reminder` (
  `reminder_id` int(11) NOT NULL AUTO_INCREMENT,
  `pizza_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `added_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reminder_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_reminder_pizza1_idx` (`pizza_id`),
  CONSTRAINT `fk_reminder_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `oc_pizza` (`pizza_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_reminder`
--

LOCK TABLES `oc_reminder` WRITE;
/*!40000 ALTER TABLE `oc_reminder` DISABLE KEYS */;
INSERT INTO `oc_reminder` VALUES (1,1,'Recette Pizza Margherita','200 gr. de Mozzarella','2020-08-24 22:26:41'),(2,2,'Recette Pizza Reine','200 gr. de Mozzarella, 100 gr. de Jambon, 100 gr. de Champignons','2020-08-24 22:26:41'),(3,3,'Recette Pizza Orientale','200 gr. de Mozzarella, 150 gr. de Merguez, 100 gr. d\"Oignons rouges, 100 gr. de Poivrons','2020-08-24 22:26:41'),(4,4,'Recette Pizza Végétarienne','200 gr. de Mozzarella, 100 gr. Champignons, 100 gr. de Poivrons, 100 gr. d\"Artichauts, 150 gr. de Tomates','2020-08-24 22:26:41'),(5,5,'Recette Pizza Chicken','200 gr. de Mozzarella, 100 gr. de Poivrons, 350 gr. de Poulet, 100 gr. d\"Oignons, 100 gr. d\"Olives, 250 gr. de Sauce Curry','2020-08-24 22:26:41'),(6,6,'Recette Pizza Pacifico','200 gr. de Mozzarella, 300 gr. de Saumon fumé','2020-08-24 22:26:41'),(7,7,'Recette Pizza Royale','200 gr. de Mozzarella, 250 gr. de Merguez, 250 gr. de Poulet, 100 gr. d\"Oignons, 250 gr. Viande haché','2020-08-24 22:26:41'),(8,8,'Recette Pizza Gourmande','200 gr. de Mozzarella, 200 gr. de Creme fraiche, 150 gr. de Poire, 150 gr. de Roquefort, 100 gr. de Miel, 100 gr. de Noix','2020-08-24 22:26:41'),(9,9,'Recette Pizza Napolitaine','200 gr. de Mozzarella, 100 gr. d\"Olives, 150 gr. de Sauce tomate, 150 gr. d\"Anchois, 150 gr. de Câpres','2020-08-24 22:26:41'),(10,10,'Recette Pizza Calzone','200 gr. de Mozzarella, 200 gr. de Jambon, 150 gr. de Champignon, 100 gr. d\"Oeufs','2020-08-24 22:26:41');
/*!40000 ALTER TABLE `oc_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_restaurant`
--

DROP TABLE IF EXISTS `oc_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_restaurant` (
  `restaurant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `added_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`restaurant_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_restaurant_contact1_idx` (`contact_id`),
  CONSTRAINT `fk_restaurant_contact1` FOREIGN KEY (`contact_id`) REFERENCES `oc_contact` (`contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_restaurant`
--

LOCK TABLES `oc_restaurant` WRITE;
/*!40000 ALTER TABLE `oc_restaurant` DISABLE KEYS */;
INSERT INTO `oc_restaurant` VALUES (1,1,'OC PIZZA Amiens','oc_pizza80@oc.com','2015-12-14 15:06:29'),(2,2,'OC PIZZA Paris','oc_pizza75@oc.com','2015-12-14 15:06:29'),(3,3,'OC PIZZA Lyon','oc_pizza69@oc.com','2015-12-14 15:06:29'),(4,4,'OC PIZZA Toulouse','oc_pizza31@oc.com','2015-12-14 15:06:29'),(5,5,'OC PIZZA Brest','oc_pizza29@oc.com','2015-12-14 15:06:29');
/*!40000 ALTER TABLE `oc_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_role`
--

DROP TABLE IF EXISTS `oc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(15) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_role`
--

LOCK TABLES `oc_role` WRITE;
/*!40000 ALTER TABLE `oc_role` DISABLE KEYS */;
INSERT INTO `oc_role` VALUES (3,'Delivery Man'),(1,'Manager'),(2,'Pizza Chef');
/*!40000 ALTER TABLE `oc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_stock`
--

DROP TABLE IF EXISTS `oc_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_stock` (
  `ingredient_id` int(10) unsigned NOT NULL,
  `restaurant_id` int(10) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`ingredient_id`,`restaurant_id`),
  KEY `fk_ingredient_has_restaurant_restaurant1_idx` (`restaurant_id`),
  KEY `fk_ingredient_has_restaurant_ingredient1_idx` (`ingredient_id`),
  CONSTRAINT `fk_ingredient_has_restaurant_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `oc_ingredient` (`ingredient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredient_has_restaurant_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `oc_restaurant` (`restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_stock`
--

LOCK TABLES `oc_stock` WRITE;
/*!40000 ALTER TABLE `oc_stock` DISABLE KEYS */;
INSERT INTO `oc_stock` VALUES (1,1,6246),(1,2,6147),(1,3,7518),(1,4,9122),(1,5,8156),(2,1,3203),(2,2,8001),(2,3,5567),(2,4,4101),(2,5,6412),(3,1,6326),(3,2,4363),(3,3,7791),(3,4,4629),(3,5,8566),(4,1,5031),(4,2,5883),(4,3,5358),(4,4,3481),(4,5,8390),(5,1,7134),(5,2,7364),(5,3,6430),(5,4,6910),(5,5,6314),(6,1,8417),(6,2,4128),(6,3,7859),(6,4,4881),(6,5,9466),(7,1,9101),(7,2,9166),(7,3,7536),(7,4,5479),(7,5,6673),(8,1,6117),(8,2,7177),(8,3,9483),(8,4,5194),(8,5,5917),(9,1,9216),(9,2,3333),(9,3,3003),(9,4,4403),(9,5,6090),(10,1,4910),(10,2,3948),(10,3,5922),(10,4,6425),(10,5,5730),(11,1,9386),(11,2,9337),(11,3,8347),(11,4,8172),(11,5,7894),(12,1,5178),(12,2,6721),(12,3,4328),(12,4,9395),(12,5,3840),(13,1,7391),(13,2,5885),(13,3,3823),(13,4,8028),(13,5,6687),(14,1,8919),(14,2,7714),(14,3,8665),(14,4,8217),(14,5,4499),(15,1,4225),(15,2,6708),(15,3,4536),(15,4,5816),(15,5,3411),(16,1,6805),(16,2,7457),(16,3,8328),(16,4,4367),(16,5,8288),(17,1,5868),(17,2,3157),(17,3,3345),(17,4,8456),(17,5,4586),(18,1,4014),(18,2,4312),(18,3,5440),(18,4,4420),(18,5,3291),(19,1,7998),(19,2,6627),(19,3,6463),(19,4,3596),(19,5,6571),(20,1,4746),(20,2,6992),(20,3,7579),(20,4,3355),(20,5,4505),(21,1,4518),(21,2,7196),(21,3,5735),(21,4,4482),(21,5,9134),(22,1,7454),(22,2,9083),(22,3,8673),(22,4,7323),(22,5,3293),(23,1,3426),(23,2,8817),(23,3,3059),(23,4,7858),(23,5,9190);
/*!40000 ALTER TABLE `oc_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) NOT NULL,
  `title` varchar(5) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(90) NOT NULL,
  `added_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_status1_idx` (`status_id`),
  CONSTRAINT `fk_user_status1` FOREIGN KEY (`status_id`) REFERENCES `oc_user_status` (`user_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user`
--

LOCK TABLES `oc_user` WRITE;
/*!40000 ALTER TABLE `oc_user` DISABLE KEYS */;
INSERT INTO `oc_user` VALUES (1,1,'Mme','Follet','Sabrina','sabfol','pass1','sabrina.follet@free.fr','2016-01-09 18:43:51'),(2,1,'Mlle','Bouzerar','Sarah','sarbou','pass2','sarah.bouzerar@yahoo.fr','2016-03-18 16:28:12'),(3,2,'M.','Louv','Rygel','ryglou','pass3','rygel.louv@oc.com','2016-02-21 17:35:47'),(4,2,'M.','Bouzerar','David','davbou','pass4','david.bouzerar@oc.com','2016-02-02 15:33:04'),(5,1,'M.','Willis','Lillith','rhoncus','Nulla','quam.habitant@euplacerat.ca','2017-01-09 08:43:51'),(6,1,'Mlle','Riggs','Beau','bleu','feugiat','sceler.dui@nonummy.co.uk','2017-02-03 07:48:13'),(7,2,'Mlle','Mathews','Calista','ipsom','dolor','consectetuer.rhoncus@gravidaunt.ca','2016-07-18 22:22:57'),(8,1,'Mme','Garcia','Keely','dignism','iaculis','Aliquam@interdumNunc.edu','2016-11-10 08:01:41'),(9,1,'Mme','Barber','Signe','Nulla','Fusce','auctor@arcu.com','2017-07-07 20:55:09'),(10,1,'Mlle','Golden','Ginger','etc','arcu.','risus.fringilla@sagitisauris.edu','2016-06-13 05:19:56'),(11,2,'M.','Johnson','Alfonso','ac','fringilla','lacinia@eget.edu','2016-04-28 05:18:46'),(12,1,'M.','Macdonald','Asher','lacinia','urna','nec.mauris.blandit@enimnisl.co.uk','2016-10-24 06:08:45'),(13,2,'Mlle','Walker','Raya','ennim','felis','ultrices.sit@metusliquamerat.edu','2017-12-16 13:02:53'),(14,1,'Mme','Rush','Harlan','iaculis','amet','ut.sagittis@malesuada.ca','2017-07-16 17:15:43'),(15,1,'M.','Stephenson','Cody','ante','al','fermentum.arcu@ornaresce.org','2017-03-29 03:07:36'),(16,1,'Mlle','Allen','Roanna','legestas','dapibus','Sed@Inmi.net','2017-07-21 10:55:28'),(17,1,'M.','Grant','Joel','Aenean','metus','ornare@eratEtiam.org','2016-07-18 16:36:32'),(18,1,'Mlle','Hicks','Abigail','Integer','Duis','neque@viverradonec.co.uk','2017-02-10 20:06:11'),(19,1,'M.','Allison','Grady','scelerisque','tincidunt','congue.aliquet@augueut.edu','2017-03-18 10:18:00'),(20,1,'M.','Hamilton','Cain','urna','edt','ut.cursus@tortor.co.uk','2016-03-06 23:07:57'),(21,2,'Mlle','Hartman','Kirsten','auctor','Sed','dis.montes@Vivamussit.edu','2016-04-28 07:57:43'),(22,1,'M.','Pitts','Davis','pele','elementum','in.tellus@semperauctor.ca','2017-07-10 22:36:37'),(23,1,'M.','Baldwin','Fletcher','Donec','turpis','ultrices.adipiscing@eratvolutpat.net','2016-11-29 09:08:48'),(24,1,'Mme','Leon','Raya','viltae','luctus','nibh.mauris@ametnullaDonec.edu','2016-09-07 19:25:13'),(25,1,'Mme','Reeves','Sheila','nisl','elu','vulputate.lacus@nibhDonec.net','2017-06-21 21:46:15'),(26,1,'Mme','Lester','Portia','magnis','congue','mauris@condimeget.org','2016-10-28 19:19:37'),(27,1,'M.','Mooney','Elliott','purus','nec','Duis.diam@nibh.edu','2016-09-24 17:35:46'),(28,1,'M.','Bernard','Aristotle','eros','ipsum','adipiscing@aliquetProin.org','2016-01-08 07:48:55'),(29,2,'M.','Lindsay','Briar','efit','eget','eros.Nam@sitametnulla.org','2017-01-31 10:45:58'),(30,1,'Mlle','Stafford','Amanda','Nullam','luctus','feugiat.Lorem@vulteudio.co.uk','2017-06-07 04:22:22'),(31,1,'M.','Mitchell','Gay','via','massa','semper.tempor@egetornare.com','2016-09-25 05:49:31'),(32,1,'Mlle','Faulkner','Rashad','Maurris','Nullam','vultate.velit.eu@arcuMorbi.edu','2017-09-03 23:32:46'),(33,2,'M.','Curtis','Andrew','Quisque','magna','sed@nonummyut.edu','2017-06-16 01:36:20'),(34,1,'M.','Cash','Oscar','natoque','est','tempor.erat@feugiat.ca','2016-04-08 17:05:30'),(35,1,'M.','Lopez','Zeus','blet','Cum','nisi.sociis@inconseripsum.com','2017-06-28 15:03:06'),(36,1,'Mlle','Aguirre','Lester','id','tristique','dignissim.Maecenas@mauris.net','2016-07-12 04:07:30'),(37,1,'M.','English','Garrett','ipsum','aliquam','Aenean.gravida@etmalesuadafames.com','2017-06-02 12:22:17'),(38,1,'M.','Mullen','Eden','ennimm','turpis','netus@ullamcorpervelit.co.uk','2017-03-13 07:58:49'),(39,1,'Mlle','Ford','Pearl','edu','tincidunt','massa.uspendis@maurisut.ca','2016-05-01 06:50:11'),(40,1,'Mlle','Martin','Liberty','mollis','degestas','malesuada@condimentum.net','2016-11-28 04:05:31'),(41,1,'Mlle','Young','Bo','imar','ac','luctus.aliquet@ipsum.org','2017-04-12 22:03:34'),(42,1,'Mme','Mcneil','Eleanor','atc','Duis','ac.phasellus@sagittis.edu','2016-06-24 16:50:26'),(43,1,'Mlle','Coulon','Miranda','erat','magnat','vitae@at.net','2017-05-15 02:57:59'),(44,2,'Mlle','Adams','Sonia','convallis','magna','ipsum.cursus@sitametrisus.ca','2016-04-23 10:20:53'),(45,2,'Mme','Walls','Nina','lorem','diam','sit.amet.orci@ametorciUt.org','2017-10-05 22:14:48'),(46,1,'M.','Combs','Damian','dictum','arcu','augue@quamafelis.co.uk','2017-06-08 20:38:36'),(47,1,'M.','Clements','Melvin','fermentum','non','pellentesque.facilis@Maurisutquam.edu','2016-05-26 18:07:11'),(48,1,'Mme','Mason','Isabella','hendrerit','consequat','In@Aliquamerat.co.uk','2016-10-14 06:57:38'),(49,1,'Mme','Berger','Bethany','purrus','tellus','sed@duinectempus.edu','2017-04-02 16:13:31'),(50,1,'Mme','Mckay','Odysseus','varius','blenim','diggnisim.magna@inat.edu','2016-03-19 15:31:13'),(51,1,'Mme','Whitney','Cameron','imperdiet','amet','Duis.elementum@ornare.com','2016-03-30 09:54:59'),(52,1,'M.','Zamora','Wylie','semi','odio','aliquet.molestie.tellus@sitamet.org','2017-05-09 09:01:42'),(53,1,'M.','Cash','Kennedy','Phasellus','et','nibh.lacinia@turpis.com','2017-01-16 05:06:01'),(54,2,'M.','Curtis','Yeo','turpis','efu','ante.lectus@uspendis.net','2016-06-24 12:40:53'),(55,1,'Mlle','Rocha','Amal','tepor','molestie','a.magna@Maecenas.com','2017-01-08 21:00:20'),(56,2,'M.','Case','Xander','euismod','diam','imperdiet@tibulumsa.edu','2016-11-09 20:37:52'),(57,1,'M.','Lloyd','Charles','Nunic','Phasellus','netus.malesuada@dictum.co.uk','2017-01-15 01:40:13'),(58,1,'Mlle','Butler','Deborah','temus','Duis','odio@utmolestie.com','2016-01-04 11:20:07'),(59,2,'M.','Mccullough','Kieran','sit','auctor,','risus.Donec@enimCurabiturmassa.co.uk','2016-07-17 18:51:27'),(60,1,'M.','David','Melvin','nibh','nec','luctus.bitur@accumsan.co.uk','2016-06-18 20:28:07'),(61,1,'M.','Obrien','Daryl','obda','sem','estibul.sit@sagittis.ca','2017-04-22 13:22:36'),(62,1,'M.','Todd','Christian','dante','fermentum','liquet.metus@maurisus.edu','2017-07-04 04:20:27'),(63,1,'Mme','Luna','Imani','non','est','dui@consequatnec.ca','2016-02-17 19:55:55'),(64,1,'M.','Conway','Castor','nunac','erat','lorem.ac@enim.edu','2017-11-04 05:52:26'),(65,2,'Mme','Stanton','Oleg','tellus','ettu','Duis.sit.amet@liberoettristique.org','2016-04-21 14:11:35'),(66,1,'Mlle','Forbes','Delilah','ultrices','vel','at.iaculis.quis@erosturpis.co.uk','2017-06-14 19:31:22'),(67,2,'Mme','Bray','Felicia','padie','varius','Donec@lacus.com','2017-10-18 18:53:17'),(68,2,'M.','Rich','Jordan','Etiam','id,','Maecenas@consected.com','2017-06-10 18:34:37'),(69,2,'Mme','Conrad','Thomas','Maecenas','urna','nisi@elit.co.uk','2016-01-19 15:00:03'),(70,1,'M.','Mcgee','Clio','tiempus','ac','pretium.aliquet@Morbisit.edu','2016-04-11 18:54:52'),(71,2,'M.','Santiago','Nevada','mouris','Sed','commodo.hendrerit@amsuscipit.net','2016-09-16 03:44:06'),(72,1,'Mlle','Elliott','Bertha','cubilia','Nullam','metus@idnunc.ca','2017-02-24 01:35:26'),(73,1,'Mlle','Vasquez','Azalia','Morbi','denim','Suspendis@nislNulla.com','2016-10-21 19:04:33'),(74,2,'M.','Snider','Joshua','tincidt','pharetra,','feugiat@at.com','2016-04-16 15:41:08'),(75,1,'M.','Patrick','Zachary','quiss','libero','blandit.nulla@posuere.com','2017-11-23 19:15:29'),(76,1,'M.','Brewer','Cairo','interdum','neim','sociis.natoque@integeraliquam.com','2016-04-17 05:07:34'),(77,1,'Mme','Park','Jemima','tinidunt','Aenean','nulla@sed.edu','2017-07-28 11:08:02'),(78,1,'M.','Cotton','Jelani','diam','dui','Proin.dolor@ipsumdolorsit.ca','2017-03-22 23:50:10'),(79,1,'Mlle','Olsen','Valentine','dictumm','Integer','Nullam.nisl@nascetur.edu','2016-04-12 20:33:40'),(80,2,'M.','Fitzpatrick','Maxwell','vittae','Phasellus','malesuada.fringilla@tristiques.com','2017-04-23 06:44:56'),(81,2,'Mme','Ortiz','Olympia','sem','pictr','consequat.nec@risusDonec.ca','2017-08-20 15:18:01'),(82,2,'Mme','Ayers','Blossom','eget,','dictum','luctus.Curabitur@odiosemper.org','2016-12-31 02:42:06'),(83,2,'Mlle','Roach','Melinda','Nunec','in,','enim.consequat@Etiam.org','2016-08-26 15:01:17'),(84,1,'M.','Callahan','Erich','nec','Proin','dui.semper.et@fermentuan.ca','2017-01-18 08:15:18'),(85,1,'M.','Steele','Otto','Deyer','molestie','amet.eu@et.edu','2016-04-24 23:07:25'),(86,1,'Mlle','Pierce','Rogan','muris','jet','mauris@ipsum.org','2016-05-19 04:03:26'),(87,1,'M.','Puckett','Martena','feugiat','eju','consequat.enim@Pellentesquehabitant.com','2016-06-17 04:45:33'),(88,2,'Mme','Sutton','Camden','condimentum','nisi','Nam.dolor@non.ca','2016-06-26 20:53:30'),(89,2,'Mlle','Price','Alexa','Cras','emu,','scelerisque.sed.sapien@pellentesque.net','2016-04-17 11:16:09'),(90,1,'Mme','Hurst','Caleb','montes','posuere','tincidunt@montes.org','2017-07-20 22:54:05'),(91,2,'M.','Moon','Ciaran','Nunoc','aliquam','tortor.Nunc@eros.edu','2016-06-18 03:29:18'),(92,1,'M.','Norris','Quinlan','negestas','Pellentesque','faucibus.nulla@ultrices.org','2017-08-08 13:33:27'),(93,1,'Mme','Williams','Rylee','nascetur','Aliquam','Nunc.laoreets@maurisaliquameu.ca','2016-05-09 13:09:37'),(94,2,'Mme','Guy','Kirsten','empor','urna','elit@maurissit.com','2017-04-26 10:40:04');
/*!40000 ALTER TABLE `oc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `user_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_status` varchar(45) NOT NULL,
  PRIMARY KEY (`user_status_id`),
  UNIQUE KEY `status_UNIQUE` (`user_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'Customer'),(2,'Employee');
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-21 15:55:33
