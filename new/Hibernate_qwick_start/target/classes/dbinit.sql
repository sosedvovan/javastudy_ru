-- Server version	5.6.25-log

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
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `first_name` varchar(60) NOT NULL,
    `last_name` varchar(40) NOT NULL,
    `birth_date` date DEFAULT NULL,
    `version` int(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UQ_CONTACT_1` (`first_name`,`last_name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_hobby_detail`
--

DROP TABLE IF EXISTS `contact_hobby_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_hobby_detail` (
    `contact_id` int(11) NOT NULL,
    `hobby_id` varchar(20) NOT NULL,
    PRIMARY KEY (`contact_id`,`hobby_id`),
    KEY `FK_CONTACT_HOBBY_DETAIL_2` (`hobby_id`),
    CONSTRAINT `FK_CONTACT_HOBBY_DETAIL_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE CASCADE,
    CONSTRAINT `FK_CONTACT_HOBBY_DETAIL_2` FOREIGN KEY (`hobby_id`) REFERENCES `hobby` (`hobby_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_tel_detail`
--

DROP TABLE IF EXISTS `contact_tel_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_tel_detail` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `contact_id` int(11) NOT NULL,
    `tel_type` varchar(20) NOT NULL,
    `tel_number` varchar(20) NOT NULL,
    `version` int(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_contact_tel_detail_1` (`contact_id`,`tel_type`),
    CONSTRAINT `FK_CONTACT_TEL_DETAIL_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hobby`
--

DROP TABLE IF EXISTS `hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hobby` (
    `hobby_id` varchar(20) NOT NULL,
    PRIMARY KEY (`hobby_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-05 20:08:46

------------------------------------------------------------------

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
    `ad_id` int(11) NOT NULL AUTO_INCREMENT,
    `street` varchar(200) DEFAULT NULL,
    `city` varchar(200) DEFAULT NULL,
    PRIMARY KEY (`ad_id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (44,'Lenina','Moscow'),(45,'Lenina','Moscow'),
                             (46,'Lenina','Moscow'),(48,'Lenina','Moscow');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `firstName` varchar(200) DEFAULT NULL,
    `lastName` varchar(200) DEFAULT NULL,
    `fk_ad_id` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_ad_id` (`fk_ad_id`),
    CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_ad_id`) REFERENCES `address` (`ad_id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (58,'FirstName','LasettName',44),
                              (59,'FirstName','LasettName',45),
                              (60,'FirstName','LasettName',46),
                              (61,'FirstName','LasettName',48);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-17 20:50:49
