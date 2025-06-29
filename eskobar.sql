-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: tb-nl01-linweb638.srv.teamblue-ops.net:3306
-- Gegenereerd op: 28 jun 2025 om 13:11
-- Serverversie: 8.0.36-28
-- PHP-versie: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eskobb_craft`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `addresses`
--

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
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `announcements`
--

CREATE TABLE `announcements` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int NOT NULL,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assetindexingsessions`
--

CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assets`
--

CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `size` bigint UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assets_sites`
--

CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `authenticator`
--

CREATE TABLE `authenticator` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bulkopevents`
--

CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int NOT NULL,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(20, 1, 'title', '2025-03-22 13:16:47', 0, 1),
(21, 1, 'title', '2025-03-22 13:16:47', 0, 1),
(22, 1, 'title', '2025-03-22 13:16:47', 0, 1),
(23, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(24, 1, 'title', '2025-03-22 13:16:47', 0, 1),
(29, 1, 'title', '2025-03-22 13:16:47', 0, 1),
(37, 1, 'title', '2025-03-22 13:16:47', 0, 1),
(38, 1, 'title', '2025-03-22 13:16:47', 0, 1),
(39, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(40, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(41, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(51, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(52, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(54, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(217, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(218, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(219, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(222, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(223, 1, 'title', '2025-03-22 13:16:48', 0, 1),
(224, 1, 'title', '2025-03-22 13:16:48', 0, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `drafts`
--

CREATE TABLE `drafts` (
  `id` int NOT NULL,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elementactivity`
--

CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements`
--

CREATE TABLE `elements` (
  `id` int NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `deletedWithOwner`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2025-02-22 10:22:11', '2025-02-22 10:22:11', NULL, NULL, NULL, 'e5578826-05e3-4212-9193-d2f0379c47b8'),
(2, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2025-02-22 10:33:50', '2025-04-01 17:08:31', NULL, NULL, NULL, '65e5a379-a6ef-4d87-a4f0-09feb95a27d7'),
(3, 2, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2025-02-22 10:33:50', '2025-02-22 10:33:50', NULL, NULL, NULL, '777a1629-bd25-4e7f-8381-ee7145400f97'),
(14, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-04-01 17:07:49', NULL, NULL, NULL, 'e87e34cc-5cc8-4e0a-9b68-49a6d00008bd'),
(15, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-02-23 10:24:41', NULL, '2025-02-23 10:24:41', NULL, 'abba5fac-5aa7-46c8-b7d9-33458639210d'),
(16, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-02-23 10:24:41', NULL, '2025-02-23 10:24:41', NULL, 'c0f6957b-ad68-4905-980c-ac4cad10011c'),
(17, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-02-23 10:24:41', NULL, '2025-02-23 10:24:41', NULL, '80625b2f-5abe-4739-9914-cc33e3133031'),
(18, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-02-23 10:24:41', NULL, '2025-02-23 10:24:41', NULL, '6ce218a5-3792-4afc-8148-a01043782979'),
(19, 2, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-02-23 10:15:23', NULL, NULL, NULL, '36b0004e-35ed-4d7c-90bd-1efd2a895e6d'),
(20, 14, NULL, 3, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-03-22 13:16:47', NULL, NULL, NULL, '73bcf36f-9916-4155-9eed-1c0225fc42d7'),
(21, 15, NULL, 4, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-03-22 13:16:47', NULL, NULL, NULL, '2d4d5618-9299-45f0-8cb1-e150fc80ee3c'),
(22, 16, NULL, 5, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-03-22 13:16:47', NULL, NULL, NULL, 'f2c7791e-705d-4afd-bcf1-0d6860dbae93'),
(23, 17, NULL, 6, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-03-22 13:16:48', NULL, NULL, NULL, '91c82857-6c81-453b-8fcf-3ac73eb9cdb3'),
(24, 18, NULL, 7, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:15:23', '2025-03-22 13:16:47', NULL, NULL, NULL, '993af1e2-8419-429a-b61e-cfc3989d44ff'),
(27, NULL, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:16:50', '2025-04-01 16:05:35', NULL, NULL, NULL, 'caa8bdb0-3742-4d88-8d35-9e856552ab35'),
(28, 2, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:16:50', '2025-02-23 10:16:50', NULL, NULL, NULL, '35051eac-821a-48d2-a396-68359949b4c7'),
(29, 27, NULL, 9, 3, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:16:50', '2025-03-22 13:16:47', NULL, NULL, NULL, '448f3199-7e36-43fb-8a1d-938d2832e9f5'),
(36, 2, NULL, 10, 1, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:22:22', '2025-02-23 10:22:22', NULL, NULL, NULL, 'd1755782-397d-402d-9281-b7fd00c0cc8f'),
(37, 14, NULL, 11, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:22:22', '2025-03-22 13:16:47', NULL, NULL, NULL, '4b9b6801-3037-4c09-abed-9f7024d1d1ab'),
(38, 15, NULL, 12, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:22:22', '2025-03-22 13:16:47', NULL, NULL, NULL, 'df044e7a-98d3-459e-b995-f6667a25efd4'),
(39, 16, NULL, 13, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:22:22', '2025-03-22 13:16:47', NULL, NULL, NULL, 'd9bf4566-04fc-4fcf-a1a1-6a131c8d9f48'),
(40, 18, NULL, 14, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:22:22', '2025-03-22 13:16:48', NULL, NULL, NULL, 'd3f06519-ebc4-4362-a60c-51e4553e95c7'),
(41, 27, NULL, 15, 3, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:22:22', '2025-03-22 13:16:48', NULL, NULL, NULL, '258c7c64-5371-468b-b344-74efa964b47b'),
(49, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:24:41', '2025-04-01 16:05:45', NULL, NULL, NULL, '9a6f243e-a969-4cb1-a182-932bce14634f'),
(50, 2, NULL, 16, 1, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:24:41', '2025-02-23 10:24:41', NULL, NULL, NULL, '99627be0-91ce-437f-b71c-c91a949f1b67'),
(51, 14, NULL, 17, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:24:41', '2025-03-22 13:16:48', NULL, NULL, NULL, 'b7494850-3c63-43a6-abaa-6336f50a9147'),
(52, 49, NULL, 18, 2, 'craft\\elements\\Entry', 1, 0, '2025-02-23 10:24:41', '2025-03-22 13:16:48', NULL, NULL, NULL, 'ef43193c-becd-4375-b479-5d92b3eaecd8'),
(53, 2, NULL, 19, 1, 'craft\\elements\\Entry', 1, 0, '2025-02-28 17:58:58', '2025-02-28 17:58:58', NULL, NULL, NULL, '0a300150-fdb2-4c14-ab49-4e4cc7de2a1d'),
(54, 27, NULL, 20, 3, 'craft\\elements\\Entry', 1, 0, '2025-02-28 17:58:58', '2025-03-22 13:16:48', NULL, NULL, NULL, 'dc5864a9-dcdd-4c0e-b57d-53a76732eff2'),
(55, NULL, NULL, NULL, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 18:02:08', '2025-04-01 16:06:05', NULL, NULL, NULL, 'fccb47d4-9e1a-41b5-a847-db3acec66880'),
(56, 55, NULL, 21, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 18:02:08', '2025-02-28 18:02:08', NULL, NULL, NULL, '2307f0bf-545c-432d-aeef-55a484601908'),
(58, 55, NULL, 22, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 18:05:30', '2025-02-28 18:05:30', NULL, NULL, NULL, 'c359cc9d-a523-44fa-99be-c255c1dd52e3'),
(59, 55, NULL, 23, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 18:18:04', '2025-02-28 18:18:04', NULL, NULL, NULL, '2913ff2b-4ab0-4907-b240-65fc0798650f'),
(61, 55, NULL, 24, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 18:21:13', '2025-02-28 18:21:13', NULL, NULL, NULL, 'aec87323-4f4d-4c96-b67e-d44c1947519e'),
(63, 55, NULL, 25, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 18:25:14', '2025-02-28 18:25:14', NULL, NULL, NULL, '4b948441-8c21-4a2e-889b-cb2e43b44c74'),
(65, 55, NULL, 26, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 18:46:02', '2025-02-28 18:46:02', NULL, NULL, NULL, 'ead587d7-e8aa-40f9-b7af-354e4d1dd7cb'),
(67, 55, NULL, 27, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 18:47:59', '2025-02-28 18:47:59', NULL, NULL, NULL, '9f77042f-023c-402d-b960-1c245dfa8cc3'),
(69, 55, NULL, 28, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 19:35:24', '2025-02-28 19:35:24', NULL, NULL, NULL, 'ae1e6367-9f53-4879-8aa1-7995a5a8989f'),
(70, 55, NULL, 29, 5, 'craft\\elements\\Entry', 1, 0, '2025-02-28 19:38:00', '2025-02-28 19:38:00', NULL, NULL, NULL, 'b1a9772e-f7fb-4998-b69a-41562cfc5b10'),
(71, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:32:01', '2025-03-26 19:30:59', NULL, NULL, NULL, '6684ec70-8f90-44c2-8542-2b08c63a4efd'),
(72, 71, NULL, 30, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:32:01', '2025-03-02 17:32:01', NULL, NULL, NULL, '6a5e1aa6-b118-4404-902b-d6cd8faa0299'),
(77, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:33:51', '2025-03-02 17:44:01', NULL, '2025-03-02 17:44:01', NULL, 'd71a4608-5582-4c4a-a520-7f33af147697'),
(79, 71, NULL, 31, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:33:51', '2025-03-02 17:33:51', NULL, NULL, NULL, 'ddb1a62a-c6fa-43f8-9516-5520793a58aa'),
(80, 77, NULL, 32, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:33:51', '2025-03-02 18:02:32', NULL, NULL, NULL, '53e6882d-f520-443c-a9a7-ba72bf98385f'),
(91, 71, NULL, 34, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:35:59', '2025-03-02 17:35:59', NULL, NULL, NULL, '7348f77e-2b9c-4ed2-96de-43bd27babfa0'),
(96, 71, NULL, 39, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:37:26', '2025-03-02 17:37:26', NULL, NULL, NULL, 'c6cfd766-f2ed-48bd-b1df-81aa67a08125'),
(99, 71, NULL, 40, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:37:56', '2025-03-02 17:37:56', NULL, NULL, NULL, '0366669c-2254-4117-973f-b9a4a9421fd7'),
(100, 71, NULL, 41, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:38:12', '2025-03-02 17:38:12', NULL, NULL, NULL, '92af9213-f3ed-440d-8bb3-20586961e525'),
(102, 71, NULL, 42, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:44:01', '2025-03-02 17:44:01', NULL, NULL, NULL, '62994c8a-97fe-4239-a776-ce5d0faa6f56'),
(106, 71, NULL, 43, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:46:42', '2025-03-02 17:46:42', NULL, NULL, NULL, 'bcd1a74d-ee53-4629-8f62-2baf53e31329'),
(108, 71, NULL, 44, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:48:33', '2025-03-02 17:48:33', NULL, NULL, NULL, '594f3706-b7d3-4d38-8eea-25221c07844e'),
(111, 71, NULL, 45, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:48:48', '2025-03-02 17:48:48', NULL, NULL, NULL, '62343142-13e3-4285-b67c-2b1ed3d632cf'),
(112, 71, NULL, 46, 8, 'craft\\elements\\Entry', 1, 0, '2025-03-02 17:49:02', '2025-03-02 17:49:02', NULL, NULL, NULL, 'd97970cc-8afe-4473-bb49-cf09c211808e'),
(113, 71, NULL, 47, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:01:15', '2025-03-02 18:01:15', NULL, NULL, NULL, '34bc3800-b3c4-47c7-9f46-8339de73b208'),
(115, 71, NULL, 48, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:03:25', '2025-03-02 18:03:25', NULL, NULL, NULL, 'c8e855d4-7d03-47ef-9cbd-9dea0fdbac0b'),
(119, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:06:38', '2025-03-06 18:48:19', NULL, NULL, NULL, '1aa3ae62-7dd7-4db8-b240-5c5dfcb091ec'),
(120, 119, NULL, 50, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:06:43', '2025-03-02 18:06:43', NULL, NULL, NULL, '5c88c47e-1814-4afd-aca4-6eb5949df715'),
(121, 119, NULL, 51, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:06:45', '2025-03-02 18:06:45', NULL, NULL, NULL, '2d9f3487-7b62-4dae-bbb6-db0d2cae63c5'),
(122, 71, NULL, 52, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:07:15', '2025-03-02 18:07:15', NULL, NULL, NULL, '5749e03d-9876-40f8-b810-e834c8d4d3ca'),
(123, 119, NULL, 53, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:07:27', '2025-03-02 18:07:27', NULL, NULL, NULL, '1b63cc47-3606-4cfd-91e6-cd2b901e84fb'),
(124, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:08:22', '2025-03-26 19:00:07', NULL, NULL, NULL, '407e55bf-9e4b-4c4d-8d25-54a18877738f'),
(125, 124, NULL, 54, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:08:32', '2025-03-02 18:08:32', NULL, NULL, NULL, '17d3b2bc-1fcf-40ed-803c-4b8d6cfc2470'),
(126, 124, NULL, 55, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:08:35', '2025-03-02 18:08:35', NULL, NULL, NULL, '858d1e5b-075b-49d5-b46a-0b166baf4c06'),
(127, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:08:41', '2025-03-26 19:00:31', NULL, NULL, NULL, '15f57f0d-5819-4ea1-a660-e5431b5b1557'),
(128, 127, NULL, 56, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:08:55', '2025-03-02 18:08:55', NULL, NULL, NULL, 'd783356c-0e7f-4d8e-a4cf-1613743e89f8'),
(129, 127, NULL, 57, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:08:57', '2025-03-02 18:08:57', NULL, NULL, NULL, '46a55860-ee25-4ca0-a2f4-dfe01b05efda'),
(130, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:09:03', '2025-03-26 19:30:09', NULL, NULL, NULL, '035ab925-2354-4dd6-bc2d-079473aaf3d2'),
(131, 130, NULL, 58, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:09:17', '2025-03-02 18:09:17', NULL, NULL, NULL, 'a4ae2e85-eafb-4f6f-b9f0-eb9d141df4b0'),
(132, 130, NULL, 59, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:09:20', '2025-03-02 18:09:20', NULL, NULL, NULL, '68e679a9-38a8-48dc-bdf9-4d67fd80070d'),
(133, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:09:52', '2025-03-26 19:03:11', NULL, NULL, NULL, '90ada7bc-cf5b-4f83-8598-933f7c6255b7'),
(134, 133, NULL, 60, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:10:01', '2025-03-02 18:10:01', NULL, NULL, NULL, '4e0dceca-45d8-4a04-aaa8-39fb0671ee29'),
(135, 133, NULL, 61, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:10:03', '2025-03-02 18:10:03', NULL, NULL, NULL, 'd114d575-db1c-4eb3-b068-00b322d0e780'),
(136, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:10:08', '2025-03-26 19:31:13', NULL, NULL, NULL, '9d175a40-e580-4058-86be-4f5459f7aa66'),
(137, 136, NULL, 62, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:10:21', '2025-03-02 18:10:21', NULL, NULL, NULL, '2b485590-2958-4836-99ae-23d74208d68e'),
(138, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:10:28', '2025-03-02 18:10:43', NULL, NULL, NULL, '425563ff-a108-4d27-a0ea-bcc866ffc04f'),
(139, 138, NULL, 63, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:10:43', '2025-03-02 18:10:43', NULL, NULL, NULL, '414fcace-a702-4ce0-9689-31e5fbf12518'),
(140, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:10:51', '2025-03-26 19:15:15', NULL, NULL, NULL, '147f1f69-e8d9-45cd-980e-0dd670a73e56'),
(141, 140, NULL, 64, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:11:08', '2025-03-02 18:11:08', NULL, NULL, NULL, '47bbb2e7-7e97-42a1-aec1-c2b3082b10d5'),
(142, 140, NULL, 65, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:11:10', '2025-03-02 18:11:10', NULL, NULL, NULL, '1aa44ebd-990e-4798-8295-c47e8040f72b'),
(143, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:11:13', '2025-03-26 19:40:58', NULL, NULL, NULL, 'e4ed363a-46d0-4514-9b38-b19427b36110'),
(144, 143, NULL, 66, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:11:28', '2025-03-02 18:11:28', NULL, NULL, NULL, '01401745-e098-457b-bfca-e2b5b1c74eb5'),
(146, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:11:40', '2025-03-26 19:15:28', NULL, NULL, NULL, 'bb6e7429-f71a-41ad-9c77-1eef87875272'),
(147, 146, NULL, 67, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:11:45', '2025-03-02 18:11:45', NULL, NULL, NULL, '4eeebdf3-692d-4749-90ca-81a7a513b4e2'),
(149, 146, NULL, 68, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:11:55', '2025-03-02 18:11:55', NULL, NULL, NULL, '413ddd87-d456-4803-b0fc-e56cb9726c2b'),
(151, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:12:33', '2025-03-26 19:41:04', NULL, NULL, NULL, '548645bc-f0e3-4b48-9b8d-76026922e70a'),
(152, 151, NULL, 69, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:12:44', '2025-03-02 18:12:44', NULL, NULL, NULL, '1fe20e4c-42c2-4b30-ad03-1f74d6075dc4'),
(153, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:12:58', '2025-03-26 19:15:47', NULL, NULL, NULL, '0e9681e7-50e5-4d35-a2ba-9e907f229569'),
(154, 153, NULL, 70, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:13:16', '2025-03-02 18:13:16', NULL, NULL, NULL, 'c4c06484-bed8-42f2-9caf-637feb758531'),
(155, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:13:28', '2025-03-06 18:50:54', NULL, NULL, NULL, '5235d822-ccf9-4801-af6d-3184a5d6a5da'),
(156, 155, NULL, 71, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:13:34', '2025-03-02 18:13:34', NULL, NULL, NULL, 'a9c10ad1-27ea-442e-8afd-7c8cfe3969bd'),
(157, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:13:46', '2025-03-26 19:32:33', NULL, NULL, NULL, '808c8138-9942-4677-8686-d715d91b5d6f'),
(158, 157, NULL, 72, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:14:04', '2025-03-02 18:14:04', NULL, NULL, NULL, '24dfa10b-13ae-4f53-aaa7-aabb8bdc8f09'),
(159, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:14:16', '2025-03-26 19:20:21', NULL, NULL, NULL, 'c24bad5f-c745-418b-bba4-43c153d01d96'),
(160, 159, NULL, 73, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:14:24', '2025-03-02 18:14:24', NULL, NULL, NULL, '5f99c449-dba8-4568-9ca3-1cd6557649ef'),
(161, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:19:05', '2025-03-26 19:41:22', NULL, NULL, NULL, '7b4a8a27-95a6-496c-aeab-623236ab1cc6'),
(162, 161, NULL, 74, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:20:28', '2025-03-02 18:20:28', NULL, NULL, NULL, 'f6e088cc-67fb-4ad1-bb9a-1c99318d5e56'),
(163, 161, NULL, 75, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:21:55', '2025-03-02 18:21:55', NULL, NULL, NULL, 'f116ba14-28e4-49b1-88a4-0064018ea915'),
(165, 161, NULL, 76, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:21:59', '2025-03-02 18:21:59', NULL, NULL, NULL, 'f765822d-6579-46b3-b6d7-830679beda88'),
(167, 157, NULL, 77, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:22:25', '2025-03-02 18:22:25', NULL, NULL, NULL, '14edadff-7c1e-4cd9-b467-84f2e1f5e701'),
(168, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:22:37', '2025-03-02 18:22:40', NULL, NULL, NULL, '92990267-8971-491c-9db4-599669b43297'),
(169, 168, NULL, 78, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:22:40', '2025-03-02 18:22:40', NULL, NULL, NULL, '8bcaab32-f80f-4283-a054-1829340ae5fb'),
(170, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:22:48', '2025-03-26 19:25:09', NULL, NULL, NULL, '3a02aa49-e669-4f8f-a2cc-3555214c85fb'),
(171, 170, NULL, 79, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-02 18:23:04', '2025-03-02 18:23:04', NULL, NULL, NULL, '4e49b51b-b635-4e10-a12f-b0528163ee2a'),
(173, 119, NULL, 80, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:46:48', '2025-03-06 18:46:48', NULL, NULL, NULL, 'd09247ef-33f4-448b-ab87-87fc02344519'),
(175, 119, NULL, 81, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:48:19', '2025-03-06 18:48:19', NULL, NULL, NULL, '666bf3ce-595c-4fda-8077-5521fc63eff3'),
(177, 71, NULL, 82, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:48:40', '2025-03-06 18:48:40', NULL, NULL, NULL, '39bb6821-7187-4d54-960a-c15b4d678123'),
(179, 71, NULL, 83, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:48:51', '2025-03-06 18:48:51', NULL, NULL, NULL, 'ae6eef9f-1b36-449d-9ae2-a54a4a3ca168'),
(181, 71, NULL, 84, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:49:04', '2025-03-06 18:49:04', NULL, NULL, NULL, '24f03d46-6fd5-496b-b251-3ae077fc04b0'),
(183, 71, NULL, 85, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:49:22', '2025-03-06 18:49:22', NULL, NULL, NULL, '13d2e91c-01cd-470a-8412-fc0d1a09255f'),
(185, 71, NULL, 86, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:49:41', '2025-03-06 18:49:41', NULL, NULL, NULL, '907c5fc1-ba67-4529-985d-9af421095b30'),
(187, 155, NULL, 87, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:50:38', '2025-03-06 18:50:38', NULL, NULL, NULL, '4d41f85e-1f65-457a-932f-a618d77ef9f4'),
(188, 155, NULL, 88, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:50:54', '2025-03-06 18:50:54', NULL, NULL, NULL, '5d4ae5b0-2a96-4dc5-b893-45bac8fc8e76'),
(189, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:51:08', '2025-03-06 18:51:17', NULL, NULL, NULL, '6ed9512c-98bf-4664-84bf-3beedee6a418'),
(190, 189, NULL, 89, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:51:17', '2025-03-06 18:51:17', NULL, NULL, NULL, 'd6544583-ce8b-4841-a148-6b0ab7a99114'),
(192, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:51:56', '2025-03-26 19:24:05', NULL, NULL, NULL, '19a0d70d-74df-44bb-b2b5-21563083a1ff'),
(193, 192, NULL, 90, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:51:57', '2025-03-06 18:51:57', NULL, NULL, NULL, '285973f2-e954-45c8-b1a8-9279fcd6bab3'),
(195, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:52:22', '2025-03-26 19:24:19', NULL, NULL, NULL, '80c4d545-379c-4651-aaaa-c00d0b1804ea'),
(196, 195, NULL, 91, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:52:24', '2025-03-06 18:52:24', NULL, NULL, NULL, '2a588526-d9d2-4ed3-b134-b33624eea9f3'),
(198, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:52:39', '2025-03-26 19:24:34', NULL, NULL, NULL, '342b293c-abae-4741-b3ae-0d6966d3d451'),
(199, 198, NULL, 92, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-06 18:52:40', '2025-03-06 18:52:40', NULL, NULL, NULL, '061c5c2e-38c9-40d2-8d21-633cdae0a9f7'),
(200, 157, NULL, 93, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-10 18:55:46', '2025-03-10 18:55:46', NULL, NULL, NULL, '7555b2c7-064b-48ce-9326-7741c7c61fcf'),
(202, 153, NULL, 94, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-10 19:25:42', '2025-03-10 19:25:42', NULL, NULL, NULL, '976bf990-fb38-4da0-aef0-0277d553b287'),
(206, NULL, NULL, NULL, 10, 'craft\\elements\\Entry', 0, 0, '2025-03-20 19:24:57', '2025-03-26 19:34:57', NULL, NULL, NULL, '8c8858e3-30cc-4892-91a7-fba137984e3c'),
(207, 55, NULL, 95, 5, 'craft\\elements\\Entry', 1, 0, '2025-03-20 19:24:57', '2025-03-20 19:24:57', NULL, NULL, NULL, '381c1345-3204-40fb-b4fa-8d0d80015e21'),
(208, 206, NULL, 96, 10, 'craft\\elements\\Entry', 1, 0, '2025-03-20 19:24:57', '2025-03-20 19:24:57', NULL, NULL, NULL, '00379305-7074-4c88-807f-83f185460ff2'),
(209, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:21:59', '2025-04-01 16:06:05', NULL, NULL, NULL, 'b0d20eb8-bbf6-497a-a3a9-b80693fed07d'),
(210, 209, NULL, 97, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:21:59', '2025-03-22 10:21:59', NULL, NULL, NULL, '5101ac91-7712-49f1-b856-e4fa6afbf6c1'),
(212, 209, NULL, 98, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:22:14', '2025-03-22 10:22:14', NULL, NULL, NULL, 'd6f86d41-52ef-406d-b2ec-b835d2d2f8a3'),
(213, 209, NULL, 99, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:48:04', '2025-03-22 10:48:04', NULL, NULL, NULL, '5a8cf1b8-e900-48ce-aadd-8b3b380c2e74'),
(214, 2, NULL, 100, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:50:00', '2025-03-22 10:50:00', NULL, NULL, NULL, '4a077790-677c-48b3-9b71-a8fd1b440475'),
(215, 209, NULL, 101, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:50:03', '2025-03-22 10:50:03', NULL, NULL, NULL, '455c3a44-b660-4270-a19f-bc6dab2cdbe2'),
(216, 2, NULL, 102, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:51:31', '2025-03-22 10:51:31', NULL, NULL, NULL, '3ce44b6d-acab-42bb-809f-07b055322c30'),
(217, 14, NULL, 103, 2, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:50:00', '2025-03-22 13:16:48', NULL, NULL, NULL, 'cdd37bb7-c1b2-40a6-bb69-54edab403ce6'),
(218, 27, NULL, 104, 3, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:50:00', '2025-03-22 13:16:48', NULL, NULL, NULL, 'fb048ae4-ee8c-4bfb-8037-57e492974937'),
(219, 49, NULL, 105, 2, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:50:00', '2025-03-22 13:16:48', NULL, NULL, NULL, '9cc0731d-6a52-466d-8817-ac23203ba5c8'),
(220, 2, NULL, 106, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:51:32', '2025-03-22 10:51:32', NULL, NULL, NULL, '850da791-3a06-4b10-b279-34f4f992fe9e'),
(221, 2, NULL, 107, 1, 'craft\\elements\\Entry', 0, 0, '2025-03-22 13:16:46', '2025-03-22 13:16:46', NULL, NULL, NULL, '96088842-c7bd-4be2-983c-7b58600da752'),
(222, 14, NULL, 108, 2, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:51:32', '2025-03-22 13:16:48', NULL, NULL, NULL, 'f42192a7-c120-4f73-ab3e-fd361110810e'),
(223, 27, NULL, 109, 3, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:51:32', '2025-03-22 13:16:48', NULL, NULL, NULL, '89404ee6-ac5e-4ab9-aaaf-4d9802d66520'),
(224, 49, NULL, 110, 2, 'craft\\elements\\Entry', 1, 0, '2025-03-22 10:51:32', '2025-03-22 13:16:48', NULL, NULL, NULL, '76ac5574-a8ea-47ed-80f2-7906174ce340'),
(225, 209, NULL, 111, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:16:46', '2025-03-22 13:16:46', NULL, NULL, NULL, 'b3fba373-1b3e-44b5-8911-bdf87e18b4bf'),
(226, 55, NULL, 112, 5, 'craft\\elements\\Entry', 0, 0, '2025-03-22 13:18:36', '2025-03-22 13:18:36', NULL, NULL, NULL, 'ef944a01-9d4c-49be-90ab-3ef4573e55eb'),
(227, 206, NULL, 113, 10, 'craft\\elements\\Entry', 1, 0, '2025-03-22 09:32:21', '2025-03-22 13:18:37', NULL, NULL, NULL, '9323a437-ad92-4ff2-a0ea-f861413f9b24'),
(228, 209, NULL, 114, 7, 'craft\\elements\\Entry', 0, 0, '2025-03-22 13:18:37', '2025-03-22 13:18:37', NULL, NULL, NULL, '9f68057d-99d9-418a-8af1-35755ecd647f'),
(229, 2, NULL, 115, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:18:41', '2025-03-22 13:18:41', NULL, NULL, NULL, '1f6db140-5cea-4412-895e-d1a7c924a2d8'),
(230, 14, NULL, 116, 2, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:16:47', '2025-03-22 13:18:41', NULL, NULL, NULL, '935443ab-d1b9-4c2d-8862-a18271318278'),
(231, 27, NULL, 117, 3, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:16:47', '2025-03-22 13:18:41', NULL, NULL, NULL, '33c376cf-74f1-4e9e-9cb8-a481078f25ae'),
(232, 49, NULL, 118, 2, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:16:47', '2025-03-22 13:18:41', NULL, NULL, NULL, '7d54474a-a38c-4a60-8d3c-cf0dd0630511'),
(236, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 0, 0, '2025-03-22 13:19:31', '2025-04-01 16:05:35', NULL, '2025-04-01 16:05:35', NULL, '75d14988-4b2b-4e54-8a9c-3ee79336b85b'),
(237, 2, NULL, 119, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:19:31', '2025-03-22 13:19:31', NULL, NULL, NULL, 'd24751ef-4fef-4325-b423-d1f08b0121fa'),
(238, 236, NULL, 120, 2, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:19:31', '2025-03-22 13:19:31', NULL, '2025-04-01 16:05:35', NULL, 'dd09a1f4-96b8-44c1-a63d-a6a864ec01fb'),
(239, 14, NULL, 121, 2, 'craft\\elements\\Entry', 0, 0, '2025-03-22 13:19:31', '2025-03-22 13:19:31', NULL, NULL, NULL, '7d294fc8-991c-42b1-b0c0-dae2e172e659'),
(242, 2, NULL, 122, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:19:41', '2025-03-22 13:19:41', NULL, NULL, NULL, '701fb949-2569-46ee-bf51-f2ed930cddbe'),
(243, 49, NULL, 123, 2, 'craft\\elements\\Entry', 0, 0, '2025-03-22 13:19:41', '2025-03-22 13:19:41', NULL, NULL, NULL, 'e6f61487-65b9-4a57-9fcc-9004e188026e'),
(246, 2, NULL, 124, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:24:49', '2025-03-22 13:24:49', NULL, NULL, NULL, 'd97264de-43a1-4bfa-9d51-15915ef839b3'),
(247, 27, NULL, 125, 3, 'craft\\elements\\Entry', 0, 0, '2025-03-22 13:24:49', '2025-03-22 13:24:49', NULL, NULL, NULL, '628bae01-6526-4a44-a233-f89cc0ca9d0c'),
(250, 2, NULL, 126, 1, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:25:09', '2025-03-22 13:25:09', NULL, NULL, NULL, 'b1c7d5d9-836d-4066-a620-2a78dff3acfc'),
(251, 27, NULL, 127, 3, 'craft\\elements\\Entry', 1, 0, '2025-03-22 13:25:09', '2025-03-22 13:25:09', NULL, NULL, NULL, 'f914608c-407d-415e-b7f7-5f11bea9e3a1'),
(252, 55, NULL, 128, 5, 'craft\\elements\\Entry', 1, 0, '2025-03-23 11:38:24', '2025-03-23 11:38:24', NULL, NULL, NULL, 'd767b5f7-64d3-43d8-8e1f-674792fde8ca'),
(253, 55, NULL, 129, 5, 'craft\\elements\\Entry', 0, 0, '2025-03-23 11:38:32', '2025-03-23 11:38:32', NULL, NULL, NULL, '5d233a0a-ff55-45fa-94ff-dc12a9f34053'),
(255, 209, NULL, 130, 7, 'craft\\elements\\Entry', 0, 0, '2025-03-23 11:39:18', '2025-03-23 11:39:18', NULL, NULL, NULL, '71f7b492-87d8-4e50-b600-83fb3a407da7'),
(256, 124, NULL, 131, 9, 'craft\\elements\\Entry', 0, 0, '2025-03-23 14:57:55', '2025-03-23 14:57:55', NULL, NULL, NULL, 'df05c4d6-1575-41ef-9775-28d4de48806e'),
(257, 124, NULL, 132, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-23 14:58:02', '2025-03-23 14:58:02', NULL, NULL, NULL, '6149c2e1-6264-47f2-8239-26fd0ccc28d8'),
(261, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-24 15:11:58', '2025-03-26 19:03:56', NULL, NULL, NULL, '8ff51996-109e-4455-89be-f85304c2cf46'),
(262, 261, NULL, 133, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-24 15:12:17', '2025-03-24 15:12:17', NULL, NULL, NULL, 'd7fbfd9f-d668-402a-b113-4543c87bfce2'),
(264, 261, NULL, 134, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-24 15:13:54', '2025-03-24 15:13:54', NULL, NULL, NULL, 'e97c733d-422d-429b-aa86-b36fe273a239'),
(265, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-24 15:14:11', '2025-03-26 19:40:16', NULL, NULL, NULL, 'bf3b9aad-2aed-4282-b7f0-d4d9d33beddf'),
(266, 265, NULL, 135, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-24 15:14:39', '2025-03-24 15:14:39', NULL, NULL, NULL, '6d8514db-39d8-4374-b4c3-6e3d549d19b1'),
(267, 55, NULL, 136, 5, 'craft\\elements\\Entry', 0, 0, '2025-03-24 16:45:05', '2025-03-24 16:45:05', NULL, NULL, NULL, '59e024a6-39e5-49ed-a64c-d96c7836e712'),
(268, 55, NULL, 137, 5, 'craft\\elements\\Entry', 0, 0, '2025-03-24 16:45:53', '2025-03-24 16:45:53', NULL, NULL, NULL, 'baaf4984-e487-4a8d-bd39-059f7a543f3e'),
(269, 209, NULL, 138, 7, 'craft\\elements\\Entry', 0, 0, '2025-03-24 17:58:31', '2025-03-24 17:58:31', NULL, NULL, NULL, '7aba2e72-b76e-4506-83d1-38f3ce8555aa'),
(270, 55, NULL, 139, 5, 'craft\\elements\\Entry', 0, 0, '2025-03-24 17:58:31', '2025-03-24 17:58:31', NULL, NULL, NULL, 'ff83375a-b8d2-4471-b571-16953b77bbc0'),
(272, 124, NULL, 140, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:00:07', '2025-03-26 19:00:07', NULL, NULL, NULL, '4daa458e-d373-4804-b150-4d5bceec0132'),
(274, 71, NULL, 141, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:00:17', '2025-03-26 19:00:17', NULL, NULL, NULL, '0413ab4b-a0d9-4ec3-9e92-174b50abd501'),
(276, 127, NULL, 142, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:00:31', '2025-03-26 19:00:31', NULL, NULL, NULL, '50b809d4-5b60-416f-a7ae-23f4caaebe9c'),
(278, 130, NULL, 143, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:02:58', '2025-03-26 19:02:58', NULL, NULL, NULL, 'db191340-8fdd-4e94-be0c-eb0d490a4e42'),
(280, 133, NULL, 144, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:03:11', '2025-03-26 19:03:11', NULL, NULL, NULL, 'ccbf1f1e-9a5a-4230-a3f0-12975d927ff6'),
(282, 136, NULL, 145, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:03:32', '2025-03-26 19:03:32', NULL, NULL, NULL, '05ecc776-2825-4065-9280-d9d787aa880d'),
(284, 261, NULL, 146, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:03:56', '2025-03-26 19:03:56', NULL, NULL, NULL, 'ff5ac56a-16b7-4aa8-83e2-c36853b49a1e'),
(286, 265, NULL, 147, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:04:30', '2025-03-26 19:04:30', NULL, NULL, NULL, 'ca94477c-8178-470a-b962-f054baf16e02'),
(287, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:04:34', '2025-03-26 19:29:50', NULL, NULL, NULL, '8ef32445-177e-481c-8e59-35134eb4e23f'),
(288, 287, NULL, 148, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:05:13', '2025-03-26 19:05:13', NULL, NULL, NULL, '30554be9-3171-4371-a24e-358b97322e71'),
(289, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:05:21', '2025-03-26 19:05:38', NULL, NULL, NULL, 'e1b52e4a-48fb-4d32-8293-d90e22d8aca3'),
(290, 289, NULL, 149, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:05:38', '2025-03-26 19:05:38', NULL, NULL, NULL, '724a0789-55fc-40f2-bfdb-779951e131fc'),
(291, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:05:43', '2025-03-26 19:31:57', NULL, NULL, NULL, '64191d85-a9ec-4374-817c-af5f0545862a'),
(292, 291, NULL, 150, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:06:07', '2025-03-26 19:06:07', NULL, NULL, NULL, '2d8a89f1-bac7-4dc2-8126-b27659206131'),
(293, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:06:18', '2025-03-26 19:25:55', NULL, NULL, NULL, '55321774-e515-49fd-9ce2-1c51476cea78'),
(294, 293, NULL, 151, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:06:32', '2025-03-26 19:06:32', NULL, NULL, NULL, '3ec3661e-aebf-441f-9a46-b78dee0424d5'),
(296, 140, NULL, 152, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:08:00', '2025-03-26 19:08:00', NULL, NULL, NULL, '5e2ae1ef-c98a-4a1e-b2ca-9a5c412ff821'),
(298, 143, NULL, 153, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:08:21', '2025-03-26 19:08:21', NULL, NULL, NULL, '12a382f5-63a0-4738-80b1-627861c89dc1'),
(300, 146, NULL, 154, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:08:36', '2025-03-26 19:08:36', NULL, NULL, NULL, '85ed2086-6a21-449d-8c02-08640cbf7148'),
(302, 151, NULL, 155, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:08:49', '2025-03-26 19:08:49', NULL, NULL, NULL, '025e8b86-51d3-4380-8987-5a689a524027'),
(303, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:09:21', '2025-03-26 19:09:57', NULL, NULL, NULL, '6d878a93-2e27-4de7-87aa-854e29c8a956'),
(304, 303, NULL, 156, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:09:57', '2025-03-26 19:09:57', NULL, NULL, NULL, 'fb1db3b0-75eb-4cc5-83ca-0a95d72904b2'),
(305, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:10:00', '2025-03-26 19:10:51', NULL, NULL, NULL, '1300abbd-e666-4a5a-ad56-d031f75c9851'),
(306, 305, NULL, 157, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:10:51', '2025-03-26 19:10:51', NULL, NULL, NULL, 'c452a063-6718-40e2-891e-6da50cc1556c'),
(307, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:10:54', '2025-03-26 19:11:50', NULL, NULL, NULL, '72c47d7a-7afb-4389-8ecd-15fcac60a8e9'),
(308, 307, NULL, 158, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:11:50', '2025-03-26 19:11:50', NULL, NULL, NULL, '690dd7f9-443b-42e5-900c-0f336a61ed16'),
(309, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:11:56', '2025-03-26 19:40:51', NULL, NULL, NULL, '8e7a89e7-161b-4476-bb12-e7a2cfcbeafb'),
(310, 309, NULL, 159, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:14:21', '2025-03-26 19:14:21', NULL, NULL, NULL, '0732279d-f062-451b-8078-5bddd05026a1'),
(312, 153, NULL, 160, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:15:07', '2025-03-26 19:15:07', NULL, NULL, NULL, 'cb335e71-f465-45c0-b7a0-dbbd811d5623'),
(313, 140, NULL, 161, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:15:15', '2025-03-26 19:15:15', NULL, NULL, NULL, 'c0840987-8a0b-4199-b821-0cb00b31430e'),
(314, 143, NULL, 162, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:15:22', '2025-03-26 19:15:22', NULL, NULL, NULL, '8b688000-4924-4c93-b09b-547e5b7f3deb'),
(315, 146, NULL, 163, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:15:28', '2025-03-26 19:15:28', NULL, NULL, NULL, '5b710027-a21b-42da-a221-b0c53fc4c075'),
(316, 151, NULL, 164, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:15:35', '2025-03-26 19:15:35', NULL, NULL, NULL, '36a3bcfc-c0d0-43c2-af8d-51b56dd82152'),
(317, 153, NULL, 165, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:15:47', '2025-03-26 19:15:47', NULL, NULL, NULL, '4e3a88df-7c12-4d69-972e-755ee9d0e653'),
(319, 161, NULL, 166, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:16:22', '2025-03-26 19:16:22', NULL, NULL, NULL, 'aa0ad87d-72a7-433f-a171-a34aa3b5a72e'),
(320, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:16:32', '2025-03-26 19:17:38', NULL, NULL, NULL, '5f9e3f78-ce9c-4f80-9dd0-86b2021e8398'),
(321, 320, NULL, 167, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:17:38', '2025-03-26 19:17:38', NULL, NULL, NULL, 'c6434414-d9a4-4d89-be76-e904c67c278d'),
(322, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:17:42', '2025-04-01 14:09:21', NULL, NULL, NULL, '05140ef1-1142-4c4c-93ac-2ac62e13e2d1'),
(323, 322, NULL, 168, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:18:36', '2025-03-26 19:18:36', NULL, NULL, NULL, '6db1011d-00e3-4e86-8ed9-e87038395d1e'),
(324, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:18:39', '2025-03-26 19:19:18', NULL, NULL, NULL, '371327fa-e0a9-4a4c-a874-57527930efed'),
(325, 324, NULL, 169, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:19:18', '2025-03-26 19:19:18', NULL, NULL, NULL, '4ab41830-d876-4247-8cbc-88051679e919'),
(327, 157, NULL, 170, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:20:00', '2025-03-26 19:20:00', NULL, NULL, NULL, 'ae69249f-2916-43e4-ad8b-a5ed7a6ec05d'),
(329, 159, NULL, 171, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:20:21', '2025-03-26 19:20:21', NULL, NULL, NULL, 'a0a0d477-2678-4dc5-b13d-2c13857e48ed'),
(330, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:20:30', '2025-03-26 19:44:35', NULL, NULL, NULL, '95089633-725f-4f66-bfe2-4ab0b913e602'),
(331, 330, NULL, 172, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:20:59', '2025-03-26 19:20:59', NULL, NULL, NULL, '520ae700-2fd9-424c-96de-718b8a5a29e8'),
(332, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:21:06', '2025-03-26 19:46:16', NULL, NULL, NULL, '1c4fe2d8-4805-404a-8963-e1872634a264'),
(333, 332, NULL, 173, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:22:38', '2025-03-26 19:22:38', NULL, NULL, NULL, '75722202-5efc-4137-9686-69c268ea6587'),
(334, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:22:41', '2025-03-26 19:45:51', NULL, NULL, NULL, '1d94dddd-da04-4b5c-b26e-a799a383a4de'),
(335, 334, NULL, 174, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:23:26', '2025-03-26 19:23:26', NULL, NULL, NULL, '151af8ef-ba4a-41b3-95ab-97f57b441c90'),
(336, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:23:28', '2025-03-26 19:23:44', NULL, NULL, NULL, '2d44cf64-f75a-4e33-bd1c-57071fac71ba'),
(337, 336, NULL, 175, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:23:44', '2025-03-26 19:23:44', NULL, NULL, NULL, 'c3feb37f-dad7-4b16-bde6-f48291775adc'),
(339, 192, NULL, 176, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:24:05', '2025-03-26 19:24:05', NULL, NULL, NULL, 'c24549dd-21cf-4389-bdaa-11fa6f487461'),
(341, 195, NULL, 177, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:24:19', '2025-03-26 19:24:19', NULL, NULL, NULL, 'ea79eb49-d73d-496a-8040-f3bfa8a020dd'),
(343, 198, NULL, 178, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:24:34', '2025-03-26 19:24:34', NULL, NULL, NULL, '93976634-6004-45d0-87b5-f91e0108b28d'),
(344, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:24:37', '2025-03-26 19:24:48', NULL, NULL, NULL, '9ccce946-c670-4dfa-88f3-176d5244e40b'),
(345, 344, NULL, 179, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:24:48', '2025-03-26 19:24:48', NULL, NULL, NULL, '6a5de425-7e16-4f8a-87e8-baaaca1bc0d0'),
(347, 170, NULL, 180, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:25:09', '2025-03-26 19:25:09', NULL, NULL, NULL, '81801d82-fd36-4d3a-aa00-77d3b1237a0d'),
(348, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:25:11', '2025-03-26 19:25:36', NULL, NULL, NULL, '84b605eb-c645-4ca5-9513-a841aadb6a3a'),
(349, 348, NULL, 181, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:25:36', '2025-03-26 19:25:36', NULL, NULL, NULL, '9c1c67f4-71c3-4db3-a238-fea0b6f05e75'),
(351, 293, NULL, 182, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:25:55', '2025-03-26 19:25:55', NULL, NULL, NULL, 'bcd11014-ac01-41ec-98e8-e821ee96be05'),
(352, NULL, NULL, NULL, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:26:12', '2025-03-26 19:26:25', NULL, NULL, NULL, 'fba2f1e1-354d-430c-8568-eb0cd708a536'),
(353, 352, NULL, 183, 7, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:26:25', '2025-03-26 19:26:25', NULL, NULL, NULL, '4ebe0cc4-a415-4386-9480-ce1d9d987baa'),
(354, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:26:31', '2025-03-26 19:26:56', NULL, NULL, NULL, 'b3a238d8-040a-4a18-ad77-e9ac54d27fcc'),
(355, 354, NULL, 184, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:26:56', '2025-03-26 19:26:56', NULL, NULL, NULL, 'ce51d05c-6463-46be-8bac-7f761c7ad928'),
(356, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:26:58', '2025-03-26 19:27:17', NULL, NULL, NULL, '1d61077d-c9aa-4854-aef4-92cace9723b5'),
(357, 356, NULL, 185, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:27:17', '2025-03-26 19:27:17', NULL, NULL, NULL, '83e85733-2fd8-487c-9b80-2b0bc4a40b42'),
(359, 287, NULL, 186, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:29:50', '2025-03-26 19:29:50', NULL, NULL, NULL, '72984b60-47d8-4745-aa4c-ad1d5ed4a128'),
(361, 130, NULL, 187, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:30:09', '2025-03-26 19:30:09', NULL, NULL, NULL, 'f9b1cbd7-5907-4dab-9601-75f6a8b550c6'),
(363, 71, NULL, 188, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:30:59', '2025-03-26 19:30:59', NULL, NULL, NULL, 'b3cd0fd2-3647-4ce6-a63e-23249d4c17d6'),
(365, 136, NULL, 189, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:31:13', '2025-03-26 19:31:13', NULL, NULL, NULL, '79db6c41-21ab-41ce-ab1f-6b8e11a74fb2'),
(367, 291, NULL, 190, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:31:57', '2025-03-26 19:31:57', NULL, NULL, NULL, 'b1e66f9d-5112-4bf9-b564-e33294666449'),
(368, 332, NULL, 191, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:32:20', '2025-03-26 19:32:20', NULL, NULL, NULL, 'b65b2a95-d696-483f-baee-8681cabecb95'),
(369, 157, NULL, 192, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:32:33', '2025-03-26 19:32:33', NULL, NULL, NULL, 'b0b0aa3d-40a2-4261-bf5d-a1e4e34cbe01'),
(370, 55, NULL, 193, 5, 'craft\\elements\\Entry', 0, 0, '2025-03-26 19:34:57', '2025-03-26 19:34:57', NULL, NULL, NULL, '27f74731-b127-4cc3-a67f-021d68ab3884'),
(371, 206, NULL, 194, 10, 'craft\\elements\\Entry', 0, 0, '2025-03-26 19:34:57', '2025-03-26 19:34:57', NULL, NULL, NULL, 'b7c98e0c-617d-44e3-ad23-15400e28ad62'),
(373, 330, NULL, 195, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:35:24', '2025-03-26 19:35:24', NULL, NULL, NULL, '0a7a78f3-afd9-47d2-a47d-75b308702613'),
(375, 265, NULL, 196, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:40:16', '2025-03-26 19:40:16', NULL, NULL, NULL, '85b1062b-f2b5-4a09-b8f4-77ceb97b49cd'),
(377, 309, NULL, 197, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:40:51', '2025-03-26 19:40:51', NULL, NULL, NULL, 'c095c332-d7ae-499e-8e28-db4fe95c3aeb'),
(378, 143, NULL, 198, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:40:58', '2025-03-26 19:40:58', NULL, NULL, NULL, 'c2f0be19-68b2-471e-bd3c-3bc18dee1ab3'),
(379, 151, NULL, 199, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:41:04', '2025-03-26 19:41:04', NULL, NULL, NULL, '6da9de5f-1714-4a42-b989-3f9e73580b7f'),
(381, 161, NULL, 200, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:41:22', '2025-03-26 19:41:22', NULL, NULL, NULL, '05fe3139-d87f-4c6c-900d-e5be0eedf61c'),
(383, 322, NULL, 201, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:41:40', '2025-03-26 19:41:40', NULL, NULL, NULL, '4db6ca8d-65b2-455a-885c-e1cf5f92fad5'),
(385, 322, NULL, 202, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:42:47', '2025-03-26 19:42:47', NULL, NULL, NULL, '9a23b989-bdd4-4759-9180-c5d703f654d6'),
(387, 334, NULL, 203, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:44:23', '2025-03-26 19:44:23', NULL, NULL, NULL, '09361e3c-30a4-448c-bbe1-ed06b7f9289a'),
(388, 330, NULL, 204, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:44:35', '2025-03-26 19:44:35', NULL, NULL, NULL, '224941e5-aabb-4873-81cb-a73decaeb3d9'),
(390, 332, NULL, 205, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:45:27', '2025-03-26 19:45:27', NULL, NULL, NULL, '030f02a9-0bfc-48d3-8191-868289c4db0b'),
(392, 334, NULL, 206, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:45:51', '2025-03-26 19:45:51', NULL, NULL, NULL, 'c7c2e54d-edb7-4027-acea-05c8da5f765c'),
(394, 332, NULL, 207, 9, 'craft\\elements\\Entry', 1, 0, '2025-03-26 19:46:16', '2025-03-26 19:46:16', NULL, NULL, NULL, 'dd141975-6cbf-4262-bec6-ae931f28a4c2'),
(399, 322, NULL, 208, 9, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:09:21', '2025-04-01 14:09:21', NULL, NULL, NULL, 'cf3cf386-84c3-4305-a684-49918b891040'),
(400, 55, NULL, 209, 5, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:11:24', '2025-04-01 14:11:24', NULL, NULL, NULL, '228a2585-2b5d-4681-844c-e7461844273e'),
(401, 209, NULL, 210, 7, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:11:24', '2025-04-01 14:11:24', NULL, NULL, NULL, 'c5f3e791-7eae-40d2-9205-4da2e28aa324'),
(402, 2, NULL, 211, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:12:06', '2025-04-01 14:12:06', NULL, NULL, NULL, '8ce60d96-13f9-4fec-bdc3-4efa96f1633e'),
(403, 55, NULL, 212, 5, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:12:35', '2025-04-01 14:12:35', NULL, NULL, NULL, '14f573c3-d290-4e6d-95f0-6c3d8cc9fdbb'),
(404, 55, NULL, 213, 5, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:12:53', '2025-04-01 14:12:53', NULL, NULL, NULL, 'f25b7b39-1e5b-49a6-8542-db237b814e85'),
(405, 55, NULL, 214, 5, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:13:02', '2025-04-01 14:13:02', NULL, NULL, NULL, '5b47dfb7-fd7a-4e98-985d-92f3f78ff906'),
(406, 2, NULL, 215, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:13:22', '2025-04-01 14:13:22', NULL, NULL, NULL, 'f297df85-f4d8-4d79-9f93-b0cef41c9531'),
(407, 236, NULL, 216, 2, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:13:22', '2025-04-01 14:13:22', NULL, '2025-04-01 16:05:35', NULL, '30dc64d5-0feb-4251-837f-84cac65035ff'),
(408, 49, NULL, 217, 2, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:13:22', '2025-04-01 14:13:22', NULL, NULL, NULL, '737b3642-cacc-4582-a3b1-ed9c081b0aaf'),
(409, 2, NULL, 218, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:13:55', '2025-04-01 14:13:55', NULL, NULL, NULL, '3b951a33-0842-4566-ba6c-ae5967f0eaa1'),
(411, 2, NULL, 219, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:14:32', '2025-04-01 14:14:32', NULL, NULL, NULL, 'bda14b95-8bd6-4eb0-86e7-fa5bef5cd68a'),
(413, 2, NULL, 220, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:15:38', '2025-04-01 14:15:38', NULL, NULL, NULL, 'c8564263-30b1-4919-a267-6d25d0489df4'),
(414, 2, NULL, 221, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:16:46', '2025-04-01 14:16:46', NULL, NULL, NULL, 'a0644990-48d8-4155-9aa4-ac47030efe32'),
(416, 2, NULL, 222, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:18:08', '2025-04-01 14:18:08', NULL, NULL, NULL, 'be60fb59-7cc7-408b-adcd-f15be2c6072a'),
(417, 2, NULL, 223, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:18:48', '2025-04-01 14:18:48', NULL, NULL, NULL, 'bbdf6242-1bda-4153-be58-ef42481524fa'),
(418, 2, NULL, 224, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:18:55', '2025-04-01 14:18:55', NULL, NULL, NULL, '4f22e2ba-5f6a-44c7-b511-d1739d191844'),
(419, 55, NULL, 225, 5, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:19:58', '2025-04-01 14:19:58', NULL, NULL, NULL, 'c7930dcc-ad87-4422-ad48-c70da852ad30'),
(420, 209, NULL, 226, 7, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:19:58', '2025-04-01 14:19:58', NULL, NULL, NULL, 'b0e12035-6f8e-4795-88b1-06b5076232ca'),
(422, 2, NULL, 227, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 14:20:52', '2025-04-01 14:20:52', NULL, NULL, NULL, 'c26e38ab-9ed5-451d-bda0-9c8df68fc61f'),
(423, 55, NULL, 228, 5, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:25:27', '2025-04-01 14:25:27', NULL, NULL, NULL, 'f37b6c1f-0510-4c08-9c65-a9f53b357c4e'),
(424, 209, NULL, 229, 7, 'craft\\elements\\Entry', 1, 0, '2025-04-01 14:25:27', '2025-04-01 14:25:27', NULL, NULL, NULL, '39e5f3c7-7c16-4842-8b95-63609c47f31c'),
(427, 2, NULL, 230, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 16:02:30', '2025-04-01 16:02:30', NULL, NULL, NULL, '2e20af17-ca61-4e8d-873f-fd50a629748e'),
(428, 236, NULL, 231, 2, 'craft\\elements\\Entry', 0, 0, '2025-04-01 16:02:30', '2025-04-01 16:02:30', NULL, '2025-04-01 16:05:35', NULL, 'fe5e6c6a-0afe-4553-adec-8ea0bd854316'),
(431, 2, NULL, 232, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 16:04:04', '2025-04-01 16:04:04', NULL, NULL, NULL, '359ef0bf-c7cc-4aa2-8148-060391faf535'),
(432, 27, NULL, 233, 3, 'craft\\elements\\Entry', 0, 0, '2025-04-01 16:04:04', '2025-04-01 16:04:04', NULL, NULL, NULL, 'f84eb3c3-9a8b-44aa-9bf2-fbdb93749153'),
(434, 55, NULL, 234, 5, 'craft\\elements\\Entry', 0, 0, '2025-04-01 16:04:30', '2025-04-01 16:04:30', NULL, NULL, NULL, '4d548cf5-239b-4d3c-b7c8-353db40d7dd5'),
(435, 209, NULL, 235, 7, 'craft\\elements\\Entry', 0, 0, '2025-04-01 16:04:30', '2025-04-01 16:04:30', NULL, NULL, NULL, '69125a61-1a51-4fcb-b83b-63ff18814110'),
(438, 2, NULL, 236, 1, 'craft\\elements\\Entry', 1, 0, '2025-04-01 16:05:35', '2025-04-01 16:05:35', NULL, NULL, NULL, '0d52f791-45a1-412a-8416-e4889bdb4e78'),
(439, 14, NULL, 237, 2, 'craft\\elements\\Entry', 1, 0, '2025-04-01 16:05:35', '2025-04-01 16:05:35', NULL, NULL, NULL, 'f6d8869c-0899-4f0d-b76e-0318ec17449d'),
(440, 27, NULL, 238, 3, 'craft\\elements\\Entry', 1, 0, '2025-04-01 16:05:35', '2025-04-01 16:05:35', NULL, NULL, NULL, 'dbd74aaa-7c5c-4532-9d53-9d25f9dbfec0'),
(443, 2, NULL, 239, 1, 'craft\\elements\\Entry', 1, 0, '2025-04-01 16:05:45', '2025-04-01 16:05:45', NULL, NULL, NULL, 'fa01c4f4-7d9a-4903-8bf0-b6f8bae7f78a'),
(444, 49, NULL, 240, 2, 'craft\\elements\\Entry', 1, 0, '2025-04-01 16:05:45', '2025-04-01 16:05:45', NULL, NULL, NULL, 'ab736d98-0843-40c5-bdca-4f9ebad2872f'),
(445, 55, NULL, 241, 5, 'craft\\elements\\Entry', 1, 0, '2025-04-01 16:06:05', '2025-04-01 16:06:05', NULL, NULL, NULL, '63742a37-0f3f-44a4-84d4-514af86c1e90'),
(446, 209, NULL, 242, 7, 'craft\\elements\\Entry', 1, 0, '2025-04-01 16:06:05', '2025-04-01 16:06:05', NULL, NULL, NULL, 'dbcb781e-ecb9-41e0-981b-877f2476869d'),
(449, 2, NULL, 243, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 17:07:49', '2025-04-01 17:07:49', NULL, NULL, NULL, '07f5dcdf-0ec2-4093-9717-f6d86a2902b6'),
(450, 14, NULL, 244, 2, 'craft\\elements\\Entry', 1, 0, '2025-04-01 17:07:49', '2025-04-01 17:07:49', NULL, NULL, NULL, '7d6db55c-3f4e-450d-8de9-bd96cf941e21'),
(451, 2, NULL, 245, 1, 'craft\\elements\\Entry', 0, 0, '2025-04-01 17:08:24', '2025-04-01 17:08:24', NULL, NULL, NULL, 'a4ef9d38-a323-4ab3-adb9-33ca71c2f3f9'),
(452, 2, NULL, 246, 1, 'craft\\elements\\Entry', 1, 0, '2025-04-01 17:08:31', '2025-04-01 17:08:31', NULL, NULL, NULL, '0aaba7a0-aa21-4956-91ef-74e37bad5aa4');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_bulkops`
--

CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_owners`
--

CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements_owners`
--

INSERT INTO `elements_owners` (`elementId`, `ownerId`, `sortOrder`) VALUES
(14, 2, 1),
(15, 2, 2),
(16, 2, 3),
(17, 2, 4),
(18, 2, 5),
(20, 19, 1),
(20, 28, 1),
(21, 19, 2),
(21, 28, 2),
(22, 19, 3),
(22, 28, 3),
(23, 19, 4),
(23, 28, 4),
(23, 36, 4),
(24, 19, 5),
(24, 28, 5),
(27, 2, 2),
(29, 28, 6),
(37, 36, 1),
(38, 36, 2),
(39, 36, 3),
(40, 36, 5),
(41, 36, 6),
(41, 50, 2),
(49, 2, 3),
(51, 50, 1),
(51, 53, 1),
(51, 214, 1),
(52, 50, 3),
(52, 53, 3),
(52, 214, 3),
(54, 53, 2),
(54, 214, 2),
(77, 71, 1),
(80, 79, 1),
(80, 91, 1),
(80, 96, 1),
(80, 99, 1),
(80, 100, 1),
(206, 55, 1),
(208, 207, 1),
(217, 216, 1),
(217, 220, 1),
(218, 216, 2),
(218, 220, 2),
(219, 216, 3),
(219, 220, 3),
(222, 221, 1),
(223, 221, 2),
(224, 221, 3),
(227, 226, 1),
(227, 252, 1),
(227, 253, 1),
(227, 267, 1),
(227, 268, 1),
(227, 270, 1),
(230, 229, 1),
(231, 229, 2),
(231, 237, 3),
(231, 242, 3),
(232, 229, 3),
(232, 237, 4),
(236, 2, 1),
(238, 237, 1),
(238, 242, 1),
(238, 246, 1),
(238, 250, 1),
(238, 402, 1),
(239, 237, 2),
(239, 242, 2),
(239, 246, 2),
(239, 250, 2),
(239, 402, 2),
(239, 406, 2),
(239, 409, 2),
(239, 411, 2),
(239, 413, 2),
(239, 414, 2),
(239, 416, 2),
(239, 417, 2),
(239, 418, 2),
(239, 422, 2),
(239, 427, 2),
(239, 431, 2),
(243, 242, 4),
(243, 246, 4),
(243, 250, 4),
(243, 402, 4),
(247, 246, 3),
(251, 250, 3),
(251, 402, 3),
(251, 406, 3),
(251, 409, 3),
(251, 411, 3),
(251, 413, 3),
(251, 414, 3),
(251, 416, 3),
(251, 417, 3),
(251, 418, 3),
(251, 422, 3),
(251, 427, 3),
(371, 370, 1),
(371, 400, 1),
(371, 403, 1),
(371, 404, 1),
(371, 405, 1),
(371, 419, 1),
(371, 423, 1),
(371, 434, 1),
(371, 445, 1),
(407, 406, 1),
(407, 409, 1),
(407, 411, 1),
(407, 413, 1),
(407, 414, 1),
(407, 416, 1),
(407, 417, 1),
(407, 418, 1),
(407, 422, 1),
(408, 406, 4),
(408, 409, 4),
(408, 411, 4),
(408, 413, 4),
(408, 414, 4),
(408, 416, 4),
(408, 417, 4),
(408, 418, 4),
(408, 422, 4),
(408, 427, 4),
(408, 431, 4),
(408, 438, 3),
(428, 427, 1),
(428, 431, 1),
(432, 431, 3),
(439, 438, 1),
(439, 443, 1),
(440, 438, 2),
(440, 443, 2),
(440, 449, 2),
(440, 451, 2),
(440, 452, 2),
(444, 443, 3),
(444, 449, 3),
(444, 451, 3),
(444, 452, 3),
(450, 449, 1),
(450, 451, 1),
(450, 452, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, 1, '2025-02-22 10:22:11', '2025-02-22 10:22:11', 'bd3e6433-d244-41c9-aa53-2d67ef940387'),
(2, 2, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-02-22 10:33:50', '2025-04-01 14:18:08', 'd7284893-5caa-4575-b97f-4d88ca61505e'),
(3, 3, 1, 'Home', 'home', '__home__', NULL, 1, '2025-02-22 10:33:50', '2025-02-22 10:33:50', '73cf9001-6572-4654-86a7-551618f6029f'),
(14, 14, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een hapje of een burger!</p><p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-02-23 10:15:23', '2025-04-01 17:07:49', '86e334d7-58c0-44a3-b080-6617b45d334f'),
(15, 15, 1, NULL, '__temp_iwgsuysaohgglcrzloaslbmnygedysxgxdxl', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:22:22', 'dca976ea-773b-4c01-96b0-a2639e7cb531'),
(16, 16, 1, NULL, '__temp_zmbqrrtxwsckwmapkerrdwyayichhtcupzhy', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Eet je liever iets anders?<br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:22:22', '3a96b120-c68e-45a6-96e9-a22c4313b9d8'),
(17, 17, 1, NULL, '__temp_uhppxhtyjcczigpjvkclrxhqhhiyrfnpuwvd', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:15:23', '8b8376cd-385e-4ce1-96ab-5c171c03675c'),
(18, 18, 1, NULL, '__temp_htryxzgsvdklzyxvgwcvxditrjqpcxttbhpm', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:22:22', '7e997e4b-88ea-4fd1-ac47-97888e250ace'),
(19, 19, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-02-23 10:15:23', '2025-02-23 10:15:23', 'e1966d9f-dfb2-4822-be96-82055575b2e0'),
(20, 20, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Een burgerbar voor iedereen, of je nu je burger met je handen eet of met mes en vork, of je nu houdt van vlees, vis of vegetarisch.</p>\\n<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!<br />Eet je liever iets anders?</p>\\n<p><br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.<br />Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\\n<p>Welkom<br />Kristin en Bart</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:15:23', '41130332-66ab-4054-9962-bec86ff339a8'),
(21, 21, 1, NULL, '__temp_iwgsuysaohgglcrzloaslbmnygedysxgxdxl', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!<br />Eet je liever iets anders?</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:15:23', '828370be-a2c0-4911-8e87-20d160959bef'),
(22, 22, 1, NULL, '__temp_zmbqrrtxwsckwmapkerrdwyayichhtcupzhy', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:15:23', 'fa14d0f6-c12e-4dc3-98a1-d12ffb5a929d'),
(23, 23, 1, NULL, '__temp_uhppxhtyjcczigpjvkclrxhqhhiyrfnpuwvd', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:15:23', '965907dc-3219-479c-b8ae-4553bd312597'),
(24, 24, 1, NULL, '__temp_oehddxlgjannnzowbkjvyarjkkswsaqxdojg', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Welkom<br />Kristin en Bart</p>\"}', 1, '2025-02-23 10:15:23', '2025-02-23 10:15:23', '45b23ea5-d5af-4ba9-a0f5-1de04d97baa4'),
(27, 27, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-02-23 10:16:50', '2025-02-28 17:58:58', 'e8b778ff-b600-41fa-b1a5-9347cb2716b9'),
(28, 28, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-02-23 10:16:50', '2025-02-23 10:16:50', 'cc9b05a9-8568-4566-b891-6684fafe4058'),
(29, 29, 1, NULL, '__temp_cezdsjjnpgwbdongiofzecqhmwqchxozcxab', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-02-23 10:16:50', '2025-02-23 10:16:50', '4fba5335-6b19-459a-83b0-3b3210ae962d'),
(36, 36, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-02-23 10:22:22', '2025-02-23 10:22:22', '7a6ba6b3-6b1a-4964-a770-1eeec2433218'),
(37, 37, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Een burgerbar voor iedereen, of je nu je burger met je handen eet of met mes en vork, of je nu houdt van vlees, vis of vegetarisch.</p>\"}', 1, '2025-02-23 10:22:22', '2025-02-23 10:22:22', '8973f156-8bdd-4864-a017-8b8b15dc9a4f'),
(38, 38, 1, NULL, '__temp_iwgsuysaohgglcrzloaslbmnygedysxgxdxl', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!</p>\"}', 1, '2025-02-23 10:22:22', '2025-02-23 10:22:22', '747da133-2187-4936-8cc6-aaf242c6ffcc'),
(39, 39, 1, NULL, '__temp_zmbqrrtxwsckwmapkerrdwyayichhtcupzhy', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Eet je liever iets anders?<br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\"}', 1, '2025-02-23 10:22:22', '2025-02-23 10:22:22', 'd6f8c43f-c6b0-4393-b37d-09b6546c511b'),
(40, 40, 1, NULL, '__temp_htryxzgsvdklzyxvgwcvxditrjqpcxttbhpm', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-02-23 10:22:22', '2025-02-23 10:22:22', '33655aa9-8e8d-4106-8acd-9d32073cbc59'),
(41, 41, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveren\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-02-23 10:22:22', '2025-02-23 10:22:22', 'd11eedea-b2fb-4430-a057-5645153f1189'),
(49, 49, 1, NULL, '__temp_xucslydrjzplwtharqwfutrcvebewtoxmsuq', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Reservatie voor dezelfde dag nog, graag even via de telefoon<br /><a href=\\\"tel:014585823\\\">0472/288823</a></p>\"}', 1, '2025-02-23 10:24:41', '2025-04-01 14:13:22', 'c8d29870-ec71-497c-99ab-2394ffa0cbdb'),
(50, 50, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-02-23 10:24:41', '2025-02-23 10:24:41', 'd55cb3bf-96fd-4802-829f-4ff38064c5c8'),
(51, 51, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Een burgerbar voor iedereen, of je nu je burger met je handen eet of met mes en vork, of je nu houdt van vlees, vis of vegetarisch.</p>\\n<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!</p>\\n<p>Eet je liever iets anders?<br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\\n<p>Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\\n<p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-02-23 10:24:41', '2025-02-23 10:24:41', '9ce0f67d-220d-48c6-9273-77c6df526e64'),
(52, 52, 1, NULL, '__temp_xucslydrjzplwtharqwfutrcvebewtoxmsuq', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Reservatie voor dezelfde dag nog, graag even via de telefoon<br /><a href=\\\"tel:014585823\\\">014/58 58 23</a></p>\"}', 1, '2025-02-23 10:24:41', '2025-02-23 10:24:41', 'd8a3c0ac-fb17-42df-8160-f40fa02077ec'),
(53, 53, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-02-28 17:58:58', '2025-02-28 17:58:58', 'fa147848-492c-4c82-8c32-f0d7eb1a4f92'),
(54, 54, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-02-28 17:58:58', '2025-02-28 17:58:58', '58990eb5-d8c9-493f-810e-44ea87c5e4db'),
(55, 55, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-02-28 18:02:08', '2025-03-26 19:34:57', '58571f35-8935-4876-aa44-6f6541d00bd8'),
(56, 56, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"\", \"col2\": \"\"}]}', 1, '2025-02-28 18:02:08', '2025-02-28 18:02:08', '0b84b278-2afb-4494-b7b2-934036ca4bd4'),
(58, 58, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\"}', 1, '2025-02-28 18:05:30', '2025-02-28 18:05:30', 'd003a5ff-8339-42f1-858d-c07c2e6a29ff'),
(59, 59, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\"}', 1, '2025-02-28 18:18:04', '2025-02-28 18:18:04', 'aa044b5b-b821-40e2-ade1-5f4b836bf1c3'),
(61, 61, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"8f4c92f7-0cad-463d-a62c-34674a006fc9\": \"<p><u>!!! We gaan er even tussenuit !!!</u></p><p>We zijn gesloten vanaf zondat 16 januari tot en met woensdag 26 januari.</p>\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\"}', 1, '2025-02-28 18:21:13', '2025-02-28 18:21:13', 'e7825559-32f6-4581-966b-948b73e6d0a9'),
(63, 63, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"8f4c92f7-0cad-463d-a62c-34674a006fc9\": \"<p><u>!!! We gaan er even tussenuit !!!</u></p><p>We zijn gesloten vanaf zondat 16 januari tot en met woensdag 26 januari.</p>\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\", \"da74fc03-dc74-442a-9b1d-978df5e835f1\": true}', 1, '2025-02-28 18:25:14', '2025-02-28 18:25:14', 'acb2d3ae-1eed-4a44-97a2-f08755da5267'),
(65, 65, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"8f4c92f7-0cad-463d-a62c-34674a006fc9\": \"<p><u>!!! We gaan er even tussenuit !!!</u></p><p>We zijn gesloten vanaf zondat 16 januari tot en met woensdag 26 januari.</p>\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\", \"da74fc03-dc74-442a-9b1d-978df5e835f1\": false}', 1, '2025-02-28 18:46:02', '2025-02-28 18:46:02', '555b9581-2039-408c-8dee-133d606e894b'),
(67, 67, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"8f4c92f7-0cad-463d-a62c-34674a006fc9\": \"<p><u>!!! We gaan er even tussenuit !!!</u></p><p>We zijn gesloten vanaf zondat 16 januari tot en met woensdag 26 januari.</p>\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\", \"da74fc03-dc74-442a-9b1d-978df5e835f1\": true}', 1, '2025-02-28 18:47:59', '2025-02-28 18:47:59', '2bb0cf56-df52-400f-bf37-3e7e445d356f'),
(69, 69, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"8f4c92f7-0cad-463d-a62c-34674a006fc9\": \"<p><u>!!! We gaan er even tussenuit !!!</u></p><p>We zijn gesloten vanaf zondat 16 januari tot en met woensdag 26 januari.</p>\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\", \"da74fc03-dc74-442a-9b1d-978df5e835f1\": true}', 1, '2025-02-28 19:35:24', '2025-02-28 19:35:24', 'd8dd37e6-29d5-4100-bde5-5eb1cdda8343'),
(70, 70, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"8f4c92f7-0cad-463d-a62c-34674a006fc9\": \"<p><u>!!! We gaan er even tussenuit !!!</u></p><p>We zijn gesloten vanaf zondat 16 januari tot en met woensdag 26 januari.</p>\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\", \"da74fc03-dc74-442a-9b1d-978df5e835f1\": true}', 1, '2025-02-28 19:38:00', '2025-02-28 19:38:00', '033019e3-0c63-4b38-9ad5-2baa626cc64c'),
(71, 71, 1, 'Nacho’s (klein / groot)', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"cheddar, zure room en tomatensalsa\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 17:32:01', '2025-03-26 19:30:59', '33c291c3-1569-48ab-952d-a907a486dc61'),
(72, 72, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:32:01', '2025-03-02 17:32:01', '2eca12a8-e30f-4bcd-8fea-2cb5d55f747a'),
(77, 77, 1, 'Hapjes', 'ha', NULL, NULL, 1, '2025-03-02 17:33:51', '2025-03-02 17:33:51', 'd255f2e7-a6d9-4459-83e1-b0b7a0b45480'),
(79, 79, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:33:51', '2025-03-02 17:33:51', 'be24ecf8-8290-4a47-9332-2e0c9f9d6bf3'),
(80, 80, 1, 'Hapjes', 'ha', NULL, NULL, 1, '2025-03-02 17:33:51', '2025-03-02 17:33:51', '0981cd15-1361-42e9-b7b2-f898bfb34e48'),
(91, 91, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:35:59', '2025-03-02 17:35:59', '29f6a25b-ce9f-4b4c-bdeb-c17564086bc5'),
(96, 96, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:37:26', '2025-03-02 17:37:26', '2fd9536d-2dfe-4f4f-97e8-cb48b9759121'),
(99, 99, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:37:56', '2025-03-02 17:37:56', '2054ae59-0e2c-4094-a1da-4b7fa494c839'),
(100, 100, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:38:12', '2025-03-02 17:38:12', 'fb5084f9-835e-4cea-915c-bd564d938713'),
(102, 102, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:44:01', '2025-03-02 17:44:01', '71e25df6-9818-44f7-9b0b-1534a8f51677'),
(106, 106, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:46:42', '2025-03-02 17:46:42', 'c137ead3-c6fb-4ba4-a3e0-9707bc07f84a'),
(108, 108, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:48:33', '2025-03-02 17:48:33', '4032d540-f71c-4c86-812c-7efda648a70d'),
(111, 111, 1, 'Menu', 'menu', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 17:48:48', '2025-03-22 13:16:48', 'd5c7dc13-11b0-4f54-bce2-cb64a64b19c3'),
(112, 112, 1, 'Menu', 'menu', NULL, NULL, 1, '2025-03-02 17:49:02', '2025-03-02 17:49:02', '179ef93e-6dc3-4876-9e59-296911055423'),
(113, 113, 1, 'Menu', 'menu', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:01:15', '2025-03-22 13:16:49', '7c6ba4fe-18f9-4dbd-b820-6a49f76c7ec2'),
(115, 115, 1, 'Hapjes', 'menu', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:03:25', '2025-03-22 13:16:49', '65db362d-d3fc-4828-a9fa-59b0b7bf82cc'),
(119, 119, 1, 'Esko\'s snackbar', 'hapjes', NULL, '{\"2745aa45-b3be-4e68-98f6-18cfaa805be0\": \"homemade hapjes to fight for or to share\"}', 1, '2025-03-02 18:06:38', '2025-03-06 18:48:19', 'c2ffd6bf-c780-45d0-b923-0ce6fd73d843'),
(120, 120, 1, 'Hapjes', 'hapjes', NULL, NULL, 1, '2025-03-02 18:06:43', '2025-03-02 18:06:43', '6cf6cf8d-6204-420b-b898-4169ca775627'),
(121, 121, 1, 'Hapjes', 'hapjes', NULL, NULL, 1, '2025-03-02 18:06:45', '2025-03-02 18:06:45', '8930e908-a270-4fdb-967b-20a76d24282c'),
(122, 122, 1, 'Nacho’s met cheddar, zure room en tomatensalsa (klein/groot)', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"8 / 13\"}', 1, '2025-03-02 18:07:15', '2025-03-22 13:16:49', 'a62a7992-b570-4292-b49e-3a64657ac9b3'),
(123, 123, 1, 'Hapjes', 'hapjes', NULL, NULL, 1, '2025-03-02 18:07:27', '2025-03-02 18:07:27', '3b68588d-0590-434b-89b5-72816b7b240f'),
(124, 124, 1, 'Edamame', 'edamame', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"(hoisin-soja)\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:08:22', '2025-03-26 19:00:07', 'debb2b0a-69ae-4017-b910-65d717fd05fd'),
(125, 125, 1, 'Edamame', 'edamame', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"7\"}', 1, '2025-03-02 18:08:32', '2025-03-22 13:16:49', 'be221726-3110-4c61-ac65-37f71056427f'),
(126, 126, 1, 'Edamame', 'edamame', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"7\"}', 1, '2025-03-02 18:08:35', '2025-03-22 13:16:49', 'ccb33edd-7685-4ea8-80ee-6df4fae44d29'),
(127, 127, 1, 'Oosters gelakte kippenballetjes', 'oosters-gelakte-kipballetjes', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:08:41', '2025-03-26 19:00:31', '88f43b9e-99ac-4d03-973e-25ccf848767d'),
(128, 128, 1, 'Oosters gelakte kipballetjes', 'oosters-gelakte-kipballetjes', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9\"}', 1, '2025-03-02 18:08:55', '2025-03-22 13:16:49', '4bb84ceb-36a7-4603-b128-48e98dcf0305'),
(129, 129, 1, 'Oosters gelakte kipballetjes', 'oosters-gelakte-kipballetjes', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9\"}', 1, '2025-03-02 18:08:57', '2025-03-22 13:16:49', '27ab01aa-163f-462b-a944-335f59b067ed'),
(130, 130, 1, 'Onion rings', 'onion-rings-met-huisgemaakte-tartaar', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Esko\'s tartaar\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:09:03', '2025-03-26 19:30:09', '2a685cde-7246-41ed-bd70-9b6df13af9eb'),
(131, 131, 1, 'Onion rings met huisgemaakte tartaar', 'onion-rings-met-huisgemaakte-tartaar', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"8\"}', 1, '2025-03-02 18:09:17', '2025-03-22 13:16:49', 'd4d71932-e9df-4648-9f31-07a3b878458e'),
(132, 132, 1, 'Onion rings met huisgemaakte tartaar', 'onion-rings-met-huisgemaakte-tartaar', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"8\"}', 1, '2025-03-02 18:09:20', '2025-03-22 13:16:49', 'aabec3e0-fc2d-47a7-992d-d9b2856b385b'),
(133, 133, 1, 'Taco Asian pulled pork', 'taco-asian-pulled-pork', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:09:52', '2025-03-26 19:03:11', 'ea96dc5a-1b3d-4bc5-a139-6ba81c634b6b'),
(134, 134, 1, 'Taco Asian pulled pork', 'taco-asian-pulled-pork', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9\"}', 1, '2025-03-02 18:10:01', '2025-03-22 13:16:49', '3d8d12a9-d762-4c64-b6be-dc827b25bc83'),
(135, 135, 1, 'Taco Asian pulled pork', 'taco-asian-pulled-pork', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9\"}', 1, '2025-03-02 18:10:03', '2025-03-22 13:16:49', 'd780c9ff-0b3e-4e60-a8da-345cd7e72c17'),
(136, 136, 1, 'Vegan bitterbal', 'vegan-bitterballen-per-stuk', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:10:08', '2025-03-26 19:31:13', '8c45282b-deaf-4f4c-b22a-826c5d1ee599'),
(137, 137, 1, 'Vegan bitterballen (per stuk)', 'vegan-bitterballen-per-stuk', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"2\"}', 1, '2025-03-02 18:10:21', '2025-03-22 13:16:49', 'ce1515ca-0b62-452f-9082-dc76d309c23f'),
(138, 138, 1, 'Hamburgers', 'hamburgers', NULL, NULL, 1, '2025-03-02 18:10:28', '2025-03-02 18:10:43', '582992c4-c1e5-4269-b6a6-8bfa712583a0'),
(139, 139, 1, 'Hamburgers', 'hamburgers', NULL, NULL, 1, '2025-03-02 18:10:43', '2025-03-02 18:10:43', '771cc78e-3b97-4575-a38b-15a4093efa14'),
(140, 140, 1, 'Eskoburger', 'eskoburger', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:10:51', '2025-03-26 19:08:00', 'ff679053-644e-4746-a112-681b14c2a6d9'),
(141, 141, 1, 'Eskoburger', 'eskoburger', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"14\"}', 1, '2025-03-02 18:11:08', '2025-03-22 13:16:49', 'bb85aed4-474e-4749-b35e-1b0220504308'),
(142, 142, 1, 'Eskoburger', 'eskoburger', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"14\"}', 1, '2025-03-02 18:11:10', '2025-03-22 13:16:49', 'b7fdc4c8-50b8-4236-96b3-682330912630'),
(143, 143, 1, 'Eskoburger cheddar', 'eskoburger-cheddar', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:11:13', '2025-03-26 19:08:21', '5c3deb73-039b-4531-a908-36f4a7379be7'),
(144, 144, 1, 'Eskoburger cheddar', 'eskoburger-cheddar', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"14,5\"}', 1, '2025-03-02 18:11:28', '2025-03-22 13:16:49', '480412c6-3a30-4877-8e66-9829a80c44a5'),
(146, 146, 1, 'Eskoburger bacon', 'eskoburger-bacon', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:11:40', '2025-03-26 19:08:36', 'c41958fe-565d-4163-b7ee-7dd5f43b62f6'),
(147, 147, 1, 'Eskoburger bacon', 'eskoburger-bacon', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"15\"}', 1, '2025-03-02 18:11:45', '2025-03-22 13:16:49', '2158fd3c-119e-4db9-8134-47ad357365c8'),
(149, 149, 1, 'Eskoburger bacon', 'eskoburger-bacon', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"15\"}', 1, '2025-03-02 18:11:55', '2025-03-22 13:16:49', '5e4f24bf-3ec4-4777-8929-24c254497b2b'),
(151, 151, 1, 'Eskoburger full option', 'eskoburger-full-option', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:12:33', '2025-03-26 19:08:49', '416636d0-a76f-4b43-99fa-f30047842720'),
(152, 152, 1, 'Eskoburger full option', 'eskoburger-full-option', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"15,5\"}', 1, '2025-03-02 18:12:44', '2025-03-22 13:16:49', 'f44b8f9d-c7b4-4b37-946a-fb8d3108e5bb'),
(153, 153, 1, 'Gone fishing', 'mama-heeft-visjes-gebakken', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Noordzeevis, kruidenslaatje, furikake, hollandaise</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Mama heeft visjes gebakken\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:12:58', '2025-03-26 19:15:07', '183cc4fd-cbb4-4e98-bc25-085fdfe43ed6'),
(154, 154, 1, 'Mama heeft visjes gebakken', 'mama-heeft-visjes-gebakken', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Vangst van de dag, kruidenslaatje, wakame, hollandaisemayo</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"18\"}', 1, '2025-03-02 18:13:16', '2025-03-22 13:16:49', 'bc711ac4-5acd-4b68-b03b-7b94e78b655a'),
(155, 155, 1, 'Sides', 'wat-neem-je-bij-je-burger', NULL, NULL, 1, '2025-03-02 18:13:28', '2025-03-06 18:50:38', 'f00f4925-a673-43eb-82b1-d00ec74e965b'),
(156, 156, 1, 'Wat neem je bij je burger?', 'wat-neem-je-bij-je-burger', NULL, NULL, 1, '2025-03-02 18:13:34', '2025-03-02 18:13:34', '31c0ffc0-42ac-44c3-8941-b71d8818f736'),
(157, 157, 1, 'Handgesneden frieten', 'jacket-potato', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:13:46', '2025-03-26 19:20:00', '10bf560a-5cf4-4509-852f-bade78f5106a'),
(158, 158, 1, 'Jacket potato', 'jacket-potato', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>(gepofte aardappel in de schil) Zure room, cheddar, kruidenboter</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"5\"}', 1, '2025-03-02 18:14:04', '2025-03-22 13:16:49', 'b491ffad-44bc-4411-be6d-008a4c2d79ec'),
(159, 159, 1, 'Zoete aardappel frietjes', 'handgesneden-frieten', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:14:16', '2025-03-26 19:20:21', '02f31a37-cdd5-4e84-9a8a-5bad3f451d7c'),
(160, 160, 1, 'Handgesneden frieten', 'handgesneden-frieten', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"5\"}', 1, '2025-03-02 18:14:24', '2025-03-22 13:16:49', '48aa2ce4-d227-47e5-9dbd-c1b4b6d8e197'),
(161, 161, 1, 'One night in Bangkok', 'one-night-in-bangkok', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Thai style kippenburger, kaffir limoen, pinda, pittig slaatje, Thai mayo</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Thai\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"1\"}', 1, '2025-03-02 18:19:05', '2025-03-26 19:41:22', '9fbd8f46-49ec-4772-951f-f8a6e9ac3b26'),
(162, 162, 1, 'One night in Bangkok', 'one-night-in-bangkok', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Thai style kippenburger, koriander, kaffir limoen, pinda, pittig slaatje, Thaise mayo</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"18\"}', 1, '2025-03-02 18:20:28', '2025-03-22 13:16:49', 'e25f7665-0d92-45c8-9081-4c8b5ab14736'),
(163, 163, 1, 'One night in Bangkok', 'one-night-in-bangkok', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Thai style kippenburger, koriander, kaffir limoen, pinda, pittig slaatje, Thaise mayo</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Thai\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"18\"}', 1, '2025-03-02 18:21:55', '2025-03-02 18:21:55', 'e58628db-2273-4c2c-a285-32ed0c47b639'),
(165, 165, 1, 'One night in Bangkok', 'one-night-in-bangkok', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Thai style kippenburger, koriander, kaffir limoen, pinda, pittig slaatje, Thaise mayo</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Thai\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"1\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"18\"}', 1, '2025-03-02 18:21:59', '2025-03-02 18:21:59', 'c4be1507-0b38-4085-a3ea-a3c2e354b9b8'),
(167, 167, 1, 'Jacket potato', 'jacket-potato', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Zure room, cheddar, kruidenboter</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Gepofte aardappel in de schil\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"5\"}', 1, '2025-03-02 18:22:25', '2025-03-02 18:22:25', '72db1f97-ec77-48e2-a4b0-85bf9d86b454'),
(168, 168, 1, 'Voor de allerkleinsten', 'voor-de-allerkleinsten', NULL, NULL, 1, '2025-03-02 18:22:37', '2025-03-22 13:16:49', '9951f4c3-b3d3-4736-a800-7f3577444526'),
(169, 169, 1, 'Voor de allerkleinsten', 'voor-de-allerkleinsten', NULL, NULL, 1, '2025-03-02 18:22:40', '2025-03-02 18:22:40', '68862c56-7427-41cd-a2b2-639c8d7d2644'),
(170, 170, 1, 'Mini eskoburger met handgesneden frietjes', 'mini-eskoburger-met-handgesneden-frietjes', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-02 18:22:48', '2025-03-26 19:25:09', '51880c96-01ab-4603-9203-d65c83b9baae'),
(171, 171, 1, 'Mini eskoburger met handgesneden frietjes', 'mini-eskoburger-met-handgesneden-frietjes', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"10\"}', 1, '2025-03-02 18:23:04', '2025-03-02 18:23:04', '7544712e-6f72-4d55-8535-5d497d90b1a6'),
(173, 173, 1, 'Esko\'s snackbar', 'hapjes', NULL, NULL, 1, '2025-03-06 18:46:48', '2025-03-06 18:46:48', '33cfe15d-e719-4955-b068-7ee4ac654ac7'),
(175, 175, 1, 'Esko\'s snackbar', 'hapjes', NULL, '{\"2745aa45-b3be-4e68-98f6-18cfaa805be0\": \"homemade hapjes to fight for or to share\"}', 1, '2025-03-06 18:48:19', '2025-03-06 18:48:19', '2c027f0e-2106-4cb4-baae-9de844f0acc9'),
(177, 177, 1, 'Nacho’s met cheddar, zure room en tomatensalsa (klein/groot)', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9 / 17\"}', 1, '2025-03-06 18:48:40', '2025-03-06 18:48:40', '529ee4ef-8f7b-41f3-8166-5096cfb2634d'),
(179, 179, 1, 'Nacho’s met cheddar, zure room en tomatensalsa', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"(klein/groot)\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9 / 17\"}', 1, '2025-03-06 18:48:51', '2025-03-06 18:48:51', 'b24c7ad3-13cc-4458-aeab-c37b7fe51f2e'),
(181, 181, 1, 'Nacho’s met cheddar, zure room en tomatensalsa (klein/groot)', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9 / 17\"}', 1, '2025-03-06 18:49:04', '2025-03-06 18:49:04', 'db07fb31-6568-49fd-ace7-2439d301e2b8'),
(183, 183, 1, 'Nacho’s met cheddar, zure room en tomatensalsa', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"klein/groot\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9 / 17\"}', 1, '2025-03-06 18:49:22', '2025-03-06 18:49:22', 'b9b017c6-ad04-49cd-852b-8d28b9bb314b'),
(185, 185, 1, 'Nacho’s met cheddar, zure room en tomatensalsa (klein/groot)', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"9 / 17\"}', 1, '2025-03-06 18:49:41', '2025-03-06 18:49:41', 'fad2e1f4-133c-4101-b275-7497e611ba57'),
(187, 187, 1, 'Sides', 'wat-neem-je-bij-je-burger', NULL, NULL, 1, '2025-03-06 18:50:38', '2025-03-06 18:50:38', '59280138-83ee-480a-8a17-d56d0f065f19'),
(188, 188, 1, 'Sides', 'wat-neem-je-bij-je-burger', NULL, NULL, 1, '2025-03-06 18:50:54', '2025-03-06 18:50:54', '4d7ed8a7-ba48-4117-a09c-92e306fa9ca1'),
(189, 189, 1, 'Extra toppings', 'extra-toppings', NULL, NULL, 1, '2025-03-06 18:51:08', '2025-03-22 13:16:49', 'e3512527-279f-40f8-9e00-1c09c1c02828'),
(190, 190, 1, 'Extra toppings', 'extra-toppings', NULL, NULL, 1, '2025-03-06 18:51:17', '2025-03-06 18:51:17', '03900b55-ca4f-4436-8e50-c852b82b8448'),
(192, 192, 1, 'Spek', 'spek', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-06 18:51:56', '2025-03-26 19:24:05', '85d518d1-e0be-4983-ab56-45e68b8e41f2'),
(193, 193, 1, 'Spek', 'spek', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"2\"}', 1, '2025-03-06 18:51:57', '2025-03-06 18:51:57', 'af6aeda7-dcd3-42d2-9335-5ae5dbcbfe18'),
(195, 195, 1, 'Jalapeños', 'jalapeños', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-06 18:52:22', '2025-03-26 19:24:19', 'eaed5b05-8a94-4281-a04c-d3f3ce3c7d90'),
(196, 196, 1, 'Jalapeños', 'jalapeños', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"1\"}', 1, '2025-03-06 18:52:24', '2025-03-06 18:52:24', '85940910-ad79-4666-93d3-7af984425cd2'),
(198, 198, 1, 'Spiegelei', 'spiegelei', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-06 18:52:39', '2025-03-26 19:24:34', '0426c887-2086-44f6-a015-9bec886a45b8'),
(199, 199, 1, 'Spiegelei', 'spiegelei', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"2\"}', 1, '2025-03-06 18:52:40', '2025-03-06 18:52:40', '6e994cc2-3389-4696-a2d3-180e0a653338'),
(200, 200, 1, 'Jacket potato', 'jacket-potato', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Zure room, cheddar, kruidenboter</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"5\"}', 1, '2025-03-10 18:55:46', '2025-03-10 18:55:46', '42b68b48-3c1f-4c04-919e-81b1161f84c6'),
(202, 202, 1, 'Gone fishing', 'mama-heeft-visjes-gebakken', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Vangst van de dag, kruidenslaatje, wakame, hollandaisemayo</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Mama heeft visjes gebakken\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"18\"}', 1, '2025-03-10 19:25:42', '2025-03-10 19:25:42', '90e518dd-4f9b-4734-8d61-03844df51856'),
(206, 206, 1, 'Wij zijn er even tussenuit!', 'wij-zijn-er-even-tussenuit', NULL, '{\"355db1fa-c4f1-4c30-b027-2c772e449390\": \"<p>Lorem ipsum dolores</p><p>Lorem ipsum enzovoort</p>\"}', 1, '2025-03-20 19:24:57', '2025-03-20 19:24:57', 'cb4d6c15-eb77-4a1c-81a9-8e612255fc2d'),
(207, 207, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\", \"da74fc03-dc74-442a-9b1d-978df5e835f1\": true}', 1, '2025-03-20 19:24:57', '2025-03-20 19:24:57', '1cbe37b0-1c6a-4e22-80bd-85c6d6886a53'),
(208, 208, 1, 'Wij zijn er even tussenuit!', 'wij-zijn-er-even-tussenuit', NULL, '{\"355db1fa-c4f1-4c30-b027-2c772e449390\": \"<p>Lorem ipsum dolores</p><p>Lorem ipsum enzovoort</p>\"}', 1, '2025-03-20 19:24:57', '2025-03-20 19:24:57', '88c8615c-3dd8-4e2e-b534-10f514428244'),
(209, 209, 1, 'Menu', 'menu', 'menu', NULL, 1, '2025-03-22 10:21:59', '2025-03-23 11:39:18', 'd826186e-c2a2-4aad-8699-60c185f0295e'),
(210, 210, 1, 'Tijdelijke pagina', 'tijdelijke-pagina', 'temp', NULL, 1, '2025-03-22 10:21:59', '2025-03-22 10:21:59', '41d6d6af-2a96-4804-b0ac-4e7a12da1e82'),
(212, 212, 1, 'Snel online!', 'tijdelijke-pagina', 'temp', NULL, 1, '2025-03-22 10:22:14', '2025-03-22 10:22:14', 'bb91d108-47e8-40f9-b5ee-2c1376b0f5ba'),
(213, 213, 1, 'Snel online!', 'tijdelijke-pagina', 'temp', NULL, 1, '2025-03-22 10:48:04', '2025-03-22 10:48:04', '8c5d079a-e631-46a4-9fa5-ecf9d4fe7e9c'),
(214, 214, 1, 'De eerste echte burgerbar in Geel', 'home', 'home', NULL, 1, '2025-03-22 10:50:00', '2025-03-22 10:51:32', 'd7637789-a6c4-4f47-875d-47c8de89ef1f'),
(215, 215, 1, 'Snel online!', 'tijdelijke-pagina', '__home__', NULL, 1, '2025-03-22 10:50:03', '2025-03-22 10:50:03', '10c78c0b-d38b-48d7-9f2a-2e797c29efa9'),
(216, 216, 1, 'De eerste echte burgerbar in Geel', 'home', 'home', NULL, 1, '2025-03-22 10:51:31', '2025-03-22 10:51:31', '0cc21175-da87-41a3-984c-200fd79180ba'),
(217, 217, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Een burgerbar voor iedereen, of je nu je burger met je handen eet of met mes en vork, of je nu houdt van vlees, vis of vegetarisch.</p>\\n<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!</p>\\n<p>Eet je liever iets anders?<br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\\n<p>Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\\n<p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-03-22 10:51:31', '2025-03-22 10:51:31', '6f82a88d-50af-476d-9258-7f8836048ea6'),
(218, 218, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-03-22 10:51:32', '2025-03-22 10:51:32', 'f81e2bc9-f2e9-4d70-9079-4b4b6f28a9e6'),
(219, 219, 1, NULL, '__temp_xucslydrjzplwtharqwfutrcvebewtoxmsuq', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Reservatie voor dezelfde dag nog, graag even via de telefoon<br /><a href=\\\"tel:014585823\\\">014/58 58 23</a></p>\"}', 1, '2025-03-22 10:51:32', '2025-03-22 10:51:32', 'a67b16f5-2e7b-4504-9134-d7a2fef39e1f'),
(220, 220, 1, 'De eerste echte burgerbar in Geel', 'home', 'home', NULL, 1, '2025-03-22 10:51:32', '2025-03-22 10:51:32', '4ad8291b-b4d5-41c7-a349-d27a91593a2d'),
(221, 221, 1, 'De eerste echte burgerbar in Geel', 'home', 'home', NULL, 1, '2025-03-22 13:16:46', '2025-03-22 13:16:46', '4feca5ac-5682-4da3-a579-be7d5c119aa5'),
(222, 222, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Een burgerbar voor iedereen, of je nu je burger met je handen eet of met mes en vork, of je nu houdt van vlees, vis of vegetarisch.</p>\\n<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!</p>\\n<p>Eet je liever iets anders?<br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\\n<p>Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\\n<p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-03-22 13:16:46', '2025-03-22 13:16:46', 'd44e6804-e03f-4809-9c70-7b8f816f5a24'),
(223, 223, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-03-22 13:16:46', '2025-03-22 13:16:46', '6078777a-1532-47b8-9316-a0ddd6ab96fb'),
(224, 224, 1, NULL, '__temp_xucslydrjzplwtharqwfutrcvebewtoxmsuq', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Reservatie voor dezelfde dag nog, graag even via de telefoon<br /><a href=\\\"tel:014585823\\\">014/58 58 23</a></p>\"}', 1, '2025-03-22 13:16:46', '2025-03-22 13:16:46', '5c941ec3-ae12-4845-bcf6-6e3957019ba2'),
(225, 225, 1, 'Snel online!', 'tijdelijke-pagina', 'menu', NULL, 1, '2025-03-22 13:16:46', '2025-03-22 13:16:46', 'e36e92c1-567e-40de-9854-f9de59826fa2'),
(226, 226, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\", \"da74fc03-dc74-442a-9b1d-978df5e835f1\": true}', 1, '2025-03-22 13:18:36', '2025-03-22 13:18:36', '16191262-871b-48c9-912c-d34845da6cb5'),
(227, 227, 1, 'Wij zijn er even tussenuit!', 'wij-zijn-er-even-tussenuit', NULL, '{\"355db1fa-c4f1-4c30-b027-2c772e449390\": \"<p>Lorem ipsum dolores</p><p>Lorem ipsum enzovoort</p>\"}', 1, '2025-03-22 13:18:37', '2025-03-22 13:18:37', 'f2d83d99-7e25-4a3d-962a-ed5374763b58'),
(228, 228, 1, 'Snel online!', 'tijdelijke-pagina', 'menu', NULL, 1, '2025-03-22 13:18:37', '2025-03-22 13:18:37', 'e58ed3d2-4587-44e1-ac37-6dbc3b6ab3a9'),
(229, 229, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-03-22 13:18:41', '2025-03-22 13:18:41', 'de51d627-d212-4fbf-8216-b84579abfb09'),
(230, 230, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Een burgerbar voor iedereen, of je nu je burger met je handen eet of met mes en vork, of je nu houdt van vlees, vis of vegetarisch.</p>\\n<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!</p>\\n<p>Eet je liever iets anders?<br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\\n<p>Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\\n<p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-03-22 13:18:41', '2025-03-22 13:18:41', '11cf9ba3-1849-4cde-861a-4f3a9734a585'),
(231, 231, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-03-22 13:18:41', '2025-03-22 13:18:41', '8b658420-7b4e-48bc-b76d-32837effcae5');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(232, 232, 1, NULL, '__temp_xucslydrjzplwtharqwfutrcvebewtoxmsuq', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Reservatie voor dezelfde dag nog, graag even via de telefoon<br /><a href=\\\"tel:014585823\\\">014/58 58 23</a></p>\"}', 1, '2025-03-22 13:18:41', '2025-03-22 13:18:41', 'b05d24f5-205e-4f13-972c-a3cfed613ace'),
(236, 236, 1, NULL, '__temp_cofdgpfpljovvjrtszbewmdkolsngbjthyqs', NULL, NULL, 1, '2025-03-22 13:19:31', '2025-04-01 14:13:22', '2a5b6139-dc17-4104-881c-a86a86a9bb92'),
(237, 237, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-03-22 13:19:31', '2025-03-22 13:19:31', '8a601c96-a4ce-4364-9335-6699c8dc1c45'),
(238, 238, 1, NULL, '__temp_cofdgpfpljovvjrtszbewmdkolsngbjthyqs', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Binnenkort vind je hier weer alle nodige info!</p>\"}', 1, '2025-03-22 13:19:31', '2025-03-22 13:19:31', '3ebce86b-dbb0-4897-982d-8d856b22b0da'),
(239, 239, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Een burgerbar voor iedereen, of je nu je burger met je handen eet of met mes en vork, of je nu houdt van vlees, vis of vegetarisch.</p>\\n<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!</p>\\n<p>Eet je liever iets anders?<br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\\n<p>Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\\n<p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-03-22 13:19:31', '2025-03-22 13:19:31', 'f981e249-5be7-4d7d-9fcc-75843c0f6bd7'),
(242, 242, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-03-22 13:19:41', '2025-03-22 13:19:41', '5bca0b10-0bcf-42d4-97a2-a36bdaf206ec'),
(243, 243, 1, NULL, '__temp_xucslydrjzplwtharqwfutrcvebewtoxmsuq', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Reservatie voor dezelfde dag nog, graag even via de telefoon<br /><a href=\\\"tel:014585823\\\">014/58 58 23</a></p>\"}', 1, '2025-03-22 13:19:41', '2025-03-22 13:19:41', '754896fa-aea5-4812-aa6c-be93c3a9e3b6'),
(246, 246, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-03-22 13:24:49', '2025-03-22 13:24:49', 'bef16fb3-18ec-4d7e-b585-11e7a7f97e27'),
(247, 247, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-03-22 13:24:49', '2025-03-22 13:24:49', '89bc5489-e41b-4f0f-960c-f3eb7d3b4f75'),
(250, 250, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-03-22 13:25:09', '2025-03-22 13:25:09', 'd80585c3-934d-47a7-9f89-73bb83f66be3'),
(251, 251, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-03-22 13:25:09', '2025-03-22 13:25:09', '013006fc-ff8e-42af-9e7a-fe49edbd1510'),
(252, 252, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\"}', 1, '2025-03-23 11:38:24', '2025-03-23 11:38:24', 'fc8aefd9-5f32-4da0-bd3d-50188441749a'),
(253, 253, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\"}', 1, '2025-03-23 11:38:32', '2025-03-23 11:38:32', 'a3d8c62f-16c7-4f34-9309-631582846c7c'),
(255, 255, 1, 'Menu', 'menu', 'menu', NULL, 1, '2025-03-23 11:39:18', '2025-03-23 11:39:18', '3ef5b87c-f13b-445b-8bec-c441320758ac'),
(256, 256, 1, 'Edamame', 'edamame', NULL, '{\"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"7\"}', 1, '2025-03-23 14:57:55', '2025-03-23 14:57:55', '394d2f37-4490-4dcb-ae51-a31483b73f8e'),
(257, 257, 1, 'Edamame', 'edamame', NULL, '{\"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"7\"}', 1, '2025-03-23 14:58:02', '2025-03-23 14:58:02', 'df425de3-b1d1-4d40-9cd4-655d23ff1216'),
(261, 261, 1, 'Kippenboutje', 'kippenboutjes', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Singapore style\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-24 15:11:58', '2025-03-26 19:03:56', '283cb72f-4bee-4075-9f9f-1227db4b1787'),
(262, 262, 1, 'kippenboutjes', 'kippenboutjes', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Singapore style\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"12\"}', 1, '2025-03-24 15:12:17', '2025-03-24 15:12:17', '3382ccf2-5386-4e9e-b8c0-b64c60ca5519'),
(264, 264, 1, 'kippenboutjes', 'kippenboutjes', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Singapore style\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"12\"}', 1, '2025-03-24 15:13:54', '2025-03-24 15:13:54', '8b1082bf-a7cd-4e91-9e51-d02648f8dfa4'),
(265, 265, 1, 'Gyoza\'s paddestoel', 'gyozas', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"soja dipsaus (V)\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-24 15:14:11', '2025-03-26 19:40:16', 'fef12360-9471-4fb8-a6b9-1035288cacd9'),
(266, 266, 1, 'Gyoza\'s', 'gyozas', NULL, '{\"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"12\"}', 1, '2025-03-24 15:14:39', '2025-03-24 15:14:39', '2d3d0126-af76-495b-ae2f-f2b36188010f'),
(267, 267, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\"}', 1, '2025-03-24 16:45:05', '2025-03-24 16:45:05', '1bd9b18a-8065-4a34-9f28-4db8b0315258'),
(268, 268, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\"}', 1, '2025-03-24 16:45:53', '2025-03-24 16:45:53', 'f8da8faa-4ee8-4b39-8348-e91f06996e47'),
(269, 269, 1, 'Menu', 'menu', 'menu', NULL, 1, '2025-03-24 17:58:31', '2025-03-24 17:58:31', '8113b922-08d1-4816-afbc-3c5b765d3026'),
(270, 270, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 014585823\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"014/58 58 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"info@eskobar.be\"}', 1, '2025-03-24 17:58:31', '2025-03-24 17:58:31', '61a41299-f484-4bc7-856a-58e31d00a043'),
(272, 272, 1, 'Edamame', 'edamame', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"(hoisin-soja)\"}', 1, '2025-03-26 19:00:07', '2025-03-26 19:00:07', '4adae04d-7a57-4d60-8581-08973534a678'),
(274, 274, 1, 'Nacho’s met cheddar, zure room en tomatensalsa (klein/groot)', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, NULL, 1, '2025-03-26 19:00:17', '2025-03-26 19:00:17', '1a238b3f-1048-4645-8503-0e2d7f0ecc8c'),
(276, 276, 1, 'Oosters gelakte kippenballetjes', 'oosters-gelakte-kipballetjes', NULL, NULL, 1, '2025-03-26 19:00:31', '2025-03-26 19:00:31', '680eb520-97be-4a12-baf7-4bbeb2ae71f1'),
(278, 278, 1, 'Onion rings / Esko\'s tartaar', 'onion-rings-met-huisgemaakte-tartaar', NULL, NULL, 1, '2025-03-26 19:02:58', '2025-03-26 19:02:58', '0b7aabdf-bcd2-4137-99f6-b46b9b9bedd5'),
(280, 280, 1, 'Taco Asian pulled pork', 'taco-asian-pulled-pork', NULL, NULL, 1, '2025-03-26 19:03:11', '2025-03-26 19:03:11', 'afcb89a7-4694-4243-b896-84a2490d8a6d'),
(282, 282, 1, 'Vegan bitterbal (per stuk)', 'vegan-bitterballen-per-stuk', NULL, NULL, 1, '2025-03-26 19:03:32', '2025-03-26 19:03:32', '3ad4ca46-4758-44af-baf3-d0ebfe931126'),
(284, 284, 1, 'Kippenboutje', 'kippenboutjes', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Singapore style\"}', 1, '2025-03-26 19:03:56', '2025-03-26 19:03:56', 'ebbb859b-5e9f-448e-b11f-e66f8a05880d'),
(286, 286, 1, 'Gyoza\'s paddestoel', 'gyozas', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"soja dipsaus (V)\", \"f330bbb9-8719-455e-8670-c9cecff46d3f\": \"12\"}', 1, '2025-03-26 19:04:30', '2025-03-26 19:04:30', 'ebd6078a-ce5d-4c77-a364-f230d1d34818'),
(287, 287, 1, 'Pastrami', 'pastrami-toast-mosterdzaad', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"toast / mosterdzaad\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:04:34', '2025-03-26 19:29:50', '9d0615ad-5a5f-4d05-a3d1-59730a5dacdd'),
(288, 288, 1, 'Pastrami / toast / mosterdzaad', 'pastrami-toast-mosterdzaad', NULL, NULL, 1, '2025-03-26 19:05:13', '2025-03-26 19:05:13', '51442401-2eda-4a71-b417-f930d0a5a321'),
(289, 289, 1, 'Kimchi', 'kimchi', NULL, NULL, 1, '2025-03-26 19:05:21', '2025-03-26 19:05:38', '4d1f12e7-abf4-4264-8c27-a8ae4b26332c'),
(290, 290, 1, 'Kimchi', 'kimchi', NULL, NULL, 1, '2025-03-26 19:05:38', '2025-03-26 19:05:38', '7bf7806b-f025-4892-ad14-794a83171ef2'),
(291, 291, 1, 'Rendangkroketjes', 'rendangkroketjes-bergamot', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"bergamot\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:05:43', '2025-03-26 19:31:57', '60886689-acc6-44f0-9b94-d147aa5a9df9'),
(292, 292, 1, 'Rendangkroketjes / bergamot', 'rendangkroketjes-bergamot', NULL, NULL, 1, '2025-03-26 19:06:07', '2025-03-26 19:06:07', '8bc34877-809d-47aa-990c-e931cfbf3d3e'),
(293, 293, 1, 'Dahl - paratha (V)', 'dahl-paratha-v', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:06:18', '2025-03-26 19:25:56', '4ae79b90-7218-470e-ab11-7da16f35f121'),
(294, 294, 1, 'Dahl - paratha (V)', 'dahl-paratha-v', NULL, NULL, 1, '2025-03-26 19:06:32', '2025-03-26 19:06:32', '36ddcbd8-ba6b-449f-96cc-ffcedad75f2d'),
(296, 296, 1, 'Eskoburger', 'eskoburger', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:08:00', '2025-03-26 19:08:00', '0c44ad00-6762-4e5b-a8e2-1e717544239d'),
(298, 298, 1, 'Eskoburger cheddar', 'eskoburger-cheddar', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:08:21', '2025-03-26 19:08:21', '56c68c63-6948-4cea-89f7-3c5c651e4b3e'),
(300, 300, 1, 'Eskoburger bacon', 'eskoburger-bacon', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:08:36', '2025-03-26 19:08:36', '1cb6f5c2-c274-48dc-8e97-58447f7697ad'),
(302, 302, 1, 'Eskoburger full option', 'eskoburger-full-option', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:08:49', '2025-03-26 19:08:49', '6c615d92-c8ed-4d0a-8e21-993db6d719a0'),
(303, 303, 1, 'Miss Piggy', 'miss-piggy', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Pulled pork, koolsla, huisgemaakte bbq-saus</p>\"}', 1, '2025-03-26 19:09:21', '2025-03-26 19:09:57', '6900cb7c-6b63-4fae-b6a7-0ac9ebbdfc21'),
(304, 304, 1, 'Miss Piggy', 'miss-piggy', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Pulled pork, koolsla, huisgemaakte bbq-saus</p>\"}', 1, '2025-03-26 19:09:57', '2025-03-26 19:09:57', '45f4e604-7687-4297-bf02-eafe6369f9e8'),
(305, 305, 1, 'Double Trouble', 'double-trouble', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, pulled pork, groenten en saus van Eskoburger of Miss Piggy </p>\"}', 1, '2025-03-26 19:10:00', '2025-03-26 19:10:52', 'cf9d04b4-4d63-4e58-9af6-a0bf61edb9ef'),
(306, 306, 1, 'Double Trouble', 'double-trouble', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, pulled pork, groenten en saus van Eskoburger of Miss Piggy </p>\"}', 1, '2025-03-26 19:10:51', '2025-03-26 19:10:51', '3e6472a0-a7ce-49ab-a771-169fa7f16341'),
(307, 307, 1, 'The Godfather', 'the-godfather', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, mozzarella, ham, gremolata, oventomaatjes, crème van tomaat</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Italiaan\"}', 1, '2025-03-26 19:10:54', '2025-03-26 19:11:50', '7259a916-54db-4c90-a094-f421df1755ef'),
(308, 308, 1, 'The Godfather', 'the-godfather', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, mozzarella, ham, gremolata, oventomaatjes, crème van tomaat</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Italiaan\"}', 1, '2025-03-26 19:11:50', '2025-03-26 19:11:50', '1654fa6f-f89a-40e1-8cb0-5fb109d6fb46'),
(309, 309, 1, 'El Mariachi', 'el-mariachi', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, guacamole, zure room, tomatensalsa, jalapeños, rode ui</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Mexicaan\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:11:56', '2025-03-26 19:40:51', 'b0003651-375a-40a7-96ba-cc24a8dd6f2c'),
(310, 310, 1, 'El Mariachi', 'el-mariachi', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, guacamole, zure room, nacho, tomatensalsa, jalapeños, rode ui</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Mexicaan\"}', 1, '2025-03-26 19:14:21', '2025-03-26 19:14:21', '4f0255b2-3e5f-4067-884d-0f81bed1b177'),
(312, 312, 1, 'Gone fishing', 'mama-heeft-visjes-gebakken', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Noordzeevis, kruidenslaatje, furikake, hollandaise</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Mama heeft visjes gebakken\"}', 1, '2025-03-26 19:15:07', '2025-03-26 19:15:07', 'd7572c5c-9013-4699-b597-4655f59daff6'),
(313, 313, 1, 'Eskoburger', 'eskoburger', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:15:15', '2025-03-26 19:15:15', '0922a92a-9f7b-49eb-a5be-5cee1c59d037'),
(314, 314, 1, 'Eskoburger cheddar', 'eskoburger-cheddar', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:15:22', '2025-03-26 19:15:22', '231fb590-5f0f-4509-9bcf-832a1cb4a5c8'),
(315, 315, 1, 'Eskoburger bacon', 'eskoburger-bacon', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:15:28', '2025-03-26 19:15:28', 'e5668231-e407-4bc2-b13f-de354c6c9c93'),
(316, 316, 1, 'Eskoburger full option', 'eskoburger-full-option', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:15:35', '2025-03-26 19:15:35', '7c673094-c2ec-4191-b4cc-99f3531f7f63'),
(317, 317, 1, 'Gone fishing', 'mama-heeft-visjes-gebakken', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Noordzeevis, kruidenslaatje, furikake, hollandaise</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Mama heeft visjes gebakken\"}', 1, '2025-03-26 19:15:47', '2025-03-26 19:15:47', 'd235d8fa-ce7f-43b1-81e4-7d4801805538'),
(319, 319, 1, 'One night in Bangkok', 'one-night-in-bangkok', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Thai style kippenburger, koriander, kaffir limoen, pinda, pittig slaatje, Thai mayo</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Thai\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"1\"}', 1, '2025-03-26 19:16:22', '2025-03-26 19:16:22', 'd9e2b610-6787-434e-acad-488d9614d3e2'),
(320, 320, 1, 'Gangnam Style', 'gangnam-style', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, Korean style, daikon, kimchi, bulgogi, chili mayo</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Koreaan\"}', 1, '2025-03-26 19:16:32', '2025-03-26 19:17:39', '8aff5d06-00d7-4761-88db-14bbbd981b89'),
(321, 321, 1, 'Gangnam Style', 'gangnam-style', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, Korean style, daikon, kimchi, bulgogi, chili mayo</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Koreaan\"}', 1, '2025-03-26 19:17:38', '2025-03-26 19:17:38', '8c448750-71c5-4068-8e3a-d6e61789a842'),
(322, 322, 1, 'Halloumi', 'halloumi', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Gefrituurde halloumi, slaatje, gegrilde groenten, yoghurt za\'atar /sumak</p>\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:17:42', '2025-04-01 14:09:21', '4a88d634-c316-4434-98ca-65a26bdba2e0'),
(323, 323, 1, 'Halloumi', 'halloumi', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Gefrituurde halloumi, fris slaatje, granaatappel, gegrilde groenten, yoghurt za\'atar /sumak</p>\"}', 1, '2025-03-26 19:18:36', '2025-03-26 19:18:36', 'f60c671d-c112-4ca2-bc75-55afb12c12c3'),
(324, 324, 1, 'Huisgemaakte veggieschijf', 'huisgemaakte-veggieschijf', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Kies een burger, wij maken \'m veggie</p>\"}', 1, '2025-03-26 19:18:39', '2025-03-26 19:19:18', 'eb6da03c-7109-4436-a8a9-f7cd8a01002e'),
(325, 325, 1, 'Huisgemaakte veggieschijf', 'huisgemaakte-veggieschijf', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Kies een burger, wij maken \'m veggie</p>\"}', 1, '2025-03-26 19:19:18', '2025-03-26 19:19:18', 'ebe807ed-9266-43a0-a4e5-87420eecbe1b'),
(327, 327, 1, 'Handgesneden frieten', 'jacket-potato', NULL, NULL, 1, '2025-03-26 19:20:00', '2025-03-26 19:20:00', 'eadf4e80-d0cb-4623-8fea-1ab52783fecc'),
(329, 329, 1, 'Zoete aardappel frietjes', 'handgesneden-frieten', NULL, NULL, 1, '2025-03-26 19:20:21', '2025-03-26 19:20:21', '6d30d7b0-4ff5-4375-9ace-2130cb4e9a89'),
(330, 330, 1, 'Ovenaardappeltjes', 'ovenaardappeltjes', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"(tijm, rozemarijn en look)\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:20:30', '2025-03-26 19:35:24', 'ad684e13-9fb8-49f1-b817-e2a9e8f2101a'),
(331, 331, 1, 'Ovenaardappeltjes', 'ovenaardappeltjes', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"(tijm, rozemarijen en look)\"}', 1, '2025-03-26 19:20:59', '2025-03-26 19:20:59', 'd80a6e39-639d-4dcb-8756-8e7634cac226'),
(332, 332, 1, 'Chili fries', 'chili-fries', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>(kan ook veggie)</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"friet, chili con carne, cheddar, aioli, jalapeños\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:21:06', '2025-03-26 19:46:16', 'ea21966b-b4d1-40c1-ba1a-635a952cb839'),
(333, 333, 1, 'Chili fries', 'chili-fries', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>frietjes, chili con carne, cheddar, aioli, jalapeños / veggie </p>\"}', 1, '2025-03-26 19:22:38', '2025-03-26 19:22:38', '26cd76c8-b854-468d-97c9-784fc557fc3c'),
(334, 334, 1, 'Loaded sweet potato fries', 'loaded-sweet-potato-fries', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Korean style (V)\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:22:41', '2025-03-26 19:45:51', '339684e8-781e-4cc0-a102-fb8d5bbb07f1'),
(335, 335, 1, 'Loaded sweet potato fries', 'loaded-sweet-potato-fries', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"- Korean style\"}', 1, '2025-03-26 19:23:26', '2025-03-26 19:23:26', '1ff34a9a-e4ca-4d02-898c-506db555ae78'),
(336, 336, 1, 'Slaatje van\'t moment', 'slaatje-vant-moment', NULL, NULL, 1, '2025-03-26 19:23:28', '2025-03-26 19:23:44', '41d32a15-4594-45ea-8a65-68e8092f5b8b'),
(337, 337, 1, 'Slaatje van\'t moment', 'slaatje-vant-moment', NULL, NULL, 1, '2025-03-26 19:23:44', '2025-03-26 19:23:44', '89f0d7f6-7ce4-404b-aae4-d03d8e8c3e80'),
(339, 339, 1, 'Spek', 'spek', NULL, NULL, 1, '2025-03-26 19:24:05', '2025-03-26 19:24:05', '8d512037-e762-4659-b2ff-ea17365bff1d'),
(341, 341, 1, 'Jalapeños', 'jalapeños', NULL, NULL, 1, '2025-03-26 19:24:19', '2025-03-26 19:24:19', '086ffa52-d7cb-4a1b-80e5-62be43da3c43'),
(343, 343, 1, 'Spiegelei', 'spiegelei', NULL, NULL, 1, '2025-03-26 19:24:34', '2025-03-26 19:24:34', 'bae30a7b-53f1-475d-9578-b63488a1df1f'),
(344, 344, 1, 'Kaas', 'kaas', NULL, NULL, 1, '2025-03-26 19:24:37', '2025-03-26 19:24:49', 'c150b389-5f12-43da-9ae4-f63d3365fc7c'),
(345, 345, 1, 'Kaas', 'kaas', NULL, NULL, 1, '2025-03-26 19:24:48', '2025-03-26 19:24:48', 'b5f26eb2-3ddc-4be7-9c22-386ac18c0fb8'),
(347, 347, 1, 'Mini eskoburger met handgesneden frietjes', 'mini-eskoburger-met-handgesneden-frietjes', NULL, NULL, 1, '2025-03-26 19:25:09', '2025-03-26 19:25:09', '4c4d8744-ff1b-4492-a81b-c20fdfeaaf73'),
(348, 348, 1, 'Mini fish\'n chips', 'mini-fishn-chips', NULL, NULL, 1, '2025-03-26 19:25:11', '2025-03-26 19:25:36', '69fca142-eb25-4a4f-ac95-f18ae0228020'),
(349, 349, 1, 'Mini fish\'n chips', 'mini-fishn-chips', NULL, NULL, 1, '2025-03-26 19:25:36', '2025-03-26 19:25:36', 'de0f1060-ece3-4edc-ba13-20e48ea68968'),
(351, 351, 1, 'Dahl - paratha (V)', 'dahl-paratha-v', NULL, NULL, 1, '2025-03-26 19:25:55', '2025-03-26 19:25:55', '1ad1be9e-5e85-4a29-b436-057ca518533e'),
(352, 352, 1, 'No Burger today?', 'no-burger-today', NULL, NULL, 1, '2025-03-26 19:26:12', '2025-03-26 19:26:25', '5fca3501-1b7f-463a-99d7-569e941a8e34'),
(353, 353, 1, 'No Burger today?', 'no-burger-today', NULL, NULL, 1, '2025-03-26 19:26:25', '2025-03-26 19:26:25', 'fc403c69-eb33-41f9-936f-c4c0fc65d118'),
(354, 354, 1, 'Fish\'n chips met Esko\'s tartaar', 'fishn-chips-met-eskos-tartaar', NULL, '{\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"\"}', 1, '2025-03-26 19:26:31', '2025-03-26 19:26:56', 'afbe8401-7282-4089-9e09-18d4c2b776b6'),
(355, 355, 1, 'Fish\'n chips met Esko\'s tartaar', 'fishn-chips-met-eskos-tartaar', NULL, NULL, 1, '2025-03-26 19:26:56', '2025-03-26 19:26:56', '3d9aac4d-ba5a-48a2-bb87-1ed7dc5f8b7c'),
(356, 356, 1, 'Dahl - paratha', 'dahl-paratha', NULL, NULL, 1, '2025-03-26 19:26:58', '2025-03-26 19:27:18', '0f1f0bcf-79d7-4528-9241-19a62d2f3319'),
(357, 357, 1, 'Dahl - paratha', 'dahl-paratha', NULL, NULL, 1, '2025-03-26 19:27:17', '2025-03-26 19:27:17', '44b1d75e-5a66-4703-8704-3ea1b3e3c51a'),
(359, 359, 1, 'Pastrami', 'pastrami-toast-mosterdzaad', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"toast / mosterdzaad\"}', 1, '2025-03-26 19:29:50', '2025-03-26 19:29:50', '40d15c5b-ed52-45ab-91ed-d30d38d9edcc'),
(361, 361, 1, 'Onion rings', 'onion-rings-met-huisgemaakte-tartaar', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Esko\'s tartaar\"}', 1, '2025-03-26 19:30:09', '2025-03-26 19:30:09', '022e0b1a-eab3-4125-843a-8b131cbe77a4'),
(363, 363, 1, 'Nacho’s (klein / groot)', 'nachos-met-cheddar-zure-room-en-tomatensalsa-klein-groot', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"cheddar, zure room en tomatensalsa\"}', 1, '2025-03-26 19:30:59', '2025-03-26 19:30:59', 'f0eff28f-c192-4aeb-9ad1-cc6404cd2ffa'),
(365, 365, 1, 'Vegan bitterbal', 'vegan-bitterballen-per-stuk', NULL, NULL, 1, '2025-03-26 19:31:13', '2025-03-26 19:31:13', '5ed1aab1-bd57-492f-bf8e-7f3b3d5a9586'),
(367, 367, 1, 'Rendangkroketjes', 'rendangkroketjes-bergamot', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"bergamot\"}', 1, '2025-03-26 19:31:57', '2025-03-26 19:31:57', '5ea15954-d372-4a6d-ac31-8d2f7af43858'),
(368, 368, 1, 'Chili fries', 'chili-fries', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>frietjes, chili con carne, cheddar, aioli, jalapeños / veggie </p>\"}', 1, '2025-03-26 19:32:20', '2025-03-26 19:32:20', 'f2ddbf38-914f-412c-8449-1c8c0649ad22'),
(369, 369, 1, 'Handgesneden frieten', 'jacket-potato', NULL, NULL, 1, '2025-03-26 19:32:33', '2025-03-26 19:32:33', '58e9cafa-a7d1-4e8a-b7d5-d9f7abbe279c'),
(370, 370, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-03-26 19:34:57', '2025-03-26 19:34:57', '0f4c18ac-0196-425d-b57a-4d8b1ae34911'),
(371, 371, 1, 'Wij zijn er even tussenuit!', 'wij-zijn-er-even-tussenuit', NULL, '{\"355db1fa-c4f1-4c30-b027-2c772e449390\": \"<p>Lorem ipsum dolores</p><p>Lorem ipsum enzovoort</p>\"}', 1, '2025-03-26 19:34:57', '2025-03-26 19:34:57', '1b1f27a0-7498-4108-a6dc-a75f82aaafa0'),
(373, 373, 1, 'Ovenaardappeltjes', 'ovenaardappeltjes', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"(tijm, rozemarijn en look)\"}', 1, '2025-03-26 19:35:24', '2025-03-26 19:35:24', '13d2c40e-0615-4d3b-bb41-ab42d125a68f'),
(375, 375, 1, 'Gyoza\'s paddestoel', 'gyozas', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"soja dipsaus (V)\"}', 1, '2025-03-26 19:40:16', '2025-03-26 19:40:16', 'a368da2a-ffb5-4d3c-9ee0-48b4d6ae9870'),
(377, 377, 1, 'El Mariachi', 'el-mariachi', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% gemalen ribeye, guacamole, zure room, tomatensalsa, jalapeños, rode ui</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Mexicaan\"}', 1, '2025-03-26 19:40:51', '2025-03-26 19:40:51', '3b484175-7c16-413f-b39d-94b7d9802056'),
(378, 378, 1, 'Eskoburger cheddar', 'eskoburger-cheddar', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:40:58', '2025-03-26 19:40:58', '4a4c4b5a-69f9-499b-999a-796bea100cb6'),
(379, 379, 1, 'Eskoburger full option', 'eskoburger-full-option', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>100% grofgemalen ribeye, spek, cheddar, sla, tomaat, augurk, rode ui, eskosaus</p>\"}', 1, '2025-03-26 19:41:04', '2025-03-26 19:41:04', '3651e902-38cf-464d-b0ea-cb879d7eafb2'),
(381, 381, 1, 'One night in Bangkok', 'one-night-in-bangkok', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Thai style kippenburger, kaffir limoen, pinda, pittig slaatje, Thai mayo</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"de Thai\", \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\": \"1\"}', 1, '2025-03-26 19:41:22', '2025-03-26 19:41:22', '49b55fe3-d88d-4d23-ade5-b9ffa29b029d'),
(383, 383, 1, 'Halloumi', 'halloumi', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Gefrituurde halloumi, slaatje, granaatappel, gegrilde groenten, yoghurt za\'atar /sumak</p>\"}', 1, '2025-03-26 19:41:40', '2025-03-26 19:41:40', '81c492ed-6148-44f2-a57c-58dde9ddea2d'),
(385, 385, 1, 'Halloumi', 'halloumi', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Gefrituurde halloumi, fris slaatje, gegrilde groenten, yoghurt za\'atar /sumak</p>\"}', 1, '2025-03-26 19:42:47', '2025-03-26 19:42:47', '2c38f83f-a54a-4965-95fd-4a0afeff5f68'),
(387, 387, 1, 'Loaded sweet potato fries', 'loaded-sweet-potato-fries', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Korean style\"}', 1, '2025-03-26 19:44:23', '2025-03-26 19:44:23', '9fa25b59-afe8-4ff1-a90e-afa3ffba616e'),
(388, 388, 1, 'Ovenaardappeltjes', 'ovenaardappeltjes', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"(tijm, rozemarijn en look)\"}', 1, '2025-03-26 19:44:35', '2025-03-26 19:44:35', 'ae7e3579-b708-476d-a5be-7a8fbaed7017'),
(390, 390, 1, 'Chili fries', 'chili-fries', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"friet, chili con carne, cheddar, aioli, jalapeños\"}', 1, '2025-03-26 19:45:27', '2025-03-26 19:45:27', '79daddea-7674-40df-8117-e6ee47bb7aed'),
(392, 392, 1, 'Loaded sweet potato fries', 'loaded-sweet-potato-fries', NULL, '{\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"Korean style (V)\"}', 1, '2025-03-26 19:45:51', '2025-03-26 19:45:51', 'e543b407-d065-47d5-99a4-0cb674610f19'),
(394, 394, 1, 'Chili fries', 'chili-fries', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>(kan ook veggie)</p>\", \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\": \"friet, chili con carne, cheddar, aioli, jalapeños\"}', 1, '2025-03-26 19:46:16', '2025-03-26 19:46:16', 'bb592d89-d1ce-4f7a-a4c3-3a9fcf06bd0c'),
(399, 399, 1, 'Halloumi', 'halloumi', NULL, '{\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\": \"<p>Gefrituurde halloumi, slaatje, gegrilde groenten, yoghurt za\'atar /sumak</p>\"}', 1, '2025-04-01 14:09:21', '2025-04-01 14:09:21', '2e35d446-de53-4660-b5b7-b69a578828f8'),
(400, 400, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-04-01 14:11:24', '2025-04-01 14:11:24', 'b3318c9d-c301-43ec-aadb-4615977cccca'),
(401, 401, 1, 'Menu', 'menu', 'menu', NULL, 1, '2025-04-01 14:11:24', '2025-04-01 14:11:24', '02aaed63-b670-4ae2-b3f3-f8e91f8c22da'),
(402, 402, 1, 'De eerste echte burgerbar in Geel', 'home', '__home__', NULL, 1, '2025-04-01 14:12:06', '2025-04-01 14:12:06', '85d405a3-1597-4f72-8df7-f4b017e1c46f'),
(403, 403, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-04-01 14:12:35', '2025-04-01 14:12:35', '170b9109-1a4e-483d-8a11-da58c3bf8c1f'),
(404, 404, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-04-01 14:12:53', '2025-04-01 14:12:53', '30e175ac-22ae-489e-afe5-63618a00254a'),
(405, 405, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-04-01 14:13:02', '2025-04-01 14:13:02', 'd6c9393d-2dca-4abd-a0e2-ab67ffb3abe6'),
(406, 406, 1, 'Welkom bij Eskobar!', 'home', '__home__', NULL, 1, '2025-04-01 14:13:22', '2025-04-01 14:13:22', '28e56963-4994-485f-953c-ce7f25e60cdf'),
(407, 407, 1, NULL, '__temp_cofdgpfpljovvjrtszbewmdkolsngbjthyqs', NULL, NULL, 1, '2025-04-01 14:13:22', '2025-04-01 14:13:22', '73bb5f07-4b39-4be9-9d7f-276ca2700af5'),
(408, 408, 1, NULL, '__temp_xucslydrjzplwtharqwfutrcvebewtoxmsuq', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Reservatie voor dezelfde dag nog, graag even via de telefoon<br /><a href=\\\"tel:014585823\\\">0472/288823</a></p>\"}', 1, '2025-04-01 14:13:22', '2025-04-01 14:13:22', '8274367b-51c7-4af3-bd3f-135fe67cac1f'),
(409, 409, 1, 'Welkom bij Eskobar!', 'home', '__home__', NULL, 1, '2025-04-01 14:13:55', '2025-04-01 14:13:55', 'f4c129a7-34b7-469f-913a-de6f21ef0975'),
(411, 411, 1, 'Home', 'home', '__home__', NULL, 1, '2025-04-01 14:14:32', '2025-04-01 14:14:32', '4db9ab31-d88d-431e-81f9-29f437305604'),
(413, 413, 1, 'Stationsstraat 159, 2440 Geel', 'home', '__home__', NULL, 1, '2025-04-01 14:15:38', '2025-04-01 14:15:38', '89c7da77-30d6-4a2e-b399-d598192deb2c'),
(414, 414, 1, 'Stationsstraat 159, 2440 Geel', 'home', '__home__', NULL, 1, '2025-04-01 14:16:46', '2025-04-01 14:16:46', '8f0cc8f1-0436-4bb7-a55a-4edef1422cf7'),
(416, 416, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 14:18:08', '2025-04-01 14:18:08', '613daba8-a6fb-42f3-a1ec-1a4b6b7c4972'),
(417, 417, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 14:18:48', '2025-04-01 14:18:48', '07f4786b-e0fe-4aff-873e-6b02e88f9e69'),
(418, 418, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 14:18:55', '2025-04-01 14:18:55', '628f048e-3ae5-4d4d-8465-86f9db79b3a7'),
(419, 419, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-04-01 14:19:58', '2025-04-01 14:19:58', '585859ca-5449-416f-9a1f-444df44303cc'),
(420, 420, 1, 'Menu', 'menu', 'menu', NULL, 1, '2025-04-01 14:19:58', '2025-04-01 14:19:58', 'd2141a14-f227-4878-a570-d434a3578dfc'),
(422, 422, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 14:20:52', '2025-04-01 14:20:52', 'bbaaffb7-4355-48fa-9eab-8646d1f477aa'),
(423, 423, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-04-01 14:25:27', '2025-04-01 14:25:27', 'fb3a8357-d35c-4c16-8671-998998d7a056'),
(424, 424, 1, 'Menu', 'menu', 'menu', NULL, 1, '2025-04-01 14:25:27', '2025-04-01 14:25:27', 'f4dfe260-e252-48f0-8849-c8c47f53e1e0'),
(427, 427, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 16:02:30', '2025-04-01 16:02:30', '650766e7-6f3d-4cc0-98c6-2c2fba337d27'),
(428, 428, 1, NULL, '__temp_cofdgpfpljovvjrtszbewmdkolsngbjthyqs', NULL, NULL, 1, '2025-04-01 16:02:30', '2025-04-01 16:02:30', '6bc08116-d796-4fe8-bd5e-e0a143c6558d'),
(431, 431, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 16:04:04', '2025-04-01 16:04:04', '05290947-bffd-4d0b-972c-ce6bef73a51b'),
(432, 432, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-04-01 16:04:04', '2025-04-01 16:04:04', 'fcc97235-d335-4f5c-843b-3858de741647'),
(434, 434, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-04-01 16:04:30', '2025-04-01 16:04:30', '0a21e3fa-34fa-4371-8d29-96d748ad7ea9'),
(435, 435, 1, 'Menu', 'menu', 'menu', NULL, 1, '2025-04-01 16:04:30', '2025-04-01 16:04:30', '5e06f766-3d9f-4e80-a2eb-e18c5d801c8c'),
(438, 438, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 16:05:35', '2025-04-01 16:05:35', 'f6302d1e-f227-4260-85ba-4f39fec9c8a0'),
(439, 439, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Een burgerbar voor iedereen, of je nu je burger met je handen eet of met mes en vork, of je nu houdt van vlees, vis of vegetarisch.</p>\\n<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een burger!</p>\\n<p>Eet je liever iets anders?<br />Wij houden zelf van reizen en van lekker eten uit verschillende windstreken, daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet.</p>\\n<p>Concept:<br />Belgisch kwaliteitsvlees van dieren die opgroeien in een vrije, grasgroene omgeving. Dit geeft het vlees een authentieke smaak.<br />We selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers.<br />Suggestie speciaalbieren bij elk gerecht.</p>\\n<p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-04-01 16:05:35', '2025-04-01 16:05:35', '5e6585f2-a8cf-4e17-9045-5171f5b0acdf'),
(440, 440, 1, NULL, '__temp_yotrlkzcdvdlkgjsoapulntirxzrkhebjijx', NULL, '{\"e8e53218-3787-4670-9c48-9e7a74ae4282\": {\"type\": \"email\", \"label\": \"Reserveer\", \"value\": \"mailto:reservaties@eskobar.be\"}}', 1, '2025-04-01 16:05:35', '2025-04-01 16:05:35', '3b21d56f-c93e-444e-8697-f4f60765e282'),
(443, 443, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 16:05:45', '2025-04-01 16:05:45', '30301c5d-9e7c-4758-a8e3-52a8299b0f38'),
(444, 444, 1, NULL, '__temp_xucslydrjzplwtharqwfutrcvebewtoxmsuq', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Reservatie voor dezelfde dag nog, graag even via de telefoon<br /><a href=\\\"tel:014585823\\\">0472/288823</a></p>\"}', 1, '2025-04-01 16:05:45', '2025-04-01 16:05:45', '0b747f9d-1c8c-46f6-b4e0-fa6931d0c5ed'),
(445, 445, 1, NULL, 'info', 'info', '{\"1a96f985-7d65-4d40-b1d5-9658084d38aa\": [{\"col1\": \"!!! BEL EN BESTEL !!!\", \"col2\": \"Je kan onze burgers ook afhalen. Bel en bestel: 0472 28 88 23\"}, {\"col1\": \"Maandag, dinsdag, woensdag en zondag\", \"col2\": \"- gesloten -\"}, {\"col1\": \"Donderdag tem zaterdag\", \"col2\": \"17.30u tot 21.00u (keuken open)\"}], \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\": \"Geel\", \"4a7d7474-2e78-459e-bebd-4bc23036ae77\": {\"type\": \"url\", \"label\": \"Route\", \"value\": \"https://goo.gl/maps/2m2e5fggPBQ2\"}, \"501cd86e-e03b-409e-a612-3915bd5334cf\": \"BE0686.900.748\", \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\": \"Stationsstraat 159\", \"59feaa85-372b-4c24-9833-e024914015da\": \"2440\", \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\": \"0472 28 88 23\", \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\": \"reservaties@eskobar.be\"}', 1, '2025-04-01 16:06:05', '2025-04-01 16:06:05', '64434efc-b6d7-47fa-998f-2aec21692b35'),
(446, 446, 1, 'Menu', 'menu', 'menu', NULL, 1, '2025-04-01 16:06:05', '2025-04-01 16:06:05', '437f57e2-429c-4c3c-b4f7-88b38533e7c2'),
(449, 449, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 17:07:49', '2025-04-01 17:07:49', '3891c037-d9a0-4252-977b-78dea2e39f1a'),
(450, 450, 1, NULL, '__temp_oqivednngxfdharidgdnqyxqprfjblwlnxwk', NULL, '{\"3bd3452d-f2d6-48a3-81c1-af01998a0532\": \"<p>Houd je het klassiek met de Eskoburger, waan je je in Italië met The Godfather of reis je liever naar Mexico met de El Mariachi, of toch nog iets anders…?<br />Er is voor iedereen wel een hapje of een burger!</p><p>Welkom,<br />Kristin en Bart</p>\"}', 1, '2025-04-01 17:07:49', '2025-04-01 17:07:49', 'fc3fe55f-2347-4728-9e9b-8b3e68a7443a'),
(451, 451, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 17:08:24', '2025-04-01 17:08:24', '95c97f4e-467f-4f4d-bf9c-1df4f55a8069'),
(452, 452, 1, 'Burgerbar', 'home', '__home__', NULL, 1, '2025-04-01 17:08:31', '2025-04-01 17:08:31', 'ec52f599-e42d-4dc4-9704-16ef5bb33336');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entries`
--

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
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `primaryOwnerId`, `fieldId`, `typeId`, `postDate`, `expiryDate`, `status`, `deletedWithEntryType`, `deletedWithSection`, `dateCreated`, `dateUpdated`) VALUES
(2, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-02-22 10:33:50', '2025-02-22 10:33:50'),
(3, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-02-22 10:33:50', '2025-02-22 10:33:50'),
(14, NULL, NULL, 2, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-02-23 10:15:23', '2025-02-23 10:15:23'),
(15, NULL, NULL, 2, 2, 2, '2025-02-23 10:14:00', NULL, 'live', 0, 0, '2025-02-23 10:15:23', '2025-02-23 10:15:23'),
(16, NULL, NULL, 2, 2, 2, '2025-02-23 10:15:00', NULL, 'live', 0, 0, '2025-02-23 10:15:23', '2025-02-23 10:15:23'),
(17, NULL, NULL, 2, 2, 2, '2025-02-23 10:15:00', NULL, 'live', 0, 0, '2025-02-23 10:15:23', '2025-02-23 10:15:23'),
(18, NULL, NULL, 2, 2, 2, '2025-02-23 10:15:00', NULL, 'live', 0, 0, '2025-02-23 10:15:23', '2025-02-23 10:15:23'),
(19, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-02-23 10:15:23', '2025-02-23 10:15:23'),
(20, NULL, NULL, 19, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-02-23 10:15:23', '2025-02-23 10:15:23'),
(21, NULL, NULL, 19, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-02-23 10:15:23', '2025-03-22 10:50:00'),
(22, NULL, NULL, 19, 2, 2, '2025-02-23 10:15:00', NULL, 'live', NULL, NULL, '2025-02-23 10:15:23', '2025-03-22 10:50:00'),
(23, NULL, NULL, 19, 2, 2, '2025-02-23 10:15:00', NULL, 'live', NULL, NULL, '2025-02-23 10:15:23', '2025-03-22 10:50:00'),
(24, NULL, NULL, 19, 2, 2, '2025-02-23 10:15:00', NULL, 'live', NULL, NULL, '2025-02-23 10:15:23', '2025-03-22 10:50:00'),
(27, NULL, NULL, 2, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-02-23 10:16:50', '2025-02-23 10:16:50'),
(28, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-02-23 10:16:50', '2025-02-23 10:16:50'),
(29, NULL, NULL, 28, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-02-23 10:16:50', '2025-02-23 10:16:50'),
(36, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-02-23 10:22:22', '2025-02-23 10:22:22'),
(37, NULL, NULL, 36, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-02-23 10:22:22', '2025-02-23 10:22:22'),
(38, NULL, NULL, 36, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-02-23 10:22:22', '2025-03-22 10:50:01'),
(39, NULL, NULL, 36, 2, 2, '2025-02-23 10:15:00', NULL, 'live', NULL, NULL, '2025-02-23 10:22:22', '2025-03-22 10:50:01'),
(40, NULL, NULL, 36, 2, 2, '2025-02-23 10:15:00', NULL, 'live', NULL, NULL, '2025-02-23 10:22:22', '2025-03-22 10:50:01'),
(41, NULL, NULL, 36, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-02-23 10:22:22', '2025-02-23 10:22:22'),
(49, NULL, NULL, 2, 2, 2, '2025-02-23 10:23:00', NULL, 'live', NULL, NULL, '2025-02-23 10:24:41', '2025-02-23 10:24:41'),
(50, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-02-23 10:24:41', '2025-02-23 10:24:41'),
(51, NULL, NULL, 50, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-02-23 10:24:41', '2025-02-23 10:24:41'),
(52, NULL, NULL, 50, 2, 2, '2025-02-23 10:23:00', NULL, 'live', NULL, NULL, '2025-02-23 10:24:41', '2025-02-23 10:24:41'),
(53, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-02-28 17:58:58', '2025-02-28 17:58:58'),
(54, NULL, NULL, 53, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-02-28 17:58:58', '2025-02-28 17:58:58'),
(55, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 18:02:08', '2025-02-28 18:02:08'),
(56, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 18:02:08', '2025-02-28 18:02:08'),
(58, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 18:05:30', '2025-02-28 18:05:30'),
(59, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 18:18:04', '2025-02-28 18:18:04'),
(61, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 18:21:13', '2025-02-28 18:21:13'),
(63, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 18:25:14', '2025-02-28 18:25:14'),
(65, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 18:46:02', '2025-02-28 18:46:02'),
(67, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 18:47:59', '2025-02-28 18:47:59'),
(69, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 19:35:24', '2025-02-28 19:35:24'),
(70, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-02-28 19:38:00', '2025-02-28 19:38:00'),
(71, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:32:01', '2025-03-02 18:01:15'),
(72, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:32:01', '2025-03-02 17:32:01'),
(77, NULL, NULL, 71, 15, 7, '2025-03-02 17:32:00', NULL, 'live', 0, 0, '2025-03-02 17:33:51', '2025-03-02 17:33:51'),
(79, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:33:51', '2025-03-02 17:33:51'),
(80, NULL, NULL, 79, 15, 7, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:33:51', '2025-03-02 18:02:32'),
(91, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:35:59', '2025-03-02 17:35:59'),
(96, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:37:26', '2025-03-02 17:37:26'),
(99, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:37:56', '2025-03-02 17:37:56'),
(100, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:38:12', '2025-03-02 17:38:12'),
(102, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:44:01', '2025-03-02 17:44:01'),
(106, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:46:42', '2025-03-02 17:46:42'),
(108, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:48:33', '2025-03-02 17:48:33'),
(111, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:48:48', '2025-03-02 17:48:48'),
(112, 3, NULL, NULL, NULL, 8, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 17:49:02', '2025-03-02 17:49:02'),
(113, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 18:01:15', '2025-03-02 18:01:15'),
(115, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 18:03:25', '2025-03-02 18:03:25'),
(119, 3, NULL, NULL, NULL, 7, '2025-03-02 18:06:00', NULL, 'live', NULL, NULL, '2025-03-02 18:06:38', '2025-03-02 18:06:43'),
(120, 3, NULL, NULL, NULL, 7, '2025-03-02 18:06:00', NULL, 'live', NULL, NULL, '2025-03-02 18:06:43', '2025-03-02 18:06:43'),
(121, 3, NULL, NULL, NULL, 7, '2025-03-02 18:06:00', NULL, 'live', NULL, NULL, '2025-03-02 18:06:45', '2025-03-02 18:06:45'),
(122, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-02 18:07:15', '2025-03-02 18:07:15'),
(123, 3, NULL, NULL, NULL, 7, '2025-03-02 18:06:00', NULL, 'live', NULL, NULL, '2025-03-02 18:07:27', '2025-03-02 18:07:27'),
(124, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-02 18:08:22', '2025-03-02 18:08:32'),
(125, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-02 18:08:32', '2025-03-02 18:08:32'),
(126, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-02 18:08:35', '2025-03-02 18:08:35'),
(127, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-02 18:08:41', '2025-03-02 18:08:55'),
(128, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-02 18:08:55', '2025-03-02 18:08:55'),
(129, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-02 18:08:57', '2025-03-02 18:08:57'),
(130, 3, NULL, NULL, NULL, 9, '2025-03-02 18:09:00', NULL, 'live', NULL, NULL, '2025-03-02 18:09:03', '2025-03-02 18:09:17'),
(131, 3, NULL, NULL, NULL, 9, '2025-03-02 18:09:00', NULL, 'live', NULL, NULL, '2025-03-02 18:09:17', '2025-03-02 18:09:17'),
(132, 3, NULL, NULL, NULL, 9, '2025-03-02 18:09:00', NULL, 'live', NULL, NULL, '2025-03-02 18:09:20', '2025-03-02 18:09:20'),
(133, 3, NULL, NULL, NULL, 9, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-02 18:09:52', '2025-03-02 18:10:01'),
(134, 3, NULL, NULL, NULL, 9, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-02 18:10:01', '2025-03-02 18:10:01'),
(135, 3, NULL, NULL, NULL, 9, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-02 18:10:03', '2025-03-02 18:10:03'),
(136, 3, NULL, NULL, NULL, 9, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-02 18:10:08', '2025-03-02 18:10:21'),
(137, 3, NULL, NULL, NULL, 9, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-02 18:10:21', '2025-03-02 18:10:21'),
(138, 3, NULL, NULL, NULL, 7, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-02 18:10:28', '2025-03-02 18:10:43'),
(139, 3, NULL, NULL, NULL, 7, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-02 18:10:43', '2025-03-02 18:10:43'),
(140, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:10:51', '2025-03-02 18:11:08'),
(141, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:11:08', '2025-03-02 18:11:08'),
(142, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:11:10', '2025-03-02 18:11:10'),
(143, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:11:13', '2025-03-02 18:11:28'),
(144, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:11:28', '2025-03-02 18:11:28'),
(146, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:11:40', '2025-03-02 18:11:40'),
(147, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:11:45', '2025-03-02 18:11:45'),
(149, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:11:55', '2025-03-02 18:11:55'),
(151, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:12:33', '2025-03-02 18:12:33'),
(152, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-02 18:12:44', '2025-03-02 18:12:44'),
(153, 3, NULL, NULL, NULL, 9, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-02 18:12:58', '2025-03-02 18:13:16'),
(154, 3, NULL, NULL, NULL, 9, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-02 18:13:16', '2025-03-02 18:13:16'),
(155, 3, NULL, NULL, NULL, 7, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-02 18:13:28', '2025-03-02 18:13:34'),
(156, 3, NULL, NULL, NULL, 7, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-02 18:13:34', '2025-03-02 18:13:34'),
(157, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-02 18:13:46', '2025-03-02 18:14:04'),
(158, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-02 18:14:04', '2025-03-02 18:14:04'),
(159, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-02 18:14:16', '2025-03-02 18:14:24'),
(160, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-02 18:14:24', '2025-03-02 18:14:24'),
(161, 3, NULL, NULL, NULL, 9, '2025-03-02 18:20:00', NULL, 'live', NULL, NULL, '2025-03-02 18:19:05', '2025-03-02 18:20:28'),
(162, 3, NULL, NULL, NULL, 9, '2025-03-02 18:20:00', NULL, 'live', NULL, NULL, '2025-03-02 18:20:28', '2025-03-02 18:20:28'),
(163, 3, NULL, NULL, NULL, 9, '2025-03-02 18:20:00', NULL, 'live', NULL, NULL, '2025-03-02 18:21:55', '2025-03-02 18:21:55'),
(165, 3, NULL, NULL, NULL, 9, '2025-03-02 18:20:00', NULL, 'live', NULL, NULL, '2025-03-02 18:21:59', '2025-03-02 18:21:59'),
(167, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-02 18:22:25', '2025-03-02 18:22:25'),
(168, 3, NULL, NULL, NULL, 7, '2025-03-02 18:22:00', NULL, 'live', NULL, NULL, '2025-03-02 18:22:37', '2025-03-02 18:22:40'),
(169, 3, NULL, NULL, NULL, 7, '2025-03-02 18:22:00', NULL, 'live', NULL, NULL, '2025-03-02 18:22:40', '2025-03-02 18:22:40'),
(170, 3, NULL, NULL, NULL, 9, '2025-03-02 18:23:00', NULL, 'live', NULL, NULL, '2025-03-02 18:22:48', '2025-03-02 18:23:04'),
(171, 3, NULL, NULL, NULL, 9, '2025-03-02 18:23:00', NULL, 'live', NULL, NULL, '2025-03-02 18:23:04', '2025-03-02 18:23:04'),
(173, 3, NULL, NULL, NULL, 7, '2025-03-02 18:06:00', NULL, 'live', NULL, NULL, '2025-03-06 18:46:48', '2025-03-06 18:46:48'),
(175, 3, NULL, NULL, NULL, 7, '2025-03-02 18:06:00', NULL, 'live', NULL, NULL, '2025-03-06 18:48:19', '2025-03-06 18:48:19'),
(177, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-06 18:48:40', '2025-03-06 18:48:40'),
(179, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-06 18:48:51', '2025-03-06 18:48:51'),
(181, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-06 18:49:04', '2025-03-06 18:49:04'),
(183, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-06 18:49:22', '2025-03-06 18:49:22'),
(185, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-06 18:49:41', '2025-03-06 18:49:41'),
(187, 3, NULL, NULL, NULL, 7, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-06 18:50:38', '2025-03-06 18:50:38'),
(188, 3, NULL, NULL, NULL, 7, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-06 18:50:54', '2025-03-06 18:50:54'),
(189, 3, NULL, NULL, NULL, 7, '2025-03-06 18:51:00', NULL, 'live', NULL, NULL, '2025-03-06 18:51:08', '2025-03-06 18:51:17'),
(190, 3, NULL, NULL, NULL, 7, '2025-03-06 18:51:00', NULL, 'live', NULL, NULL, '2025-03-06 18:51:17', '2025-03-06 18:51:17'),
(192, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-06 18:51:56', '2025-03-06 18:51:56'),
(193, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-06 18:51:57', '2025-03-06 18:51:57'),
(195, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-06 18:52:22', '2025-03-06 18:52:22'),
(196, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-06 18:52:24', '2025-03-06 18:52:24'),
(198, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-06 18:52:39', '2025-03-06 18:52:39'),
(199, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-06 18:52:40', '2025-03-06 18:52:40'),
(200, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-10 18:55:46', '2025-03-10 18:55:46'),
(202, 3, NULL, NULL, NULL, 9, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-10 19:25:42', '2025-03-10 19:25:42'),
(206, NULL, NULL, 55, 11, 10, '2025-03-20 19:24:00', NULL, 'live', NULL, NULL, '2025-03-20 19:24:57', '2025-03-22 09:32:21'),
(207, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-03-20 19:24:57', '2025-03-20 19:24:57'),
(208, NULL, NULL, 207, 11, 10, '2025-03-20 19:24:00', NULL, 'live', NULL, NULL, '2025-03-20 19:24:57', '2025-03-20 19:24:57'),
(209, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-22 10:21:59', '2025-03-22 13:16:46'),
(210, 4, NULL, NULL, NULL, 1, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-22 10:21:59', '2025-03-22 10:21:59'),
(212, 4, NULL, NULL, NULL, 1, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-22 10:22:14', '2025-03-22 10:22:14'),
(213, 4, NULL, NULL, NULL, 1, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-22 10:48:04', '2025-03-22 10:48:04'),
(214, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 10:50:00', '2025-03-22 10:50:00'),
(215, 4, NULL, NULL, NULL, 1, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-22 10:50:03', '2025-03-22 10:50:03'),
(216, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 10:51:31', '2025-03-22 10:51:31'),
(217, NULL, NULL, 216, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-03-22 10:51:31', '2025-03-22 10:51:31'),
(218, NULL, NULL, 216, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-03-22 10:51:32', '2025-03-22 10:51:32'),
(219, NULL, NULL, 216, 2, 2, '2025-02-23 10:23:00', NULL, 'live', NULL, NULL, '2025-03-22 10:51:32', '2025-03-22 10:51:32'),
(220, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 10:51:32', '2025-03-22 10:51:32'),
(221, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 13:16:46', '2025-03-22 13:16:46'),
(222, NULL, NULL, 221, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-03-22 13:16:46', '2025-03-22 13:16:46'),
(223, NULL, NULL, 221, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-03-22 13:16:46', '2025-03-22 13:16:46'),
(224, NULL, NULL, 221, 2, 2, '2025-02-23 10:23:00', NULL, 'live', NULL, NULL, '2025-03-22 13:16:46', '2025-03-22 13:16:46'),
(225, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-22 13:16:46', '2025-03-22 13:16:46'),
(226, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-03-22 13:18:36', '2025-03-22 13:18:36'),
(227, NULL, NULL, 226, 11, 10, '2025-03-20 19:24:00', NULL, 'live', NULL, NULL, '2025-03-22 13:18:37', '2025-03-22 13:18:37'),
(228, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-22 13:18:37', '2025-03-22 13:18:37'),
(229, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 13:18:41', '2025-03-22 13:18:41'),
(230, NULL, NULL, 229, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-03-22 13:18:41', '2025-03-22 13:18:41'),
(231, NULL, NULL, 229, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-03-22 13:18:41', '2025-03-22 13:18:41'),
(232, NULL, NULL, 229, 2, 2, '2025-02-23 10:23:00', NULL, 'live', NULL, NULL, '2025-03-22 13:18:41', '2025-03-22 13:18:41'),
(236, NULL, NULL, 2, 2, 2, '2025-03-22 13:19:00', NULL, 'live', 0, 0, '2025-03-22 13:19:31', '2025-03-22 13:19:31'),
(237, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 13:19:31', '2025-03-22 13:19:31'),
(238, NULL, NULL, 237, 2, 2, '2025-03-22 13:19:00', NULL, 'live', NULL, NULL, '2025-03-22 13:19:31', '2025-03-22 13:19:31'),
(239, NULL, NULL, 237, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-03-22 13:19:31', '2025-03-22 13:19:31'),
(242, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 13:19:41', '2025-03-22 13:19:41'),
(243, NULL, NULL, 242, 2, 2, '2025-02-23 10:23:00', NULL, 'live', NULL, NULL, '2025-03-22 13:19:41', '2025-03-22 13:19:41'),
(246, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 13:24:49', '2025-03-22 13:24:49'),
(247, NULL, NULL, 246, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-03-22 13:24:49', '2025-03-22 13:24:49'),
(250, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-03-22 13:25:09', '2025-03-22 13:25:09'),
(251, NULL, NULL, 250, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-03-22 13:25:09', '2025-03-22 13:25:09'),
(252, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-03-23 11:38:24', '2025-03-23 11:38:24'),
(253, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-03-23 11:38:32', '2025-03-23 11:38:32'),
(255, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-23 11:39:18', '2025-03-23 11:39:18'),
(256, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-23 14:57:55', '2025-03-23 14:57:55'),
(257, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-23 14:58:02', '2025-03-23 14:58:02'),
(261, 3, NULL, NULL, NULL, 9, '2025-03-24 15:12:00', NULL, 'live', NULL, NULL, '2025-03-24 15:11:58', '2025-03-24 15:12:17'),
(262, 3, NULL, NULL, NULL, 9, '2025-03-24 15:12:00', NULL, 'live', NULL, NULL, '2025-03-24 15:12:17', '2025-03-24 15:12:17'),
(264, 3, NULL, NULL, NULL, 9, '2025-03-24 15:12:00', NULL, 'live', NULL, NULL, '2025-03-24 15:13:54', '2025-03-24 15:13:54'),
(265, 3, NULL, NULL, NULL, 9, '2025-03-24 15:14:00', NULL, 'live', NULL, NULL, '2025-03-24 15:14:11', '2025-03-24 15:14:39'),
(266, 3, NULL, NULL, NULL, 9, '2025-03-24 15:14:00', NULL, 'live', NULL, NULL, '2025-03-24 15:14:39', '2025-03-24 15:14:39'),
(267, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-03-24 16:45:05', '2025-03-24 16:45:05'),
(268, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-03-24 16:45:53', '2025-03-24 16:45:53'),
(269, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-03-24 17:58:31', '2025-03-24 17:58:31'),
(270, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-03-24 17:58:31', '2025-03-24 17:58:31'),
(272, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-26 19:00:07', '2025-03-26 19:00:07'),
(274, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-26 19:00:17', '2025-03-26 19:00:17'),
(276, 3, NULL, NULL, NULL, 9, '2025-03-02 18:08:00', NULL, 'live', NULL, NULL, '2025-03-26 19:00:31', '2025-03-26 19:00:31'),
(278, 3, NULL, NULL, NULL, 9, '2025-03-02 18:09:00', NULL, 'live', NULL, NULL, '2025-03-26 19:02:58', '2025-03-26 19:02:58'),
(280, 3, NULL, NULL, NULL, 9, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-26 19:03:11', '2025-03-26 19:03:11'),
(282, 3, NULL, NULL, NULL, 9, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-26 19:03:32', '2025-03-26 19:03:32'),
(284, 3, NULL, NULL, NULL, 9, '2025-03-24 15:12:00', NULL, 'live', NULL, NULL, '2025-03-26 19:03:56', '2025-03-26 19:03:56'),
(286, 3, NULL, NULL, NULL, 9, '2025-03-24 15:14:00', NULL, 'live', NULL, NULL, '2025-03-26 19:04:30', '2025-03-26 19:04:30'),
(287, 3, NULL, NULL, NULL, 9, '2025-03-26 19:05:00', NULL, 'live', NULL, NULL, '2025-03-26 19:04:34', '2025-03-26 19:05:13'),
(288, 3, NULL, NULL, NULL, 9, '2025-03-26 19:05:00', NULL, 'live', NULL, NULL, '2025-03-26 19:05:13', '2025-03-26 19:05:13'),
(289, 3, NULL, NULL, NULL, 9, '2025-03-26 19:05:00', NULL, 'live', NULL, NULL, '2025-03-26 19:05:21', '2025-03-26 19:05:38'),
(290, 3, NULL, NULL, NULL, 9, '2025-03-26 19:05:00', NULL, 'live', NULL, NULL, '2025-03-26 19:05:38', '2025-03-26 19:05:38'),
(291, 3, NULL, NULL, NULL, 9, '2025-03-26 19:06:00', NULL, 'live', NULL, NULL, '2025-03-26 19:05:43', '2025-03-26 19:06:07'),
(292, 3, NULL, NULL, NULL, 9, '2025-03-26 19:06:00', NULL, 'live', NULL, NULL, '2025-03-26 19:06:07', '2025-03-26 19:06:07'),
(293, 3, NULL, NULL, NULL, 9, '2025-03-26 19:06:00', NULL, 'live', NULL, NULL, '2025-03-26 19:06:18', '2025-03-26 19:06:32'),
(294, 3, NULL, NULL, NULL, 9, '2025-03-26 19:06:00', NULL, 'live', NULL, NULL, '2025-03-26 19:06:32', '2025-03-26 19:06:32'),
(296, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:08:00', '2025-03-26 19:08:00'),
(298, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:08:21', '2025-03-26 19:08:21'),
(300, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:08:36', '2025-03-26 19:08:36'),
(302, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:08:49', '2025-03-26 19:08:49'),
(303, 3, NULL, NULL, NULL, 9, '2025-03-26 19:09:00', NULL, 'live', NULL, NULL, '2025-03-26 19:09:21', '2025-03-26 19:09:56'),
(304, 3, NULL, NULL, NULL, 9, '2025-03-26 19:09:00', NULL, 'live', NULL, NULL, '2025-03-26 19:09:57', '2025-03-26 19:09:57'),
(305, 3, NULL, NULL, NULL, 9, '2025-03-26 19:10:00', NULL, 'live', NULL, NULL, '2025-03-26 19:10:00', '2025-03-26 19:10:00'),
(306, 3, NULL, NULL, NULL, 9, '2025-03-26 19:10:00', NULL, 'live', NULL, NULL, '2025-03-26 19:10:51', '2025-03-26 19:10:51'),
(307, 3, NULL, NULL, NULL, 9, '2025-03-26 19:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:10:54', '2025-03-26 19:11:50'),
(308, 3, NULL, NULL, NULL, 9, '2025-03-26 19:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:11:50', '2025-03-26 19:11:50'),
(309, 3, NULL, NULL, NULL, 9, '2025-03-26 19:14:00', NULL, 'live', NULL, NULL, '2025-03-26 19:11:56', '2025-03-26 19:14:21'),
(310, 3, NULL, NULL, NULL, 9, '2025-03-26 19:14:00', NULL, 'live', NULL, NULL, '2025-03-26 19:14:21', '2025-03-26 19:14:21'),
(312, 3, NULL, NULL, NULL, 9, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-26 19:15:07', '2025-03-26 19:15:07'),
(313, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:15:15', '2025-03-26 19:15:15'),
(314, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:15:22', '2025-03-26 19:15:22'),
(315, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:15:28', '2025-03-26 19:15:28'),
(316, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:15:35', '2025-03-26 19:15:35'),
(317, 3, NULL, NULL, NULL, 9, '2025-03-02 18:13:00', NULL, 'live', NULL, NULL, '2025-03-26 19:15:47', '2025-03-26 19:15:47'),
(319, 3, NULL, NULL, NULL, 9, '2025-03-02 18:20:00', NULL, 'live', NULL, NULL, '2025-03-26 19:16:22', '2025-03-26 19:16:22'),
(320, 3, NULL, NULL, NULL, 9, '2025-03-26 19:17:00', NULL, 'live', NULL, NULL, '2025-03-26 19:16:32', '2025-03-26 19:17:38'),
(321, 3, NULL, NULL, NULL, 9, '2025-03-26 19:17:00', NULL, 'live', NULL, NULL, '2025-03-26 19:17:38', '2025-03-26 19:17:38'),
(322, 3, NULL, NULL, NULL, 9, '2025-03-26 19:18:00', NULL, 'live', NULL, NULL, '2025-03-26 19:17:42', '2025-03-26 19:18:36'),
(323, 3, NULL, NULL, NULL, 9, '2025-03-26 19:18:00', NULL, 'live', NULL, NULL, '2025-03-26 19:18:36', '2025-03-26 19:18:36'),
(324, 3, NULL, NULL, NULL, 9, '2025-03-26 19:19:00', NULL, 'live', NULL, NULL, '2025-03-26 19:18:39', '2025-03-26 19:19:18'),
(325, 3, NULL, NULL, NULL, 9, '2025-03-26 19:19:00', NULL, 'live', NULL, NULL, '2025-03-26 19:19:18', '2025-03-26 19:19:18'),
(327, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-26 19:20:00', '2025-03-26 19:20:00'),
(329, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-26 19:20:21', '2025-03-26 19:20:21'),
(330, 3, NULL, NULL, NULL, 9, '2025-03-26 19:20:00', NULL, 'live', NULL, NULL, '2025-03-26 19:20:30', '2025-03-26 19:20:59'),
(331, 3, NULL, NULL, NULL, 9, '2025-03-26 19:20:00', NULL, 'live', NULL, NULL, '2025-03-26 19:20:59', '2025-03-26 19:20:59'),
(332, 3, NULL, NULL, NULL, 9, '2025-03-26 19:22:00', NULL, 'live', NULL, NULL, '2025-03-26 19:21:06', '2025-03-26 19:22:38'),
(333, 3, NULL, NULL, NULL, 9, '2025-03-26 19:22:00', NULL, 'live', NULL, NULL, '2025-03-26 19:22:38', '2025-03-26 19:22:38'),
(334, 3, NULL, NULL, NULL, 9, '2025-03-26 19:23:00', NULL, 'live', NULL, NULL, '2025-03-26 19:22:41', '2025-03-26 19:23:26'),
(335, 3, NULL, NULL, NULL, 9, '2025-03-26 19:23:00', NULL, 'live', NULL, NULL, '2025-03-26 19:23:26', '2025-03-26 19:23:26'),
(336, 3, NULL, NULL, NULL, 9, '2025-03-26 19:23:00', NULL, 'live', NULL, NULL, '2025-03-26 19:23:28', '2025-03-26 19:23:44'),
(337, 3, NULL, NULL, NULL, 9, '2025-03-26 19:23:00', NULL, 'live', NULL, NULL, '2025-03-26 19:23:44', '2025-03-26 19:23:44'),
(339, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-26 19:24:05', '2025-03-26 19:24:05'),
(341, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-26 19:24:19', '2025-03-26 19:24:19'),
(343, 3, NULL, NULL, NULL, 9, '2025-03-06 18:51:26', NULL, 'live', NULL, NULL, '2025-03-26 19:24:34', '2025-03-26 19:24:34'),
(344, 3, NULL, NULL, NULL, 9, '2025-03-26 19:24:00', NULL, 'live', NULL, NULL, '2025-03-26 19:24:37', '2025-03-26 19:24:48'),
(345, 3, NULL, NULL, NULL, 9, '2025-03-26 19:24:00', NULL, 'live', NULL, NULL, '2025-03-26 19:24:48', '2025-03-26 19:24:48'),
(347, 3, NULL, NULL, NULL, 9, '2025-03-02 18:23:00', NULL, 'live', NULL, NULL, '2025-03-26 19:25:09', '2025-03-26 19:25:09'),
(348, 3, NULL, NULL, NULL, 9, '2025-03-26 19:25:00', NULL, 'live', NULL, NULL, '2025-03-26 19:25:11', '2025-03-26 19:25:36'),
(349, 3, NULL, NULL, NULL, 9, '2025-03-26 19:25:00', NULL, 'live', NULL, NULL, '2025-03-26 19:25:36', '2025-03-26 19:25:36'),
(351, 3, NULL, NULL, NULL, 9, '2025-03-26 19:06:00', NULL, 'live', NULL, NULL, '2025-03-26 19:25:55', '2025-03-26 19:25:55'),
(352, 3, NULL, NULL, NULL, 7, '2025-03-26 19:26:00', NULL, 'live', NULL, NULL, '2025-03-26 19:26:12', '2025-03-26 19:26:25'),
(353, 3, NULL, NULL, NULL, 7, '2025-03-26 19:26:00', NULL, 'live', NULL, NULL, '2025-03-26 19:26:25', '2025-03-26 19:26:25'),
(354, 3, NULL, NULL, NULL, 9, '2025-03-26 19:26:00', NULL, 'live', NULL, NULL, '2025-03-26 19:26:31', '2025-03-26 19:26:56'),
(355, 3, NULL, NULL, NULL, 9, '2025-03-26 19:26:00', NULL, 'live', NULL, NULL, '2025-03-26 19:26:56', '2025-03-26 19:26:56'),
(356, 3, NULL, NULL, NULL, 9, '2025-03-26 19:27:00', NULL, 'live', NULL, NULL, '2025-03-26 19:26:58', '2025-03-26 19:27:17'),
(357, 3, NULL, NULL, NULL, 9, '2025-03-26 19:27:00', NULL, 'live', NULL, NULL, '2025-03-26 19:27:17', '2025-03-26 19:27:17'),
(359, 3, NULL, NULL, NULL, 9, '2025-03-26 19:05:00', NULL, 'live', NULL, NULL, '2025-03-26 19:29:50', '2025-03-26 19:29:50'),
(361, 3, NULL, NULL, NULL, 9, '2025-03-02 18:09:00', NULL, 'live', NULL, NULL, '2025-03-26 19:30:09', '2025-03-26 19:30:09'),
(363, 3, NULL, NULL, NULL, 9, '2025-03-02 17:32:00', NULL, 'live', NULL, NULL, '2025-03-26 19:30:59', '2025-03-26 19:30:59'),
(365, 3, NULL, NULL, NULL, 9, '2025-03-02 18:10:00', NULL, 'live', NULL, NULL, '2025-03-26 19:31:13', '2025-03-26 19:31:13'),
(367, 3, NULL, NULL, NULL, 9, '2025-03-26 19:06:00', NULL, 'live', NULL, NULL, '2025-03-26 19:31:57', '2025-03-26 19:31:57'),
(368, 3, NULL, NULL, NULL, 9, '2025-03-26 19:22:00', NULL, 'live', NULL, NULL, '2025-03-26 19:32:20', '2025-03-26 19:32:20'),
(369, 3, NULL, NULL, NULL, 9, '2025-03-02 18:14:00', NULL, 'live', NULL, NULL, '2025-03-26 19:32:33', '2025-03-26 19:32:33'),
(370, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-03-26 19:34:57', '2025-03-26 19:34:57'),
(371, NULL, NULL, 370, 11, 10, '2025-03-20 19:24:00', NULL, 'live', NULL, NULL, '2025-03-26 19:34:57', '2025-03-26 19:34:57'),
(373, 3, NULL, NULL, NULL, 9, '2025-03-26 19:20:00', NULL, 'live', NULL, NULL, '2025-03-26 19:35:24', '2025-03-26 19:35:24'),
(375, 3, NULL, NULL, NULL, 9, '2025-03-24 15:14:00', NULL, 'live', NULL, NULL, '2025-03-26 19:40:16', '2025-03-26 19:40:16'),
(377, 3, NULL, NULL, NULL, 9, '2025-03-26 19:14:00', NULL, 'live', NULL, NULL, '2025-03-26 19:40:51', '2025-03-26 19:40:51'),
(378, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:40:58', '2025-03-26 19:40:58'),
(379, 3, NULL, NULL, NULL, 9, '2025-03-02 18:11:00', NULL, 'live', NULL, NULL, '2025-03-26 19:41:04', '2025-03-26 19:41:04'),
(381, 3, NULL, NULL, NULL, 9, '2025-03-02 18:20:00', NULL, 'live', NULL, NULL, '2025-03-26 19:41:22', '2025-03-26 19:41:22'),
(383, 3, NULL, NULL, NULL, 9, '2025-03-26 19:18:00', NULL, 'live', NULL, NULL, '2025-03-26 19:41:40', '2025-03-26 19:41:40'),
(385, 3, NULL, NULL, NULL, 9, '2025-03-26 19:18:00', NULL, 'live', NULL, NULL, '2025-03-26 19:42:47', '2025-03-26 19:42:47'),
(387, 3, NULL, NULL, NULL, 9, '2025-03-26 19:23:00', NULL, 'live', NULL, NULL, '2025-03-26 19:44:23', '2025-03-26 19:44:23'),
(388, 3, NULL, NULL, NULL, 9, '2025-03-26 19:20:00', NULL, 'live', NULL, NULL, '2025-03-26 19:44:35', '2025-03-26 19:44:35'),
(390, 3, NULL, NULL, NULL, 9, '2025-03-26 19:22:00', NULL, 'live', NULL, NULL, '2025-03-26 19:45:27', '2025-03-26 19:45:27'),
(392, 3, NULL, NULL, NULL, 9, '2025-03-26 19:23:00', NULL, 'live', NULL, NULL, '2025-03-26 19:45:51', '2025-03-26 19:45:51'),
(394, 3, NULL, NULL, NULL, 9, '2025-03-26 19:22:00', NULL, 'live', NULL, NULL, '2025-03-26 19:46:16', '2025-03-26 19:46:16'),
(399, 3, NULL, NULL, NULL, 9, '2025-03-26 19:18:00', NULL, 'live', NULL, NULL, '2025-04-01 14:09:21', '2025-04-01 14:09:21'),
(400, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-04-01 14:11:24', '2025-04-01 14:11:24'),
(401, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-04-01 14:11:24', '2025-04-01 14:11:24'),
(402, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:12:06', '2025-04-01 14:12:06'),
(403, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-04-01 14:12:35', '2025-04-01 14:12:35'),
(404, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-04-01 14:12:53', '2025-04-01 14:12:53'),
(405, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-04-01 14:13:02', '2025-04-01 14:13:02'),
(406, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:13:22', '2025-04-01 14:13:22'),
(407, NULL, NULL, 406, 2, 2, '2025-03-22 13:19:00', NULL, 'live', NULL, NULL, '2025-04-01 14:13:22', '2025-04-01 14:13:22'),
(408, NULL, NULL, 406, 2, 2, '2025-02-23 10:23:00', NULL, 'live', NULL, NULL, '2025-04-01 14:13:22', '2025-04-01 14:13:22'),
(409, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:13:55', '2025-04-01 14:13:55'),
(411, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:14:32', '2025-04-01 14:14:32'),
(413, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:15:38', '2025-04-01 14:15:38'),
(414, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:16:46', '2025-04-01 14:16:46'),
(416, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:18:08', '2025-04-01 14:18:08'),
(417, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:18:48', '2025-04-01 14:18:48'),
(418, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:18:55', '2025-04-01 14:18:55'),
(419, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-04-01 14:19:58', '2025-04-01 14:19:58'),
(420, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-04-01 14:19:58', '2025-04-01 14:19:58'),
(422, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 14:20:52', '2025-04-01 14:20:52'),
(423, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-04-01 14:25:27', '2025-04-01 14:25:27'),
(424, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-04-01 14:25:27', '2025-04-01 14:25:27'),
(427, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 16:02:30', '2025-04-01 16:02:30'),
(428, NULL, NULL, 427, 2, 2, '2025-03-22 13:19:00', NULL, 'live', NULL, NULL, '2025-04-01 16:02:30', '2025-04-01 16:02:30'),
(431, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 16:04:04', '2025-04-01 16:04:04'),
(432, NULL, NULL, 431, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-04-01 16:04:04', '2025-04-01 16:04:04'),
(434, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-04-01 16:04:30', '2025-04-01 16:04:30'),
(435, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-04-01 16:04:30', '2025-04-01 16:04:30'),
(438, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 16:05:35', '2025-04-01 16:05:35'),
(439, NULL, NULL, 438, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-04-01 16:05:35', '2025-04-01 16:05:35'),
(440, NULL, NULL, 438, 2, 3, '2025-02-23 10:16:00', NULL, 'live', NULL, NULL, '2025-04-01 16:05:35', '2025-04-01 16:05:35'),
(443, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 16:05:45', '2025-04-01 16:05:45'),
(444, NULL, NULL, 443, 2, 2, '2025-02-23 10:23:00', NULL, 'live', NULL, NULL, '2025-04-01 16:05:45', '2025-04-01 16:05:45'),
(445, 2, NULL, NULL, NULL, 5, '2025-02-28 18:02:00', NULL, 'live', NULL, NULL, '2025-04-01 16:06:05', '2025-04-01 16:06:05'),
(446, 4, NULL, NULL, NULL, 7, '2025-03-22 10:21:00', NULL, 'live', NULL, NULL, '2025-04-01 16:06:05', '2025-04-01 16:06:05'),
(449, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 17:07:49', '2025-04-01 17:07:49'),
(450, NULL, NULL, 449, 2, 2, '2025-02-23 10:14:00', NULL, 'live', NULL, NULL, '2025-04-01 17:07:49', '2025-04-01 17:07:49'),
(451, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 17:08:24', '2025-04-01 17:08:24'),
(452, 1, NULL, NULL, NULL, 1, '2025-02-22 10:33:00', NULL, 'live', NULL, NULL, '2025-04-01 17:08:31', '2025-04-01 17:08:31');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entries_authors`
--

CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entries_authors`
--

INSERT INTO `entries_authors` (`entryId`, `authorId`, `sortOrder`) VALUES
(71, 1, 1),
(72, 1, 1),
(79, 1, 1),
(91, 1, 1),
(96, 1, 1),
(99, 1, 1),
(100, 1, 1),
(102, 1, 1),
(106, 1, 1),
(108, 1, 1),
(111, 1, 1),
(112, 1, 1),
(113, 1, 1),
(115, 1, 1),
(119, 1, 1),
(120, 1, 1),
(121, 1, 1),
(122, 1, 1),
(123, 1, 1),
(124, 1, 1),
(125, 1, 1),
(126, 1, 1),
(127, 1, 1),
(128, 1, 1),
(129, 1, 1),
(130, 1, 1),
(131, 1, 1),
(132, 1, 1),
(133, 1, 1),
(134, 1, 1),
(135, 1, 1),
(136, 1, 1),
(137, 1, 1),
(138, 1, 1),
(139, 1, 1),
(140, 1, 1),
(141, 1, 1),
(142, 1, 1),
(143, 1, 1),
(144, 1, 1),
(146, 1, 1),
(147, 1, 1),
(149, 1, 1),
(151, 1, 1),
(152, 1, 1),
(153, 1, 1),
(154, 1, 1),
(155, 1, 1),
(156, 1, 1),
(157, 1, 1),
(158, 1, 1),
(159, 1, 1),
(160, 1, 1),
(161, 1, 1),
(162, 1, 1),
(163, 1, 1),
(165, 1, 1),
(167, 1, 1),
(168, 1, 1),
(169, 1, 1),
(170, 1, 1),
(171, 1, 1),
(173, 1, 1),
(175, 1, 1),
(177, 1, 1),
(179, 1, 1),
(181, 1, 1),
(183, 1, 1),
(185, 1, 1),
(187, 1, 1),
(188, 1, 1),
(189, 1, 1),
(190, 1, 1),
(192, 1, 1),
(193, 1, 1),
(195, 1, 1),
(196, 1, 1),
(198, 1, 1),
(199, 1, 1),
(200, 1, 1),
(202, 1, 1),
(256, 1, 1),
(257, 1, 1),
(261, 1, 1),
(262, 1, 1),
(264, 1, 1),
(265, 1, 1),
(266, 1, 1),
(272, 1, 1),
(274, 1, 1),
(276, 1, 1),
(278, 1, 1),
(280, 1, 1),
(282, 1, 1),
(284, 1, 1),
(286, 1, 1),
(287, 1, 1),
(288, 1, 1),
(289, 1, 1),
(290, 1, 1),
(291, 1, 1),
(292, 1, 1),
(293, 1, 1),
(294, 1, 1),
(296, 1, 1),
(298, 1, 1),
(300, 1, 1),
(302, 1, 1),
(303, 1, 1),
(304, 1, 1),
(305, 1, 1),
(306, 1, 1),
(307, 1, 1),
(308, 1, 1),
(309, 1, 1),
(310, 1, 1),
(312, 1, 1),
(313, 1, 1),
(314, 1, 1),
(315, 1, 1),
(316, 1, 1),
(317, 1, 1),
(319, 1, 1),
(320, 1, 1),
(321, 1, 1),
(322, 1, 1),
(323, 1, 1),
(324, 1, 1),
(325, 1, 1),
(327, 1, 1),
(329, 1, 1),
(330, 1, 1),
(331, 1, 1),
(332, 1, 1),
(333, 1, 1),
(334, 1, 1),
(335, 1, 1),
(336, 1, 1),
(337, 1, 1),
(339, 1, 1),
(341, 1, 1),
(343, 1, 1),
(344, 1, 1),
(345, 1, 1),
(347, 1, 1),
(348, 1, 1),
(349, 1, 1),
(351, 1, 1),
(352, 1, 1),
(353, 1, 1),
(354, 1, 1),
(355, 1, 1),
(356, 1, 1),
(357, 1, 1),
(359, 1, 1),
(361, 1, 1),
(363, 1, 1),
(365, 1, 1),
(367, 1, 1),
(368, 1, 1),
(369, 1, 1),
(373, 1, 1),
(375, 1, 1),
(377, 1, 1),
(378, 1, 1),
(379, 1, 1),
(381, 1, 1),
(383, 1, 1),
(385, 1, 1),
(387, 1, 1),
(388, 1, 1),
(390, 1, 1),
(392, 1, 1),
(394, 1, 1),
(399, 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `fieldLayoutId`, `name`, `handle`, `icon`, `color`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `showSlugField`, `slugTranslationMethod`, `slugTranslationKeyFormat`, `showStatusField`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 'Pagina', 'page', NULL, NULL, 1, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-02-22 10:33:46', '2025-02-23 10:11:43', NULL, '2b1b3dcb-0aea-4b32-b903-c03a0490bbc7'),
(2, 2, 'Tekst', 'text', NULL, NULL, 0, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-02-22 10:59:55', '2025-02-22 10:59:55', NULL, 'bda95243-a765-44ba-a3e8-4cc60da1c145'),
(3, 3, 'Link', 'link', NULL, NULL, 0, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-02-22 11:03:11', '2025-02-22 11:03:11', NULL, 'd0e0d958-7098-46b6-8b99-cf083aae26d7'),
(4, 4, 'Inhoud', 'pageContent', NULL, NULL, 0, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-02-22 11:04:52', '2025-02-22 11:04:52', NULL, '548e3f68-624a-44fb-a801-020e085b102a'),
(5, 5, 'Informatie', 'info', NULL, NULL, 0, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-02-23 11:03:16', '2025-02-23 11:03:16', NULL, '3b838d7e-ee1b-4818-a756-dc28dd571e47'),
(7, 7, 'Titel', 'heading', NULL, NULL, 1, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-03-02 17:30:31', '2025-03-02 17:30:31', NULL, '4c7a80d6-0249-476d-95bf-c287d9c3dcdf'),
(8, 8, 'Titel', 'menuTitle', NULL, NULL, 1, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-03-02 17:31:48', '2025-03-02 18:05:32', NULL, '910ab6e9-35ce-4942-97f8-70a8cdd26ec1'),
(9, 9, 'Menu item', 'menuItem', NULL, NULL, 1, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-03-02 17:45:15', '2025-03-02 18:16:18', NULL, '940e46c6-2d30-4fcb-9c38-be18c9ac6319'),
(10, 10, 'Melding', 'infoNotice', NULL, NULL, 1, 'site', NULL, NULL, 1, 'site', NULL, 1, '2025-03-20 18:59:44', '2025-03-22 09:32:21', NULL, '9cae0250-7f3f-4567-aaa2-378d5a8f0ef6');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `config`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"960fe609-3782-4534-94d7-76b68668d027\", \"name\": \"Inhoud\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"5e5751cc-9c71-4abd-8f46-5f6506729803\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-02-23T10:11:43+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"169c70fc-9293-4849-91e8-e0938da17b5a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ba296aae-74d1-423d-af48-451e3f2c83e8\", \"required\": false, \"dateAdded\": \"2025-02-22T11:06:06+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}', '2025-02-22 10:33:46', '2025-02-23 10:11:43', NULL, 'a4379e1d-2b4f-43f4-bd85-d3a46b04d695'),
(2, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"4b84cbd6-b1f7-49b1-a4ee-e2835ddc27d7\", \"name\": \"Inhoud\", \"elements\": [{\"tip\": null, \"uid\": \"3bd3452d-f2d6-48a3-81c1-af01998a0532\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"22739330-272f-4214-be42-a5e7c7cd0978\", \"required\": true, \"dateAdded\": \"2025-02-22T10:59:55+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:3bd3452d-f2d6-48a3-81c1-af01998a0532\"]}', '2025-02-22 10:59:55', '2025-02-23 10:14:35', NULL, '6d22fb12-a799-4e5d-8209-fd1ee5b762d9'),
(3, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"8b11a69f-725d-4a98-8b7b-571daf47c2c3\", \"name\": \"Inhoud\", \"elements\": [{\"tip\": null, \"uid\": \"e8e53218-3787-4670-9c48-9e7a74ae4282\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d02ce1f-79b8-44ec-a46c-f81e18a52b4d\", \"required\": false, \"dateAdded\": \"2025-02-22T11:03:11+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}', '2025-02-22 11:03:11', '2025-02-22 11:03:11', NULL, 'b94ed382-2d42-4ddc-9183-00da95d6467b'),
(4, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"00164f91-33f9-426c-abbc-667942e8bf3c\", \"name\": \"Inhoud\", \"elements\": [{\"tip\": null, \"uid\": \"2d3023ad-0b5f-48bc-bfe8-397c333f64fd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ba296aae-74d1-423d-af48-451e3f2c83e8\", \"required\": false, \"dateAdded\": \"2025-02-22T11:04:42+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}', '2025-02-22 11:04:52', '2025-02-22 11:04:52', NULL, '32486c3b-e1a3-48dd-bb2f-57f7dfa40b40'),
(5, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"ee7bc746-9174-4b25-ba6b-768d4a011eb4\", \"name\": \"Inhoud\", \"elements\": [{\"tip\": null, \"uid\": \"501cd86e-e03b-409e-a612-3915bd5334cf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"6522b3e9-975e-46f9-82c4-ca4fd89ef4b4\", \"required\": false, \"dateAdded\": \"2025-02-23T11:03:16+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"fdf11145-cf77-4635-a872-2b900223e4e8\", \"required\": false, \"dateAdded\": \"2025-02-23T11:03:16+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"59feaa85-372b-4c24-9833-e024914015da\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2008324f-13c7-4130-b879-5e3e2d272123\", \"required\": false, \"dateAdded\": \"2025-02-23T11:03:16+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"85833dac-d58f-4262-b34a-7fc21a74c548\", \"required\": false, \"dateAdded\": \"2025-02-23T11:03:16+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"4a7d7474-2e78-459e-bebd-4bc23036ae77\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b8ab75b6-fc56-40da-b011-dcfed847dd63\", \"required\": false, \"dateAdded\": \"2025-02-28T19:35:14+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"8b68262e-6fe4-4dea-9563-543898f92f84\", \"required\": false, \"dateAdded\": \"2025-02-23T11:03:16+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e8402b03-d9a2-4670-9862-b5168dd5d4c5\", \"required\": false, \"dateAdded\": \"2025-02-23T11:03:16+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8f4c92f7-0cad-463d-a62c-34674a006fc9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5d067db8-2536-4d07-a966-d4f807d19704\", \"required\": false, \"dateAdded\": \"2025-02-28T18:19:43+00:00\", \"instructions\": \"Dit is het kadertje met de witte boord (om verlof in aan te geven)\", \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"1a96f985-7d65-4d40-b1d5-9658084d38aa\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b396c5ad-4751-4f93-9fd4-678f8f04dc88\", \"required\": false, \"dateAdded\": \"2025-02-23T11:03:16+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}', '2025-02-23 11:03:16', '2025-03-23 11:38:12', NULL, '2009f073-384e-4274-90d7-e934f3dc47a6'),
(7, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"eec2e347-833a-408e-9513-0d80283b974a\", \"name\": \"Inhoud\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"5139f290-d796-4e9c-939d-3a245226dca5\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-03-02T17:29:16+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"2745aa45-b3be-4e68-98f6-18cfaa805be0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"130f9745-bb01-4272-b43e-5c73a05a62f5\", \"required\": false, \"dateAdded\": \"2025-03-06T18:47:15+00:00\", \"instructions\": \"Deze (korte) tekst wordt (iets kleiner) onder de titel getoond\", \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}', '2025-03-02 17:30:31', '2025-03-06 18:48:05', NULL, 'b98e5cd1-20a7-4ba6-8016-95f065b5c875'),
(8, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"60985e37-ee87-4fd0-bde5-183343ca345e\", \"name\": \"Inhoud\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"4d40de7d-27c7-4f50-9a09-cc0ea2a13a41\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-03-02T17:30:30+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}', '2025-03-02 17:31:48', '2025-03-02 18:05:15', NULL, 'e6e53433-d867-4ac8-b52c-cb29f68f2c7c'),
(9, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"157f7df8-5019-462d-8da8-cf3e5a9572ef\", \"name\": \"Inhoud\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"11134caa-8d2a-4638-836d-3345c919f16e\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-03-02T17:43:45+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"130f9745-bb01-4272-b43e-5c73a05a62f5\", \"required\": false, \"dateAdded\": \"2025-03-02T18:18:51+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"f330bbb9-8719-455e-8670-c9cecff46d3f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 25, \"handle\": null, \"warning\": null, \"fieldUid\": \"9bc116c1-4a3f-4ab5-a101-b2d850599802\", \"required\": false, \"dateAdded\": \"2025-03-02T18:06:09+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"f1892e9f-b1ae-4915-9975-d5c68ef7f949\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 25, \"handle\": null, \"warning\": null, \"fieldUid\": \"911c7da7-e189-4dbe-90c5-50ec940f0111\", \"required\": false, \"dateAdded\": \"2025-03-02T18:16:18+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Omschrijving\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"22739330-272f-4214-be42-a5e7c7cd0978\", \"required\": false, \"dateAdded\": \"2025-03-02T18:06:09+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}', '2025-03-02 17:45:15', '2025-03-02 18:21:33', NULL, '5442c360-8da6-4905-b12e-82e7c92bd856'),
(10, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"abb95164-4c46-4cf7-a57b-13354bac20e1\", \"name\": \"Inhoud\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"9ce08f84-39f7-44a4-83b5-67020a60e5b0\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-03-20T18:58:19+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"355db1fa-c4f1-4c30-b027-2c772e449390\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"22739330-272f-4214-be42-a5e7c7cd0978\", \"required\": false, \"dateAdded\": \"2025-03-20T18:59:43+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:355db1fa-c4f1-4c30-b027-2c772e449390\"]}', '2025-03-20 18:59:43', '2025-03-22 09:32:21', NULL, '44d5388d-ca81-434a-ac1a-276080465586');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fields`
--

CREATE TABLE `fields` (
  `id` int NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fields`
--

INSERT INTO `fields` (`id`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Tekst', 'text', 'global', NULL, NULL, 1, 'none', NULL, 'craft\\ckeditor\\Field', '{\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"ckeConfig\":null,\"createButtonLabel\":null,\"defaultTransform\":null,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}', '2025-02-22 10:59:44', '2025-02-28 16:39:19', NULL, '22739330-272f-4214-be42-a5e7c7cd0978'),
(2, 'Inhoud', 'contentMatrix', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"createButtonLabel\":\"Nieuw tekstblok toevoegen\",\"defaultIndexViewMode\":\"cards\",\"entryTypes\":[{\"uid\":\"bda95243-a765-44ba-a3e8-4cc60da1c145\"},{\"uid\":\"d0e0d958-7098-46b6-8b99-cf083aae26d7\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}', '2025-02-22 11:00:20', '2025-02-23 10:21:39', NULL, 'ba296aae-74d1-423d-af48-451e3f2c83e8'),
(3, 'Knop', 'button', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Link', '{\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":true,\"typeSettings\":{\"asset\":{\"allowedKinds\":[\"image\",\"pdf\",\"word\"],\"showUnpermittedVolumes\":\"\",\"showUnpermittedFiles\":\"\"},\"entry\":{\"sources\":\"*\"},\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"\"}},\"types\":[\"entry\",\"url\",\"asset\",\"email\"]}', '2025-02-22 11:02:09', '2025-02-23 10:20:24', NULL, '9d02ce1f-79b8-44ec-a46c-f81e18a52b4d'),
(4, 'Straat en nummer', 'streetNr', 'global', NULL, NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2025-02-23 10:34:56', '2025-02-23 10:34:56', NULL, 'fdf11145-cf77-4635-a872-2b900223e4e8'),
(5, 'Postcode', 'zip', 'global', NULL, NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2025-02-23 10:35:18', '2025-02-23 10:35:55', NULL, '2008324f-13c7-4130-b879-5e3e2d272123'),
(6, 'Plaats', 'city', 'global', NULL, NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2025-02-23 10:35:29', '2025-02-28 18:44:27', NULL, '85833dac-d58f-4262-b34a-7fc21a74c548'),
(7, 'Telefoonnummer', 'tel', 'global', NULL, NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2025-02-23 10:35:44', '2025-02-23 10:35:44', NULL, 'e8402b03-d9a2-4670-9862-b5168dd5d4c5'),
(8, 'Mailadres', 'email', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2025-02-23 10:36:12', '2025-02-23 10:36:12', NULL, '8b68262e-6fe4-4dea-9563-543898f92f84'),
(9, 'BTW nummer', 'btwNr', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2025-02-23 10:36:57', '2025-02-23 10:36:57', NULL, '6522b3e9-975e-46f9-82c4-ca4fd89ef4b4'),
(10, 'Info', 'info', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Table', '{\"staticRows\":false,\"addRowLabel\":\"Voeg een rij toe\",\"maxRows\":null,\"minRows\":null,\"columns\":{\"col1\":{\"heading\":\"Heading\",\"handle\":\"heading\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Tekst\",\"handle\":\"text\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\",\"col2\":\"\"}]}', '2025-02-23 10:38:52', '2025-02-23 10:39:09', NULL, 'b396c5ad-4751-4f93-9fd4-678f8f04dc88'),
(11, 'Melding', 'notice', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"entryTypes\":[{\"uid\":\"9cae0250-7f3f-4567-aaa2-378d5a8f0ef6\"}],\"includeTableView\":false,\"maxEntries\":1,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}', '2025-02-28 18:18:50', '2025-03-22 09:32:21', NULL, '5d067db8-2536-4d07-a966-d4f807d19704'),
(12, 'Tonen', 'tonen', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Lightswitch', '{\"default\":false,\"offLabel\":null,\"onLabel\":null}', '2025-02-28 18:21:58', '2025-02-28 18:21:58', NULL, 'a0958a06-0e63-499a-99fe-ec51c95e9112'),
(13, 'Google Maps', 'googleMaps', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Link', '{\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":true,\"typeSettings\":{\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"\"}},\"types\":[\"url\"]}', '2025-02-28 19:34:54', '2025-02-28 19:37:58', NULL, 'b8ab75b6-fc56-40da-b011-dcfed847dd63'),
(14, 'Prijs', 'price', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2025-03-02 17:29:31', '2025-03-02 17:33:43', NULL, '9bc116c1-4a3f-4ab5-a101-b2d850599802'),
(15, 'Menu items', 'menuItems', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"entryTypes\":[{\"uid\":\"defc9f1f-e62f-43bf-be07-095e39862b6a\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}', '2025-03-02 17:30:43', '2025-03-02 17:44:30', NULL, '7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5'),
(16, 'Menu', 'menu', 'global', NULL, NULL, 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"entryTypes\":[{\"uid\":\"940e46c6-2d30-4fcb-9c38-be18c9ac6319\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}', '2025-03-02 17:45:16', '2025-03-02 17:45:16', NULL, '7747f5f0-436a-4424-87ff-129d6f72472a'),
(17, 'Pikantheid', 'spicyness', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Dropdown', '{\"customOptions\":false,\"options\":[{\"label\":\"0\",\"value\":\"\",\"default\":\"\"},{\"label\":\"1\",\"value\":\"1\",\"default\":\"\"},{\"label\":\"2\",\"value\":\"2\",\"default\":\"\"},{\"label\":\"3\",\"value\":\"3\",\"default\":\"\"},{\"label\":\"4\",\"value\":\"4\",\"default\":\"\"},{\"label\":\"5\",\"value\":\"5\",\"default\":\"\"}]}', '2025-03-02 18:15:52', '2025-03-02 18:20:21', NULL, '911c7da7-e189-4dbe-90c5-50ec940f0111'),
(18, 'Extra', 'extra', 'global', NULL, 'Deze (korte) tekst wordt naast de titel getoond', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":50,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2025-03-02 18:18:43', '2025-03-02 18:18:43', NULL, '130f9745-bb01-4272-b43e-5c73a05a62f5');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `imagetransformindex`
--

CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `imagetransforms`
--

CREATE TABLE `imagetransforms` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `info`
--

CREATE TABLE `info` (
  `id` int NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '5.7.8', '5.7.0.3', 0, 'llwicrndsgfm', '3@qntrtkywrj', '2025-02-22 10:22:11', '2025-05-29 09:42:06', '9ac8b241-a437-46df-886a-91ee8fabfc11');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '8a0f221f-b5a7-4bba-9897-2f270e9e5a23'),
(2, 'craft', 'm221101_115859_create_entries_authors_table', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '02248205-03d7-4a6f-9a1c-ccaebb55d1be'),
(3, 'craft', 'm221107_112121_add_max_authors_to_sections', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'c66a595d-d295-4dfd-9d48-666164e256de'),
(4, 'craft', 'm221205_082005_translatable_asset_alt_text', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2a129216-b59c-4d3e-ace6-5d68cef79acd'),
(5, 'craft', 'm230314_110309_add_authenticator_table', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'ae3d4a16-b2f6-45c4-986b-84615c1d19e9'),
(6, 'craft', 'm230314_111234_add_webauthn_table', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'c9be578b-d6f3-401b-b243-a86a5af3c116'),
(7, 'craft', 'm230503_120303_add_recoverycodes_table', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '7bea8712-3ebc-433a-8905-99deb57272e2'),
(8, 'craft', 'm230511_000000_field_layout_configs', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '5e008fc8-eeb4-4987-8715-b64895c23c91'),
(9, 'craft', 'm230511_215903_content_refactor', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'ccf577d4-bff5-4443-8fa8-b637ed8a82d1'),
(10, 'craft', 'm230524_000000_add_entry_type_show_slug_field', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '6eaac934-e3fc-4af0-89e8-edbb6227296f'),
(11, 'craft', 'm230524_000001_entry_type_icons', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '622c1dfb-f549-4fb4-b289-028edbe9c9cf'),
(12, 'craft', 'm230524_000002_entry_type_colors', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '11f7fe50-11cc-408d-9c54-59e4a5095913'),
(13, 'craft', 'm230524_220029_global_entry_types', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'c4df31cd-bf25-430e-842c-03981818a76e'),
(14, 'craft', 'm230531_123004_add_entry_type_show_status_field', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'b6b4d083-bc2c-485c-81bf-5137551c45d7'),
(15, 'craft', 'm230607_102049_add_entrytype_slug_translation_columns', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '6dc69154-5ef1-49ec-ba58-c8f217982320'),
(16, 'craft', 'm230616_173810_kill_field_groups', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '512c6b35-247c-42c7-8968-a7bd25bdedf2'),
(17, 'craft', 'm230616_183820_remove_field_name_limit', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '76e67d92-d00a-4945-ab2d-ec5ff90a4be8'),
(18, 'craft', 'm230617_070415_entrify_matrix_blocks', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'ff280345-abe2-45c5-ab98-e3125d8dc17f'),
(19, 'craft', 'm230710_162700_element_activity', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '4fd68dc2-e9eb-4b85-b8ac-3670ef1a0b68'),
(20, 'craft', 'm230820_162023_fix_cache_id_type', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '530676aa-1fdd-4d76-9a50-57488623fa3e'),
(21, 'craft', 'm230826_094050_fix_session_id_type', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'e56d4540-3a36-4375-9078-72aa86ca6040'),
(22, 'craft', 'm230904_190356_address_fields', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '1eed2995-7091-417c-9d48-90e9a005101d'),
(23, 'craft', 'm230928_144045_add_subpath_to_volumes', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '7b8aacd4-e609-4e1f-a60a-1600104f6cde'),
(24, 'craft', 'm231013_185640_changedfields_amend_primary_key', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'e0986037-ce4c-4431-ad3b-4d2fd8d78d26'),
(25, 'craft', 'm231213_030600_element_bulk_ops', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '31090818-183c-4cd9-8ea3-75ed15ea17f7'),
(26, 'craft', 'm240129_150719_sites_language_amend_length', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'a8df5ea7-7441-4c66-9e60-4db06264dbf2'),
(27, 'craft', 'm240206_035135_convert_json_columns', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'be36e6e2-41b5-4c8d-b45f-3841841e8073'),
(28, 'craft', 'm240207_182452_address_line_3', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2ba9b2b4-5065-4d5d-90dd-b04c454ad00d'),
(29, 'craft', 'm240302_212719_solo_preview_targets', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '8bb25dd2-251c-4b6d-9404-de5565ac594a'),
(30, 'craft', 'm240619_091352_add_auth_2fa_timestamp', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '90f705a8-945a-4249-aadc-6baef7f4e66d'),
(31, 'craft', 'm240723_214330_drop_bulkop_fk', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'cba412fd-a0a0-4b7d-ab3f-08f1f97783d2'),
(32, 'craft', 'm240731_053543_soft_delete_fields', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '3183bcea-fbdd-418e-b16f-0b01a4559fc8'),
(33, 'craft', 'm240805_154041_sso_identities', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'fe63bc32-c4ea-4fc1-9297-b0f165a2d4ae'),
(34, 'craft', 'm240926_202248_track_entries_deleted_with_section', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '7c1652a4-8ad9-4794-af4a-e1263d35db6f'),
(35, 'craft', 'm241120_190905_user_affiliated_sites', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', 'be8347e0-af15-427b-a5d5-d0359be7b7ab'),
(36, 'craft', 'm241125_122914_add_viewUsers_permission', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '65061cc0-b104-456c-ba36-f710a7230d0a'),
(37, 'craft', 'm250119_135304_entry_type_overrides', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '2025-02-22 10:22:12', '06581195-3652-48fc-8400-caccbb354682'),
(38, 'plugin:tinymce', 'Install', '2025-02-22 11:12:26', '2025-02-22 11:12:26', '2025-02-22 11:12:26', '2d5a787b-6f46-47cf-9409-991a95a6c57d'),
(39, 'plugin:ckeditor', 'Install', '2025-02-28 16:35:36', '2025-02-28 16:35:36', '2025-02-28 16:35:36', 'ff1fc29d-4e6d-4d98-85fe-a8f319754b51'),
(40, 'plugin:ckeditor', 'm230408_163704_v3_upgrade', '2025-02-28 16:35:36', '2025-02-28 16:35:36', '2025-02-28 16:35:36', '9f928999-2a37-408f-8049-dbb69c77b979'),
(41, 'craft', 'm250206_135036_search_index_queue', '2025-05-29 09:42:06', '2025-05-29 09:42:06', '2025-05-29 09:42:06', 'c1dd9571-191f-4ec1-8e5b-a464ec915d1e'),
(42, 'craft', 'm250207_172349_bulkop_events', '2025-05-29 09:42:06', '2025-05-29 09:42:06', '2025-05-29 09:42:06', 'f3513751-13e2-41eb-a424-ebff050d9cf3'),
(43, 'craft', 'm250315_131608_unlimited_authors', '2025-05-29 09:42:06', '2025-05-29 09:42:06', '2025-05-29 09:42:06', 'd07c015c-eedd-4d09-9f81-c977afb2187c'),
(44, 'craft', 'm250403_171253_static_statuses', '2025-05-29 09:42:06', '2025-05-29 09:42:06', '2025-05-29 09:42:06', '925da84d-5cb3-4020-8554-5a07c93183fe');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `plugins`
--

CREATE TABLE `plugins` (
  `id` int NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'tinymce', '2.0.1', '1.0.0', '2025-02-22 11:12:26', '2025-02-22 11:12:26', '2025-02-22 11:12:26', '7cb9d301-96fc-43c5-9b36-1351361171e6'),
(2, 'cp-field-inspect', '2.0.4', '1.0.0', '2025-02-23 10:04:42', '2025-02-23 10:04:42', '2025-02-23 10:04:42', '35b39fc5-8432-4565-afb1-18f8c8a7a924'),
(3, 'ckeditor', '4.9.0', '3.0.0.0', '2025-02-28 16:35:36', '2025-02-28 16:35:36', '2025-05-29 09:42:06', 'd6efb2fc-7abd-47e6-9003-423b362ed427');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.headingLevels.0', '1'),
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.headingLevels.1', '2'),
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.headingLevels.2', '3'),
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.headingLevels.3', '4'),
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.headingLevels.4', '5'),
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.headingLevels.5', '6'),
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.name', '\"Simple\"'),
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.toolbar.0', '\"bold\"'),
('ckeditor.configs.fdb5eef6-de84-4ce5-9d33-787bd5b8c792.toolbar.1', '\"underline\"'),
('dateModified', '1748511726'),
('email.fromEmail', '\"admin@janhendrickx.be\"'),
('email.fromName', '\"Eskobar\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.color', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elementCondition', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.class', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.dateAdded', '\"2025-02-23T10:11:43+00:00\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.disabled', 'false'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.id', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.inputType', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.instructions', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.label', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.max', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.min', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.name', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.orientation', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.readonly', 'false'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.required', 'true'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.size', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.step', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.tip', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.title', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.uid', '\"5e5751cc-9c71-4abd-8f46-5f6506729803\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.warning', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.0.width', '100'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.dateAdded', '\"2025-02-22T11:06:06+00:00\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.fieldUid', '\"ba296aae-74d1-423d-af48-451e3f2c83e8\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.handle', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.instructions', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.label', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.required', 'false'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.tip', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.uid', '\"169c70fc-9293-4849-91e8-e0938da17b5a\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.warning', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.elements.1.width', '100'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.name', '\"Inhoud\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.uid', '\"960fe609-3782-4534-94d7-76b68668d027\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.fieldLayouts.a4379e1d-2b4f-43f4-bd85-d3a46b04d695.tabs.0.userCondition', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.handle', '\"page\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.hasTitleField', 'true'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.icon', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.name', '\"Pagina\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.showSlugField', 'true'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.showStatusField', 'true'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.slugTranslationKeyFormat', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.slugTranslationMethod', '\"site\"'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.titleFormat', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.titleTranslationKeyFormat', 'null'),
('entryTypes.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7.titleTranslationMethod', '\"site\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.color', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.dateAdded', '\"2025-02-23T11:03:16+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.fieldUid', '\"6522b3e9-975e-46f9-82c4-ca4fd89ef4b4\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.instructions', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.uid', '\"501cd86e-e03b-409e-a612-3915bd5334cf\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.0.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.dateAdded', '\"2025-02-23T11:03:16+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.fieldUid', '\"fdf11145-cf77-4635-a872-2b900223e4e8\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.instructions', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.uid', '\"50d2a0a7-eb58-4034-a2cc-758051ba4cdb\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.1.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.dateAdded', '\"2025-02-23T11:03:16+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.fieldUid', '\"2008324f-13c7-4130-b879-5e3e2d272123\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.instructions', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.uid', '\"59feaa85-372b-4c24-9833-e024914015da\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.2.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.dateAdded', '\"2025-02-23T11:03:16+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.fieldUid', '\"85833dac-d58f-4262-b34a-7fc21a74c548\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.instructions', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.uid', '\"29a726c5-f31d-44fb-9a76-cc8ec77f4ed4\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.3.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.dateAdded', '\"2025-02-28T19:35:14+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.fieldUid', '\"b8ab75b6-fc56-40da-b011-dcfed847dd63\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.instructions', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.uid', '\"4a7d7474-2e78-459e-bebd-4bc23036ae77\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.4.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.dateAdded', '\"2025-02-23T11:03:16+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.fieldUid', '\"8b68262e-6fe4-4dea-9563-543898f92f84\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.instructions', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.uid', '\"ce73a9b0-8036-42ec-b3ad-a409f4521c8d\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.5.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.dateAdded', '\"2025-02-23T11:03:16+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.fieldUid', '\"e8402b03-d9a2-4670-9862-b5168dd5d4c5\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.instructions', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.uid', '\"9dff07d4-0fa9-4811-9884-a9bb2fe5f847\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.6.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.dateAdded', '\"2025-02-28T18:19:43+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.fieldUid', '\"5d067db8-2536-4d07-a966-d4f807d19704\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.instructions', '\"Dit is het kadertje met de witte boord (om verlof in aan te geven)\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.uid', '\"8f4c92f7-0cad-463d-a62c-34674a006fc9\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.7.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.dateAdded', '\"2025-02-23T11:03:16+00:00\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.elementCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.fieldUid', '\"b396c5ad-4751-4f93-9fd4-678f8f04dc88\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.handle', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.includeInCards', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.instructions', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.label', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.providesThumbs', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.required', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.tip', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.uid', '\"1a96f985-7d65-4d40-b1d5-9658084d38aa\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.warning', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.elements.8.width', '100'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.name', '\"Inhoud\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.uid', '\"ee7bc746-9174-4b25-ba6b-768d4a011eb4\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.fieldLayouts.2009f073-384e-4274-90d7-e934f3dc47a6.tabs.0.userCondition', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.handle', '\"info\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.hasTitleField', 'false'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.icon', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.name', '\"Informatie\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.showSlugField', 'true'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.showStatusField', 'true'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.slugTranslationKeyFormat', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.slugTranslationMethod', '\"site\"'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.titleFormat', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.titleTranslationKeyFormat', 'null'),
('entryTypes.3b838d7e-ee1b-4818-a756-dc28dd571e47.titleTranslationMethod', '\"site\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.color', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elementCondition', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.class', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.dateAdded', '\"2025-03-02T17:29:16+00:00\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.disabled', 'false'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.id', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.inputType', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.instructions', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.label', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.max', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.min', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.name', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.orientation', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.readonly', 'false'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.required', 'true'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.size', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.step', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.tip', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.title', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.uid', '\"5139f290-d796-4e9c-939d-3a245226dca5\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.warning', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.0.width', '100'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.dateAdded', '\"2025-03-06T18:47:15+00:00\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.fieldUid', '\"130f9745-bb01-4272-b43e-5c73a05a62f5\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.handle', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.instructions', '\"Deze (korte) tekst wordt (iets kleiner) onder de titel getoond\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.label', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.required', 'false'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.tip', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.uid', '\"2745aa45-b3be-4e68-98f6-18cfaa805be0\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.warning', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.elements.1.width', '100'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.name', '\"Inhoud\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.uid', '\"eec2e347-833a-408e-9513-0d80283b974a\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.fieldLayouts.b98e5cd1-20a7-4ba6-8016-95f065b5c875.tabs.0.userCondition', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.handle', '\"heading\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.hasTitleField', 'true'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.icon', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.name', '\"Titel\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.showSlugField', 'true'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.showStatusField', 'true'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.slugTranslationKeyFormat', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.slugTranslationMethod', '\"site\"'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.titleFormat', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.titleTranslationKeyFormat', 'null'),
('entryTypes.4c7a80d6-0249-476d-95bf-c287d9c3dcdf.titleTranslationMethod', '\"site\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.color', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elementCondition', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.dateAdded', '\"2025-02-22T11:04:42+00:00\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.fieldUid', '\"ba296aae-74d1-423d-af48-451e3f2c83e8\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.handle', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.instructions', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.label', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.required', 'false'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.tip', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.uid', '\"2d3023ad-0b5f-48bc-bfe8-397c333f64fd\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.warning', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.elements.0.width', '100'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.name', '\"Inhoud\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.uid', '\"00164f91-33f9-426c-abbc-667942e8bf3c\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.fieldLayouts.32486c3b-e1a3-48dd-bb2f-57f7dfa40b40.tabs.0.userCondition', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.handle', '\"pageContent\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.hasTitleField', 'false'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.icon', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.name', '\"Inhoud\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.showSlugField', 'true'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.showStatusField', 'true'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.slugTranslationKeyFormat', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.slugTranslationMethod', '\"site\"'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.titleFormat', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.titleTranslationKeyFormat', 'null'),
('entryTypes.548e3f68-624a-44fb-a801-020e085b102a.titleTranslationMethod', '\"site\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.color', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elementCondition', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.class', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.dateAdded', '\"2025-03-02T17:30:30+00:00\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.disabled', 'false'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.id', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.inputType', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.instructions', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.label', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.max', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.min', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.name', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.orientation', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.readonly', 'false'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.required', 'true'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.size', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.step', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.tip', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.title', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.uid', '\"4d40de7d-27c7-4f50-9a09-cc0ea2a13a41\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.warning', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.elements.0.width', '100'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.name', '\"Inhoud\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.uid', '\"60985e37-ee87-4fd0-bde5-183343ca345e\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.fieldLayouts.e6e53433-d867-4ac8-b52c-cb29f68f2c7c.tabs.0.userCondition', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.handle', '\"menuTitle\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.hasTitleField', 'true'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.icon', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.name', '\"Titel\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.showSlugField', 'true'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.showStatusField', 'true'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.slugTranslationKeyFormat', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.slugTranslationMethod', '\"site\"'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.titleFormat', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.titleTranslationKeyFormat', 'null'),
('entryTypes.910ab6e9-35ce-4942-97f8-70a8cdd26ec1.titleTranslationMethod', '\"site\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.color', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elementCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.class', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.dateAdded', '\"2025-03-02T17:43:45+00:00\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.disabled', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.id', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.inputType', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.instructions', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.label', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.max', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.min', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.name', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.orientation', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.readonly', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.required', 'true'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.size', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.step', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.tip', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.title', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.uid', '\"11134caa-8d2a-4638-836d-3345c919f16e\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.warning', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.0.width', '100'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.dateAdded', '\"2025-03-02T18:18:51+00:00\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.fieldUid', '\"130f9745-bb01-4272-b43e-5c73a05a62f5\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.handle', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.instructions', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.label', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.required', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.tip', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.uid', '\"a20bb5ce-a5af-4262-94e1-cf44f40bdab9\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.warning', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.1.width', '50'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.dateAdded', '\"2025-03-02T18:06:09+00:00\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.fieldUid', '\"9bc116c1-4a3f-4ab5-a101-b2d850599802\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.handle', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.instructions', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.label', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.required', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.tip', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.uid', '\"f330bbb9-8719-455e-8670-c9cecff46d3f\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.warning', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.2.width', '25'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.dateAdded', '\"2025-03-02T18:16:18+00:00\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.fieldUid', '\"911c7da7-e189-4dbe-90c5-50ec940f0111\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.handle', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.includeInCards', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.instructions', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.label', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.providesThumbs', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.required', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.tip', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.uid', '\"f1892e9f-b1ae-4915-9975-d5c68ef7f949\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.warning', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.3.width', '25'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.dateAdded', '\"2025-03-02T18:06:09+00:00\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.fieldUid', '\"22739330-272f-4214-be42-a5e7c7cd0978\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.handle', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.includeInCards', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.instructions', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.label', '\"Omschrijving\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.providesThumbs', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.required', 'false'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.tip', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.uid', '\"1c5e0d34-9b13-47ba-b0fb-97af04ee75ae\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.warning', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.elements.4.width', '100'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.name', '\"Inhoud\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.uid', '\"157f7df8-5019-462d-8da8-cf3e5a9572ef\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.fieldLayouts.5442c360-8da6-4905-b12e-82e7c92bd856.tabs.0.userCondition', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.handle', '\"menuItem\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.hasTitleField', 'true'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.icon', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.name', '\"Menu item\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.showSlugField', 'true'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.showStatusField', 'true'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.slugTranslationKeyFormat', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.slugTranslationMethod', '\"site\"'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.titleFormat', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.titleTranslationKeyFormat', 'null'),
('entryTypes.940e46c6-2d30-4fcb-9c38-be18c9ac6319.titleTranslationMethod', '\"site\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.color', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.cardView.0', '\"layoutElement:355db1fa-c4f1-4c30-b027-2c772e449390\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elementCondition', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.class', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.dateAdded', '\"2025-03-20T18:58:19+00:00\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.disabled', 'false'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.id', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.inputType', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.instructions', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.label', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.max', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.min', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.name', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.orientation', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.readonly', 'false'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.required', 'true'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.size', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.step', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.tip', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.title', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.uid', '\"9ce08f84-39f7-44a4-83b5-67020a60e5b0\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.warning', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.0.width', '100'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.dateAdded', '\"2025-03-20T18:59:43+00:00\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.fieldUid', '\"22739330-272f-4214-be42-a5e7c7cd0978\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.handle', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.includeInCards', 'true'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.instructions', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.label', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.required', 'false'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.tip', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.uid', '\"355db1fa-c4f1-4c30-b027-2c772e449390\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.warning', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.elements.1.width', '100'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.name', '\"Inhoud\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.uid', '\"abb95164-4c46-4cf7-a57b-13354bac20e1\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.fieldLayouts.44d5388d-ca81-434a-ac1a-276080465586.tabs.0.userCondition', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.handle', '\"infoNotice\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.hasTitleField', 'true'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.icon', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.name', '\"Melding\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.showSlugField', 'true'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.showStatusField', 'true'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.slugTranslationKeyFormat', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.slugTranslationMethod', '\"site\"'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.titleFormat', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.titleTranslationKeyFormat', 'null'),
('entryTypes.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6.titleTranslationMethod', '\"site\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.color', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.cardView.0', '\"layoutElement:3bd3452d-f2d6-48a3-81c1-af01998a0532\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elementCondition', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.dateAdded', '\"2025-02-22T10:59:55+00:00\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.fieldUid', '\"22739330-272f-4214-be42-a5e7c7cd0978\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.handle', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.includeInCards', 'true'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.instructions', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.label', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.required', 'true'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.tip', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.uid', '\"3bd3452d-f2d6-48a3-81c1-af01998a0532\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.warning', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.elements.0.width', '100'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.name', '\"Inhoud\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.uid', '\"4b84cbd6-b1f7-49b1-a4ee-e2835ddc27d7\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.fieldLayouts.6d22fb12-a799-4e5d-8209-fd1ee5b762d9.tabs.0.userCondition', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.handle', '\"text\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.hasTitleField', 'false'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.icon', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.name', '\"Tekst\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.showSlugField', 'true'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.showStatusField', 'true'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.slugTranslationKeyFormat', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.slugTranslationMethod', '\"site\"'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.titleFormat', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.titleTranslationKeyFormat', 'null'),
('entryTypes.bda95243-a765-44ba-a3e8-4cc60da1c145.titleTranslationMethod', '\"site\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.color', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elementCondition', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.dateAdded', '\"2025-02-22T11:03:11+00:00\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.fieldUid', '\"9d02ce1f-79b8-44ec-a46c-f81e18a52b4d\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.handle', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.instructions', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.label', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.required', 'false'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.tip', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.uid', '\"e8e53218-3787-4670-9c48-9e7a74ae4282\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.warning', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.elements.0.width', '100'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.name', '\"Inhoud\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.uid', '\"8b11a69f-725d-4a98-8b7b-571daf47c2c3\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.fieldLayouts.b94ed382-2d42-4ddc-9183-00da95d6467b.tabs.0.userCondition', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.handle', '\"link\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.hasTitleField', 'false'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.icon', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.name', '\"Link\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.showSlugField', 'true'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.showStatusField', 'true'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.slugTranslationKeyFormat', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.slugTranslationMethod', '\"site\"'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.titleFormat', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.titleTranslationKeyFormat', 'null'),
('entryTypes.d0e0d958-7098-46b6-8b99-cf083aae26d7.titleTranslationMethod', '\"site\"'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.columnSuffix', 'null'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.handle', '\"extra\"'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.instructions', '\"Deze (korte) tekst wordt naast de titel getoond\"'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.name', '\"Extra\"'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.searchable', 'false'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.settings.byteLimit', 'null'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.settings.charLimit', '50'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.settings.code', 'false'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.settings.initialRows', '4'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.settings.multiline', 'false'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.settings.placeholder', 'null'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.settings.uiMode', '\"normal\"'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.translationKeyFormat', 'null'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.translationMethod', '\"none\"'),
('fields.130f9745-bb01-4272-b43e-5c73a05a62f5.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.columnSuffix', 'null'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.handle', '\"zip\"'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.instructions', 'null'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.name', '\"Postcode\"'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.searchable', 'true'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.settings.byteLimit', 'null'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.settings.charLimit', 'null'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.settings.code', 'false'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.settings.initialRows', '4'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.settings.multiline', 'false'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.settings.placeholder', 'null'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.settings.uiMode', '\"normal\"'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.translationKeyFormat', 'null'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.translationMethod', '\"none\"'),
('fields.2008324f-13c7-4130-b879-5e3e2d272123.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.columnSuffix', 'null'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.handle', '\"text\"'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.instructions', 'null'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.name', '\"Tekst\"'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.searchable', 'true'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.availableTransforms', '\"\"'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.availableVolumes', '\"\"'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.ckeConfig', 'null'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.createButtonLabel', 'null'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.defaultTransform', 'null'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.purifierConfig', 'null'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.purifyHtml', 'true'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.showUnpermittedFiles', 'false'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.showUnpermittedVolumes', 'false'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.showWordCount', 'false'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.sourceEditingGroups.0', '\"__ADMINS__\"'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.settings.wordLimit', 'null'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.translationKeyFormat', 'null'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.translationMethod', '\"none\"'),
('fields.22739330-272f-4214-be42-a5e7c7cd0978.type', '\"craft\\\\ckeditor\\\\Field\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.columnSuffix', 'null'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.handle', '\"notice\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.instructions', 'null'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.name', '\"Melding\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.searchable', 'true'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.createButtonLabel', 'null'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.defaultIndexViewMode', '\"cards\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.entryTypes.0.__assoc__.0.0', '\"uid\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.entryTypes.0.__assoc__.0.1', '\"9cae0250-7f3f-4567-aaa2-378d5a8f0ef6\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.includeTableView', 'false'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.maxEntries', '1'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.minEntries', 'null'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.pageSize', 'null'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.propagationKeyFormat', 'null'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.propagationMethod', '\"all\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.showCardsInGrid', 'false'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.settings.viewMode', '\"blocks\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.translationKeyFormat', 'null'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.translationMethod', '\"site\"'),
('fields.5d067db8-2536-4d07-a966-d4f807d19704.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.columnSuffix', 'null'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.handle', '\"btwNr\"'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.instructions', 'null'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.name', '\"BTW nummer\"'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.searchable', 'false'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.settings.byteLimit', 'null'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.settings.charLimit', 'null'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.settings.code', 'false'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.settings.initialRows', '4'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.settings.multiline', 'false'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.settings.placeholder', 'null'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.settings.uiMode', '\"normal\"'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.translationKeyFormat', 'null'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.translationMethod', '\"none\"'),
('fields.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.columnSuffix', 'null'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.handle', '\"menu\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.instructions', 'null'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.name', '\"Menu\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.searchable', 'false'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.createButtonLabel', 'null'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.defaultIndexViewMode', '\"cards\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.entryTypes.0.__assoc__.0.0', '\"uid\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.entryTypes.0.__assoc__.0.1', '\"940e46c6-2d30-4fcb-9c38-be18c9ac6319\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.includeTableView', 'false'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.maxEntries', 'null'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.minEntries', 'null'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.pageSize', '50'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.propagationKeyFormat', 'null'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.propagationMethod', '\"all\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.showCardsInGrid', 'false'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.settings.viewMode', '\"cards\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.translationKeyFormat', 'null'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.translationMethod', '\"site\"'),
('fields.7747f5f0-436a-4424-87ff-129d6f72472a.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.columnSuffix', 'null'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.handle', '\"menuItems\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.instructions', 'null'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.name', '\"Menu items\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.searchable', 'true'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.createButtonLabel', 'null'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.defaultIndexViewMode', '\"cards\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.entryTypes.0.__assoc__.0.0', '\"uid\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.entryTypes.0.__assoc__.0.1', '\"defc9f1f-e62f-43bf-be07-095e39862b6a\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.includeTableView', 'false'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.maxEntries', 'null'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.minEntries', 'null'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.pageSize', 'null'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.propagationKeyFormat', 'null'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.propagationMethod', '\"all\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.showCardsInGrid', 'false'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.settings.viewMode', '\"blocks\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.translationKeyFormat', 'null'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.translationMethod', '\"site\"'),
('fields.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.columnSuffix', 'null'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.handle', '\"city\"'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.instructions', 'null'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.name', '\"Plaats\"'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.searchable', 'true'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.settings.byteLimit', 'null'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.settings.charLimit', 'null'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.settings.code', 'false'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.settings.initialRows', '4'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.settings.multiline', 'false'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.settings.placeholder', 'null'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.settings.uiMode', '\"normal\"'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.translationKeyFormat', 'null'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.translationMethod', '\"none\"'),
('fields.85833dac-d58f-4262-b34a-7fc21a74c548.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.columnSuffix', 'null'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.handle', '\"email\"'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.instructions', 'null'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.name', '\"Mailadres\"'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.searchable', 'false'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.settings.byteLimit', 'null'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.settings.charLimit', 'null'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.settings.code', 'false'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.settings.initialRows', '4'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.settings.multiline', 'false'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.settings.placeholder', 'null'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.settings.uiMode', '\"normal\"'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.translationKeyFormat', 'null'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.translationMethod', '\"none\"'),
('fields.8b68262e-6fe4-4dea-9563-543898f92f84.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.columnSuffix', 'null'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.handle', '\"spicyness\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.instructions', 'null'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.name', '\"Pikantheid\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.searchable', 'false'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.customOptions', 'false'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.0.__assoc__.0.0', '\"label\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.0.__assoc__.0.1', '\"0\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.0.__assoc__.1.0', '\"value\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.0.__assoc__.1.1', '\"\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.0.__assoc__.2.0', '\"default\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.0.__assoc__.2.1', '\"\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.1.__assoc__.0.0', '\"label\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.1.__assoc__.0.1', '\"1\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.1.__assoc__.1.0', '\"value\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.1.__assoc__.1.1', '\"1\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.1.__assoc__.2.0', '\"default\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.1.__assoc__.2.1', '\"\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.2.__assoc__.0.0', '\"label\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.2.__assoc__.0.1', '\"2\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.2.__assoc__.1.0', '\"value\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.2.__assoc__.1.1', '\"2\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.2.__assoc__.2.0', '\"default\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.2.__assoc__.2.1', '\"\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.3.__assoc__.0.0', '\"label\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.3.__assoc__.0.1', '\"3\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.3.__assoc__.1.0', '\"value\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.3.__assoc__.1.1', '\"3\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.3.__assoc__.2.0', '\"default\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.3.__assoc__.2.1', '\"\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.4.__assoc__.0.0', '\"label\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.4.__assoc__.0.1', '\"4\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.4.__assoc__.1.0', '\"value\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.4.__assoc__.1.1', '\"4\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.4.__assoc__.2.0', '\"default\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.4.__assoc__.2.1', '\"\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.5.__assoc__.0.0', '\"label\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.5.__assoc__.0.1', '\"5\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.5.__assoc__.1.0', '\"value\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.5.__assoc__.1.1', '\"5\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.5.__assoc__.2.0', '\"default\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.settings.options.5.__assoc__.2.1', '\"\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.translationKeyFormat', 'null'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.translationMethod', '\"none\"'),
('fields.911c7da7-e189-4dbe-90c5-50ec940f0111.type', '\"craft\\\\fields\\\\Dropdown\"'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.columnSuffix', 'null'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.handle', '\"price\"'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.instructions', 'null'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.name', '\"Prijs\"'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.searchable', 'false'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.settings.byteLimit', 'null'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.settings.charLimit', 'null'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.settings.code', 'false'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.settings.initialRows', '4'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.settings.multiline', 'false'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.settings.placeholder', 'null'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.settings.uiMode', '\"normal\"'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.translationKeyFormat', 'null'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.translationMethod', '\"none\"'),
('fields.9bc116c1-4a3f-4ab5-a101-b2d850599802.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.columnSuffix', 'null'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.handle', '\"button\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.instructions', 'null'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.name', '\"Knop\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.searchable', 'false'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.fullGraphqlData', 'true'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.maxLength', '255'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.showLabelField', 'true'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.types.0', '\"entry\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.types.1', '\"url\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.types.2', '\"asset\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.types.3', '\"email\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.0', '\"asset\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.1.__assoc__.0.0', '\"allowedKinds\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.0', '\"image\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.1', '\"pdf\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.2', '\"word\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.1.__assoc__.1.0', '\"showUnpermittedVolumes\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.1.__assoc__.1.1', '\"\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.1.__assoc__.2.0', '\"showUnpermittedFiles\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.0.1.__assoc__.2.1', '\"\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.1.0', '\"entry\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.1.1.__assoc__.0.0', '\"sources\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.1.1.__assoc__.0.1', '\"*\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.2.0', '\"url\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.2.1.__assoc__.0.0', '\"allowRootRelativeUrls\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.2.1.__assoc__.0.1', '\"\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.2.1.__assoc__.1.0', '\"allowAnchors\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.settings.typeSettings.__assoc__.2.1.__assoc__.1.1', '\"\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.translationKeyFormat', 'null'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.translationMethod', '\"none\"'),
('fields.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d.type', '\"craft\\\\fields\\\\Link\"'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.columnSuffix', 'null'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.handle', '\"tonen\"'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.instructions', 'null'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.name', '\"Tonen\"'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.searchable', 'false'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.settings.default', 'false'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.settings.offLabel', 'null'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.settings.onLabel', 'null'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.translationKeyFormat', 'null'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.translationMethod', '\"none\"'),
('fields.a0958a06-0e63-499a-99fe-ec51c95e9112.type', '\"craft\\\\fields\\\\Lightswitch\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.columnSuffix', 'null'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.handle', '\"info\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.instructions', 'null'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.name', '\"Info\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.searchable', 'false'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.addRowLabel', '\"Voeg een rij toe\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.0', '\"col1\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.1.__assoc__.0.0', '\"heading\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.1.__assoc__.0.1', '\"Heading\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.1.__assoc__.1.0', '\"handle\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.1.__assoc__.1.1', '\"heading\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.1.__assoc__.2.0', '\"width\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.1.__assoc__.2.1', '\"\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.1.__assoc__.3.0', '\"type\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.0.1.__assoc__.3.1', '\"singleline\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.0', '\"col2\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.1.__assoc__.0.0', '\"heading\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.1.__assoc__.0.1', '\"Tekst\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.1.__assoc__.1.0', '\"handle\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.1.__assoc__.1.1', '\"text\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.1.__assoc__.2.0', '\"width\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.1.__assoc__.2.1', '\"\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.1.__assoc__.3.0', '\"type\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.columns.__assoc__.1.1.__assoc__.3.1', '\"singleline\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.defaults.0.__assoc__.0.0', '\"col1\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.defaults.0.__assoc__.0.1', '\"\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.defaults.0.__assoc__.1.0', '\"col2\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.defaults.0.__assoc__.1.1', '\"\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.maxRows', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.minRows', 'null'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.settings.staticRows', 'false'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.translationKeyFormat', 'null'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.translationMethod', '\"none\"'),
('fields.b396c5ad-4751-4f93-9fd4-678f8f04dc88.type', '\"craft\\\\fields\\\\Table\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.columnSuffix', 'null'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.handle', '\"googleMaps\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.instructions', 'null'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.name', '\"Google Maps\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.searchable', 'false'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.fullGraphqlData', 'true'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.maxLength', '255'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.showLabelField', 'true'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.types.0', '\"url\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.typeSettings.__assoc__.0.0', '\"url\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.typeSettings.__assoc__.0.1.__assoc__.0.0', '\"allowRootRelativeUrls\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.typeSettings.__assoc__.0.1.__assoc__.0.1', '\"\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.typeSettings.__assoc__.0.1.__assoc__.1.0', '\"allowAnchors\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.settings.typeSettings.__assoc__.0.1.__assoc__.1.1', '\"\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.translationKeyFormat', 'null'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.translationMethod', '\"none\"'),
('fields.b8ab75b6-fc56-40da-b011-dcfed847dd63.type', '\"craft\\\\fields\\\\Link\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.columnSuffix', 'null'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.handle', '\"contentMatrix\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.instructions', 'null'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.name', '\"Inhoud\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.searchable', 'true'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.createButtonLabel', '\"Nieuw tekstblok toevoegen\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.defaultIndexViewMode', '\"cards\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.entryTypes.0.__assoc__.0.0', '\"uid\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.entryTypes.0.__assoc__.0.1', '\"bda95243-a765-44ba-a3e8-4cc60da1c145\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.entryTypes.1.__assoc__.0.0', '\"uid\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.entryTypes.1.__assoc__.0.1', '\"d0e0d958-7098-46b6-8b99-cf083aae26d7\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.includeTableView', 'false'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.maxEntries', 'null'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.minEntries', 'null'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.pageSize', 'null'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.propagationKeyFormat', 'null'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.propagationMethod', '\"all\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.showCardsInGrid', 'false'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.settings.viewMode', '\"blocks\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.translationKeyFormat', 'null'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.translationMethod', '\"site\"'),
('fields.ba296aae-74d1-423d-af48-451e3f2c83e8.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.columnSuffix', 'null'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.handle', '\"tel\"'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.instructions', 'null'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.name', '\"Telefoonnummer\"'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.searchable', 'true'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.settings.byteLimit', 'null'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.settings.charLimit', 'null'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.settings.code', 'false'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.settings.initialRows', '4'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.settings.multiline', 'false'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.settings.placeholder', 'null'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.settings.uiMode', '\"normal\"'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.translationKeyFormat', 'null'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.translationMethod', '\"none\"'),
('fields.e8402b03-d9a2-4670-9862-b5168dd5d4c5.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.columnSuffix', 'null'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.handle', '\"streetNr\"'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.instructions', 'null'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.name', '\"Straat en nummer\"'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.searchable', 'true'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.settings.byteLimit', 'null'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.settings.charLimit', 'null'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.settings.code', 'false'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.settings.initialRows', '4'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.settings.multiline', 'false'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.settings.placeholder', 'null'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.settings.uiMode', '\"normal\"'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.translationKeyFormat', 'null'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.translationMethod', '\"none\"'),
('fields.fdf11145-cf77-4635-a872-2b900223e4e8.type', '\"craft\\\\fields\\\\PlainText\"'),
('meta.__names__.031f77bd-afde-4104-87a5-377226a296b2', '\"Menu\"'),
('meta.__names__.130f9745-bb01-4272-b43e-5c73a05a62f5', '\"Extra\"'),
('meta.__names__.2008324f-13c7-4130-b879-5e3e2d272123', '\"Postcode\"'),
('meta.__names__.22739330-272f-4214-be42-a5e7c7cd0978', '\"Tekst\"'),
('meta.__names__.2b1b3dcb-0aea-4b32-b903-c03a0490bbc7', '\"Pagina\"'),
('meta.__names__.3b838d7e-ee1b-4818-a756-dc28dd571e47', '\"Informatie\"'),
('meta.__names__.3f24f68b-1921-4d40-82e8-23506b424e70', '\"Home\"'),
('meta.__names__.43468784-313c-4cf2-9eec-f27165d2afc5', '\"Eskobar\"'),
('meta.__names__.4c7a80d6-0249-476d-95bf-c287d9c3dcdf', '\"Titel\"'),
('meta.__names__.548e3f68-624a-44fb-a801-020e085b102a', '\"Inhoud\"'),
('meta.__names__.5d067db8-2536-4d07-a966-d4f807d19704', '\"Melding\"'),
('meta.__names__.6522b3e9-975e-46f9-82c4-ca4fd89ef4b4', '\"BTW nummer\"'),
('meta.__names__.7747f5f0-436a-4424-87ff-129d6f72472a', '\"Menu\"'),
('meta.__names__.7877c149-1d6f-4e55-a5e1-d3d8eb81bfe5', '\"Menu items\"'),
('meta.__names__.85833dac-d58f-4262-b34a-7fc21a74c548', '\"Plaats\"'),
('meta.__names__.8b68262e-6fe4-4dea-9563-543898f92f84', '\"Mailadres\"'),
('meta.__names__.910ab6e9-35ce-4942-97f8-70a8cdd26ec1', '\"Titel\"'),
('meta.__names__.911c7da7-e189-4dbe-90c5-50ec940f0111', '\"Pikantheid\"'),
('meta.__names__.940e46c6-2d30-4fcb-9c38-be18c9ac6319', '\"Menu item\"'),
('meta.__names__.9bc116c1-4a3f-4ab5-a101-b2d850599802', '\"Prijs\"'),
('meta.__names__.9cae0250-7f3f-4567-aaa2-378d5a8f0ef6', '\"Melding\"'),
('meta.__names__.9d02ce1f-79b8-44ec-a46c-f81e18a52b4d', '\"Knop\"'),
('meta.__names__.a0958a06-0e63-499a-99fe-ec51c95e9112', '\"Tonen\"'),
('meta.__names__.aff765af-7376-4642-81ae-09d1792f7303', '\"Info\"'),
('meta.__names__.b396c5ad-4751-4f93-9fd4-678f8f04dc88', '\"Info\"'),
('meta.__names__.b8ab75b6-fc56-40da-b011-dcfed847dd63', '\"Google Maps\"'),
('meta.__names__.ba296aae-74d1-423d-af48-451e3f2c83e8', '\"Inhoud\"'),
('meta.__names__.bda95243-a765-44ba-a3e8-4cc60da1c145', '\"Tekst\"'),
('meta.__names__.c44f25bd-e99c-4f49-87e4-1ac555445a3b', '\"Eskobar\"'),
('meta.__names__.d0e0d958-7098-46b6-8b99-cf083aae26d7', '\"Link\"'),
('meta.__names__.e65a5670-88d9-49a9-9a78-36b9261b6cb0', '\"Menu items\"'),
('meta.__names__.e8402b03-d9a2-4670-9862-b5168dd5d4c5', '\"Telefoonnummer\"'),
('meta.__names__.fdb5eef6-de84-4ce5-9d33-787bd5b8c792', '\"Simple\"'),
('meta.__names__.fdf11145-cf77-4635-a872-2b900223e4e8', '\"Straat en nummer\"'),
('plugins.ckeditor.edition', '\"standard\"'),
('plugins.ckeditor.enabled', 'true'),
('plugins.ckeditor.schemaVersion', '\"3.0.0.0\"'),
('plugins.cp-field-inspect.edition', '\"standard\"'),
('plugins.cp-field-inspect.enabled', 'true'),
('plugins.cp-field-inspect.schemaVersion', '\"1.0.0\"'),
('plugins.tinymce.edition', '\"standard\"'),
('plugins.tinymce.enabled', 'true'),
('plugins.tinymce.schemaVersion', '\"1.0.0\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.defaultPlacement', '\"end\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.enableVersioning', 'true'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.entryTypes.0.uid', '\"4c7a80d6-0249-476d-95bf-c287d9c3dcdf\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.handle', '\"menu\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.maxAuthors', '1'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.name', '\"Menu\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.previewTargets.0.__assoc__.0.1', '\"Primaire invoer-pagina\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.propagationMethod', '\"all\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.enabledByDefault', 'true'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.hasUrls', 'true'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.template', '\"page.twig\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.uriFormat', '\"menu\"'),
('sections.031f77bd-afde-4104-87a5-377226a296b2.type', '\"single\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.defaultPlacement', '\"end\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.enableVersioning', 'true'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.entryTypes.0.uid', '\"2b1b3dcb-0aea-4b32-b903-c03a0490bbc7\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.handle', '\"home\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.maxAuthors', '1'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.name', '\"Home\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.previewTargets.0.__assoc__.0.1', '\"Primaire invoer-pagina\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.propagationMethod', '\"all\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.enabledByDefault', 'true'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.hasUrls', 'true'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.template', '\"index.twig\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.uriFormat', '\"__home__\"'),
('sections.3f24f68b-1921-4d40-82e8-23506b424e70.type', '\"single\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.defaultPlacement', '\"end\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.enableVersioning', 'true'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.entryTypes.0.uid', '\"3b838d7e-ee1b-4818-a756-dc28dd571e47\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.handle', '\"info\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.maxAuthors', '1'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.name', '\"Info\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.previewTargets.0.__assoc__.0.1', '\"Primaire invoer-pagina\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.propagationMethod', '\"all\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.enabledByDefault', 'true'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.hasUrls', 'true'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.template', '\"page.twig\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.uriFormat', '\"info\"'),
('sections.aff765af-7376-4642-81ae-09d1792f7303.type', '\"single\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.defaultPlacement', '\"end\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.enableVersioning', 'true'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.entryTypes.0.uid', '\"940e46c6-2d30-4fcb-9c38-be18c9ac6319\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.entryTypes.1.uid', '\"4c7a80d6-0249-476d-95bf-c287d9c3dcdf\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.handle', '\"menuItems\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.maxAuthors', '1'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.name', '\"Menu items\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.previewTargets.0.__assoc__.0.1', '\"Primaire invoer-pagina\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.propagationMethod', '\"all\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.enabledByDefault', 'true'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.hasUrls', 'false'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.template', 'null'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.siteSettings.c44f25bd-e99c-4f49-87e4-1ac555445a3b.uriFormat', 'null'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.structure.maxLevels', '2'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.structure.uid', '\"0d8da9d5-492b-4dae-b1e3-9cd0a6b6ecb4\"'),
('sections.e65a5670-88d9-49a9-9a78-36b9261b6cb0.type', '\"structure\"'),
('siteGroups.43468784-313c-4cf2-9eec-f27165d2afc5.name', '\"Eskobar\"'),
('sites.c44f25bd-e99c-4f49-87e4-1ac555445a3b.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.c44f25bd-e99c-4f49-87e4-1ac555445a3b.handle', '\"default\"'),
('sites.c44f25bd-e99c-4f49-87e4-1ac555445a3b.hasUrls', 'true'),
('sites.c44f25bd-e99c-4f49-87e4-1ac555445a3b.language', '\"nl-BE\"'),
('sites.c44f25bd-e99c-4f49-87e4-1ac555445a3b.name', '\"Eskobar\"'),
('sites.c44f25bd-e99c-4f49-87e4-1ac555445a3b.primary', 'true'),
('sites.c44f25bd-e99c-4f49-87e4-1ac555445a3b.siteGroup', '\"43468784-313c-4cf2-9eec-f27165d2afc5\"'),
('sites.c44f25bd-e99c-4f49-87e4-1ac555445a3b.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Eskobar\"'),
('system.retryDuration', 'null'),
('system.schemaVersion', '\"5.7.0.3\"'),
('system.timeZone', '\"Europe/Brussels\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.require2fa', 'false'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `queue`
--

CREATE TABLE `queue` (
  `id` int NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `recoverycodes`
--

CREATE TABLE `recoverycodes` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `relations`
--

CREATE TABLE `relations` (
  `id` int NOT NULL,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('106319ec', '@craft/web/assets/selectize/dist'),
('12143940', '@craft/web/assets/timepicker/dist'),
('14baa338', '@craft/web/assets/craftsupport/dist'),
('16de74fc', '@craft/web/assets/xregexp/dist'),
('1776a3ce', '@craft/web/assets/tailwindreset/dist'),
('1c2bbba4', '@craft/web/assets/cp/dist'),
('1d66c9fc', '@craft/web/assets/picturefill/dist'),
('1dc49841', '@spicyweb/tinymce/assets/field/dist'),
('1dffcde4', '@craft/web/assets/garnish/dist'),
('1f657dcc', '@mmikkel/cpfieldinspect/web/assets'),
('201ab502', '@craft/web/assets/axios/dist'),
('213d1322', '@craft/web/assets/jquerypayment/dist'),
('216ecc40', '@craft/web/assets/jquerytouchevents/dist'),
('21d05bd0', '@bower/jquery/dist'),
('24aa1195', '@craft/web/assets/velocity/dist'),
('25676ccd', '@craft/web/assets/utilities/dist'),
('2b37cbc6', '@craft/web/assets/jqueryui/dist'),
('2baf9e7c', '@craft/web/assets/feed/dist'),
('2f369ae5', '@craft/web/assets/datepickeri18n/dist'),
('308ac9ce', '@craft/web/assets/vue/dist'),
('30d23991', '@craft/web/assets/editsection/dist'),
('354c1d6d', '@craft/web/assets/fileupload/dist'),
('354dfaf3', '@craft/web/assets/fabric/dist'),
('360b6583', '@craft/web/assets/plugins/dist'),
('38ef205b', '@craft/web/assets/recententries/dist'),
('3bbffeee', '@craft/web/assets/sites/dist'),
('3d7e04db', '@craft/web/assets/updates/dist'),
('3ec43e04', '@craft/web/assets/prismjs/dist'),
('409d97c6', '@craft/web/assets/xregexp/dist'),
('42f94002', '@craft/web/assets/craftsupport/dist'),
('43a45aa1', '@craft/web/assets/axios/dist'),
('4457da7a', '@craft/web/assets/timepicker/dist'),
('463a3a38', '@craft/web/assets/htmx/dist'),
('46d9836e', '@craft/web/assets/utilities/dist'),
('4af5b8d', '@craft/web/assets/dashboard/dist'),
('4b252ac6', '@craft/web/assets/picturefill/dist'),
('529289a7', '@craft/web/assets/updater/dist'),
('52ecb8b7', '@craft/web/assets/dashboard/dist'),
('56f31550', '@craft/web/assets/fabric/dist'),
('5b51cff8', '@craft/web/assets/recententries/dist'),
('61e9ded', '@craft/web/assets/d3/dist'),
('630ffe57', '@craft/web/assets/fileupload/dist'),
('6556235', '@craft/web/assets/updateswidget/dist'),
('65a0724e', '@craft/web/assets/d3/dist'),
('65eb8d96', '@craft/web/assets/updateswidget/dist'),
('6691daab', '@craft/web/assets/editsection/dist'),
('66c92af4', '@craft/web/assets/vue/dist'),
('68a8aecf', '@craft/web/assets/fieldsettings/dist'),
('6b3de7e1', '@craft/web/assets/updates/dist'),
('6cc4d9cd', '@craft/web/assets/generalsettings/dist'),
('6d632e4b', '@craft/web/assets/theme/dist'),
('6ec17bf9', '@craft/web/assets/iframeresizer/dist'),
('72e9f2af', '@craft/web/assets/velocity/dist'),
('73ddf64f', '@craft/web/assets/selectize/dist'),
('74c84c6d', '@craft/web/assets/tailwindreset/dist'),
('76ee647a', '@craft/web/assets/pluginstore/dist'),
('772d2f7a', '@craft/web/assets/jquerytouchevents/dist'),
('777ef018', '@craft/web/assets/jquerypayment/dist'),
('7793b8ea', '@bower/jquery/dist'),
('797579df', '@craft/web/assets/datepickeri18n/dist'),
('7d7428fc', '@craft/web/assets/jqueryui/dist'),
('7dec7d46', '@craft/web/assets/feed/dist'),
('7e412247', '@craft/web/assets/garnish/dist'),
('7f955407', '@craft/web/assets/cp/dist'),
('84116010', '@craft/web/assets/dashboard/dist'),
('8c42b347', '@craft/web/assets/axios/dist'),
('8ccfb586', '@craft/web/assets/admintable/dist'),
('8dac175f', '@craft/web/assets/recententries/dist'),
('91e92691', '@craft/web/assets/velocity/dist'),
('94002f05', '@mmikkel/cpfieldinspect/web/assets'),
('942dfb44', '@craft/web/assets/jquerytouchevents/dist'),
('947e2426', '@craft/web/assets/jquerypayment/dist'),
('97304e4a', '@craft/web/assets/conditionbuilder/dist'),
('9a75ade1', '@craft/web/assets/datepickeri18n/dist'),
('9d41f679', '@craft/web/assets/garnish/dist'),
('9eeca978', '@craft/web/assets/feed/dist'),
('a013bcdd', '@craft/web/assets/pluginstore/dist'),
('a16e604d', '@bower/jquery/dist'),
('a1f9943c', '@craft/web/assets/craftsupport/dist'),
('a23594ca', '@craft/web/assets/tailwindreset/dist'),
('a39d43f8', '@craft/web/assets/xregexp/dist'),
('a5202ee8', '@craft/web/assets/selectize/dist'),
('a5d95750', '@craft/web/assets/utilities/dist'),
('a825fef8', '@craft/web/assets/picturefill/dist'),
('a9688ca0', '@craft/web/assets/cp/dist'),
('aae65dea', '@nystudio107/codeeditor/web/assets/dist'),
('ab89f05b', '@craft/web/assets/jqueryui/dist'),
('ad028329', '@craft/web/assets/matrix/dist'),
('afb709fa', '@bower/inputmask/dist'),
('b3165531', '@craft/web/assets/updateswidget/dist'),
('b35daae9', '@craft/web/assets/d3/dist'),
('b5f226f0', '@craft/web/assets/fileupload/dist'),
('b5f3c16e', '@craft/web/assets/fabric/dist'),
('b83ca35e', '@craft/web/assets/iframeresizer/dist'),
('ba39016a', '@craft/web/assets/generalsettings/dist'),
('bb01c573', '@craft/web/assets/sites/dist'),
('bb9ef6ec', '@craft/web/assets/theme/dist'),
('bdc03f46', '@craft/web/assets/updates/dist'),
('be557668', '@craft/web/assets/fieldsettings/dist'),
('be7a0599', '@craft/web/assets/prismjs/dist'),
('c023ac5b', '@craft/web/assets/xregexp/dist'),
('c2477b9f', '@craft/web/assets/craftsupport/dist'),
('c2d08fee', '@bower/jquery/dist'),
('c31a613c', '@craft/web/assets/axios/dist'),
('c39767fd', '@craft/web/assets/admintable/dist'),
('c4e9e1e7', '@craft/web/assets/timepicker/dist'),
('c718e1b', '@craft/web/assets/admintable/dist'),
('c8371ff8', '@craft/web/assets/jqueryui/dist'),
('cb021543', '@craft/web/assets/garnish/dist'),
('cb9b115b', '@craft/web/assets/picturefill/dist'),
('cfe9a859', '@craft/ckeditor/web/assets/ckeconfig/dist'),
('d22cb23a', '@craft/web/assets/updater/dist'),
('d64cc953', '@craft/web/assets/fileupload/dist'),
('d7f945a', '@craft/web/assets/iframeresizer/dist'),
('dbeff465', '@craft/web/assets/recententries/dist'),
('dc6cdbda', '@craft/web/assets/money/dist'),
('de7ed0e5', '@craft/web/assets/updates/dist'),
('e3b02254', '@craft/web/assets/fabric/dist'),
('e51e49d3', '@craft/web/assets/d3/dist'),
('e555b60b', '@craft/web/assets/updateswidget/dist'),
('e62fe136', '@craft/web/assets/editsection/dist'),
('e6771169', '@craft/web/assets/vue/dist'),
('e7af8fb3', '@craft/web/assets/dashboard/dist'),
('e8169552', '@craft/web/assets/fieldsettings/dist'),
('ec7ae250', '@craft/web/assets/generalsettings/dist'),
('ed422649', '@craft/web/assets/sites/dist'),
('eddc1e8', '@craft/web/assets/theme/dist'),
('eddd15d6', '@craft/web/assets/theme/dist'),
('ee7f4064', '@craft/web/assets/iframeresizer/dist'),
('f257c932', '@craft/web/assets/velocity/dist'),
('f363cdd2', '@craft/web/assets/selectize/dist'),
('f39ab46a', '@craft/web/assets/utilities/dist'),
('f47677f0', '@craft/web/assets/tailwindreset/dist'),
('f79314e7', '@craft/web/assets/jquerytouchevents/dist'),
('f7c0cb85', '@craft/web/assets/jquerypayment/dist'),
('f985b8f', '@spicyweb/tinymce/assets/tinymce/dist'),
('f9cb4242', '@craft/web/assets/datepickeri18n/dist'),
('fa26501e', '@craft/ckeditor/web/assets/ckeditor/dist'),
('fb416013', '@craft/web/assets/matrix/dist'),
('fbb01c1c', '@craft/web/assets/tablesettings/dist'),
('fd5246db', '@craft/web/assets/feed/dist'),
('fde944ee', '@craft/web/assets/animationblocker/dist'),
('ff2b6f9a', '@craft/web/assets/cp/dist');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `revisions`
--

CREATE TABLE `revisions` (
  `id` int NOT NULL,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `revisions`
--

INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, '“Concept 1” toegepast'),
(3, 14, 1, 1, NULL),
(4, 15, 1, 1, NULL),
(5, 16, 1, 1, NULL),
(6, 17, 1, 1, NULL),
(7, 18, 1, 1, NULL),
(8, 2, 1, 3, '“Concept 1” toegepast'),
(9, 27, 1, 1, NULL),
(10, 2, 1, 4, '“Concept 1” toegepast'),
(11, 14, 1, 2, NULL),
(12, 15, 1, 2, NULL),
(13, 16, 1, 2, NULL),
(14, 18, 1, 2, NULL),
(15, 27, 1, 2, NULL),
(16, 2, 1, 5, '“Concept 1” toegepast'),
(17, 14, 1, 3, NULL),
(18, 49, 1, 1, NULL),
(19, 2, 1, 6, ''),
(20, 27, 1, 3, NULL),
(21, 55, 1, 1, NULL),
(22, 55, 1, 2, '“Concept 1” toegepast'),
(23, 55, 1, 3, ''),
(24, 55, 1, 4, '“Concept 1” toegepast'),
(25, 55, 1, 5, '“Concept 1” toegepast'),
(26, 55, 1, 6, '“Concept 1” toegepast'),
(27, 55, 1, 7, '“Concept 1” toegepast'),
(28, 55, 1, 8, '“Concept 1” toegepast'),
(29, 55, 1, 9, ''),
(30, 71, 1, 1, NULL),
(31, 71, 1, 2, '“Concept 1” toegepast'),
(32, 77, 1, 1, NULL),
(34, 71, 1, 3, '“Concept 1” toegepast'),
(39, 71, 1, 4, NULL),
(40, 71, 1, 5, '“Concept 1” toegepast'),
(41, 71, 1, 6, NULL),
(42, 71, 1, 7, '“Concept 1” toegepast'),
(43, 71, 1, 8, NULL),
(44, 71, 1, 9, '“Concept 1” toegepast'),
(45, 71, 1, 10, NULL),
(46, 71, 1, 11, NULL),
(47, 71, 1, 12, NULL),
(48, 71, 1, 13, '“Concept 1” toegepast'),
(50, 119, 1, 1, ''),
(51, 119, 1, 2, ''),
(52, 71, 1, 14, '“Concept 1” toegepast'),
(53, 119, 1, 3, ''),
(54, 124, 1, 1, ''),
(55, 124, 1, 2, ''),
(56, 127, 1, 1, ''),
(57, 127, 1, 2, ''),
(58, 130, 1, 1, ''),
(59, 130, 1, 2, ''),
(60, 133, 1, 1, ''),
(61, 133, 1, 2, ''),
(62, 136, 1, 1, ''),
(63, 138, 1, 1, ''),
(64, 140, 1, 1, ''),
(65, 140, 1, 2, ''),
(66, 143, 1, 1, ''),
(67, 146, 1, 1, ''),
(68, 146, 1, 2, '“Concept 1” toegepast'),
(69, 151, 1, 1, ''),
(70, 153, 1, 1, ''),
(71, 155, 1, 1, ''),
(72, 157, 1, 1, ''),
(73, 159, 1, 1, ''),
(74, 161, 1, 1, ''),
(75, 161, 1, 2, ''),
(76, 161, 1, 3, '“Concept 1” toegepast'),
(77, 157, 1, 2, '“Concept 1” toegepast'),
(78, 168, 1, 1, ''),
(79, 170, 1, 1, ''),
(80, 119, 1, 4, '“Concept 1” toegepast'),
(81, 119, 1, 5, '“Concept 1” toegepast'),
(82, 71, 1, 15, '“Concept 1” toegepast'),
(83, 71, 1, 16, '“Concept 1” toegepast'),
(84, 71, 1, 17, '“Concept 1” toegepast'),
(85, 71, 1, 18, '“Concept 1” toegepast'),
(86, 71, 1, 19, '“Concept 1” toegepast'),
(87, 155, 1, 2, '“Concept 1” toegepast'),
(88, 155, 1, 3, ''),
(89, 189, 1, 1, ''),
(90, 192, 1, 1, ''),
(91, 195, 1, 1, ''),
(92, 198, 1, 1, ''),
(93, 157, 1, 3, ''),
(94, 153, 1, 2, '“Concept 1” toegepast'),
(95, 55, 1, 10, '“Concept 1” toegepast'),
(96, 206, 1, 1, NULL),
(97, 209, 1, 1, NULL),
(98, 209, 1, 2, '“Concept 1” toegepast'),
(99, 209, 1, 3, NULL),
(100, 2, 1, 7, NULL),
(101, 209, 1, 4, NULL),
(102, 2, 1, 8, NULL),
(103, 14, 1, 4, NULL),
(104, 27, 1, 4, NULL),
(105, 49, 1, 2, NULL),
(106, 2, 1, 9, NULL),
(107, 2, 1, 10, NULL),
(108, 14, 1, 5, NULL),
(109, 27, 1, 5, NULL),
(110, 49, 1, 3, NULL),
(111, 209, 1, 5, NULL),
(112, 55, 1, 11, NULL),
(113, 206, 1, 2, NULL),
(114, 209, 1, 6, NULL),
(115, 2, 1, 11, NULL),
(116, 14, 1, 6, NULL),
(117, 27, 1, 6, NULL),
(118, 49, 1, 4, NULL),
(119, 2, 1, 12, '“Concept 1” toegepast'),
(120, 236, 1, 1, NULL),
(121, 14, 1, 7, NULL),
(122, 2, 1, 13, '“Concept 1” toegepast'),
(123, 49, 1, 5, NULL),
(124, 2, 1, 14, '“Concept 1” toegepast'),
(125, 27, 1, 7, NULL),
(126, 2, 1, 15, '“Concept 1” toegepast'),
(127, 27, 1, 8, NULL),
(128, 55, 1, 12, NULL),
(129, 55, 1, 13, NULL),
(130, 209, 1, 7, '“Concept 1” toegepast'),
(131, 124, 1, 3, NULL),
(132, 124, 1, 4, NULL),
(133, 261, 1, 1, ''),
(134, 261, 1, 2, '“Concept 1” toegepast'),
(135, 265, 1, 1, ''),
(136, 55, 1, 14, NULL),
(137, 55, 1, 15, NULL),
(138, 209, 1, 8, NULL),
(139, 55, 1, 16, NULL),
(140, 124, 1, 5, '“Concept 1” toegepast'),
(141, 71, 1, 20, '“Concept 1” toegepast'),
(142, 127, 1, 3, '“Concept 1” toegepast'),
(143, 130, 1, 3, '“Concept 1” toegepast'),
(144, 133, 1, 3, '“Concept 1” toegepast'),
(145, 136, 1, 2, '“Concept 1” toegepast'),
(146, 261, 1, 3, '“Concept 1” toegepast'),
(147, 265, 1, 2, '“Concept 1” toegepast'),
(148, 287, 1, 1, ''),
(149, 289, 1, 1, ''),
(150, 291, 1, 1, ''),
(151, 293, 1, 1, ''),
(152, 140, 1, 3, '“Concept 1” toegepast'),
(153, 143, 1, 2, '“Concept 2” toegepast'),
(154, 146, 1, 3, '“Concept 2” toegepast'),
(155, 151, 1, 2, '“Concept 1” toegepast'),
(156, 303, 1, 1, ''),
(157, 305, 1, 1, ''),
(158, 307, 1, 1, ''),
(159, 309, 1, 1, ''),
(160, 153, 1, 3, '“Concept 1” toegepast'),
(161, 140, 1, 4, ''),
(162, 143, 1, 3, ''),
(163, 146, 1, 4, ''),
(164, 151, 1, 3, ''),
(165, 153, 1, 4, ''),
(166, 161, 1, 4, '“Concept 1” toegepast'),
(167, 320, 1, 1, ''),
(168, 322, 1, 1, ''),
(169, 324, 1, 1, ''),
(170, 157, 1, 4, '“Concept 1” toegepast'),
(171, 159, 1, 2, '“Concept 1” toegepast'),
(172, 330, 1, 1, ''),
(173, 332, 1, 1, ''),
(174, 334, 1, 1, ''),
(175, 336, 1, 1, ''),
(176, 192, 1, 2, '“Concept 2” toegepast'),
(177, 195, 1, 2, '“Concept 2” toegepast'),
(178, 198, 1, 2, '“Concept 1” toegepast'),
(179, 344, 1, 1, ''),
(180, 170, 1, 2, '“Concept 1” toegepast'),
(181, 348, 1, 1, ''),
(182, 293, 1, 2, '“Concept 1” toegepast'),
(183, 352, 1, 1, ''),
(184, 354, 1, 1, ''),
(185, 356, 1, 1, ''),
(186, 287, 1, 2, '“Concept 1” toegepast'),
(187, 130, 1, 4, '“Concept 1” toegepast'),
(188, 71, 1, 21, '“Concept 1” toegepast'),
(189, 136, 1, 3, '“Concept 1” toegepast'),
(190, 291, 1, 2, '“Concept 1” toegepast'),
(191, 332, 1, 2, ''),
(192, 157, 1, 5, ''),
(193, 55, 1, 17, '“Concept 1” toegepast'),
(194, 206, 1, 3, NULL),
(195, 330, 1, 2, '“Concept 1” toegepast'),
(196, 265, 1, 3, '“Concept 1” toegepast'),
(197, 309, 1, 2, '“Concept 1” toegepast'),
(198, 143, 1, 4, ''),
(199, 151, 1, 4, ''),
(200, 161, 1, 5, '“Concept 1” toegepast'),
(201, 322, 1, 2, '“Concept 1” toegepast'),
(202, 322, 1, 3, '“Concept 1” toegepast'),
(203, 334, 1, 2, '“Concept 1” toegepast'),
(204, 330, 1, 3, ''),
(205, 332, 1, 3, '“Concept 1” toegepast'),
(206, 334, 1, 3, '“Concept 1” toegepast'),
(207, 332, 1, 4, '“Concept 1” toegepast'),
(208, 322, 1, 4, '“Concept 1” toegepast'),
(209, 55, 1, 18, NULL),
(210, 209, 1, 9, NULL),
(211, 2, 1, 16, NULL),
(212, 55, 1, 19, ''),
(213, 55, 1, 20, ''),
(214, 55, 1, 21, ''),
(215, 2, 1, 17, '“Concept 1” toegepast'),
(216, 236, 1, 2, NULL),
(217, 49, 1, 6, NULL),
(218, 2, 1, 18, ''),
(219, 2, 1, 19, '“Concept 1” toegepast'),
(220, 2, 1, 20, '“Concept 1” toegepast'),
(221, 2, 1, 21, ''),
(222, 2, 1, 22, '“Concept 1” toegepast'),
(223, 2, 1, 23, ''),
(224, 2, 1, 24, ''),
(225, 55, 1, 22, NULL),
(226, 209, 1, 10, NULL),
(227, 2, 1, 25, ''),
(228, 55, 1, 23, NULL),
(229, 209, 1, 11, NULL),
(230, 2, 1, 26, '“Concept 1” toegepast'),
(231, 236, 1, 3, NULL),
(232, 2, 1, 27, '“Concept 1” toegepast'),
(233, 27, 1, 9, NULL),
(234, 55, 1, 24, NULL),
(235, 209, 1, 12, NULL),
(236, 2, 1, 28, '“Concept 1” toegepast'),
(237, 14, 1, 8, NULL),
(238, 27, 1, 10, NULL),
(239, 2, 1, 29, '“Concept 1” toegepast'),
(240, 49, 1, 7, NULL),
(241, 55, 1, 25, NULL),
(242, 209, 1, 13, NULL),
(243, 2, 1, 30, '“Concept 1” toegepast'),
(244, 14, 1, 9, NULL),
(245, 2, 1, 31, ''),
(246, 2, 1, 32, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'email', 0, 1, ' admin janhendrickx be '),
(1, 'firstname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'slug', 0, 1, ''),
(1, 'username', 0, 1, ' admin '),
(2, 'field', 2, 1, ' houd je het klassiek met de eskoburger waan je je in italie met the godfather of reis je liever naar mexico met de el mariachi of toch nog iets anders er is voor iedereen wel een hapje of een burger welkom kristin en bart reservatie voor dezelfde dag nog graag even via de telefoon 0472 288823 '),
(2, 'slug', 0, 1, ' home '),
(2, 'title', 0, 1, ' burgerbar '),
(14, 'field', 1, 1, ' houd je het klassiek met de eskoburger waan je je in italie met the godfather of reis je liever naar mexico met de el mariachi of toch nog iets anders er is voor iedereen wel een hapje of een burger welkom kristin en bart '),
(14, 'slug', 0, 1, ' temp oqivednngxfdharidgdnqyxqprfjblwlnxwk '),
(14, 'title', 0, 1, ''),
(15, 'field', 1, 1, ' houd je het klassiek met de eskoburger waan je je in italie met the godfather of reis je liever naar mexico met de el mariachi of toch nog iets anders er is voor iedereen wel een burger '),
(15, 'slug', 0, 1, ' temp iwgsuysaohgglcrzloaslbmnygedysxgxdxl '),
(15, 'title', 0, 1, ''),
(16, 'field', 1, 1, ' eet je liever iets anders wij houden zelf van reizen en van lekker eten uit verschillende windstreken daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet '),
(16, 'slug', 0, 1, ' temp zmbqrrtxwsckwmapkerrdwyayichhtcupzhy '),
(16, 'title', 0, 1, ''),
(17, 'field', 1, 1, ' concept belgisch kwaliteitsvlees van dieren die opgroeien in een vrije grasgroene omgeving dit geeft het vlees een authentieke smaak we selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers suggestie speciaalbieren bij elk gerecht '),
(17, 'slug', 0, 1, ' temp uhppxhtyjcczigpjvkclrxhqhhiyrfnpuwvd '),
(17, 'title', 0, 1, ''),
(18, 'field', 1, 1, ' welkom kristin en bart '),
(18, 'slug', 0, 1, ' temp htryxzgsvdklzyxvgwcvxditrjqpcxttbhpm '),
(18, 'title', 0, 1, ''),
(21, 'field', 1, 1, ' houd je het klassiek met de eskoburger waan je je in italie met the godfather of reis je liever naar mexico met de el mariachi of toch nog iets anders er is voor iedereen wel een burger eet je liever iets anders '),
(21, 'slug', 0, 1, ' temp iwgsuysaohgglcrzloaslbmnygedysxgxdxl '),
(21, 'title', 0, 1, ''),
(22, 'field', 1, 1, ' wij houden zelf van reizen en van lekker eten uit verschillende windstreken daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet '),
(22, 'slug', 0, 1, ' temp zmbqrrtxwsckwmapkerrdwyayichhtcupzhy '),
(22, 'title', 0, 1, ''),
(23, 'field', 1, 1, ' concept belgisch kwaliteitsvlees van dieren die opgroeien in een vrije grasgroene omgeving dit geeft het vlees een authentieke smaak we selecteren producten op kwaliteit en duurzaamheid en kiezen zoveel mogelijk lokale leveranciers suggestie speciaalbieren bij elk gerecht '),
(23, 'slug', 0, 1, ' temp uhppxhtyjcczigpjvkclrxhqhhiyrfnpuwvd '),
(23, 'title', 0, 1, ''),
(24, 'field', 1, 1, ' welkom kristin en bart '),
(24, 'slug', 0, 1, ' temp oehddxlgjannnzowbkjvyarjkkswsaqxdojg '),
(24, 'title', 0, 1, ''),
(27, 'slug', 0, 1, ' temp yotrlkzcdvdlkgjsoapulntirxzrkhebjijx '),
(27, 'title', 0, 1, ''),
(38, 'field', 1, 1, ' houd je het klassiek met de eskoburger waan je je in italie met the godfather of reis je liever naar mexico met de el mariachi of toch nog iets anders er is voor iedereen wel een burger '),
(38, 'slug', 0, 1, ' temp iwgsuysaohgglcrzloaslbmnygedysxgxdxl '),
(38, 'title', 0, 1, ''),
(39, 'field', 1, 1, ' eet je liever iets anders wij houden zelf van reizen en van lekker eten uit verschillende windstreken daarom hebben we ook enkele andere gerechten uit verschillende hoeken van de wereld op ons menu gezet '),
(39, 'slug', 0, 1, ' temp zmbqrrtxwsckwmapkerrdwyayichhtcupzhy '),
(39, 'title', 0, 1, ''),
(40, 'field', 1, 1, ' welkom kristin en bart '),
(40, 'slug', 0, 1, ' temp htryxzgsvdklzyxvgwcvxditrjqpcxttbhpm '),
(40, 'title', 0, 1, ''),
(49, 'field', 1, 1, ' reservatie voor dezelfde dag nog graag even via de telefoon 0472 288823 '),
(49, 'slug', 0, 1, ' temp xucslydrjzplwtharqwfutrcvebewtoxmsuq '),
(49, 'title', 0, 1, ''),
(55, 'field', 4, 1, ' stationsstraat 159 '),
(55, 'field', 5, 1, ' 2440 '),
(55, 'field', 6, 1, ' geel '),
(55, 'field', 7, 1, ' 0472 28 88 23 '),
(55, 'field', 11, 1, ''),
(55, 'slug', 0, 1, ' info '),
(55, 'title', 0, 1, ''),
(71, 'slug', 0, 1, ' nachos met cheddar zure room en tomatensalsa klein groot '),
(71, 'title', 0, 1, ' nachos klein groot '),
(77, 'slug', 0, 1, ' ha '),
(77, 'title', 0, 1, ' hapjes '),
(80, 'slug', 0, 1, ' ha '),
(80, 'title', 0, 1, ' hapjes '),
(119, 'slug', 0, 1, ' hapjes '),
(119, 'title', 0, 1, ' eskos snackbar '),
(124, 'field', 1, 1, ''),
(124, 'slug', 0, 1, ' edamame '),
(124, 'title', 0, 1, ' edamame '),
(127, 'field', 1, 1, ''),
(127, 'slug', 0, 1, ' oosters gelakte kipballetjes '),
(127, 'title', 0, 1, ' oosters gelakte kippenballetjes '),
(130, 'field', 1, 1, ''),
(130, 'slug', 0, 1, ' onion rings met huisgemaakte tartaar '),
(130, 'title', 0, 1, ' onion rings '),
(133, 'slug', 0, 1, ' taco asian pulled pork '),
(133, 'title', 0, 1, ' taco asian pulled pork '),
(136, 'slug', 0, 1, ' vegan bitterballen per stuk '),
(136, 'title', 0, 1, ' vegan bitterbal '),
(138, 'slug', 0, 1, ' hamburgers '),
(138, 'title', 0, 1, ' hamburgers '),
(140, 'field', 1, 1, ' 100% grofgemalen ribeye sla tomaat augurk rode ui eskosaus '),
(140, 'slug', 0, 1, ' eskoburger '),
(140, 'title', 0, 1, ' eskoburger '),
(143, 'field', 1, 1, ' 100% grofgemalen ribeye cheddar sla tomaat augurk rode ui eskosaus '),
(143, 'slug', 0, 1, ' eskoburger cheddar '),
(143, 'title', 0, 1, ' eskoburger cheddar '),
(146, 'field', 1, 1, ' 100% grofgemalen ribeye spek sla tomaat augurk rode ui eskosaus '),
(146, 'slug', 0, 1, ' eskoburger bacon '),
(146, 'title', 0, 1, ' eskoburger bacon '),
(151, 'field', 1, 1, ' 100% grofgemalen ribeye spek cheddar sla tomaat augurk rode ui eskosaus '),
(151, 'slug', 0, 1, ' eskoburger full option '),
(151, 'title', 0, 1, ' eskoburger full option '),
(153, 'field', 1, 1, ' noordzeevis kruidenslaatje furikake hollandaise '),
(153, 'slug', 0, 1, ' mama heeft visjes gebakken '),
(153, 'title', 0, 1, ' gone fishing '),
(155, 'slug', 0, 1, ' wat neem je bij je burger '),
(155, 'title', 0, 1, ' sides '),
(157, 'field', 1, 1, ''),
(157, 'slug', 0, 1, ' jacket potato '),
(157, 'title', 0, 1, ' handgesneden frieten '),
(159, 'slug', 0, 1, ' handgesneden frieten '),
(159, 'title', 0, 1, ' zoete aardappel frietjes '),
(161, 'field', 1, 1, ' thai style kippenburger kaffir limoen pinda pittig slaatje thai mayo '),
(161, 'slug', 0, 1, ' one night in bangkok '),
(161, 'title', 0, 1, ' one night in bangkok '),
(168, 'slug', 0, 1, ' voor de allerkleinsten '),
(168, 'title', 0, 1, ' voor de allerkleinsten '),
(170, 'slug', 0, 1, ' mini eskoburger met handgesneden frietjes '),
(170, 'title', 0, 1, ' mini eskoburger met handgesneden frietjes '),
(189, 'slug', 0, 1, ' extra toppings '),
(189, 'title', 0, 1, ' extra toppings '),
(192, 'field', 1, 1, ''),
(192, 'slug', 0, 1, ' spek '),
(192, 'title', 0, 1, ' spek '),
(195, 'field', 1, 1, ''),
(195, 'slug', 0, 1, ' jalapenos '),
(195, 'title', 0, 1, ' jalapenos '),
(198, 'field', 1, 1, ''),
(198, 'slug', 0, 1, ' spiegelei '),
(198, 'title', 0, 1, ' spiegelei '),
(206, 'field', 1, 1, ' lorem ipsum dolores lorem ipsum enzovoort '),
(206, 'slug', 0, 1, ' wij zijn er even tussenuit '),
(206, 'title', 0, 1, ' wij zijn er even tussenuit '),
(209, 'slug', 0, 1, ' menu '),
(209, 'title', 0, 1, ' menu '),
(236, 'field', 1, 1, ''),
(236, 'slug', 0, 1, ' temp cofdgpfpljovvjrtszbewmdkolsngbjthyqs '),
(236, 'title', 0, 1, ''),
(261, 'slug', 0, 1, ' kippenboutjes '),
(261, 'title', 0, 1, ' kippenboutje '),
(265, 'slug', 0, 1, ' gyozas '),
(265, 'title', 0, 1, ' gyozas paddestoel '),
(287, 'slug', 0, 1, ' pastrami toast mosterdzaad '),
(287, 'title', 0, 1, ' pastrami '),
(289, 'slug', 0, 1, ' kimchi '),
(289, 'title', 0, 1, ' kimchi '),
(291, 'slug', 0, 1, ' rendangkroketjes bergamot '),
(291, 'title', 0, 1, ' rendangkroketjes '),
(293, 'slug', 0, 1, ' dahl paratha v '),
(293, 'title', 0, 1, ' dahl paratha v '),
(303, 'field', 1, 1, ' pulled pork koolsla huisgemaakte bbq saus '),
(303, 'slug', 0, 1, ' miss piggy '),
(303, 'title', 0, 1, ' miss piggy '),
(305, 'field', 1, 1, ' 100% gemalen ribeye pulled pork groenten en saus van eskoburger of miss piggy '),
(305, 'slug', 0, 1, ' double trouble '),
(305, 'title', 0, 1, ' double trouble '),
(307, 'field', 1, 1, ' 100% gemalen ribeye mozzarella ham gremolata oventomaatjes creme van tomaat '),
(307, 'slug', 0, 1, ' the godfather '),
(307, 'title', 0, 1, ' the godfather '),
(309, 'field', 1, 1, ' 100% gemalen ribeye guacamole zure room tomatensalsa jalapenos rode ui '),
(309, 'slug', 0, 1, ' el mariachi '),
(309, 'title', 0, 1, ' el mariachi '),
(320, 'field', 1, 1, ' 100% gemalen ribeye korean style daikon kimchi bulgogi chili mayo '),
(320, 'slug', 0, 1, ' gangnam style '),
(320, 'title', 0, 1, ' gangnam style '),
(322, 'field', 1, 1, ' gefrituurde halloumi slaatje gegrilde groenten yoghurt zaatar sumak '),
(322, 'slug', 0, 1, ' halloumi '),
(322, 'title', 0, 1, ' halloumi '),
(324, 'field', 1, 1, ' kies een burger wij maken m veggie '),
(324, 'slug', 0, 1, ' huisgemaakte veggieschijf '),
(324, 'title', 0, 1, ' huisgemaakte veggieschijf '),
(330, 'slug', 0, 1, ' ovenaardappeltjes '),
(330, 'title', 0, 1, ' ovenaardappeltjes '),
(332, 'field', 1, 1, ' kan ook veggie '),
(332, 'slug', 0, 1, ' chili fries '),
(332, 'title', 0, 1, ' chili fries '),
(334, 'slug', 0, 1, ' loaded sweet potato fries '),
(334, 'title', 0, 1, ' loaded sweet potato fries '),
(336, 'slug', 0, 1, ' slaatje vant moment '),
(336, 'title', 0, 1, ' slaatje vant moment '),
(344, 'slug', 0, 1, ' kaas '),
(344, 'title', 0, 1, ' kaas '),
(348, 'slug', 0, 1, ' mini fishn chips '),
(348, 'title', 0, 1, ' mini fishn chips '),
(352, 'slug', 0, 1, ' no burger today '),
(352, 'title', 0, 1, ' no burger today '),
(354, 'field', 1, 1, ''),
(354, 'slug', 0, 1, ' fishn chips met eskos tartaar '),
(354, 'title', 0, 1, ' fishn chips met eskos tartaar '),
(356, 'slug', 0, 1, ' dahl paratha '),
(356, 'title', 0, 1, ' dahl paratha ');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `searchindexqueue`
--

CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `searchindexqueue_fields`
--

CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint UNSIGNED DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `maxAuthors`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Home', 'home', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primaire invoer-pagina\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2025-02-22 10:33:50', '2025-02-22 10:33:50', NULL, '3f24f68b-1921-4d40-82e8-23506b424e70'),
(2, NULL, 'Info', 'info', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primaire invoer-pagina\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2025-02-28 18:02:08', '2025-02-28 18:02:08', NULL, 'aff765af-7376-4642-81ae-09d1792f7303'),
(3, 1, 'Menu items', 'menuItems', 'structure', 1, 1, 'all', 'end', '[{\"label\": \"Primaire invoer-pagina\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2025-03-02 17:32:01', '2025-03-22 13:16:46', NULL, 'e65a5670-88d9-49a9-9a78-36b9261b6cb0'),
(4, NULL, 'Menu', 'menu', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primaire invoer-pagina\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2025-03-22 10:21:59', '2025-03-22 13:16:46', NULL, '031f77bd-afde-4104-87a5-377226a296b2');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections_entrytypes`
--

CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections_entrytypes`
--

INSERT INTO `sections_entrytypes` (`sectionId`, `typeId`, `sortOrder`, `name`, `handle`) VALUES
(1, 1, 1, NULL, NULL),
(2, 5, 1, NULL, NULL),
(3, 7, 2, NULL, NULL),
(3, 9, 1, NULL, NULL),
(4, 7, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'index.twig', 1, '2025-02-22 10:33:50', '2025-03-22 13:16:46', '7fd3e41a-23f0-43f5-94a9-03dfdc5ff4e3'),
(2, 2, 1, 1, 'info', 'page.twig', 1, '2025-02-28 18:02:08', '2025-03-24 17:58:31', '64262581-5b04-41fc-bf72-f362351e9d00'),
(3, 3, 1, 0, NULL, NULL, 1, '2025-03-02 17:32:01', '2025-03-02 17:32:01', '0ee4eda1-34a6-47c1-bfd5-2432d450cee3'),
(4, 4, 1, 1, 'menu', 'page.twig', 1, '2025-03-22 10:21:59', '2025-03-24 17:58:31', 'c8e62e35-a0ff-4c7e-b175-ddaec9dd00d7');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(11, 1, 'FchSV2WgkKYdN-77dePdCdeqb08CCU9naO-shVXvPRkZuF48E3X7CW0pDn_R-GXd0PbyxTxLjWp5Nxq1Pu_J4vq2U3329V0r-i59', '2025-03-11 18:29:06', '2025-03-11 18:30:04', '38788b26-84a5-42a9-bbdd-8df1bb43201b'),
(12, 1, 'U2T8cIhsNKJy34kQfLTnEc2yeaCEsPJYRvJJZmbKLqrEtKNgGO4jaNxaxKlNH8zI0h-b5CKZ7a6iOjDWDtu1H0wJ3Lzr8j1gxonp', '2025-03-15 15:45:12', '2025-03-15 16:29:06', 'f703efa9-ec4f-4e97-af0c-e31135becb56'),
(13, 1, 'M_W2EqOMedRoIZvKJiwslO301Exaec81yUaljE1Xu-8QN5KFy51LdxFYMQ2KW8zNgaPU6-QxLaoAI2ZhOwTgZakRuQCBAJ0nG5rT', '2025-03-15 16:28:55', '2025-03-15 16:28:55', '89214f65-3877-436b-a63d-c0e57df21381'),
(16, 1, 'qnPrW2y4MKPr9pW0yVHSJD-i-_WfA4MiY9FObkPhk1P0cvu7riBu1xDohkU6rLO0Mkj_Eiq6XHsGnu0Gwm_9Zp10648blmwusxhc', '2025-03-22 09:07:02', '2025-03-22 10:30:23', 'c3bdce2c-a278-4010-80b9-eb3d40f4555e'),
(22, 1, 'UplRYH4eszySyyRenKMSNkcxxmwiKve5psapZw1ArMEBaWSrkhS8BmlkkmKnibVpXOBFCL_OZlJS-Xhk_R9kBkbEXF7sSM_aw5Pe', '2025-03-24 15:04:10', '2025-03-24 15:22:41', '44165fab-25e9-49a6-999b-62d3418675c5'),
(24, 1, '1zdo8gux30v23ReZhWXLx79rKU6P2vhKZ9d0drj0b31jbIcdZlME9W-bFhYxvCt6SXIDULqkNBXF9Hbsru17qOF_PQyBEJfDtEy3', '2025-03-24 17:58:27', '2025-03-24 18:04:51', '747131b7-a799-4e3b-8dfb-9d6b777224e5'),
(25, 1, 'GRxZeL_X-bFJRrlZWEVvztE-dfc6mg7gEEowB6B1ef_63n58piRYl04gUMcnFFYxy1QTxJtg8OOBw7FRdQvoUxMXRSCsWKMoThyK', '2025-03-26 18:54:28', '2025-03-26 19:47:22', '943a96af-4d01-41df-af18-fb9fa0f29829'),
(27, 1, 'bTDcGzKuX7zOi0RdnklgO37DuPFc0i1FhR3F_w-5kjyBrQO4DUMmeQxJdHPiCv1TRDRrZAZdqBJstbyAbFL5pAQHgkQSQlV58-wo', '2025-03-28 14:21:14', '2025-03-28 14:45:05', 'd8f27a0c-308a-4a0c-892b-400dc0b52aff'),
(29, 1, '6w78J6_qYbq4tzUZn0NdRCkYc8NSepyzKFXyYRpWWblVAJ68EQCLvHS-vDzKDFVQrPBU5lxNqKj0hZ2_rty6_AMhw2JcyqO4eqUr', '2025-04-01 14:03:06', '2025-04-01 14:26:43', 'c0dd1e4e-dcba-45c6-a474-13e7cd887d56'),
(31, 1, 'YeErmq0xI-opj9_a6ESyVrkoAh9yhxctP_z14BX_S7jBvKMGMRSLYOo0cz2soNPzT9thth2C7cUtg7WqRwmM5LWEWWet6cMBv5go', '2025-04-01 17:04:59', '2025-04-01 17:08:51', '80c7fd35-77f4-4b60-8e8b-23d9f6d659c3'),
(32, 1, 'k6wg_WxfAiScNWwYWxiG_RkD8uNKjsEhAirKYq-8vV5QmPV0gtQlbNZ9s_8VTVHyluf1wdcT7TgHHcdgNRwNtMQ8y2seUrlq4wNM', '2025-04-14 17:59:58', '2025-04-14 18:47:12', '9813cd82-0ae1-4df0-915b-9bc6c782517e'),
(33, 1, 'kYPygwt_jLj6efTffVv2usa328druP-aHdDGGC-2qqdTRI6BuPaZfU0jB0eKGHONawuRJb_Ok926QUS1n4Z4D_MHx5p6lLXeDpXq', '2025-05-29 09:40:59', '2025-05-29 09:54:23', '1b5fcbb7-5241-4611-9388-4e1ff7fccd9f');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Eskobar', '2025-02-22 10:22:11', '2025-02-22 10:22:11', NULL, '43468784-313c-4cf2-9eec-f27165d2afc5');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sites`
--

CREATE TABLE `sites` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'true', 'Eskobar', 'default', 'nl-BE', 1, '$PRIMARY_SITE_URL', 1, '2025-02-22 10:22:11', '2025-02-22 10:22:11', NULL, 'c44f25bd-e99c-4f49-87e4-1ac555445a3b');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sso_identities`
--

CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int NOT NULL,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED NOT NULL,
  `rgt` int UNSIGNED NOT NULL,
  `level` smallint UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 92, 0, '2025-03-02 18:02:31', '2025-03-26 19:27:05', '6ca72243-eb17-4849-8ae9-5cc85c89275c'),
(2, 1, 71, 1, 3, 4, 2, '2025-03-02 18:02:31', '2025-03-02 18:06:55', '725825bd-7373-4d41-bdc1-be946048aa7b'),
(3, 1, 119, 1, 2, 27, 1, '2025-03-02 18:06:38', '2025-03-26 19:25:55', '68271660-aa9a-42d7-9490-01b73046efed'),
(4, 1, 124, 1, 5, 6, 2, '2025-03-02 18:08:22', '2025-03-02 18:08:38', 'd7545cee-288a-423c-b300-67bb226ad81d'),
(5, 1, 127, 1, 7, 8, 2, '2025-03-02 18:08:41', '2025-03-02 18:08:59', '408bfdfc-1943-4806-9a0f-f5632215c9d1'),
(6, 1, 130, 1, 9, 10, 2, '2025-03-02 18:09:03', '2025-03-02 18:09:22', '5cad4e9a-1e76-4138-91c5-b1d26a8ad1a1'),
(7, 1, 133, 1, 11, 12, 2, '2025-03-02 18:09:52', '2025-03-02 18:09:57', 'd1ab850e-89ae-44d1-81d2-6b028ba2011e'),
(8, 1, 136, 1, 13, 14, 2, '2025-03-02 18:10:08', '2025-03-02 18:10:14', '19c82bd9-2d71-48fa-99e0-f4d9f0ff8d37'),
(9, 1, 138, 1, 28, 55, 1, '2025-03-02 18:10:28', '2025-03-26 19:25:55', 'a2042c36-5e9b-466b-ba08-99d03af713bf'),
(10, 1, 140, 1, 29, 30, 2, '2025-03-02 18:10:51', '2025-03-26 19:25:55', 'ed848717-9eed-454f-bfe0-4394264f33d9'),
(11, 1, 143, 1, 31, 32, 2, '2025-03-02 18:11:13', '2025-03-26 19:25:55', '7d8232c3-18d0-41cc-9530-40569b642dcd'),
(12, 1, 146, 1, 33, 34, 2, '2025-03-02 18:11:40', '2025-03-26 19:25:55', 'e24a827c-6c76-4ab6-9f82-01f48fa190f7'),
(13, 1, 151, 1, 35, 36, 2, '2025-03-02 18:12:33', '2025-03-26 19:25:55', 'e8af2f36-0953-4b9f-823b-e52d67ac10cd'),
(14, 1, 153, 1, 37, 38, 2, '2025-03-02 18:12:58', '2025-03-26 19:25:55', '0079a34d-4794-4bf0-825b-09b9adacca5d'),
(15, 1, 155, 1, 56, 69, 1, '2025-03-02 18:13:28', '2025-03-26 19:25:55', '7f6c0e0f-5c12-4737-9546-2615e2eb26b5'),
(16, 1, 157, 1, 57, 58, 2, '2025-03-02 18:13:46', '2025-03-26 19:25:55', '4dc8ec4a-7838-41fb-bf72-1b04075b52fd'),
(17, 1, 159, 1, 59, 60, 2, '2025-03-02 18:14:16', '2025-03-26 19:25:55', 'f785a4f0-3e1b-4e64-a453-f5e9129d82e6'),
(18, 1, 161, 1, 39, 40, 2, '2025-03-02 18:19:05', '2025-03-26 19:25:55', '5313b8d5-164a-4a2e-ab61-dc0aa1620868'),
(19, 1, 168, 1, 80, 85, 1, '2025-03-02 18:22:37', '2025-03-26 19:25:55', 'ce87415a-ff4c-495e-8063-f54835516615'),
(20, 1, 170, 1, 81, 82, 2, '2025-03-02 18:22:48', '2025-03-26 19:25:55', 'bcdb6c29-172c-4641-90aa-aa778916fd23'),
(21, 1, 189, 1, 70, 79, 1, '2025-03-06 18:51:08', '2025-03-26 19:25:55', '65bf7aba-ec76-487b-b308-0c5d52a21da8'),
(23, 1, 192, 1, 71, 72, 2, '2025-03-06 18:51:56', '2025-03-26 19:25:55', 'd73f2865-fb24-4e2d-9b78-0b019c6a189a'),
(24, 1, 195, 1, 73, 74, 2, '2025-03-06 18:52:22', '2025-03-26 19:25:55', '52192535-371c-4141-935a-0f4f4fbc8da3'),
(25, 1, 198, 1, 75, 76, 2, '2025-03-06 18:52:39', '2025-03-26 19:25:55', 'cd42a706-893e-4805-811a-9c872f83c378'),
(27, 1, 261, 1, 15, 16, 2, '2025-03-24 15:11:58', '2025-03-24 15:13:54', '08546a28-77b9-4f22-964e-32dc64ea2368'),
(29, 1, 265, 1, 17, 18, 2, '2025-03-24 15:14:11', '2025-03-24 15:14:28', '8dcc3f18-4ffd-4a3e-9df5-bfce6a71990b'),
(30, 1, 287, 1, 19, 20, 2, '2025-03-26 19:04:34', '2025-03-26 19:04:51', '96250d54-643c-4ac3-b249-229a41561533'),
(31, 1, 289, 1, 21, 22, 2, '2025-03-26 19:05:21', '2025-03-26 19:05:31', 'f7bda9a2-2666-4a26-ab91-c7dfc0337af3'),
(32, 1, 291, 1, 23, 24, 2, '2025-03-26 19:05:43', '2025-03-26 19:05:53', '4abb616c-ce3f-423b-8269-a68b3858194e'),
(33, 1, 293, 1, 25, 26, 2, '2025-03-26 19:06:18', '2025-03-26 19:25:55', 'e1b1d821-c4de-43ec-a8a5-7d06967264fb'),
(34, 1, 303, 1, 41, 42, 2, '2025-03-26 19:09:21', '2025-03-26 19:25:55', '46db44ff-f3b8-4722-b41f-4400d184aacd'),
(35, 1, 305, 1, 43, 44, 2, '2025-03-26 19:10:00', '2025-03-26 19:25:55', '35212213-0e4c-4a57-9831-93676b5ba1b3'),
(36, 1, 307, 1, 45, 46, 2, '2025-03-26 19:10:54', '2025-03-26 19:25:55', 'aba3acb5-eb9f-4927-8240-10f6ca4b38cc'),
(37, 1, 309, 1, 47, 48, 2, '2025-03-26 19:11:56', '2025-03-26 19:25:55', '2caa002c-fd54-4a5c-80c1-0c080bd320cf'),
(38, 1, 320, 1, 49, 50, 2, '2025-03-26 19:16:32', '2025-03-26 19:25:55', '1ac83cbf-18a2-41f2-91ef-e480cc9cb93f'),
(39, 1, 322, 1, 51, 52, 2, '2025-03-26 19:17:42', '2025-03-26 19:25:55', 'd4cba699-5f56-4a4e-9568-94ca94311264'),
(40, 1, 324, 1, 53, 54, 2, '2025-03-26 19:18:39', '2025-03-26 19:25:55', 'cf3defb4-26d2-46d3-b2da-bf720b863058'),
(41, 1, 330, 1, 61, 62, 2, '2025-03-26 19:20:30', '2025-03-26 19:25:55', '80669113-b268-4c2d-97a9-09ae1e5e9ab7'),
(42, 1, 332, 1, 63, 64, 2, '2025-03-26 19:21:06', '2025-03-26 19:25:55', '102f686d-c90d-45ed-ac4d-63371128c305'),
(43, 1, 334, 1, 65, 66, 2, '2025-03-26 19:22:41', '2025-03-26 19:25:55', '334ef2d9-d140-4406-96d9-31640e5b7dda'),
(44, 1, 336, 1, 67, 68, 2, '2025-03-26 19:23:28', '2025-03-26 19:25:55', 'd92a4ade-8c60-4e21-bf7a-b290a1a0af26'),
(45, 1, 344, 1, 77, 78, 2, '2025-03-26 19:24:37', '2025-03-26 19:25:55', 'be7305d1-0206-42f4-a9e7-e2b21b505550'),
(46, 1, 348, 1, 83, 84, 2, '2025-03-26 19:25:11', '2025-03-26 19:25:55', 'e89c8ade-96e4-485d-9fd5-cb1913d97fcc'),
(48, 1, 352, 1, 86, 91, 1, '2025-03-26 19:26:12', '2025-03-26 19:27:05', 'bd71e412-054e-4775-be8c-6870111b7246'),
(49, 1, 354, 1, 87, 88, 2, '2025-03-26 19:26:31', '2025-03-26 19:26:42', 'c2e00435-6367-4eaf-80a0-0457915749ca'),
(50, 1, 356, 1, 89, 90, 2, '2025-03-26 19:26:58', '2025-03-26 19:27:05', 'bcade0e3-2a48-4b2f-b020-bb0f9db92481');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `structures`
--

CREATE TABLE `structures` (
  `id` int NOT NULL,
  `maxLevels` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 2, '2025-03-02 18:02:31', '2025-03-02 18:06:27', NULL, '0d8da9d5-492b-4dae-b1e3-9cd0a6b6ecb4');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint UNSIGNED DEFAULT NULL,
  `usageCount` tinyint UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(16, 'YAbNbLDhZoO2deau4yOGT83aaCa7NyPt', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":209,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 10:41:55', '2025-04-01 10:41:55', '2025-04-01 10:41:55', '61971a11-2cd4-4386-8056-106d24eee3f6'),
(17, 'krqpECgZfQDPuDILqnSI0nhxknJnYEV8', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":55,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:03:18', '2025-04-01 14:03:18', '2025-04-01 14:03:18', 'bf229f3a-b328-49b3-b2ec-d4a7bbcfa304'),
(18, 'Ltm7B9zliURYeLTG-iFkPEJH4DO_PyV2', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:05:36', '2025-04-01 14:05:36', '2025-04-01 14:05:36', '62f8ffcf-19f4-4a8b-bc23-489422e89037'),
(19, 'E7B1NlkdXSZ75bEWRclhh5wEdIwX1GDp', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":209,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:05:56', '2025-04-01 14:05:56', '2025-04-01 14:05:56', '51c55b02-0b57-4f9e-bbce-5eec7984a586'),
(20, '1vVJUADeHwJjLC8cOojTGU6YhEgvZFWt', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":209,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:09:55', '2025-04-01 14:09:55', '2025-04-01 14:09:55', '3d114ecd-d97f-46c6-9e0f-2964c7bbb474'),
(21, '6811PwRRgJUiAQHPYEPvLh2MdXJsYRl2', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:15:01', '2025-04-01 14:15:01', '2025-04-01 14:15:01', '720ec869-0339-4aa4-8514-4d30178ede15'),
(22, 'JQWEqwNWElIStUWtYwQyjNww263xzG3E', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:15:45', '2025-04-01 14:15:45', '2025-04-01 14:15:45', 'a1d8be8c-3770-470b-ae62-c05b1ac3f64d'),
(23, 'sckG6nt8IUHZANjpFf-eKWGu3xSzEJwW', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:17:43', '2025-04-01 14:17:43', '2025-04-01 14:17:43', '732c81a7-b993-4d1e-9c6f-686cea94d97f'),
(24, 'gZ7Wae1k7PZeTMzydJYaG0tPXv5T3bDt', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":55,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:21:05', '2025-04-01 14:21:05', '2025-04-01 14:21:05', 'f1d28eb5-67f1-4ea8-a080-a70d77276248'),
(25, 'pSmd06Vp7TJvLMaeYf2TTHMzsiAFd8ES', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":209,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 14:21:29', '2025-04-01 14:21:29', '2025-04-01 14:21:29', '7329aae0-6246-4484-b013-ee6e66975ffe'),
(26, 'mnYqoIc8XlzCgF18NvarlkHIUjXs3QCw', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2025-04-02 17:07:59', '2025-04-01 17:07:59', '2025-04-01 17:07:59', 'acf44d97-5a6a-4702-b0c5-28708864c4ff');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int NOT NULL,
  `preferences` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\": \"nl-BE\", \"showFieldHandles\": true}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

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
  `invalidLoginCount` tinyint UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `photoId`, `affiliatedSiteId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
(1, NULL, NULL, 1, 0, 0, 0, 1, 'admin', NULL, NULL, NULL, 'admin@janhendrickx.be', '$2y$13$mVdOTwFXYsXe0NZUtSmwQuChkC.UUH.7GEyczHerzbqQAcqpNBx7S', '2025-06-26 19:46:20', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2025-02-22 10:22:11', '2025-02-22 10:22:11', '2025-06-26 19:46:20');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, NULL, 'Tijdelijke uploads', NULL, '2025-02-22 11:01:29', '2025-02-22 11:01:29', 'f6f190f1-a50f-4a41-b181-c685729473d5');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `volumes`
--

CREATE TABLE `volumes` (
  `id` int NOT NULL,
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
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `webauthn`
--

CREATE TABLE `webauthn` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `widgets`
--

CREATE TABLE `widgets` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}', 1, '2025-02-22 10:30:33', '2025-02-22 10:30:33', '7004dcfc-8e81-409b-bca3-db9e6264dc3e'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2025-02-22 10:30:33', '2025-02-22 10:30:33', '72a61871-ebc8-438c-a538-0cf702fa8c4c'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2025-02-22 10:30:33', '2025-02-22 10:30:33', '7e8f9ccb-87dc-46a2-9316-1e7c7df38c9a'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}', 1, '2025-02-22 10:30:33', '2025-02-22 10:30:33', 'daa626f7-f536-4d8b-ad42-a1fb61616a7a');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_yprnyluvufsfuwxnngkjpfrgsibmwtyhhzru` (`primaryOwnerId`);

--
-- Indexen voor tabel `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zqalxgxskuxobpkyrhggszahumduboetfzno` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_gzwfkwwfgvzkuglxuacjgakmgvdqygqnxupc` (`dateRead`),
  ADD KEY `fk_wurtpnovccvyezrxiwgfrzjpohuqltjloabc` (`pluginId`);

--
-- Indexen voor tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nnfbssfflhfuvmfmfdujbetmulkvqkuubxum` (`sessionId`,`volumeId`),
  ADD KEY `idx_kcibwgpfhwrimnmadbqlovarobabtovbbfxn` (`volumeId`);

--
-- Indexen voor tabel `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lwoonxtodeiocmcxephxeqlxewbvqlwgrygr` (`filename`,`folderId`),
  ADD KEY `idx_rsgmymjbxfnkhgobktzllshobkfxeativzap` (`folderId`),
  ADD KEY `idx_ezabavujptrfxruqotibqhelsegfejlxrjni` (`volumeId`),
  ADD KEY `fk_vhlozqapgpgvakrnctwjvatbffnjbspoynyg` (`uploaderId`);

--
-- Indexen voor tabel `assets_sites`
--
ALTER TABLE `assets_sites`
  ADD PRIMARY KEY (`assetId`,`siteId`),
  ADD KEY `fk_jaojtxiszjgbzaospxdclfzpjkoevextrwoe` (`siteId`);

--
-- Indexen voor tabel `authenticator`
--
ALTER TABLE `authenticator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_qotvvyiyfollyfmnidezrctprbjfksoehjwx` (`userId`);

--
-- Indexen voor tabel `bulkopevents`
--
ALTER TABLE `bulkopevents`
  ADD PRIMARY KEY (`key`,`senderClass`,`eventName`),
  ADD KEY `idx_ggmsjcofybyfujuzkrxddzicrcxstjnmaovc` (`timestamp`);

--
-- Indexen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fwvqoqjugbbkxhsdzjovnhmyxbocjtxerwca` (`groupId`),
  ADD KEY `fk_flnlixxrnjcbsmudmynyalvcrpworolfeewj` (`parentId`);

--
-- Indexen voor tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ldpzmphrxgjtizwepmoucbynzqzrsbetbdwh` (`name`),
  ADD KEY `idx_mdnfuxqichlblrsnwbpjsclcstrvtymtmwvu` (`handle`),
  ADD KEY `idx_cqhbvllgtggpgcmjelujijgdjwvznnaeaftz` (`structureId`),
  ADD KEY `idx_lzmkpqpgyksjgilsmlebjerfbihiqxfbdrjq` (`fieldLayoutId`),
  ADD KEY `idx_mfdyfceevmujosltarhurroahvigmybyfpyq` (`dateDeleted`);

--
-- Indexen voor tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hlejigoxbiviehpvcytzzlrlczjeuvsxlyvb` (`groupId`,`siteId`),
  ADD KEY `idx_jdpiynvryxajjsqjpcowclnaitvtodbfwrpw` (`siteId`);

--
-- Indexen voor tabel `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_fxksdfvvzosvjlsagvsqbdswswxhmgtfzlxs` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_gbvzrzndtfahoqqtnlopkfofdovlybfroviy` (`siteId`),
  ADD KEY `fk_veykfcoyswuhvgzgozgkzkrscjnqyqobqviz` (`userId`);

--
-- Indexen voor tabel `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  ADD KEY `idx_rksvvcutdccfhqhmixzscitrmjofzcgyxxys` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_vqfbiuvimgbyousdbfzgvnsqfymojhzqmmdi` (`siteId`),
  ADD KEY `fk_heiampmhjzbthizdrkppglvjbvjxcfwtmuga` (`fieldId`),
  ADD KEY `fk_odiesqgevengdngyepvknjuexpzbcgqbfnvq` (`userId`);

--
-- Indexen voor tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_eqpbksywykwntcnormnzrdguzbkecrddfdgu` (`userId`);

--
-- Indexen voor tabel `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jvbtmkmoxfwiqiiaoejvsqqbabrraxvgjwty` (`key`,`fingerprint`);

--
-- Indexen voor tabel `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vqvnnfpuwvaygdxexealwsvcmeykuxlbsxci` (`creatorId`,`provisional`),
  ADD KEY `idx_ymdznpuwaaswjzbmooixmjqskvnssqwxvael` (`saved`),
  ADD KEY `fk_fbmotxfnitatrqacpvpxoovqnxukkghzayie` (`canonicalId`);

--
-- Indexen voor tabel `elementactivity`
--
ALTER TABLE `elementactivity`
  ADD PRIMARY KEY (`elementId`,`userId`,`type`),
  ADD KEY `idx_zkbyhmtlegejtgapvlyzbkeepcvzmrhaodyq` (`elementId`,`timestamp`,`userId`),
  ADD KEY `fk_ureteghwkgypuynrgafbdzdxubxglusuvvhz` (`userId`),
  ADD KEY `fk_zhrsudnwznxrdehfrpdkfvhopqmqayuhwcil` (`siteId`),
  ADD KEY `fk_huajyovyzqlcnpurovwfzadkjdheyulkdvxj` (`draftId`);

--
-- Indexen voor tabel `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hzwqajxxfuzhriyjwtmrkjtmjrhsxucumuta` (`dateDeleted`),
  ADD KEY `idx_aicvvrkyvnwyutxnnrvcrvirmztfmnbhsfkw` (`fieldLayoutId`),
  ADD KEY `idx_nhtozyvatqnsafqcehkjcsymiygwyqanzuyf` (`type`),
  ADD KEY `idx_kyuixqhvwqwuptzbhxpmvbcqnlfernmtfpaa` (`enabled`),
  ADD KEY `idx_sedbuwkvimltlroklburrvogxbbeepqlwjra` (`canonicalId`),
  ADD KEY `idx_euorlrxngeidljcerympnkpacxaqyvgfiwqy` (`archived`,`dateCreated`),
  ADD KEY `idx_vriwaptolntisppkheggfecipnvrskmufdmz` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `idx_ofevnutqjfgehbshxvfpgbtehkrkfzpqmvwe` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  ADD KEY `fk_csqfbopvlpqwsrgpsqwtzyjtedhgxmlgiqyc` (`draftId`),
  ADD KEY `fk_wxcqgeejfvyccxkqnausycdonpguewfrkbku` (`revisionId`);

--
-- Indexen voor tabel `elements_bulkops`
--
ALTER TABLE `elements_bulkops`
  ADD PRIMARY KEY (`elementId`,`key`),
  ADD KEY `idx_uhznywmupaojokvrqzclhhodlawtruhszmwo` (`timestamp`);

--
-- Indexen voor tabel `elements_owners`
--
ALTER TABLE `elements_owners`
  ADD PRIMARY KEY (`elementId`,`ownerId`),
  ADD KEY `fk_qdrsaursteojyxehjorqriyvnkmchezqgphl` (`ownerId`);

--
-- Indexen voor tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_iheutimuauazlzthgigwwxvajigwmuvnyfvs` (`elementId`,`siteId`),
  ADD KEY `idx_zkegpdsrohczbiqkuveipfxcnqrvonpzeoiu` (`siteId`),
  ADD KEY `idx_vdzghbfxhtjyouxmuuaxfedbtezqsoigoojs` (`title`,`siteId`),
  ADD KEY `idx_jupamukcismekfcbhxzwzldwbveualsuvfbu` (`slug`,`siteId`),
  ADD KEY `idx_uotkjzzjubqemgojnytaggwryafzfwufjeqb` (`enabled`),
  ADD KEY `idx_ugqehcbmecgbmephihyelnsxzhukchoennfr` (`uri`,`siteId`);

--
-- Indexen voor tabel `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mclxobnpkjtfwpcegpzlbdhbmkrbywamkdwh` (`postDate`),
  ADD KEY `idx_sdldflmeeziycdjscqezbsmgswavdplxfern` (`expiryDate`),
  ADD KEY `idx_mxqhnlagvntyexexseophbrtgjvbqpjeycvm` (`sectionId`),
  ADD KEY `idx_okmvxmtpjevyofhwrfovcpftnrzayebhorle` (`typeId`),
  ADD KEY `idx_kzpvdpbamhhtjlnievsbcytqafmvjjwwgsed` (`primaryOwnerId`),
  ADD KEY `idx_koykgyfrkfjbuxxczjjbxfkbcahndsdpotiw` (`fieldId`),
  ADD KEY `fk_kktnqclfdhneboqxkygijemqlkjofkxehsfo` (`parentId`),
  ADD KEY `idx_epswdfiqkvrlstehlwlifupgcwdjkaiaxmwm` (`status`);

--
-- Indexen voor tabel `entries_authors`
--
ALTER TABLE `entries_authors`
  ADD PRIMARY KEY (`entryId`,`authorId`),
  ADD KEY `idx_cajhfzulzyqcqphwobkcckqrqcgnojhwfots` (`authorId`),
  ADD KEY `idx_pgacjbfrauwhavvpzcamtbvxgsvvkftourdu` (`entryId`,`sortOrder`);

--
-- Indexen voor tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qmjxcsxjryxlyzifdilbegddzknhhmjtmxgc` (`fieldLayoutId`),
  ADD KEY `idx_mtrmivhehzxeynsatqqrwbdlosczuleobdye` (`dateDeleted`);

--
-- Indexen voor tabel `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fxtqicdtjiwlhwbndywennhpszxmjphhipke` (`dateDeleted`),
  ADD KEY `idx_prrouhztyoysmrhkenyuehpxpgwswslxjnio` (`type`);

--
-- Indexen voor tabel `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jzglpsxsgvpdblmsnoprgjirnakigasvyuis` (`handle`,`context`),
  ADD KEY `idx_gvevrlwehokhhhfastuetxefvwlbgktulqwm` (`context`),
  ADD KEY `idx_zerzrlicirhzuhaklbgklkgyqfcbqjjwcmoo` (`dateDeleted`);

--
-- Indexen voor tabel `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hoyrgyzchpbzxlzttlzeafjlpvowgexuqvhg` (`name`),
  ADD KEY `idx_jukwrpnjhklgjtzkczuyplcmzqcknczlsdlx` (`handle`),
  ADD KEY `idx_mkmctnswvuoujcyiboduveqrivxuksgjdkiy` (`fieldLayoutId`),
  ADD KEY `idx_ynhbepcbbzvxofuduhbwiqzhqnnyqifibirb` (`sortOrder`);

--
-- Indexen voor tabel `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_zazjrysdemeytjsiwylsncqdzhzunapoicut` (`accessToken`),
  ADD UNIQUE KEY `idx_gdpiznbqrpspsqhmchjrcdfzgpeijjgcziwt` (`name`),
  ADD KEY `fk_wtveitxzbvvdgihcbajiylpcxutadjdymmlh` (`schemaId`);

--
-- Indexen voor tabel `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wwzqdtvwxsrcvqgrpfouprsujgfgopjmxfak` (`assetId`,`transformString`);

--
-- Indexen voor tabel `imagetransforms`
--
ALTER TABLE `imagetransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ayysmgwnlxzwruuznyzfscnktrmjijngchdt` (`name`),
  ADD KEY `idx_pxhzbzvzwhvubwgwlclveeplhmjszxfmxhip` (`handle`);

--
-- Indexen voor tabel `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ndicomdspsraslrsiqfjgjyerdlkmjmdrrll` (`track`,`name`);

--
-- Indexen voor tabel `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lgixmcgqzfzdgaerpwnlceymiasgyeqhbdlw` (`handle`);

--
-- Indexen voor tabel `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexen voor tabel `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_adwcelsadwimxkmmnxymmlhfmxhhozgyfbsm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_smmzjosvshmcsuywnpwxovgnuswvvscqlgjr` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexen voor tabel `recoverycodes`
--
ALTER TABLE `recoverycodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uecfwjpldadmdhceppqbknjgtxislrvtafuu` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_xtdohnsvznapwvdvtqowukfkaijomcwccpjp` (`sourceId`),
  ADD KEY `idx_yckhresmbsyvkdzvypkphaisnaqzhfhpomee` (`targetId`),
  ADD KEY `idx_gxsienfhgefxtyizfjpfnfwszlfpgxogpidm` (`sourceSiteId`);

--
-- Indexen voor tabel `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexen voor tabel `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ggxovoezlyolxlefkokrdrdkzsmpatpvlpqn` (`canonicalId`,`num`),
  ADD KEY `fk_ennlawfbudifgqpttahadutsilzhzoopzhcq` (`creatorId`);

--
-- Indexen voor tabel `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_eguphcoxkfogcfvwyyewhjbyazxmpytrocsw` (`keywords`);

--
-- Indexen voor tabel `searchindexqueue`
--
ALTER TABLE `searchindexqueue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nhmbogowdtmafcismfzaoxlarnjwpydzedzw` (`elementId`,`siteId`,`reserved`);

--
-- Indexen voor tabel `searchindexqueue_fields`
--
ALTER TABLE `searchindexqueue_fields`
  ADD PRIMARY KEY (`jobId`,`fieldHandle`),
  ADD UNIQUE KEY `idx_bhxizsrfppszjpopohrewzvamrnfkmjmlexp` (`jobId`,`fieldHandle`);

--
-- Indexen voor tabel `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qyqmonslfevfpyqztrhbimagkdqfvzskzaxc` (`handle`),
  ADD KEY `idx_wfdohxervwcumxdfjwfucqgmybkvmzymxdvz` (`name`),
  ADD KEY `idx_kzldqlktdwtbpobjtjkzjdnutftzwcowaaiu` (`structureId`),
  ADD KEY `idx_fevsfsqcaacxtlefcnmmnivxjzbcqqvelcmu` (`dateDeleted`);

--
-- Indexen voor tabel `sections_entrytypes`
--
ALTER TABLE `sections_entrytypes`
  ADD PRIMARY KEY (`sectionId`,`typeId`),
  ADD KEY `fk_lxqlbkaprgvebgjcoainjsjkrzkpaddecuyc` (`typeId`);

--
-- Indexen voor tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_pekajidsaeshgdkrvnekndtyloepoqngvalq` (`sectionId`,`siteId`),
  ADD KEY `idx_etmvkijicssgmynxtqtlwhpsyqhkeswdldjd` (`siteId`);

--
-- Indexen voor tabel `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pqekxwhnetcliwqtlsgdlgwsmovapkaajzpo` (`uid`),
  ADD KEY `idx_fpqehtajmwnsbqexxzcjdgivtpigchfuwnaz` (`token`),
  ADD KEY `idx_zyycyqvdznfevphuahmbsfeyguiaqidxpsbz` (`dateUpdated`),
  ADD KEY `idx_zmzmeztwekmytxggsbcwfylhzznjaidqlagn` (`userId`);

--
-- Indexen voor tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_egzsafkwselzaqyrwotdptcwsyuyevqggqav` (`userId`,`message`);

--
-- Indexen voor tabel `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wbtckxosbyylnhqphuyryivlhqggkbcdlzxr` (`name`);

--
-- Indexen voor tabel `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_eacarwhpnnyljfjzdsbvyujufwqvmwstumxv` (`dateDeleted`),
  ADD KEY `idx_jrqzvzplsupjtfkudednvdossbfjmhlaxhbw` (`handle`),
  ADD KEY `idx_petfljdxofxxxclhzblalgjsrayoxcmwqnnv` (`sortOrder`),
  ADD KEY `fk_fmjczzvdrkrrehmufdyctudnhkhrsmtvbypd` (`groupId`);

--
-- Indexen voor tabel `sso_identities`
--
ALTER TABLE `sso_identities`
  ADD PRIMARY KEY (`provider`,`identityId`,`userId`),
  ADD KEY `fk_kwqplacdhaywfszamzhvguxfgnfflxslyzdq` (`userId`);

--
-- Indexen voor tabel `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_aibzuinnplyssziirseioufkkraopwyylxan` (`structureId`,`elementId`),
  ADD KEY `idx_kbweyijcphyxwbfldvkqsvqdtfbjgyipjbzg` (`root`),
  ADD KEY `idx_zekycwirxatabxqbmegcbtuyuflipkccwfwl` (`lft`),
  ADD KEY `idx_xhdqtbthehwyidxywzhcfkbpfrqzjvazlrgi` (`rgt`),
  ADD KEY `idx_ahhnyopomukjvbqhgpusltspaviremjbuofy` (`level`),
  ADD KEY `idx_qlztbvxmlibznxyncsgmwlakpwmilitrcwbg` (`elementId`);

--
-- Indexen voor tabel `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cixywchpqcyxwruphnuoempsydsdxytstvmo` (`dateDeleted`);

--
-- Indexen voor tabel `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uanwvhvlwcjpkdbrkpsajiwxcittlxoniidf` (`key`,`language`),
  ADD KEY `idx_gjuqpyfsrmdyziiwdpznubrckkwoqaamdaxg` (`language`);

--
-- Indexen voor tabel `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lxgfvqvazwewqeryfrnbrhfsbffytdgdwyyt` (`name`),
  ADD KEY `idx_iqukpxilmdlffylrqwpzahbxmzkvcqkyivft` (`handle`),
  ADD KEY `idx_kdvuzpltzurewdbvbpefxripnboipomezsag` (`dateDeleted`),
  ADD KEY `fk_sexajsccrmnurxxyyalbofkooogzaqetzxnb` (`fieldLayoutId`);

--
-- Indexen voor tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_csiukblrxuqcyszmmhatmljwuogfhozdylmc` (`groupId`);

--
-- Indexen voor tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_axrkpgzaxlkqmndxqjpmvtmwztbkmdmnfrlc` (`token`),
  ADD KEY `idx_qozuujyxdufzylwwspfdvturfgecczmerxgq` (`expiryDate`);

--
-- Indexen voor tabel `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fikbsqhljoexbmufaxfyllijhpapyaobjhhr` (`handle`),
  ADD KEY `idx_gssmdigncxvjytdzrkyuwiffxjvebkewhpxn` (`name`);

--
-- Indexen voor tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_neuhxtdrmwxecyvfetmynollxwlbvnowdxai` (`groupId`,`userId`),
  ADD KEY `idx_bppejmodowfqnyaqhjbklznzxixnqbrpclzr` (`userId`);

--
-- Indexen voor tabel `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_suysvulmmoewcsgjnxwrtooyqieqjqrwwoyw` (`name`);

--
-- Indexen voor tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_aayzkozbowizhqqcnysmrovpweihpyvfafxn` (`permissionId`,`groupId`),
  ADD KEY `idx_opvpdlkrezkfmppeegemxhchrbqujmrfwkdu` (`groupId`);

--
-- Indexen voor tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mdxlmaaxemtcasceahymytloxpmygavurcix` (`permissionId`,`userId`),
  ADD KEY `idx_kilhowevjtjvhdxhgskqzqpjtknwelovaecx` (`userId`);

--
-- Indexen voor tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mzxxqcatadebsvfrpgkvwuvpzgbxrxkasexc` (`active`),
  ADD KEY `idx_dkmtkqghlevblojpodgorwbeubgcbxsbhrbn` (`locked`),
  ADD KEY `idx_rkiolfkrsiuirncvqdyaudoikkfgnsmwyydn` (`pending`),
  ADD KEY `idx_iaggekegeakmofpchxaedvmiwyjqfbwjyrkm` (`suspended`),
  ADD KEY `idx_zrtsfteyeuhygtvcnvvmoatplvgftzvmjvvw` (`verificationCode`),
  ADD KEY `idx_zukcvknezdmzycpryajpygpeljqdnpfjctcl` (`email`),
  ADD KEY `idx_pefrtrsxexmqewkkniztwbfgshgjivfztxbh` (`username`),
  ADD KEY `fk_gzozoyyyuzdlcqjlsadoaupmlzyaktvvomha` (`photoId`),
  ADD KEY `fk_owabnxylxrgpyqxskelmrxlqaqbuawubspmi` (`affiliatedSiteId`);

--
-- Indexen voor tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mafwzxioxpyepdjgxucxetotqtzasbkqvoyn` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_zrsofsblgvxwnkcoixxsghfhjzxojkyxatuk` (`parentId`),
  ADD KEY `idx_dhvenhineezzugtrpgparkdcgnallmdzudzs` (`volumeId`);

--
-- Indexen voor tabel `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qtpdumzdtozkspgacxrhbvrhcsshxjrsnpml` (`name`),
  ADD KEY `idx_nkfsohqvmbnsqaulhsojvfipsnrsekidplhx` (`handle`),
  ADD KEY `idx_qnrcswpiaiyiwvzeibpebxixdkcdildpvrem` (`fieldLayoutId`),
  ADD KEY `idx_omatougchvkbapmqszpghzoiqzhiljvwbvwj` (`dateDeleted`);

--
-- Indexen voor tabel `webauthn`
--
ALTER TABLE `webauthn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bosuuzttchfndemkciimgtknjfqjtampyjcf` (`userId`);

--
-- Indexen voor tabel `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fbninjebyiccoburkyjzcgwydfkcvyszhwyr` (`userId`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `authenticator`
--
ALTER TABLE `authenticator`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT voor een tabel `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT voor een tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT voor een tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT voor een tabel `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `imagetransforms`
--
ALTER TABLE `imagetransforms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `info`
--
ALTER TABLE `info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT voor een tabel `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1260;

--
-- AUTO_INCREMENT voor een tabel `recoverycodes`
--
ALTER TABLE `recoverycodes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT voor een tabel `searchindexqueue`
--
ALTER TABLE `searchindexqueue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT voor een tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT voor een tabel `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT voor een tabel `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `webauthn`
--
ALTER TABLE `webauthn`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_yprnyluvufsfuwxnngkjpfrgsibmwtyhhzru` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zmfdbzxpzoelthpndzvxvwyvcvbynvnaauit` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_wurtpnovccvyezrxiwgfrzjpohuqltjloabc` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ylashoahzgwohcqechrqzuvdnmqdigpgmlsm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_ruadhpxhzdfotnicystkqvqxjkzrtrsunghu` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sdryxsdrtrfivmukxmdickmxdthmlkbzjpom` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_egzjonuucocfxewzovhyikpeyybkepdpnmlq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_swlipolvmahbfdwfwptfscobhoolgoumphxi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vhlozqapgpgvakrnctwjvatbffnjbspoynyg` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wclzsaflsguzpzefgbunrcbujsvuffpeqvju` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assets_sites`
--
ALTER TABLE `assets_sites`
  ADD CONSTRAINT `fk_jaojtxiszjgbzaospxdclfzpjkoevextrwoe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_notawlhtsukndzkmgqhdrniucprjupfgrqjs` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `authenticator`
--
ALTER TABLE `authenticator`
  ADD CONSTRAINT `fk_qotvvyiyfollyfmnidezrctprbjfksoehjwx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_flnlixxrnjcbsmudmynyalvcrpworolfeewj` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_itucwudobpsbzsbxpcnmswjkmgdjtikvarbq` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yjdjpaoeiydnpalqpdabswouhpsjcclepqkl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_rabshtfgvxciczmxdfyqrwykcgygebkmvmlg` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xolocqoiscowgtqnwirbivfwnviwztbqwqvl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_kotrkuejlfodvcnupvitghpdevtuhsgfapie` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tshearfvynedyuxehfxwwxtwmfuofbfytdxb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_gbvzrzndtfahoqqtnlopkfofdovlybfroviy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_otfkxwepmuupfneuwwzrkofvijucfedmyifd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_veykfcoyswuhvgzgozgkzkrscjnqyqobqviz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_heiampmhjzbthizdrkppglvjbvjxcfwtmuga` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kwccuhmhmypxtjpdklkhtzvrxyrqetfvxuyc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_odiesqgevengdngyepvknjuexpzbcgqbfnvq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vqfbiuvimgbyousdbfzgvnsqfymojhzqmmdi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_eqpbksywykwntcnormnzrdguzbkecrddfdgu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_fbmotxfnitatrqacpvpxoovqnxukkghzayie` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ggkpznymgfytxcbxaeakmodtelgxqbudgtoa` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `elementactivity`
--
ALTER TABLE `elementactivity`
  ADD CONSTRAINT `fk_cezcjhgiqbeaznidqdepitjdlahatrijtpjs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_huajyovyzqlcnpurovwfzadkjdheyulkdvxj` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ureteghwkgypuynrgafbdzdxubxglusuvvhz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zhrsudnwznxrdehfrpdkfvhopqmqayuhwcil` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_csqfbopvlpqwsrgpsqwtzyjtedhgxmlgiqyc` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_loomknqsdffuoksbhdqsqqlplngbladzgbfp` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wuqparetuzlyxvjodlcdivvazsypovepoabc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wxcqgeejfvyccxkqnausycdonpguewfrkbku` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements_owners`
--
ALTER TABLE `elements_owners`
  ADD CONSTRAINT `fk_pynnnigmhjunjbeamgdarblvpbjazoucakva` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qdrsaursteojyxehjorqriyvnkmchezqgphl` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_jehuogfjhudpcrluqsopwayvyqxdhtklbqtb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ulfccichlwajfharnpkzyljgdecthyolafnn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_hjesfeuqgshxtouhnhqnhaxbzyztadfltrzp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hkoikflxdauclypnuvzzgrxhgbbazonnhebg` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hongtwakxojcypuxrenfjpkakagnbgxyazcv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_kktnqclfdhneboqxkygijemqlkjofkxehsfo` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tssaqumtseglueestetoyogrbfietjfvnvci` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zmgtjimuwqpcgrylvnqwqhywkbcpokiaowdw` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entries_authors`
--
ALTER TABLE `entries_authors`
  ADD CONSTRAINT `fk_aldmglxctnnxwtyvnvmjdpcxdmeqxdodxqrv` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lydlzlkpgnfewnllhzomxsngcfqsiferuszb` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_fudlkbyvuquhfkdjzigaxeilqsjepopfvntm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_mwtjgyxxltjauecvykqkngecljrvcjudxnog` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yqhcaztvkdghsjabikywyewhqhcyfvarwxss` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_wtveitxzbvvdgihcbajiylpcxutadjdymmlh` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_dnbnuarhkjxvoudgndvsavqgfynhsapujzfq` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gqcftpkmzafpjsmucnwxnzqiatwqftlqtqqv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_obbbtmiviwyupgjarynlzcpzmvqxrhvnmubu` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_ennlawfbudifgqpttahadutsilzhzoopzhcq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yakqmagceejbyshrdexqyyhxaruotnjqcsmv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `searchindexqueue`
--
ALTER TABLE `searchindexqueue`
  ADD CONSTRAINT `fk_blxhscbtmsyvitgsouxcrgwclqlxqitfptyb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `searchindexqueue_fields`
--
ALTER TABLE `searchindexqueue_fields`
  ADD CONSTRAINT `fk_hbtpcubnzpmeddnguhptnqggdqcojeljpufg` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_nnrdkkppelptatncbmxlefoufsyesmnucsod` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `sections_entrytypes`
--
ALTER TABLE `sections_entrytypes`
  ADD CONSTRAINT `fk_ilcgcnlhvzremikjjbfdhbuuggmccwmzullg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lxqlbkaprgvebgjcoainjsjkrzkpaddecuyc` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_kfavrsxunqcbsaxtpxcwuwwksipnwvfvekgh` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ujadhopumiawuzwmoezanihzzokgcocxktfe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_fvakeueiolghhyoqopcrpkcfkxcpidfyruiu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_xgqwutfyfvqiinswltmuvxzstxfliinbnfxx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_fmjczzvdrkrrehmufdyctudnhkhrsmtvbypd` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sso_identities`
--
ALTER TABLE `sso_identities`
  ADD CONSTRAINT `fk_kwqplacdhaywfszamzhvguxfgnfflxslyzdq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_ijilhiufivrgimflnpuxsexxrrmddycyuukf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_sexajsccrmnurxxyyalbofkooogzaqetzxnb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_dwrjgaljckjsxrdwiugbnacesxsninqafmig` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_eqmvybnkfdondznixfjtafaqhrrltsohgeym` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_unttxguawynrcbgolwhkxtachqioejmujntv` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zwehwatoxinudytadfaxilreekjyzezcdane` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_klibgyxcvqmzuiecfjgmoerckbgablcpubdi` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tvwwfxboitkdkyxmniinbmcnfufqpaxrsqkc` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_nctngmzjlomnbnerhfctmtgdjnagcgpfrtdn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nzfcfayfagresdbctizkkjdkaburpyvunknz` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_fvmvbcztsidnsghwhlxuegfbzgasmvmjistq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_fihichzmccyxeepjcrhzlojjorhxyysyoamv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gzozoyyyuzdlcqjlsadoaupmlzyaktvvomha` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_owabnxylxrgpyqxskelmrxlqaqbuawubspmi` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_pxatcrbvfodecwygtvubljcrlxhtaligerxf` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xwokrnmgoynisacrxssvtabltckmcobfqlvt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_fhhfxddzpsflpztrgtzawikftcmiqayfjeri` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `webauthn`
--
ALTER TABLE `webauthn`
  ADD CONSTRAINT `fk_bosuuzttchfndemkciimgtknjfqjtampyjcf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_jmtkrnhuagtvepcxqytypbsrrivnztfihewj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
