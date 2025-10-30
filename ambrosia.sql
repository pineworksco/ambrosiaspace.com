-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sfrkkokjbvxtqhzgrpxufuqxuwhxfhtmqgmt` (`primaryOwnerId`),
  CONSTRAINT `fk_sfrkkokjbvxtqhzgrpxufuqxuwhxfhtmqgmt` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yuvfgujxxephjnvztkibverzjivmegqxwtmk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qdifomnlqxsgfywwhejmqcnequxtbdcojrvx` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_xvwyzftmdobeojwweoajkaspwnmkkpmonxdn` (`dateRead`),
  KEY `fk_ntqvknjpmnenxnwtkjafmxawyinuwibusulj` (`pluginId`),
  CONSTRAINT `fk_ntqvknjpmnenxnwtkjafmxawyinuwibusulj` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_shqlddwuyedujnpelcnflwslqouvozqqbdnr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kzrxskqqkusewetbsbdkyhyiponljmdujpsy` (`sessionId`,`volumeId`),
  KEY `idx_ocdfglnzmqmomprwaphakbocwusisrsoysld` (`volumeId`),
  CONSTRAINT `fk_nxiemqwxrosdiinicfsxkbsfipfzkltwyioa` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wwfxndyypqucpdcfrspngcjdevvartiwwuxp` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_naniekieqvbykwcxyughlzkfblajwwygobur` (`filename`,`folderId`),
  KEY `idx_evvfxuorbcllqnautjqvgykremtgpwythyla` (`folderId`),
  KEY `idx_mdnngsjgdmgjbjcllwllavriobdabqzotntb` (`volumeId`),
  KEY `fk_smnqbggovzljwfnxsevwrzzjssphawgofhid` (`uploaderId`),
  CONSTRAINT `fk_guvntqujdgrkwkjsppanyxltcoohfidfnqvf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nahsulrunoxizhoklccsdslqfdyvkrsdlprc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_smnqbggovzljwfnxsevwrzzjssphawgofhid` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xctskydbmclhvjnaeldevqaqbjaeuaspubwm` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (21,1,1,1,'payload-locker.svg','image/svg+xml','image',NULL,594,471,16475,NULL,NULL,NULL,'2025-10-26 20:50:21','2025-10-26 20:50:21','2025-10-26 20:50:21'),(22,1,1,1,'payload-rack.svg','image/svg+xml','image',NULL,700,613,212826,NULL,NULL,NULL,'2025-10-26 20:50:21','2025-10-26 20:50:21','2025-10-26 20:50:21'),(59,1,1,1,'arnab.jpg','image/jpeg','image',NULL,1603,1877,308991,NULL,NULL,NULL,'2025-10-27 02:45:55','2025-10-27 02:45:55','2025-10-27 02:45:55'),(60,1,1,1,'charlie.jpg','image/jpeg','image',NULL,1860,1825,355025,NULL,NULL,NULL,'2025-10-27 02:45:55','2025-10-27 02:45:55','2025-10-27 02:45:55'),(61,1,1,1,'james.jpg','image/jpeg','image',NULL,2289,2578,769010,NULL,NULL,NULL,'2025-10-27 02:45:55','2025-10-27 02:45:55','2025-10-27 02:45:55'),(62,1,1,1,'mario.jpg','image/jpeg','image',NULL,1790,2157,544096,NULL,NULL,NULL,'2025-10-27 02:45:55','2025-10-27 02:45:55','2025-10-27 02:45:55'),(63,1,1,1,'susan.jpg','image/jpeg','image',NULL,2117,2255,812478,NULL,NULL,NULL,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56'),(64,1,1,1,'victoria.jpg','image/jpeg','image',NULL,1702,1663,449019,NULL,NULL,NULL,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56'),(89,1,1,1,'fpo-01.jpg','image/jpeg','image',NULL,1800,724,382747,NULL,NULL,NULL,'2025-10-27 02:59:37','2025-10-27 02:59:37','2025-10-27 02:59:37');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_uquwzlwywdgfsvtdvzhayvxobvfddiyastka` (`siteId`),
  CONSTRAINT `fk_igqzjsseoevunlrgwpcohqgacqlmekclhlps` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uquwzlwywdgfsvtdvzhayvxobvfddiyastka` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
INSERT INTO `assets_sites` VALUES (21,1,NULL),(22,1,NULL),(59,1,NULL),(60,1,NULL),(61,1,NULL),(62,1,NULL),(63,1,NULL),(64,1,NULL),(89,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dnrttwbkuughxxsxmmwhhjoxhlabpucqcucd` (`userId`),
  CONSTRAINT `fk_dnrttwbkuughxxsxmmwhhjoxhlabpucqcucd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_xhghhtgsihzophtjodjzjohxhqnoqxxmhtsb` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agzxkyirukvsqukuqissmwkwbtsktymmecna` (`groupId`),
  KEY `fk_atsljfnfdtdgdcxwwcnrvhbounfoxcnudeav` (`parentId`),
  CONSTRAINT `fk_apgynxryxdimbjqwhvrgfmtrinldczwpfrih` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_atsljfnfdtdgdcxwwcnrvhbounfoxcnudeav` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hchgeltuulvntqdcbeiwnavjtfsszxqjwbdu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cttdrurmhnloklxdfahitgpyghdojmneyjrf` (`name`),
  KEY `idx_xkdeyrkfpaehzhcjhxfxlkwbbrxjyqcghiga` (`handle`),
  KEY `idx_zrluvlowqdrvcjtxqvprpqozimtmixlgfpnw` (`structureId`),
  KEY `idx_zrjhfiaplggewnhayvdsxcjouemjuwrxxvtv` (`fieldLayoutId`),
  KEY `idx_ffgmfhvmzpndownxvdouiffetzefcbidslpb` (`dateDeleted`),
  CONSTRAINT `fk_kspswxxdmqlxhbuimreqcwzdutvkjpgxeuge` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qwoqhffnfvdgujekqelpkvpdggyhuhpxiogt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_edzunwkpyhrzreuonzadetcbeheqxprevwhq` (`groupId`,`siteId`),
  KEY `idx_euyhyiqnhisnrfdfajzakjtpzskrtbcgvmbr` (`siteId`),
  CONSTRAINT `fk_lnmrjnzoxdtodbxfyruyzxgnjssfsdwgguoq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zwunsqyvyjimhjuiadfoyltqprvpawkmwkvp` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_qopzxjabbabohkecajhmrlpjliyhhthdurfa` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jsyccfanmbatanebimojbpwarakjvzqghyeq` (`siteId`),
  KEY `fk_ojnjtitpwbxwimnfvqkzvfrzcsnvgedzeaww` (`userId`),
  CONSTRAINT `fk_ijnesxlqjupbokxzjlmsqugnzffzwfbwtnzu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jsyccfanmbatanebimojbpwarakjvzqghyeq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ojnjtitpwbxwimnfvqkzvfrzcsnvgedzeaww` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (47,1,'title','2025-10-27 03:08:50',0,1),(52,1,'primaryOwnerId','2025-10-27 15:32:50',0,1),(54,1,'title','2025-10-27 03:08:50',0,1),(66,1,'primaryOwnerId','2025-10-27 17:50:18',0,1),(68,1,'title','2025-10-27 03:08:50',0,1),(80,1,'title','2025-10-27 03:08:50',0,1),(90,1,'title','2025-10-27 17:15:19',0,1),(93,1,'title','2025-10-27 03:08:50',0,1),(94,1,'title','2025-10-27 03:08:50',0,1),(104,1,'title','2025-10-27 03:08:50',0,1),(105,1,'title','2025-10-27 03:08:50',0,1),(106,1,'title','2025-10-27 03:08:50',0,1),(163,1,'primaryOwnerId','2025-10-27 15:34:11',0,1),(163,1,'title','2025-10-27 15:34:11',0,1),(216,1,'title','2025-10-27 20:19:11',0,1),(258,1,'postDate','2025-10-27 19:50:40',0,1),(258,1,'slug','2025-10-27 19:50:19',0,1),(258,1,'title','2025-10-27 19:49:23',0,1),(258,1,'uri','2025-10-27 19:50:19',0,1),(259,1,'postDate','2025-10-27 19:50:24',0,1),(259,1,'status','2025-10-27 19:50:24',0,1),(259,1,'title','2025-10-27 19:50:37',0,1),(283,1,'postDate','2025-10-27 19:52:32',0,1),(283,1,'slug','2025-10-27 19:52:14',0,1),(283,1,'title','2025-10-27 19:52:14',0,1),(283,1,'uri','2025-10-27 19:52:14',0,1),(284,1,'title','2025-10-27 19:52:32',0,1),(287,1,'postDate','2025-10-27 19:52:23',0,1),(287,1,'status','2025-10-27 19:52:23',0,1),(287,1,'title','2025-10-27 19:52:32',0,1),(309,1,'postDate','2025-10-27 20:06:22',0,1),(309,1,'status','2025-10-27 20:06:22',0,1),(309,1,'title','2025-10-27 20:06:22',0,1),(310,1,'postDate','2025-10-27 20:06:22',0,1),(310,1,'status','2025-10-27 20:06:22',0,1),(310,1,'title','2025-10-27 20:06:22',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_kjdxcipwcptmsowlgoxgkpuuimjlgqylmnpa` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_mwelmipzmlqjqzrkapxayeddnmgdivwuswci` (`siteId`),
  KEY `fk_ntlgsdtmabvqymbmsxvkfuufvdhfilyopodk` (`fieldId`),
  KEY `fk_lytpwyvhuhpbeukngjkogiuofvzebwqeugym` (`userId`),
  CONSTRAINT `fk_lytpwyvhuhpbeukngjkogiuofvzebwqeugym` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mwelmipzmlqjqzrkapxayeddnmgdivwuswci` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ntlgsdtmabvqymbmsxvkfuufvdhfilyopodk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tgvhfuvenjgfufnqznnpapkwuftregjjuqax` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,9,'6a83c98b-49d8-48a6-824a-dda1833e0e2a','2025-10-27 20:19:11',0,1),(7,1,3,'29b186c5-f685-4be8-a307-b0738c899ab4','2025-10-27 15:21:09',0,1),(7,1,8,'7c1c36cc-73ad-4707-a822-4dc3a341bf2f','2025-10-27 15:03:49',0,1),(8,1,7,'0b806bbc-71ae-4b37-aeef-4ece789c11f3','2025-10-27 15:03:49',0,1),(18,1,6,'66b5166c-6b0e-4fec-b4ba-1ba2104e1944','2025-10-27 19:18:23',0,1),(18,1,6,'b2481edd-d668-4a0f-a2cc-b175265567cd','2025-10-27 19:27:48',0,1),(18,1,10,'440e4cd4-ad7b-4fcf-ae62-b65845128284','2025-10-27 19:22:59',0,1),(18,1,12,'754c38f8-5445-4acf-ad86-8adf122ab477','2025-10-27 19:20:43',0,1),(29,1,5,'4d9dc53f-0f89-4185-ae47-df93f868ddcf','2025-10-27 19:20:43',0,1),(29,1,6,'c87b76ab-b772-481c-aa02-5dbeb7b5e2a4','2025-10-27 19:20:31',0,1),(42,1,13,'d90c6e3c-0cae-4279-9c52-d11bf45bd267','2025-10-27 17:17:01',0,1),(52,1,4,'362e7351-914e-441d-b1ed-f04b6aeff661','2025-10-27 15:32:50',0,1),(65,1,14,'afe5abd3-8a1e-40bd-97e7-b3044d9ef733','2025-10-27 17:50:18',0,1),(66,1,3,'f9e7eea2-cac7-41f7-8e0b-395ffab391c5','2025-10-27 17:50:18',0,1),(90,1,12,'12dac647-cacd-4ca4-9ffa-9354387d49df','2025-10-27 17:15:19',0,1),(91,1,3,'21368d75-9ded-43ce-9509-26a20beef23b','2025-10-27 17:15:19',0,1),(91,1,6,'c87b76ab-b772-481c-aa02-5dbeb7b5e2a4','2025-10-27 17:05:49',0,1),(130,1,3,'29b186c5-f685-4be8-a307-b0738c899ab4','2025-10-27 15:21:09',0,1),(143,1,3,'29b186c5-f685-4be8-a307-b0738c899ab4','2025-10-27 15:21:09',0,1),(163,1,4,'362e7351-914e-441d-b1ed-f04b6aeff661','2025-10-27 15:34:11',0,1),(216,1,1,'9a6fc538-caf5-4798-a7fa-4830353286e9','2025-10-27 20:19:11',0,1),(216,1,3,'a08474ce-9f95-422c-aaec-efef319931b8','2025-10-27 20:19:11',0,1),(216,1,4,'f476787e-4565-4b29-ad86-4ddc4ec56102','2025-10-27 20:19:11',0,1),(216,1,10,'440e4cd4-ad7b-4fcf-ae62-b65845128284','2025-10-27 19:22:59',0,1),(216,1,12,'754c38f8-5445-4acf-ad86-8adf122ab477','2025-10-27 19:25:09',0,1),(217,1,3,'21368d75-9ded-43ce-9509-26a20beef23b','2025-10-27 19:24:52',0,1),(217,1,6,'c87b76ab-b772-481c-aa02-5dbeb7b5e2a4','2025-10-27 19:25:09',0,1),(258,1,3,'84522c4a-a16d-4931-9fe4-eee7c085d454','2025-10-27 19:50:16',0,1),(258,1,9,'6a83c98b-49d8-48a6-824a-dda1833e0e2a','2025-10-27 19:51:35',0,1),(259,1,3,'29b186c5-f685-4be8-a307-b0738c899ab4','2025-10-27 19:50:37',0,1),(259,1,6,'cd1877b4-b584-45b0-bed6-ec29b69e4643','2025-10-27 19:50:37',0,1),(259,1,8,'7c1c36cc-73ad-4707-a822-4dc3a341bf2f','2025-10-27 19:50:37',0,1),(259,1,15,'90124b10-7db8-4013-bbd7-0ca03a50cf64','2025-10-27 19:50:37',0,1),(260,1,1,'6802c467-ea08-45a9-8ec4-6f62c4f8bb55','2025-10-27 19:50:37',0,1),(260,1,7,'0b806bbc-71ae-4b37-aeef-4ece789c11f3','2025-10-27 19:50:37',0,1),(261,1,7,'60e2c2f7-e6f2-4d78-b230-31b1f801d75b','2025-10-27 19:50:37',0,1),(283,1,3,'84522c4a-a16d-4931-9fe4-eee7c085d454','2025-10-27 19:59:08',0,1),(283,1,9,'6a83c98b-49d8-48a6-824a-dda1833e0e2a','2025-10-27 19:58:06',0,1),(284,1,3,'29b186c5-f685-4be8-a307-b0738c899ab4','2025-10-27 19:52:32',0,1),(284,1,6,'cd1877b4-b584-45b0-bed6-ec29b69e4643','2025-10-27 19:52:32',0,1),(284,1,8,'7c1c36cc-73ad-4707-a822-4dc3a341bf2f','2025-10-27 19:52:32',0,1),(284,1,15,'90124b10-7db8-4013-bbd7-0ca03a50cf64','2025-10-27 19:52:32',0,1),(285,1,1,'6802c467-ea08-45a9-8ec4-6f62c4f8bb55','2025-10-27 19:52:32',0,1),(285,1,7,'0b806bbc-71ae-4b37-aeef-4ece789c11f3','2025-10-27 19:52:32',0,1),(286,1,7,'60e2c2f7-e6f2-4d78-b230-31b1f801d75b','2025-10-27 19:52:32',0,1),(287,1,3,'29b186c5-f685-4be8-a307-b0738c899ab4','2025-10-27 19:52:32',0,1),(287,1,6,'cd1877b4-b584-45b0-bed6-ec29b69e4643','2025-10-27 19:52:32',0,1),(287,1,8,'7c1c36cc-73ad-4707-a822-4dc3a341bf2f','2025-10-27 19:52:32',0,1),(287,1,15,'90124b10-7db8-4013-bbd7-0ca03a50cf64','2025-10-27 19:52:32',0,1),(288,1,1,'6802c467-ea08-45a9-8ec4-6f62c4f8bb55','2025-10-27 19:52:32',0,1),(288,1,7,'0b806bbc-71ae-4b37-aeef-4ece789c11f3','2025-10-27 19:52:32',0,1),(289,1,7,'60e2c2f7-e6f2-4d78-b230-31b1f801d75b','2025-10-27 19:52:32',0,1),(309,1,4,'ef3d36fa-65b3-4fbd-929c-03081bf821d1','2025-10-27 20:06:22',0,1),(309,1,16,'8e4cff34-4270-495a-a75c-b39b7017210b','2025-10-27 20:06:22',0,1),(310,1,4,'ef3d36fa-65b3-4fbd-929c-03081bf821d1','2025-10-27 20:06:22',0,1),(310,1,16,'8e4cff34-4270-495a-a75c-b39b7017210b','2025-10-27 20:06:22',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_acmovtmfsuerldmxjdcecpyuiwmqenlpaqzg` (`primaryOwnerId`),
  KEY `idx_iipnwoidsenirxypamnrolpdaefmmojfeuqv` (`fieldId`),
  CONSTRAINT `fk_jqphfovtlwflrklvrvrdughecqgghphquwsg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nawxxjuynhhlxjctuoyvswexqzpwsjngdkkg` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_quoystxhhxjjhzxayenfzptnkfzomvwpikta` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
INSERT INTO `contentblocks` VALUES (8,7,8),(11,10,8),(29,18,12),(35,34,12),(46,45,8),(91,90,12),(95,94,12),(107,7,15),(115,114,8),(116,114,15),(125,124,8),(131,130,8),(132,130,15),(135,134,8),(136,134,15),(144,143,8),(145,143,15),(148,147,8),(150,149,8),(151,149,15),(184,183,12),(187,186,12),(190,189,12),(217,216,12),(221,220,12),(227,226,12),(233,232,12),(242,241,12),(248,247,12),(260,259,8),(261,259,15),(264,263,8),(265,263,15),(285,284,8),(286,284,15),(288,287,8),(289,287,15),(292,291,8),(293,291,15),(295,294,8),(296,294,15),(302,301,12),(305,304,12);
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_fdgvfrecvibiytjynbshhtgmaiwxogrtzhug` (`userId`),
  CONSTRAINT `fk_fdgvfrecvibiytjynbshhtgmaiwxogrtzhug` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qnajtgclykyzlmzazgzldfmojbqujtmpopbp` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_goufaltrrwekfpkgrjhsgsfmgojladbtdyfl` (`creatorId`,`provisional`),
  KEY `idx_oyqyfeeuxcucopoonbjbbqjujwcglbspmqjo` (`saved`),
  KEY `fk_oaszbhyueoqnrzlicderiegnltgvntucumun` (`canonicalId`),
  CONSTRAINT `fk_oaszbhyueoqnrzlicderiegnltgvntucumun` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tzpcjlvsstycxxhuqjzbcsvpekfdwrmpmajh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_tjbdqdtefrfddqqwtikvsnbgmetvgrqekaja` (`elementId`,`timestamp`,`userId`),
  KEY `fk_biyfbdlzealcnistagmwsxtkartkdzcstwsd` (`userId`),
  KEY `fk_pxljgoybdnvnkvuvophseqpunabccpseogoj` (`siteId`),
  KEY `fk_dqdpbelzcwlkhchwwdhdloaclmwdmsfpkjie` (`draftId`),
  CONSTRAINT `fk_biyfbdlzealcnistagmwsxtkartkdzcstwsd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dqdpbelzcwlkhchwwdhdloaclmwdmsfpkjie` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pxljgoybdnvnkvuvophseqpunabccpseogoj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qugwihvitigrftdeapiksdkkdssoudcojhpu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2025-10-27 20:19:10'),(2,1,1,NULL,'save','2025-10-27 20:19:11'),(52,1,1,NULL,'edit','2025-10-27 15:32:48'),(66,1,1,NULL,'edit','2025-10-27 17:49:36'),(163,1,1,NULL,'edit','2025-10-27 15:34:00'),(258,1,1,NULL,'edit','2025-10-27 19:51:33'),(258,1,1,NULL,'save','2025-10-27 19:51:35'),(283,1,1,NULL,'edit','2025-10-27 19:58:48'),(283,1,1,NULL,'save','2025-10-27 19:59:08');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zyirmnfjibhfrczfovdgdlyabvsohhurfiun` (`dateDeleted`),
  KEY `idx_zepbxwbteaovqtmgelkvhjasokoeqrwkvrps` (`fieldLayoutId`),
  KEY `idx_vvvdadbewclzucdhbjemhpfmlpmldjtfzpof` (`type`),
  KEY `idx_svuhnvqivynwsoevitowotvwpeowegypvplj` (`enabled`),
  KEY `idx_rawxcqpnlpwxjahoyqvzewmiyzzlyyukyfdm` (`canonicalId`),
  KEY `idx_nytgysqcgamusihtxoflkiofzklcvosvrdnn` (`archived`,`dateCreated`),
  KEY `idx_ztyployyqjocauhvxdbsyjhngznurrllgiof` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_mnjysnctxczztwfbhbcxgpjgyhghxtaruaur` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_aepesturwghgdyitrmwmarhnzirzjjlyslqw` (`draftId`),
  KEY `fk_oikgddztsomsodtlienfmlxucxzelotiakvw` (`revisionId`),
  CONSTRAINT `fk_aepesturwghgdyitrmwmarhnzirzjjlyslqw` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oikgddztsomsodtlienfmlxucxzelotiakvw` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ubwtfznldjynkjigvzhordfomuxtrarnobkr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wntmnqmmizjqtteqseimxtcfgiywlfkxeegf` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-10-16 02:13:05','2025-10-16 02:13:05',NULL,NULL,NULL,'689562c7-a540-45df-b077-c328bf419d66'),(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-10-16 02:49:47','2025-10-27 20:19:11',NULL,NULL,NULL,'66ef4a73-148f-4d7f-af23-d0e14294df1c'),(3,2,NULL,1,2,'craft\\elements\\Entry',1,0,'2025-10-16 02:49:47','2025-10-16 02:49:47',NULL,NULL,NULL,'f7cb0b33-3272-4a3a-805d-a14e41c0be2c'),(7,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-10-25 13:53:50','2025-10-27 15:21:09',NULL,NULL,NULL,'2daba579-78f4-4c47-aae8-72d3f2f94043'),(8,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-25 13:53:50','2025-10-27 15:21:44',NULL,NULL,NULL,'af20d08a-b6d2-484e-b4e4-5b06ee9206de'),(9,2,NULL,2,2,'craft\\elements\\Entry',1,0,'2025-10-25 13:53:50','2025-10-25 13:53:50',NULL,NULL,NULL,'3b4049de-71a0-4c34-aadb-bf29bb22d019'),(10,7,NULL,3,4,'craft\\elements\\Entry',1,0,'2025-10-25 13:53:50','2025-10-27 03:08:50',NULL,NULL,NULL,'8faa8f6a-7161-418d-a548-46051e22e3ba'),(11,8,NULL,4,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-25 13:53:50','2025-10-25 13:53:50',NULL,NULL,NULL,'de8831fe-b958-4226-aeaa-3f9212b68a95'),(18,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-10-26 20:47:08','2025-10-27 19:27:48',NULL,NULL,NULL,'1ba8a20f-5013-4d26-af19-e09fda9ccd26'),(19,2,NULL,5,2,'craft\\elements\\Entry',1,0,'2025-10-26 20:47:08','2025-10-26 20:47:08',NULL,NULL,NULL,'b4839729-99d4-4f82-a61f-647ac5ba3b22'),(20,18,NULL,6,5,'craft\\elements\\Entry',1,0,'2025-10-26 20:47:08','2025-10-27 03:08:50',NULL,NULL,NULL,'05fa7afc-0c78-4a8d-bbe8-33587da991c7'),(21,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-26 20:50:21','2025-10-26 20:50:21',NULL,NULL,NULL,'c9651f86-f353-412b-819c-0d565f623323'),(22,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-26 20:50:21','2025-10-26 20:50:21',NULL,NULL,NULL,'18672533-ecd7-4c73-96d1-9538f0def635'),(27,2,NULL,7,2,'craft\\elements\\Entry',1,0,'2025-10-26 20:51:32','2025-10-26 20:51:32',NULL,NULL,NULL,'5b95e079-048e-489c-95ce-201871d6428d'),(28,18,NULL,8,5,'craft\\elements\\Entry',1,0,'2025-10-26 20:51:32','2025-10-27 03:08:50',NULL,NULL,NULL,'787a66ec-b2d1-40d6-affa-1a32b3e22e29'),(29,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 01:14:34','2025-10-27 19:20:43',NULL,NULL,NULL,'b33eb660-162f-4510-b153-cf4f61f3bf94'),(33,2,NULL,9,2,'craft\\elements\\Entry',1,0,'2025-10-27 01:19:02','2025-10-27 01:19:02',NULL,NULL,NULL,'d851a43a-7d78-4423-bb2e-18b5236e78ec'),(34,18,NULL,10,5,'craft\\elements\\Entry',1,0,'2025-10-27 01:19:02','2025-10-27 03:08:50',NULL,NULL,NULL,'809e013b-4b84-4eb6-835f-ad25ae5145a3'),(35,29,NULL,11,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 01:19:02','2025-10-27 01:19:02',NULL,NULL,NULL,'cf22687c-8076-4beb-b5dd-8cda76a9cee7'),(42,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2025-10-27 02:22:56','2025-10-27 17:17:01',NULL,NULL,NULL,'d772103a-5275-4c5d-920d-8f565bd5aae8'),(43,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-10-27 02:22:56','2025-10-27 02:22:56',NULL,NULL,NULL,'b9bd4918-2eba-4deb-8ead-43a9efd95955'),(44,2,NULL,12,2,'craft\\elements\\Entry',1,0,'2025-10-27 02:22:56','2025-10-27 02:22:56',NULL,NULL,NULL,'b865d850-4596-4ea6-86b3-3b09f8d89790'),(45,7,NULL,13,4,'craft\\elements\\Entry',1,0,'2025-10-27 02:22:56','2025-10-27 03:08:50',NULL,NULL,NULL,'dc18d8a7-807b-45c9-90a8-aa1fb70f9c19'),(46,8,NULL,14,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 02:22:56','2025-10-27 02:22:56',NULL,NULL,NULL,'ec347359-b936-457a-b681-5f680a49c44b'),(47,42,NULL,15,8,'craft\\elements\\Entry',1,0,'2025-10-27 02:22:56','2025-10-27 03:08:50',NULL,NULL,NULL,'f64e5a0b-5283-438a-9b53-32ae5350ce0e'),(48,43,NULL,16,7,'craft\\elements\\Entry',1,0,'2025-10-27 02:22:56','2025-10-27 02:22:56',NULL,NULL,NULL,'dd7ddb4b-d211-46b4-b1b5-5479464b2fbf'),(52,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-10-27 02:25:48','2025-10-27 15:32:50',NULL,NULL,NULL,'3fdae65f-42ac-4ccf-bbac-9098a8e9b1c2'),(53,2,NULL,17,2,'craft\\elements\\Entry',1,0,'2025-10-27 02:25:48','2025-10-27 02:25:48',NULL,NULL,NULL,'2df3c568-5213-4276-bccc-97fd4760db41'),(54,42,NULL,18,8,'craft\\elements\\Entry',1,0,'2025-10-27 02:25:48','2025-10-27 03:08:50',NULL,NULL,NULL,'1a2cbc85-741a-4904-858f-3b35f41beadd'),(55,52,NULL,19,7,'craft\\elements\\Entry',1,0,'2025-10-27 02:25:48','2025-10-27 02:25:48',NULL,NULL,NULL,'392a9703-543c-48e9-ae43-9fba158374a6'),(59,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-27 02:45:55','2025-10-27 02:45:55',NULL,NULL,NULL,'ce8f80ef-7260-43b0-a16a-bb053a761d40'),(60,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-27 02:45:55','2025-10-27 02:45:55',NULL,NULL,NULL,'6ecab40a-fc58-46f6-82b7-978283a00190'),(61,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-27 02:45:55','2025-10-27 02:45:55',NULL,NULL,NULL,'5b23cf8e-14c3-4202-a356-e45ec7887e25'),(62,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-27 02:45:55','2025-10-27 02:45:55',NULL,NULL,NULL,'d3d78a06-1096-4400-a0c4-8e658b9246c6'),(63,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-27 02:45:56','2025-10-27 02:45:56',NULL,NULL,NULL,'8b79481c-ef46-42b1-a873-0184db09d8fe'),(64,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-27 02:45:56','2025-10-27 02:45:56',NULL,NULL,NULL,'db66bd27-4b92-4df3-a3d3-c2f4979f034f'),(65,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2025-10-27 02:46:08','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',NULL,'5f7c4103-b45c-450a-9365-973284bdd0af'),(66,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-27 02:46:08','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'60beb34e-87b8-4699-bece-ecbad739839e'),(67,2,NULL,20,2,'craft\\elements\\Entry',1,0,'2025-10-27 02:46:07','2025-10-27 02:46:08',NULL,NULL,NULL,'9be6ac35-4747-4194-b242-4bebf40b56eb'),(68,65,NULL,21,10,'craft\\elements\\Entry',1,0,'2025-10-27 02:46:08','2025-10-27 03:08:50',NULL,'2025-10-27 20:19:11',NULL,'6fe2ef5b-4ec9-4c39-b6dd-bc5dc80a05d2'),(69,66,NULL,22,9,'craft\\elements\\Entry',1,0,'2025-10-27 02:46:08','2025-10-27 02:46:08',NULL,'2025-10-27 20:19:11',NULL,'187a9aa5-a95b-481f-b6ae-f861756e145b'),(76,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-27 02:49:33','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'eeac3cf2-c6d1-433c-8dcc-56f80a023010'),(77,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-27 02:49:33','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'bdd25032-61c9-4bf5-ae76-d2162565197f'),(78,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-27 02:49:33','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'0dca14a9-4a73-42d9-afe0-4e320d0b6f2e'),(79,2,NULL,23,2,'craft\\elements\\Entry',1,0,'2025-10-27 02:49:33','2025-10-27 02:49:33',NULL,NULL,NULL,'5901b100-837a-45e4-8be8-285a271a9f71'),(80,65,NULL,24,10,'craft\\elements\\Entry',1,0,'2025-10-27 02:49:33','2025-10-27 03:08:50',NULL,'2025-10-27 20:19:11',NULL,'738bb86d-09b2-44be-989e-1bc51f23b05a'),(81,76,NULL,25,9,'craft\\elements\\Entry',1,0,'2025-10-27 02:49:33','2025-10-27 02:49:33',NULL,'2025-10-27 20:19:11',NULL,'1254fc07-3cb3-42be-9bc6-2747502f6609'),(82,77,NULL,26,9,'craft\\elements\\Entry',1,0,'2025-10-27 02:49:33','2025-10-27 02:49:33',NULL,'2025-10-27 20:19:11',NULL,'ee76a817-a66c-43b0-98af-3602df544c86'),(83,78,NULL,27,9,'craft\\elements\\Entry',1,0,'2025-10-27 02:49:33','2025-10-27 02:49:33',NULL,'2025-10-27 20:19:11',NULL,'532df640-6cb8-4ef8-a78a-7e0b553af886'),(84,2,NULL,28,2,'craft\\elements\\Entry',1,0,'2025-10-27 02:53:56','2025-10-27 02:53:56',NULL,NULL,NULL,'8fdb4025-2079-48b4-80f4-608eeee7ecad'),(89,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-27 02:59:37','2025-10-27 02:59:37',NULL,NULL,NULL,'892a319c-7808-4631-beec-c98a165e70ce'),(90,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2025-10-27 02:59:56','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',NULL,'bba455ce-f56b-4a57-8d2f-d49ae629d62a'),(91,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 02:59:56','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'9dfa872c-df8d-40e1-baef-ba39cff2208e'),(92,2,NULL,29,2,'craft\\elements\\Entry',1,0,'2025-10-27 02:59:56','2025-10-27 02:59:56',NULL,NULL,NULL,'3f28fd82-9860-4e4c-8272-e7fb8a5544bf'),(93,65,NULL,30,10,'craft\\elements\\Entry',1,0,'2025-10-27 02:59:56','2025-10-27 03:08:50',NULL,'2025-10-27 20:19:11',NULL,'ccaeeb4f-b988-48b3-94e5-db947a1193bf'),(94,90,NULL,31,11,'craft\\elements\\Entry',1,0,'2025-10-27 02:59:56','2025-10-27 03:08:50',NULL,'2025-10-27 20:19:11',NULL,'7d4d7164-a23f-450f-a325-9895061ec1a3'),(95,91,NULL,32,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 02:59:56','2025-10-27 02:59:56',NULL,'2025-10-27 20:19:11',NULL,'7646fbb8-6a30-44cb-b81c-b2728c48e95d'),(98,2,NULL,33,2,'craft\\elements\\Entry',1,0,'2025-10-27 03:02:18','2025-10-27 03:02:18',NULL,NULL,NULL,'a620f6d3-8cd8-4f6e-9afd-f7d4af56fd63'),(99,18,NULL,34,5,'craft\\elements\\Entry',1,0,'2025-10-27 03:02:18','2025-10-27 03:08:50',NULL,NULL,NULL,'d94c03e1-d7db-4867-8933-5be6f239ffa9'),(100,2,NULL,35,2,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:42','2025-10-27 03:08:42',NULL,NULL,NULL,'d1dcc6f8-0ca7-4692-9a00-9a10d7139eea'),(101,2,NULL,36,2,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:50','2025-10-27 03:08:50',NULL,NULL,NULL,'98a3c62b-9596-481d-a119-de2504e35d43'),(102,18,NULL,37,5,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:43','2025-10-27 03:08:50',NULL,NULL,NULL,'90e8eced-148f-40c6-99fc-a1d6425604fb'),(103,7,NULL,38,4,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:43','2025-10-27 03:08:50',NULL,NULL,NULL,'990878b1-f20c-413f-9ae2-510008d1c69a'),(104,42,NULL,39,8,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:43','2025-10-27 03:08:50',NULL,NULL,NULL,'7bf32bd8-1a96-4dee-aa0c-0903fc7f974d'),(105,65,NULL,40,10,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:43','2025-10-27 03:08:50',NULL,'2025-10-27 20:19:11',NULL,'4913e882-a411-4307-a377-d0473c05d35e'),(106,90,NULL,41,11,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:43','2025-10-27 03:08:50',NULL,'2025-10-27 20:19:11',NULL,'59a220f7-9860-44dc-8f1a-51d869042b8e'),(107,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 03:28:31','2025-10-27 15:21:44',NULL,NULL,NULL,'bcfd1f87-2de4-4779-a6ae-0e8a64e07785'),(112,2,NULL,42,2,'craft\\elements\\Entry',1,0,'2025-10-27 03:29:31','2025-10-27 03:29:31',NULL,NULL,NULL,'e3bb18c5-e135-45b2-9e8a-6d6a540748ea'),(113,18,NULL,43,5,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:50','2025-10-27 03:29:31',NULL,NULL,NULL,'cf3b655a-a679-40c5-8f68-1d9786e8ff0f'),(114,7,NULL,44,4,'craft\\elements\\Entry',1,0,'2025-10-27 03:29:31','2025-10-27 03:29:31',NULL,NULL,NULL,'79a77537-ea73-40bd-989b-91da2d95f932'),(115,8,NULL,45,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 03:29:31','2025-10-27 03:29:31',NULL,NULL,NULL,'ee204f74-8bf6-416f-a473-dbd42e6a6600'),(116,107,NULL,46,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 03:29:31','2025-10-27 03:29:31',NULL,NULL,NULL,'46f20400-35dc-40b2-8b76-8817ca4029c7'),(117,42,NULL,47,8,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:50','2025-10-27 03:29:31',NULL,NULL,NULL,'71ae83e3-fa28-434b-ace9-287bae06d56c'),(118,65,NULL,48,10,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:50','2025-10-27 03:29:31',NULL,'2025-10-27 20:19:11',NULL,'825ffd3f-4f73-432d-8f76-bb2f0a19c850'),(119,90,NULL,49,11,'craft\\elements\\Entry',1,0,'2025-10-27 03:08:50','2025-10-27 03:29:31',NULL,'2025-10-27 20:19:11',NULL,'1edd55ca-0f15-4de9-8fec-bd7dff60988b'),(123,2,NULL,50,2,'craft\\elements\\Entry',1,0,'2025-10-27 03:29:57','2025-10-27 03:29:57',NULL,NULL,NULL,'3b47c296-ae81-4fc7-9c04-6e0de9fd77f0'),(124,7,NULL,51,4,'craft\\elements\\Entry',1,0,'2025-10-27 03:29:57','2025-10-27 03:29:57',NULL,NULL,NULL,'67f2a4bb-9275-4ff4-b345-1f9325d255af'),(125,8,NULL,52,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 03:29:57','2025-10-27 03:29:57',NULL,NULL,NULL,'b01919be-8583-4434-a6bd-904a82d0df47'),(130,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-10-27 03:33:54','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',NULL,'a7520ade-3120-410a-9728-9fbd565c84f0'),(131,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 03:33:54','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'e8d759b3-b69e-42b4-a90d-3e39864f2c0a'),(132,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 03:33:54','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'7ef50c4d-76cb-4b78-ab6c-be72f4426a4b'),(133,2,NULL,53,2,'craft\\elements\\Entry',1,0,'2025-10-27 03:33:54','2025-10-27 03:33:54',NULL,NULL,NULL,'2afea61b-8ac1-4124-8e4e-d0c51c5c53b3'),(134,130,NULL,54,4,'craft\\elements\\Entry',1,0,'2025-10-27 03:33:54','2025-10-27 03:33:54',NULL,'2025-10-27 20:19:11',NULL,'d35360bc-4fd0-495c-ab04-e65010753716'),(135,131,NULL,55,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 03:33:54','2025-10-27 03:33:54',NULL,'2025-10-27 20:19:11',NULL,'75939963-7b4f-4470-9414-08a81e0e69e2'),(136,132,NULL,56,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 03:33:54','2025-10-27 03:33:54',NULL,'2025-10-27 20:19:11',NULL,'acdb3b63-bde3-49e0-9c1e-39e3512b68e7'),(143,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-10-27 15:03:49','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',NULL,'7c3b99c7-36c2-49a7-83a7-69f9c4f2d812'),(144,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 15:03:49','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'3d6f42e9-f34e-4cf0-893e-977264a6df26'),(145,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 15:03:49','2025-10-27 20:19:11',NULL,'2025-10-27 20:19:11',1,'f190fb37-a343-4b38-8d5c-809ade418cac'),(146,2,NULL,57,2,'craft\\elements\\Entry',1,0,'2025-10-27 15:03:49','2025-10-27 15:03:49',NULL,NULL,NULL,'7022cc53-8e4d-46dd-89f8-abb6d37dbd74'),(147,7,NULL,58,4,'craft\\elements\\Entry',1,0,'2025-10-27 15:03:49','2025-10-27 15:03:49',NULL,NULL,NULL,'032db955-d27c-4346-afda-a877bc6ddf33'),(148,8,NULL,59,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 15:03:49','2025-10-27 15:03:49',NULL,NULL,NULL,'014beaf1-fd79-4a91-9fb0-acba7569b751'),(149,143,NULL,60,4,'craft\\elements\\Entry',1,0,'2025-10-27 15:03:49','2025-10-27 15:03:49',NULL,'2025-10-27 20:19:11',NULL,'1a963b27-631f-4eff-b1ac-23b445bfa7ff'),(150,144,NULL,61,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 15:03:49','2025-10-27 15:03:49',NULL,'2025-10-27 20:19:11',NULL,'b8725be7-fc40-4093-a412-91ed6e8854da'),(151,145,NULL,62,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 15:03:49','2025-10-27 15:03:49',NULL,'2025-10-27 20:19:11',NULL,'f48366e8-1d49-4046-95bd-12abd7ee2aac'),(156,2,NULL,63,2,'craft\\elements\\Entry',1,0,'2025-10-27 15:21:09','2025-10-27 15:21:09',NULL,NULL,NULL,'ea33a9a8-6e27-4724-b325-fc913f2707b2'),(157,7,NULL,64,4,'craft\\elements\\Entry',1,0,'2025-10-27 15:21:09','2025-10-27 15:21:09',NULL,NULL,NULL,'71a24632-b774-4e66-b227-d69f396e455b'),(158,143,NULL,65,4,'craft\\elements\\Entry',1,0,'2025-10-27 15:21:09','2025-10-27 15:21:10',NULL,'2025-10-27 20:19:11',NULL,'a4531757-c0a3-4009-b80a-5aa602eb7740'),(159,130,NULL,66,4,'craft\\elements\\Entry',1,0,'2025-10-27 15:21:09','2025-10-27 15:21:10',NULL,'2025-10-27 20:19:11',NULL,'59e2d43c-87ff-4983-9edd-dbf706f914f5'),(163,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-10-27 15:32:21','2025-10-27 15:34:11',NULL,NULL,NULL,'0b9c3df6-6937-4bee-9a18-73f0962648b0'),(164,2,NULL,67,2,'craft\\elements\\Entry',1,0,'2025-10-27 15:32:21','2025-10-27 15:32:21',NULL,NULL,NULL,'3f4ec6d7-3582-414e-b2d6-b38e6653bfda'),(165,42,NULL,68,8,'craft\\elements\\Entry',1,0,'2025-10-27 15:32:21','2025-10-27 15:32:21',NULL,NULL,NULL,'8521e697-259f-4460-bd1e-5a9b6171566a'),(166,163,NULL,69,7,'craft\\elements\\Entry',1,0,'2025-10-27 15:32:21','2025-10-27 15:32:21',NULL,NULL,NULL,'113c02ae-a73f-4c17-ab49-1d6d82292aea'),(170,2,NULL,70,2,'craft\\elements\\Entry',1,0,'2025-10-27 15:32:50','2025-10-27 15:32:50',NULL,NULL,NULL,'20f139fd-dab3-4aa7-999c-d3fc38eb95a9'),(171,42,NULL,71,8,'craft\\elements\\Entry',1,0,'2025-10-27 15:32:50','2025-10-27 15:32:50',NULL,NULL,NULL,'b28809ec-e3a5-45aa-9e1e-3939b491ab97'),(172,52,NULL,72,7,'craft\\elements\\Entry',1,0,'2025-10-27 15:32:50','2025-10-27 15:32:50',NULL,NULL,NULL,'8454d9c8-f17b-4e8f-8a73-3c483d808422'),(176,2,NULL,73,2,'craft\\elements\\Entry',1,0,'2025-10-27 15:34:11','2025-10-27 15:34:12',NULL,NULL,NULL,'68c625d7-81c2-4116-9b21-1dfc810e9d70'),(177,42,NULL,74,8,'craft\\elements\\Entry',1,0,'2025-10-27 15:34:11','2025-10-27 15:34:12',NULL,NULL,NULL,'cf7794e1-fcfc-432f-bbf7-80b2f6cb1b5e'),(178,163,NULL,75,7,'craft\\elements\\Entry',1,0,'2025-10-27 15:34:11','2025-10-27 15:34:12',NULL,NULL,NULL,'48547ab1-2c3f-409a-8551-2df43f123fc7'),(182,2,NULL,76,2,'craft\\elements\\Entry',1,0,'2025-10-27 17:05:49','2025-10-27 17:05:49',NULL,NULL,NULL,'f4c789dc-47b9-4939-92c2-444b2465c19f'),(183,90,NULL,77,11,'craft\\elements\\Entry',1,0,'2025-10-27 17:05:49','2025-10-27 17:05:49',NULL,'2025-10-27 20:19:11',NULL,'298926c7-5d62-4141-8903-869f2399dce7'),(184,91,NULL,78,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 17:05:49','2025-10-27 17:05:49',NULL,'2025-10-27 20:19:11',NULL,'a3e9ca6c-4b43-403b-89fa-85225fa1df9c'),(185,2,NULL,79,2,'craft\\elements\\Entry',1,0,'2025-10-27 17:09:11','2025-10-27 17:09:11',NULL,NULL,NULL,'393a2f03-fc47-41f0-9c88-4be5a6225126'),(186,90,NULL,80,11,'craft\\elements\\Entry',1,0,'2025-10-27 17:09:11','2025-10-27 17:09:11',NULL,'2025-10-27 20:19:11',NULL,'4d95fbf3-a35b-4152-b19f-f11a3f02b201'),(187,91,NULL,81,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 17:09:11','2025-10-27 17:09:11',NULL,'2025-10-27 20:19:11',NULL,'5b8cfa64-1f84-489b-b2db-3b31d5ddbdf4'),(188,2,NULL,82,2,'craft\\elements\\Entry',1,0,'2025-10-27 17:15:19','2025-10-27 17:15:19',NULL,NULL,NULL,'054771a5-2846-41fa-81c9-c64aba8c1843'),(189,90,NULL,83,11,'craft\\elements\\Entry',1,0,'2025-10-27 17:15:19','2025-10-27 17:15:19',NULL,'2025-10-27 20:19:11',NULL,'3a8376a9-2924-4753-b537-a2d3d65c6305'),(190,91,NULL,84,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 17:15:19','2025-10-27 17:15:19',NULL,'2025-10-27 20:19:11',NULL,'a75b2ac5-7e63-41b7-84fc-0fe77d475cbb'),(194,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-10-27 17:15:40','2025-10-27 17:17:01',NULL,'2025-10-27 17:17:01',NULL,'7d7054c5-d715-451d-bf86-ed7e08b917d8'),(195,2,NULL,85,2,'craft\\elements\\Entry',1,0,'2025-10-27 17:15:40','2025-10-27 17:15:40',NULL,NULL,NULL,'bf69f0de-c278-4196-b5fb-4343af8ae63c'),(196,42,NULL,86,8,'craft\\elements\\Entry',1,0,'2025-10-27 17:15:40','2025-10-27 17:15:40',NULL,NULL,NULL,'7ac0c606-0191-4e47-a6a1-ca709c4f08fb'),(197,194,NULL,87,7,'craft\\elements\\Entry',1,0,'2025-10-27 17:15:40','2025-10-27 17:15:40',NULL,'2025-10-27 17:17:01',NULL,'9337542b-dd88-4645-98c7-be49603dbd38'),(200,2,NULL,88,2,'craft\\elements\\Entry',1,0,'2025-10-27 17:17:01','2025-10-27 17:17:01',NULL,NULL,NULL,'1e106525-4dc1-4a89-84a5-066c34bbffbc'),(201,42,NULL,89,8,'craft\\elements\\Entry',1,0,'2025-10-27 17:17:01','2025-10-27 17:17:01',NULL,NULL,NULL,'5f4c9962-db39-4776-8944-fb8bba92aadd'),(203,2,NULL,90,2,'craft\\elements\\Entry',1,0,'2025-10-27 17:20:32','2025-10-27 17:20:32',NULL,NULL,NULL,'87c6ee48-d369-4cca-9e60-9472c00d6884'),(205,2,NULL,91,2,'craft\\elements\\Entry',1,0,'2025-10-27 17:20:58','2025-10-27 17:20:58',NULL,NULL,NULL,'5fda8cbb-a772-4f0f-8a0c-ba88612a168a'),(209,2,NULL,92,2,'craft\\elements\\Entry',1,0,'2025-10-27 17:50:17','2025-10-27 17:50:18',NULL,NULL,NULL,'858498ec-329e-4c47-b81e-77bca7334687'),(210,65,NULL,93,10,'craft\\elements\\Entry',1,0,'2025-10-27 17:50:18','2025-10-27 17:50:18',NULL,'2025-10-27 20:19:11',NULL,'80c71f23-5e28-4f1b-9ded-74407b957c3c'),(211,66,NULL,94,9,'craft\\elements\\Entry',1,0,'2025-10-27 17:50:18','2025-10-27 17:50:18',NULL,'2025-10-27 20:19:11',NULL,'ce6db3f3-d3bd-486b-a1b7-001655318026'),(216,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:18:23','2025-10-27 20:19:11',NULL,NULL,NULL,'51af3b88-d435-4eeb-bd48-c61c772d6b42'),(217,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:18:23','2025-10-27 19:25:09',NULL,NULL,NULL,'2209a119-cce0-48d0-86f1-2f6d8b006729'),(218,2,NULL,95,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:18:23','2025-10-27 19:18:23',NULL,NULL,NULL,'a7850e03-6bf2-4aa3-a0bf-4a52ecb74e96'),(219,18,NULL,96,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:18:23','2025-10-27 19:18:23',NULL,NULL,NULL,'72efad20-df12-4f8f-b4c1-a91bd727bed3'),(220,216,NULL,97,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:18:23','2025-10-27 19:18:23',NULL,NULL,NULL,'84a36e9c-e8a7-40bc-a54d-06622e117b53'),(221,217,NULL,98,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:18:23','2025-10-27 19:18:23',NULL,NULL,NULL,'462d6c96-df23-4e07-90e7-91759a934976'),(225,2,NULL,99,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:20:31','2025-10-27 19:20:31',NULL,NULL,NULL,'adbb12cf-430c-492f-8ba6-1f1a02389148'),(226,18,NULL,100,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:20:31','2025-10-27 19:20:31',NULL,NULL,NULL,'f40dec7b-636d-4c7f-8f8f-846bec5ba705'),(227,29,NULL,101,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:20:31','2025-10-27 19:20:31',NULL,NULL,NULL,'5a79f6c2-2cee-4e42-93b3-03760a34c37c'),(231,2,NULL,102,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:20:43','2025-10-27 19:20:43',NULL,NULL,NULL,'e7ee9e43-bd02-402b-870b-7dc8876f5daa'),(232,18,NULL,103,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:20:43','2025-10-27 19:20:43',NULL,NULL,NULL,'29fdbb67-8669-48cc-a1fb-d32638970749'),(233,29,NULL,104,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:20:43','2025-10-27 19:20:43',NULL,NULL,NULL,'6627b9d8-bb7b-4f7c-b4f4-7e3ef647a46e'),(237,2,NULL,105,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:22:59','2025-10-27 19:22:59',NULL,NULL,NULL,'eba1abbb-f861-48f1-9c92-7ffa0e380145'),(238,18,NULL,106,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:22:59','2025-10-27 19:22:59',NULL,NULL,NULL,'78e7c4e3-92da-40f3-9519-76e110bb875b'),(239,216,NULL,107,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:22:59','2025-10-27 19:22:59',NULL,NULL,NULL,'cb9d68da-7be3-48c4-8242-f43ae3eae24e'),(240,2,NULL,108,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:24:52','2025-10-27 19:24:52',NULL,NULL,NULL,'07ccaa0d-f180-4be1-bb61-6d6e77927f4f'),(241,216,NULL,109,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:24:52','2025-10-27 19:24:52',NULL,NULL,NULL,'c79836e9-02b5-46f9-ba15-ba0499001b0c'),(242,217,NULL,110,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:24:52','2025-10-27 19:24:52',NULL,NULL,NULL,'3cd43c56-3965-4f68-b8d5-8794ba208786'),(246,2,NULL,111,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:25:09','2025-10-27 19:25:09',NULL,NULL,NULL,'2f4a7009-3511-439c-8994-6938e5992c79'),(247,216,NULL,112,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:25:09','2025-10-27 19:25:09',NULL,NULL,NULL,'e502082b-8ada-41b6-b2da-38bc43ac310f'),(248,217,NULL,113,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:25:09','2025-10-27 19:25:09',NULL,NULL,NULL,'57c0f4e6-9bbf-4d36-bbfe-8d82ddc98810'),(251,2,NULL,114,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:27:42','2025-10-27 19:27:42',NULL,NULL,NULL,'b85a911f-e057-4560-a923-e3d480220252'),(252,18,NULL,115,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:27:42','2025-10-27 19:27:42',NULL,NULL,NULL,'a9b55f07-057d-4987-bc34-fe42f2c58588'),(255,2,NULL,116,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:27:48','2025-10-27 19:27:48',NULL,NULL,NULL,'bcdccc7b-d105-44b8-849c-33e3b53df495'),(256,18,NULL,117,5,'craft\\elements\\Entry',1,0,'2025-10-27 19:27:48','2025-10-27 19:27:48',NULL,NULL,NULL,'464daa72-9916-428c-b4bf-909d1fa47c57'),(257,2,NULL,118,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:49:05','2025-10-27 19:49:05',NULL,NULL,NULL,'b8487e19-54f7-450a-afdc-2279d79eada8'),(258,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:49:15','2025-10-27 19:51:34',NULL,NULL,NULL,'50a31650-cc9c-4b9b-9b3a-65e03ab982b8'),(259,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-10-27 19:50:24','2025-10-27 19:50:37',NULL,NULL,NULL,'38d7bd53-ca83-4d77-9c9c-15280150fb82'),(260,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:50:24','2025-10-27 19:50:37',NULL,NULL,NULL,'74480a9f-500d-4850-a2b8-3c910469308d'),(261,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:50:24','2025-10-27 19:50:37',NULL,NULL,NULL,'49c11e46-26c9-41d2-8b38-318aeaaeffd3'),(262,258,NULL,119,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:50:40','2025-10-27 19:50:40',NULL,NULL,NULL,'54f577c5-9eb2-4b66-8c41-b383095f789d'),(263,259,NULL,120,4,'craft\\elements\\Entry',1,0,'2025-10-27 19:50:37','2025-10-27 19:50:40',NULL,NULL,NULL,'eb836900-b2b9-4206-8dbb-8b575e8b211b'),(264,260,NULL,121,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:50:37','2025-10-27 19:50:40',NULL,NULL,NULL,'054f6f31-aa0b-47b4-be63-ed91ff7cec64'),(265,261,NULL,122,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:50:37','2025-10-27 19:50:40',NULL,NULL,NULL,'7d78ddb4-2387-4f5f-ae23-9d1a0731e16d'),(272,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'cb9e1fa0-6e83-49e6-a45b-f6a6a87db371'),(273,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'af5b6b41-fad6-4b05-8730-5dbb5fc072a5'),(274,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'b0036069-d0c4-48b4-a8bc-d390ee5f66f8'),(275,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'c1c9f2bc-44da-44d6-97ca-213486001ef9'),(276,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'737862f0-2923-4884-8c9b-13d5b6e2691f'),(277,258,NULL,123,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'7adb8956-167c-473b-8b37-7c84faa1643b'),(278,272,NULL,124,10,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'fa534ed8-7f87-47ff-8c06-d23ef5853886'),(279,273,NULL,125,9,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'c1de1b99-d088-4284-bc60-12a9f9994c68'),(280,274,NULL,126,9,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'7977adaf-6acf-4b3d-92bb-8331bb562fdc'),(281,275,NULL,127,9,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:34',NULL,NULL,NULL,'8689026e-a3a4-4dd9-949f-76f03078d493'),(282,276,NULL,128,9,'craft\\elements\\Entry',1,0,'2025-10-27 19:51:34','2025-10-27 19:51:35',NULL,NULL,NULL,'3f93c4e8-e904-43db-b5c0-7de930c31d08'),(283,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:52:11','2025-10-27 19:59:08',NULL,NULL,NULL,'cab753b2-9b7f-4a88-9b1a-b185d31fd59c'),(284,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-10-27 19:52:15','2025-10-27 19:52:32',NULL,NULL,NULL,'c0f978fc-c2ce-49d7-9fd3-aff1509513f9'),(285,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:52:15','2025-10-27 19:52:32',NULL,NULL,NULL,'57ccf2bd-d996-4ae8-ad03-78d4179c1164'),(286,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:52:15','2025-10-27 19:52:32',NULL,NULL,NULL,'71302ecb-4a26-41f0-8041-554e564b25de'),(287,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-10-27 19:52:23','2025-10-27 19:52:32',NULL,NULL,NULL,'2e02c304-e57c-47fa-8ac4-107935f5ac6a'),(288,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:52:23','2025-10-27 19:52:32',NULL,NULL,NULL,'96d4ee31-28be-4dae-8b71-d40b392e6e4a'),(289,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:52:23','2025-10-27 19:52:32',NULL,NULL,NULL,'db45126f-8037-49bf-ab09-673986e60fbf'),(290,283,NULL,129,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:52:32','2025-10-27 19:52:32',NULL,NULL,NULL,'914b3752-2188-4af2-bef6-96bdf0ddf9ae'),(291,287,NULL,130,4,'craft\\elements\\Entry',1,0,'2025-10-27 19:52:32','2025-10-27 19:52:32',NULL,NULL,NULL,'1b0e5697-28d7-434a-ad72-65f5ca7d9cbd'),(292,288,NULL,131,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:52:32','2025-10-27 19:52:32',NULL,NULL,NULL,'dc477bf8-4970-48d8-9e49-3398a06f3014'),(293,289,NULL,132,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:52:32','2025-10-27 19:52:32',NULL,NULL,NULL,'08312461-c694-4203-94a6-b527e0893d40'),(294,284,NULL,133,4,'craft\\elements\\Entry',1,0,'2025-10-27 19:52:32','2025-10-27 19:52:32',NULL,NULL,NULL,'3246a4ad-661d-40fe-947d-e024b3b63036'),(295,285,NULL,134,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:52:32','2025-10-27 19:52:32',NULL,NULL,NULL,'aafdb3e8-bfda-48f9-9357-7a990b13f582'),(296,286,NULL,135,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:52:32','2025-10-27 19:52:32',NULL,NULL,NULL,'414f8f95-b911-40a5-a63c-d4f134de914c'),(297,283,NULL,136,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:52:35','2025-10-27 19:52:35',NULL,NULL,NULL,'37a346d1-c223-43db-a979-695ed6a6a268'),(301,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2025-10-27 19:58:06','2025-10-27 19:58:06',NULL,NULL,NULL,'8b571ef9-7de7-4492-8c14-c672a3736861'),(302,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:58:06','2025-10-27 19:58:06',NULL,NULL,NULL,'ef1ab472-ba3d-4642-a8fa-1f32bd8ea712'),(303,283,NULL,137,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:58:06','2025-10-27 19:58:06',NULL,NULL,NULL,'85894cd8-ad72-4c56-8b9b-d320b0990821'),(304,301,NULL,138,11,'craft\\elements\\Entry',1,0,'2025-10-27 19:58:06','2025-10-27 19:58:06',NULL,NULL,NULL,'8f3d07bd-abb5-41a7-82b6-6dc23b80a907'),(305,302,NULL,139,NULL,'craft\\elements\\ContentBlock',1,0,'2025-10-27 19:58:06','2025-10-27 19:58:06',NULL,NULL,NULL,'958d0476-6caa-4ee6-8154-6c74213ecc14'),(307,283,NULL,140,2,'craft\\elements\\Entry',1,0,'2025-10-27 19:59:08','2025-10-27 19:59:08',NULL,NULL,NULL,'57ba1f80-91ed-4301-847b-793cada0c310'),(308,NULL,NULL,NULL,14,'craft\\elements\\GlobalSet',1,0,'2025-10-27 20:05:55','2025-10-27 20:06:22',NULL,NULL,NULL,'1d209306-01a4-4dc7-bc72-da0723fee5aa'),(309,NULL,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2025-10-27 20:06:01','2025-10-27 20:06:22',NULL,NULL,NULL,'8f30bee0-c616-47ee-8282-3f565a2c9ec9'),(310,NULL,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2025-10-27 20:06:12','2025-10-27 20:06:22',NULL,NULL,NULL,'3a86f8fa-e445-4696-9962-7f776378727b'),(313,2,NULL,141,2,'craft\\elements\\Entry',1,0,'2025-10-27 20:19:11','2025-10-27 20:19:11',NULL,NULL,NULL,'50ecb081-9460-42d5-a571-092a707d5ae2'),(314,216,NULL,142,5,'craft\\elements\\Entry',1,0,'2025-10-27 20:19:11','2025-10-27 20:19:11',NULL,NULL,NULL,'4ed8c1e8-b127-4436-a378-0baaa130a073');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_ueecfkfbovmquihabacuecharntcponloyzp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_gjmcbzgszlsqpqdflpokxjqssiejmzoelnox` (`ownerId`),
  CONSTRAINT `fk_gjmcbzgszlsqpqdflpokxjqssiejmzoelnox` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ijvfspmodiywlmfanxapedrxgjyxyzkvgyju` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
INSERT INTO `elements_owners` VALUES (7,2,3),(8,7,1),(10,9,2),(10,19,2),(10,27,2),(10,33,2),(11,10,1),(18,2,1),(20,19,1),(28,27,1),(29,18,1),(34,33,1),(34,44,1),(34,53,1),(34,67,1),(34,79,1),(34,84,1),(34,92,1),(35,34,1),(35,99,1),(35,102,1),(35,113,1),(35,219,1),(42,2,2),(43,42,1),(45,44,2),(45,53,2),(45,67,2),(45,79,2),(45,84,2),(45,92,2),(45,98,2),(45,100,2),(46,45,1),(46,103,1),(47,44,3),(48,47,1),(48,54,1),(48,104,1),(48,117,1),(48,165,1),(48,171,1),(48,177,1),(48,196,1),(48,201,1),(52,42,2),(54,53,3),(54,67,3),(54,79,3),(54,84,3),(54,92,3),(54,98,3),(54,100,3),(55,54,2),(55,104,2),(55,117,2),(55,165,2),(65,2,4),(66,65,1),(68,67,4),(69,68,1),(69,80,1),(69,93,1),(69,105,1),(69,118,1),(76,65,2),(77,65,3),(78,65,4),(80,79,4),(80,84,4),(81,80,2),(81,93,2),(81,105,2),(81,118,2),(81,210,2),(82,80,3),(82,93,3),(82,105,3),(82,118,3),(82,210,3),(83,80,4),(83,93,4),(83,105,4),(83,118,4),(83,210,4),(90,2,7),(91,90,1),(93,92,4),(93,98,4),(93,100,4),(94,92,5),(94,98,5),(94,100,5),(95,94,1),(95,106,1),(95,119,1),(99,98,1),(99,100,1),(102,101,1),(103,101,2),(104,101,3),(105,101,4),(106,101,5),(107,7,1),(113,112,1),(113,123,1),(113,133,1),(113,146,1),(113,156,1),(113,164,1),(113,170,1),(113,176,1),(113,182,1),(113,185,1),(113,188,1),(113,195,1),(113,200,1),(113,203,1),(113,205,1),(113,209,1),(114,112,2),(115,114,1),(116,114,1),(116,124,1),(116,147,1),(116,157,1),(117,112,3),(117,123,3),(117,133,4),(117,146,5),(117,156,5),(118,112,4),(118,123,4),(118,133,5),(118,146,6),(118,156,6),(118,164,6),(118,170,6),(118,176,6),(118,182,6),(118,185,6),(118,188,6),(118,195,6),(118,200,6),(118,203,3),(118,205,3),(119,112,5),(119,123,5),(119,133,6),(119,146,7),(119,156,7),(119,164,7),(119,170,7),(119,176,7),(124,123,2),(124,133,2),(125,124,1),(130,2,8),(131,130,1),(132,130,1),(134,133,3),(134,146,4),(135,134,1),(135,159,1),(136,134,1),(136,159,1),(143,2,5),(144,143,1),(145,143,1),(147,146,2),(148,147,1),(148,157,1),(149,146,3),(150,149,1),(150,158,1),(151,149,1),(151,158,1),(157,156,2),(157,164,2),(157,170,2),(157,176,2),(157,182,2),(157,185,2),(157,188,2),(157,195,2),(157,200,2),(157,203,2),(157,205,2),(157,209,2),(157,218,3),(157,225,3),(157,231,3),(157,237,3),(157,240,3),(157,246,3),(157,251,3),(157,255,3),(157,257,3),(157,313,3),(158,156,3),(158,164,3),(158,170,3),(158,176,3),(158,182,3),(158,185,3),(158,188,3),(158,195,3),(158,200,3),(158,203,4),(158,205,4),(158,209,4),(158,218,5),(158,225,5),(158,231,5),(158,237,5),(158,240,5),(158,246,5),(158,251,5),(158,255,5),(158,257,5),(159,156,4),(159,164,4),(159,170,4),(159,176,4),(159,182,4),(159,185,4),(159,188,4),(159,195,4),(159,200,4),(159,203,5),(159,205,7),(159,209,7),(159,218,8),(159,225,8),(159,231,8),(159,237,8),(159,240,8),(159,246,8),(159,251,8),(159,255,8),(159,257,8),(163,42,4),(165,164,5),(166,165,3),(166,171,3),(171,170,5),(172,171,2),(172,177,2),(172,196,2),(172,201,2),(177,176,5),(177,182,5),(177,185,5),(177,188,5),(178,177,3),(178,196,4),(178,201,4),(183,182,7),(184,183,1),(186,185,7),(187,186,1),(189,188,7),(189,195,7),(189,200,7),(189,203,7),(189,205,6),(189,209,6),(189,218,7),(189,225,7),(189,231,7),(189,237,7),(189,240,7),(189,246,7),(189,251,7),(189,255,7),(189,257,7),(190,189,1),(194,42,3),(196,195,5),(197,196,3),(201,200,5),(201,203,6),(201,205,5),(201,209,5),(201,218,6),(201,225,6),(201,231,6),(201,237,6),(201,240,6),(201,246,6),(201,251,6),(201,255,6),(201,257,6),(201,313,2),(210,209,3),(210,218,4),(210,225,4),(210,231,4),(210,237,4),(210,240,4),(210,246,4),(210,251,4),(210,255,4),(210,257,4),(211,210,1),(216,2,4),(217,216,1),(219,218,1),(220,218,2),(220,225,2),(220,231,2),(221,220,1),(221,239,1),(226,225,1),(227,226,1),(232,231,1),(233,232,1),(233,238,1),(233,252,1),(233,256,1),(238,237,1),(238,240,1),(238,246,1),(239,237,2),(241,240,2),(242,241,1),(247,246,2),(247,251,2),(247,255,2),(247,257,2),(248,247,1),(248,314,1),(252,251,1),(256,255,1),(256,257,1),(256,313,1),(259,258,1),(260,259,1),(261,259,1),(263,262,1),(263,277,1),(264,263,1),(265,263,1),(272,258,2),(273,272,1),(274,272,2),(275,272,3),(276,272,4),(278,277,2),(279,278,1),(280,278,2),(281,278,3),(282,278,4),(284,283,3),(285,284,1),(286,284,1),(287,283,1),(288,287,1),(289,287,1),(291,290,1),(291,297,1),(291,303,1),(291,307,1),(292,291,1),(293,291,1),(294,290,2),(294,297,2),(294,303,3),(294,307,3),(295,294,1),(296,294,1),(301,283,2),(302,301,1),(304,303,2),(304,307,2),(305,304,1),(309,308,1),(310,308,2),(314,313,4);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xrwjktnygtpxptjxbsypwiqfbejlzbqixywn` (`elementId`,`siteId`),
  KEY `idx_hgqzmqqnvbxrxovtrdapdwceaxzahwmdttpu` (`siteId`),
  KEY `idx_vzjlaqogkjvgpctovbfzwrebwlilcabxedei` (`title`,`siteId`),
  KEY `idx_dgmuctomapsvebsdclwdcqywdajuuwbxhioe` (`slug`,`siteId`),
  KEY `idx_xweersnxuappbgzqhrjnpkbjpjcqhupfixjj` (`enabled`),
  KEY `idx_cwsykccxxffigltladymomqemlgclzhvkbce` (`uri`,`siteId`),
  CONSTRAINT `fk_napzpjqpopycjyznpuukarkjlymgzstmxcds` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_panhtjyuygrjzndhtbdtjqwfcorzeboqcaad` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2025-10-16 02:13:05','2025-10-16 02:13:05','ef2b06c7-da69-443b-8c30-83b3e68b6609'),(2,2,1,'Home','home','__home__',NULL,1,'2025-10-16 02:49:47','2025-10-27 03:08:50','a2320cb2-4095-406b-baf4-667cba5fc8f1'),(3,3,1,'Home','home','home',NULL,1,'2025-10-16 02:49:47','2025-10-16 02:49:47','5bd2caf2-0469-4ca8-9deb-701d1f552503'),(7,7,1,NULL,'ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p>Ambrosia is uniquely positioned to scale space manufacturing</p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-25 13:53:50','2025-10-27 15:21:44','edf995b0-7fa3-4ecc-9200-f21f04145246'),(8,8,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"star\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-25 13:53:50','2025-10-27 15:03:49','88c602a9-06eb-4a8b-947f-ff58d5a6d4ff'),(9,9,1,'Home','home','home',NULL,1,'2025-10-25 13:53:50','2025-10-25 13:53:50','2b847142-42e5-4819-a814-deabcc5e6cd9'),(10,10,1,'Ambrosia is uniquely positioned to scale space manufacturing','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,NULL,1,'2025-10-25 13:53:50','2025-10-25 13:53:50','637217bd-d9f9-427d-9556-09f2f59574ec'),(11,11,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"star\"}',1,'2025-10-25 13:53:50','2025-10-25 13:53:50','975e5e71-b073-44a0-b213-c28d76b0af49'),(18,18,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"right\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": false, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-26 20:47:08','2025-10-27 19:27:48','56cd2c0e-a29d-478a-8764-c14fc4d58f41'),(19,19,1,'Home','home','home',NULL,1,'2025-10-26 20:47:08','2025-10-26 20:47:08','f9ff62b3-883a-4345-909d-f8d40cbc6ac6'),(20,20,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-26 20:47:08','2025-10-26 20:47:08','9c1a7517-fd0f-4dc0-925e-60bad8bb194c'),(21,21,1,'Payload locker',NULL,NULL,NULL,1,'2025-10-26 20:50:21','2025-10-26 20:50:21','5c4d8006-0a52-4fd6-90f1-5794dadb99af'),(22,22,1,'Payload rack',NULL,NULL,NULL,1,'2025-10-26 20:50:21','2025-10-26 20:50:21','070d05ad-e291-44b2-a69d-b0b7aeebf518'),(27,27,1,'Home','home','home',NULL,1,'2025-10-26 20:51:32','2025-10-26 20:51:32','389adae6-b458-4d7e-a18b-822ac1087e07'),(28,28,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"0e24883a-695a-4a88-b22d-cfd81b98b360\": [22], \"211ee620-ec7c-4174-a52e-6a70ad48f065\": \"left\", \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-26 20:51:32','2025-10-26 20:51:32','6ec70ba6-cb74-48b8-8bca-cb54dd0ab9f2'),(29,29,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [22], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": false}',1,'2025-10-27 01:14:34','2025-10-27 19:20:43','a9ea2f9e-b491-41d0-ae8b-2f5d23bc0b1f'),(33,33,1,'Home','home','home',NULL,1,'2025-10-27 01:19:02','2025-10-27 01:19:02','b72d4ea6-889b-471b-83b2-4e63e9698380'),(34,34,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 01:19:02','2025-10-27 01:19:02','a554d9cd-32c7-4dc4-b587-a0121e46d9b2'),(35,35,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [21], \"7bd489bf-7885-4d89-84eb-cd9c63c75b5a\": \"left\"}',1,'2025-10-27 01:19:02','2025-10-27 01:19:02','c39902a8-22f0-4369-9f08-3c94375492ac'),(42,42,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 02:22:56','2025-10-27 02:22:56','13601369-b6c9-47a3-b4d5-7361576eca00'),(43,43,1,'Thing 1','thing-1',NULL,'{\"362e7351-914e-441d-b1ed-f04b6aeff661\": {\"type\": \"entry\", \"label\": \"Call to action\", \"value\": \"{entry:2@1:url}\"}, \"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\": \"<p>Ambrosia is lorem ipsum dolor sit ameting in space</p>\"}',1,'2025-10-27 02:22:56','2025-10-27 02:22:56','e063626b-4e9e-4fee-b2e4-59d89c650aab'),(44,44,1,'Home','home','home',NULL,1,'2025-10-27 02:22:56','2025-10-27 02:22:56','13eb9e82-3206-4f30-8c17-a8c87e9ad3e7'),(45,45,1,'Ambrosia is uniquely positioned to scale space manufacturing','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,NULL,1,'2025-10-27 02:22:56','2025-10-27 02:22:56','627a1b58-2480-4a9c-a641-d9ecc7e6c989'),(46,46,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"star\"}',1,'2025-10-27 02:22:56','2025-10-27 02:22:56','42927919-40b0-419b-baa2-7e124dfa13db'),(47,47,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 02:22:56','2025-10-27 02:22:56','2beda294-d26a-4572-b05b-2f477f1cd890'),(48,48,1,'Thing 1','thing-1',NULL,'{\"362e7351-914e-441d-b1ed-f04b6aeff661\": {\"type\": \"entry\", \"label\": \"Call to action\", \"value\": \"{entry:2@1:url}\"}, \"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\": \"<p>Ambrosia is lorem ipsum dolor sit ameting in space</p>\"}',1,'2025-10-27 02:22:56','2025-10-27 02:22:56','9537fac3-667c-49ec-863b-cf2d9a7c662d'),(52,52,1,'Thing 2','thing-2',NULL,'{\"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\": \"<p>Ambrosia is lorem ipsum dolor sit manufacturing</p>\"}',1,'2025-10-27 02:25:48','2025-10-27 15:32:50','b9730e4a-afd4-4f9c-b819-2393b6f1e629'),(53,53,1,'Home','home','home',NULL,1,'2025-10-27 02:25:48','2025-10-27 02:25:48','3fc50067-ca58-487b-b9db-c594c4fe4117'),(54,54,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 02:25:48','2025-10-27 02:25:48','98d8c320-4d93-4c81-a1c0-c92e524dd72f'),(55,55,1,'Thing 2','thing-2',NULL,'{\"362e7351-914e-441d-b1ed-f04b6aeff661\": {\"type\": \"url\", \"label\": \"See LinkedIn\", \"value\": \"https://www.linkedin.com/company/ambrosia-space/\"}, \"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\": \"<p>Ambrosia is lorem ipsum dolor sit manufacturing</p>\"}',1,'2025-10-27 02:25:48','2025-10-27 02:25:48','468a4c39-2b94-46ad-8cf3-3da33294737c'),(59,59,1,'Arnab',NULL,NULL,NULL,1,'2025-10-27 02:45:55','2025-10-27 02:45:55','66812fe4-8d2a-4c7d-8ca1-e9c1d7ccdbf4'),(60,60,1,'Charlie',NULL,NULL,NULL,1,'2025-10-27 02:45:55','2025-10-27 02:45:55','cd845093-030f-4e16-870f-76c87e765fd7'),(61,61,1,'James',NULL,NULL,NULL,1,'2025-10-27 02:45:55','2025-10-27 02:45:55','5e39ae08-914c-4618-addd-0e97c827a76b'),(62,62,1,'Mario',NULL,NULL,NULL,1,'2025-10-27 02:45:55','2025-10-27 02:45:55','2e03c788-cb05-4d3c-ad80-3ccbd4dc03f5'),(63,63,1,'Susan',NULL,NULL,NULL,1,'2025-10-27 02:45:56','2025-10-27 02:45:56','e4b0e6be-a688-4268-8811-32e3e3d24e1e'),(64,64,1,'Victoria',NULL,NULL,NULL,1,'2025-10-27 02:45:56','2025-10-27 02:45:56','262b11f5-6238-4786-9987-f742441af8e7'),(65,65,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 02:46:08','2025-10-27 02:46:08','d5f3f1a5-973d-4c3d-9bdd-1e5022eafe1c'),(66,66,1,'Mario Maggio','mario-maggio',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [62], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Founder & CEO\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Before founding Ambrosia Space, Mario developed life support systems for multiple spacecraft. He worked as a product team lead for a N2-O2 pressure control system and <a href=\\\"{entry:2@1:url||https://ambrosia.ddev.site/}\\\">regenerable C02 scrubber</a>. Mario holds a Master’s Degree in Aerospace Engineering with a focus on Bioastronautics from the University of Colorado Boulder and a Bachelor’s Degree in Aerospace Engineering from the University of Alabama.</p>\"}',1,'2025-10-27 02:46:08','2025-10-27 17:50:18','0d684f6c-d457-4531-950c-7c63eedcff0c'),(67,67,1,'Home','home','home',NULL,1,'2025-10-27 02:46:08','2025-10-27 02:46:08','dffee0b5-f641-4ddc-86db-2edc19a46496'),(68,68,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 02:46:08','2025-10-27 02:46:08','eb84839d-d118-4bc5-9e3e-dce2cf8fed3a'),(69,69,1,'Mario Maggio','mario-maggio',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [62], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Founder & CEO\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Before founding Ambrosia Space, Mario developed life support systems for multiple spacecraft. He worked as a product team lead for a N2-O2 pressure control system and regenerable C02 scrubber. Mario holds a Master’s Degree in Aerospace Engineering with a focus on Bioastronautics from the University of Colorado Boulder and a Bachelor’s Degree in Aerospace Engineering from the University of Alabama.</p>\"}',1,'2025-10-27 02:46:08','2025-10-27 02:46:08','f1652b57-aaa3-4d1b-963d-2cf221760412'),(76,76,1,'Susan Gomez','susan-gomez',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [63], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Program Manager/Investor\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Susan worked at NASA for almost 30 years working on International Space Station (ISS), first supporting integrating GPS on ISS and eventually being promoted to the ISS Guidance, Navigation, and Control (GNC) Subystem Manager for NASA. She worked in the private sector for the past 5 years, leading the Intuitive Machines Avionics, Power, and Communication team for the IM-1 lander, and then managing the Axiom Space GNC System, before investing in Ambrosia Space. Susan holds a Bachelor’s Degree in Aerospace Engineering from the University of Texas at Austin.</p>\"}',1,'2025-10-27 02:49:33','2025-10-27 02:49:33','36deaba1-7f64-4218-9916-b2f1b1742644'),(77,77,1,'Arnab Roy','arnab-roy',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [59], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Chief Engineer\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Arnab Roy has 12 years of aerospace engineering experience with a focus on design, analysis, manufacturing and integration. His previous role was a Principal Manufacturing Engineer at Venus Aerospace, where he lead process development for advanced rocket engine technologies. He began his career at Bell Helicopter after earning a B.S. in Aerospace Engineering from Penn State University. Arnab gained broad expertise at Intuitive Machines, contributing to lunar landers and UAVs while completing his M.S. in Engineering from Purdue and an MBA from Indiana University. He also serves as an adjunct professor at San Jacinto College, training future aerospace composite technicians.</p>\"}',1,'2025-10-27 02:49:33','2025-10-27 02:49:33','be4cbfcb-5a81-42fd-92c3-4398ae252a74'),(78,78,1,'Charlie Larrabee','charlie-larrabee',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [60], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Avionics Lead\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Charlie has worked with high-reliability electronics for the last 20 years.  Applications include subsea survey, Measurement While Drilling, and flight-computer design at Axiom Station.  Charlie also has experience as a small-business owner, consultant, and educator for young inventors. Charlie studied electrical engineering at Case Western, and holds a Bachelor’s Degree in Economics with a Math minor from the University of Houston.</p>\"}',1,'2025-10-27 02:49:33','2025-10-27 02:49:33','a35f971e-a76a-4c21-986f-566c6fdf2bc0'),(79,79,1,'Home','home','home',NULL,1,'2025-10-27 02:49:33','2025-10-27 02:49:33','ea59990d-e72d-47bc-bed1-e1067400683e'),(80,80,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 02:49:33','2025-10-27 02:49:33','5ecbd511-c945-4f27-83a3-d2a49041906e'),(81,81,1,'Susan Gomez','susan-gomez',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [63], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Program Manager/Investor\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Susan worked at NASA for almost 30 years working on International Space Station (ISS), first supporting integrating GPS on ISS and eventually being promoted to the ISS Guidance, Navigation, and Control (GNC) Subystem Manager for NASA. She worked in the private sector for the past 5 years, leading the Intuitive Machines Avionics, Power, and Communication team for the IM-1 lander, and then managing the Axiom Space GNC System, before investing in Ambrosia Space. Susan holds a Bachelor’s Degree in Aerospace Engineering from the University of Texas at Austin.</p>\"}',1,'2025-10-27 02:49:33','2025-10-27 02:49:33','527bc7ba-946a-421b-945e-3639f1a7833f'),(82,82,1,'Arnab Roy','arnab-roy',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [59], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Chief Engineer\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Arnab Roy has 12 years of aerospace engineering experience with a focus on design, analysis, manufacturing and integration. His previous role was a Principal Manufacturing Engineer at Venus Aerospace, where he lead process development for advanced rocket engine technologies. He began his career at Bell Helicopter after earning a B.S. in Aerospace Engineering from Penn State University. Arnab gained broad expertise at Intuitive Machines, contributing to lunar landers and UAVs while completing his M.S. in Engineering from Purdue and an MBA from Indiana University. He also serves as an adjunct professor at San Jacinto College, training future aerospace composite technicians.</p>\"}',1,'2025-10-27 02:49:33','2025-10-27 02:49:33','4b075ca3-a9ef-43a8-8e0b-fb8cfd0a6144'),(83,83,1,'Charlie Larrabee','charlie-larrabee',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [60], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Avionics Lead\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Charlie has worked with high-reliability electronics for the last 20 years.  Applications include subsea survey, Measurement While Drilling, and flight-computer design at Axiom Station.  Charlie also has experience as a small-business owner, consultant, and educator for young inventors. Charlie studied electrical engineering at Case Western, and holds a Bachelor’s Degree in Economics with a Math minor from the University of Houston.</p>\"}',1,'2025-10-27 02:49:33','2025-10-27 02:49:33','88b2c106-6c33-4178-8ae9-c752ef519059'),(84,84,1,'Home','home','home',NULL,1,'2025-10-27 02:53:56','2025-10-27 02:53:56','dbb7516d-603c-4bbf-9fb9-d1f2f04b27bc'),(89,89,1,'Fpo 01',NULL,NULL,NULL,1,'2025-10-27 02:59:37','2025-10-27 02:59:37','3d1fb736-41ab-4053-b04c-e46abafb76aa'),(90,90,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 02:59:56','2025-10-27 02:59:56','df805bff-7161-4d72-b635-0a27693a70d0'),(91,91,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [89], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 02:59:56','2025-10-27 17:15:19','f8b58a97-b750-474f-9081-ae5a20a19be3'),(92,92,1,'Home','home','home',NULL,1,'2025-10-27 02:59:56','2025-10-27 02:59:56','dfe346ae-07c2-435f-b8d3-f7eb58477b10'),(93,93,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 02:59:56','2025-10-27 02:59:56','3936641c-e11e-4c8b-897c-1409d69b5f6e'),(94,94,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 02:59:56','2025-10-27 02:59:56','cee8cbb4-d902-424f-a929-0bf7fbf77e0a'),(95,95,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [89], \"7bd489bf-7885-4d89-84eb-cd9c63c75b5a\": \"left\", \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 02:59:56','2025-10-27 02:59:56','67c59d3c-3933-438f-b867-063074b01966'),(98,98,1,'Home','home','home',NULL,1,'2025-10-27 03:02:18','2025-10-27 03:02:18','dc4439a5-3409-4d82-becb-48de06dfba41'),(99,99,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 03:02:18','2025-10-27 03:02:18','f3e1c6ee-d681-4b11-8590-8b4e306d48c1'),(100,100,1,'Home','home',NULL,NULL,1,'2025-10-27 03:08:42','2025-10-27 03:08:42','96968cc9-1ded-41d7-a562-a78f8fc64329'),(101,101,1,'Home','home','__home__',NULL,1,'2025-10-27 03:08:50','2025-10-27 03:08:50','06670675-ef0c-4d4a-8ee3-044b66f7c692'),(102,102,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 03:08:50','2025-10-27 03:08:50','554613a0-dcda-4dc5-9150-fdc20cee575b'),(103,103,1,'Ambrosia is uniquely positioned to scale space manufacturing','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 03:08:50','2025-10-27 03:08:50','70006f20-d4d3-493b-a783-6a17325f39c7'),(104,104,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 03:08:50','2025-10-27 03:08:50','ed72c1f6-7eb6-4ada-94e8-c7553bcc74cd'),(105,105,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 03:08:50','2025-10-27 03:08:50','e451c122-394f-4346-9b06-1ab3703ccbef'),(106,106,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 03:08:50','2025-10-27 03:08:50','3694f70d-8787-4f1b-8054-8c9d9e76852b'),(107,107,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"star\"}',1,'2025-10-27 03:28:31','2025-10-27 03:28:31','f82f3933-d432-4749-a858-8269bee0dbdb'),(112,112,1,'Home','home','__home__',NULL,1,'2025-10-27 03:29:31','2025-10-27 03:29:31','1827807f-148d-4303-ac86-93dfc88b69c2'),(113,113,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 03:29:31','2025-10-27 03:29:31','3d38a5ed-e18d-4607-b5bc-2b1afef9ce0e'),(114,114,1,'Ambrosia is uniquely positioned to scale space manufacturing','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 03:29:31','2025-10-27 03:29:31','ea86f8ef-d344-4519-8d50-b1704617cd34'),(115,115,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"star\"}',1,'2025-10-27 03:29:31','2025-10-27 03:29:31','e5968443-7cb3-4cee-984e-4da47ff8b87e'),(116,116,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"star\"}',1,'2025-10-27 03:29:31','2025-10-27 03:29:31','c207ba0a-8eb6-47dd-a704-200f39e231fc'),(117,117,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 03:29:31','2025-10-27 03:29:31','c0beaa51-29ee-45ab-9675-38999bb69725'),(118,118,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 03:29:31','2025-10-27 03:29:31','5e10d141-84e5-4e0d-981f-32fcb4d6689a'),(119,119,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 03:29:31','2025-10-27 03:29:31','95e3735c-d30c-42d2-b041-465c1473697d'),(123,123,1,'Home','home','__home__',NULL,1,'2025-10-27 03:29:57','2025-10-27 03:29:57','485e135b-dd3d-448e-a20c-b312a6b3f5a0'),(124,124,1,'Ambrosia is uniquely positioned to scale space manufacturing','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 03:29:57','2025-10-27 03:29:57','4eb9fb8c-e051-4250-9eab-857d66556fd4'),(125,125,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-27 03:29:57','2025-10-27 03:29:57','076cf563-ff09-4299-bb7f-a791306d2dbc'),(130,130,1,NULL,'jobs-ambrosiaspace-com',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p><a href=\\\"mailto:jobs@ambrosiaspace.com\\\">jobs@ambrosiaspace.com</a></p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": false}',1,'2025-10-27 03:33:54','2025-10-27 15:21:44','bb1d8179-2933-43c3-8f42-ae815bf818f6'),(131,131,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"We are looking for engineering talent!\"}',1,'2025-10-27 03:33:54','2025-10-27 03:33:54','f424feed-b2ff-444b-9921-6700dc76f90e'),(132,132,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"none\"}',1,'2025-10-27 03:33:54','2025-10-27 03:33:54','5f3d80c8-6038-4d75-89e6-dd7144bb8a4e'),(133,133,1,'Home','home','__home__',NULL,1,'2025-10-27 03:33:54','2025-10-27 03:33:54','06f4c04b-0276-4afe-b579-51a4f2f6c37a'),(134,134,1,'jobs@ambrosiaspace.com','jobs-ambrosiaspace-com',NULL,'{\"cd1877b4-b584-45b0-bed6-ec29b69e4643\": false}',1,'2025-10-27 03:33:54','2025-10-27 03:33:54','37477390-74fc-4345-9e50-596f49691051'),(135,135,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"We are looking for engineering talent!\"}',1,'2025-10-27 03:33:54','2025-10-27 03:33:54','51669328-8ce8-4932-8dcd-09cfd4797627'),(136,136,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"none\"}',1,'2025-10-27 03:33:54','2025-10-27 03:33:54','ef1fe246-974c-41dc-96ba-9e29afbf0a56'),(143,143,1,NULL,'ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p>We’re making settling space possible</p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 15:03:49','2025-10-27 15:21:44','68ceea80-0670-4110-9aab-b5659cb1ebbc'),(144,144,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-27 15:03:49','2025-10-27 15:03:49','787d64d3-03b3-46cf-91ea-9f1e71f393d9'),(145,145,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"star\"}',1,'2025-10-27 15:03:49','2025-10-27 15:03:49','a3bbcbf7-23f5-4f84-95a0-7bd0cafdad53'),(146,146,1,'Home','home','__home__',NULL,1,'2025-10-27 15:03:49','2025-10-27 15:03:49','a8b0d7de-0097-45a6-a761-c44519257ca6'),(147,147,1,'Ambrosia is uniquely positioned to scale space manufacturing','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 15:03:49','2025-10-27 15:03:49','e0392414-790c-4cf4-8918-e799b0c59dba'),(148,148,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"star\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-27 15:03:49','2025-10-27 15:03:49','9d89b1e5-b176-4903-a6f0-dedd1f6b9617'),(149,149,1,'We’re making settling space possible','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 15:03:49','2025-10-27 15:03:49','61ecf216-0d7f-419d-b2eb-90e43838b20c'),(150,150,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-27 15:03:49','2025-10-27 15:03:49','01a3cbc6-c0cd-4f71-b87e-b55ca5d107c9'),(151,151,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"star\"}',1,'2025-10-27 15:03:49','2025-10-27 15:03:49','0ea85a49-ee40-4686-9199-ed14861f65e5'),(156,156,1,'Home','home','__home__',NULL,1,'2025-10-27 15:21:09','2025-10-27 15:21:09','60c78109-c024-4332-8866-3c7ac0e0b96a'),(157,157,1,'Ambrosia is uniquely positioned to scale space manufacturing','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p>Ambrosia is uniquely positioned to scale space manufacturing</p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 15:21:09','2025-10-27 15:21:09','8a2a838f-ecef-48ff-a102-ff102f9e6db8'),(158,158,1,'We’re making settling space possible','ambrosia-is-uniquely-positioned-to-scale-space-manufacturing',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p>We’re making settling space possible</p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 15:21:10','2025-10-27 15:21:10','a23df680-e715-42f7-abaa-57be85b399e5'),(159,159,1,'jobs@ambrosiaspace.com','jobs-ambrosiaspace-com',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p><a href=\\\"mailto:jobs@ambrosiaspace.com\\\">jobs@ambrosiaspace.com</a></p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": false}',1,'2025-10-27 15:21:10','2025-10-27 15:21:10','a47015d0-73f7-49a0-8a92-a219a0db560e'),(163,163,1,'Just a title and button','just-a-title',NULL,'{\"362e7351-914e-441d-b1ed-f04b6aeff661\": {\"type\": \"entry\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 15:32:21','2025-10-27 15:34:11','ef5acb5e-2f30-4a60-8020-1fc0e3ffa9cd'),(164,164,1,'Home','home','__home__',NULL,1,'2025-10-27 15:32:21','2025-10-27 15:32:21','8f241dd0-af7d-46b9-82ea-4d29aaeb7c13'),(165,165,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 15:32:21','2025-10-27 15:32:21','9512ce69-820f-40d2-b7f3-626c9c316cf4'),(166,166,1,'Just a title','just-a-title',NULL,NULL,1,'2025-10-27 15:32:21','2025-10-27 15:32:21','86e64ace-dcf6-441a-a256-63900058d627'),(170,170,1,'Home','home','__home__',NULL,1,'2025-10-27 15:32:50','2025-10-27 15:32:50','d156513c-3ab1-4cdf-91fb-6aa036a1ea4e'),(171,171,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 15:32:50','2025-10-27 15:32:50','8c3e65a7-2f82-44cc-8949-bd4dd61e048c'),(172,172,1,'Thing 2','thing-2',NULL,'{\"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\": \"<p>Ambrosia is lorem ipsum dolor sit manufacturing</p>\"}',1,'2025-10-27 15:32:50','2025-10-27 15:32:50','bca06bb0-f3c6-4986-b2b6-05bc9de02296'),(176,176,1,'Home','home','__home__',NULL,1,'2025-10-27 15:34:12','2025-10-27 15:34:12','bafa5df7-f333-46db-b7a5-a2adf423dea9'),(177,177,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 15:34:12','2025-10-27 15:34:12','c4cd4019-8865-41fd-9630-cb122b113513'),(178,178,1,'Just a title and button','just-a-title',NULL,'{\"362e7351-914e-441d-b1ed-f04b6aeff661\": {\"type\": \"entry\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 15:34:12','2025-10-27 15:34:12','cd0747bc-596e-4842-bfe4-29843c7b1099'),(182,182,1,'Home','home','__home__',NULL,1,'2025-10-27 17:05:49','2025-10-27 17:05:49','fbc9e8f1-8feb-4dad-a98b-402f87c6aeea'),(183,183,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 17:05:49','2025-10-27 17:05:49','3485e924-d795-49a5-8f37-b1b08e82c070'),(184,184,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [89], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 17:05:49','2025-10-27 17:05:49','e04379b4-d4ef-4993-859e-bf7c66ad8fc5'),(185,185,1,'Home','home','__home__',NULL,1,'2025-10-27 17:09:11','2025-10-27 17:09:11','8e61f65c-3cb3-453e-b57a-b80fe4ccebbf'),(186,186,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 17:09:11','2025-10-27 17:09:11','b1efc869-6a20-4f04-9488-31c52aa53ca3'),(187,187,1,NULL,NULL,NULL,'{\"21368d75-9ded-43ce-9509-26a20beef23b\": \"<p>Space-based biomanufacturing &amp; pharma research infrastructure</p>\", \"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [89], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 17:09:11','2025-10-27 17:09:11','08c3c0cf-4d21-4a8a-bef0-2173b8ffb5ee'),(188,188,1,'Home','home','__home__',NULL,1,'2025-10-27 17:15:19','2025-10-27 17:15:19','ab8a5cb7-b190-4a28-a9d9-c95b99d29b0a'),(189,189,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 17:15:19','2025-10-27 17:15:19','14ec7dc5-334f-4369-b24a-796e5f03ab36'),(190,190,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [89], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 17:15:19','2025-10-27 17:15:19','708158ba-7432-4e15-9ab6-74487161b49a'),(194,194,1,'Thing 2','thing-2',NULL,'{\"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\": \"<p>Ambrosia is lorem ipsum dolor sit manufacturing</p>\"}',1,'2025-10-27 17:15:40','2025-10-27 17:15:40','e531d559-e9ec-49d5-a7b4-b739581328db'),(195,195,1,'Home','home','__home__',NULL,1,'2025-10-27 17:15:40','2025-10-27 17:15:40','92dc7d5b-a889-4b13-8cf2-7fdfb0c72996'),(196,196,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 17:15:40','2025-10-27 17:15:40','148a33b5-7fb0-43f7-9369-602c3cc5dcbe'),(197,197,1,'Thing 2','thing-2',NULL,'{\"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\": \"<p>Ambrosia is lorem ipsum dolor sit manufacturing</p>\"}',1,'2025-10-27 17:15:40','2025-10-27 17:15:40','f0978608-7f1a-434f-8905-ffbc70ae4c57'),(200,200,1,'Home','home','__home__',NULL,1,'2025-10-27 17:17:01','2025-10-27 17:17:01','6123a14c-66de-4933-b011-4e9457d89103'),(201,201,1,NULL,'__temp_qknwwamnznvijmbdpeeajzycrrcidxrtuiyw',NULL,NULL,1,'2025-10-27 17:17:01','2025-10-27 17:17:01','7ba67de4-373f-4f1d-8da1-4c14ca762109'),(203,203,1,'Home','home','__home__',NULL,1,'2025-10-27 17:20:32','2025-10-27 17:20:32','8daf70ce-be44-45fe-8df3-26272c70483c'),(205,205,1,'Home','home','__home__',NULL,1,'2025-10-27 17:20:58','2025-10-27 17:20:58','d93c66f4-15e6-4fc4-9058-6189c1b018f2'),(209,209,1,'Home','home','__home__',NULL,1,'2025-10-27 17:50:18','2025-10-27 17:50:18','28aab1cb-84f4-49d3-a654-ac7e4eee4c7d'),(210,210,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 17:50:18','2025-10-27 17:50:18','422b3ea3-ca4a-4680-a44b-c7a3e8704a61'),(211,211,1,'Mario Maggio','mario-maggio',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [62], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Founder & CEO\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Before founding Ambrosia Space, Mario developed life support systems for multiple spacecraft. He worked as a product team lead for a N2-O2 pressure control system and <a href=\\\"{entry:2@1:url||https://ambrosia.ddev.site/}\\\">regenerable C02 scrubber</a>. Mario holds a Master’s Degree in Aerospace Engineering with a focus on Bioastronautics from the University of Colorado Boulder and a Bachelor’s Degree in Aerospace Engineering from the University of Alabama.</p>\"}',1,'2025-10-27 17:50:18','2025-10-27 17:50:18','f51a8a2a-02af-44b0-a18e-71f7405c7bed'),(216,216,1,'We’re developing scalable in-space infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": false, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Biomanufacturing has been stuck in the dirt\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Designed for µ-gravity, with Earth-like operations that ensure scalability and meet terrestrial yields.<br /><br />Ambrosia is full-process, from cell cultivation to final product, including bioreactors, cell separation, and integrated downstream purification, all with fully-remote operation monitored and controlled from the ground, lowering crew requirements.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true}',1,'2025-10-27 19:18:23','2025-10-27 20:19:11','3db83ab6-39ed-4bce-9f9b-1d5a5d224c2c'),(217,217,1,NULL,NULL,NULL,'{\"21368d75-9ded-43ce-9509-26a20beef23b\": \"<p>Fig. 1. ISS Mid-Deck Locker (MDLE) our bioreactor fits into</p>\", \"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [21], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": false}',1,'2025-10-27 19:18:23','2025-10-27 19:25:09','84c003f0-184f-40b5-9ff5-8badc3ab8556'),(218,218,1,'Home','home','__home__',NULL,1,'2025-10-27 19:18:23','2025-10-27 19:18:23','eecab7e2-b678-411e-b908-e2e0e1c5b8ca'),(219,219,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": false, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:18:23','2025-10-27 19:18:23','f10e49fd-ad32-42e1-9ab6-733935d30851'),(220,220,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": false, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"right\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:18:23','2025-10-27 19:18:23','64e8b2f8-287c-454d-8aa7-0c1e941b0677'),(221,221,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [21], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 19:18:23','2025-10-27 19:18:23','e91c4579-6263-42fd-827b-c92c23ddbe4f'),(225,225,1,'Home','home','__home__',NULL,1,'2025-10-27 19:20:31','2025-10-27 19:20:31','262b5a2c-5a39-44c0-a141-25653764ea44'),(226,226,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": false, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:20:31','2025-10-27 19:20:31','456b62b0-dff2-4f1e-a696-d85ec75da7de'),(227,227,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [21], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": false}',1,'2025-10-27 19:20:31','2025-10-27 19:20:31','357bcdb9-a210-4eb4-9bf7-ddd5a4793301'),(231,231,1,'Home','home','__home__',NULL,1,'2025-10-27 19:20:43','2025-10-27 19:20:43','95bf2cd5-e9cc-4ad0-b0a3-8c1c1c9df33b'),(232,232,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": false, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:20:43','2025-10-27 19:20:43','c2950495-d044-4e78-9dfd-859556eb556b'),(233,233,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [22], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": false}',1,'2025-10-27 19:20:43','2025-10-27 19:20:43','104f1943-9f0c-49bb-8766-dda47fca0d11'),(237,237,1,'Home','home','__home__',NULL,1,'2025-10-27 19:22:59','2025-10-27 19:22:59','1d5a5d70-cde9-4322-8250-c313f3ee23a4'),(238,238,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"right\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": false, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:22:59','2025-10-27 19:22:59','06b94289-efbe-4889-bba5-af75d885cc46'),(239,239,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": false, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:22:59','2025-10-27 19:22:59','f45e02ba-dc74-4a4c-ab28-b26e826d3c14'),(240,240,1,'Home','home','__home__',NULL,1,'2025-10-27 19:24:52','2025-10-27 19:24:52','2f3af3ed-e5ac-4a13-bb03-db2f2666f682'),(241,241,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": false, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:24:52','2025-10-27 19:24:52','1f378e7c-3cf2-4f62-bda0-14ddbbcde0b8'),(242,242,1,NULL,NULL,NULL,'{\"21368d75-9ded-43ce-9509-26a20beef23b\": \"<p>Fig. 1. ISS Mid-Deck Locker (MDLE) our bioreactor fits into</p>\", \"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [21], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 19:24:52','2025-10-27 19:24:52','5db297bd-e8ae-4c9d-9c87-481f63e474c2'),(246,246,1,'Home','home','__home__',NULL,1,'2025-10-27 19:25:09','2025-10-27 19:25:09','8b4f1e0d-f334-452b-889f-51d0e0bafdc3'),(247,247,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": false, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:25:09','2025-10-27 19:25:09','f9427e44-9d27-42e4-8cfd-8d48734417e5'),(248,248,1,NULL,NULL,NULL,'{\"21368d75-9ded-43ce-9509-26a20beef23b\": \"<p>Fig. 1. ISS Mid-Deck Locker (MDLE) our bioreactor fits into</p>\", \"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [21], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": false}',1,'2025-10-27 19:25:09','2025-10-27 19:25:09','5f9ec89d-4c9a-467e-bf3e-5936b962b141'),(251,251,1,'Home','home','__home__',NULL,1,'2025-10-27 19:27:42','2025-10-27 19:27:42','c8f6cbdc-9757-4d30-97a1-60cb7f30981d'),(252,252,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"right\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": false, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": false, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:27:42','2025-10-27 19:27:42','5a0ff266-b119-4e99-9bf9-fc70bca96933'),(255,255,1,'Home','home','__home__',NULL,1,'2025-10-27 19:27:48','2025-10-27 19:27:48','6b6a3f13-9db7-4640-8b5d-d91518ec2200'),(256,256,1,'Space-based biomanufacturing & pharma research infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": true, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"right\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": false, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Improving Life on Earth & Sustaining It Off\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Ambrosia is biomanufacturing in space at scale, enabling Environmental Control, Life Support, and In-Situ Resource Utilization system development and long-duration missions.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true, \"f476787e-4565-4b29-ad86-4ddc4ec56102\": {\"type\": \"entry\", \"label\": \"See our full ecosystem\", \"value\": \"{entry:2@1:url}\"}}',1,'2025-10-27 19:27:48','2025-10-27 19:27:48','cf5f4f5d-585d-4d60-b6d8-39600eeec3b9'),(257,257,1,'Home','home','__home__',NULL,1,'2025-10-27 19:49:05','2025-10-27 19:49:05','2d3f1d0e-3b4b-424b-a9a4-b78c2f814f29'),(258,258,1,'About Us','about','about','{\"84522c4a-a16d-4931-9fe4-eee7c085d454\": \"<p>Ambrosia Space is building biomanufacturing technology in space to make better drugs today and settle Mars tomorrow.</p>\"}',1,'2025-10-27 19:49:15','2025-10-27 19:50:19','d0b3b67e-14a4-418e-beee-0e78242cff90'),(259,259,1,NULL,'__temp_jfqmkmnvmckbbwdmppszzuocqtaohqjhnvho',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p>We’re making settling space possible</p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 19:50:24','2025-10-27 19:50:29','49a44a47-83b3-4871-b2f7-78f2ccc920df'),(260,260,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-27 19:50:24','2025-10-27 19:50:37','a0bb0001-4746-4783-a1dc-df15c82e25a2'),(261,261,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"star\"}',1,'2025-10-27 19:50:24','2025-10-27 19:50:24','3fc953b3-08b5-4c7a-8040-a752ca0ae095'),(262,262,1,'About Us','about','about','{\"84522c4a-a16d-4931-9fe4-eee7c085d454\": \"<p>Ambrosia Space is building biomanufacturing technology in space to make better drugs today and settle Mars tomorrow.</p>\"}',1,'2025-10-27 19:50:40','2025-10-27 19:50:40','676ee4ee-86ce-4a3f-bd01-3d31f78b2157'),(263,263,1,NULL,'__temp_jfqmkmnvmckbbwdmppszzuocqtaohqjhnvho',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p>We’re making settling space possible</p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 19:50:40','2025-10-27 19:50:40','3ac179ab-d0c2-4e2d-9716-1e0570925d57'),(264,264,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-27 19:50:40','2025-10-27 19:50:40','636f8ea0-9bfe-44ad-aa11-3efbc97744ee'),(265,265,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"star\"}',1,'2025-10-27 19:50:40','2025-10-27 19:50:40','31251816-791f-4305-b62b-3a9f3cd68a62'),(272,272,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 19:51:34','2025-10-27 19:51:34','bc7c3ebf-c28e-4ad0-87c8-72e856c7d3f9'),(273,273,1,'Mario Maggio','mario-maggio',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [62], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Founder & CEO\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Before founding Ambrosia Space, Mario developed life support systems for multiple spacecraft. He worked as a product team lead for a N2-O2 pressure control system and <a href=\\\"{entry:2@1:url||https://ambrosia.ddev.site/}\\\">regenerable C02 scrubber</a>. Mario holds a Master’s Degree in Aerospace Engineering with a focus on Bioastronautics from the University of Colorado Boulder and a Bachelor’s Degree in Aerospace Engineering from the University of Alabama.</p>\"}',1,'2025-10-27 19:51:34','2025-10-27 19:51:34','101ee319-de65-4385-9466-7252f29934a7'),(274,274,1,'Susan Gomez','susan-gomez',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [63], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Program Manager/Investor\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Susan worked at NASA for almost 30 years working on International Space Station (ISS), first supporting integrating GPS on ISS and eventually being promoted to the ISS Guidance, Navigation, and Control (GNC) Subystem Manager for NASA. She worked in the private sector for the past 5 years, leading the Intuitive Machines Avionics, Power, and Communication team for the IM-1 lander, and then managing the Axiom Space GNC System, before investing in Ambrosia Space. Susan holds a Bachelor’s Degree in Aerospace Engineering from the University of Texas at Austin.</p>\"}',1,'2025-10-27 19:51:34','2025-10-27 19:51:34','6d284291-85cf-414a-bbf8-bc6b02ab28ce'),(275,275,1,'Arnab Roy','arnab-roy',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [59], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Chief Engineer\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Arnab Roy has 12 years of aerospace engineering experience with a focus on design, analysis, manufacturing and integration. His previous role was a Principal Manufacturing Engineer at Venus Aerospace, where he lead process development for advanced rocket engine technologies. He began his career at Bell Helicopter after earning a B.S. in Aerospace Engineering from Penn State University. Arnab gained broad expertise at Intuitive Machines, contributing to lunar landers and UAVs while completing his M.S. in Engineering from Purdue and an MBA from Indiana University. He also serves as an adjunct professor at San Jacinto College, training future aerospace composite technicians.</p>\"}',1,'2025-10-27 19:51:34','2025-10-27 19:51:34','c4274b74-d2f2-427b-b233-d674aba4c241'),(276,276,1,'Charlie Larrabee','charlie-larrabee',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [60], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Avionics Lead\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Charlie has worked with high-reliability electronics for the last 20 years.  Applications include subsea survey, Measurement While Drilling, and flight-computer design at Axiom Station.  Charlie also has experience as a small-business owner, consultant, and educator for young inventors. Charlie studied electrical engineering at Case Western, and holds a Bachelor’s Degree in Economics with a Math minor from the University of Houston.</p>\"}',1,'2025-10-27 19:51:34','2025-10-27 19:51:34','0c419a7a-bb4f-4cab-810e-b273a0223538'),(277,277,1,'About Us','about','about','{\"84522c4a-a16d-4931-9fe4-eee7c085d454\": \"<p>Ambrosia Space is building biomanufacturing technology in space to make better drugs today and settle Mars tomorrow.</p>\"}',1,'2025-10-27 19:51:34','2025-10-27 19:51:34','476409bf-0525-44ba-927a-68130077645c'),(278,278,1,NULL,'__temp_irqftohbjkwyceykmqyxinubdfyypoxazpgs',NULL,NULL,1,'2025-10-27 19:51:34','2025-10-27 19:51:34','2f1ebf23-d7fb-471c-89d1-fef24d0d10cf'),(279,279,1,'Mario Maggio','mario-maggio',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [62], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Founder & CEO\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Before founding Ambrosia Space, Mario developed life support systems for multiple spacecraft. He worked as a product team lead for a N2-O2 pressure control system and <a href=\\\"{entry:2@1:url||https://ambrosia.ddev.site/}\\\">regenerable C02 scrubber</a>. Mario holds a Master’s Degree in Aerospace Engineering with a focus on Bioastronautics from the University of Colorado Boulder and a Bachelor’s Degree in Aerospace Engineering from the University of Alabama.</p>\"}',1,'2025-10-27 19:51:34','2025-10-27 19:51:34','1381545f-c443-4292-9f0c-1d8a1727956d'),(280,280,1,'Susan Gomez','susan-gomez',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [63], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Program Manager/Investor\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Susan worked at NASA for almost 30 years working on International Space Station (ISS), first supporting integrating GPS on ISS and eventually being promoted to the ISS Guidance, Navigation, and Control (GNC) Subystem Manager for NASA. She worked in the private sector for the past 5 years, leading the Intuitive Machines Avionics, Power, and Communication team for the IM-1 lander, and then managing the Axiom Space GNC System, before investing in Ambrosia Space. Susan holds a Bachelor’s Degree in Aerospace Engineering from the University of Texas at Austin.</p>\"}',1,'2025-10-27 19:51:34','2025-10-27 19:51:34','7ebe25de-0633-4c7f-9771-3e3058ecc764'),(281,281,1,'Arnab Roy','arnab-roy',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [59], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Chief Engineer\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Arnab Roy has 12 years of aerospace engineering experience with a focus on design, analysis, manufacturing and integration. His previous role was a Principal Manufacturing Engineer at Venus Aerospace, where he lead process development for advanced rocket engine technologies. He began his career at Bell Helicopter after earning a B.S. in Aerospace Engineering from Penn State University. Arnab gained broad expertise at Intuitive Machines, contributing to lunar landers and UAVs while completing his M.S. in Engineering from Purdue and an MBA from Indiana University. He also serves as an adjunct professor at San Jacinto College, training future aerospace composite technicians.</p>\"}',1,'2025-10-27 19:51:34','2025-10-27 19:51:34','2c949927-ac33-4e34-a2d4-1a2a9e5738ed'),(282,282,1,'Charlie Larrabee','charlie-larrabee',NULL,'{\"82b7648e-6577-4ec6-b49c-42675ef4c23e\": [60], \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\": \"Avionics Lead\", \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\": \"<p>Charlie has worked with high-reliability electronics for the last 20 years.  Applications include subsea survey, Measurement While Drilling, and flight-computer design at Axiom Station.  Charlie also has experience as a small-business owner, consultant, and educator for young inventors. Charlie studied electrical engineering at Case Western, and holds a Bachelor’s Degree in Economics with a Math minor from the University of Houston.</p>\"}',1,'2025-10-27 19:51:35','2025-10-27 19:51:35','ccb96efb-9790-42c7-aeb4-59f841a398d9'),(283,283,1,'Careers','careers','careers','{\"84522c4a-a16d-4931-9fe4-eee7c085d454\": \"<p>We’re building the tech for space-based pharma &amp; bio research. And we’re looking for engineering talent!</p>\"}',1,'2025-10-27 19:52:11','2025-10-27 19:59:08','d8496c65-0d04-4652-be44-05983b107472'),(284,284,1,NULL,'jobs-ambrosiaspace-com',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p><a href=\\\"mailto:jobs@ambrosiaspace.com\\\">jobs@ambrosiaspace.com</a></p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": false}',1,'2025-10-27 19:52:15','2025-10-27 19:52:15','9b1c80eb-e081-40f8-b37e-d4342edb84d3'),(285,285,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"We are looking for engineering talent!\"}',1,'2025-10-27 19:52:15','2025-10-27 19:52:15','02a2a05a-c2a8-40e7-a41c-9cba7c5cdb87'),(286,286,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"none\"}',1,'2025-10-27 19:52:15','2025-10-27 19:52:15','58cb5321-2274-401a-b3fa-d8f215d89760'),(287,287,1,NULL,'__temp_vmjyyigektpcmwytxvsnpxswekqtqvuaeqza',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p>We’re building the tech for space-based pharma &amp; bio research</p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 19:52:23','2025-10-27 19:52:25','ba69c131-b015-4acb-9207-86c36899c754'),(288,288,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-27 19:52:23','2025-10-27 19:52:32','40acd93f-3804-40b2-a0b8-79f19ad67797'),(289,289,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"star\"}',1,'2025-10-27 19:52:23','2025-10-27 19:52:23','d0ea8790-7fbf-4b0a-bf48-8458fe6b5690'),(290,290,1,'Careers','careers','careers',NULL,1,'2025-10-27 19:52:32','2025-10-27 19:52:32','d7ce55f7-628c-4207-bd5d-f5efe2c6e11c'),(291,291,1,NULL,'__temp_vmjyyigektpcmwytxvsnpxswekqtqvuaeqza',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p>We’re building the tech for space-based pharma &amp; bio research</p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": true}',1,'2025-10-27 19:52:32','2025-10-27 19:52:32','f42650d8-9654-4e65-884c-69d6f2799366'),(292,292,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"Ambrosia Space Manufacturing Company\"}',1,'2025-10-27 19:52:32','2025-10-27 19:52:32','78517032-f6bf-4306-98e7-2fe12a4890c0'),(293,293,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"star\"}',1,'2025-10-27 19:52:32','2025-10-27 19:52:32','8f30b528-a484-4043-bde4-9da899fa5482'),(294,294,1,NULL,'jobs-ambrosiaspace-com',NULL,'{\"29b186c5-f685-4be8-a307-b0738c899ab4\": \"<p><a href=\\\"mailto:jobs@ambrosiaspace.com\\\">jobs@ambrosiaspace.com</a></p>\", \"cd1877b4-b584-45b0-bed6-ec29b69e4643\": false}',1,'2025-10-27 19:52:32','2025-10-27 19:52:32','15c258f3-f7b8-4d43-816d-98343d8effe3'),(295,295,1,NULL,NULL,NULL,'{\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\": \"text\", \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\": \"We are looking for engineering talent!\"}',1,'2025-10-27 19:52:32','2025-10-27 19:52:32','39041f3e-1a7e-4ff3-aaea-386d35dfebb5'),(296,296,1,NULL,NULL,NULL,'{\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\": \"none\"}',1,'2025-10-27 19:52:32','2025-10-27 19:52:32','4ce6dfc1-658d-4a8d-bf62-65e40e8c57ed'),(297,297,1,'Careers','careers','careers',NULL,1,'2025-10-27 19:52:35','2025-10-27 19:52:35','f619f0c8-b6e7-454b-bf67-0798ce8b94c1'),(301,301,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 19:58:06','2025-10-27 19:58:06','b4cb8574-95d4-4cf3-8e71-8555e7230048'),(302,302,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [89], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 19:58:06','2025-10-27 19:58:06','1ca769e0-78e4-48f2-909b-34da48fc3e9b'),(303,303,1,'Careers','careers','careers',NULL,1,'2025-10-27 19:58:06','2025-10-27 19:58:06','67fff1b0-f584-421e-a84a-e242fa2e70eb'),(304,304,1,NULL,'__temp_dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs',NULL,NULL,1,'2025-10-27 19:58:06','2025-10-27 19:58:06','a0e11e06-2fd2-445e-ac8f-d87149f8c0b1'),(305,305,1,NULL,NULL,NULL,'{\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\": [89], \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\": true}',1,'2025-10-27 19:58:06','2025-10-27 19:58:06','bf0a2a65-8d1d-415f-a1ae-c4b55a8a86d0'),(307,307,1,'Careers','careers','careers','{\"84522c4a-a16d-4931-9fe4-eee7c085d454\": \"<p>We’re building the tech for space-based pharma &amp; bio research. And we’re looking for engineering talent!</p>\"}',1,'2025-10-27 19:59:08','2025-10-27 19:59:08','b2ba76b9-5ceb-4cbd-9d43-6dea55d03fc6'),(308,308,1,NULL,NULL,NULL,NULL,1,'2025-10-27 20:05:55','2025-10-27 20:05:55','a730eaa1-19e2-489c-b3a0-71b3a53e11d4'),(309,309,1,NULL,'__temp_xrytpadfuxtstflzyutbhtxtcwuresbtfuku',NULL,'{\"8e4cff34-4270-495a-a75c-b39b7017210b\": false, \"ef3d36fa-65b3-4fbd-929c-03081bf821d1\": {\"type\": \"entry\", \"value\": \"{entry:258@1:url}\"}}',1,'2025-10-27 20:06:01','2025-10-27 20:06:22','1c1f9cac-c3c1-4b42-adb6-d7a128ae4188'),(310,310,1,NULL,'__temp_aszribysrngpliwbxomkuhrllydafynenfpt',NULL,'{\"8e4cff34-4270-495a-a75c-b39b7017210b\": true, \"ef3d36fa-65b3-4fbd-929c-03081bf821d1\": {\"type\": \"entry\", \"value\": \"{entry:283@1:url}\"}}',1,'2025-10-27 20:06:12','2025-10-27 20:06:22','26f341a8-3c06-420f-b8a9-273ecb3c91b0'),(313,313,1,'Home','home','__home__',NULL,1,'2025-10-27 20:19:11','2025-10-27 20:19:11','d48d8850-c781-4935-8d2d-df60c5e8b7b4'),(314,314,1,'We’re developing scalable in-space infrastructure','space-based-biomanufacturing-pharma-research-infrastructure',NULL,'{\"14028e97-9956-47e4-9e19-84a7e64e890f\": false, \"440e4cd4-ad7b-4fcf-ae62-b65845128284\": \"left\", \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\": true, \"9a6fc538-caf5-4798-a7fa-4830353286e9\": \"Biomanufacturing has been stuck in the dirt\", \"a08474ce-9f95-422c-aaec-efef319931b8\": \"<p>Designed for µ-gravity, with Earth-like operations that ensure scalability and meet terrestrial yields.<br /><br />Ambrosia is full-process, from cell cultivation to final product, including bioreactors, cell separation, and integrated downstream purification, all with fully-remote operation monitored and controlled from the ground, lowering crew requirements.</p>\", \"b2481edd-d668-4a0f-a2cc-b175265567cd\": true}',1,'2025-10-27 20:19:11','2025-10-27 20:19:11','c029eac9-06b6-4f71-9f63-a86af020bea9');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrmejwptfoguxcnzuysnwvfapqogdszvexyk` (`postDate`),
  KEY `idx_zhjerxdksmubhpjuckrigdhxplqgtisehzxh` (`expiryDate`),
  KEY `idx_cviocflabceolrmhwbvbdruotpqniuiixfdm` (`sectionId`),
  KEY `idx_muevcsyrcilkfqxkrbxzpgbiiimjhbqdjwxm` (`typeId`),
  KEY `idx_exnsiogsezobslyhnpwxnrmydsaflsludbig` (`primaryOwnerId`),
  KEY `idx_qxgyclxxwwjzqpeajwoeqphgycybjzhqhnmv` (`fieldId`),
  KEY `fk_zwyhfzokvncknaxcboiphmcvsqnxjqsdhwmd` (`parentId`),
  KEY `idx_dhlttzjcbcnvifpfvswpxcgxmznootxzykxg` (`status`),
  CONSTRAINT `fk_avnkwefhqyaheeeuewbkfsordnzodyjpbogm` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ilkivbegpunsehkociqyedckvqlfeafzhedr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vnydpsplntpidywzmxmypshvqbpovhkfzokk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ymwvkbdzjoiyyozevcsdwkxheiudwbyqfgyi` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ywrecvgcokibrazdpetvarotjiqbxzoyelmq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwyhfzokvncknaxcboiphmcvsqnxjqsdhwmd` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-16 02:49:47','2025-10-16 02:49:47'),(3,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-16 02:49:47','2025-10-16 02:49:47'),(7,NULL,NULL,2,9,2,'2025-10-25 13:53:00',NULL,'live',NULL,NULL,'2025-10-25 13:53:50','2025-10-25 13:53:50'),(9,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-25 13:53:50','2025-10-25 13:53:50'),(10,NULL,NULL,9,9,2,'2025-10-25 13:53:00',NULL,'live',NULL,NULL,'2025-10-25 13:53:50','2025-10-25 13:53:50'),(18,NULL,NULL,2,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-26 20:47:08','2025-10-26 20:47:08'),(19,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-26 20:47:08','2025-10-26 20:47:08'),(20,NULL,NULL,19,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-26 20:47:08','2025-10-26 20:47:08'),(27,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-26 20:51:32','2025-10-26 20:51:32'),(28,NULL,NULL,27,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-26 20:51:32','2025-10-26 20:51:32'),(33,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 01:19:02','2025-10-27 01:19:02'),(34,NULL,NULL,33,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 01:19:02','2025-10-27 01:19:02'),(42,NULL,NULL,2,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 02:22:56','2025-10-27 02:22:56'),(43,NULL,NULL,42,13,4,'2025-10-27 02:22:00',NULL,'live',NULL,NULL,'2025-10-27 02:22:56','2025-10-27 02:22:56'),(44,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 02:22:56','2025-10-27 02:22:56'),(45,NULL,NULL,44,9,2,'2025-10-25 13:53:00',NULL,'live',NULL,NULL,'2025-10-27 02:22:56','2025-10-27 02:22:56'),(47,NULL,NULL,44,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 02:22:56','2025-10-27 02:22:56'),(48,NULL,NULL,47,13,4,'2025-10-27 02:22:00',NULL,'live',NULL,NULL,'2025-10-27 02:22:56','2025-10-27 02:22:56'),(52,NULL,NULL,42,13,4,'2025-10-27 02:25:00',NULL,'live',NULL,NULL,'2025-10-27 02:25:48','2025-10-27 02:25:48'),(53,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 02:25:48','2025-10-27 02:25:48'),(54,NULL,NULL,53,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 02:25:48','2025-10-27 02:25:48'),(55,NULL,NULL,54,13,4,'2025-10-27 02:25:00',NULL,'live',NULL,NULL,'2025-10-27 02:25:48','2025-10-27 02:25:48'),(65,NULL,NULL,2,9,7,'2025-10-27 02:39:00',NULL,'live',0,0,'2025-10-27 02:46:08','2025-10-27 02:46:08'),(66,NULL,NULL,65,14,6,'2025-10-27 02:46:00',NULL,'live',0,0,'2025-10-27 02:46:08','2025-10-27 02:46:08'),(67,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 02:46:08','2025-10-27 02:46:08'),(68,NULL,NULL,67,9,7,'2025-10-27 02:39:00',NULL,'live',NULL,NULL,'2025-10-27 02:46:08','2025-10-27 02:46:08'),(69,NULL,NULL,68,14,6,'2025-10-27 02:46:00',NULL,'live',NULL,NULL,'2025-10-27 02:46:08','2025-10-27 02:46:08'),(76,NULL,NULL,65,14,6,'2025-10-27 02:48:00',NULL,'live',0,0,'2025-10-27 02:49:33','2025-10-27 02:49:33'),(77,NULL,NULL,65,14,6,'2025-10-27 02:49:00',NULL,'live',0,0,'2025-10-27 02:49:33','2025-10-27 02:49:33'),(78,NULL,NULL,65,14,6,'2025-10-27 02:49:00',NULL,'live',0,0,'2025-10-27 02:49:33','2025-10-27 02:49:33'),(79,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 02:49:33','2025-10-27 02:49:33'),(80,NULL,NULL,79,9,7,'2025-10-27 02:39:00',NULL,'live',NULL,NULL,'2025-10-27 02:49:33','2025-10-27 02:49:33'),(81,NULL,NULL,80,14,6,'2025-10-27 02:48:00',NULL,'live',NULL,NULL,'2025-10-27 02:49:33','2025-10-27 02:49:33'),(82,NULL,NULL,80,14,6,'2025-10-27 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 02:49:33','2025-10-27 02:49:33'),(83,NULL,NULL,80,14,6,'2025-10-27 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 02:49:33','2025-10-27 02:49:33'),(84,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 02:53:56','2025-10-27 02:53:56'),(90,NULL,NULL,2,9,8,'2025-10-27 02:56:00',NULL,'live',0,0,'2025-10-27 02:59:56','2025-10-27 02:59:56'),(92,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 02:59:56','2025-10-27 02:59:56'),(93,NULL,NULL,92,9,7,'2025-10-27 02:39:00',NULL,'live',NULL,NULL,'2025-10-27 02:59:56','2025-10-27 02:59:56'),(94,NULL,NULL,92,9,8,'2025-10-27 02:56:00',NULL,'live',NULL,NULL,'2025-10-27 02:59:56','2025-10-27 02:59:56'),(98,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 03:02:18','2025-10-27 03:02:18'),(99,NULL,NULL,98,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 03:02:18','2025-10-27 03:02:18'),(100,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 03:08:42','2025-10-27 03:08:42'),(101,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 03:08:50','2025-10-27 03:08:50'),(102,NULL,NULL,101,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 03:08:50','2025-10-27 03:08:50'),(103,NULL,NULL,101,9,2,'2025-10-25 13:53:00',NULL,'live',NULL,NULL,'2025-10-27 03:08:50','2025-10-27 03:08:50'),(104,NULL,NULL,101,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 03:08:50','2025-10-27 03:08:50'),(105,NULL,NULL,101,9,7,'2025-10-27 02:39:00',NULL,'live',NULL,NULL,'2025-10-27 03:08:50','2025-10-27 03:08:50'),(106,NULL,NULL,101,9,8,'2025-10-27 02:56:00',NULL,'live',NULL,NULL,'2025-10-27 03:08:50','2025-10-27 03:08:50'),(112,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 03:29:31','2025-10-27 03:29:31'),(113,NULL,NULL,112,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 03:29:31','2025-10-27 03:29:31'),(114,NULL,NULL,112,9,2,'2025-10-25 13:53:00',NULL,'live',NULL,NULL,'2025-10-27 03:29:31','2025-10-27 03:29:31'),(117,NULL,NULL,112,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 03:29:31','2025-10-27 03:29:31'),(118,NULL,NULL,112,9,7,'2025-10-27 02:39:00',NULL,'live',NULL,NULL,'2025-10-27 03:29:31','2025-10-27 03:29:31'),(119,NULL,NULL,112,9,8,'2025-10-27 02:56:00',NULL,'live',NULL,NULL,'2025-10-27 03:29:31','2025-10-27 03:29:31'),(123,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 03:29:57','2025-10-27 03:29:57'),(124,NULL,NULL,123,9,2,'2025-10-25 13:53:00',NULL,'live',NULL,NULL,'2025-10-27 03:29:57','2025-10-27 03:29:57'),(130,NULL,NULL,2,9,2,'2025-10-27 03:33:00',NULL,'live',0,0,'2025-10-27 03:33:54','2025-10-27 03:33:54'),(133,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 03:33:54','2025-10-27 03:33:54'),(134,NULL,NULL,133,9,2,'2025-10-27 03:33:00',NULL,'live',NULL,NULL,'2025-10-27 03:33:54','2025-10-27 03:33:54'),(143,NULL,NULL,2,9,2,'2025-10-27 15:03:00',NULL,'live',0,0,'2025-10-27 15:03:49','2025-10-27 15:03:49'),(146,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 15:03:49','2025-10-27 15:03:49'),(147,NULL,NULL,146,9,2,'2025-10-25 13:53:00',NULL,'live',NULL,NULL,'2025-10-27 15:03:49','2025-10-27 15:03:49'),(149,NULL,NULL,146,9,2,'2025-10-27 15:03:00',NULL,'live',NULL,NULL,'2025-10-27 15:03:49','2025-10-27 15:03:49'),(156,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 15:21:09','2025-10-27 15:21:09'),(157,NULL,NULL,156,9,2,'2025-10-25 13:53:00',NULL,'live',NULL,NULL,'2025-10-27 15:21:09','2025-10-27 15:21:09'),(158,NULL,NULL,156,9,2,'2025-10-27 15:03:00',NULL,'live',NULL,NULL,'2025-10-27 15:21:10','2025-10-27 15:21:10'),(159,NULL,NULL,156,9,2,'2025-10-27 03:33:00',NULL,'live',NULL,NULL,'2025-10-27 15:21:10','2025-10-27 15:21:10'),(163,NULL,NULL,42,13,4,'2025-10-27 15:32:00',NULL,'live',NULL,NULL,'2025-10-27 15:32:21','2025-10-27 15:32:21'),(164,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 15:32:21','2025-10-27 15:32:21'),(165,NULL,NULL,164,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 15:32:21','2025-10-27 15:32:21'),(166,NULL,NULL,165,13,4,'2025-10-27 15:32:00',NULL,'live',NULL,NULL,'2025-10-27 15:32:21','2025-10-27 15:32:21'),(170,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 15:32:50','2025-10-27 15:32:50'),(171,NULL,NULL,170,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 15:32:50','2025-10-27 15:32:50'),(172,NULL,NULL,171,13,4,'2025-10-27 02:25:00',NULL,'live',NULL,NULL,'2025-10-27 15:32:50','2025-10-27 15:32:50'),(176,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 15:34:12','2025-10-27 15:34:12'),(177,NULL,NULL,176,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 15:34:12','2025-10-27 15:34:12'),(178,NULL,NULL,177,13,4,'2025-10-27 15:32:00',NULL,'live',NULL,NULL,'2025-10-27 15:34:12','2025-10-27 15:34:12'),(182,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 17:05:49','2025-10-27 17:05:49'),(183,NULL,NULL,182,9,8,'2025-10-27 02:56:00',NULL,'live',NULL,NULL,'2025-10-27 17:05:49','2025-10-27 17:05:49'),(185,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 17:09:11','2025-10-27 17:09:11'),(186,NULL,NULL,185,9,8,'2025-10-27 02:56:00',NULL,'live',NULL,NULL,'2025-10-27 17:09:11','2025-10-27 17:09:11'),(188,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 17:15:19','2025-10-27 17:15:19'),(189,NULL,NULL,188,9,8,'2025-10-27 02:56:00',NULL,'live',NULL,NULL,'2025-10-27 17:15:19','2025-10-27 17:15:19'),(194,NULL,NULL,42,13,4,'2025-10-27 02:25:00',NULL,'live',0,0,'2025-10-27 17:15:40','2025-10-27 17:15:40'),(195,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 17:15:40','2025-10-27 17:15:40'),(196,NULL,NULL,195,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 17:15:40','2025-10-27 17:15:40'),(197,NULL,NULL,196,13,4,'2025-10-27 02:25:00',NULL,'live',NULL,NULL,'2025-10-27 17:15:40','2025-10-27 17:15:40'),(200,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 17:17:01','2025-10-27 17:17:01'),(201,NULL,NULL,200,9,5,'2025-10-27 02:21:00',NULL,'live',NULL,NULL,'2025-10-27 17:17:01','2025-10-27 17:17:01'),(203,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 17:20:32','2025-10-27 17:20:32'),(205,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 17:20:58','2025-10-27 17:20:58'),(209,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 17:50:18','2025-10-27 17:50:18'),(210,NULL,NULL,209,9,7,'2025-10-27 02:39:00',NULL,'live',NULL,NULL,'2025-10-27 17:50:18','2025-10-27 17:50:18'),(211,NULL,NULL,210,14,6,'2025-10-27 02:46:00',NULL,'live',NULL,NULL,'2025-10-27 17:50:18','2025-10-27 17:50:18'),(216,NULL,NULL,2,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:18:23','2025-10-27 19:18:23'),(218,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:18:23','2025-10-27 19:18:23'),(219,NULL,NULL,218,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:18:23','2025-10-27 19:18:23'),(220,NULL,NULL,218,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:18:23','2025-10-27 19:18:23'),(225,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:20:31','2025-10-27 19:20:31'),(226,NULL,NULL,225,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:20:31','2025-10-27 19:20:31'),(231,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:20:43','2025-10-27 19:20:43'),(232,NULL,NULL,231,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:20:43','2025-10-27 19:20:43'),(237,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:22:59','2025-10-27 19:22:59'),(238,NULL,NULL,237,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:22:59','2025-10-27 19:22:59'),(239,NULL,NULL,237,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:22:59','2025-10-27 19:22:59'),(240,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:24:52','2025-10-27 19:24:52'),(241,NULL,NULL,240,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:24:52','2025-10-27 19:24:52'),(246,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:25:09','2025-10-27 19:25:09'),(247,NULL,NULL,246,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:25:09','2025-10-27 19:25:09'),(251,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:27:42','2025-10-27 19:27:42'),(252,NULL,NULL,251,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:27:42','2025-10-27 19:27:42'),(255,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:27:48','2025-10-27 19:27:48'),(256,NULL,NULL,255,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 19:27:48','2025-10-27 19:27:48'),(257,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:49:05','2025-10-27 19:49:05'),(258,2,NULL,NULL,NULL,1,'2025-10-27 19:50:00',NULL,'live',NULL,NULL,'2025-10-27 19:49:15','2025-10-27 19:50:40'),(259,NULL,NULL,258,9,2,'2025-10-27 19:50:00',NULL,'live',NULL,NULL,'2025-10-27 19:50:24','2025-10-27 19:50:24'),(262,2,NULL,NULL,NULL,1,'2025-10-27 19:50:00',NULL,'live',NULL,NULL,'2025-10-27 19:50:40','2025-10-27 19:50:40'),(263,NULL,NULL,262,9,2,'2025-10-27 19:50:00',NULL,'live',NULL,NULL,'2025-10-27 19:50:40','2025-10-27 19:50:40'),(272,NULL,NULL,258,9,7,'2025-10-27 02:39:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(273,NULL,NULL,272,14,6,'2025-10-27 02:46:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(274,NULL,NULL,272,14,6,'2025-10-27 02:48:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(275,NULL,NULL,272,14,6,'2025-10-27 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(276,NULL,NULL,272,14,6,'2025-10-27 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(277,2,NULL,NULL,NULL,1,'2025-10-27 19:50:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(278,NULL,NULL,277,9,7,'2025-10-27 02:39:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(279,NULL,NULL,278,14,6,'2025-10-27 02:46:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(280,NULL,NULL,278,14,6,'2025-10-27 02:48:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:34','2025-10-27 19:51:34'),(281,NULL,NULL,278,14,6,'2025-10-27 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:35','2025-10-27 19:51:35'),(282,NULL,NULL,278,14,6,'2025-10-27 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 19:51:35','2025-10-27 19:51:35'),(283,2,NULL,NULL,NULL,1,'2025-10-27 19:52:00',NULL,'live',NULL,NULL,'2025-10-27 19:52:11','2025-10-27 19:52:32'),(284,NULL,NULL,283,9,2,'2025-10-27 03:33:00',NULL,'live',NULL,NULL,'2025-10-27 19:52:15','2025-10-27 19:52:15'),(287,NULL,NULL,283,9,2,'2025-10-27 19:52:00',NULL,'live',NULL,NULL,'2025-10-27 19:52:23','2025-10-27 19:52:23'),(290,2,NULL,NULL,NULL,1,'2025-10-27 19:52:00',NULL,'live',NULL,NULL,'2025-10-27 19:52:32','2025-10-27 19:52:32'),(291,NULL,NULL,290,9,2,'2025-10-27 19:52:00',NULL,'live',NULL,NULL,'2025-10-27 19:52:32','2025-10-27 19:52:32'),(294,NULL,NULL,290,9,2,'2025-10-27 03:33:00',NULL,'live',NULL,NULL,'2025-10-27 19:52:32','2025-10-27 19:52:32'),(297,2,NULL,NULL,NULL,1,'2025-10-27 19:52:00',NULL,'live',NULL,NULL,'2025-10-27 19:52:35','2025-10-27 19:52:35'),(301,NULL,NULL,283,9,8,'2025-10-27 02:56:00',NULL,'live',NULL,NULL,'2025-10-27 19:58:06','2025-10-27 19:58:06'),(303,2,NULL,NULL,NULL,1,'2025-10-27 19:52:00',NULL,'live',NULL,NULL,'2025-10-27 19:58:06','2025-10-27 19:58:06'),(304,NULL,NULL,303,9,8,'2025-10-27 02:56:00',NULL,'live',NULL,NULL,'2025-10-27 19:58:06','2025-10-27 19:58:06'),(307,2,NULL,NULL,NULL,1,'2025-10-27 19:52:00',NULL,'live',NULL,NULL,'2025-10-27 19:59:08','2025-10-27 19:59:08'),(309,NULL,NULL,308,17,9,'2025-10-27 20:06:00',NULL,'live',NULL,NULL,'2025-10-27 20:06:01','2025-10-27 20:06:22'),(310,NULL,NULL,308,17,9,'2025-10-27 20:06:00',NULL,'live',NULL,NULL,'2025-10-27 20:06:12','2025-10-27 20:06:22'),(313,1,NULL,NULL,NULL,1,'2025-10-16 02:49:00',NULL,'live',NULL,NULL,'2025-10-27 20:19:11','2025-10-27 20:19:11'),(314,NULL,NULL,313,9,3,'2025-10-26 20:45:00',NULL,'live',NULL,NULL,'2025-10-27 20:19:11','2025-10-27 20:19:11');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_mypuyojufgukbxcncsflevrxpvabwxgilxod` (`authorId`),
  KEY `idx_dqqisasoukhnzsaobvnyalphtythhtyoingb` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_iysknjetmzmqrjnidynphunazkypkokoioso` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zjpazbrdzeekyajhbrcchrjwinrpqrrltcwl` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
INSERT INTO `entries_authors` VALUES (258,1,1),(262,1,1),(277,1,1),(283,1,1),(290,1,1),(297,1,1),(303,1,1),(307,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xhqvooihxsezkyzooplhtyyzmjadcjzluynu` (`fieldLayoutId`),
  KEY `idx_siiqckqnioqglvhyntrhhybokwawvprqfrcd` (`dateDeleted`),
  CONSTRAINT `fk_kzxqvyfgwbmhszmfiycrrkzohqynbumqjcvo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,2,'Page','page',NULL,'file',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-10-16 02:44:24','2025-10-16 02:44:24',NULL,'54f64a1d-1fa2-4197-aa96-6c979d97fcc6'),(2,4,'Big Text','bigText',NULL,NULL,NULL,0,'site',NULL,NULL,0,'site',NULL,1,'2025-10-25 12:54:43','2025-10-27 15:21:44',NULL,'e527ad7b-f272-4e6d-97c6-ab32252afa11'),(3,5,'Feature','feature',NULL,NULL,NULL,1,'site',NULL,NULL,0,'site',NULL,1,'2025-10-26 20:44:47','2025-10-26 20:44:47',NULL,'b2c03297-44b8-40b1-82cd-001bf51011e8'),(4,7,'Grid Item','gridItem',NULL,NULL,NULL,1,'site',NULL,NULL,0,'site',NULL,1,'2025-10-27 02:21:08','2025-10-27 02:21:08',NULL,'e32214a7-85d3-48e4-94c3-3aec995098d1'),(5,8,'Grid','grid',NULL,NULL,NULL,0,'site',NULL,NULL,0,'site',NULL,1,'2025-10-27 02:21:45','2025-10-27 02:21:45',NULL,'851aa807-5042-4526-a6a9-1a107ba6ce66'),(6,9,'Person','person',NULL,NULL,NULL,1,'site',NULL,NULL,0,'site',NULL,1,'2025-10-27 02:36:21','2025-10-27 02:48:13',NULL,'490807f9-8e12-43ce-8fee-22730b42f3b4'),(7,10,'People Listing','peopleListing',NULL,NULL,NULL,0,'site',NULL,NULL,0,'site',NULL,1,'2025-10-27 02:39:20','2025-10-27 02:39:20',NULL,'190a6916-6a81-4626-a188-9c9e95a060c2'),(8,11,'Image','image',NULL,NULL,NULL,0,'site',NULL,NULL,0,'site',NULL,1,'2025-10-27 02:56:21','2025-10-27 02:56:21',NULL,'63e81627-f42b-495e-a7c7-6f4e42efdc35'),(9,13,'Link List Item','linkListItem',NULL,NULL,NULL,0,'site',NULL,NULL,0,'site',NULL,1,'2025-10-27 20:05:27','2025-10-27 20:05:27',NULL,'a315ebc2-7989-48ae-85e3-d0cb12a22440');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tofqpxybwlptuddoroxtmelpwxllinkxiqcp` (`dateDeleted`),
  KEY `idx_taypbmyeqzlkuhxxyuysacsruyjacemxtesu` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"c080635c-dfbd-4ddb-9e84-14c7efce291d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"e9d52890-4151-46f9-a10b-aeec615d1612\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-10-16T02:33:42+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"start\"}','2025-10-16 02:35:21','2025-10-16 02:35:21',NULL,'c1036500-6835-4135-a42e-709ba77489d6'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"338f0d98-87e7-4a74-a454-e6c71bd195ba\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"02243e6f-7461-4cf3-ab60-ef2d8c6c1989\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-10-16T02:41:39+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"84522c4a-a16d-4931-9fe4-eee7c085d454\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Description\", \"width\": 100, \"handle\": \"description\", \"warning\": null, \"fieldUid\": \"68006928-9abf-4f12-aca6-5a03b6d6e672\", \"required\": false, \"dateAdded\": \"2025-10-16T02:44:24+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6a83c98b-49d8-48a6-824a-dda1833e0e2a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b0f092c9-4cd7-4c5d-be70-089782fd85dd\", \"required\": false, \"dateAdded\": \"2025-10-25T12:54:56+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-16 02:44:24','2025-10-25 12:54:56',NULL,'ea3cefb5-6bef-42cf-b4f2-56c46ded2675'),(3,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"3aaa6b42-4bec-4b6a-a666-9e01ed31e3fc\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"0b806bbc-71ae-4b37-aeef-4ece789c11f3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9326f3fe-85dc-4d36-be66-51893eefcd06\", \"required\": false, \"dateAdded\": \"2025-10-25T12:54:36+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Decorator Text\", \"width\": 100, \"handle\": \"decoratorText\", \"warning\": null, \"fieldUid\": \"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\", \"required\": false, \"dateAdded\": \"2025-10-25T12:54:36+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"ee2b9d23-7246-4cb3-86e2-fc5cd0cdaf1a\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"text\"], \"fieldUid\": \"9326f3fe-85dc-4d36-be66-51893eefcd06\", \"operator\": \"in\", \"layoutElementUid\": \"0b806bbc-71ae-4b37-aeef-4ece789c11f3\"}]}}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-25 12:54:36','2025-10-27 03:25:52',NULL,'a89c1a5d-c277-44d0-b209-20f4e9f815f1'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"be714f76-54a3-42a4-91ca-1003fe2f449a\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"29b186c5-f685-4be8-a307-b0738c899ab4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"68006928-9abf-4f12-aca6-5a03b6d6e672\", \"required\": true, \"dateAdded\": \"2025-10-27T15:19:17+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"7c1c36cc-73ad-4707-a822-4dc3a341bf2f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"e8458783-3f6a-43e3-8b85-f6b6ec9c2974\", \"required\": true, \"dateAdded\": \"2025-10-25T12:54:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"90124b10-7db8-4013-bbd7-0ca03a50cf64\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"f6b01801-37c0-4e3f-ad44-20d619226d7d\", \"required\": true, \"dateAdded\": \"2025-10-27T03:28:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"1f28e69f-ee17-4de9-a453-e88784a9c59c\", \"name\": \"Appearance\", \"elements\": [{\"tip\": null, \"uid\": \"cd1877b4-b584-45b0-bed6-ec29b69e4643\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Dark Mode\", \"width\": 25, \"handle\": \"darkMode\", \"warning\": null, \"fieldUid\": \"712e2ee5-eb54-4224-b7a1-fc87c8832892\", \"required\": false, \"dateAdded\": \"2025-10-27T02:50:21+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:29b186c5-f685-4be8-a307-b0738c899ab4\"], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-25 12:54:43','2025-10-27 15:21:44',NULL,'30e732b2-7d50-475b-a137-42ec8da9986a'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"c8134dc4-842f-46e5-8374-74f3d49f7886\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0e7e089d-6a06-47ef-9e53-89909921a860\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-10-26T20:29:15+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"9a6fc538-caf5-4798-a7fa-4830353286e9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow\", \"width\": 100, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\", \"required\": false, \"dateAdded\": \"2025-10-26T20:44:47+00:00\", \"instructions\": \"The small text that appears visually above the title.\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a08474ce-9f95-422c-aaec-efef319931b8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"68006928-9abf-4f12-aca6-5a03b6d6e672\", \"required\": false, \"dateAdded\": \"2025-10-26T20:44:47+00:00\", \"instructions\": \"The main, longform text that appears in the feature block.\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"754c38f8-5445-4acf-ad86-8adf122ab477\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image\", \"width\": 75, \"handle\": \"image\", \"warning\": null, \"fieldUid\": \"2935cdea-e46e-4878-b568-f0e098ec2a4f\", \"required\": false, \"dateAdded\": \"2025-10-27T01:14:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"440e4cd4-ad7b-4fcf-ae62-b65845128284\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image Position\", \"width\": 25, \"handle\": \"imagePosition\", \"warning\": null, \"fieldUid\": \"703d0ba8-0c19-40a0-badf-501c9c9c54f2\", \"required\": false, \"dateAdded\": \"2025-10-27T03:01:25+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"f476787e-4565-4b29-ad86-4ddc4ec56102\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button\", \"width\": 100, \"handle\": \"button\", \"warning\": null, \"fieldUid\": \"46c73757-35e7-4b10-b847-51ab5433328d\", \"required\": false, \"dateAdded\": \"2025-10-26T20:44:47+00:00\", \"instructions\": \"The call to action button that appears at the end of the feature block.\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"b2a23571-7e09-4af1-bc1f-b62b389dd9ef\", \"name\": \"Appearance\", \"elements\": [{\"tip\": null, \"uid\": \"14028e97-9956-47e4-9e19-84a7e64e890f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Dark Mode\", \"width\": 25, \"handle\": \"darkMode\", \"warning\": null, \"fieldUid\": \"712e2ee5-eb54-4224-b7a1-fc87c8832892\", \"required\": false, \"dateAdded\": \"2025-10-27T01:20:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Top Spacing\", \"width\": 25, \"handle\": \"topSpacing\", \"warning\": null, \"fieldUid\": \"712e2ee5-eb54-4224-b7a1-fc87c8832892\", \"required\": false, \"dateAdded\": \"2025-10-27T01:21:38+00:00\", \"instructions\": \"Should there be spacing above this module?\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b2481edd-d668-4a0f-a2cc-b175265567cd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Bottom Spacing\", \"width\": 25, \"handle\": \"bottomSpacing\", \"warning\": null, \"fieldUid\": \"712e2ee5-eb54-4224-b7a1-fc87c8832892\", \"required\": false, \"dateAdded\": \"2025-10-27T01:21:38+00:00\", \"instructions\": \"Should there be spacing below this module?\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-26 20:44:47','2025-10-27 03:01:53',NULL,'966baff9-57a2-47ac-ae28-9f6e70d1eaf8'),(6,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"69645877-4358-4182-b54e-e622a0013905\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"4d9dc53f-0f89-4185-ae47-df93f868ddcf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 25, \"handle\": null, \"warning\": null, \"fieldUid\": \"6996b9dd-5274-4574-8603-ffe2aee14e21\", \"required\": false, \"dateAdded\": \"2025-10-27T01:14:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": true, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Stylized\", \"width\": 25, \"handle\": \"stylized\", \"warning\": null, \"fieldUid\": \"712e2ee5-eb54-4224-b7a1-fc87c8832892\", \"required\": false, \"dateAdded\": \"2025-10-27T02:58:59+00:00\", \"instructions\": \"When turned on, image will be stylized to fit with the Ambrosia branding. When turned off, image will be displayed in its raw format.\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"464f1814-2fdc-44b9-9858-38d4b568c6cb\", \"class\": \"craft\\\\fields\\\\conditions\\\\RelationalFieldConditionRule\", \"fieldUid\": \"6996b9dd-5274-4574-8603-ffe2aee14e21\", \"operator\": \"notempty\", \"elementIds\": [], \"layoutElementUid\": \"4d9dc53f-0f89-4185-ae47-df93f868ddcf\"}]}}, {\"tip\": null, \"uid\": \"21368d75-9ded-43ce-9509-26a20beef23b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Caption\", \"width\": 100, \"handle\": \"caption\", \"warning\": null, \"fieldUid\": \"68006928-9abf-4f12-aca6-5a03b6d6e672\", \"required\": false, \"dateAdded\": \"2025-10-27T01:14:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"c13d9655-4c0f-4942-ae65-d71130ac51bc\", \"class\": \"craft\\\\fields\\\\conditions\\\\RelationalFieldConditionRule\", \"fieldUid\": \"6996b9dd-5274-4574-8603-ffe2aee14e21\", \"operator\": \"notempty\", \"elementIds\": [], \"layoutElementUid\": \"4d9dc53f-0f89-4185-ae47-df93f868ddcf\"}]}}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 01:14:28','2025-10-27 03:00:44',NULL,'1ae2bc73-51aa-4bf1-8438-6bbb46a13bdc'),(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"30288e57-35f0-4599-a2a6-f4162273c47e\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"709dda4b-7a98-48bd-8c13-3851a85a6446\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-10-27T02:19:34+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"68006928-9abf-4f12-aca6-5a03b6d6e672\", \"required\": false, \"dateAdded\": \"2025-10-27T02:21:08+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"362e7351-914e-441d-b1ed-f04b6aeff661\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button\", \"width\": 100, \"handle\": \"button\", \"warning\": null, \"fieldUid\": \"46c73757-35e7-4b10-b847-51ab5433328d\", \"required\": false, \"dateAdded\": \"2025-10-27T02:21:08+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:362e7351-914e-441d-b1ed-f04b6aeff661\", \"layoutElement:a87fc3a2-5e4d-4964-8a88-1c431a270ab5\"], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 02:21:08','2025-10-27 02:23:29',NULL,'fabf7a18-474b-4884-89cb-a21f5f8106ad'),(8,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"9f252587-8ed5-4f6b-82c4-efb0e2108131\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"d90c6e3c-0cae-4279-9c52-d11bf45bd267\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a64c2e37-18b3-4179-b91c-72ded09fadb4\", \"required\": false, \"dateAdded\": \"2025-10-27T02:21:45+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 02:21:45','2025-10-27 02:21:45',NULL,'22b393cd-9dfb-4a36-99d1-b78b842709f4'),(9,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"a9f859f2-a2b6-4fb8-95c7-4312226dd147\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"fc138b4f-7406-4d6d-8f9c-df1bba8d3762\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Name\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-10-27T02:34:29+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Role\", \"width\": 100, \"handle\": \"role\", \"warning\": null, \"fieldUid\": \"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\", \"required\": false, \"dateAdded\": \"2025-10-27T02:36:21+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Bio\", \"width\": 100, \"handle\": \"bio\", \"warning\": null, \"fieldUid\": \"68006928-9abf-4f12-aca6-5a03b6d6e672\", \"required\": false, \"dateAdded\": \"2025-10-27T02:36:21+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"82b7648e-6577-4ec6-b49c-42675ef4c23e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image\", \"width\": 100, \"handle\": \"image\", \"warning\": null, \"fieldUid\": \"6996b9dd-5274-4574-8603-ffe2aee14e21\", \"required\": false, \"dateAdded\": \"2025-10-27T02:36:21+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:82b7648e-6577-4ec6-b49c-42675ef4c23e\", \"layoutElement:d23d6e92-669c-4ea9-a913-124ec7c9f5f7\"], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 02:36:21','2025-10-27 02:46:29',NULL,'1bba52dd-253a-470a-972f-a7669950a1fc'),(10,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"628c45d7-bf14-4712-aab9-0b7fd5b047a2\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"afe5abd3-8a1e-40bd-97e7-b3044d9ef733\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"98e1c883-e4bb-4f43-b092-59d0bf6b3bc8\", \"required\": false, \"dateAdded\": \"2025-10-27T02:39:20+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 02:39:20','2025-10-27 02:54:27',NULL,'f1d29d5f-7f26-4e0a-b497-ca4bcacffea5'),(11,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"d4a0ff19-765b-4c94-983e-81e29ba1f7f9\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"12dac647-cacd-4ca4-9ffa-9354387d49df\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2935cdea-e46e-4878-b568-f0e098ec2a4f\", \"required\": false, \"dateAdded\": \"2025-10-27T02:57:38+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 02:56:21','2025-10-27 02:57:38',NULL,'59a7953c-d75a-4044-8ac0-78ac1e976d15'),(12,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"efb29114-697c-4998-8866-48b0d6dc6abc\", \"name\": null, \"elements\": [{\"tip\": null, \"uid\": \"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9326f3fe-85dc-4d36-be66-51893eefcd06\", \"required\": false, \"dateAdded\": \"2025-10-27T03:27:34+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"0da4fe80-b069-4498-8fb4-a89099bad6be\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Decorator Text\", \"width\": 100, \"handle\": \"decoratorText\", \"warning\": null, \"fieldUid\": \"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\", \"required\": false, \"dateAdded\": \"2025-10-27T03:27:34+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"ecec7b5f-8bab-4d88-9242-fd3901f2f6bf\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"text\"], \"fieldUid\": \"9326f3fe-85dc-4d36-be66-51893eefcd06\", \"operator\": \"in\", \"layoutElementUid\": \"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\"}]}}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 03:27:34','2025-10-27 03:27:34',NULL,'7101a357-327d-4f1c-a06e-2f44b84b6bc9'),(13,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"d323cfb1-06a2-4719-a629-f0536f1a44fe\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"ef3d36fa-65b3-4fbd-929c-03081bf821d1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"46c73757-35e7-4b10-b847-51ab5433328d\", \"required\": false, \"dateAdded\": \"2025-10-27T20:05:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8e4cff34-4270-495a-a75c-b39b7017210b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Show as button\", \"width\": 25, \"handle\": \"showAsButton\", \"warning\": null, \"fieldUid\": \"970e9afc-e436-4f65-8d88-106a3bfbda43\", \"required\": false, \"dateAdded\": \"2025-10-27T20:05:27+00:00\", \"instructions\": \"If on, link will be styled like a button.\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 20:05:27','2025-10-27 20:06:35',NULL,'ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1'),(14,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"59cca3ec-9ec5-4ac8-8996-0c06313f310c\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"062b35a1-6351-4bc9-ab94-384583513ab6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Navigation\", \"width\": 100, \"handle\": \"navigation\", \"warning\": null, \"fieldUid\": \"07bb3e53-0436-4795-8747-6138f3960508\", \"required\": false, \"dateAdded\": \"2025-10-27T20:05:55+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-10-27 20:05:55','2025-10-27 20:05:55',NULL,'0118b056-8973-4a2b-9ea5-9a1554ee3179');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_axdfrpdcqjpxzrtxhjkbgyetpvqkmhxlygcj` (`handle`,`context`),
  KEY `idx_neewzajpoqzkmevyqdnomjyvdontmsopegdi` (`context`),
  KEY `idx_fsctvwuopuhggcapbkermdsgfpzwioujjmda` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'Plain Text','plainText','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-10-16 02:19:42','2025-10-16 02:19:42',NULL,'a9b52af2-d6a8-44b8-8158-9d3be52a0d3b'),(2,'Rich Text','richText','global',NULL,NULL,1,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"characterLimit\":null,\"ckeConfig\":\"a173ce04-99ac-482e-a83c-6f2f39cbc6d3\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":true,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2025-10-16 02:32:55','2025-10-16 02:32:55',NULL,'4e561f16-ec34-404b-aff8-9759d01bb5c1'),(3,'Text','text','global',NULL,NULL,1,'none',NULL,'craft\\ckeditor\\Field','{\"ckeConfig\":\"88af5f23-f761-4800-94d6-875a43403279\",\"wordLimit\":null,\"characterLimit\":null,\"showWordCount\":false,\"parseEmbeds\":false,\"availableVolumes\":\"*\",\"availableTransforms\":\"\",\"defaultTransform\":null,\"sourceEditingGroups\":[\"__ADMINS__\"],\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"fullGraphqlData\":true,\"createButtonLabel\":null,\"expandEntryButtons\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"entryTypes\":[]}','2025-10-16 02:36:01','2025-10-27 15:20:40',NULL,'68006928-9abf-4f12-aca6-5a03b6d6e672'),(4,'Hyperlink','hyperlink','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":true,\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowedKinds\":\"*\",\"showUnpermittedVolumes\":\"\",\"showUnpermittedFiles\":\"\"},\"entry\":{\"sources\":\"*\",\"showUnpermittedSections\":\"\",\"showUnpermittedEntries\":\"\"},\"url\":{\"allowRootRelativeUrls\":\"1\",\"allowAnchors\":\"1\",\"allowCustomSchemes\":\"1\"}},\"types\":[\"entry\",\"url\",\"asset\",\"category\",\"email\",\"tel\",\"sms\"]}','2025-10-16 02:37:48','2025-10-26 20:46:04',NULL,'46c73757-35e7-4b10-b847-51ab5433328d'),(5,'Asset','asset','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:e2b96770-e496-40d4-9d40-ef0d10c51ffa\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:e2b96770-e496-40d4-9d40-ef0d10c51ffa\",\"restrictedLocationSubpath\":null,\"selectionLabel\":\"Add asset\",\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-10-16 02:38:30','2025-10-27 01:17:36',NULL,'6996b9dd-5274-4574-8603-ffe2aee14e21'),(6,'Lightswitch','lightswitch','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":true,\"offLabel\":null,\"onLabel\":null}','2025-10-20 11:13:20','2025-10-27 01:20:20',NULL,'712e2ee5-eb54-4224-b7a1-fc87c8832892'),(7,'Decorator Type','decoratorType','global',NULL,NULL,0,'none',NULL,'craft\\fields\\RadioButtons','{\"customOptions\":false,\"options\":[{\"label\":\"Star\",\"value\":\"star\",\"icon\":\"\",\"color\":\"\",\"default\":\"1\"},{\"label\":\"Text\",\"value\":\"text\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"None\",\"value\":\"none\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2025-10-25 12:47:14','2025-10-27 01:22:57',NULL,'9326f3fe-85dc-4d36-be66-51893eefcd06'),(8,'Top Decorator','topDecorator','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"a89c1a5d-c277-44d0-b209-20f4e9f815f1\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"3aaa6b42-4bec-4b6a-a666-9e01ed31e3fc\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-25T12:54:36+00:00\",\"uid\":\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\",\"fieldUid\":\"9326f3fe-85dc-4d36-be66-51893eefcd06\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"decoratorText\",\"label\":\"Decorator Text\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-25T12:54:36+00:00\",\"uid\":\"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\",\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"ee2b9d23-7246-4cb3-86e2-fc5cd0cdaf1a\",\"operator\":\"in\",\"values\":[\"text\"],\"fieldUid\":\"9326f3fe-85dc-4d36-be66-51893eefcd06\",\"layoutElementUid\":\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\"}]},\"fieldUid\":\"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2025-10-25 12:54:36','2025-10-27 03:25:52',NULL,'e8458783-3f6a-43e3-8b85-f6b6ec9c2974'),(9,'Modules','modules','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"New module\",\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"b2c03297-44b8-40b1-82cd-001bf51011e8\",\"group\":\"General\"},{\"uid\":\"e527ad7b-f272-4e6d-97c6-ab32252afa11\",\"group\":\"General\"},{\"uid\":\"851aa807-5042-4526-a6a9-1a107ba6ce66\",\"group\":\"General\"},{\"uid\":\"190a6916-6a81-4626-a188-9c9e95a060c2\",\"group\":\"General\"},{\"uid\":\"63e81627-f42b-495e-a7c7-6f4e42efdc35\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2025-10-25 12:54:46','2025-10-27 02:56:22',NULL,'b0f092c9-4cd7-4c5d-be70-089782fd85dd'),(10,'Position','position','global',NULL,NULL,0,'none',NULL,'craft\\fields\\RadioButtons','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"icon\":\"align-left\",\"color\":\"\",\"default\":\"1\"},{\"label\":\"Right\",\"value\":\"right\",\"icon\":\"align-right\",\"color\":\"\",\"default\":\"\"}],\"customOptions\":false}','2025-10-26 20:30:01','2025-10-26 20:51:21',NULL,'703d0ba8-0c19-40a0-badf-501c9c9c54f2'),(11,'Assets','assets','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:e2b96770-e496-40d4-9d40-ef0d10c51ffa\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:e2b96770-e496-40d4-9d40-ef0d10c51ffa\",\"restrictedLocationSubpath\":null,\"selectionLabel\":\"Add asset\",\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2025-10-26 20:52:15','2025-10-26 20:52:15',NULL,'c20da1f2-432b-4f57-a5df-412d795323e0'),(12,'Image','image','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"1ae2bc73-51aa-4bf1-8438-6bbb46a13bdc\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"69645877-4358-4182-b54e-e622a0013905\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"providesThumbs\":true,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-10-27T01:14:28+00:00\",\"uid\":\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\",\"fieldUid\":\"6996b9dd-5274-4574-8603-ffe2aee14e21\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"stylized\",\"label\":\"Stylized\",\"instructions\":\"When turned on, image will be stylized to fit with the Ambrosia branding. When turned off, image will be displayed in its raw format.\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-10-27T02:58:59+00:00\",\"uid\":\"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\",\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\RelationalFieldConditionRule\",\"uid\":\"464f1814-2fdc-44b9-9858-38d4b568c6cb\",\"operator\":\"notempty\",\"fieldUid\":\"6996b9dd-5274-4574-8603-ffe2aee14e21\",\"layoutElementUid\":\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\"}]},\"fieldUid\":\"712e2ee5-eb54-4224-b7a1-fc87c8832892\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"caption\",\"label\":\"Caption\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-27T01:14:28+00:00\",\"uid\":\"21368d75-9ded-43ce-9509-26a20beef23b\",\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\RelationalFieldConditionRule\",\"uid\":\"c13d9655-4c0f-4942-ae65-d71130ac51bc\",\"operator\":\"notempty\",\"fieldUid\":\"6996b9dd-5274-4574-8603-ffe2aee14e21\",\"layoutElementUid\":\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\"}]},\"fieldUid\":\"68006928-9abf-4f12-aca6-5a03b6d6e672\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2025-10-27 01:14:28','2025-10-27 03:00:44',NULL,'2935cdea-e46e-4878-b568-f0e098ec2a4f'),(13,'Grid Items','gridItems','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"cards\",\"showCardsInGrid\":true,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":50,\"createButtonLabel\":\"New item\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"88a82adb-74b9-4d14-b4bf-8e9a26d20d3e\":[]},\"entryTypes\":[{\"uid\":\"e32214a7-85d3-48e4-94c3-3aec995098d1\",\"group\":\"General\"}]}','2025-10-27 02:21:20','2025-10-27 02:23:31',NULL,'a64c2e37-18b3-4179-b91c-72ded09fadb4'),(14,'People','people','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"cards\",\"showCardsInGrid\":true,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":50,\"createButtonLabel\":\"New person\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"88a82adb-74b9-4d14-b4bf-8e9a26d20d3e\":[]},\"entryTypes\":[{\"uid\":\"490807f9-8e12-43ce-8fee-22730b42f3b4\",\"group\":\"General\"}]}','2025-10-27 02:36:33','2025-10-27 02:47:50',NULL,'98e1c883-e4bb-4f43-b092-59d0bf6b3bc8'),(15,'Bottom Decorator','bottomDecorator','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"7101a357-327d-4f1c-a06e-2f44b84b6bc9\":{\"tabs\":[{\"uid\":\"efb29114-697c-4998-8866-48b0d6dc6abc\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-27T03:27:34+00:00\",\"uid\":\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\",\"fieldUid\":\"9326f3fe-85dc-4d36-be66-51893eefcd06\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"decoratorText\",\"label\":\"Decorator Text\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-27T03:27:34+00:00\",\"uid\":\"0da4fe80-b069-4498-8fb4-a89099bad6be\",\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"ecec7b5f-8bab-4d88-9242-fd3901f2f6bf\",\"operator\":\"in\",\"values\":[\"text\"],\"fieldUid\":\"9326f3fe-85dc-4d36-be66-51893eefcd06\",\"layoutElementUid\":\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\"}]},\"fieldUid\":\"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2025-10-27 03:27:34','2025-10-27 03:27:34',NULL,'f6b01801-37c0-4e3f-ad44-20d619226d7d'),(16,'Lightswitch (Default Off)','lightswitchDefaultOff','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2025-10-27 20:04:50','2025-10-27 20:04:50',NULL,'970e9afc-e436-4f65-8d88-106a3bfbda43'),(17,'Link List','linkList','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"blocks\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":null,\"createButtonLabel\":\"New link\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"88a82adb-74b9-4d14-b4bf-8e9a26d20d3e\":[]},\"entryTypes\":[{\"uid\":\"a315ebc2-7989-48ae-85e3-d0cb12a22440\",\"group\":\"General\"}]}','2025-10-27 20:05:40','2025-10-27 20:06:40',NULL,'07bb3e53-0436-4795-8747-6138f3960508');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xkcqmcjbxstxlpmmvmmlwqgtpxcaavpwhmlg` (`name`),
  KEY `idx_vuwkpwwelqrlfidvqevyalihvblvygyohlro` (`handle`),
  KEY `idx_ctlmlrtpyahbsvkhffeuqkduadufhzokpagh` (`fieldLayoutId`),
  KEY `idx_gksqnktkmudvpuojhobhwswyszycwznrrgkx` (`sortOrder`),
  CONSTRAINT `fk_fbjxznyxtwjwjjphvydnzaaovnogbdujffuv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nhcbbwdajffqcinfeporxaastbfxsxyguxts` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (308,'Header','header',14,1,'2025-10-27 20:05:55','2025-10-27 20:05:55','1d209306-01a4-4dc7-bc72-da0723fee5aa');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ruhlkjoehmtqvyjnyzecvgkaindrcidlwmxo` (`accessToken`),
  UNIQUE KEY `idx_zbjwvmzgjbmxfhxcadrcnweyhbdejhfwvtyq` (`name`),
  KEY `fk_fbagchwbcdeatlronhslwozhdboekngfzdki` (`schemaId`),
  CONSTRAINT `fk_fbagchwbcdeatlronhslwozhdboekngfzdki` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hcyciynxjlrouerwivqrcfxajkmzzfystqyl` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
INSERT INTO `imagetransformindex` VALUES (1,21,'craft\\imagetransforms\\ImageTransformer','payload-locker.svg',NULL,'_30x23_crop_center-center_none',1,0,0,'2025-10-26 20:50:21','2025-10-26 20:50:21','2025-10-26 20:50:22','b0481d32-f31c-4fed-a2f4-f31de550dbba'),(2,21,'craft\\imagetransforms\\ImageTransformer','payload-locker.svg',NULL,'_60x47_crop_center-center_none',1,0,0,'2025-10-26 20:50:21','2025-10-26 20:50:21','2025-10-26 20:50:22','84f7fb39-5d1e-44d7-868b-e1e75de395a0'),(3,22,'craft\\imagetransforms\\ImageTransformer','payload-rack.svg',NULL,'_30x26_crop_center-center_none',1,0,0,'2025-10-26 20:50:22','2025-10-26 20:50:22','2025-10-26 20:50:22','16613a28-c3b3-4bdd-93ab-e75e7ad53131'),(4,22,'craft\\imagetransforms\\ImageTransformer','payload-rack.svg',NULL,'_60x52_crop_center-center_none',1,0,0,'2025-10-26 20:50:22','2025-10-26 20:50:22','2025-10-26 20:50:22','7b9da854-7bf0-4a53-ac48-cc1eb1529421'),(5,22,'craft\\imagetransforms\\ImageTransformer','payload-rack.svg',NULL,'_120x105_crop_center-center_none',1,0,0,'2025-10-27 01:14:34','2025-10-27 01:14:34','2025-10-27 01:14:35','21a04eaf-0e9c-447d-8497-204fd872fc33'),(6,22,'craft\\imagetransforms\\ImageTransformer','payload-rack.svg',NULL,'_240x210_crop_center-center_none',1,0,0,'2025-10-27 01:14:34','2025-10-27 01:14:34','2025-10-27 01:14:35','f999838e-f22a-4a78-9764-94bb810a2abc'),(7,21,'craft\\imagetransforms\\ImageTransformer','payload-locker.svg',NULL,'_120x95_crop_center-center_none',1,0,0,'2025-10-27 01:14:54','2025-10-27 01:14:54','2025-10-27 01:15:03','59a43f9f-e00a-413f-8cd5-6bf192437a6f'),(8,21,'craft\\imagetransforms\\ImageTransformer','payload-locker.svg',NULL,'_240x190_crop_center-center_none',1,0,0,'2025-10-27 01:14:54','2025-10-27 01:14:54','2025-10-27 01:14:54','fa6a3d93-b42a-406c-b011-f424f22c12af'),(9,64,'craft\\imagetransforms\\ImageTransformer','victoria.jpg',NULL,'_30x29_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','b7fc3768-d70d-46c2-9973-e5ea4fbc42fb'),(10,64,'craft\\imagetransforms\\ImageTransformer','victoria.jpg',NULL,'_60x58_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','eb2f537f-ec80-496e-acd2-8233e2a57d5b'),(11,63,'craft\\imagetransforms\\ImageTransformer','susan.jpg',NULL,'_28x30_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','e9a1fc85-01a7-4a87-823d-05c3dc39a591'),(12,63,'craft\\imagetransforms\\ImageTransformer','susan.jpg',NULL,'_56x60_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','d376f4e0-95ab-44a7-9c31-a28dbf18b432'),(13,62,'craft\\imagetransforms\\ImageTransformer','mario.jpg',NULL,'_24x30_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','4f84edc7-7866-4dcd-a901-233a51f44757'),(14,62,'craft\\imagetransforms\\ImageTransformer','mario.jpg',NULL,'_49x60_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','14a75c2c-f5c9-4daa-a970-8f7eea30d634'),(15,61,'craft\\imagetransforms\\ImageTransformer','james.jpg',NULL,'_26x30_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','f7f05228-e6cf-4c25-8a85-e8b89f583a26'),(16,61,'craft\\imagetransforms\\ImageTransformer','james.jpg',NULL,'_53x60_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','3c51e0f3-b868-4f32-8ede-309f2a73746d'),(17,60,'craft\\imagetransforms\\ImageTransformer','charlie.jpg',NULL,'_30x29_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','5e49ea46-39c0-4d00-9d2e-d936ad2fa9a4'),(18,60,'craft\\imagetransforms\\ImageTransformer','charlie.jpg',NULL,'_60x58_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','e8436bae-b31c-436f-8af8-ec555ccfe03b'),(19,59,'craft\\imagetransforms\\ImageTransformer','arnab.jpg',NULL,'_25x30_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','563ddc8e-a576-4286-a858-de137431df01'),(20,59,'craft\\imagetransforms\\ImageTransformer','arnab.jpg',NULL,'_51x60_crop_center-center_none',1,0,0,'2025-10-27 02:45:56','2025-10-27 02:45:56','2025-10-27 02:45:56','1ac4610f-45a0-48a6-abf6-5d64576f33e5'),(21,89,'craft\\imagetransforms\\ImageTransformer','fpo-01.jpg',NULL,'_30x12_crop_center-center_none',1,0,0,'2025-10-27 02:59:37','2025-10-27 02:59:37','2025-10-27 02:59:50','4e28e20c-4325-432d-820a-cc447fc4900c'),(22,89,'craft\\imagetransforms\\ImageTransformer','fpo-01.jpg',NULL,'_60x24_crop_center-center_none',1,0,0,'2025-10-27 02:59:37','2025-10-27 02:59:37','2025-10-27 02:59:37','9bfac9cf-281b-4910-b98a-504d05224070'),(24,89,'craft\\imagetransforms\\ImageTransformer','fpo-01.jpg',NULL,'_full',1,0,0,'2025-10-27 17:08:19','2025-10-27 17:08:19','2025-10-27 17:08:35','40662782-e79c-4aaf-978c-4c2e1ee2807c'),(25,62,'craft\\imagetransforms\\ImageTransformer','mario.jpg',NULL,'_small',1,0,0,'2025-10-27 17:23:20','2025-10-27 17:23:20','2025-10-27 17:23:20','f4a317d7-d825-420e-ae0d-18023efc89a3'),(26,63,'craft\\imagetransforms\\ImageTransformer','susan.jpg',NULL,'_small',1,0,0,'2025-10-27 17:23:20','2025-10-27 17:23:20','2025-10-27 17:23:20','b66e4c51-6e12-4873-98d1-4abf56d48567'),(27,59,'craft\\imagetransforms\\ImageTransformer','arnab.jpg',NULL,'_small',1,0,0,'2025-10-27 17:23:20','2025-10-27 17:23:20','2025-10-27 17:23:20','85bd928f-b4f2-4db9-a981-c3edacaf09f4'),(28,60,'craft\\imagetransforms\\ImageTransformer','charlie.jpg',NULL,'_small',1,0,0,'2025-10-27 17:23:20','2025-10-27 17:23:20','2025-10-27 17:23:20','68c9eb26-9f66-4712-a581-0933bf4f659e'),(29,62,'craft\\imagetransforms\\ImageTransformer','mario.jpg',NULL,'_smallSquare',1,0,0,'2025-10-27 17:28:51','2025-10-27 17:28:51','2025-10-27 17:28:51','cfe12dd0-538a-4e80-ad47-feff5549644d'),(30,63,'craft\\imagetransforms\\ImageTransformer','susan.jpg',NULL,'_smallSquare',1,0,0,'2025-10-27 17:28:51','2025-10-27 17:28:51','2025-10-27 17:28:51','9c7c5b33-9cdb-4fdd-8c97-2a61b8f1cb11'),(31,59,'craft\\imagetransforms\\ImageTransformer','arnab.jpg',NULL,'_smallSquare',1,0,0,'2025-10-27 17:28:51','2025-10-27 17:28:51','2025-10-27 17:28:51','a5f23b8c-299c-4cb4-adfe-ec8ff6d7b416'),(32,60,'craft\\imagetransforms\\ImageTransformer','charlie.jpg',NULL,'_smallSquare',1,0,0,'2025-10-27 17:28:51','2025-10-27 17:28:51','2025-10-27 17:28:51','daefe608-5221-4f44-aa9e-66d7fe651a87'),(33,21,'craft\\imagetransforms\\ImageTransformer','payload-locker.svg',NULL,'_full',1,0,0,'2025-10-27 19:20:06','2025-10-27 19:20:06','2025-10-27 19:20:06','40ab0292-7a46-48fa-b889-407e1b3b094d'),(34,22,'craft\\imagetransforms\\ImageTransformer','payload-rack.svg',NULL,'_full',1,0,0,'2025-10-27 19:20:44','2025-10-27 19:20:44','2025-10-27 19:20:44','0cfdb09f-8ef7-45cd-8cd7-f0a7c5111bd5');
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aufdnklghnjceeumfkfrvurcexsvrpbbbktk` (`name`),
  KEY `idx_fplxbraahlqbihqhlpshvxjefipwhemvflip` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
INSERT INTO `imagetransforms` VALUES (1,'Full','full','crop','center-center',3000,NULL,NULL,60,'none',NULL,0,'2025-10-27 17:08:17','2025-10-27 17:03:50','2025-10-27 17:08:17','89af2a35-e134-4f85-a55c-244e847bbb71'),(2,'Small','small','crop','center-center',800,NULL,NULL,60,'none',NULL,0,'2025-10-27 17:04:11','2025-10-27 17:04:11','2025-10-27 17:04:11','8344a3e0-212e-43cf-abb1-e1ffaaa22221'),(3,'Small Square','smallSquare','crop','center-center',800,800,NULL,60,'none',NULL,0,'2025-10-27 17:28:39','2025-10-27 17:28:29','2025-10-27 17:28:39','f8f44cc1-2ad4-406c-b5ee-6f9f213c5501');
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'5.8.18','5.8.0.3',0,'gzmkqrmwbejm','3@hlyjhwhfwb','2025-10-16 02:13:05','2025-10-27 20:06:40','fb020ada-a2c5-419d-9991-5d3a01a75889');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kkixrdnqddohectybaalefzncuxheboqtgye` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','1a6449ce-5d9f-4fe3-8583-f0a3a86bf2bd'),(2,'craft','m221101_115859_create_entries_authors_table','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','f68b2e1c-bd63-4e6e-9f92-ec380a70878d'),(3,'craft','m221107_112121_add_max_authors_to_sections','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','fd3258ca-b398-40f3-9619-e2ee8932ed27'),(4,'craft','m221205_082005_translatable_asset_alt_text','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','4690a9f0-c1d7-4798-9130-44177c7a8492'),(5,'craft','m230314_110309_add_authenticator_table','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','0b3bae64-bb03-49a2-8550-9035284667cf'),(6,'craft','m230314_111234_add_webauthn_table','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','f6d79bf4-6a82-4d6d-b4b9-22a589e3f43a'),(7,'craft','m230503_120303_add_recoverycodes_table','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','7dbacb8a-23c8-4f52-a6a8-ca0b04bffb61'),(8,'craft','m230511_000000_field_layout_configs','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','36cbd2cd-b231-4861-8b7f-e53b51b522d8'),(9,'craft','m230511_215903_content_refactor','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','afda31ca-8e2a-4d6e-a5b4-5af9067ab824'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','21651a77-2417-412b-9adb-8bde1319d988'),(11,'craft','m230524_000001_entry_type_icons','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','0342ee04-96a6-4ffc-a284-e03a8f2fe440'),(12,'craft','m230524_000002_entry_type_colors','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','613a361b-78f7-4ecf-ac7c-4d339529c749'),(13,'craft','m230524_220029_global_entry_types','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','459e50e4-e6cb-44ce-9fd8-5f8b43977117'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','0290ae70-5c6a-4ae3-8c6d-cf9a12800857'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','da5da0e3-d9e5-4faf-9b16-335b8c60e7a4'),(16,'craft','m230616_173810_kill_field_groups','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','559c6c15-8dd0-466c-a448-1df5b0c693a2'),(17,'craft','m230616_183820_remove_field_name_limit','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','017b7164-c57f-4620-a0ea-ad83d746f938'),(18,'craft','m230617_070415_entrify_matrix_blocks','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','9d9807de-1741-474f-a9d0-9e7cc5f26281'),(19,'craft','m230710_162700_element_activity','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','2ec2046c-5769-4409-8cf3-a7312aaf7b2c'),(20,'craft','m230820_162023_fix_cache_id_type','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','81b57c43-7d2a-4e2e-b112-a9ec5f72be4b'),(21,'craft','m230826_094050_fix_session_id_type','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','a253ef3f-064d-4e82-8abd-acdaca260330'),(22,'craft','m230904_190356_address_fields','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','5338b3f5-0148-4402-ba7b-cbc4590a0883'),(23,'craft','m230928_144045_add_subpath_to_volumes','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','ebb0b675-c79b-477a-be1e-0b34b387e188'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','e004798e-da4a-4859-bdaf-a5b7d2aa0be4'),(25,'craft','m231213_030600_element_bulk_ops','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','89601709-e85a-4419-9499-1b6ead4a7256'),(26,'craft','m240129_150719_sites_language_amend_length','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','649838b3-9a96-41f2-980f-f9052ec44db8'),(27,'craft','m240206_035135_convert_json_columns','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','9f185802-fb36-4335-8e28-438dd768e966'),(28,'craft','m240207_182452_address_line_3','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','bfd502ec-18b3-4243-b0be-e805d2ecc5d4'),(29,'craft','m240302_212719_solo_preview_targets','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','88bd252d-28ea-4559-8e50-29bfb87fa3db'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','161725e3-1628-4e0c-b9ee-02bd4a352ae5'),(31,'craft','m240723_214330_drop_bulkop_fk','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','40dc0c88-64d9-4036-a91a-cf97e6bdf6a1'),(32,'craft','m240731_053543_soft_delete_fields','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','47a197c2-54cf-4e1b-a30b-0d7740e9ffa5'),(33,'craft','m240805_154041_sso_identities','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','721d9170-e70c-471c-8a5f-a429abd94454'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','b3f54acb-2c56-46c0-ae67-396df8609840'),(35,'craft','m241120_190905_user_affiliated_sites','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','1d19098a-1865-4fab-8f26-ab9e7356ab53'),(36,'craft','m241125_122914_add_viewUsers_permission','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','13d68188-5d0c-4021-ae5b-050318c8cd78'),(37,'craft','m250119_135304_entry_type_overrides','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','f655e6f7-e403-4eb3-9bc2-39baea297867'),(38,'craft','m250206_135036_search_index_queue','2025-10-16 02:14:51','2025-10-16 02:14:51','2025-10-16 02:14:51','4f217d69-a86a-4af5-83b9-2b6cd5d42bb7'),(39,'craft','m250207_172349_bulkop_events','2025-10-16 02:14:51','2025-10-16 02:14:51','2025-10-16 02:14:51','88a2ae87-a407-4ad4-83d8-ddf59660ef1d'),(40,'craft','m250315_131608_unlimited_authors','2025-10-16 02:14:51','2025-10-16 02:14:51','2025-10-16 02:14:51','90e62ff1-0622-41d3-a8f4-cb9880870cb1'),(41,'craft','m250403_171253_static_statuses','2025-10-16 02:14:51','2025-10-16 02:14:51','2025-10-16 02:14:51','6c51e85c-7280-48e9-bcce-568cc3cc4e9f'),(42,'craft','m250512_164202_asset_mime_types','2025-10-16 02:14:51','2025-10-16 02:14:51','2025-10-16 02:14:51','2de9005e-8c7d-4a1d-9a72-4144dbbfdfeb'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2025-10-16 02:14:51','2025-10-16 02:14:51','2025-10-16 02:14:51','c8b8bc5f-7b9d-4454-a1b9-5007b175de4f'),(44,'craft','m250531_183058_content_blocks','2025-10-16 02:14:51','2025-10-16 02:14:51','2025-10-16 02:14:51','04a35142-7b12-4765-8edc-2e7e9c74d2d4'),(45,'craft','m250623_105031_entry_type_descriptions','2025-10-16 02:14:51','2025-10-16 02:14:51','2025-10-16 02:14:51','f52609ed-a256-49d1-9530-6ecbc456b58b'),(46,'plugin:ckeditor','Install','2025-10-16 02:26:03','2025-10-16 02:26:03','2025-10-16 02:26:03','2fb1d508-000c-46cb-a67f-716ee0519b99'),(47,'plugin:ckeditor','m230408_163704_v3_upgrade','2025-10-16 02:26:03','2025-10-16 02:26:03','2025-10-16 02:26:03','760916a1-ad41-435f-9e1f-0ac8e98663ee');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wmhlwcohixgnvfzwsfqikehfrmgchsejojee` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'vite','5.0.1','1.0.0','2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-16 02:13:05','153bc0b6-a996-4bdc-886c-e219aff28bd8'),(2,'ckeditor','4.10.1','3.0.0.0','2025-10-16 02:26:03','2025-10-16 02:26:03','2025-10-16 02:26:03','e2025c31-a732-4664-9226-1055ecd15188');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.headingLevels','false'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.name','\"Simple\"'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.toolbar.0','\"bold\"'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.toolbar.1','\"italic\"'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.toolbar.2','\"underline\"'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.toolbar.3','\"link\"'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.toolbar.4','\"|\"'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.toolbar.5','\"subscript\"'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.toolbar.6','\"superscript\"'),('ckeditor.configs.88af5f23-f761-4800-94d6-875a43403279.toolbar.7','\"strikethrough\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.headingLevels.0','1'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.headingLevels.1','2'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.headingLevels.2','3'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.headingLevels.3','4'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.headingLevels.4','5'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.headingLevels.5','6'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.name','\"Full\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.0','\"heading\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.1','\"|\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.10','\"numberedList\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.11','\"insertTable\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.2','\"bold\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.3','\"italic\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.4','\"underline\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.5','\"subscript\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.6','\"superscript\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.7','\"link\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.8','\"blockQuote\"'),('ckeditor.configs.a173ce04-99ac-482e-a83c-6f2f39cbc6d3.toolbar.9','\"bulletedList\"'),('dateModified','1761595595'),('email.fromEmail','\"hello@ambrosiaspace.com\"'),('email.fromName','\"Ambrosia Space Manufacturing Corporation\"'),('email.replyToEmail','null'),('email.template','null'),('email.transportSettings.command','\"/usr/local/bin/mailpit sendmail -t --smtp-addr 127.0.0.1:1025\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.color','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.description','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.cardThumbAlignment','\"end\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elementCondition','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.dateAdded','\"2025-10-27T02:39:20+00:00\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.editCondition','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.elementCondition','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.fieldUid','\"98e1c883-e4bb-4f43-b092-59d0bf6b3bc8\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.handle','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.includeInCards','false'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.instructions','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.label','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.providesThumbs','false'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.required','false'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.tip','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.uid','\"afe5abd3-8a1e-40bd-97e7-b3044d9ef733\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.userCondition','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.warning','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.elements.0.width','100'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.name','\"Content\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.uid','\"628c45d7-bf14-4712-aab9-0b7fd5b047a2\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.fieldLayouts.f1d29d5f-7f26-4e0a-b497-ca4bcacffea5.tabs.0.userCondition','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.handle','\"peopleListing\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.hasTitleField','false'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.icon','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.name','\"People Listing\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.showSlugField','false'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.showStatusField','true'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.slugTranslationKeyFormat','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.slugTranslationMethod','\"site\"'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.titleFormat','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.titleTranslationKeyFormat','null'),('entryTypes.190a6916-6a81-4626-a188-9c9e95a060c2.titleTranslationMethod','\"site\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.color','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.description','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.cardThumbAlignment','\"end\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.cardView.0','\"layoutElement:82b7648e-6577-4ec6-b49c-42675ef4c23e\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.cardView.1','\"layoutElement:d23d6e92-669c-4ea9-a913-124ec7c9f5f7\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elementCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.autocomplete','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.autocorrect','true'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.class','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.dateAdded','\"2025-10-27T02:34:29+00:00\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.disabled','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.elementCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.id','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.includeInCards','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.inputType','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.instructions','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.label','\"Name\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.max','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.min','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.name','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.orientation','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.placeholder','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.providesThumbs','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.readonly','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.required','true'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.size','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.step','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.tip','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.title','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.uid','\"fc138b4f-7406-4d6d-8f9c-df1bba8d3762\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.userCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.warning','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.0.width','100'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.dateAdded','\"2025-10-27T02:36:21+00:00\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.editCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.elementCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.fieldUid','\"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.handle','\"role\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.includeInCards','true'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.instructions','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.label','\"Role\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.providesThumbs','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.required','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.tip','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.uid','\"d23d6e92-669c-4ea9-a913-124ec7c9f5f7\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.userCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.warning','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.1.width','100'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.dateAdded','\"2025-10-27T02:36:21+00:00\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.editCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.elementCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.fieldUid','\"68006928-9abf-4f12-aca6-5a03b6d6e672\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.handle','\"bio\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.includeInCards','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.instructions','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.label','\"Bio\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.providesThumbs','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.required','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.tip','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.uid','\"f9e7eea2-cac7-41f7-8e0b-395ffab391c5\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.userCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.warning','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.2.width','100'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.dateAdded','\"2025-10-27T02:36:21+00:00\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.editCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.elementCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.fieldUid','\"6996b9dd-5274-4574-8603-ffe2aee14e21\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.handle','\"image\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.includeInCards','true'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.instructions','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.label','\"Image\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.providesThumbs','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.required','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.tip','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.uid','\"82b7648e-6577-4ec6-b49c-42675ef4c23e\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.userCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.warning','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.elements.3.width','100'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.name','\"Content\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.uid','\"a9f859f2-a2b6-4fb8-95c7-4312226dd147\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.fieldLayouts.1bba52dd-253a-470a-972f-a7669950a1fc.tabs.0.userCondition','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.handle','\"person\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.hasTitleField','true'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.icon','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.name','\"Person\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.showSlugField','false'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.showStatusField','true'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.slugTranslationKeyFormat','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.slugTranslationMethod','\"site\"'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.titleFormat','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.titleTranslationKeyFormat','null'),('entryTypes.490807f9-8e12-43ce-8fee-22730b42f3b4.titleTranslationMethod','\"site\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.color','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.description','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.cardThumbAlignment','\"end\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elementCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.autocapitalize','true'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.autocomplete','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.autocorrect','true'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.class','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.dateAdded','\"2025-10-16T02:41:39+00:00\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.disabled','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.elementCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.id','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.includeInCards','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.inputType','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.instructions','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.label','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.max','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.min','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.name','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.orientation','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.placeholder','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.providesThumbs','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.readonly','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.required','true'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.size','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.step','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.tip','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.title','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.uid','\"02243e6f-7461-4cf3-ab60-ef2d8c6c1989\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.userCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.warning','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.0.width','100'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.dateAdded','\"2025-10-16T02:44:24+00:00\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.editCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.elementCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.fieldUid','\"68006928-9abf-4f12-aca6-5a03b6d6e672\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.handle','\"description\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.includeInCards','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.instructions','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.label','\"Description\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.providesThumbs','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.required','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.tip','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.uid','\"84522c4a-a16d-4931-9fe4-eee7c085d454\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.userCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.warning','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.1.width','100'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.dateAdded','\"2025-10-25T12:54:56+00:00\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.editCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.elementCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.fieldUid','\"b0f092c9-4cd7-4c5d-be70-089782fd85dd\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.handle','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.includeInCards','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.instructions','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.label','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.providesThumbs','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.required','false'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.tip','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.uid','\"6a83c98b-49d8-48a6-824a-dda1833e0e2a\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.userCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.warning','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.elements.2.width','100'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.name','\"Content\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.uid','\"338f0d98-87e7-4a74-a454-e6c71bd195ba\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.fieldLayouts.ea3cefb5-6bef-42cf-b4f2-56c46ded2675.tabs.0.userCondition','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.handle','\"page\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.hasTitleField','true'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.icon','\"file\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.name','\"Page\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.showSlugField','true'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.showStatusField','true'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.slugTranslationKeyFormat','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.slugTranslationMethod','\"site\"'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.titleFormat','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.titleTranslationKeyFormat','null'),('entryTypes.54f64a1d-1fa2-4197-aa96-6c979d97fcc6.titleTranslationMethod','\"site\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.color','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.description','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.cardThumbAlignment','\"end\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elementCondition','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.dateAdded','\"2025-10-27T02:57:38+00:00\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.editCondition','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.elementCondition','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.fieldUid','\"2935cdea-e46e-4878-b568-f0e098ec2a4f\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.handle','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.includeInCards','false'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.instructions','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.label','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.providesThumbs','false'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.required','false'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.tip','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.uid','\"12dac647-cacd-4ca4-9ffa-9354387d49df\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.userCondition','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.warning','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.elements.0.width','100'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.name','\"Content\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.uid','\"d4a0ff19-765b-4c94-983e-81e29ba1f7f9\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.fieldLayouts.59a7953c-d75a-4044-8ac0-78ac1e976d15.tabs.0.userCondition','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.handle','\"image\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.hasTitleField','false'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.icon','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.name','\"Image\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.showSlugField','false'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.showStatusField','true'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.slugTranslationKeyFormat','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.slugTranslationMethod','\"site\"'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.titleFormat','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.titleTranslationKeyFormat','null'),('entryTypes.63e81627-f42b-495e-a7c7-6f4e42efdc35.titleTranslationMethod','\"site\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.color','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.description','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.cardThumbAlignment','\"end\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elementCondition','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.dateAdded','\"2025-10-27T02:21:45+00:00\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.editCondition','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.elementCondition','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.fieldUid','\"a64c2e37-18b3-4179-b91c-72ded09fadb4\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.handle','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.includeInCards','false'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.instructions','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.label','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.providesThumbs','false'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.required','false'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.tip','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.uid','\"d90c6e3c-0cae-4279-9c52-d11bf45bd267\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.userCondition','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.warning','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.elements.0.width','100'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.name','\"Content\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.uid','\"9f252587-8ed5-4f6b-82c4-efb0e2108131\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.fieldLayouts.22b393cd-9dfb-4a36-99d1-b78b842709f4.tabs.0.userCondition','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.handle','\"grid\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.hasTitleField','false'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.icon','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.name','\"Grid\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.showSlugField','false'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.showStatusField','true'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.slugTranslationKeyFormat','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.slugTranslationMethod','\"site\"'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.titleFormat','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.titleTranslationKeyFormat','null'),('entryTypes.851aa807-5042-4526-a6a9-1a107ba6ce66.titleTranslationMethod','\"site\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.color','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.description','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.cardThumbAlignment','\"end\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elementCondition','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.dateAdded','\"2025-10-27T20:05:27+00:00\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.editCondition','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.elementCondition','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.fieldUid','\"46c73757-35e7-4b10-b847-51ab5433328d\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.handle','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.includeInCards','false'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.instructions','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.label','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.required','false'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.tip','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.uid','\"ef3d36fa-65b3-4fbd-929c-03081bf821d1\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.userCondition','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.warning','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.0.width','50'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.dateAdded','\"2025-10-27T20:05:27+00:00\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.editCondition','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.elementCondition','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.fieldUid','\"970e9afc-e436-4f65-8d88-106a3bfbda43\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.handle','\"showAsButton\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.includeInCards','false'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.instructions','\"If on, link will be styled like a button.\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.label','\"Show as button\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.providesThumbs','false'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.required','false'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.tip','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.uid','\"8e4cff34-4270-495a-a75c-b39b7017210b\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.userCondition','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.warning','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.elements.1.width','25'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.name','\"Content\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.uid','\"d323cfb1-06a2-4719-a629-f0536f1a44fe\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.fieldLayouts.ebb6f09b-ca8a-4e7b-8fff-a3b50d61f4c1.tabs.0.userCondition','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.handle','\"linkListItem\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.hasTitleField','false'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.icon','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.name','\"Link List Item\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.showSlugField','false'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.showStatusField','true'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.slugTranslationKeyFormat','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.slugTranslationMethod','\"site\"'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.titleFormat','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.titleTranslationKeyFormat','null'),('entryTypes.a315ebc2-7989-48ae-85e3-d0cb12a22440.titleTranslationMethod','\"site\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.color','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.description','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.cardThumbAlignment','\"end\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.autocomplete','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.autocorrect','true'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.class','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.dateAdded','\"2025-10-26T20:29:15+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.disabled','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.id','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.inputType','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.instructions','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.label','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.max','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.min','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.name','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.orientation','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.placeholder','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.readonly','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.required','true'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.size','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.step','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.title','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.uid','\"0e7e089d-6a06-47ef-9e53-89909921a860\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.0.width','100'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.dateAdded','\"2025-10-26T20:44:47+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.editCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.fieldUid','\"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.handle','\"eyebrow\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.instructions','\"The small text that appears visually above the title.\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.label','\"Eyebrow\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.required','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.uid','\"9a6fc538-caf5-4798-a7fa-4830353286e9\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.1.width','100'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.dateAdded','\"2025-10-26T20:44:47+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.editCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.fieldUid','\"68006928-9abf-4f12-aca6-5a03b6d6e672\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.handle','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.instructions','\"The main, longform text that appears in the feature block.\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.label','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.required','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.uid','\"a08474ce-9f95-422c-aaec-efef319931b8\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.2.width','100'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.dateAdded','\"2025-10-27T01:14:31+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.editCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.fieldUid','\"2935cdea-e46e-4878-b568-f0e098ec2a4f\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.handle','\"image\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.instructions','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.label','\"Image\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.required','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.uid','\"754c38f8-5445-4acf-ad86-8adf122ab477\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.3.width','75'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.dateAdded','\"2025-10-27T03:01:25+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.editCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.fieldUid','\"703d0ba8-0c19-40a0-badf-501c9c9c54f2\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.handle','\"imagePosition\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.instructions','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.label','\"Image Position\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.required','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.uid','\"440e4cd4-ad7b-4fcf-ae62-b65845128284\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.4.width','25'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.dateAdded','\"2025-10-26T20:44:47+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.editCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.fieldUid','\"46c73757-35e7-4b10-b847-51ab5433328d\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.handle','\"button\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.instructions','\"The call to action button that appears at the end of the feature block.\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.label','\"Button\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.required','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.uid','\"f476787e-4565-4b29-ad86-4ddc4ec56102\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.elements.5.width','100'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.name','\"Content\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.uid','\"c8134dc4-842f-46e5-8374-74f3d49f7886\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.0.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.dateAdded','\"2025-10-27T01:20:11+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.editCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.fieldUid','\"712e2ee5-eb54-4224-b7a1-fc87c8832892\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.handle','\"darkMode\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.instructions','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.label','\"Dark Mode\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.required','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.uid','\"14028e97-9956-47e4-9e19-84a7e64e890f\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.0.width','25'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.dateAdded','\"2025-10-27T01:21:38+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.editCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.fieldUid','\"712e2ee5-eb54-4224-b7a1-fc87c8832892\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.handle','\"topSpacing\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.instructions','\"Should there be spacing above this module?\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.label','\"Top Spacing\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.required','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.uid','\"66b5166c-6b0e-4fec-b4ba-1ba2104e1944\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.1.width','25'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.dateAdded','\"2025-10-27T01:21:38+00:00\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.editCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.elementCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.fieldUid','\"712e2ee5-eb54-4224-b7a1-fc87c8832892\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.handle','\"bottomSpacing\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.includeInCards','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.instructions','\"Should there be spacing below this module?\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.label','\"Bottom Spacing\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.providesThumbs','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.required','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.tip','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.uid','\"b2481edd-d668-4a0f-a2cc-b175265567cd\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.warning','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.elements.2.width','25'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.name','\"Appearance\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.uid','\"b2a23571-7e09-4af1-bc1f-b62b389dd9ef\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.fieldLayouts.966baff9-57a2-47ac-ae28-9f6e70d1eaf8.tabs.1.userCondition','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.handle','\"feature\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.hasTitleField','true'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.icon','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.name','\"Feature\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.showSlugField','false'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.showStatusField','true'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.slugTranslationKeyFormat','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.slugTranslationMethod','\"site\"'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.titleFormat','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.titleTranslationKeyFormat','null'),('entryTypes.b2c03297-44b8-40b1-82cd-001bf51011e8.titleTranslationMethod','\"site\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.color','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.description','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.cardThumbAlignment','\"end\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.cardView.0','\"layoutElement:362e7351-914e-441d-b1ed-f04b6aeff661\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.cardView.1','\"layoutElement:a87fc3a2-5e4d-4964-8a88-1c431a270ab5\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elementCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.autocapitalize','true'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.autocomplete','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.autocorrect','true'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.class','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.dateAdded','\"2025-10-27T02:19:34+00:00\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.disabled','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.elementCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.id','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.includeInCards','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.inputType','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.instructions','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.label','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.max','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.min','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.name','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.orientation','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.placeholder','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.providesThumbs','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.readonly','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.required','true'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.size','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.step','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.tip','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.title','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.uid','\"709dda4b-7a98-48bd-8c13-3851a85a6446\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.userCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.warning','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.0.width','100'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.dateAdded','\"2025-10-27T02:21:08+00:00\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.editCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.elementCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.fieldUid','\"68006928-9abf-4f12-aca6-5a03b6d6e672\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.handle','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.includeInCards','true'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.instructions','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.label','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.providesThumbs','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.required','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.tip','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.uid','\"a87fc3a2-5e4d-4964-8a88-1c431a270ab5\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.userCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.warning','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.1.width','100'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.dateAdded','\"2025-10-27T02:21:08+00:00\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.editCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.elementCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.fieldUid','\"46c73757-35e7-4b10-b847-51ab5433328d\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.handle','\"button\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.includeInCards','true'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.instructions','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.label','\"Button\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.providesThumbs','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.required','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.tip','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.uid','\"362e7351-914e-441d-b1ed-f04b6aeff661\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.userCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.warning','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.elements.2.width','100'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.name','\"Content\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.uid','\"30288e57-35f0-4599-a2a6-f4162273c47e\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.fieldLayouts.fabf7a18-474b-4884-89cb-a21f5f8106ad.tabs.0.userCondition','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.handle','\"gridItem\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.hasTitleField','true'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.icon','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.name','\"Grid Item\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.showSlugField','false'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.showStatusField','true'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.slugTranslationKeyFormat','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.slugTranslationMethod','\"site\"'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.titleFormat','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.titleTranslationKeyFormat','null'),('entryTypes.e32214a7-85d3-48e4-94c3-3aec995098d1.titleTranslationMethod','\"site\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.color','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.description','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.cardThumbAlignment','\"end\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.cardView.0','\"layoutElement:29b186c5-f685-4be8-a307-b0738c899ab4\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elementCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.dateAdded','\"2025-10-27T15:19:17+00:00\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.editCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.elementCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.fieldUid','\"68006928-9abf-4f12-aca6-5a03b6d6e672\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.handle','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.includeInCards','true'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.instructions','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.label','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.providesThumbs','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.required','true'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.tip','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.uid','\"29b186c5-f685-4be8-a307-b0738c899ab4\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.userCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.warning','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.0.width','100'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.dateAdded','\"2025-10-25T12:54:43+00:00\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.editCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.elementCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.fieldUid','\"e8458783-3f6a-43e3-8b85-f6b6ec9c2974\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.handle','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.includeInCards','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.instructions','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.label','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.providesThumbs','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.required','true'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.tip','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.uid','\"7c1c36cc-73ad-4707-a822-4dc3a341bf2f\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.userCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.warning','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.1.width','50'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.dateAdded','\"2025-10-27T03:28:29+00:00\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.editCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.elementCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.fieldUid','\"f6b01801-37c0-4e3f-ad44-20d619226d7d\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.handle','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.includeInCards','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.instructions','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.label','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.providesThumbs','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.required','true'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.tip','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.uid','\"90124b10-7db8-4013-bbd7-0ca03a50cf64\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.userCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.warning','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.elements.2.width','50'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.name','\"Content\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.uid','\"be714f76-54a3-42a4-91ca-1003fe2f449a\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.0.userCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elementCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.dateAdded','\"2025-10-27T02:50:21+00:00\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.editCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.elementCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.fieldUid','\"712e2ee5-eb54-4224-b7a1-fc87c8832892\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.handle','\"darkMode\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.includeInCards','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.instructions','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.label','\"Dark Mode\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.providesThumbs','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.required','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.tip','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.uid','\"cd1877b4-b584-45b0-bed6-ec29b69e4643\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.userCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.warning','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.elements.0.width','25'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.name','\"Appearance\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.uid','\"1f28e69f-ee17-4de9-a453-e88784a9c59c\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.fieldLayouts.30e732b2-7d50-475b-a137-42ec8da9986a.tabs.1.userCondition','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.handle','\"bigText\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.hasTitleField','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.icon','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.name','\"Big Text\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.showSlugField','false'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.showStatusField','true'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.slugTranslationKeyFormat','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.slugTranslationMethod','\"site\"'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.titleFormat','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.titleTranslationKeyFormat','null'),('entryTypes.e527ad7b-f272-4e6d-97c6-ab32252afa11.titleTranslationMethod','\"site\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.columnSuffix','null'),('fields.07bb3e53-0436-4795-8747-6138f3960508.handle','\"linkList\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.instructions','null'),('fields.07bb3e53-0436-4795-8747-6138f3960508.name','\"Link List\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.searchable','false'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.createButtonLabel','\"New link\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.defaultIndexViewMode','\"cards\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.enableVersioning','false'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.entryTypes.0.__assoc__.0.1','\"a315ebc2-7989-48ae-85e3-d0cb12a22440\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.includeTableView','false'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.maxEntries','null'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.minEntries','null'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.pageSize','null'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.propagationKeyFormat','null'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.propagationMethod','\"all\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.showCardsInGrid','false'),('fields.07bb3e53-0436-4795-8747-6138f3960508.settings.viewMode','\"blocks\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.translationKeyFormat','null'),('fields.07bb3e53-0436-4795-8747-6138f3960508.translationMethod','\"site\"'),('fields.07bb3e53-0436-4795-8747-6138f3960508.type','\"craft\\\\fields\\\\Matrix\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.columnSuffix','null'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.handle','\"image\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.instructions','null'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.name','\"Image\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.searchable','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.0','\"1ae2bc73-51aa-4bf1-8438-6bbb46a13bdc\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"69645877-4358-4182-b54e-e622a0013905\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.10.0','\"dateAdded\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.10.1','\"2025-10-27T01:14:28+00:00\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.11.0','\"uid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.11.1','\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.14.0','\"fieldUid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.14.1','\"6996b9dd-5274-4574-8603-ffe2aee14e21\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"providesThumbs\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','true'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"includeInCards\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"width\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','25'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"stylized\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.10.0','\"dateAdded\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.10.1','\"2025-10-27T02:58:59+00:00\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.11.0','\"uid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.11.1','\"c87b76ab-b772-481c-aa02-5dbeb7b5e2a4\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.0','\"elementCondition\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.0.0','\"elementType\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.1.0','\"fieldContext\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.1.1','\"global\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.2.0','\"class\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.0','\"conditionRules\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\RelationalFieldConditionRule\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.1.1','\"464f1814-2fdc-44b9-9858-38d4b568c6cb\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.2.0','\"operator\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.2.1','\"notempty\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.4.0','\"fieldUid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.4.1','\"6996b9dd-5274-4574-8603-ffe2aee14e21\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.5.0','\"layoutElementUid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.5.1','\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.14.0','\"fieldUid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.14.1','\"712e2ee5-eb54-4224-b7a1-fc87c8832892\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Stylized\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.3.0','\"instructions\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.3.1','\"When turned on, image will be stylized to fit with the Ambrosia branding. When turned off, image will be displayed in its raw format.\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"providesThumbs\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"includeInCards\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"width\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','25'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"caption\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.10.0','\"dateAdded\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.10.1','\"2025-10-27T01:14:28+00:00\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.11.0','\"uid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.11.1','\"21368d75-9ded-43ce-9509-26a20beef23b\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.0','\"elementCondition\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.0.0','\"elementType\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.1.0','\"fieldContext\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.1.1','\"global\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.2.0','\"class\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.0','\"conditionRules\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\RelationalFieldConditionRule\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.1.1','\"c13d9655-4c0f-4942-ae65-d71130ac51bc\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.2.0','\"operator\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.2.1','\"notempty\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.4.0','\"fieldUid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.4.1','\"6996b9dd-5274-4574-8603-ffe2aee14e21\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.5.0','\"layoutElementUid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.13.1.__assoc__.3.1.0.__assoc__.5.1','\"4d9dc53f-0f89-4185-ae47-df93f868ddcf\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.14.0','\"fieldUid\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.14.1','\"68006928-9abf-4f12-aca6-5a03b6d6e672\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Caption\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"providesThumbs\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"includeInCards\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','false'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"width\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','100'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.3.0','\"cardThumbAlignment\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.fieldLayouts.__assoc__.0.1.__assoc__.3.1','\"end\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.settings.viewMode','\"grouped\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.translationKeyFormat','null'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.translationMethod','\"site\"'),('fields.2935cdea-e46e-4878-b568-f0e098ec2a4f.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.columnSuffix','null'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.handle','\"hyperlink\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.instructions','null'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.name','\"Hyperlink\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.searchable','false'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.fullGraphqlData','true'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.maxLength','255'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.showLabelField','true'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.types.0','\"entry\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.types.1','\"url\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.types.2','\"asset\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.types.3','\"category\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.types.4','\"email\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.types.5','\"tel\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.types.6','\"sms\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.0','\"asset\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"sources\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.1.__assoc__.0.1','\"*\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"allowedKinds\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"*\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedVolumes\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.1.__assoc__.3.0','\"showUnpermittedFiles\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.0.1.__assoc__.3.1','\"\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.1.0','\"entry\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"sources\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"*\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"showUnpermittedSections\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.1.1.__assoc__.2.0','\"showUnpermittedEntries\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.2.0','\"url\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.2.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.2.1.__assoc__.0.1','\"1\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.2.1.__assoc__.1.0','\"allowAnchors\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.2.1.__assoc__.1.1','\"1\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.2.1.__assoc__.2.0','\"allowCustomSchemes\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.settings.typeSettings.__assoc__.2.1.__assoc__.2.1','\"1\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.translationKeyFormat','null'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.translationMethod','\"none\"'),('fields.46c73757-35e7-4b10-b847-51ab5433328d.type','\"craft\\\\fields\\\\Link\"'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.columnSuffix','null'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.handle','\"richText\"'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.instructions','null'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.name','\"Rich Text\"'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.searchable','true'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.availableTransforms','\"\"'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.availableVolumes','\"\"'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.characterLimit','null'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.ckeConfig','\"a173ce04-99ac-482e-a83c-6f2f39cbc6d3\"'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.createButtonLabel','null'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.defaultTransform','null'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.expandEntryButtons','false'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.fullGraphqlData','true'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.parseEmbeds','false'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.purifierConfig','null'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.purifyHtml','true'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.showUnpermittedFiles','false'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.showUnpermittedVolumes','false'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.showWordCount','false'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.settings.wordLimit','null'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.translationKeyFormat','null'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.translationMethod','\"none\"'),('fields.4e561f16-ec34-404b-aff8-9759d01bb5c1.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.columnSuffix','null'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.handle','\"text\"'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.instructions','null'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.name','\"Text\"'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.searchable','true'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.availableTransforms','\"\"'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.availableVolumes','\"*\"'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.characterLimit','null'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.ckeConfig','\"88af5f23-f761-4800-94d6-875a43403279\"'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.createButtonLabel','null'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.defaultTransform','null'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.expandEntryButtons','false'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.fullGraphqlData','true'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.parseEmbeds','false'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.purifierConfig','null'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.purifyHtml','true'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.showUnpermittedFiles','false'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.showUnpermittedVolumes','false'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.showWordCount','false'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.settings.wordLimit','null'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.translationKeyFormat','null'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.translationMethod','\"none\"'),('fields.68006928-9abf-4f12-aca6-5a03b6d6e672.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.columnSuffix','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.handle','\"asset\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.instructions','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.name','\"Asset\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.searchable','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.allowedKinds','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.allowSelfRelations','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.allowSubfolders','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.allowUploads','true'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.branchLimit','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.defaultPlacement','\"end\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.defaultUploadLocationSource','\"volume:e2b96770-e496-40d4-9d40-ef0d10c51ffa\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.defaultUploadLocationSubpath','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.maintainHierarchy','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.maxRelations','1'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.minRelations','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.previewMode','\"full\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.restrictedDefaultUploadSubpath','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.restrictedLocationSource','\"volume:e2b96770-e496-40d4-9d40-ef0d10c51ffa\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.restrictedLocationSubpath','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.restrictFiles','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.restrictLocation','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.selectionLabel','\"Add asset\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.showCardsInGrid','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.showSearchInput','true'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.showSiteMenu','true'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.showUnpermittedFiles','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.showUnpermittedVolumes','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.sources','\"*\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.targetSiteId','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.validateRelatedElements','false'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.settings.viewMode','\"list\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.translationKeyFormat','null'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.translationMethod','\"none\"'),('fields.6996b9dd-5274-4574-8603-ffe2aee14e21.type','\"craft\\\\fields\\\\Assets\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.columnSuffix','null'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.handle','\"position\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.instructions','null'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.name','\"Position\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.searchable','false'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.customOptions','false'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.0.0','\"label\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.0.1','\"Left\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.1.0','\"value\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.1.1','\"left\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.2.1','\"align-left\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.3.0','\"color\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.3.1','\"\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.4.0','\"default\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.0.__assoc__.4.1','\"1\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.0.0','\"label\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.0.1','\"Right\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.1.0','\"value\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.1.1','\"right\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.2.1','\"align-right\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.3.0','\"color\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.3.1','\"\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.4.0','\"default\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.settings.options.1.__assoc__.4.1','\"\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.translationKeyFormat','null'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.translationMethod','\"none\"'),('fields.703d0ba8-0c19-40a0-badf-501c9c9c54f2.type','\"craft\\\\fields\\\\RadioButtons\"'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.columnSuffix','null'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.handle','\"lightswitch\"'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.instructions','null'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.name','\"Lightswitch\"'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.searchable','false'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.settings.default','true'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.settings.offLabel','null'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.settings.onLabel','null'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.translationKeyFormat','null'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.translationMethod','\"none\"'),('fields.712e2ee5-eb54-4224-b7a1-fc87c8832892.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.columnSuffix','null'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.handle','\"decoratorType\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.instructions','null'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.name','\"Decorator Type\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.searchable','false'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.customOptions','false'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.0.0','\"label\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.0.1','\"Star\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.1.0','\"value\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.1.1','\"star\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.2.1','\"\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.3.0','\"color\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.3.1','\"\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.4.0','\"default\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.0.__assoc__.4.1','\"1\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.0.0','\"label\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.0.1','\"Text\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.1.0','\"value\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.1.1','\"text\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.2.1','\"\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.3.0','\"color\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.3.1','\"\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.4.0','\"default\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.1.__assoc__.4.1','\"\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.0.0','\"label\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.0.1','\"None\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.1.0','\"value\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.1.1','\"none\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.2.1','\"\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.3.0','\"color\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.3.1','\"\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.4.0','\"default\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.settings.options.2.__assoc__.4.1','\"\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.translationKeyFormat','null'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.translationMethod','\"none\"'),('fields.9326f3fe-85dc-4d36-be66-51893eefcd06.type','\"craft\\\\fields\\\\RadioButtons\"'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.columnSuffix','null'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.handle','\"lightswitchDefaultOff\"'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.instructions','null'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.name','\"Lightswitch (Default Off)\"'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.searchable','false'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.settings.default','false'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.settings.offLabel','null'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.settings.onLabel','null'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.translationKeyFormat','null'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.translationMethod','\"none\"'),('fields.970e9afc-e436-4f65-8d88-106a3bfbda43.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.columnSuffix','null'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.handle','\"people\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.instructions','null'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.name','\"People\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.searchable','false'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.createButtonLabel','\"New person\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.defaultIndexViewMode','\"cards\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.enableVersioning','false'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.entryTypes.0.__assoc__.0.1','\"490807f9-8e12-43ce-8fee-22730b42f3b4\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.includeTableView','false'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.maxEntries','null'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.minEntries','null'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.pageSize','50'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.propagationKeyFormat','null'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.propagationMethod','\"all\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.showCardsInGrid','true'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.settings.viewMode','\"cards\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.translationKeyFormat','null'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.translationMethod','\"site\"'),('fields.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8.type','\"craft\\\\fields\\\\Matrix\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.columnSuffix','null'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.handle','\"gridItems\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.instructions','null'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.name','\"Grid Items\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.searchable','false'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.createButtonLabel','\"New item\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.defaultIndexViewMode','\"cards\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.enableVersioning','false'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.entryTypes.0.__assoc__.0.1','\"e32214a7-85d3-48e4-94c3-3aec995098d1\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.includeTableView','false'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.maxEntries','null'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.minEntries','null'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.pageSize','50'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.propagationKeyFormat','null'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.propagationMethod','\"all\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.showCardsInGrid','true'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.settings.viewMode','\"cards\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.translationKeyFormat','null'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.translationMethod','\"site\"'),('fields.a64c2e37-18b3-4179-b91c-72ded09fadb4.type','\"craft\\\\fields\\\\Matrix\"'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.columnSuffix','null'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.handle','\"plainText\"'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.instructions','null'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.name','\"Plain Text\"'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.searchable','true'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.settings.byteLimit','null'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.settings.charLimit','null'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.settings.code','false'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.settings.initialRows','4'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.settings.multiline','false'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.settings.placeholder','null'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.settings.uiMode','\"normal\"'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.translationKeyFormat','null'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.translationMethod','\"none\"'),('fields.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b.type','\"craft\\\\fields\\\\PlainText\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.columnSuffix','null'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.handle','\"modules\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.instructions','null'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.name','\"Modules\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.searchable','false'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.createButtonLabel','\"New module\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.defaultIndexViewMode','\"cards\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.enableVersioning','false'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.0.__assoc__.0.1','\"b2c03297-44b8-40b1-82cd-001bf51011e8\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.1.__assoc__.0.0','\"uid\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.1.__assoc__.0.1','\"e527ad7b-f272-4e6d-97c6-ab32252afa11\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.1.__assoc__.1.0','\"group\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.1.__assoc__.1.1','\"General\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.2.__assoc__.0.0','\"uid\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.2.__assoc__.0.1','\"851aa807-5042-4526-a6a9-1a107ba6ce66\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.2.__assoc__.1.0','\"group\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.2.__assoc__.1.1','\"General\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.3.__assoc__.0.0','\"uid\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.3.__assoc__.0.1','\"190a6916-6a81-4626-a188-9c9e95a060c2\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.3.__assoc__.1.0','\"group\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.3.__assoc__.1.1','\"General\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.4.__assoc__.0.0','\"uid\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.4.__assoc__.0.1','\"63e81627-f42b-495e-a7c7-6f4e42efdc35\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.4.__assoc__.1.0','\"group\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.entryTypes.4.__assoc__.1.1','\"General\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.includeTableView','false'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.maxEntries','null'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.minEntries','null'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.pageSize','null'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.propagationKeyFormat','null'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.propagationMethod','\"all\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.showCardsInGrid','false'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.settings.viewMode','\"blocks\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.translationKeyFormat','null'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.translationMethod','\"site\"'),('fields.b0f092c9-4cd7-4c5d-be70-089782fd85dd.type','\"craft\\\\fields\\\\Matrix\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.columnSuffix','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.handle','\"assets\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.instructions','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.name','\"Assets\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.searchable','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.allowedKinds','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.allowSelfRelations','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.allowSubfolders','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.allowUploads','true'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.branchLimit','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.defaultPlacement','\"end\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.defaultUploadLocationSource','\"volume:e2b96770-e496-40d4-9d40-ef0d10c51ffa\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.defaultUploadLocationSubpath','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.maintainHierarchy','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.maxRelations','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.minRelations','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.previewMode','\"full\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.restrictedDefaultUploadSubpath','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.restrictedLocationSource','\"volume:e2b96770-e496-40d4-9d40-ef0d10c51ffa\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.restrictedLocationSubpath','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.restrictFiles','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.restrictLocation','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.selectionLabel','\"Add asset\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.showCardsInGrid','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.showSearchInput','true'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.showSiteMenu','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.showUnpermittedFiles','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.showUnpermittedVolumes','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.sources','\"*\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.targetSiteId','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.validateRelatedElements','false'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.settings.viewMode','\"large\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.translationKeyFormat','null'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.translationMethod','\"none\"'),('fields.c20da1f2-432b-4f57-a5df-412d795323e0.type','\"craft\\\\fields\\\\Assets\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.columnSuffix','null'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.handle','\"topDecorator\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.instructions','null'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.name','\"Top Decorator\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.searchable','false'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.0','\"a89c1a5d-c277-44d0-b209-20f4e9f815f1\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"3aaa6b42-4bec-4b6a-a666-9e01ed31e3fc\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.10.0','\"dateAdded\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.10.1','\"2025-10-25T12:54:36+00:00\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.11.0','\"uid\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.11.1','\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.14.0','\"fieldUid\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.14.1','\"9326f3fe-85dc-4d36-be66-51893eefcd06\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"providesThumbs\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','false'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"includeInCards\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','false'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"width\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','100'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"decoratorText\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.10.0','\"dateAdded\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.10.1','\"2025-10-25T12:54:36+00:00\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.11.0','\"uid\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.11.1','\"6802c467-ea08-45a9-8ec4-6f62c4f8bb55\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.0','\"elementCondition\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.0.0','\"elementType\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.1.0','\"fieldContext\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.1.1','\"global\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.2.0','\"class\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.0','\"conditionRules\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.1.1','\"ee2b9d23-7246-4cb3-86e2-fc5cd0cdaf1a\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.2.0','\"operator\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.2.1','\"in\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.3.0','\"values\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.3.1.0','\"text\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.4.0','\"fieldUid\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.4.1','\"9326f3fe-85dc-4d36-be66-51893eefcd06\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.5.0','\"layoutElementUid\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.5.1','\"0b806bbc-71ae-4b37-aeef-4ece789c11f3\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.14.0','\"fieldUid\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.14.1','\"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Decorator Text\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"providesThumbs\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','false'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"includeInCards\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','false'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"width\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','100'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.3.0','\"cardThumbAlignment\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.fieldLayouts.__assoc__.0.1.__assoc__.3.1','\"end\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.settings.viewMode','\"grouped\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.translationKeyFormat','null'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.translationMethod','\"site\"'),('fields.e8458783-3f6a-43e3-8b85-f6b6ec9c2974.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.columnSuffix','null'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.handle','\"bottomDecorator\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.instructions','null'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.name','\"Bottom Decorator\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.searchable','false'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.0','\"7101a357-327d-4f1c-a06e-2f44b84b6bc9\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"efb29114-697c-4998-8866-48b0d6dc6abc\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.10.0','\"dateAdded\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.10.1','\"2025-10-27T03:27:34+00:00\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.11.0','\"uid\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.11.1','\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.14.0','\"fieldUid\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.14.1','\"9326f3fe-85dc-4d36-be66-51893eefcd06\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"providesThumbs\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','false'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"includeInCards\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','false'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"width\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','100'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"decoratorText\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.10.0','\"dateAdded\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.10.1','\"2025-10-27T03:27:34+00:00\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.11.0','\"uid\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.11.1','\"0da4fe80-b069-4498-8fb4-a89099bad6be\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.0','\"elementCondition\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.0.0','\"elementType\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.1.0','\"fieldContext\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.1.1','\"global\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.2.0','\"class\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.0','\"conditionRules\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.1.1','\"ecec7b5f-8bab-4d88-9242-fd3901f2f6bf\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.2.0','\"operator\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.2.1','\"in\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.3.0','\"values\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.3.1.0','\"text\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.4.0','\"fieldUid\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.4.1','\"9326f3fe-85dc-4d36-be66-51893eefcd06\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.5.0','\"layoutElementUid\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.13.1.__assoc__.3.1.0.__assoc__.5.1','\"60e2c2f7-e6f2-4d78-b230-31b1f801d75b\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.14.0','\"fieldUid\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.14.1','\"a9b52af2-d6a8-44b8-8158-9d3be52a0d3b\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Decorator Text\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"providesThumbs\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','false'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"includeInCards\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','false'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"width\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','100'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.3.0','\"cardThumbAlignment\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.fieldLayouts.__assoc__.0.1.__assoc__.3.1','\"end\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.settings.viewMode','\"grouped\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.translationKeyFormat','null'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.translationMethod','\"site\"'),('fields.f6b01801-37c0-4e3f-ad44-20d619226d7d.type','\"craft\\\\fields\\\\ContentBlock\"'),('fs.images.hasUrls','true'),('fs.images.name','\"Images\"'),('fs.images.settings.path','\"@webroot/m/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"$PRIMARY_SITE_URL/m/images\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.cardThumbAlignment','\"end\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elementCondition','null'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.dateAdded','\"2025-10-27T20:05:55+00:00\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.editCondition','null'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.elementCondition','null'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.fieldUid','\"07bb3e53-0436-4795-8747-6138f3960508\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.handle','\"navigation\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.includeInCards','false'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.instructions','null'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.label','\"Navigation\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.providesThumbs','false'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.required','false'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.tip','null'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.uid','\"062b35a1-6351-4bc9-ab94-384583513ab6\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.userCondition','null'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.warning','null'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.elements.0.width','100'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.name','\"Content\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.uid','\"59cca3ec-9ec5-4ac8-8996-0c06313f310c\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.fieldLayouts.0118b056-8973-4a2b-9ea5-9a1554ee3179.tabs.0.userCondition','null'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.handle','\"header\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.name','\"Header\"'),('globalSets.1d209306-01a4-4dc7-bc72-da0723fee5aa.sortOrder','1'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.fill','null'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.format','null'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.handle','\"small\"'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.height','null'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.interlace','\"none\"'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.mode','\"crop\"'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.name','\"Small\"'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.position','\"center-center\"'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.quality','60'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.upscale','false'),('imageTransforms.8344a3e0-212e-43cf-abb1-e1ffaaa22221.width','800'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.fill','null'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.format','null'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.handle','\"full\"'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.height','null'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.interlace','\"none\"'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.mode','\"crop\"'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.name','\"Full\"'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.position','\"center-center\"'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.quality','60'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.upscale','false'),('imageTransforms.89af2a35-e134-4f85-a55c-244e847bbb71.width','3000'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.fill','null'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.format','null'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.handle','\"smallSquare\"'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.height','800'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.interlace','\"none\"'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.mode','\"crop\"'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.name','\"Small Square\"'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.position','\"center-center\"'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.quality','60'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.upscale','false'),('imageTransforms.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501.width','800'),('meta.__names__.07bb3e53-0436-4795-8747-6138f3960508','\"Link List\"'),('meta.__names__.190a6916-6a81-4626-a188-9c9e95a060c2','\"People Listing\"'),('meta.__names__.1d209306-01a4-4dc7-bc72-da0723fee5aa','\"Header\"'),('meta.__names__.2935cdea-e46e-4878-b568-f0e098ec2a4f','\"Image\"'),('meta.__names__.45a00e92-2550-47ce-b789-33064e5da296','\"Ambrosia\"'),('meta.__names__.46c73757-35e7-4b10-b847-51ab5433328d','\"Hyperlink\"'),('meta.__names__.490807f9-8e12-43ce-8fee-22730b42f3b4','\"Person\"'),('meta.__names__.4e561f16-ec34-404b-aff8-9759d01bb5c1','\"Rich Text\"'),('meta.__names__.54f64a1d-1fa2-4197-aa96-6c979d97fcc6','\"Page\"'),('meta.__names__.63e81627-f42b-495e-a7c7-6f4e42efdc35','\"Image\"'),('meta.__names__.68006928-9abf-4f12-aca6-5a03b6d6e672','\"Text\"'),('meta.__names__.6996b9dd-5274-4574-8603-ffe2aee14e21','\"Asset\"'),('meta.__names__.6fdfbe08-3bed-49e1-806c-1ae77457186d','\"Pages\"'),('meta.__names__.703d0ba8-0c19-40a0-badf-501c9c9c54f2','\"Position\"'),('meta.__names__.712e2ee5-eb54-4224-b7a1-fc87c8832892','\"Lightswitch\"'),('meta.__names__.72c3451a-3b3b-46c5-ac75-dfcefb6fa165','\"Home\"'),('meta.__names__.8344a3e0-212e-43cf-abb1-e1ffaaa22221','\"Small\"'),('meta.__names__.851aa807-5042-4526-a6a9-1a107ba6ce66','\"Grid\"'),('meta.__names__.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e','\"Ambrosia Space Manufacturing Company\"'),('meta.__names__.88af5f23-f761-4800-94d6-875a43403279','\"Simple\"'),('meta.__names__.89af2a35-e134-4f85-a55c-244e847bbb71','\"Full\"'),('meta.__names__.9326f3fe-85dc-4d36-be66-51893eefcd06','\"Decorator Type\"'),('meta.__names__.970e9afc-e436-4f65-8d88-106a3bfbda43','\"Lightswitch (Default Off)\"'),('meta.__names__.98e1c883-e4bb-4f43-b092-59d0bf6b3bc8','\"People\"'),('meta.__names__.a173ce04-99ac-482e-a83c-6f2f39cbc6d3','\"Full\"'),('meta.__names__.a315ebc2-7989-48ae-85e3-d0cb12a22440','\"Link List Item\"'),('meta.__names__.a64c2e37-18b3-4179-b91c-72ded09fadb4','\"Grid Items\"'),('meta.__names__.a9b52af2-d6a8-44b8-8158-9d3be52a0d3b','\"Plain Text\"'),('meta.__names__.b0f092c9-4cd7-4c5d-be70-089782fd85dd','\"Modules\"'),('meta.__names__.b2c03297-44b8-40b1-82cd-001bf51011e8','\"Feature\"'),('meta.__names__.c20da1f2-432b-4f57-a5df-412d795323e0','\"Assets\"'),('meta.__names__.e2b96770-e496-40d4-9d40-ef0d10c51ffa','\"Images\"'),('meta.__names__.e32214a7-85d3-48e4-94c3-3aec995098d1','\"Grid Item\"'),('meta.__names__.e527ad7b-f272-4e6d-97c6-ab32252afa11','\"Big Text\"'),('meta.__names__.e8458783-3f6a-43e3-8b85-f6b6ec9c2974','\"Top Decorator\"'),('meta.__names__.f6b01801-37c0-4e3f-ad44-20d619226d7d','\"Bottom Decorator\"'),('meta.__names__.f8f44cc1-2ad4-406c-b5ee-6f9f213c5501','\"Small Square\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.defaultPlacement','\"end\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.enableVersioning','true'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.entryTypes.0.uid','\"54f64a1d-1fa2-4197-aa96-6c979d97fcc6\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.handle','\"pages\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.maxAuthors','null'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.name','\"Pages\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.previewTargets.0.label','\"Primary entry page\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.previewTargets.0.refresh','\"1\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.previewTargets.0.urlFormat','\"{url}\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.propagationMethod','\"all\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.enabledByDefault','true'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.hasUrls','true'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.template','\"entry.twig\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.uriFormat','\"{parent.uri}/{slug}\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.structure.maxLevels','null'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.structure.uid','\"319c5702-5955-4029-91cf-bc0bfdec239f\"'),('sections.6fdfbe08-3bed-49e1-806c-1ae77457186d.type','\"structure\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.defaultPlacement','\"end\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.enableVersioning','true'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.entryTypes.0.uid','\"54f64a1d-1fa2-4197-aa96-6c979d97fcc6\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.handle','\"home\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.maxAuthors','null'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.name','\"Home\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.previewTargets.0.label','\"Primary entry page\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.previewTargets.0.refresh','\"1\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.previewTargets.0.urlFormat','\"{url}\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.propagationMethod','\"all\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.enabledByDefault','true'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.hasUrls','true'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.template','null'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.uriFormat','\"__home__\"'),('sections.72c3451a-3b3b-46c5-ac75-dfcefb6fa165.type','\"single\"'),('siteGroups.45a00e92-2550-47ce-b789-33064e5da296.name','\"Ambrosia\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.enabled','true'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.handle','\"default\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.hasUrls','true'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.language','\"en-US\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.name','\"Ambrosia Space Manufacturing Company\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.primary','true'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.siteGroup','\"45a00e92-2550-47ce-b789-33064e5da296\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Ambrosia Space Manufacturing Company\"'),('system.retryDuration','null'),('system.schemaVersion','\"5.8.0.3\"'),('system.timeZone','\"America/Chicago\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.altTranslationKeyFormat','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.altTranslationMethod','\"none\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.cardThumbAlignment','\"start\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elementCondition','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.autocapitalize','true'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.autocomplete','false'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.autocorrect','true'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.class','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.dateAdded','\"2025-10-16T02:33:42+00:00\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.disabled','false'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.elementCondition','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.id','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.includeInCards','false'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.inputType','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.instructions','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.label','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.max','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.min','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.name','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.orientation','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.placeholder','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.providesThumbs','false'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.readonly','false'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.requirable','false'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.size','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.step','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.tip','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.title','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.uid','\"e9d52890-4151-46f9-a10b-aeec615d1612\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.userCondition','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.warning','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.elements.0.width','100'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.name','\"Content\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.uid','\"c080635c-dfbd-4ddb-9e84-14c7efce291d\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fieldLayouts.c1036500-6835-4135-a42e-709ba77489d6.tabs.0.userCondition','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.fs','\"images\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.handle','\"images\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.name','\"Images\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.sortOrder','1'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.subpath','\"\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.titleTranslationKeyFormat','null'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.titleTranslationMethod','\"site\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.transformFs','\"\"'),('volumes.e2b96770-e496-40d4-9d40-ef0d10c51ffa.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_orypwcsixdesnejpzdawwawrifdnexjrbfrb` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_vrgqevdtkrxwctmpcqqsnnvxrqfevfqtywem` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=572 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vkxrtpmtnqpnuodetrntcaarcysalvqauebx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_xulhcqzqfsamutuuvdbtaxftauypsiuitzqc` (`sourceId`),
  KEY `idx_pubknjafsyspykixeqonaunjqnqgvhwwwlha` (`targetId`),
  KEY `idx_zukzsktnysckzxnwdeiyvsjutrdvebmqphey` (`sourceSiteId`),
  CONSTRAINT `fk_rvypdhvngtfwfpjblanaanitgqtjvhbecffa` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sxqdpbitnqoyqredanpdaptkrgqozutioiev` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vfjfgqbuythjhxircrenrfummpsbzhwfqbyc` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (2,4,18,1,2,1,'2025-10-26 20:47:08','2025-10-26 20:47:08','5300b1f6-2bbf-48f0-9581-45102bda3ea9'),(3,4,20,1,2,1,'2025-10-26 20:47:08','2025-10-26 20:47:08','5038e877-6736-42ce-9903-ba905dd7196e'),(10,4,28,1,2,1,'2025-10-26 20:51:32','2025-10-26 20:51:32','c2df7ab4-1830-4d1e-844e-35dace70017e'),(15,4,34,1,2,1,'2025-10-27 01:19:02','2025-10-27 01:19:02','6136b208-b282-43c1-925c-00b19fee6af7'),(16,5,35,NULL,21,1,'2025-10-27 01:19:02','2025-10-27 01:19:02','2744d21e-3992-4008-bb1f-cf39a684a691'),(18,4,43,1,2,1,'2025-10-27 02:22:56','2025-10-27 02:22:56','15037b93-8583-4c2b-88a0-af1ed3dc9e06'),(19,4,48,1,2,1,'2025-10-27 02:22:56','2025-10-27 02:22:56','fe9deff0-5317-4702-b27c-eb70b21b56eb'),(22,5,66,NULL,62,1,'2025-10-27 02:46:08','2025-10-27 02:46:08','01a0ff61-5ed8-4b90-bf03-94c9483af6e6'),(23,5,69,NULL,62,1,'2025-10-27 02:46:08','2025-10-27 02:46:08','89b539c8-d73d-4eb9-862e-28a1383c930c'),(27,5,76,NULL,63,1,'2025-10-27 02:49:33','2025-10-27 02:49:33','71725305-0ded-44b3-abee-a8d3af998c1e'),(28,5,77,NULL,59,1,'2025-10-27 02:49:33','2025-10-27 02:49:33','57de8d3c-0373-44d1-b158-376dd019c52d'),(29,5,78,NULL,60,1,'2025-10-27 02:49:33','2025-10-27 02:49:33','e5cb1e30-e9a6-48c5-a519-571e3e9b60f9'),(30,5,81,NULL,63,1,'2025-10-27 02:49:33','2025-10-27 02:49:33','5d935956-e9ca-4fbf-9807-9285d820fbd9'),(31,5,82,NULL,59,1,'2025-10-27 02:49:33','2025-10-27 02:49:33','d300d45b-02dc-4595-a8f1-8358744f80a8'),(32,5,83,NULL,60,1,'2025-10-27 02:49:33','2025-10-27 02:49:33','8bff4e4d-e6dd-48e1-a64c-3cea146984e7'),(34,5,91,NULL,89,1,'2025-10-27 02:59:56','2025-10-27 02:59:56','8bbf013e-de81-4f48-afbf-9c7447968ef3'),(35,5,95,NULL,89,1,'2025-10-27 02:59:56','2025-10-27 02:59:56','557ad090-9ceb-4476-b539-10a1a8b97d09'),(37,4,99,1,2,1,'2025-10-27 03:02:18','2025-10-27 03:02:18','9b93b70a-01a3-4b29-82bc-8a0f564946e1'),(38,4,102,1,2,1,'2025-10-27 03:08:50','2025-10-27 03:08:50','7acc51e2-848c-4081-9237-3e9acc2cf7fd'),(39,4,113,1,2,1,'2025-10-27 03:29:31','2025-10-27 03:29:31','2ca49c81-d964-4801-858c-1af8c61c6af6'),(41,4,163,1,2,1,'2025-10-27 15:34:11','2025-10-27 15:34:11','14beb593-3f07-4957-8cca-80469c64a404'),(42,4,178,1,2,1,'2025-10-27 15:34:12','2025-10-27 15:34:12','506cacb8-75ef-43b7-a992-cd8fd468c262'),(44,5,184,NULL,89,1,'2025-10-27 17:05:49','2025-10-27 17:05:49','2c5867fc-e9f7-4f47-9ecf-245bdaaf5941'),(45,5,187,NULL,89,1,'2025-10-27 17:09:11','2025-10-27 17:09:11','11de8d0a-0598-4d91-b543-22a743629513'),(46,5,190,NULL,89,1,'2025-10-27 17:15:19','2025-10-27 17:15:19','69abd7f3-941d-4df9-bd0b-f934501e1d7e'),(48,5,211,NULL,62,1,'2025-10-27 17:50:18','2025-10-27 17:50:18','e2f8d79c-040b-44cb-9fa7-b946153604bd'),(53,5,217,NULL,21,1,'2025-10-27 19:18:23','2025-10-27 19:18:23','8b97b347-7408-4ef6-93f8-5aeb643f9e48'),(54,4,219,1,2,1,'2025-10-27 19:18:23','2025-10-27 19:18:23','7c9fabe7-5e8b-44b4-b825-e2c77973def3'),(55,4,220,1,2,1,'2025-10-27 19:18:23','2025-10-27 19:18:23','786fbff2-d8b8-44ad-bbf6-84bc81b53ce0'),(56,5,221,NULL,21,1,'2025-10-27 19:18:23','2025-10-27 19:18:23','bc4a74a1-cf7d-41ec-a541-c3d8680137bc'),(59,4,226,1,2,1,'2025-10-27 19:20:31','2025-10-27 19:20:31','aaa7fda5-4fbe-462a-b9d9-fe8a4adc7b0f'),(60,5,227,NULL,21,1,'2025-10-27 19:20:31','2025-10-27 19:20:31','c8c63ed2-ddc1-4021-b0bb-648c45d44bff'),(64,5,29,NULL,22,1,'2025-10-27 19:20:43','2025-10-27 19:20:43','764da4c2-0f4a-4b03-9c87-fac50e3e93f4'),(65,4,232,1,2,1,'2025-10-27 19:20:43','2025-10-27 19:20:43','15ab28e3-2818-41f5-8897-7bbee40e886f'),(66,5,233,NULL,22,1,'2025-10-27 19:20:43','2025-10-27 19:20:43','421b2e03-cee4-4be1-831e-ff2a1f4f507f'),(69,4,238,1,2,1,'2025-10-27 19:22:59','2025-10-27 19:22:59','e2026c63-8e2b-4362-b4ea-82190fa4800c'),(70,4,239,1,2,1,'2025-10-27 19:22:59','2025-10-27 19:22:59','319c9bcb-f0b2-4d5e-8e57-62957c656830'),(71,4,241,1,2,1,'2025-10-27 19:24:52','2025-10-27 19:24:52','1d200893-f705-4ea1-9131-af6ab80afe9f'),(72,5,242,NULL,21,1,'2025-10-27 19:24:52','2025-10-27 19:24:52','06cd4760-5f02-4d82-a05e-7c1f4af64ca2'),(75,4,247,1,2,1,'2025-10-27 19:25:09','2025-10-27 19:25:09','410b96a7-53cc-4fbc-a654-70f480deb658'),(76,5,248,NULL,21,1,'2025-10-27 19:25:09','2025-10-27 19:25:09','e12e03f0-ffa2-4464-a775-0adbcf608d79'),(78,4,252,1,2,1,'2025-10-27 19:27:42','2025-10-27 19:27:42','9f26c552-3c65-4415-b8c1-b77c84f645bd'),(80,4,256,1,2,1,'2025-10-27 19:27:48','2025-10-27 19:27:48','8bfbef8a-68ba-4a2c-858e-a77aa4dce030'),(85,5,273,NULL,62,1,'2025-10-27 19:51:34','2025-10-27 19:51:34','f1f50ad9-3aa0-4583-8383-923606e10edf'),(86,5,274,NULL,63,1,'2025-10-27 19:51:34','2025-10-27 19:51:34','31cc8eea-2512-48a2-8f74-84f4113774f0'),(87,5,275,NULL,59,1,'2025-10-27 19:51:34','2025-10-27 19:51:34','7d0e5ba3-c67d-40b6-a908-a78bc14a4b66'),(88,5,276,NULL,60,1,'2025-10-27 19:51:34','2025-10-27 19:51:34','3c158eb5-725f-4c64-b599-766871548619'),(89,5,279,NULL,62,1,'2025-10-27 19:51:34','2025-10-27 19:51:34','9d27cbbe-fea8-42c9-bd13-e886de46c927'),(90,5,280,NULL,63,1,'2025-10-27 19:51:34','2025-10-27 19:51:34','f4d5eab3-0425-45d0-92e9-dd9440e431d9'),(91,5,281,NULL,59,1,'2025-10-27 19:51:35','2025-10-27 19:51:35','6606eb01-41c4-4ba5-9451-ed02200fd657'),(92,5,282,NULL,60,1,'2025-10-27 19:51:35','2025-10-27 19:51:35','49dbbcd5-5809-4b21-8be3-410a5e7f1db4'),(94,5,302,NULL,89,1,'2025-10-27 19:58:06','2025-10-27 19:58:06','4e0e7cfa-8963-45c9-a99b-b14e98b1f284'),(95,5,305,NULL,89,1,'2025-10-27 19:58:06','2025-10-27 19:58:06','e12e28d3-310c-4f25-9f21-ab2460b5c586'),(96,4,309,1,258,1,'2025-10-27 20:06:22','2025-10-27 20:06:22','21614fc3-e783-4492-8ed9-d5dba9f856a7'),(97,4,310,1,283,1,'2025-10-27 20:06:22','2025-10-27 20:06:22','8deeafe9-6bde-42f8-8aa0-b3880513c31c');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('105c2360','@craft/web/assets/iframeresizer/dist'),('1080c9e','@craft/web/assets/cp/dist'),('1393b7c1','@craft/web/assets/garnish/dist'),('13fe76d2','@craft/web/assets/theme/dist'),('1b3d2ad7','@craft/web/assets/d3/dist'),('1b76d50f','@craft/web/assets/updateswidget/dist'),('21df43e','@craft/web/assets/admintable/dist'),('2321be9e','@craft/web/assets/tablesettings/dist'),('23d0c291','@craft/web/assets/matrix/dist'),('25cc9761','@craft/web/assets/recententries/dist'),('2b0b16e8','@craft/web/assets/utilities/dist'),('2c0fd13e','@craft/web/assets/updater/dist'),('35d384cb','@craft/web/assets/sites/dist'),('3b2180d6','@craft/web/assets/fabric/dist'),('3d390238','@craft/web/assets/axios/dist'),('4bd0a26a','@craft/web/assets/fabric/dist'),('4dc82084','@craft/web/assets/axios/dist'),('56badd89','@craft/web/assets/conditionbuilder/dist'),('5bfa3454','@craft/web/assets/utilities/dist'),('5cfef382','@craft/web/assets/updater/dist'),('60ad01dc','@craft/web/assets/iframeresizer/dist'),('62a8a3e8','@craft/web/assets/generalsettings/dist'),('630f546e','@craft/web/assets/theme/dist'),('6362957d','@craft/web/assets/garnish/dist'),('66c4d4ea','@craft/web/assets/fieldsettings/dist'),('6bcc086b','@craft/web/assets/d3/dist'),('71f92e22','@craft/web/assets/cp/dist'),('78821e5f','@craft/web/assets/pluginstore/dist'),('7aa43648','@craft/web/assets/tailwindreset/dist'),('7c8575f4','@craft/web/assets/installer/dist'),('7db18c6a','@craft/web/assets/selectize/dist'),('83cf1e42','@craft/web/assets/feed/dist'),('890e4c7e','@craft/web/assets/jquerytouchevents/dist'),('895d931c','@craft/web/assets/jquerypayment/dist'),('8cca91ab','@craft/web/assets/velocity/dist'),('903bd168','@craft/web/assets/animationblocker/dist'),('99f79e97','@craft/web/assets/routes/dist'),('9eab98ba','@craft/web/assets/htmx/dist'),('a5514f4','@craft/web/assets/tailwindreset/dist'),('a5e58a7e','@craft/web/assets/jqueryui/dist'),('af021a68','@bower/jquery/dist'),('af93041b','@nystudio107/codeeditor/web/assets/dist'),('b0167fbc','@craft/web/assets/prismjs/dist'),('b3ac4563','@craft/web/assets/updates/dist'),('b50649c2','@craft/web/assets/picturefill/dist'),('bb9e5cd5','@craft/web/assets/fileupload/dist'),('bcda2306','@craft/web/assets/craftsupport/dist'),('bebef4c2','@craft/web/assets/xregexp/dist'),('c35d67df','@craft/web/assets/updates/dist'),('c5f76b7e','@craft/web/assets/picturefill/dist'),('c745748','@craft/web/assets/installer/dist'),('ca859bc2','@craft/web/assets/timepicker/dist'),('cb6f7e69','@craft/web/assets/fileupload/dist'),('ce4fd67e','@craft/web/assets/xregexp/dist'),('d40aed6','@craft/web/assets/selectize/dist'),('d514a8c2','@craft/web/assets/jqueryui/dist'),('dcb2d72c','@craft/ckeditor/web/assets/ckeconfig/dist'),('dff338d4','@bower/jquery/dist'),('e81b6b4c','@craft/web/assets/vue/dist'),('e8439b13','@craft/web/assets/editsection/dist'),('e97d2f6b','@craft/ckeditor/web/assets/ckeditor/dist'),('ee9ac701','@craft/web/assets/plugins/dist'),('f331df45','@craft/web/assets/edittransform/dist'),('f9acb1a0','@craft/web/assets/jquerypayment/dist'),('f9ff6ec2','@craft/web/assets/jquerytouchevents/dist'),('fa8c3889','@craft/web/assets/dashboard/dist'),('fc3bb317','@craft/web/assets/velocity/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dcxkowcygxhqeotqafxuupcpxkxgmoriuyyi` (`canonicalId`,`num`),
  KEY `fk_nvkmipoujohgsszufjycotvldtqyewjovotl` (`creatorId`),
  CONSTRAINT `fk_dotwpugyhfkfxbtwfxlmglcqquixyijhwllj` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nvkmipoujohgsszufjycotvldtqyewjovotl` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,'Applied “Draft 1”'),(3,7,1,1,NULL),(4,8,1,1,NULL),(5,2,1,3,'Applied “Draft 1”'),(6,18,1,1,NULL),(7,2,1,4,'Applied “Draft 1”'),(8,18,1,2,NULL),(9,2,1,5,'Applied “Draft 1”'),(10,18,1,3,NULL),(11,29,1,1,NULL),(12,2,1,6,'Applied “Draft 1”'),(13,7,1,2,NULL),(14,8,1,2,NULL),(15,42,1,1,NULL),(16,43,1,1,NULL),(17,2,1,7,'Applied “Draft 1”'),(18,42,1,2,NULL),(19,52,1,1,NULL),(20,2,1,8,'Applied “Draft 1”'),(21,65,1,1,NULL),(22,66,1,1,NULL),(23,2,1,9,'Applied “Draft 1”'),(24,65,1,2,NULL),(25,76,1,1,NULL),(26,77,1,1,NULL),(27,78,1,1,NULL),(28,2,1,10,''),(29,2,1,11,'Applied “Draft 1”'),(30,65,1,3,NULL),(31,90,1,1,NULL),(32,91,1,1,NULL),(33,2,1,12,'Applied “Draft 1”'),(34,18,1,4,NULL),(35,2,1,13,NULL),(36,2,1,14,NULL),(37,18,1,5,NULL),(38,7,1,3,NULL),(39,42,1,3,NULL),(40,65,1,4,NULL),(41,90,1,2,NULL),(42,2,1,15,'Applied “Draft 1”'),(43,18,1,6,NULL),(44,7,1,4,NULL),(45,8,1,3,NULL),(46,107,1,1,NULL),(47,42,1,4,NULL),(48,65,1,5,NULL),(49,90,1,3,NULL),(50,2,1,16,'Applied “Draft 1”'),(51,7,1,5,NULL),(52,8,1,4,NULL),(53,2,1,17,'Applied “Draft 1”'),(54,130,1,1,NULL),(55,131,1,1,NULL),(56,132,1,1,NULL),(57,2,1,18,'Applied “Draft 1”'),(58,7,1,6,NULL),(59,8,1,5,NULL),(60,143,1,1,NULL),(61,144,1,1,NULL),(62,145,1,1,NULL),(63,2,1,19,'Applied “Draft 1”'),(64,7,1,7,NULL),(65,143,1,2,NULL),(66,130,1,2,NULL),(67,2,1,20,'Applied “Draft 1”'),(68,42,1,5,NULL),(69,163,1,1,NULL),(70,2,1,21,'Applied “Draft 1”'),(71,42,1,6,NULL),(72,52,1,2,NULL),(73,2,1,22,'Applied “Draft 1”'),(74,42,1,7,NULL),(75,163,1,2,NULL),(76,2,1,23,'Applied “Draft 1”'),(77,90,1,4,NULL),(78,91,1,2,NULL),(79,2,1,24,''),(80,90,1,5,NULL),(81,91,1,3,NULL),(82,2,1,25,''),(83,90,1,6,NULL),(84,91,1,4,NULL),(85,2,1,26,'Applied “Draft 1”'),(86,42,1,8,NULL),(87,194,1,1,NULL),(88,2,1,27,'Applied “Draft 1”'),(89,42,1,9,NULL),(90,2,1,28,'Applied “Draft 1”'),(91,2,1,29,'Applied “Draft 1”'),(92,2,1,30,'Applied “Draft 1”'),(93,65,1,6,NULL),(94,66,1,2,NULL),(95,2,1,31,'Applied “Draft 1”'),(96,18,1,7,NULL),(97,216,1,1,NULL),(98,217,1,1,NULL),(99,2,1,32,'Applied “Draft 1”'),(100,18,1,8,NULL),(101,29,1,2,NULL),(102,2,1,33,'Applied “Draft 1”'),(103,18,1,9,NULL),(104,29,1,3,NULL),(105,2,1,34,'Applied “Draft 1”'),(106,18,1,10,NULL),(107,216,1,2,NULL),(108,2,1,35,''),(109,216,1,3,NULL),(110,217,1,2,NULL),(111,2,1,36,'Applied “Draft 1”'),(112,216,1,4,NULL),(113,217,1,3,NULL),(114,2,1,37,'Applied “Draft 1”'),(115,18,1,11,NULL),(116,2,1,38,'Applied “Draft 1”'),(117,18,1,12,NULL),(118,2,1,39,NULL),(119,258,1,1,''),(120,259,1,1,NULL),(121,260,1,1,NULL),(122,261,1,1,NULL),(123,258,1,2,'Applied “Draft 1”'),(124,272,1,1,NULL),(125,273,1,1,NULL),(126,274,1,1,NULL),(127,275,1,1,NULL),(128,276,1,1,NULL),(129,283,1,1,''),(130,287,1,1,NULL),(131,288,1,1,NULL),(132,289,1,1,NULL),(133,284,1,1,NULL),(134,285,1,1,NULL),(135,286,1,1,NULL),(136,283,1,2,''),(137,283,1,3,'Applied “Draft 1”'),(138,301,1,1,NULL),(139,302,1,1,NULL),(140,283,1,4,'Applied “Draft 1”'),(141,2,1,40,'Applied “Draft 1”'),(142,216,1,5,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_hjvdljvapqnmffcxfwcozdtreqhkjuqiduee` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' anthony pineworks co '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' acolangelo '),(2,'slug',0,1,' home '),(2,'title',0,1,' home '),(7,'field',3,1,' ambrosia is uniquely positioned to scale space manufacturing '),(7,'slug',0,1,' ambrosia is uniquely positioned to scale space manufacturing '),(7,'title',0,1,' ambrosia is uniquely positioned to scale space manufacturing '),(8,'field',1,1,' ambrosia space manufacturing company '),(8,'slug',0,1,''),(18,'field',1,1,' improving life on earth sustaining it off '),(18,'field',3,1,' ambrosia is biomanufacturing in space at scale enabling environmental control life support and in situ resource utilization system development and long duration missions '),(18,'slug',0,1,' space based biomanufacturing pharma research infrastructure '),(18,'title',0,1,' space based biomanufacturing pharma research infrastructure '),(21,'alt',0,1,''),(21,'extension',0,1,' svg '),(21,'filename',0,1,' payload locker svg '),(21,'kind',0,1,' image '),(21,'slug',0,1,''),(21,'title',0,1,' payload locker '),(22,'alt',0,1,''),(22,'extension',0,1,' svg '),(22,'filename',0,1,' payload rack svg '),(22,'kind',0,1,' image '),(22,'slug',0,1,''),(22,'title',0,1,' payload rack '),(29,'field',3,1,''),(29,'slug',0,1,''),(42,'slug',0,1,' temp qknwwamnznvijmbdpeeajzycrrcidxrtuiyw '),(42,'title',0,1,''),(43,'field',3,1,' ambrosia is lorem ipsum dolor sit ameting in space '),(43,'slug',0,1,' thing 1 '),(43,'title',0,1,' thing 1 '),(52,'field',3,1,' ambrosia is lorem ipsum dolor sit manufacturing '),(52,'slug',0,1,' thing 2 '),(52,'title',0,1,' thing 2 '),(59,'alt',0,1,''),(59,'extension',0,1,' jpg '),(59,'filename',0,1,' arnab jpg '),(59,'kind',0,1,' image '),(59,'slug',0,1,''),(59,'title',0,1,' arnab '),(60,'alt',0,1,''),(60,'extension',0,1,' jpg '),(60,'filename',0,1,' charlie jpg '),(60,'kind',0,1,' image '),(60,'slug',0,1,''),(60,'title',0,1,' charlie '),(61,'alt',0,1,''),(61,'extension',0,1,' jpg '),(61,'filename',0,1,' james jpg '),(61,'kind',0,1,' image '),(61,'slug',0,1,''),(61,'title',0,1,' james '),(62,'alt',0,1,''),(62,'extension',0,1,' jpg '),(62,'filename',0,1,' mario jpg '),(62,'kind',0,1,' image '),(62,'slug',0,1,''),(62,'title',0,1,' mario '),(63,'alt',0,1,''),(63,'extension',0,1,' jpg '),(63,'filename',0,1,' susan jpg '),(63,'kind',0,1,' image '),(63,'slug',0,1,''),(63,'title',0,1,' susan '),(64,'alt',0,1,''),(64,'extension',0,1,' jpg '),(64,'filename',0,1,' victoria jpg '),(64,'kind',0,1,' image '),(64,'slug',0,1,''),(64,'title',0,1,' victoria '),(65,'slug',0,1,' temp irqftohbjkwyceykmqyxinubdfyypoxazpgs '),(65,'title',0,1,''),(66,'field',1,1,' founder ceo '),(66,'field',3,1,' before founding ambrosia space mario developed life support systems for multiple spacecraft he worked as a product team lead for a n2 o2 pressure control system and regenerable c02 scrubber mario holds a masters degree in aerospace engineering with a focus on bioastronautics from the university of colorado boulder and a bachelors degree in aerospace engineering from the university of alabama '),(66,'slug',0,1,' mario maggio '),(66,'title',0,1,' mario maggio '),(76,'field',1,1,' program manager investor '),(76,'field',3,1,' susan worked at nasa for almost 30 years working on international space station iss first supporting integrating gps on iss and eventually being promoted to the iss guidance navigation and control gnc subystem manager for nasa she worked in the private sector for the past 5 years leading the intuitive machines avionics power and communication team for the im 1 lander and then managing the axiom space gnc system before investing in ambrosia space susan holds a bachelors degree in aerospace engineering from the university of texas at austin '),(76,'slug',0,1,' susan gomez '),(76,'title',0,1,' susan gomez '),(77,'field',1,1,' chief engineer '),(77,'field',3,1,' arnab roy has 12 years of aerospace engineering experience with a focus on design analysis manufacturing and integration his previous role was a principal manufacturing engineer at venus aerospace where he lead process development for advanced rocket engine technologies he began his career at bell helicopter after earning a b s in aerospace engineering from penn state university arnab gained broad expertise at intuitive machines contributing to lunar landers and uavs while completing his m s in engineering from purdue and an mba from indiana university he also serves as an adjunct professor at san jacinto college training future aerospace composite technicians '),(77,'slug',0,1,' arnab roy '),(77,'title',0,1,' arnab roy '),(78,'field',1,1,' avionics lead '),(78,'field',3,1,' charlie has worked with high reliability electronics for the last 20 years applications include subsea survey measurement while drilling and flight computer design at axiom station charlie also has experience as a small business owner consultant and educator for young inventors charlie studied electrical engineering at case western and holds a bachelors degree in economics with a math minor from the university of houston '),(78,'slug',0,1,' charlie larrabee '),(78,'title',0,1,' charlie larrabee '),(89,'alt',0,1,''),(89,'extension',0,1,' jpg '),(89,'filename',0,1,' fpo 01 jpg '),(89,'kind',0,1,' image '),(89,'slug',0,1,''),(89,'title',0,1,' fpo 01 '),(90,'slug',0,1,' temp dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs '),(90,'title',0,1,''),(91,'field',3,1,''),(91,'slug',0,1,''),(107,'field',1,1,''),(107,'slug',0,1,''),(130,'field',3,1,' jobs ambrosiaspace com '),(130,'slug',0,1,' jobs ambrosiaspace com '),(130,'title',0,1,' jobs ambrosiaspace com '),(131,'field',1,1,' we are looking for engineering talent '),(131,'slug',0,1,''),(132,'field',1,1,''),(132,'slug',0,1,''),(143,'field',3,1,' were making settling space possible '),(143,'slug',0,1,' ambrosia is uniquely positioned to scale space manufacturing '),(143,'title',0,1,' were making settling space possible '),(144,'field',1,1,' ambrosia space manufacturing company '),(144,'slug',0,1,''),(145,'field',1,1,''),(145,'slug',0,1,''),(163,'field',3,1,''),(163,'slug',0,1,' just a title '),(163,'title',0,1,' just a title and button '),(194,'field',3,1,' ambrosia is lorem ipsum dolor sit manufacturing '),(194,'slug',0,1,' thing 2 '),(194,'title',0,1,' thing 2 '),(216,'field',1,1,' biomanufacturing has been stuck in the dirt '),(216,'field',3,1,' designed for gravity with earth like operations that ensure scalability and meet terrestrial yields ambrosia is full process from cell cultivation to final product including bioreactors cell separation and integrated downstream purification all with fully remote operation monitored and controlled from the ground lowering crew requirements '),(216,'slug',0,1,' space based biomanufacturing pharma research infrastructure '),(216,'title',0,1,' were developing scalable in space infrastructure '),(217,'field',3,1,' fig 1 iss mid deck locker mdle our bioreactor fits into '),(217,'slug',0,1,''),(258,'field',3,1,' ambrosia space is building biomanufacturing technology in space to make better drugs today and settle mars tomorrow '),(258,'slug',0,1,' about '),(258,'title',0,1,' about us '),(259,'field',3,1,' were making settling space possible '),(259,'slug',0,1,' temp jfqmkmnvmckbbwdmppszzuocqtaohqjhnvho '),(259,'title',0,1,''),(260,'field',1,1,' ambrosia space manufacturing company '),(260,'slug',0,1,''),(261,'slug',0,1,''),(272,'slug',0,1,' temp irqftohbjkwyceykmqyxinubdfyypoxazpgs '),(272,'title',0,1,''),(273,'field',1,1,' founder ceo '),(273,'field',3,1,' before founding ambrosia space mario developed life support systems for multiple spacecraft he worked as a product team lead for a n2 o2 pressure control system and regenerable c02 scrubber mario holds a masters degree in aerospace engineering with a focus on bioastronautics from the university of colorado boulder and a bachelors degree in aerospace engineering from the university of alabama '),(273,'slug',0,1,' mario maggio '),(273,'title',0,1,' mario maggio '),(274,'field',1,1,' program manager investor '),(274,'field',3,1,' susan worked at nasa for almost 30 years working on international space station iss first supporting integrating gps on iss and eventually being promoted to the iss guidance navigation and control gnc subystem manager for nasa she worked in the private sector for the past 5 years leading the intuitive machines avionics power and communication team for the im 1 lander and then managing the axiom space gnc system before investing in ambrosia space susan holds a bachelors degree in aerospace engineering from the university of texas at austin '),(274,'slug',0,1,' susan gomez '),(274,'title',0,1,' susan gomez '),(275,'field',1,1,' chief engineer '),(275,'field',3,1,' arnab roy has 12 years of aerospace engineering experience with a focus on design analysis manufacturing and integration his previous role was a principal manufacturing engineer at venus aerospace where he lead process development for advanced rocket engine technologies he began his career at bell helicopter after earning a b s in aerospace engineering from penn state university arnab gained broad expertise at intuitive machines contributing to lunar landers and uavs while completing his m s in engineering from purdue and an mba from indiana university he also serves as an adjunct professor at san jacinto college training future aerospace composite technicians '),(275,'slug',0,1,' arnab roy '),(275,'title',0,1,' arnab roy '),(276,'field',1,1,' avionics lead '),(276,'field',3,1,' charlie has worked with high reliability electronics for the last 20 years applications include subsea survey measurement while drilling and flight computer design at axiom station charlie also has experience as a small business owner consultant and educator for young inventors charlie studied electrical engineering at case western and holds a bachelors degree in economics with a math minor from the university of houston '),(276,'slug',0,1,' charlie larrabee '),(276,'title',0,1,' charlie larrabee '),(283,'field',3,1,' were building the tech for space based pharma bio research and were looking for engineering talent '),(283,'slug',0,1,' careers '),(283,'title',0,1,' careers '),(284,'field',3,1,' jobs ambrosiaspace com '),(284,'slug',0,1,' jobs ambrosiaspace com '),(284,'title',0,1,''),(285,'field',1,1,' we are looking for engineering talent '),(285,'slug',0,1,''),(286,'field',1,1,''),(286,'slug',0,1,''),(287,'field',3,1,' were building the tech for space based pharma bio research '),(287,'slug',0,1,' temp vmjyyigektpcmwytxvsnpxswekqtqvuaeqza '),(287,'title',0,1,''),(288,'field',1,1,' ambrosia space manufacturing company '),(288,'slug',0,1,''),(289,'slug',0,1,''),(301,'slug',0,1,' temp dadnexhgdmdkfldhgtydzysuzhctlwbhwjbs '),(301,'title',0,1,''),(302,'field',3,1,''),(302,'slug',0,1,''),(308,'slug',0,1,''),(309,'slug',0,1,' temp xrytpadfuxtstflzyutbhtxtcwuresbtfuku '),(309,'title',0,1,''),(310,'slug',0,1,' temp aszribysrngpliwbxomkuhrllydafynenfpt '),(310,'title',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cchqqsqoefmyuawrsxirznfgvrbyyvncrgrt` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_ffqvbijjzlihhdyipexghcktyanxqnvicxml` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_uhadaevwyaxttjyvuqwopptwxefokaecmkfh` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_kmwtnucqxfrjfpitutotwlyepofyeqwuthdw` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ungkkjbnomryiajblidxqjaknqmstzlbdagw` (`handle`),
  KEY `idx_vwptnqromvnwfygczeehwfjvhujgzhbophfh` (`name`),
  KEY `idx_ocvfrpmkggxbxrrttwqweuuqviivgyvdqnnu` (`structureId`),
  KEY `idx_yriwpljrskaqmmnefcigqtxojtrphpqurqfe` (`dateDeleted`),
  CONSTRAINT `fk_gwntwsppjxriaqymngbcgevzmjjpnxkecjcw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,NULL,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-10-16 02:49:47','2025-10-27 19:49:05',NULL,'72c3451a-3b3b-46c5-ac75-dfcefb6fa165'),(2,1,'Pages','pages','structure',1,NULL,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-10-27 19:48:52','2025-10-27 19:48:59',NULL,'6fdfbe08-3bed-49e1-806c-1ae77457186d');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_ecgqcnfupbkskfmnwxmbmlzvhywkxflriuze` (`typeId`),
  CONSTRAINT `fk_ecgqcnfupbkskfmnwxmbmlzvhywkxflriuze` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yvshikrmuiobrztzqvykrctuxbjyvrxiqxew` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL,NULL),(2,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vbikouyeophauqivmcqpfnfoteoujjmwxrdx` (`sectionId`,`siteId`),
  KEY `idx_tuwilxqipgjauttifqzcspiasavkqcmlwzxj` (`siteId`),
  CONSTRAINT `fk_cirqutchsputgmqflpzqmmjntayxgepnyrpo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jmpemxelgftqcfufrlbjggopiommnrnraxrb` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__',NULL,1,'2025-10-16 02:49:47','2025-10-27 03:08:50','63799abb-fc79-42d4-ae2f-4143ecd45d45'),(2,2,1,1,'{parent.uri}/{slug}','entry.twig',1,'2025-10-27 19:48:52','2025-10-27 19:48:52','d91c81bc-a2a5-465c-b18c-79e7d9035c01');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qbufqvlxoctxyztfjggmqohntjxzlxsruxzi` (`uid`),
  KEY `idx_sxlscvkirkweupnserccjjvpmjubvsvyfygm` (`token`),
  KEY `idx_bhiipgbfgscypkbjjzphlmffoforeiyeeoxh` (`dateUpdated`),
  KEY `idx_ujazgnegaraipgxmrchsfdnevikgroqyvumv` (`userId`),
  CONSTRAINT `fk_hprdfhjzscqepeacpqzmvqkcepcudhtlqdeh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (3,1,'urDulPL5fLUREVRCseuJoqah5azQg0OGZ2pqfzK1iajU7b5gC0JatdycdLDOuy-0YfN3bkZ_jQHMOiLW966YFO4f1K5Pw-3GZoxr','2025-10-25 12:23:35','2025-10-27 20:20:12','53fcd02b-f306-4d46-8284-f329af684a59');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wzytomheowkehaangsemxjxoobtgdvmnfnby` (`userId`,`message`),
  CONSTRAINT `fk_qpknpndmfkerxlhbtgxuujzqdrqgwsctacgl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pbsqylpjtyypklwuxuoewlhixivhijyrfqha` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Ambrosia','2025-10-16 02:13:05','2025-10-16 02:17:05',NULL,'45a00e92-2550-47ce-b789-33064e5da296');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xtfurcmjqltabdigegzxdvhiorqubdfmlbzw` (`dateDeleted`),
  KEY `idx_dejgqxutnobaearcppotkjysunssmdmvmqsc` (`handle`),
  KEY `idx_fddvpiqchxeuvkepndevxpwfsahnsyicdojf` (`sortOrder`),
  KEY `fk_gbynvtzxdjyzxzzooqnbropqflovgxcwtihf` (`groupId`),
  CONSTRAINT `fk_gbynvtzxdjyzxzzooqnbropqflovgxcwtihf` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'1','Ambrosia Space Manufacturing Company','default','en-US',1,'$PRIMARY_SITE_URL',1,'2025-10-16 02:13:05','2025-10-27 14:49:19',NULL,'88a82adb-74b9-4d14-b4bf-8e9a26d20d3e');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_lowngigyuzdubnworypnkwbstyrezbyfzsbq` (`userId`),
  CONSTRAINT `fk_lowngigyuzdubnworypnkwbstyrezbyfzsbq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ukdvqfqqpwpasodypsscfoajysxetcskrlto` (`structureId`,`elementId`),
  KEY `idx_xyczxwucjcbgandjzurycxkjlrtaprxtdnlu` (`root`),
  KEY `idx_sralkkpempnexzymxufmykxqbpdpkombeewg` (`lft`),
  KEY `idx_newzzusktcioqtwebkixrqffegdnjjeeodbc` (`rgt`),
  KEY `idx_vncrcmgkvaqgxjgzcpgrhzamgneauhihbdnb` (`level`),
  KEY `idx_lmotzaggtunwkndcopjmnwzeqpgxssmdmqno` (`elementId`),
  CONSTRAINT `fk_oeckfkuxtlwfjvjzgrwtskkpkpbekierktrj` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,6,0,'2025-10-27 19:49:15','2025-10-27 19:52:11','c73173e8-c232-476b-942a-afe1cc5d1222'),(2,1,258,1,2,3,1,'2025-10-27 19:49:15','2025-10-27 19:49:15','4667ed65-0f28-48cd-b9eb-4ca97c901d5a'),(3,1,283,1,4,5,1,'2025-10-27 19:52:11','2025-10-27 19:52:11','f996f232-c005-46a6-b1df-e88aeb194341');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_otmgaictswduisomejhokoexkgjkkmyryssa` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES (1,NULL,'2025-10-27 19:48:52','2025-10-27 19:48:52',NULL,'319c5702-5955-4029-91cf-bc0bfdec239f');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_evntcvswoysbgjwnyyrbbmdryoyztgiogqfo` (`key`,`language`),
  KEY `idx_izrnksmxzbbhlbrspraevfqovqhfuzudxfep` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lxvjekgttkjflqtsfcxmivnjkkcqbzcnybaf` (`name`),
  KEY `idx_ovkfumdtgonqxchkkcjvkkastltsnjuqhwli` (`handle`),
  KEY `idx_ktowrwrzxyovqrmemccqctfgvumfplnkvuiz` (`dateDeleted`),
  KEY `fk_mzuqwhwncmllklxsguybdsjshxgtnqtqhukp` (`fieldLayoutId`),
  CONSTRAINT `fk_mzuqwhwncmllklxsguybdsjshxgtnqtqhukp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ufdoltnrizevmwcvhyutmrixdztlrhoyhike` (`groupId`),
  CONSTRAINT `fk_fguvvnpbmwtppxenvpnisoshgzwddatjszpw` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xqsdprvfethysqndicybjbxrteltbwkpqwgv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_djepdtljsjmgqahpcskajlhxyyauxiydbdlk` (`token`),
  KEY `idx_fslckbqsfetiipbnxapilgtrtidkikwhfsaz` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gfcqfotlleonkbqliveotpudobpilhzhxjqq` (`handle`),
  KEY `idx_nvycfkbnxdernrjdurrqejzciqhvwcerhqgb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_slaqqeohjnycagepqfmclzyrkhggjvxmvluq` (`groupId`,`userId`),
  KEY `idx_yasxyedgiaqebncntekmxnzcrjjhmkutcilo` (`userId`),
  CONSTRAINT `fk_cvhjogfcabyhklencvltkqyjbtgmrzsvqouf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jfzgwsvthptlsoyefnnucchottbwbnrwvugc` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_csxzknhrbxmyiolnzibirtwtabrswtlxieiz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_frjmnjauhbjuxuciuwkqfcqthbcxtvpaigje` (`permissionId`,`groupId`),
  KEY `idx_wqcodipiqlzfbywghagwypcotkqzxxfwcaqc` (`groupId`),
  CONSTRAINT `fk_injoeegalifpbgbfolliajodfarougfzbdvv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kaouzfcuaxpjiritguawftfuxpnqzohvnift` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nvorphrixoyxxerdyfgxzvtjssxkshnxcaog` (`permissionId`,`userId`),
  KEY `idx_bteqfsfoqkjguebefktvandavnsgdhqisqku` (`userId`),
  CONSTRAINT `fk_modrqmzcelcscabkefilkbyvpvnzcbnxdsbf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_owgqxfzvosmuooigmmlwxdycrcwsmknscvzm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_xpzxxdsgtngonlrmhljbksgdkrvsoygxmjxp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gffwiknkttbnbxpgagoxsdpyezfpknpodewj` (`active`),
  KEY `idx_fgflnfhweqcpiiyrzxjpongwxdmldcsoklwb` (`locked`),
  KEY `idx_orfrtrawvettosqjagucxlzsecuendjwndix` (`pending`),
  KEY `idx_hncnymviszislmrykebevvkvzvimusamjmyb` (`suspended`),
  KEY `idx_sneovhoofevtnkfuhcynkbuwlerxinlauimd` (`verificationCode`),
  KEY `idx_exlsyxcoyxpmiirsvizlbtlewdhvwdavrdjq` (`email`),
  KEY `idx_euwsvhxnyxteqabfnukyrnhfosvbbxllfdsi` (`username`),
  KEY `fk_xbyhjoaibtjlyjinfhfndvhkjmcawumndqrz` (`photoId`),
  KEY `fk_tkheyvyzlpillqvcwnbrrkyjvdxoymwtacst` (`affiliatedSiteId`),
  CONSTRAINT `fk_jeqvzfmdqhcjbtulnflnuuyysonlhkejexoo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tkheyvyzlpillqvcwnbrrkyjvdxoymwtacst` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xbyhjoaibtjlyjinfhfndvhkjmcawumndqrz` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'acolangelo',NULL,NULL,NULL,'anthony@pineworks.co','$2y$13$3/418VhZIu4HxMvcHc6vA.ZuGeNf0s.Cp6Nc2y3xNkGKYGpd41Scu','2025-10-25 12:23:35',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-10-16 02:13:05','2025-10-16 02:13:05','2025-10-25 12:23:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cquxfuqqgepxwwsunecjkfddokyvcinfkhkc` (`name`,`parentId`,`volumeId`),
  KEY `idx_ciqkstfvuoukwaluwglpsxonviihzilfqked` (`parentId`),
  KEY `idx_nhsgeauhiewecumzyoptdcxctokzkptkqhtk` (`volumeId`),
  CONSTRAINT `fk_eduztyiqgwhwxmlysnyzaaacwhnafhkkycay` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pwlctxkhgpyskhzwwyfvvqgmboujeszsqhbj` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2025-10-16 02:35:21','2025-10-16 02:35:21','a17cfd7e-9273-4226-ac84-3b2e03e27773'),(2,NULL,NULL,'Temporary Uploads',NULL,'2025-10-16 02:36:51','2025-10-16 02:36:51','4bc989fb-27c2-4123-9d96-fbb54a65c1c6'),(4,2,NULL,'user_1','user_1/','2025-10-27 15:02:06','2025-10-27 15:02:06','76e059a2-1e55-4e47-850b-c67c33ec0e43');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xovumfaxvlmcsgftgelheuchhkjkexjmbyoe` (`name`),
  KEY `idx_jpcproxtunxkeugkwltuakdueehgrkkdidbu` (`handle`),
  KEY `idx_egvioijzcqwmcfnjelktajmpesimbunanvfe` (`fieldLayoutId`),
  KEY `idx_rwtpexndwydnyxroeqsqtuhbwnvlsewssndp` (`dateDeleted`),
  CONSTRAINT `fk_altlxzwpplfujmisokwofoexmsnlncoretml` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,1,'Images','images','images','','','','site',NULL,'none',NULL,1,'2025-10-16 02:35:21','2025-10-16 02:35:21',NULL,'e2b96770-e496-40d4-9d40-ef0d10c51ffa');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ltsfnrfyaqufmlsjcucvmkmruentvswinlxo` (`userId`),
  CONSTRAINT `fk_ltsfnrfyaqufmlsjcucvmkmruentvswinlxo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_exxbcewasyefvflcmwmzitqcikattstazenc` (`userId`),
  CONSTRAINT `fk_rycregzksjgdhxltarkimthleqdmdstskjaf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-10-16 02:13:06','2025-10-16 02:13:06','3454dfe6-41af-4fa1-9c65-ee21f9f28f6c'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-10-16 02:13:06','2025-10-16 02:13:06','f5578aaf-af62-4001-bad5-266a5b4e9f24'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-10-16 02:13:06','2025-10-16 02:13:06','3ac67a33-cad3-47cb-915b-8e7b44b295b5'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-10-16 02:13:06','2025-10-16 02:13:06','213de4f7-1edb-4310-abd1-7b7b22404ab3');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-27 16:21:11
