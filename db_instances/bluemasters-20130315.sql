-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2013 at 05:03 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bluemasters`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longblob NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`aid`, `type`, `callback`, `parameters`, `label`) VALUES
('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment'),
('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment'),
('node_publish_action', 'node', 'node_publish_action', '', 'Publish post'),
('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish post'),
('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make post sticky'),
('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make post unsticky'),
('node_promote_action', 'node', 'node_promote_action', '', 'Promote post to front page'),
('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove post from front page'),
('node_save_action', 'node', 'node_save_action', '', 'Save post'),
('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user'),
('user_block_ip_action', 'user', 'user_block_ip_action', '', 'Ban IP address of current user'),
('comment_save_action', 'comment', 'comment_save_action', '', 'Save comment'),
('system_block_ip_action', 'user', 'system_block_ip_action', '', 'Ban IP address of current user');

-- --------------------------------------------------------

--
-- Table structure for table `aggregator_category`
--

CREATE TABLE IF NOT EXISTS `aggregator_category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `block` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aggregator_category_feed`
--

CREATE TABLE IF NOT EXISTS `aggregator_category_feed` (
  `fid` int(11) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`,`fid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aggregator_category_item`
--

CREATE TABLE IF NOT EXISTS `aggregator_category_item` (
  `iid` int(11) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`,`iid`),
  KEY `iid` (`iid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aggregator_feed`
--

CREATE TABLE IF NOT EXISTS `aggregator_feed` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` text NOT NULL COMMENT 'URL to the feed.',
  `refresh` int(11) NOT NULL DEFAULT '0',
  `checked` int(11) NOT NULL DEFAULT '0',
  `link` text NOT NULL COMMENT 'The parent website of the feed; comes from the <link> element in the feed.',
  `description` longtext NOT NULL,
  `image` longtext NOT NULL,
  `etag` varchar(255) NOT NULL DEFAULT '',
  `modified` int(11) NOT NULL DEFAULT '0',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `hash` varchar(64) NOT NULL DEFAULT '',
  `queued` int(11) NOT NULL DEFAULT '0' COMMENT 'Time when this feed was queued for refresh, 0 if not queued.',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `title` (`title`),
  KEY `queued` (`queued`),
  KEY `url` (`url`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aggregator_item`
--

CREATE TABLE IF NOT EXISTS `aggregator_item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL COMMENT 'Link to the feed item.',
  `author` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `guid` text NOT NULL COMMENT 'Unique identifier for the feed item.',
  PRIMARY KEY (`iid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `authmap`
--

CREATE TABLE IF NOT EXISTS `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `backup_migrate_destinations`
--

CREATE TABLE IF NOT EXISTS `backup_migrate_destinations` (
  `destination_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `type` varchar(32) NOT NULL COMMENT 'The type of the destination.',
  `location` text NOT NULL COMMENT 'The the location string of the destination.',
  `settings` text NOT NULL COMMENT 'Other settings for the destination.',
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `backup_migrate_profiles`
--

CREATE TABLE IF NOT EXISTS `backup_migrate_profiles` (
  `profile_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `filename` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `append_timestamp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Append a timestamp to the filename.',
  `timestamp_format` varchar(14) NOT NULL COMMENT 'The format of the timestamp.',
  `filters` text NOT NULL COMMENT 'The filter settings for the profile.',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `backup_migrate_schedules`
--

CREATE TABLE IF NOT EXISTS `backup_migrate_schedules` (
  `schedule_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `source_id` varchar(32) NOT NULL DEFAULT 'db' COMMENT 'The backup_migrate_destination.destination_id of the source to backup from.',
  `destination_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The backup_migrate_destination.destination_id of the destination to back up to.',
  `profile_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `keep` int(11) NOT NULL DEFAULT '0' COMMENT 'The number of backups to keep.',
  `period` int(11) NOT NULL DEFAULT '0' COMMENT 'The number of seconds between backups.',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Whether the schedule is enabled.',
  `cron` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Whether the schedule should be run during cron.',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `bid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longblob COMMENT 'A serialized array containing the processing data for the batch.',
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE IF NOT EXISTS `block` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=181 ;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `visibility`, `pages`, `title`, `cache`) VALUES
(1, 'user', 'login', 'garland', 1, 0, 'sidebar_first', 0, 0, '', '', -1),
(2, 'system', 'navigation', 'garland', 1, 0, 'sidebar_first', 0, 0, '', '', -1),
(3, 'system', 'powered-by', 'garland', 1, 10, 'footer', 0, 0, '', '', -1),
(4, 'system', 'powered-by', 'skodaxanthifc', 1, -6, 'footer', 0, 0, '', '', -1),
(5, 'user', 'login', 'skodaxanthifc', 1, 0, 'sidebar_second', 0, 0, '', '', -1),
(6, 'system', 'navigation', 'skodaxanthifc', 1, 0, 'sidebar_second', 0, 0, '', '', -1),
(7, 'comment', 'recent', 'skodaxanthifc', 0, -5, '', 0, 0, '', '', 1),
(8, 'menu', 'menu-about-us', 'skodaxanthifc', 1, 0, 'footer_left', 0, 0, '', '', -1),
(9, 'menu', 'menu-categories', 'skodaxanthifc', 1, -6, 'footer_center', 0, 0, '', '', -1),
(10, 'system', 'main-menu', 'skodaxanthifc', 0, -6, '', 0, 0, '', '', -1),
(11, 'menu', 'secondary-menu', 'skodaxanthifc', 0, -4, '', 0, 0, '', '', -1),
(12, 'node', 'syndicate', 'skodaxanthifc', 0, -3, '', 0, 0, '', '', -1),
(13, 'user', 'new', 'skodaxanthifc', 0, -2, '', 0, 0, '', '', 1),
(14, 'user', 'online', 'skodaxanthifc', 0, -1, '', 0, 0, '', '', -1),
(15, 'comment', 'recent', 'bluemasters', 0, -13, '-1', 0, 0, '', '', 1),
(16, 'menu', 'menu-about-us', 'bluemasters', 1, 0, 'footer_left_1', 0, 0, '', '', -1),
(17, 'menu', 'menu-categories', 'bluemasters', 1, -15, 'footer_left_2', 0, 0, '', '', -1),
(18, 'system', 'main-menu', 'bluemasters', 0, -17, '-1', 0, 0, '', '', -1),
(19, 'menu', 'secondary-menu', 'bluemasters', 0, -11, '-1', 0, 0, '', '', -1),
(20, 'node', 'syndicate', 'bluemasters', 0, -7, '-1', 0, 0, '', '', -1),
(21, 'system', 'powered-by', 'bluemasters', 0, -14, '-1', 0, 0, '', '', -1),
(22, 'user', 'login', 'bluemasters', 0, -6, '-1', 0, 0, '', '', -1),
(23, 'system', 'navigation', 'bluemasters', 0, -18, '-1', 0, 0, '', '', -1),
(24, 'user', 'new', 'bluemasters', 0, -4, '-1', 0, 0, '', '', 1),
(25, 'user', 'online', 'bluemasters', 0, -3, '-1', 0, 0, '', '', -1),
(26, 'block', '1', 'bluemasters', 1, -5, 'home_area_1', 0, 0, '', 'About iPadMasters', -1),
(27, 'block', '1', 'garland', 0, 0, '-1', 0, 0, '', 'About iPadMasters', -1),
(28, 'block', '2', 'bluemasters', 1, -3, 'home_area_2', 0, 0, '', 'Our Blog Updates', -1),
(29, 'block', '2', 'garland', 0, 0, '-1', 0, 0, '', 'Our Blog Updates', -1),
(30, 'block', '1', 'bluemarine', 1, 0, 'sidebar_first', 0, 0, '', 'About iPadMasters', -1),
(31, 'block', '2', 'bluemarine', 1, -1, 'sidebar_first', 0, 0, '', 'Our Blog Updates', -1),
(32, 'comment', 'recent', 'bluemarine', 0, -6, 'sidebar_first', 0, 0, '', '', 1),
(33, 'menu', 'menu-about-us', 'bluemarine', 1, 0, 'sidebar_first', 0, 0, '', '', -1),
(34, 'menu', 'menu-categories', 'bluemarine', 1, -6, 'sidebar_first', 0, 0, '', '', -1),
(35, 'system', 'main-menu', 'bluemarine', 0, -7, 'sidebar_first', 0, 0, '', '', -1),
(36, 'menu', 'secondary-menu', 'bluemarine', 0, -5, 'sidebar_first', 0, 0, '', '', -1),
(37, 'node', 'syndicate', 'bluemarine', 0, -4, 'sidebar_first', 0, 0, '', '', -1),
(38, 'system', 'powered-by', 'bluemarine', 1, -6, 'footer', 0, 0, '', '', -1),
(39, 'user', 'login', 'bluemarine', 1, 0, 'sidebar_second', 0, 0, '', '', -1),
(40, 'system', 'navigation', 'bluemarine', 1, 0, 'sidebar_second', 0, 0, '', '', -1),
(41, 'user', 'new', 'bluemarine', 0, -3, 'sidebar_first', 0, 0, '', '', 1),
(42, 'user', 'online', 'bluemarine', 0, -2, 'sidebar_first', 0, 0, '', '', -1),
(43, 'block', '3', 'bluemasters', 1, -2, 'footer_center', 0, 0, '', 'From The Gallery', -1),
(44, 'block', '3', 'bluemarine', 0, 0, '', 0, 0, '', 'From The Gallery', -1),
(45, 'block', '3', 'garland', 0, 0, '-1', 0, 0, '', 'From The Gallery', -1),
(46, 'block', '4', 'bluemasters', 1, -15, 'footer_right', 0, 0, '', 'Twitter Updates', -1),
(47, 'block', '4', 'bluemarine', 0, 0, '', 0, 0, '', 'Twitter Updates', -1),
(48, 'block', '4', 'garland', 0, 0, '-1', 0, 0, '', 'Twitter Updates', -1),
(49, 'block', '5', 'bluemasters', 1, -15, 'header', 0, 0, '', '', -1),
(50, 'block', '5', 'bluemarine', 0, 0, '', 0, 0, '', '', -1),
(51, 'block', '5', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(52, 'block', '6', 'bluemasters', 1, -15, 'home_area_3', 0, 0, '', 'Get In Touch', -1),
(53, 'block', '6', 'bluemarine', 0, 0, '', 0, 0, '', 'Get In Touch', -1),
(54, 'block', '6', 'garland', 0, 0, '-1', 0, 0, '', 'Get In Touch', -1),
(55, 'search', 'form', 'bluemasters', 1, -11, 'search_area', 0, 0, '', '', -1),
(56, 'block', '7', 'bluemasters', 1, -14, 'home_area_3_b', 0, 0, '', '', -1),
(57, 'block', '7', 'bluemarine', 0, 0, '', 0, 0, '', '', -1),
(58, 'block', '7', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(59, 'menu', 'menu-site-navigation', 'bluemasters', 1, -15, 'sidebar_first', 0, 0, '', '', -1),
(60, 'block', '8', 'bluemasters', 1, -14, 'sidebar_first', 0, 0, '', 'More than Themes', -1),
(61, 'block', '8', 'bluemarine', 0, 0, '', 0, 0, '', 'More than Themes', -1),
(62, 'block', '8', 'garland', 0, 0, '-1', 0, 0, '', 'More than Themes', -1),
(63, 'comment', 'recent', 'garland', 0, 0, '-1', 0, 0, '', '', 1),
(64, 'menu', 'menu-about-us', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(65, 'menu', 'menu-categories', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(66, 'system', 'main-menu', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(67, 'menu', 'secondary-menu', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(68, 'menu', 'menu-site-navigation', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(69, 'node', 'syndicate', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(70, 'search', 'form', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(71, 'user', 'new', 'garland', 0, 0, '-1', 0, 0, '', '', 1),
(72, 'user', 'online', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(73, 'block', '9', 'bluemasters', 1, -13, 'sidebar_first', 0, 0, '', 'Choose the next theme', -1),
(74, 'block', '9', 'bluemarine', 0, 0, '', 0, 0, '', 'Choose the next theme', -1),
(75, 'block', '9', 'garland', 0, 0, '-1', 0, 0, '', 'Choose the next theme', -1),
(76, 'block', '10', 'bluemasters', 0, -16, '-1', 0, 0, '', 'Coming on Drupal 7', -1),
(77, 'block', '10', 'bluemarine', 0, 0, '', 0, 0, '', 'Coming on Drupal 7', -1),
(78, 'block', '10', 'garland', 0, 0, '-1', 0, 0, '', 'Coming on Drupal 7', -1),
(79, 'system', 'help', 'bluemasters', 1, 0, 'help', 0, 0, '', '', -1),
(80, 'system', 'main', 'bluemasters', 1, 0, 'content', 0, 0, '', '', -1),
(81, 'system', 'help', 'garland', 1, 0, 'help', 0, 0, '', '', -1),
(82, 'system', 'main', 'garland', 1, 0, 'content', 0, 0, '', '', -1),
(83, 'block', '11', 'bluemasters', 1, -10, 'footer', 0, 0, '', '', -1),
(84, 'block', '11', 'garland', 1, -10, 'footer', 0, 0, '', '', -1),
(90, 'system', 'management', 'bluemasters', 0, -15, '-1', 0, 0, '', '', -1),
(85, 'node', 'recent', 'garland', 0, 0, '-1', 0, 0, '', '', 1),
(86, 'system', 'management', 'garland', 1, 0, 'sidebar_first', 0, 0, '', '', -1),
(87, 'system', 'user-menu', 'garland', 1, 0, 'sidebar_first', 0, 0, '', '', -1),
(89, 'node', 'recent', 'bluemasters', 0, -12, '-1', 0, 0, '', '', 1),
(91, 'system', 'user-menu', 'bluemasters', 0, -5, '-1', 0, 0, '', '', -1),
(93, 'block', '1', 'seven', 0, 0, '-1', 0, 0, '', 'About iPadMasters', -1),
(94, 'block', '10', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(95, 'block', '11', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(96, 'block', '3', 'seven', 0, 0, '-1', 0, 0, '', 'From The Gallery', -1),
(97, 'block', '6', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(98, 'block', '8', 'seven', 0, 0, '-1', 0, 0, '', 'More than Themes', -1),
(99, 'block', '2', 'seven', 0, 0, '-1', 0, 0, '', 'Our Blog Updates', -1),
(100, 'block', '7', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(101, 'block', '5', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(102, 'block', '4', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(103, 'block', '9', 'seven', 0, 0, '-1', 0, 0, '', 'Choose the next theme', -1),
(104, 'comment', 'recent', 'seven', 1, 0, 'dashboard_inactive', 0, 0, '', '', 1),
(105, 'menu', 'menu-about-us', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(106, 'menu', 'menu-categories', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(107, 'system', 'main-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(108, 'menu', 'secondary-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(109, 'menu', 'menu-site-navigation', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(110, 'node', 'syndicate', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(111, 'node', 'recent', 'seven', 1, 0, 'dashboard_main', 0, 0, '', '', 1),
(112, 'search', 'form', 'seven', 1, 1, 'dashboard_inactive', 0, 0, '', '', -1),
(113, 'system', 'main', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(114, 'system', 'powered-by', 'seven', 0, 10, '-1', 0, 0, '', '', -1),
(115, 'system', 'help', 'seven', 0, 5, '-1', 0, 0, '', '', -1),
(116, 'system', 'navigation', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(117, 'system', 'management', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(118, 'system', 'user-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(120, 'user', 'login', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(121, 'user', 'new', 'seven', 1, 2, 'dashboard_inactive', 0, 0, '', '', 1),
(122, 'user', 'online', 'seven', 1, 3, 'dashboard_inactive', 0, 0, '', '', -1),
(134, 'block', '11', 'bluemasters1', 1, -10, 'footer', 0, 0, '', '', -1),
(133, 'block', '10', 'bluemasters1', 0, -15, '-1', 0, 0, '', 'Coming on Drupal 7', -1),
(132, 'block', '1', 'bluemasters1', 1, -5, 'home_area_1', 0, 0, '', 'About iPadMasters', -1),
(135, 'block', '2', 'bluemasters1', 1, -3, 'home_area_2', 0, 0, '', 'Our Blog Updates', -1),
(136, 'block', '3', 'bluemasters1', 1, -2, 'footer_center', 0, 0, '', 'From The Gallery', -1),
(137, 'block', '4', 'bluemasters1', 1, -15, 'footer_right', 0, 0, '', 'Twitter Updates', -1),
(138, 'block', '5', 'bluemasters1', 1, -15, 'header', 0, 0, '', '', -1),
(139, 'block', '6', 'bluemasters1', 1, -15, 'home_area_3', 0, 0, '', 'Get In Touch', -1),
(140, 'block', '7', 'bluemasters1', 1, -14, 'home_area_3', 0, 0, '', '', -1),
(141, 'block', '8', 'bluemasters1', 1, -13, 'sidebar_first', 0, 0, '', 'More than Themes', -1),
(142, 'block', '9', 'bluemasters1', 0, -5, '-1', 0, 0, '', 'Choose the next theme', -1),
(143, 'comment', 'recent', 'bluemasters1', 0, -11, '-1', 0, 0, '', '', 1),
(144, 'menu', 'menu-about-us', 'bluemasters1', 1, 0, 'footer_left_1', 0, 0, '', '', -1),
(145, 'menu', 'menu-categories', 'bluemasters1', 1, -15, 'footer_left_2', 0, 0, '', '', -1),
(146, 'menu', 'menu-site-navigation', 'bluemasters1', 1, -15, 'sidebar_first', 0, 0, '', '', -1),
(147, 'system', 'main-menu', 'bluemasters1', 0, -13, '-1', 0, 0, '', '', -1),
(148, 'menu', 'secondary-menu', 'bluemasters1', 0, -11, '-1', 0, 0, '', '', -1),
(150, 'node', 'recent', 'bluemasters1', 0, -10, '-1', 0, 0, '', '', 1),
(151, 'node', 'syndicate', 'bluemasters1', 0, -8, '-1', 0, 0, '', '', -1),
(152, 'search', 'form', 'bluemasters1', 1, -11, 'search_area', 0, 0, '', '', -1),
(153, 'system', 'help', 'bluemasters1', 1, 0, 'help', 0, 0, '', '', 1),
(154, 'system', 'main', 'bluemasters1', 1, 0, 'content', 0, 0, '', '', -1),
(156, 'system', 'management', 'bluemasters1', 0, -14, '-1', 0, 0, '', '', -1),
(157, 'system', 'navigation', 'bluemasters1', 0, -13, '-1', 0, 0, '', '', -1),
(158, 'system', 'powered-by', 'bluemasters1', 0, -12, '-1', 0, 0, '', '', -1),
(159, 'system', 'user-menu', 'bluemasters1', 0, -6, '-1', 0, 0, '', '', -1),
(160, 'user', 'login', 'bluemasters1', 0, -7, '-1', 0, 0, '', '', -1),
(161, 'user', 'new', 'bluemasters1', 0, -4, '-1', 0, 0, '', '', 1),
(162, 'user', 'online', 'bluemasters1', 0, -3, '-1', 0, 0, '', '', -1),
(163, 'block', '13', 'bluemasters', 1, -12, 'sidebar_first', 0, 0, '', '', -1),
(164, 'block', '13', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(165, 'block', '13', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(166, 'block', '14', 'bluemasters', 1, 0, 'banner', 0, 0, '', '', -1),
(167, 'block', '14', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(168, 'block', '14', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(169, 'superfish', '1', 'bluemasters', 1, 0, 'navigation', 0, 0, '', '<none>', -1),
(170, 'superfish', '2', 'bluemasters', 0, -10, '-1', 0, 0, '', '', -1),
(171, 'superfish', '3', 'bluemasters', 0, -9, '-1', 0, 0, '', '', -1),
(172, 'superfish', '4', 'bluemasters', 0, -8, '-1', 0, 0, '', '', -1),
(173, 'superfish', '1', 'garland', 0, 0, '-1', 0, 0, '', '<none>', -1),
(174, 'superfish', '2', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(175, 'superfish', '3', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(176, 'superfish', '4', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(177, 'superfish', '1', 'seven', 0, 0, '-1', 0, 0, '', '<none>', -1),
(178, 'superfish', '2', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(179, 'superfish', '3', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(180, 'superfish', '4', 'seven', 0, 0, '-1', 0, 0, '', '', -1);

-- --------------------------------------------------------

--
-- Table structure for table `blocked_ips`
--

CREATE TABLE IF NOT EXISTS `blocked_ips` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique ID for IP addresses.',
  `ip` varchar(40) NOT NULL DEFAULT '' COMMENT 'IP address',
  PRIMARY KEY (`iid`),
  KEY `blocked_ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores blocked IP addresses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `block_custom`
--

CREATE TABLE IF NOT EXISTS `block_custom` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the block body.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `block_custom`
--

INSERT INTO `block_custom` (`bid`, `body`, `info`, `format`) VALUES
(1, '<img src="sites/all/themes/bluemasters/images/about-ipad-masters.png"/>\r\n<h3>All About iPad Masters</h3>\r\nLorem ipsum dolor sit amet, consect- etur adipiscing elit. Praesent tempor facilisis congue. Lorem sum dolor sit amet, consectetur adippend...\r\n<ul class="links inline">\r\n<li class="comment-add first"><a href="node/3" title="Add a new comment to this page.">Learn more</a></li>\r\n</ul>', 'about-ipad-masters', '2'),
(2, '<img src="sites/all/themes/bluemasters/images/our-blog-updates.png"/>\r\n<h3>My First Website Creation</h3>\r\n<p class="post-note">Posted in <a href="#">Web Design</a> on April 13th, 2010</p>\r\nLorem ipsum dolor sit amet, consect- etur adipiscing elit. Praesent tempor facilisis congue. Suspend...\r\n\r\n<ul class="links inline"><li class="comment-add first"><a title="Add a new comment to this page." href="comment/reply/5#comment-form">Add new comment</a></li>\r\n<li class="node-readmore last"><a title="Read the rest of The store." href="node/2">Read more</a></li>\r\n</ul>', 'our-blog-updates', '2'),
(8, '<a href="http://www.morethanthemes.com/?utm_source=bluemasters&utm_medium=sidebar-add&utm_campaign=drupalizing-demos-ads" target="_blank" style="background: url(http://static.morethanthemes.com/images/MtT_300x250_banner.jpg) no-repeat scroll center center transparent; color: transparent; display: none; height: 250px; width: 268px;  margin-left: -20px; margin-top: -20px;">More than Themes</a>\r\n<br/><br/>\r\n<a href="http://www.morethanthemes.com/?utm_source=bluemasters&utm_medium=sidebar-add&utm_campaign=drupalizing-demos-ads" target="_blank" style="background: url(http://c336802.r2.cf1.rackcdn.com/ads/ad_230x250.jpg) no-repeat scroll center center transparent; color: transparent; display: block; height: 250px; width: 268px;  margin-left: -20px; margin-top: -20px;">More than Themes</a>\r\n', 'more than themes add', '3'),
(3, '<div class="footer-gallery-block">\r\n<a href="#"><img width="44" height="41" title="" alt="" src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/gal-th-1.jpg"></a>\r\n<a href="#"><img width="44" height="41" title="" alt="" src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/gal-th-2.jpg"></a>\r\n<a href="#"><img width="44" height="41" title="" alt="" src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/gal-th-3.jpg"></a>\r\n<a href="#"><img width="44" height="41" title="" alt="" src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/gal-th-4.jpg"></a>\r\n<a href="#"><img width="44" height="41" title="" alt="" src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/gal-th-5.jpg"></a>\r\n<a href="#"><img width="44" height="41" title="" alt="" src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/gal-th-6.jpg"></a>\r\n<a href="#"><img width="44" height="41" title="" alt="" src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/gal-th-7.jpg"></a>\r\n<a href="#"><img width="44" height="41" title="" alt="" src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/gal-th-8.jpg"></a>\r\n</div>', 'from-the-gallery', '3'),
(4, '<ul class="twitter"><li class="twitter-item"> \r\nRT <a class="twitter-user" href="http://twitter.com/morethanthemes">@morethanthemes</a>: Which theme would you like to see ported to <a class="twitter-link" href="http://twitter.com/search?q=%23Drupal">#Drupal</a>? <a class="twitter-link" href="http://www.drupalizing.com">drupalizing.com</a>\r\n<span class="twitter-timestamp"><abbr title="2010/11/23 00:10:01">2010/12/23</abbr></span></li></ul>', 'twitter-updates', '3'),
(5, '<a href="#">Post</a> | <a href="#">Comments</a> | <a href="#">Email</a>', 'subscribe-to', '2'),
(6, '<div class="ico"><a href=""><img alt="icon" src="sites/all/themes/bluemasters/images/phone2.png"></a></div>\r\n<div class="detail"><h3>PHONE</h3><h4>+52  (449) 971-5712</h4></div>\r\n<div class="clear"></div>\r\n<div class="ico"><a href=""><img alt="icon" src="sites/all/themes/bluemasters/images/mail.png"></a></div>\r\n<div class="detail"><h3>EMAIL</h3><h4>rondel.axort@gmail.com</h4></div>\r\n<div class="clear"></div>\r\n<div class="ico"><a href=""><img alt="icon" src="sites/all/themes/bluemasters/images/skype.png"></a></div>\r\n<div class="detail"><h3>SKYPE</h3><h4>emeaguiar</h4></div>\r\n<div class="clear"></div>\r\n<div style="margin-bottom: 0pt;" class="ico"><a href=""><img alt="icon" src="sites/all/themes/bluemasters/images/skype.png"></a></div>\r\n<div class="detail"><h3>OTHER REQUEST</h3><h4>Try our contact form</h4></div>\r\n<div class="clear"></div>', 'get-in-touch', '2'),
(7, '<div class="ico2">\r\n<a href="http://twitter.com/morethanthemes"><img alt="icon" src="sites/all/themes/bluemasters/images/twitter2.png"></a>\r\n<a href="http://www.facebook.com/morethanthemes"><img alt="icon" src="sites/all/themes/bluemasters/images/facebook.png"></a>\r\n<a href="http://www.flickr.com/photos/56103643@N07/"><img alt="icon" src="sites/all/themes/bluemasters/images/flickr.png"></a>\r\n<a href="#"><img alt="icon" src="sites/all/themes/bluemasters/images/in.png"></a>\r\n<a href="#"><img alt="icon" src="sites/all/themes/bluemasters/images/tumblr.png"></a>\r\n<a href="http://www.youtube.com/morethanthemes"><img style="margin-right: 0pt;" alt="icon" src="sites/all/themes/bluemasters/images/youtube.png"></a>\r\n</div>', 'social-links', '3'),
(9, '<a href="http://www.drupalizing.com" target="_parent" style="background: url(http://static.morethanthemes.com/images/drupalizing_suggestion_230x250.jpg) no-repeat scroll center center transparent; color: transparent; display: block; height: 250px; width: 268px; margin-left: -20px;">More than Themes</a>', 'Which theme next', '3'),
(10, '<center><div style="font-size:120%">Coming on Drupal 7.\r\n<a href="http://eepurl.com/ch0p1" target="_blank">Sign up to get notified</a></div></center>', 'Coming on Drupal 7', '2'),
(11, '© 2010 Copyright iPadMasters Theme. All Rights Reserved.', 'Footer message', '1'),
(13, '<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FMore-than-just-themes%2F194842423863081&amp;width=292&amp;colorscheme=light&amp;show_faces=false&amp;stream=false&amp;header=false&amp;height=62" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:230px; height:62px;" allowTransparency="true"></iframe>', 'facebook-like', '3'),
(14, '<!--#slideshow-->\r\n<div id="slideshow">\r\n\r\n<div class="flexslider">\r\n<ul class="slides">\r\n\r\n<!-- slider-item -->\r\n<li class="slider-item">\r\n<div class="slider-item-image">\r\n<a href="<?php print url(''node/3''); ?>"><img src="<?php print base_path() . drupal_get_path(''theme'', ''bluemasters'') . ''/images/slide-image-3.jpg''; ?>"></a>\r\n</div>\r\n<div class="slider-item-caption">About Bluemasters</div>\r\n</li>\r\n<!-- EOF: slider-item -->\r\n\r\n<!-- slider-item -->                                                                \r\n<li class="slider-item">\r\n<div class="slider-item-image">\r\n<a href="<?php print url(''node/2''); ?>"><img src="<?php print base_path() . drupal_get_path(''theme'', ''bluemasters'') . ''/images/slide-image-2.jpg''; ?>"></a>\r\n</div>\r\n<div class="slider-item-caption">Our Portfolio</div>\r\n</li>\r\n<!-- EOF: slider-item -->\r\n\r\n<!-- slider-item -->                                \r\n<li class="slider-item">\r\n<div class="slider-item-image">\r\n<a href="<?php print url(''node/1''); ?>"><img src="<?php print base_path() . drupal_get_path(''theme'', ''bluemasters'') . ''/images/slide-image-1.jpg''; ?>"></a>\r\n</div>\r\n<div class="slider-item-caption">Creation of Beaches</div>\r\n</li>\r\n<!-- EOF: slider-item -->\r\n\r\n</ul>\r\n</div>\r\n\r\n</div>\r\n<!--EOF:#slideshow-->', 'Slideshow', '3');

-- --------------------------------------------------------

--
-- Table structure for table `block_node_type`
--

CREATE TABLE IF NOT EXISTS `block_node_type` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type from node_type.type.',
  PRIMARY KEY (`module`,`delta`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Sets up display criteria for blocks based on content types';

-- --------------------------------------------------------

--
-- Table structure for table `block_role`
--

CREATE TABLE IF NOT EXISTS `block_role` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_block`
--

CREATE TABLE IF NOT EXISTS `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_bootstrap`
--

CREATE TABLE IF NOT EXISTS `cache_bootstrap` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for data required to bootstrap Drupal, may be...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_field`
--

CREATE TABLE IF NOT EXISTS `cache_field` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_filter`
--

CREATE TABLE IF NOT EXISTS `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_form`
--

CREATE TABLE IF NOT EXISTS `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for the form system to store recently built...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_image`
--

CREATE TABLE IF NOT EXISTS `cache_image` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table used to store information about image...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_libraries`
--

CREATE TABLE IF NOT EXISTS `cache_libraries` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table to store library information.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_menu`
--

CREATE TABLE IF NOT EXISTS `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for the menu system to store router...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_page`
--

CREATE TABLE IF NOT EXISTS `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table used to store compressed pages for anonymous...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_path`
--

CREATE TABLE IF NOT EXISTS `cache_path` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table used for path alias lookups.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_update`
--

CREATE TABLE IF NOT EXISTS `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `changed` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `comment_uid` (`uid`),
  KEY `comment_nid_language` (`nid`,`language`),
  KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`),
  KEY `comment_created` (`created`),
  KEY `comment_status_pid` (`pid`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=317 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cid`, `pid`, `nid`, `uid`, `subject`, `hostname`, `changed`, `status`, `thread`, `name`, `mail`, `homepage`, `language`, `created`) VALUES
(1, 0, 5, 1, 'Before installing Drupal, please review the system requirements ', '127.0.0.1', 1300467471, 1, '01/', 'admin', '', '', 'und', 1300467471),
(2, 1, 5, 1, 'Information on version numbers can be found in the online docume', '127.0.0.1', 1300468035, 1, '01.00/', 'admin', '', '', 'und', 1300468035);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique category ID.',
  `category` varchar(255) NOT NULL DEFAULT '' COMMENT 'Category name.',
  `recipients` longtext NOT NULL COMMENT 'Comma-separated list of recipient e-mail addresses.',
  `reply` longtext NOT NULL COMMENT 'Text of the auto-reply message.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The category’s weight.',
  `selected` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether or not category is selected by default. (1 = Yes, 0 = No)',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `category` (`category`),
  KEY `list` (`weight`,`category`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contact form category settings.' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`cid`, `category`, `recipients`, `reply`, `weight`, `selected`) VALUES
(1, 'Website feedback', 'skounis@gmail.com', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `d6_upgrade_filter`
--

CREATE TABLE IF NOT EXISTS `d6_upgrade_filter` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `date_formats`
--

CREATE TABLE IF NOT EXISTS `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The date format identifier.',
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this format can be modified.',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats.' AUTO_INCREMENT=36 ;

--
-- Dumping data for table `date_formats`
--

INSERT INTO `date_formats` (`dfid`, `format`, `type`, `locked`) VALUES
(1, 'Y-m-d H:i', 'short', 1),
(2, 'm/d/Y - H:i', 'short', 1),
(3, 'd/m/Y - H:i', 'short', 1),
(4, 'Y/m/d - H:i', 'short', 1),
(5, 'd.m.Y - H:i', 'short', 1),
(6, 'm/d/Y - g:ia', 'short', 1),
(7, 'd/m/Y - g:ia', 'short', 1),
(8, 'Y/m/d - g:ia', 'short', 1),
(9, 'M j Y - H:i', 'short', 1),
(10, 'j M Y - H:i', 'short', 1),
(11, 'Y M j - H:i', 'short', 1),
(12, 'M j Y - g:ia', 'short', 1),
(13, 'j M Y - g:ia', 'short', 1),
(14, 'Y M j - g:ia', 'short', 1),
(15, 'D, Y-m-d H:i', 'medium', 1),
(16, 'D, m/d/Y - H:i', 'medium', 1),
(17, 'D, d/m/Y - H:i', 'medium', 1),
(18, 'D, Y/m/d - H:i', 'medium', 1),
(19, 'F j, Y - H:i', 'medium', 1),
(20, 'j F, Y - H:i', 'medium', 1),
(21, 'Y, F j - H:i', 'medium', 1),
(22, 'D, m/d/Y - g:ia', 'medium', 1),
(23, 'D, d/m/Y - g:ia', 'medium', 1),
(24, 'D, Y/m/d - g:ia', 'medium', 1),
(25, 'F j, Y - g:ia', 'medium', 1),
(26, 'j F Y - g:ia', 'medium', 1),
(27, 'Y, F j - g:ia', 'medium', 1),
(28, 'j. F Y - G:i', 'medium', 1),
(29, 'l, F j, Y - H:i', 'long', 1),
(30, 'l, j F, Y - H:i', 'long', 1),
(31, 'l, Y,  F j - H:i', 'long', 1),
(32, 'l, F j, Y - g:ia', 'long', 1),
(33, 'l, j F Y - g:ia', 'long', 1),
(34, 'l, Y,  F j - g:ia', 'long', 1),
(35, 'l, j. F Y - G:i', 'long', 1);

-- --------------------------------------------------------

--
-- Table structure for table `date_format_locale`
--

CREATE TABLE IF NOT EXISTS `date_format_locale` (
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `language` varchar(12) NOT NULL COMMENT 'A languages.language for this format to be used with.',
  PRIMARY KEY (`type`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats for each locale.';

-- --------------------------------------------------------

--
-- Table structure for table `date_format_type`
--

CREATE TABLE IF NOT EXISTS `date_format_type` (
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `title` varchar(255) NOT NULL COMMENT 'The human readable name of the format type.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this is a system provided format.',
  PRIMARY KEY (`type`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores configured date format types.';

--
-- Dumping data for table `date_format_type`
--

INSERT INTO `date_format_type` (`type`, `title`, `locked`) VALUES
('long', 'Long', 1),
('medium', 'Medium', 1),
('short', 'Short', 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_config`
--

CREATE TABLE IF NOT EXISTS `field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` varchar(128) NOT NULL COMMENT 'The type of this field.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the field type.',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` varchar(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the storage backend.',
  `storage_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '@TODO',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` tinyint(4) NOT NULL DEFAULT '0',
  `translatable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name` (`field_name`),
  KEY `active` (`active`),
  KEY `storage_active` (`storage_active`),
  KEY `deleted` (`deleted`),
  KEY `module` (`module`),
  KEY `storage_module` (`storage_module`),
  KEY `type` (`type`),
  KEY `storage_type` (`storage_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `field_config`
--

INSERT INTO `field_config` (`id`, `field_name`, `type`, `module`, `active`, `storage_type`, `storage_module`, `storage_active`, `locked`, `data`, `cardinality`, `translatable`, `deleted`) VALUES
(1, 'comment_body', 'text_long', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a353a7b733a31323a22656e746974795f7479706573223b613a313a7b693a303b733a373a22636f6d6d656e74223b7d733a383a2273657474696e6773223b613a303a7b7d733a31323a227472616e736c617461626c65223b623a303b733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d7d, 1, 0, 0),
(2, 'taxonomy_vocabulary_1', 'taxonomy_term_reference', 'taxonomy', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a353a7b733a383a2273657474696e6773223b613a323a7b733a383a227265717569726564223b623a303b733a31343a22616c6c6f7765645f76616c756573223b613a313a7b693a303b613a323a7b733a31303a22766f636162756c617279223b733a31323a22766f636162756c6172795f31223b733a363a22706172656e74223b693a303b7d7d7d733a31323a22656e746974795f7479706573223b613a303a7b7d733a31323a227472616e736c617461626c65223b623a303b733a373a22696e6465786573223b613a313a7b733a333a22746964223b613a313a7b693a303b733a333a22746964223b7d7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d7d, 1, 0, 0),
(3, 'taxonomy_vocabulary_2', 'taxonomy_term_reference', 'taxonomy', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a353a7b733a383a2273657474696e6773223b613a323a7b733a383a227265717569726564223b623a303b733a31343a22616c6c6f7765645f76616c756573223b613a313a7b693a303b613a323a7b733a31303a22766f636162756c617279223b733a31323a22766f636162756c6172795f32223b733a363a22706172656e74223b693a303b7d7d7d733a31323a22656e746974795f7479706573223b613a303a7b7d733a31323a227472616e736c617461626c65223b623a303b733a373a22696e6465786573223b613a313a7b733a333a22746964223b613a313a7b693a303b733a333a22746964223b7d7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d7d, -1, 0, 0),
(5, 'body', 'text_with_summary', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a353a7b733a31323a22656e746974795f7479706573223b613a313a7b693a303b733a343a226e6f6465223b7d733a31323a227472616e736c617461626c65223b623a313b733a383a2273657474696e6773223b613a303a7b7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d7d, 1, 1, 0),
(6, 'upload', 'file', 'file', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a353a7b733a31323a227472616e736c617461626c65223b623a303b733a383a2273657474696e6773223b613a343a7b733a31333a22646973706c61795f6669656c64223b693a313b733a31353a22646973706c61795f64656661756c74223b693a313b733a31303a227572695f736368656d65223b733a363a227075626c6963223b733a31323a2264656661756c745f66696c65223b693a303b7d733a31323a22656e746974795f7479706573223b613a303a7b7d733a373a22696e6465786573223b613a313a7b733a333a22666964223b613a313a7b693a303b733a333a22666964223b7d7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d7d, -1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_config_instance`
--

CREATE TABLE IF NOT EXISTS `field_config_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field instance',
  `field_id` int(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `entity_type` varchar(32) NOT NULL DEFAULT '',
  `bundle` varchar(128) NOT NULL DEFAULT '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`),
  KEY `deleted` (`deleted`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `field_config_instance`
--

INSERT INTO `field_config_instance` (`id`, `field_id`, `field_name`, `entity_type`, `bundle`, `data`, `deleted`) VALUES
(1, 1, 'comment_body', 'comment', 'comment_node_page', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a313a7b733a31353a22746578745f70726f63657373696e67223b693a313b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(2, 1, 'comment_body', 'comment', 'comment_node_story', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a313a7b733a31353a22746578745f70726f63657373696e67223b693a313b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(3, 2, 'taxonomy_vocabulary_1', 'node', 'story', 0x613a363a7b733a353a226c6162656c223b733a31303a2243617465676f72696573223b733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a31313a226465736372697074696f6e223b733a303a22223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a363a2273656c656374223b733a363a226d6f64756c65223b4e3b733a383a2273657474696e6773223b613a303a7b7d733a363a22776569676874223b733a313a2230223b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d7d733a383a227265717569726564223b623a303b7d, 0),
(4, 3, 'taxonomy_vocabulary_2', 'node', 'story', 0x613a363a7b733a353a226c6162656c223b733a343a2254616773223b733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a31313a226465736372697074696f6e223b733a303a22223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32313a227461786f6e6f6d795f6175746f636f6d706c657465223b733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b733a383a2273657474696e6773223b613a323a7b733a343a2273697a65223b693a36303b733a31373a226175746f636f6d706c6574655f70617468223b733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b7d733a363a22776569676874223b733a313a2230223b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d7d733a383a227265717569726564223b623a303b7d, 0),
(7, 5, 'body', 'node', 'page', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b733a323a222d34223b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a313b7d733a363a22746561736572223b613a363a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a31313a227472696d5f6c656e677468223b693a3630303b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a313b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(8, 5, 'body', 'node', 'story', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b733a323a222d34223b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(9, 6, 'upload', 'node', 'page', 0x613a363a7b733a353a226c6162656c223b733a31363a2246696c65206174746163686d656e7473223b733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a363a22776964676574223b613a343a7b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a313a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b7d733a343a2274797065223b733a31323a2266696c655f67656e65726963223b733a363a226d6f64756c65223b733a343a2266696c65223b7d733a383a2273657474696e6773223b613a353a7b733a31323a226d61785f66696c6573697a65223b733a343a2231204d42223b733a31353a2266696c655f657874656e73696f6e73223b733a35323a226a7067206a7065672067696620706e672074787420646f6320786c73207064662070707420707073206f6474206f6473206f6470223b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31373a226465736372697074696f6e5f6669656c64223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a343a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31303a2266696c655f7461626c65223b733a383a2273657474696e6773223b613a303a7b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2266696c65223b7d733a343a2266756c6c223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31303a2266696c655f7461626c65223b733a383a2273657474696e6773223b613a303a7b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2266696c65223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a363a2268696464656e223b733a383a2273657474696e6773223b613a303a7b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b4e3b7d733a333a22727373223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31303a2266696c655f7461626c65223b733a383a2273657474696e6773223b613a303a7b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2266696c65223b7d7d7d, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_body`
--

CREATE TABLE IF NOT EXISTS `field_data_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 5 (body)';

--
-- Dumping data for table `field_data_body`
--

INSERT INTO `field_data_body` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `body_value`, `body_summary`, `body_format`) VALUES
('node', 'page', 0, 1, 1, 'und', 0, ' <h1>This is a Heading 1</h1>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2>This is a Heading 2</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2><a href="#">This is a linked Heading 2 title class</a></h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h3>This is a Heading 3</h3>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h4>This is a Heading 4</h4>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\nA normal paragraph of text with in-line links. Lorem ipsum dosectetur adipisicing elit, sed do. Lorem ipsum dolor sit amet, <a href="#">this is a link</a> elit. labolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Lorem ipsum dosectetur adipisicing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do <a href="#">eiusmod tempor incididunt</a> ut labolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do.\r\n\r\n<blockquote>Quoted text dosectetur adipisicing elit, sed do.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do.Lorem ipsum dolor sit amet, consectetur adipisicing.</blockquote>\r\n\r\n<h2>Ordered List</h2>\r\n<ol>\r\n<li>This is a sample <strong>Ordered List</strong>.</li>\r\n\r\n<li>Lorem ipsum dolor sit amet consectetuer.</li>\r\n<li>Condimentum quis.</li>\r\n<li>Congue Quisque augue elit dolor.\r\n<ol>\r\n<li>Something goes here.</li>\r\n<li>And another here</li>\r\n<li>Then one more</li>\r\n</ol>\r\n</li>\r\n<li>Congue Quisque augue elit dolor nibh.</li>\r\n</ol>\r\n\r\n<h2>Unordered List</h2>\r\n<ul>\r\n<li>This is a sample <strong>Unordered List</strong>.</li>\r\n<li>Condimentum quis.</li>\r\n<li>Congue Quisque augue elit dolor.\r\n<ul>\r\n<li>Something goes here.</li>\r\n<li>And another here\r\n<ul>\r\n<li>Something here as well</li>\r\n\r\n<li>Something here as well</li>\r\n<li>Something here as well</li>\r\n</ul>\r\n</li>\r\n<li>Then one more</li>\r\n</ul>\r\n</li>\r\n<li>Nunc cursus sem et pretium sapien eget.</li>\r\n</ul>\r\n\r\n<code>#header h1 a {<br />\r\ndisplay: block;<br />\r\nheight: 80px;<br />\r\nwidth: 300px;<br />\r\n}</code>\r\n\r\n<div class="messages status">Sample status message. Page <strong>Typography</strong> has been updated.</div>\r\n<div class="messages error">Sample error message. There is a security update available for your version of Drupal. To ensure the security of your server, you should update immediately! See the available updates page for more information.</div>\r\n<div class="messages warning">Sample warning message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>\r\n\r\n<fieldset> <legend>Account information</legend> </fieldset>\r\n\r\n<table border="1">\r\n\r\n<tr>\r\n<th>Header 1</th>\r\n<th>Header 2</th>\r\n</tr>\r\n\r\n<tr class="odd">\r\n<td>row 1, cell 1</td>\r\n<td>row 1, cell 2</td>\r\n</tr>\r\n\r\n<tr class="even">\r\n<td>row 2, cell 1</td>\r\n<td>row 2, cell 2</td>\r\n</tr>\r\n\r\n<tr class="odd">\r\n<td>row 3, cell 1</td>\r\n<td>row 3, cell 2</td>\r\n</tr>\r\n\r\n</table> ', ' <h1>This is a Heading 1</h1>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2>This is a Heading 2</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2><a href="#">This is a linked Heading 2 title class</a></h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h3>This is a Heading 3</h3>\r\n', '2'),
('node', 'story', 0, 2, 2, 'und', 0, '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/story-creationofbeaches.jpg"/>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti...</p>\r\n<!--break-->\r\n<blockquote>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arc \r\nporttitentum dealiquet. Ut risus nisi, scelerisque in convallis et, volutpat ada elit."</blockquote>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>', '', '3'),
('node', 'page', 0, 3, 3, 'und', 0, '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/page-aboutipadmasters.jpg"/>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>\r\n\r\n<p>Mauris et risus nulla, at venenatis turpis. Duis egestas, elit eu imperdiet rhoncus, nulla mi tem\r\npor dui, eu dignissim odio mi vitae quam. Ut at tempus diam. Quisque accumsan ullamcorper \r\nnisl, ut mollis orci suscipit in. Phasellus sagittis interdum nunc, ultrices rhoncus est accumsan \r\nid. Sed blandit cursus sapien. Phasellus lacus arcu, consequat non egestas eu, vestibulum eu \r\nturpis. Nunc ut tortor sed felis auctor tincidunt sed at arcu.</p>\r\n\r\n<blockquote>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arc \r\nporttitentum dealiquet. Ut risus nisi, scelerisque in convallis et, volutpat ada elit."</blockquote>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula. Lorem ipsum dolor sit amet, consectetur \r\nadipiscing elit. Nullam et risus non arcu porttitor feugi.</p>', '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/page-aboutipadmasters.jpg"/>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\n', '3'),
('node', 'story', 0, 4, 4, 'und', 0, '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/story-brazilianvacations.jpg"/>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti...</p>\r\n<!--break-->\r\n<blockquote>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arc \r\nporttitentum dealiquet. Ut risus nisi, scelerisque in convallis et, volutpat ada elit."</blockquote>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>', '', '3'),
('node', 'story', 0, 5, 5, 'und', 0, '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/story-jamaicasecrets.jpg"/>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti...</p>\r\n<!--break-->\r\n<blockquote>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arc \r\nporttitentum dealiquet. Ut risus nisi, scelerisque in convallis et, volutpat ada elit."</blockquote>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>', '', '3'),
('node', 'page', 0, 6, 6, 'und', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum vehicula nisi ac vehic\r\nula. Fusce malesuada est id enim dignissim mattis. Phasellus id tellus nunc, in vehicula nisi. \r\nFusce pellentesque, augue adipiscing sagittis tincidunt, mi magna sodales dolor, vitae ornare \r\nipsum nunc et augue. Nulla sapien enim, rutrum sed pretium at, euismod sed augue. Vestibul\r\num quis nibh nisl, facilisis adipiscing massa. Aliquam erat volutpat.\r\n<form method="post" id="contact_form" action="#">\r\n<p>\r\n<label for="contactName">* Your Name:</label>\r\n<input type="text" class="requiredField" value="" id="contactName" name="contactName">\r\n</p>\r\n\r\n<p>\r\n<label for="email">* Email Adress:</label>\r\n<input type="text" class="requiredField email" value="" id="email" name="email">\r\n</p>\r\n\r\n<p>\r\n<label for="subject">* Subject:</label>\r\n<input type="text" class="requiredField mySubject" value="" id="mySubject" name="mySubject">\r\n</p>\r\n\r\n<p class="textarea clear">\r\n<label for="commentsText">* Your Message:</label>\r\n<textarea class="requiredField" cols="30" rows="20" id="commentsText" name="comments">						</textarea>\r\n</p>\r\n\r\n<p class="buttons right">\r\n<input type="hidden" value="true" id="submitted" name="submitted">\r\n<button type="submit">Send Message</button>\r\n</p>\r\n</form>', '', '2'),
('node', 'page', 0, 7, 7, 'und', 0, 'A simple page to carry some resources (images) as attachments ', NULL, '1'),
('node', 'page', 0, 8, 8, 'und', 0, 'Hello', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `field_data_comment_body`
--

CREATE TABLE IF NOT EXISTS `field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 1 (comment_body)';

--
-- Dumping data for table `field_data_comment_body`
--

INSERT INTO `field_data_comment_body` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `comment_body_value`, `comment_body_format`) VALUES
('comment', 'comment_node_story', 0, 1, 1, 'und', 0, 'Get started by downloading the official Drupal core files. These official releases come bundled with a variety of modules and themes to give you a good starting point to help build your site. Drupal core includes basic community features like blogging, forums, and contact forms, and can be easily extended by downloading other contributed modules and themes.', '1'),
('comment', 'comment_node_story', 0, 2, 2, 'und', 0, 'If you are using Internet Explorer and WinZip, save the file first, as otherwise IE will corrupt the file''s extension.', '1');

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_image`
--

CREATE TABLE IF NOT EXISTS `field_data_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(128) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(128) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 4 (field_image)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_tags`
--

CREATE TABLE IF NOT EXISTS `field_data_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 3 (field_tags)';

--
-- Dumping data for table `field_data_field_tags`
--

INSERT INTO `field_data_field_tags` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_tags_tid`) VALUES
('node', 'article', 0, 4, 4, 'und', 0, 1),
('node', 'article', 0, 4, 4, 'und', 1, 2),
('node', 'article', 0, 5, 5, 'und', 0, 1),
('node', 'article', 0, 5, 5, 'und', 1, 3),
('node', 'article', 0, 6, 6, 'und', 0, 1),
('node', 'article', 0, 6, 6, 'und', 1, 4),
('node', 'article', 0, 6, 6, 'und', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_taxonomy_vocabulary_1`
--

CREATE TABLE IF NOT EXISTS `field_data_taxonomy_vocabulary_1` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `taxonomy_vocabulary_1_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `taxonomy_vocabulary_1_tid` (`taxonomy_vocabulary_1_tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 2 (taxonomy_vocabulary_1)';

--
-- Dumping data for table `field_data_taxonomy_vocabulary_1`
--

INSERT INTO `field_data_taxonomy_vocabulary_1` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `taxonomy_vocabulary_1_tid`) VALUES
('node', 'story', 0, 2, 2, 'und', 0, 1),
('node', 'story', 0, 4, 4, 'und', 0, 1),
('node', 'story', 0, 5, 5, 'und', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_taxonomy_vocabulary_2`
--

CREATE TABLE IF NOT EXISTS `field_data_taxonomy_vocabulary_2` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `taxonomy_vocabulary_2_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `taxonomy_vocabulary_2_tid` (`taxonomy_vocabulary_2_tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 3 (taxonomy_vocabulary_2)';

--
-- Dumping data for table `field_data_taxonomy_vocabulary_2`
--

INSERT INTO `field_data_taxonomy_vocabulary_2` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `taxonomy_vocabulary_2_tid`) VALUES
('node', 'story', 0, 2, 2, 'und', 0, 2),
('node', 'story', 0, 2, 2, 'und', 1, 3),
('node', 'story', 0, 2, 2, 'und', 2, 4),
('node', 'story', 0, 2, 2, 'und', 3, 5),
('node', 'story', 0, 4, 4, 'und', 0, 2),
('node', 'story', 0, 4, 4, 'und', 1, 3),
('node', 'story', 0, 4, 4, 'und', 2, 4),
('node', 'story', 0, 4, 4, 'und', 3, 5),
('node', 'story', 0, 5, 5, 'und', 0, 2),
('node', 'story', 0, 5, 5, 'und', 1, 3),
('node', 'story', 0, 5, 5, 'und', 2, 4),
('node', 'story', 0, 5, 5, 'und', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_upload`
--

CREATE TABLE IF NOT EXISTS `field_data_upload` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `upload_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `upload_display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `upload_description` text COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `upload_fid` (`upload_fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 6 (upload)';

--
-- Dumping data for table `field_data_upload`
--

INSERT INTO `field_data_upload` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `upload_fid`, `upload_display`, `upload_description`) VALUES
('node', 'page', 0, 7, 7, 'und', 0, 1, 1, 'MtT_300x250_banner.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_body`
--

CREATE TABLE IF NOT EXISTS `field_revision_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 5 (body)';

--
-- Dumping data for table `field_revision_body`
--

INSERT INTO `field_revision_body` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `body_value`, `body_summary`, `body_format`) VALUES
('node', 'page', 0, 1, 1, 'und', 0, ' <h1>This is a Heading 1</h1>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2>This is a Heading 2</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2><a href="#">This is a linked Heading 2 title class</a></h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h3>This is a Heading 3</h3>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h4>This is a Heading 4</h4>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\nA normal paragraph of text with in-line links. Lorem ipsum dosectetur adipisicing elit, sed do. Lorem ipsum dolor sit amet, <a href="#">this is a link</a> elit. labolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Lorem ipsum dosectetur adipisicing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do <a href="#">eiusmod tempor incididunt</a> ut labolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do.\r\n\r\n<blockquote>Quoted text dosectetur adipisicing elit, sed do.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do.Lorem ipsum dolor sit amet, consectetur adipisicing.</blockquote>\r\n\r\n<h2>Ordered List</h2>\r\n<ol>\r\n<li>This is a sample <strong>Ordered List</strong>.</li>\r\n\r\n<li>Lorem ipsum dolor sit amet consectetuer.</li>\r\n<li>Condimentum quis.</li>\r\n<li>Congue Quisque augue elit dolor.\r\n<ol>\r\n<li>Something goes here.</li>\r\n<li>And another here</li>\r\n<li>Then one more</li>\r\n</ol>\r\n</li>\r\n<li>Congue Quisque augue elit dolor nibh.</li>\r\n</ol>\r\n\r\n<h2>Unordered List</h2>\r\n<ul>\r\n<li>This is a sample <strong>Unordered List</strong>.</li>\r\n<li>Condimentum quis.</li>\r\n<li>Congue Quisque augue elit dolor.\r\n<ul>\r\n<li>Something goes here.</li>\r\n<li>And another here\r\n<ul>\r\n<li>Something here as well</li>\r\n\r\n<li>Something here as well</li>\r\n<li>Something here as well</li>\r\n</ul>\r\n</li>\r\n<li>Then one more</li>\r\n</ul>\r\n</li>\r\n<li>Nunc cursus sem et pretium sapien eget.</li>\r\n</ul>\r\n\r\n<code>#header h1 a {<br />\r\ndisplay: block;<br />\r\nheight: 80px;<br />\r\nwidth: 300px;<br />\r\n}</code>\r\n\r\n<div class="messages status">Sample status message. Page <strong>Typography</strong> has been updated.</div>\r\n<div class="messages error">Sample error message. There is a security update available for your version of Drupal. To ensure the security of your server, you should update immediately! See the available updates page for more information.</div>\r\n<div class="messages warning">Sample warning message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>\r\n\r\n<fieldset> <legend>Account information</legend> </fieldset>\r\n\r\n<table border="1">\r\n\r\n<tr>\r\n<th>Header 1</th>\r\n<th>Header 2</th>\r\n</tr>\r\n\r\n<tr class="odd">\r\n<td>row 1, cell 1</td>\r\n<td>row 1, cell 2</td>\r\n</tr>\r\n\r\n<tr class="even">\r\n<td>row 2, cell 1</td>\r\n<td>row 2, cell 2</td>\r\n</tr>\r\n\r\n<tr class="odd">\r\n<td>row 3, cell 1</td>\r\n<td>row 3, cell 2</td>\r\n</tr>\r\n\r\n</table> ', ' <h1>This is a Heading 1</h1>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2>This is a Heading 2</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2><a href="#">This is a linked Heading 2 title class</a></h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h3>This is a Heading 3</h3>\r\n', '2'),
('node', 'story', 0, 2, 2, 'und', 0, '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/story-creationofbeaches.jpg"/>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti...</p>\r\n<!--break-->\r\n<blockquote>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arc \r\nporttitentum dealiquet. Ut risus nisi, scelerisque in convallis et, volutpat ada elit."</blockquote>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>', '', '3'),
('node', 'page', 0, 3, 3, 'und', 0, '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/page-aboutipadmasters.jpg"/>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>\r\n\r\n<p>Mauris et risus nulla, at venenatis turpis. Duis egestas, elit eu imperdiet rhoncus, nulla mi tem\r\npor dui, eu dignissim odio mi vitae quam. Ut at tempus diam. Quisque accumsan ullamcorper \r\nnisl, ut mollis orci suscipit in. Phasellus sagittis interdum nunc, ultrices rhoncus est accumsan \r\nid. Sed blandit cursus sapien. Phasellus lacus arcu, consequat non egestas eu, vestibulum eu \r\nturpis. Nunc ut tortor sed felis auctor tincidunt sed at arcu.</p>\r\n\r\n<blockquote>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arc \r\nporttitentum dealiquet. Ut risus nisi, scelerisque in convallis et, volutpat ada elit."</blockquote>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula. Lorem ipsum dolor sit amet, consectetur \r\nadipiscing elit. Nullam et risus non arcu porttitor feugi.</p>', '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/page-aboutipadmasters.jpg"/>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\n', '3'),
('node', 'story', 0, 4, 4, 'und', 0, '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/story-brazilianvacations.jpg"/>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti...</p>\r\n<!--break-->\r\n<blockquote>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arc \r\nporttitentum dealiquet. Ut risus nisi, scelerisque in convallis et, volutpat ada elit."</blockquote>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>', '', '3'),
('node', 'story', 0, 5, 5, 'und', 0, '<img src="<?php print base_path(); ?>sites/all/themes/bluemasters/images/story-jamaicasecrets.jpg"/>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti...</p>\r\n<!--break-->\r\n<blockquote>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arc \r\nporttitentum dealiquet. Ut risus nisi, scelerisque in convallis et, volutpat ada elit."</blockquote>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et risus non arcu porttitor feugi\r\nat in at neque. In hac habitasse platea dictumst. Proin pretium neque at turpis fermentum de\r\naliquet. Ut risus nisi, scelerisque in convallis et, volutpat malesuada elit. Ut nulla libero, condi\r\nentum eget scelerisque eget, blandit sit amet metus. Suspendisse potenti. Nulla luctus temus \r\naugue dictum cursus. Curabitur non risus dui. In sit amet tellus in lacus fringilla condimentuma\r\nt sit amet libero. Fusce purus ligula, hendrerit ut vulputate eget, vestibulum non diam. Vestib\r\nulum facilisis, leo id volutpat vestibulum, eros ligula ornare urna, pellentesque laoreet magna \r\npurus ac metus. Nulla facilisi.</p>', '', '3'),
('node', 'page', 0, 6, 6, 'und', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum vehicula nisi ac vehic\r\nula. Fusce malesuada est id enim dignissim mattis. Phasellus id tellus nunc, in vehicula nisi. \r\nFusce pellentesque, augue adipiscing sagittis tincidunt, mi magna sodales dolor, vitae ornare \r\nipsum nunc et augue. Nulla sapien enim, rutrum sed pretium at, euismod sed augue. Vestibul\r\num quis nibh nisl, facilisis adipiscing massa. Aliquam erat volutpat.\r\n<form method="post" id="contact_form" action="#">\r\n<p>\r\n<label for="contactName">* Your Name:</label>\r\n<input type="text" class="requiredField" value="" id="contactName" name="contactName">\r\n</p>\r\n\r\n<p>\r\n<label for="email">* Email Adress:</label>\r\n<input type="text" class="requiredField email" value="" id="email" name="email">\r\n</p>\r\n\r\n<p>\r\n<label for="subject">* Subject:</label>\r\n<input type="text" class="requiredField mySubject" value="" id="mySubject" name="mySubject">\r\n</p>\r\n\r\n<p class="textarea clear">\r\n<label for="commentsText">* Your Message:</label>\r\n<textarea class="requiredField" cols="30" rows="20" id="commentsText" name="comments">						</textarea>\r\n</p>\r\n\r\n<p class="buttons right">\r\n<input type="hidden" value="true" id="submitted" name="submitted">\r\n<button type="submit">Send Message</button>\r\n</p>\r\n</form>', '', '2'),
('node', 'page', 0, 7, 7, 'und', 0, 'A simple page to carry some resources (images) as attachments ', NULL, '1'),
('node', 'page', 0, 8, 8, 'und', 0, 'Hello', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_comment_body`
--

CREATE TABLE IF NOT EXISTS `field_revision_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 1 (comment_body)';

--
-- Dumping data for table `field_revision_comment_body`
--

INSERT INTO `field_revision_comment_body` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `comment_body_value`, `comment_body_format`) VALUES
('comment', 'comment_node_story', 0, 1, 1, 'und', 0, 'Get started by downloading the official Drupal core files. These official releases come bundled with a variety of modules and themes to give you a good starting point to help build your site. Drupal core includes basic community features like blogging, forums, and contact forms, and can be easily extended by downloading other contributed modules and themes.', '1'),
('comment', 'comment_node_story', 0, 2, 2, 'und', 0, 'If you are using Internet Explorer and WinZip, save the file first, as otherwise IE will corrupt the file''s extension.', '1');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_image`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(128) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(128) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 4 (field_image)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_tags`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 3 (field_tags)';

--
-- Dumping data for table `field_revision_field_tags`
--

INSERT INTO `field_revision_field_tags` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_tags_tid`) VALUES
('node', 'article', 0, 4, 4, 'und', 0, 1),
('node', 'article', 0, 4, 4, 'und', 1, 2),
('node', 'article', 0, 5, 5, 'und', 0, 1),
('node', 'article', 0, 5, 5, 'und', 1, 3),
('node', 'article', 0, 6, 6, 'und', 0, 1),
('node', 'article', 0, 6, 6, 'und', 1, 4),
('node', 'article', 0, 6, 6, 'und', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_taxonomy_vocabulary_1`
--

CREATE TABLE IF NOT EXISTS `field_revision_taxonomy_vocabulary_1` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `taxonomy_vocabulary_1_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `taxonomy_vocabulary_1_tid` (`taxonomy_vocabulary_1_tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 2 (taxonomy_vocabulary_1)';

--
-- Dumping data for table `field_revision_taxonomy_vocabulary_1`
--

INSERT INTO `field_revision_taxonomy_vocabulary_1` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `taxonomy_vocabulary_1_tid`) VALUES
('node', 'story', 0, 2, 2, 'und', 0, 1),
('node', 'story', 0, 4, 4, 'und', 0, 1),
('node', 'story', 0, 5, 5, 'und', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_taxonomy_vocabulary_2`
--

CREATE TABLE IF NOT EXISTS `field_revision_taxonomy_vocabulary_2` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `taxonomy_vocabulary_2_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `taxonomy_vocabulary_2_tid` (`taxonomy_vocabulary_2_tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 3 (taxonomy_vocabulary_2)';

--
-- Dumping data for table `field_revision_taxonomy_vocabulary_2`
--

INSERT INTO `field_revision_taxonomy_vocabulary_2` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `taxonomy_vocabulary_2_tid`) VALUES
('node', 'story', 0, 2, 2, 'und', 0, 2),
('node', 'story', 0, 2, 2, 'und', 1, 3),
('node', 'story', 0, 2, 2, 'und', 2, 4),
('node', 'story', 0, 2, 2, 'und', 3, 5),
('node', 'story', 0, 4, 4, 'und', 0, 2),
('node', 'story', 0, 4, 4, 'und', 1, 3),
('node', 'story', 0, 4, 4, 'und', 2, 4),
('node', 'story', 0, 4, 4, 'und', 3, 5),
('node', 'story', 0, 5, 5, 'und', 0, 2),
('node', 'story', 0, 5, 5, 'und', 1, 3),
('node', 'story', 0, 5, 5, 'und', 2, 4),
('node', 'story', 0, 5, 5, 'und', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_upload`
--

CREATE TABLE IF NOT EXISTS `field_revision_upload` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `upload_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `upload_display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `upload_description` text COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `upload_fid` (`upload_fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 6 (upload)';

--
-- Dumping data for table `field_revision_upload`
--

INSERT INTO `field_revision_upload` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `upload_fid`, `upload_display`, `upload_description`) VALUES
('node', 'page', 0, 7, 7, 'und', 0, 1, 1, 'MtT_300x250_banner.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`fid`, `uid`, `filename`, `filepath`, `filemime`, `filesize`, `status`, `timestamp`) VALUES
(1, 1, 'MtT_300x250_banner.jpg', 'sites/default/files/MtT_300x250_banner.jpg', 'image/jpeg', 16284, 1, 1294092129);

-- --------------------------------------------------------

--
-- Table structure for table `file_managed`
--

CREATE TABLE IF NOT EXISTS `file_managed` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'File ID.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The user.uid of the user who is associated with the file.',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `uri` (`uri`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores information for uploaded files.' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `file_managed`
--

INSERT INTO `file_managed` (`fid`, `uid`, `filename`, `uri`, `filemime`, `filesize`, `status`, `timestamp`) VALUES
(1, 1, 'MtT_300x250_banner.jpg', 'public://MtT_300x250_banner.jpg', 'image/jpeg', 16284, 1, 1294092129);

-- --------------------------------------------------------

--
-- Table structure for table `file_usage`
--

CREATE TABLE IF NOT EXISTS `file_usage` (
  `fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.',
  PRIMARY KEY (`fid`,`type`,`id`,`module`),
  KEY `type_id` (`type`,`id`),
  KEY `fid_count` (`fid`,`count`),
  KEY `fid_module` (`fid`,`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Track where a file is used.';

--
-- Dumping data for table `file_usage`
--

INSERT INTO `file_usage` (`fid`, `module`, `type`, `id`, `count`) VALUES
(1, 'file', 'node', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE IF NOT EXISTS `filter` (
  `format` varchar(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The origin module of the filter.',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Name of the filter being referenced.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of filter within format.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.',
  PRIMARY KEY (`format`,`name`),
  KEY `list` (`weight`,`module`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Table that maps filters (HTML corrector) to text formats ...';

--
-- Dumping data for table `filter`
--

INSERT INTO `filter` (`format`, `module`, `name`, `weight`, `status`, `settings`) VALUES
('1', 'filter', 'filter_autop', 2, 1, 0x613a303a7b7d),
('1', 'filter', 'filter_html', 1, 1, 0x613a303a7b7d),
('1', 'filter', 'filter_htmlcorrector', 10, 1, 0x613a303a7b7d),
('1', 'filter', 'filter_url', 0, 1, 0x613a303a7b7d),
('2', 'filter', 'filter_autop', 1, 1, 0x613a303a7b7d),
('2', 'filter', 'filter_htmlcorrector', 10, 1, 0x613a303a7b7d),
('2', 'filter', 'filter_url', 0, 1, 0x613a303a7b7d),
('3', 'php', 'php_code', 0, 1, 0x613a303a7b7d),
('4', 'filter', 'filter_autop', 2, 1, 0x613a303a7b7d),
('4', 'filter', 'filter_html_escape', 0, 1, 0x613a303a7b7d),
('4', 'filter', 'filter_url', 1, 1, 0x613a303a7b7d);

-- --------------------------------------------------------

--
-- Table structure for table `filter_format`
--

CREATE TABLE IF NOT EXISTS `filter_format` (
  `format` varchar(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of text format to use when listing.',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`),
  KEY `status_weight` (`status`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_format`
--

INSERT INTO `filter_format` (`format`, `name`, `cache`, `status`, `weight`) VALUES
('1', 'Filtered HTML', 1, 1, -1),
('2', 'Full HTML', 1, 1, 0),
('3', 'PHP code', 0, 1, 0),
('4', 'Plain text', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flood`
--

CREATE TABLE IF NOT EXISTS `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) NOT NULL DEFAULT '',
  `identifier` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `expiration` int(11) NOT NULL DEFAULT '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`identifier`,`timestamp`),
  KEY `purge` (`expiration`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=341 ;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`uid`, `nid`, `timestamp`) VALUES
(1, 3, 1363363163),
(1, 2, 1363363150),
(1, 4, 1363363195),
(1, 5, 1363363185),
(1, 1, 1363359698);

-- --------------------------------------------------------

--
-- Table structure for table `image_effects`
--

CREATE TABLE IF NOT EXISTS `image_effects` (
  `ieid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image effect.',
  `isid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the effect in the style.',
  `name` varchar(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the effect.',
  PRIMARY KEY (`ieid`),
  KEY `isid` (`isid`),
  KEY `weight` (`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image effects.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `image_styles`
--

CREATE TABLE IF NOT EXISTS `image_styles` (
  `isid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image style.',
  `name` varchar(255) NOT NULL COMMENT 'The style name.',
  PRIMARY KEY (`isid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image styles.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_custom`
--

CREATE TABLE IF NOT EXISTS `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_custom`
--

INSERT INTO `menu_custom` (`menu_name`, `title`, `description`) VALUES
('navigation', 'Navigation', 'The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),
('main-menu', 'Primary links', 'Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),
('secondary-menu', 'Secondary Menu', NULL),
('menu-about-us', 'About Us', ''),
('menu-categories', 'Categories', ''),
('menu-site-navigation', 'Site Navigation', ''),
('user-menu', 'User Menu', 'The <em>User</em> menu contains links related to the user''s account, as well as the ''Log out'' link.'),
('management', 'Management', 'The <em>Management</em> menu contains links for administrative tasks.');

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plid` int(10) unsigned NOT NULL DEFAULT '0',
  `link_path` varchar(255) NOT NULL DEFAULT '',
  `router_path` varchar(255) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `options` blob COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` varchar(255) NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(10) unsigned NOT NULL DEFAULT '0',
  `p2` int(10) unsigned NOT NULL DEFAULT '0',
  `p3` int(10) unsigned NOT NULL DEFAULT '0',
  `p4` int(10) unsigned NOT NULL DEFAULT '0',
  `p5` int(10) unsigned NOT NULL DEFAULT '0',
  `p6` int(10) unsigned NOT NULL DEFAULT '0',
  `p7` int(10) unsigned NOT NULL DEFAULT '0',
  `p8` int(10) unsigned NOT NULL DEFAULT '0',
  `p9` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=540 ;

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('management', 2, 0, 'admin', 'admin', 'Administration', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 9, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 168, 0, 'user', 'user', 'User account', 0x613a313a7b733a353a22616c746572223b623a313b7d, 'system', 0, 0, 0, 0, -10, 1, 0, 168, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 4, 0, 'user/logout', 'user/logout', 'Log out', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 10, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 218, 172, 'admin/config/user-interface', 'admin/config/user-interface', 'User interface', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33383a22546f6f6c73207468617420656e68616e636520746865207573657220696e746572666163652e223b7d7d, 'system', 0, 0, 1, 0, -15, 3, 0, 2, 172, 218, 0, 0, 0, 0, 0, 0, 0),
('management', 217, 171, 'admin/appearance/update', 'admin/appearance/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 3, 0, 2, 171, 217, 0, 0, 0, 0, 0, 0, 0),
('navigation', 9, 0, 'filter/tips', 'filter/tips', 'Compose tips', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 10, 2, 'admin/content', 'admin/content', 'Content', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33323a2241646d696e697374657220636f6e74656e7420616e6420636f6d6d656e74732e223b7d7d, 'system', 0, 0, 1, 0, -10, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 11, 0, 'node/add', 'node/add', 'Add content', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 216, 177, 'admin/modules/update', 'admin/modules/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 3, 0, 2, 177, 216, 0, 0, 0, 0, 0, 0, 0),
('management', 15, 2, 'admin/help', 'admin/help', 'Help', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a225265666572656e636520666f722075736167652c20636f6e66696775726174696f6e2c20616e64206d6f64756c65732e223b7d7d, 'system', 0, 0, 0, 0, 9, 2, 0, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 16, 2, 'admin/reports', 'admin/reports', 'Reports', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a2256696577207265706f7274732c20757064617465732c20616e64206572726f72732e223b7d7d, 'system', 0, 0, 1, 0, 5, 2, 0, 2, 16, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 507, 493, 'admin/config/people/accounts/fields/%/field-settings', 'admin/config/people/accounts/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 172, 205, 250, 485, 493, 507, 0, 0, 0),
('management', 215, 177, 'admin/modules/install', 'admin/modules/install', 'Install new module', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 3, 0, 2, 177, 215, 0, 0, 0, 0, 0, 0, 0),
('management', 508, 493, 'admin/config/people/accounts/fields/%/widget-type', 'admin/config/people/accounts/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 172, 205, 250, 485, 493, 508, 0, 0, 0),
('navigation', 21, 0, 'user/%', 'user/%', 'My account', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 518, 511, 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 194, 312, 361, 511, 518, 0, 0, 0),
('management', 27, 10, 'admin/content/comment', 'admin/content/comment', 'Comments', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35393a224c69737420616e642065646974207369746520636f6d6d656e747320616e642074686520636f6d6d656e7420617070726f76616c2071756575652e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 27, 0, 0, 0, 0, 0, 0, 0),
('management', 28, 10, 'admin/content/node', 'admin/content/node', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 3, 0, 2, 10, 28, 0, 0, 0, 0, 0, 0, 0),
('management', 193, 172, 'admin/config/content', 'admin/config/content', 'Content authoring', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35333a2253657474696e67732072656c6174656420746f20666f726d617474696e6720616e6420617574686f72696e6720636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, -15, 3, 0, 2, 172, 193, 0, 0, 0, 0, 0, 0, 0),
('management', 519, 511, 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 194, 312, 361, 511, 519, 0, 0, 0),
('management', 510, 360, 'admin/structure/types/manage/%/comment/display/full', 'admin/structure/types/manage/%/comment/display/full', 'Full comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 2, 180, 194, 312, 360, 510, 0, 0, 0, 0),
('management', 214, 177, 'admin/modules/uninstall', 'admin/modules/uninstall', 'Uninstall', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 20, 3, 0, 2, 177, 214, 0, 0, 0, 0, 0, 0, 0),
('management', 517, 511, 'admin/structure/types/manage/%/comment/fields/%/edit', 'admin/structure/types/manage/%/comment/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 194, 312, 361, 511, 517, 0, 0, 0),
('management', 516, 511, 'admin/structure/types/manage/%/comment/fields/%/delete', 'admin/structure/types/manage/%/comment/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 2, 180, 194, 312, 361, 511, 516, 0, 0, 0),
('management', 514, 500, 'admin/structure/types/manage/%/fields/%/field-settings', 'admin/structure/types/manage/%/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 194, 312, 489, 500, 514, 0, 0, 0),
('management', 515, 500, 'admin/structure/types/manage/%/fields/%/widget-type', 'admin/structure/types/manage/%/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 194, 312, 489, 500, 515, 0, 0, 0),
('management', 506, 493, 'admin/config/people/accounts/fields/%/edit', 'admin/config/people/accounts/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 172, 205, 250, 485, 493, 506, 0, 0, 0),
('management', 505, 493, 'admin/config/people/accounts/fields/%/delete', 'admin/config/people/accounts/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 2, 172, 205, 250, 485, 493, 505, 0, 0, 0),
('management', 499, 488, 'admin/structure/types/manage/%/display/teaser', 'admin/structure/types/manage/%/display/teaser', 'Teaser', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 6, 0, 2, 180, 194, 312, 488, 499, 0, 0, 0, 0),
('management', 500, 489, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 2, 180, 194, 312, 489, 500, 0, 0, 0, 0),
('management', 501, 492, 'admin/structure/taxonomy/%/fields/%/delete', 'admin/structure/taxonomy/%/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 2, 180, 212, 251, 484, 492, 501, 0, 0, 0),
('management', 502, 492, 'admin/structure/taxonomy/%/fields/%/edit', 'admin/structure/taxonomy/%/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 212, 251, 484, 492, 502, 0, 0, 0),
('management', 503, 492, 'admin/structure/taxonomy/%/fields/%/field-settings', 'admin/structure/taxonomy/%/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 212, 251, 484, 492, 503, 0, 0, 0),
('management', 504, 492, 'admin/structure/taxonomy/%/fields/%/widget-type', 'admin/structure/taxonomy/%/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 212, 251, 484, 492, 504, 0, 0, 0),
('management', 213, 171, 'admin/appearance/install', 'admin/appearance/install', 'Install new theme', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 3, 0, 2, 171, 213, 0, 0, 0, 0, 0, 0, 0),
('management', 513, 500, 'admin/structure/types/manage/%/fields/%/edit', 'admin/structure/types/manage/%/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 2, 180, 194, 312, 489, 500, 513, 0, 0, 0),
('management', 512, 500, 'admin/structure/types/manage/%/fields/%/delete', 'admin/structure/types/manage/%/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 2, 180, 194, 312, 489, 500, 512, 0, 0, 0),
('management', 511, 361, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 2, 180, 194, 312, 361, 511, 0, 0, 0, 0),
('management', 498, 488, 'admin/structure/types/manage/%/display/search_result', 'admin/structure/types/manage/%/display/search_result', 'Search result', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 4, 6, 0, 2, 180, 194, 312, 488, 498, 0, 0, 0, 0),
('management', 48, 16, 'admin/reports/status', 'admin/reports/status', 'Status report', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37343a22476574206120737461747573207265706f72742061626f757420796f757220736974652773206f7065726174696f6e20616e6420616e792064657465637465642070726f626c656d732e223b7d7d, 'system', 0, 0, 0, 0, -60, 3, 0, 2, 16, 48, 0, 0, 0, 0, 0, 0, 0),
('management', 497, 488, 'admin/structure/types/manage/%/display/search_index', 'admin/structure/types/manage/%/display/search_index', 'Search index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 3, 6, 0, 2, 180, 194, 312, 488, 497, 0, 0, 0, 0),
('management', 496, 488, 'admin/structure/types/manage/%/display/rss', 'admin/structure/types/manage/%/display/rss', 'RSS', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 6, 0, 2, 180, 194, 312, 488, 496, 0, 0, 0, 0),
('management', 493, 485, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 2, 172, 205, 250, 485, 493, 0, 0, 0, 0),
('management', 212, 180, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Taxonomy', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36373a224d616e6167652074616767696e672c2063617465676f72697a6174696f6e2c20616e6420636c617373696669636174696f6e206f6620796f757220636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 2, 180, 212, 0, 0, 0, 0, 0, 0, 0),
('management', 211, 172, 'admin/config/system', 'admin/config/system', 'System', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a2247656e6572616c2073797374656d2072656c6174656420636f6e66696775726174696f6e2e223b7d7d, 'system', 0, 0, 1, 0, -20, 3, 0, 2, 172, 211, 0, 0, 0, 0, 0, 0, 0),
('management', 210, 171, 'admin/appearance/settings', 'admin/appearance/settings', 'Settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34363a22436f6e6669677572652064656661756c7420616e64207468656d652073706563696669632073657474696e67732e223b7d7d, 'system', -1, 0, 0, 0, 20, 3, 0, 2, 171, 210, 0, 0, 0, 0, 0, 0, 0),
('management', 209, 172, 'admin/config/search', 'admin/config/search', 'Search and metadata', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a224c6f63616c2073697465207365617263682c206d6574616461746120616e642053454f2e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 2, 172, 209, 0, 0, 0, 0, 0, 0, 0),
('navigation', 208, 170, 'node/%/revisions', 'node/%/revisions', 'Revisions', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 2, 2, 0, 170, 208, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 207, 172, 'admin/config/regional', 'admin/config/regional', 'Regional and language', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a22526567696f6e616c2073657474696e67732c206c6f63616c697a6174696f6e20616e64207472616e736c6174696f6e2e223b7d7d, 'system', 0, 0, 1, 0, -5, 3, 0, 2, 172, 207, 0, 0, 0, 0, 0, 0, 0),
('management', 206, 178, 'admin/people/permissions', 'admin/people/permissions', 'Permissions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 178, 206, 0, 0, 0, 0, 0, 0, 0),
('management', 205, 172, 'admin/config/people', 'admin/config/people', 'People', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32343a22436f6e6669677572652075736572206163636f756e74732e223b7d7d, 'system', 0, 0, 1, 0, -20, 3, 0, 2, 172, 205, 0, 0, 0, 0, 0, 0, 0),
('management', 204, 180, 'admin/structure/menu', 'admin/structure/menu', 'Menus', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38363a22416464206e6577206d656e757320746f20796f757220736974652c2065646974206578697374696e67206d656e75732c20616e642072656e616d6520616e642072656f7267616e697a65206d656e75206c696e6b732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 2, 180, 204, 0, 0, 0, 0, 0, 0, 0),
('management', 203, 172, 'admin/config/media', 'admin/config/media', 'Media', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a224d6564696120746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 2, 172, 203, 0, 0, 0, 0, 0, 0, 0),
('management', 202, 177, 'admin/modules/list', 'admin/modules/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 177, 202, 0, 0, 0, 0, 0, 0, 0),
('management', 201, 171, 'admin/appearance/list', 'admin/appearance/list', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33313a2253656c65637420616e6420636f6e66696775726520796f7572207468656d65223b7d7d, 'system', -1, 0, 0, 0, -1, 3, 0, 2, 171, 201, 0, 0, 0, 0, 0, 0, 0),
('management', 200, 178, 'admin/people/people', 'admin/people/people', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35303a2246696e6420616e64206d616e6167652070656f706c6520696e746572616374696e67207769746820796f757220736974652e223b7d7d, 'system', -1, 0, 0, 0, -10, 3, 0, 2, 178, 200, 0, 0, 0, 0, 0, 0, 0),
('navigation', 198, 170, 'node/%/edit', 'node/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 170, 198, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 199, 16, 'admin/reports/fields', 'admin/reports/fields', 'Field list', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a224f76657276696577206f66206669656c6473206f6e20616c6c20656e746974792074797065732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 199, 0, 0, 0, 0, 0, 0, 0),
('navigation', 197, 21, 'user/%/edit', 'user/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 21, 197, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 196, 172, 'admin/config/development', 'admin/config/development', 'Development', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22446576656c6f706d656e7420746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 2, 172, 196, 0, 0, 0, 0, 0, 0, 0),
('navigation', 195, 170, 'node/%/delete', 'node/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 2, 0, 170, 195, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 194, 180, 'admin/structure/types', 'admin/structure/types', 'Content types', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a39323a224d616e61676520636f6e74656e742074797065732c20696e636c7564696e672064656661756c74207374617475732c2066726f6e7420706167652070726f6d6f74696f6e2c20636f6d6d656e742073657474696e67732c206574632e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 2, 180, 194, 0, 0, 0, 0, 0, 0, 0),
('navigation', 192, 21, 'user/%/cancel', 'user/%/cancel', 'Cancel account', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 2, 0, 21, 192, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 191, 180, 'admin/structure/block', 'admin/structure/block', 'Blocks', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37393a22436f6e666967757265207768617420626c6f636b20636f6e74656e74206170706561727320696e20796f75722073697465277320736964656261727320616e64206f7468657220726567696f6e732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 2, 180, 191, 0, 0, 0, 0, 0, 0, 0),
('management', 410, 15, 'admin/help/contextual', 'admin/help/contextual', 'contextual', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 410, 0, 0, 0, 0, 0, 0, 0),
('management', 409, 407, 'admin/dashboard/customize', 'admin/dashboard/customize', 'Customize dashboard', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32353a22437573746f6d697a6520796f75722064617368626f6172642e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 407, 409, 0, 0, 0, 0, 0, 0, 0),
('management', 190, 178, 'admin/people/create', 'admin/people/create', 'Add user', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 178, 190, 0, 0, 0, 0, 0, 0, 0),
('management', 93, 16, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log messages', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a2256696577206576656e74732074686174206861766520726563656e746c79206265656e206c6f676765642e223b7d7d, 'system', 0, 0, 0, 0, -1, 3, 0, 2, 16, 93, 0, 0, 0, 0, 0, 0, 0),
('management', 495, 488, 'admin/structure/types/manage/%/display/full', 'admin/structure/types/manage/%/display/full', 'Full content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 2, 180, 194, 312, 488, 495, 0, 0, 0, 0),
('navigation', 189, 138, 'aggregator/sources/%', 'aggregator/sources/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 132, 138, 189, 0, 0, 0, 0, 0, 0, 0),
('management', 96, 16, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33353a225669657720276163636573732064656e69656427206572726f7273202834303373292e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 96, 0, 0, 0, 0, 0, 0, 0),
('management', 97, 16, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a2256696577202770616765206e6f7420666f756e6427206572726f7273202834303473292e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 97, 0, 0, 0, 0, 0, 0, 0),
('navigation', 188, 169, 'comment/%/view', 'comment/%/view', 'View comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 169, 188, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 408, 407, 'admin/dashboard/configure', 'admin/dashboard/configure', 'Configure available dashboard blocks', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35333a22436f6e66696775726520776869636820626c6f636b732063616e2062652073686f776e206f6e207468652064617368626f6172642e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 407, 408, 0, 0, 0, 0, 0, 0, 0),
('navigation', 187, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 187, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 186, 169, 'comment/%/edit', 'comment/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 169, 186, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 185, 169, 'comment/%/delete', 'comment/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 2, 0, 169, 185, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 183, 0, 'comment/reply/%', 'comment/reply/%', 'Add new comment', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 183, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 184, 169, 'comment/%/approve', 'comment/%/approve', 'Approve', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 1, 2, 0, 169, 184, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 105, 16, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38323a22476574206120737461747573207265706f72742061626f757420617661696c61626c65207570646174657320666f7220796f757220696e7374616c6c6564206d6f64756c657320616e64207468656d65732e223b7d7d, 'system', 0, 0, 0, 0, -50, 3, 0, 2, 16, 105, 0, 0, 0, 0, 0, 0, 0),
('navigation', 106, 11, 'node/add/page', 'node/add/page', 'Page', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3239363a2241203c656d3e706167653c2f656d3e2c2073696d696c617220696e20666f726d20746f2061203c656d3e73746f72793c2f656d3e2c20697320612073696d706c65206d6574686f6420666f72206372656174696e6720616e6420646973706c6179696e6720696e666f726d6174696f6e207468617420726172656c79206368616e6765732c207375636820617320616e202241626f7574207573222073656374696f6e206f66206120776562736974652e2042792064656661756c742c2061203c656d3e706167653c2f656d3e20656e74727920646f6573206e6f7420616c6c6f772076697369746f7220636f6d6d656e747320616e64206973206e6f74206665617475726564206f6e207468652073697465277320696e697469616c20686f6d6520706167652e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 11, 106, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 107, 11, 'node/add/story', 'node/add/story', 'Story', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3339323a2241203c656d3e73746f72793c2f656d3e2c2073696d696c617220696e20666f726d20746f2061203c656d3e706167653c2f656d3e2c20697320696465616c20666f72206372656174696e6720616e6420646973706c6179696e6720636f6e74656e74207468617420696e666f726d73206f7220656e676167657320776562736974652076697369746f72732e2050726573732072656c65617365732c207369746520616e6e6f756e63656d656e74732c20616e6420696e666f726d616c20626c6f672d6c696b6520656e7472696573206d617920616c6c206265206372656174656420776974682061203c656d3e73746f72793c2f656d3e20656e7472792e2042792064656661756c742c2061203c656d3e73746f72793c2f656d3e20656e747279206973206175746f6d61746963616c6c79206665617475726564206f6e207468652073697465277320696e697469616c20686f6d6520706167652c20616e642070726f766964657320746865206162696c69747920746f20706f737420636f6d6d656e74732e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 11, 107, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 181, 2, 'admin/tasks', 'admin/tasks', 'Tasks', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -20, 2, 0, 2, 181, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 182, 133, 'search/user', 'search/user', 'Users', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 133, 182, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 180, 2, 'admin/structure', 'admin/structure', 'Structure', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a2241646d696e697374657220626c6f636b732c20636f6e74656e742074797065732c206d656e75732c206574632e223b7d7d, 'system', 0, 0, 1, 0, -8, 2, 0, 2, 180, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 179, 168, 'user/password', 'user/password', 'Request new password', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 168, 179, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 407, 2, 'admin/dashboard', 'admin/dashboard', 'Dashboard', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a225669657720616e6420637573746f6d697a6520796f75722064617368626f6172642e223b7d7d, 'system', 0, 0, 0, 0, -15, 2, 0, 2, 407, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-about-us', 115, 0, '<front>', '', 'Our Company', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -50, 1, 1, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-about-us', 116, 0, '<front>', '', 'Our Blog', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -49, 1, 1, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-about-us', 117, 0, '<front>', '', 'Submit a Site', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -48, 1, 1, 117, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-about-us', 118, 0, '<front>', '', 'Contact Us', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -47, 1, 1, 118, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-about-us', 119, 0, '<front>', '', 'Help & Terms', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a323a220d0a223b7d7d, 'menu', 0, 1, 0, 0, -46, 1, 1, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-about-us', 120, 0, '<front>', '', 'Read Our FAQ', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -45, 1, 1, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-categories', 122, 0, '<front>', '', 'Trends & Technology', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 122, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-categories', 123, 0, '<front>', '', 'Design Companies', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 123, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-categories', 124, 0, '<front>', '', 'Design Freelancers', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 124, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-categories', 125, 0, '<front>', '', 'Web Portfolios', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-categories', 126, 0, '<front>', '', 'Web Development', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 126, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-categories', 127, 0, '<front>', '', 'General Icons', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 127, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 422, 420, 'node/3', 'node/%', 'Vestibulum', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, -50, 3, 1, 414, 420, 422, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 420, 414, 'node/2', 'node/%', 'Vivamus', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 1, 1, -49, 2, 1, 414, 420, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-menu', 418, 0, '<front>', '', 'Test', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 418, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 419, 414, 'node/1', 'node/%', 'Semper sed', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, -50, 2, 1, 414, 419, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 132, 0, 'aggregator', 'aggregator', 'Feed aggregator', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 5, 1, 0, 132, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 133, 0, 'search', 'search', 'Search', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 135, 132, 'aggregator/categories', 'aggregator/categories', 'Categories', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 2, 0, 132, 135, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 178, 2, 'admin/people', 'admin/people', 'People', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a224d616e6167652075736572206163636f756e74732c20726f6c65732c20616e64207065726d697373696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -4, 2, 0, 2, 178, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 138, 132, 'aggregator/sources', 'aggregator/sources', 'Sources', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 2, 0, 132, 138, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 139, 135, 'aggregator/categories/%', 'aggregator/categories/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 132, 135, 139, 0, 0, 0, 0, 0, 0, 0),
('management', 177, 2, 'admin/modules', 'admin/modules', 'Modules', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32363a22457874656e6420736974652066756e6374696f6e616c6974792e223b7d7d, 'system', 0, 0, 0, 0, -2, 2, 0, 2, 177, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 494, 488, 'admin/structure/types/manage/%/display/default', 'admin/structure/types/manage/%/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 2, 180, 194, 312, 488, 494, 0, 0, 0, 0),
('user-menu', 176, 168, 'user/login', 'user/login', 'Log in', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 168, 176, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 509, 360, 'admin/structure/types/manage/%/comment/display/default', 'admin/structure/types/manage/%/comment/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 2, 180, 194, 312, 360, 509, 0, 0, 0, 0),
('management', 144, 16, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33333a2256696577206d6f737420706f70756c61722073656172636820706872617365732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 144, 0, 0, 0, 0, 0, 0, 0),
('management', 175, 2, 'admin/index', 'admin/index', 'Index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -18, 2, 0, 2, 175, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 174, 168, 'user/register', 'user/register', 'Create new account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 168, 174, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 490, 482, 'admin/structure/taxonomy/%/display/full', 'admin/structure/taxonomy/%/display/full', 'Taxonomy term page', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 2, 180, 212, 251, 482, 490, 0, 0, 0, 0),
('management', 491, 483, 'admin/config/people/accounts/display/full', 'admin/config/people/accounts/display/full', 'User account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 2, 172, 205, 250, 483, 491, 0, 0, 0, 0),
('navigation', 173, 133, 'search/node', 'search/node', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 133, 173, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 172, 2, 'admin/config', 'admin/config', 'Configuration', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32303a2241646d696e69737465722073657474696e67732e223b7d7d, 'system', 0, 0, 1, 0, 0, 2, 0, 2, 172, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 170, 0, 'node/%', 'node/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 170, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 171, 2, 'admin/appearance', 'admin/appearance', 'Appearance', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33333a2253656c65637420616e6420636f6e66696775726520796f7572207468656d65732e223b7d7d, 'system', 0, 0, 0, 0, -6, 2, 0, 2, 171, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 169, 0, 'comment/%', 'comment/%', 'Comment permalink', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 169, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 154, 0, '<front>', '', 'Home', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 1, -50, 1, 1, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 421, 414, 'node/3', 'node/%', 'Praesent', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, -48, 2, 1, 414, 421, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 156, 0, 'node/1', 'node/%', 'Portfolio', 0x613a313a7b733a31303a2261747472696275746573223b613a303a7b7d7d, 'menu', 0, 0, 0, 0, -48, 1, 1, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 157, 0, 'taxonomy/term/1', 'taxonomy/term/%', 'Blog', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, -47, 1, 1, 157, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 158, 0, 'contact', 'contact', 'Contact', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, -46, 1, 1, 158, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-site-navigation', 160, 0, '<front>', '', 'Welcome Home', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 160, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 414, 0, 'node/3', 'node/%', 'About', 0x613a313a7b733a31303a2261747472696275746573223b613a303a7b7d7d, 'menu', 0, 0, 1, 1, -49, 1, 1, 414, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-site-navigation', 162, 0, 'node/1', 'node/%', 'Our Portfolio', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, 2, 1, 1, 162, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-site-navigation', 163, 0, 'taxonomy/term/1', 'taxonomy/term/%', 'Blog News', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, 3, 1, 1, 163, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-site-navigation', 164, 0, 'node/6', 'node/%', 'Contact Us', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, 4, 1, 1, 164, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 219, 170, 'node/%/view', 'node/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 170, 219, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 220, 21, 'user/%/view', 'user/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 21, 220, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 221, 172, 'admin/config/services', 'admin/config/services', 'Web services', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a22546f6f6c732072656c6174656420746f207765622073657276696365732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 2, 172, 221, 0, 0, 0, 0, 0, 0, 0),
('management', 222, 172, 'admin/config/workflow', 'admin/config/workflow', 'Workflow', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22436f6e74656e7420776f726b666c6f772c20656469746f7269616c20776f726b666c6f7720746f6f6c732e223b7d7d, 'system', 0, 0, 0, 0, 5, 3, 0, 2, 172, 222, 0, 0, 0, 0, 0, 0, 0),
('management', 223, 15, 'admin/help/aggregator', 'admin/help/aggregator', 'aggregator', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 223, 0, 0, 0, 0, 0, 0, 0),
('management', 224, 15, 'admin/help/block', 'admin/help/block', 'block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 224, 0, 0, 0, 0, 0, 0, 0),
('management', 225, 15, 'admin/help/color', 'admin/help/color', 'color', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 225, 0, 0, 0, 0, 0, 0, 0),
('management', 226, 15, 'admin/help/comment', 'admin/help/comment', 'comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 226, 0, 0, 0, 0, 0, 0, 0),
('management', 227, 15, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 227, 0, 0, 0, 0, 0, 0, 0),
('management', 228, 15, 'admin/help/field', 'admin/help/field', 'field', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 228, 0, 0, 0, 0, 0, 0, 0),
('management', 229, 15, 'admin/help/field_sql_storage', 'admin/help/field_sql_storage', 'field_sql_storage', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 229, 0, 0, 0, 0, 0, 0, 0),
('management', 230, 15, 'admin/help/field_ui', 'admin/help/field_ui', 'field_ui', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 230, 0, 0, 0, 0, 0, 0, 0),
('management', 231, 15, 'admin/help/file', 'admin/help/file', 'file', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 231, 0, 0, 0, 0, 0, 0, 0),
('management', 232, 15, 'admin/help/filter', 'admin/help/filter', 'filter', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 232, 0, 0, 0, 0, 0, 0, 0),
('management', 233, 15, 'admin/help/help', 'admin/help/help', 'help', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 233, 0, 0, 0, 0, 0, 0, 0),
('management', 234, 15, 'admin/help/list', 'admin/help/list', 'list', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 234, 0, 0, 0, 0, 0, 0, 0),
('management', 235, 15, 'admin/help/menu', 'admin/help/menu', 'menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 235, 0, 0, 0, 0, 0, 0, 0),
('management', 236, 15, 'admin/help/node', 'admin/help/node', 'node', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 236, 0, 0, 0, 0, 0, 0, 0),
('management', 237, 15, 'admin/help/number', 'admin/help/number', 'number', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 237, 0, 0, 0, 0, 0, 0, 0),
('management', 238, 15, 'admin/help/options', 'admin/help/options', 'options', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 238, 0, 0, 0, 0, 0, 0, 0),
('management', 239, 15, 'admin/help/php', 'admin/help/php', 'php', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 239, 0, 0, 0, 0, 0, 0, 0),
('management', 240, 15, 'admin/help/search', 'admin/help/search', 'search', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 240, 0, 0, 0, 0, 0, 0, 0),
('management', 241, 15, 'admin/help/system', 'admin/help/system', 'system', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 241, 0, 0, 0, 0, 0, 0, 0),
('management', 242, 15, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 242, 0, 0, 0, 0, 0, 0, 0),
('management', 243, 15, 'admin/help/text', 'admin/help/text', 'text', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 243, 0, 0, 0, 0, 0, 0, 0),
('management', 244, 15, 'admin/help/update', 'admin/help/update', 'update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 244, 0, 0, 0, 0, 0, 0, 0),
('management', 245, 15, 'admin/help/user', 'admin/help/user', 'user', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 245, 0, 0, 0, 0, 0, 0, 0),
('navigation', 246, 173, 'search/node/%', 'search/node/%', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 133, 173, 246, 0, 0, 0, 0, 0, 0, 0),
('navigation', 247, 182, 'search/user/%', 'search/user/%', 'Users', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 133, 182, 247, 0, 0, 0, 0, 0, 0, 0),
('navigation', 248, 187, 'taxonomy/term/%/edit', 'taxonomy/term/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 2, 0, 187, 248, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 249, 187, 'taxonomy/term/%/view', 'taxonomy/term/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 187, 249, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 250, 205, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Account settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130393a22436f6e6669677572652064656661756c74206265686176696f72206f662075736572732c20696e636c7564696e6720726567697374726174696f6e20726571756972656d656e74732c20652d6d61696c732c206669656c64732c20616e6420757365722070696374757265732e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 2, 172, 205, 250, 0, 0, 0, 0, 0, 0),
('management', 251, 212, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 180, 212, 251, 0, 0, 0, 0, 0, 0),
('management', 252, 105, 'admin/reports/updates/install', 'admin/reports/updates/install', 'Install new module or theme', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 4, 0, 2, 16, 105, 252, 0, 0, 0, 0, 0, 0),
('management', 253, 211, 'admin/config/system/actions', 'admin/config/system/actions', 'Actions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34313a224d616e6167652074686520616374696f6e7320646566696e656420666f7220796f757220736974652e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 2, 172, 211, 253, 0, 0, 0, 0, 0, 0),
('management', 254, 191, 'admin/structure/block/add', 'admin/structure/block/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 180, 191, 254, 0, 0, 0, 0, 0, 0),
('management', 255, 194, 'admin/structure/types/add', 'admin/structure/types/add', 'Add content type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 180, 194, 255, 0, 0, 0, 0, 0, 0),
('management', 256, 204, 'admin/structure/menu/add', 'admin/structure/menu/add', 'Add menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 180, 204, 256, 0, 0, 0, 0, 0, 0),
('management', 257, 212, 'admin/structure/taxonomy/add', 'admin/structure/taxonomy/add', 'Add vocabulary', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 180, 212, 257, 0, 0, 0, 0, 0, 0),
('management', 258, 210, 'admin/appearance/settings/bartik', 'admin/appearance/settings/bartik', 'Bartik', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 171, 210, 258, 0, 0, 0, 0, 0, 0),
('management', 259, 210, 'admin/appearance/settings/bluemasters', 'admin/appearance/settings/bluemasters', 'Blue Masters', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 171, 210, 259, 0, 0, 0, 0, 0, 0),
('navigation', 260, 139, 'aggregator/categories/%/categorize', 'aggregator/categories/%/categorize', 'Categorize', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 132, 135, 139, 260, 0, 0, 0, 0, 0, 0),
('navigation', 261, 189, 'aggregator/sources/%/categorize', 'aggregator/sources/%/categorize', 'Categorize', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 132, 138, 189, 261, 0, 0, 0, 0, 0, 0),
('management', 262, 209, 'admin/config/search/clean-urls', 'admin/config/search/clean-urls', 'Clean URLs', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22456e61626c65206f722064697361626c6520636c65616e2055524c7320666f7220796f757220736974652e223b7d7d, 'system', 0, 0, 0, 0, 5, 4, 0, 2, 172, 209, 262, 0, 0, 0, 0, 0, 0),
('navigation', 263, 139, 'aggregator/categories/%/configure', 'aggregator/categories/%/configure', 'Configure', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 4, 0, 132, 135, 139, 263, 0, 0, 0, 0, 0, 0),
('navigation', 264, 189, 'aggregator/sources/%/configure', 'aggregator/sources/%/configure', 'Configure', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 4, 0, 132, 138, 189, 264, 0, 0, 0, 0, 0, 0),
('management', 265, 211, 'admin/config/system/cron', 'admin/config/system/cron', 'Cron', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34303a224d616e616765206175746f6d617469632073697465206d61696e74656e616e6365207461736b732e223b7d7d, 'system', 0, 0, 0, 0, 20, 4, 0, 2, 172, 211, 265, 0, 0, 0, 0, 0, 0),
('management', 266, 207, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Date and time', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34343a22436f6e66696775726520646973706c617920666f726d61747320666f72206461746520616e642074696d652e223b7d7d, 'system', 0, 0, 0, 0, -15, 4, 0, 2, 172, 207, 266, 0, 0, 0, 0, 0, 0),
('management', 267, 16, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 267, 0, 0, 0, 0, 0, 0, 0),
('management', 268, 221, 'admin/config/services/aggregator', 'admin/config/services/aggregator', 'Feed aggregator', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3131363a22436f6e66696775726520776869636820636f6e74656e7420796f7572207369746520616767726567617465732066726f6d206f746865722073697465732c20686f77206f6674656e20697420706f6c6c73207468656d2c20616e6420686f7720746865792772652063617465676f72697a65642e223b7d7d, 'system', 0, 0, 1, 0, 10, 4, 0, 2, 172, 221, 268, 0, 0, 0, 0, 0, 0),
('management', 269, 203, 'admin/config/media/file-system', 'admin/config/media/file-system', 'File system', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36383a2254656c6c2044727570616c20776865726520746f2073746f72652075706c6f616465642066696c657320616e6420686f772074686579206172652061636365737365642e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 2, 172, 203, 269, 0, 0, 0, 0, 0, 0),
('management', 270, 210, 'admin/appearance/settings/garland', 'admin/appearance/settings/garland', 'Garland', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 171, 210, 270, 0, 0, 0, 0, 0, 0),
('management', 271, 210, 'admin/appearance/settings/global', 'admin/appearance/settings/global', 'Global settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -1, 4, 0, 2, 171, 210, 271, 0, 0, 0, 0, 0, 0),
('management', 272, 205, 'admin/config/people/ip-blocking', 'admin/config/people/ip-blocking', 'IP address blocking', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32383a224d616e61676520626c6f636b6564204950206164647265737365732e223b7d7d, 'system', 0, 0, 1, 0, 10, 4, 0, 2, 172, 205, 272, 0, 0, 0, 0, 0, 0),
('management', 273, 203, 'admin/config/media/image-toolkit', 'admin/config/media/image-toolkit', 'Image toolkit', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37343a2243686f6f736520776869636820696d61676520746f6f6c6b697420746f2075736520696620796f75206861766520696e7374616c6c6564206f7074696f6e616c20746f6f6c6b6974732e223b7d7d, 'system', 0, 0, 0, 0, 20, 4, 0, 2, 172, 203, 273, 0, 0, 0, 0, 0, 0),
('management', 274, 202, 'admin/modules/list/confirm', 'admin/modules/list/confirm', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 177, 202, 274, 0, 0, 0, 0, 0, 0),
('management', 275, 194, 'admin/structure/types/list', 'admin/structure/types/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 2, 180, 194, 275, 0, 0, 0, 0, 0, 0),
('management', 276, 212, 'admin/structure/taxonomy/list', 'admin/structure/taxonomy/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 2, 180, 212, 276, 0, 0, 0, 0, 0, 0),
('management', 277, 105, 'admin/reports/updates/update', 'admin/reports/updates/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 4, 0, 2, 16, 105, 277, 0, 0, 0, 0, 0, 0),
('management', 278, 105, 'admin/reports/updates/list', 'admin/reports/updates/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 105, 278, 0, 0, 0, 0, 0, 0),
('management', 279, 204, 'admin/structure/menu/list', 'admin/structure/menu/list', 'List menus', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 2, 180, 204, 279, 0, 0, 0, 0, 0, 0),
('management', 280, 196, 'admin/config/development/logging', 'admin/config/development/logging', 'Logging and errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3135343a2253657474696e677320666f72206c6f6767696e6720616e6420616c65727473206d6f64756c65732e20566172696f7573206d6f64756c65732063616e20726f7574652044727570616c27732073797374656d206576656e747320746f20646966666572656e742064657374696e6174696f6e732c2073756368206173207379736c6f672c2064617461626173652c20656d61696c2c206574632e223b7d7d, 'system', 0, 0, 0, 0, -15, 4, 0, 2, 172, 196, 280, 0, 0, 0, 0, 0, 0),
('management', 281, 196, 'admin/config/development/maintenance', 'admin/config/development/maintenance', 'Maintenance mode', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36323a2254616b65207468652073697465206f66666c696e6520666f72206d61696e74656e616e6365206f72206272696e67206974206261636b206f6e6c696e652e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 2, 172, 196, 281, 0, 0, 0, 0, 0, 0),
('management', 282, 196, 'admin/config/development/performance', 'admin/config/development/performance', 'Performance', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130313a22456e61626c65206f722064697361626c6520706167652063616368696e6720666f7220616e6f6e796d6f757320757365727320616e64207365742043535320616e64204a532062616e647769647468206f7074696d697a6174696f6e206f7074696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 2, 172, 196, 282, 0, 0, 0, 0, 0, 0),
('management', 283, 206, 'admin/people/permissions/list', 'admin/people/permissions/list', 'Permissions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b7d7d, 'system', -1, 0, 0, 0, -8, 4, 0, 2, 178, 206, 283, 0, 0, 0, 0, 0, 0),
('management', 284, 27, 'admin/content/comment/new', 'admin/content/comment/new', 'Published comments', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 2, 10, 27, 284, 0, 0, 0, 0, 0, 0),
('management', 285, 221, 'admin/config/services/rss-publishing', 'admin/config/services/rss-publishing', 'RSS publishing', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3131343a22436f6e666967757265207468652073697465206465736372697074696f6e2c20746865206e756d626572206f66206974656d7320706572206665656420616e6420776865746865722066656564732073686f756c64206265207469746c65732f746561736572732f66756c6c2d746578742e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 172, 221, 285, 0, 0, 0, 0, 0, 0),
('management', 286, 207, 'admin/config/regional/settings', 'admin/config/regional/settings', 'Regional settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35343a2253657474696e677320666f7220746865207369746527732064656661756c742074696d65207a6f6e6520616e6420636f756e7472792e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 2, 172, 207, 286, 0, 0, 0, 0, 0, 0),
('management', 287, 206, 'admin/people/permissions/roles', 'admin/people/permissions/roles', 'Roles', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a224c6973742c20656469742c206f7220616464207573657220726f6c65732e223b7d7d, 'system', -1, 0, 1, 0, -5, 4, 0, 2, 178, 206, 287, 0, 0, 0, 0, 0, 0),
('management', 288, 209, 'admin/config/search/settings', 'admin/config/search/settings', 'Search settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36373a22436f6e6669677572652072656c6576616e63652073657474696e677320666f722073656172636820616e64206f7468657220696e646578696e67206f7074696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 2, 172, 209, 288, 0, 0, 0, 0, 0, 0),
('management', 289, 204, 'admin/structure/menu/settings', 'admin/structure/menu/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 5, 4, 0, 2, 180, 204, 289, 0, 0, 0, 0, 0, 0),
('management', 290, 105, 'admin/reports/updates/settings', 'admin/reports/updates/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 50, 4, 0, 2, 16, 105, 290, 0, 0, 0, 0, 0, 0),
('management', 291, 210, 'admin/appearance/settings/seven', 'admin/appearance/settings/seven', 'Seven', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 171, 210, 291, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('management', 292, 211, 'admin/config/system/site-information', 'admin/config/system/site-information', 'Site information', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130343a224368616e67652073697465206e616d652c20652d6d61696c20616464726573732c20736c6f67616e2c2064656661756c742066726f6e7420706167652c20616e64206e756d626572206f6620706f7374732070657220706167652c206572726f722070616765732e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 2, 172, 211, 292, 0, 0, 0, 0, 0, 0),
('management', 293, 210, 'admin/appearance/settings/stark', 'admin/appearance/settings/stark', 'Stark', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 171, 210, 293, 0, 0, 0, 0, 0, 0),
('management', 492, 484, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 2, 180, 212, 251, 484, 492, 0, 0, 0, 0),
('management', 295, 193, 'admin/config/content/formats', 'admin/config/content/formats', 'Text formats', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3132373a22436f6e66696775726520686f7720636f6e74656e7420696e7075742062792075736572732069732066696c74657265642c20696e636c7564696e6720616c6c6f7765642048544d4c20746167732e20416c736f20616c6c6f777320656e61626c696e67206f66206d6f64756c652d70726f76696465642066696c746572732e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 2, 172, 193, 295, 0, 0, 0, 0, 0, 0),
('management', 296, 27, 'admin/content/comment/approval', 'admin/content/comment/approval', 'Unapproved comments', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 27, 296, 0, 0, 0, 0, 0, 0),
('management', 297, 214, 'admin/modules/uninstall/confirm', 'admin/modules/uninstall/confirm', 'Uninstall', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 177, 214, 297, 0, 0, 0, 0, 0, 0),
('management', 489, 312, 'admin/structure/types/manage/%/fields', 'admin/structure/types/manage/%/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 2, 180, 194, 312, 489, 0, 0, 0, 0, 0),
('management', 487, 483, 'admin/config/people/accounts/display/default', 'admin/config/people/accounts/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 2, 172, 205, 250, 483, 487, 0, 0, 0, 0),
('navigation', 300, 139, 'aggregator/categories/%/view', 'aggregator/categories/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 132, 135, 139, 300, 0, 0, 0, 0, 0, 0),
('navigation', 301, 189, 'aggregator/sources/%/view', 'aggregator/sources/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 132, 138, 189, 301, 0, 0, 0, 0, 0, 0),
('navigation', 302, 197, 'user/%/edit/account', 'user/%/edit/account', 'Account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 21, 197, 302, 0, 0, 0, 0, 0, 0, 0),
('management', 303, 295, 'admin/config/content/formats/%', 'admin/config/content/formats/%', '', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 2, 172, 193, 295, 303, 0, 0, 0, 0, 0),
('management', 304, 251, 'admin/structure/taxonomy/%/add', 'admin/structure/taxonomy/%/add', 'Add term', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 212, 251, 304, 0, 0, 0, 0, 0),
('management', 305, 295, 'admin/config/content/formats/add', 'admin/config/content/formats/add', 'Add text format', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 2, 172, 193, 295, 305, 0, 0, 0, 0, 0),
('management', 306, 191, 'admin/structure/block/list/bartik', 'admin/structure/block/list/bartik', 'Bartik', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 180, 191, 306, 0, 0, 0, 0, 0, 0),
('management', 307, 191, 'admin/structure/block/list/bluemasters', 'admin/structure/block/list/bluemasters', 'Blue Masters', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 2, 180, 191, 307, 0, 0, 0, 0, 0, 0),
('management', 308, 288, 'admin/config/search/settings/reindex', 'admin/config/search/settings/reindex', 'Clear index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 172, 209, 288, 308, 0, 0, 0, 0, 0),
('management', 309, 253, 'admin/config/system/actions/configure', 'admin/config/system/actions/configure', 'Configure an advanced action', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 172, 211, 253, 309, 0, 0, 0, 0, 0),
('management', 310, 204, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Customize menu', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 4, 0, 2, 180, 204, 310, 0, 0, 0, 0, 0, 0),
('management', 311, 251, 'admin/structure/taxonomy/%/edit', 'admin/structure/taxonomy/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 2, 180, 212, 251, 311, 0, 0, 0, 0, 0),
('management', 312, 194, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit content type', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 4, 0, 2, 180, 194, 312, 0, 0, 0, 0, 0, 0),
('management', 313, 266, 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time/formats', 'Formats', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35313a22436f6e66696775726520646973706c617920666f726d617420737472696e677320666f72206461746520616e642074696d652e223b7d7d, 'system', -1, 0, 1, 0, -9, 5, 0, 2, 172, 207, 266, 313, 0, 0, 0, 0, 0),
('management', 314, 191, 'admin/structure/block/list/garland', 'admin/structure/block/list/garland', 'Garland', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 180, 191, 314, 0, 0, 0, 0, 0, 0),
('management', 315, 251, 'admin/structure/taxonomy/%/list', 'admin/structure/taxonomy/%/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -20, 5, 0, 2, 180, 212, 251, 315, 0, 0, 0, 0, 0),
('management', 316, 268, 'admin/config/services/aggregator/list', 'admin/config/services/aggregator/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 2, 172, 221, 268, 316, 0, 0, 0, 0, 0),
('management', 317, 295, 'admin/config/content/formats/list', 'admin/config/content/formats/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 172, 193, 295, 317, 0, 0, 0, 0, 0),
('management', 318, 253, 'admin/config/system/actions/manage', 'admin/config/system/actions/manage', 'Manage actions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34313a224d616e6167652074686520616374696f6e7320646566696e656420666f7220796f757220736974652e223b7d7d, 'system', -1, 0, 0, 0, -2, 5, 0, 2, 172, 211, 253, 318, 0, 0, 0, 0, 0),
('management', 319, 250, 'admin/config/people/accounts/settings', 'admin/config/people/accounts/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 2, 172, 205, 250, 319, 0, 0, 0, 0, 0),
('management', 320, 268, 'admin/config/services/aggregator/settings', 'admin/config/services/aggregator/settings', 'Settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3132393a22436f6e66696775726520746865206265686176696f72206f662074686520666565642061676772656761746f722c20696e636c7564696e67207768656e20746f20646973636172642066656564206974656d7320616e6420686f7720746f2070726573656e742066656564206974656d7320616e642063617465676f726965732e223b7d7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 172, 221, 268, 320, 0, 0, 0, 0, 0),
('management', 321, 191, 'admin/structure/block/list/seven', 'admin/structure/block/list/seven', 'Seven', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 180, 191, 321, 0, 0, 0, 0, 0, 0),
('management', 322, 191, 'admin/structure/block/list/stark', 'admin/structure/block/list/stark', 'Stark', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 2, 180, 191, 322, 0, 0, 0, 0, 0, 0),
('management', 488, 312, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 2, 180, 194, 312, 488, 0, 0, 0, 0, 0),
('management', 324, 266, 'admin/config/regional/date-time/types', 'admin/config/regional/date-time/types', 'Types', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34343a22436f6e66696775726520646973706c617920666f726d61747320666f72206461746520616e642074696d652e223b7d7d, 'system', -1, 0, 1, 0, -10, 5, 0, 2, 172, 207, 266, 324, 0, 0, 0, 0, 0),
('management', 486, 482, 'admin/structure/taxonomy/%/display/default', 'admin/structure/taxonomy/%/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 2, 180, 212, 251, 482, 486, 0, 0, 0, 0),
('management', 485, 250, 'admin/config/people/accounts/fields', 'admin/config/people/accounts/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 2, 172, 205, 250, 485, 0, 0, 0, 0, 0),
('navigation', 327, 208, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 170, 208, 327, 0, 0, 0, 0, 0, 0, 0),
('navigation', 328, 208, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 170, 208, 328, 0, 0, 0, 0, 0, 0, 0),
('navigation', 329, 208, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 170, 208, 329, 0, 0, 0, 0, 0, 0, 0),
('management', 330, 306, 'admin/structure/block/list/bartik/add', 'admin/structure/block/list/bartik/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 191, 306, 330, 0, 0, 0, 0, 0),
('management', 332, 321, 'admin/structure/block/list/seven/add', 'admin/structure/block/list/seven/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 191, 321, 332, 0, 0, 0, 0, 0),
('management', 333, 322, 'admin/structure/block/list/stark/add', 'admin/structure/block/list/stark/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 191, 322, 333, 0, 0, 0, 0, 0),
('management', 484, 251, 'admin/structure/taxonomy/%/fields', 'admin/structure/taxonomy/%/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 2, 180, 212, 251, 484, 0, 0, 0, 0, 0),
('management', 482, 251, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 2, 180, 212, 251, 482, 0, 0, 0, 0, 0),
('management', 483, 250, 'admin/config/people/accounts/display', 'admin/config/people/accounts/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 2, 172, 205, 250, 483, 0, 0, 0, 0, 0),
('management', 337, 268, 'admin/config/services/aggregator/add/category', 'admin/config/services/aggregator/add/category', 'Add category', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 172, 221, 268, 337, 0, 0, 0, 0, 0),
('management', 338, 324, 'admin/config/regional/date-time/types/add', 'admin/config/regional/date-time/types/add', 'Add date type', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22416464206e6577206461746520747970652e223b7d7d, 'system', -1, 0, 0, 0, -10, 6, 0, 2, 172, 207, 266, 324, 338, 0, 0, 0, 0),
('management', 339, 268, 'admin/config/services/aggregator/add/feed', 'admin/config/services/aggregator/add/feed', 'Add feed', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 172, 221, 268, 339, 0, 0, 0, 0, 0),
('management', 340, 313, 'admin/config/regional/date-time/formats/add', 'admin/config/regional/date-time/formats/add', 'Add format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22416c6c6f7720757365727320746f20616464206164646974696f6e616c206461746520666f726d6174732e223b7d7d, 'system', -1, 0, 0, 0, -10, 6, 0, 2, 172, 207, 266, 313, 340, 0, 0, 0, 0),
('management', 341, 310, 'admin/structure/menu/manage/%/add', 'admin/structure/menu/manage/%/add', 'Add link', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 204, 310, 341, 0, 0, 0, 0, 0),
('management', 342, 191, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 180, 191, 342, 0, 0, 0, 0, 0, 0),
('navigation', 343, 192, 'user/%/cancel/confirm/%/%', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 21, 192, 343, 0, 0, 0, 0, 0, 0, 0),
('management', 344, 312, 'admin/structure/types/manage/%/delete', 'admin/structure/types/manage/%/delete', 'Delete', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 180, 194, 312, 344, 0, 0, 0, 0, 0),
('management', 345, 272, 'admin/config/people/ip-blocking/delete/%', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 172, 205, 272, 345, 0, 0, 0, 0, 0),
('management', 346, 253, 'admin/config/system/actions/delete/%', 'admin/config/system/actions/delete/%', 'Delete action', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31373a2244656c65746520616e20616374696f6e2e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 172, 211, 253, 346, 0, 0, 0, 0, 0),
('management', 347, 310, 'admin/structure/menu/manage/%/delete', 'admin/structure/menu/manage/%/delete', 'Delete menu', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 180, 204, 310, 347, 0, 0, 0, 0, 0),
('management', 348, 204, 'admin/structure/menu/item/%/delete', 'admin/structure/menu/item/%/delete', 'Delete menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 180, 204, 348, 0, 0, 0, 0, 0, 0),
('management', 349, 287, 'admin/people/permissions/roles/delete/%', 'admin/people/permissions/roles/delete/%', 'Delete role', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 178, 206, 287, 349, 0, 0, 0, 0, 0),
('management', 350, 303, 'admin/config/content/formats/%/disable', 'admin/config/content/formats/%/disable', 'Disable text format', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 2, 172, 193, 295, 303, 350, 0, 0, 0, 0),
('management', 351, 312, 'admin/structure/types/manage/%/edit', 'admin/structure/types/manage/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 194, 312, 351, 0, 0, 0, 0, 0),
('management', 352, 310, 'admin/structure/menu/manage/%/edit', 'admin/structure/menu/manage/%/edit', 'Edit menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 204, 310, 352, 0, 0, 0, 0, 0),
('management', 353, 204, 'admin/structure/menu/item/%/edit', 'admin/structure/menu/item/%/edit', 'Edit menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 180, 204, 353, 0, 0, 0, 0, 0, 0),
('management', 354, 287, 'admin/people/permissions/roles/edit/%', 'admin/people/permissions/roles/edit/%', 'Edit role', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 178, 206, 287, 354, 0, 0, 0, 0, 0),
('management', 355, 268, 'admin/config/services/aggregator/add/opml', 'admin/config/services/aggregator/add/opml', 'Import OPML', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 172, 221, 268, 355, 0, 0, 0, 0, 0),
('management', 356, 310, 'admin/structure/menu/manage/%/list', 'admin/structure/menu/manage/%/list', 'List links', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 2, 180, 204, 310, 356, 0, 0, 0, 0, 0),
('management', 357, 268, 'admin/config/services/aggregator/remove/%', 'admin/config/services/aggregator/remove/%', 'Remove items', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 172, 221, 268, 357, 0, 0, 0, 0, 0),
('management', 358, 204, 'admin/structure/menu/item/%/reset', 'admin/structure/menu/item/%/reset', 'Reset menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 180, 204, 358, 0, 0, 0, 0, 0, 0),
('management', 359, 268, 'admin/config/services/aggregator/update/%', 'admin/config/services/aggregator/update/%', 'Update items', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 172, 221, 268, 359, 0, 0, 0, 0, 0),
('management', 360, 312, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%/comment/display', 'Comment display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 4, 5, 0, 2, 180, 194, 312, 360, 0, 0, 0, 0, 0),
('management', 361, 312, 'admin/structure/types/manage/%/comment/fields', 'admin/structure/types/manage/%/comment/fields', 'Comment fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 3, 5, 0, 2, 180, 194, 312, 361, 0, 0, 0, 0, 0),
('management', 362, 342, 'admin/structure/block/manage/%/%/configure', 'admin/structure/block/manage/%/%/configure', 'Configure block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 191, 342, 362, 0, 0, 0, 0, 0),
('management', 363, 342, 'admin/structure/block/manage/%/%/delete', 'admin/structure/block/manage/%/%/delete', 'Delete block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 191, 342, 363, 0, 0, 0, 0, 0),
('management', 364, 313, 'admin/config/regional/date-time/formats/%/delete', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34373a22416c6c6f7720757365727320746f2064656c657465206120636f6e66696775726564206461746520666f726d61742e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 2, 172, 207, 266, 313, 364, 0, 0, 0, 0),
('management', 365, 324, 'admin/config/regional/date-time/types/%/delete', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a22416c6c6f7720757365727320746f2064656c657465206120636f6e66696775726564206461746520747970652e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 2, 172, 207, 266, 324, 365, 0, 0, 0, 0),
('management', 366, 268, 'admin/config/services/aggregator/edit/category/%', 'admin/config/services/aggregator/edit/category/%', 'Edit category', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 172, 221, 268, 366, 0, 0, 0, 0, 0),
('management', 367, 313, 'admin/config/regional/date-time/formats/%/edit', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a22416c6c6f7720757365727320746f2065646974206120636f6e66696775726564206461746520666f726d61742e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 2, 172, 207, 266, 313, 367, 0, 0, 0, 0),
('management', 368, 268, 'admin/config/services/aggregator/edit/feed/%', 'admin/config/services/aggregator/edit/feed/%', 'Edit feed', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 2, 172, 221, 268, 368, 0, 0, 0, 0, 0),
('management', 411, 15, 'admin/help/dashboard', 'admin/help/dashboard', 'dashboard', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 411, 0, 0, 0, 0, 0, 0, 0),
('management', 412, 15, 'admin/help/toolbar', 'admin/help/toolbar', 'toolbar', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 412, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 423, 420, 'node/1', 'node/%', 'Proin dui', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 0, 0, 0, -49, 3, 1, 414, 420, 423, 0, 0, 0, 0, 0, 0, 0),
('management', 433, 431, 'admin/structure/contact/add', 'admin/structure/contact/add', 'Add category', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 4, 0, 2, 180, 431, 433, 0, 0, 0, 0, 0, 0),
('navigation', 429, 0, 'contact', 'contact', 'Contact', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 429, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 430, 21, 'user/%/contact', 'user/%/contact', 'Contact', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 2, 0, 21, 430, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 431, 180, 'admin/structure/contact', 'admin/structure/contact', 'Contact form', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37313a2243726561746520612073797374656d20636f6e7461637420666f726d20616e64207365742075702063617465676f7269657320666f722074686520666f726d20746f207573652e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 2, 180, 431, 0, 0, 0, 0, 0, 0, 0),
('management', 432, 15, 'admin/help/contact', 'admin/help/contact', 'contact', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 432, 0, 0, 0, 0, 0, 0, 0),
('management', 434, 431, 'admin/structure/contact/delete/%', 'admin/structure/contact/delete/%', 'Delete contact', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 180, 431, 434, 0, 0, 0, 0, 0, 0),
('management', 435, 431, 'admin/structure/contact/edit/%', 'admin/structure/contact/edit/%', 'Edit contact category', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 180, 431, 435, 0, 0, 0, 0, 0, 0),
('management', 537, 314, 'admin/structure/block/list/garland/add', 'admin/structure/block/list/garland/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 2, 180, 191, 314, 537, 0, 0, 0, 0, 0),
('management', 538, 15, 'admin/help/superfish', 'admin/help/superfish', 'superfish', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 538, 0, 0, 0, 0, 0, 0, 0),
('management', 539, 218, 'admin/config/user-interface/superfish', 'admin/config/user-interface/superfish', 'Superfish', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32353a22436f6e66696775726520537570657266697368204d656e7573223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 2, 172, 218, 539, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_router`
--

CREATE TABLE IF NOT EXISTS `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `load_functions` blob NOT NULL COMMENT 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.',
  `to_arg_functions` blob NOT NULL COMMENT 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.',
  `access_callback` varchar(255) NOT NULL DEFAULT '',
  `access_arguments` blob COMMENT 'A serialized array of arguments for the access callback.',
  `page_callback` varchar(255) NOT NULL DEFAULT '',
  `page_arguments` blob COMMENT 'A serialized array of arguments for the page callback.',
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) NOT NULL DEFAULT '',
  `tab_root` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_callback` varchar(255) NOT NULL DEFAULT '',
  `title_arguments` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `include_file` mediumtext,
  `delivery_callback` varchar(255) NOT NULL DEFAULT '',
  `context` int(11) NOT NULL DEFAULT '0' COMMENT 'Only for local tasks (tabs) - the context of a local task to control its placement.',
  `theme_callback` varchar(255) NOT NULL DEFAULT '',
  `theme_arguments` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`),
  KEY `tab_parent` (`tab_parent`(64),`weight`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_router`
--

INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `description`, `position`, `weight`, `include_file`, `delivery_callback`, `context`, `theme_callback`, `theme_arguments`) VALUES
('node', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'node_page_default', 0x613a303a7b7d, 1, 1, '', 'node', '', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('aggregator', '', '', 'user_access', 0x613a313a7b693a303b733a31373a22616363657373206e657773206665656473223b7d, 'aggregator_page_last', 0x613a303a7b7d, 1, 1, '', 'aggregator', 'Feed aggregator', 't', '', 6, '', '', 5, 'modules/aggregator/aggregator.pages.inc', '', 0, '', 'a:0:{}'),
('rss.xml', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'node_feed', 0x613a323a7b693a303b623a303b693a313b613a303a7b7d7d, 1, 1, '', 'rss.xml', 'RSS feed', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('search', '', '', 'search_is_active', 0x613a303a7b7d, 'search_view', 0x613a303a7b7d, 1, 1, '', 'search', 'Search', 't', '', 20, '', '', 0, 'modules/search/search.pages.inc', '', 0, '', 'a:0:{}'),
('admin', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 1, 1, '', 'admin', 'Administration', 't', '', 6, '', '', 9, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('contact', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261636365737320736974652d7769646520636f6e7461637420666f726d223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31373a22636f6e746163745f736974655f666f726d223b7d, 1, 1, '', 'contact', 'Contact', 't', '', 20, '', '', 0, 'modules/contact/contact.pages.inc', '', 0, '', 'a:0:{}'),
('batch', '', '', '1', 0x613a303a7b7d, 'system_batch_page', 0x613a303a7b7d, 1, 1, '', 'batch', '', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '_system_batch_theme', 'a:0:{}'),
('user', '', '', '1', 0x613a303a7b7d, 'user_page', 0x613a303a7b7d, 1, 1, '', 'user', 'User account', 'user_menu_title', '', 6, '', '', -10, 'modules/user/user.pages.inc', '', 0, '', 'a:0:{}'),
('admin/tasks', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 3, 2, 'admin', 'admin', 'Tasks', 't', '', 140, '', '', -20, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('user/login', '', '', 'user_is_anonymous', 0x613a303a7b7d, 'user_page', 0x613a303a7b7d, 3, 2, 'user', 'user', 'Log in', 't', '', 140, '', '', 0, 'modules/user/user.pages.inc', '', 1, '', 'a:0:{}'),
('toolbar/toggle', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320746f6f6c626172223b7d, 'toolbar_toggle_page', 0x613a303a7b7d, 3, 2, '', 'toolbar/toggle', 'Toggle drawer visibility', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('file/progress', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'file_ajax_progress', 0x613a303a7b7d, 3, 2, '', 'file/progress', '', 't', '', 0, '', '', 0, '', '', 0, 'ajax_base_page_theme', 'a:0:{}'),
('node/add', '', '', '_node_add_access', 0x613a303a7b7d, 'node_add_page', 0x613a303a7b7d, 3, 2, '', 'node/add', 'Add content', 't', '', 6, '', '', 0, 'modules/node/node.pages.inc', '', 0, '', 'a:0:{}'),
('taxonomy/autocomplete', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_autocomplete', 0x613a303a7b7d, 3, 2, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', 0, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc', '', 0, '', 'a:0:{}'),
('aggregator/categories', '', '', '_aggregator_has_categories', 0x613a303a7b7d, 'aggregator_page_categories', 0x613a303a7b7d, 3, 2, '', 'aggregator/categories', 'Categories', 't', '', 6, '', '', 0, 'modules/aggregator/aggregator.pages.inc', '', 0, '', 'a:0:{}'),
('comment/%', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261636365737320636f6d6d656e7473223b7d, 'comment_permalink', 0x613a313a7b693a303b693a313b7d, 2, 2, '', 'comment/%', 'Comment permalink', 't', '', 6, '', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/compact', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_compact_page', 0x613a303a7b7d, 3, 2, '', 'admin/compact', 'Compact mode', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('filter/tips', '', '', '1', 0x613a303a7b7d, 'filter_tips_long', 0x613a303a7b7d, 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', 0, 'modules/filter/filter.pages.inc', '', 0, '', 'a:0:{}'),
('user/register', '', '', 'user_register_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a22757365725f72656769737465725f666f726d223b7d, 3, 2, 'user', 'user', 'Create new account', 't', '', 132, '', '', 0, '', '', 1, '', 'a:0:{}'),
('admin/dashboard', '', '', 'user_access', 0x613a313a7b693a303b733a31363a226163636573732064617368626f617264223b7d, 'dashboard_admin', 0x613a303a7b7d, 3, 2, '', 'admin/dashboard', 'Dashboard', 't', '', 6, 'View and customize your dashboard.', '', -15, '', '', 0, '', 'a:0:{}'),
('system/files', '', '', '1', 0x613a303a7b7d, 'file_download', 0x613a313a7b693a303b733a373a2270726976617465223b7d, 3, 2, '', 'system/files', 'File download', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/index', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_index', 0x613a303a7b7d, 3, 2, 'admin', 'admin', 'Index', 't', '', 132, '', '', -18, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('aggregator/opml', '', '', 'user_access', 0x613a313a7b693a303b733a31373a22616363657373206e657773206665656473223b7d, 'aggregator_page_opml', 0x613a303a7b7d, 3, 2, '', 'aggregator/opml', 'OPML feed', 't', '', 0, '', '', 0, 'modules/aggregator/aggregator.pages.inc', '', 0, '', 'a:0:{}'),
('aggregator/rss', '', '', 'user_access', 0x613a313a7b693a303b733a31373a22616363657373206e657773206665656473223b7d, 'aggregator_page_rss', 0x613a303a7b7d, 3, 2, '', 'aggregator/rss', 'RSS feed', 't', '', 0, '', '', 0, 'modules/aggregator/aggregator.pages.inc', '', 0, '', 'a:0:{}'),
('aggregator/sources', '', '', 'user_access', 0x613a313a7b693a303b733a31373a22616363657373206e657773206665656473223b7d, 'aggregator_page_sources', 0x613a303a7b7d, 3, 2, '', 'aggregator/sources', 'Sources', 't', '', 6, '', '', 0, 'modules/aggregator/aggregator.pages.inc', '', 0, '', 'a:0:{}'),
('system/temporary', '', '', '1', 0x613a303a7b7d, 'file_download', 0x613a313a7b693a303b733a393a2274656d706f72617279223b7d, 3, 2, '', 'system/temporary', 'Temporary files', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('system/timezone', '', '', '1', 0x613a303a7b7d, 'system_timezone', 0x613a303a7b7d, 3, 2, '', 'system/timezone', 'Time zone', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('file/ajax', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'file_ajax_upload', 0x613a303a7b7d, 3, 2, '', 'file/ajax', '', 't', '', 0, '', '', 0, '', 'ajax_deliver', 0, 'ajax_base_page_theme', 'a:0:{}'),
('admin/config', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_config_page', 0x613a303a7b7d, 3, 2, '', 'admin/config', 'Configuration', 't', '', 6, 'Administer settings.', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_main', 0x613a303a7b7d, 3, 2, '', 'admin/help', 'Help', 't', '', 6, 'Reference for usage, configuration, and modules.', '', 9, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('user/logout', '', '', 'user_is_logged_in', 0x613a303a7b7d, 'user_logout', 0x613a303a7b7d, 3, 2, '', 'user/logout', 'Log out', 't', '', 6, '', '', 10, 'modules/user/user.pages.inc', '', 0, '', 'a:0:{}'),
('user/password', '', '', '1', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a393a22757365725f70617373223b7d, 3, 2, 'user', 'user', 'Request new password', 't', '', 132, '', '', 0, 'modules/user/user.pages.inc', '', 1, '', 'a:0:{}'),
('user/autocomplete', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261636365737320757365722070726f66696c6573223b7d, 'user_autocomplete', 0x613a303a7b7d, 3, 2, '', 'user/autocomplete', 'User autocomplete', 't', '', 0, '', '', 0, 'modules/user/user.pages.inc', '', 0, '', 'a:0:{}'),
('admin/appearance', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_themes_page', 0x613a303a7b7d, 3, 2, '', 'admin/appearance', 'Appearance', 't', '', 6, 'Select and configure your themes.', 'left', -6, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/content', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261636365737320636f6e74656e74206f76657276696577223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a226e6f64655f61646d696e5f636f6e74656e74223b7d, 3, 2, '', 'admin/content', 'Content', 't', '', 6, 'Administer content and comments.', '', -10, 'modules/node/node.admin.inc', '', 0, '', 'a:0:{}'),
('search/node', '', '', '_search_menu_access', 0x613a313a7b693a303b733a343a226e6f6465223b7d, 'search_view', 0x613a323a7b693a303b733a343a226e6f6465223b693a313b733a303a22223b7d, 3, 2, 'search', 'search', 'Content', 't', '', 132, '', '', -10, 'modules/search/search.pages.inc', '', 1, '', 'a:0:{}'),
('admin/modules', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, 3, 2, '', 'admin/modules', 'Modules', 't', '', 6, 'Extend site functionality.', '', -2, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 3, 2, '', 'admin/reports', 'Reports', 't', '', 6, 'View reports, updates, and errors.', 'left', 5, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 3, 2, '', 'admin/structure', 'Structure', 't', '', 6, 'Administer blocks, content types, menus, etc.', 'right', -8, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('search/user', '', '', '_search_menu_access', 0x613a313a7b693a303b733a343a2275736572223b7d, 'search_view', 0x613a323a7b693a303b733a343a2275736572223b693a313b733a303a22223b7d, 3, 2, 'search', 'search', 'Users', 't', '', 132, '', '', 0, 'modules/search/search.pages.inc', '', 1, '', 'a:0:{}'),
('node/%', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a313b7d, 'node_page_view', 0x613a313a7b693a303b693a313b7d, 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 6, '', '', 0, '', '', 0, '', 'a:0:{}'),
('system/ajax', '', '', '1', 0x613a303a7b7d, 'ajax_form_callback', 0x613a303a7b7d, 3, 2, '', 'system/ajax', 'AHAH callback', 't', '', 0, '', '', 0, 'includes/form.inc', 'ajax_deliver', 0, 'ajax_base_page_theme', 'a:0:{}'),
('admin/people', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a343a226c697374223b7d, 3, 2, '', 'admin/people', 'People', 't', '', 6, 'Manage user accounts, roles, and permissions.', 'left', -4, 'modules/user/user.admin.inc', '', 0, '', 'a:0:{}'),
('user/%', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_view_access', 0x613a313a7b693a303b693a313b7d, 'user_view_page', 0x613a313a7b693a303b693a313b7d, 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/content/node', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261636365737320636f6e74656e74206f76657276696577223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a226e6f64655f61646d696e5f636f6e74656e74223b7d, 7, 3, 'admin/content', 'admin/content', 'Content', 't', '', 140, '', '', -10, 'modules/node/node.admin.inc', '', 1, '', 'a:0:{}'),
('admin/modules/list', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, 7, 3, 'admin/modules', 'admin/modules', 'List', 't', '', 140, '', '', 0, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('node/%/view', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a313b7d, 'node_page_view', 0x613a313a7b693a303b693a313b7d, 5, 3, 'node/%', 'node/%', 'View', 't', '', 140, '', '', -10, '', '', 1, '', 'a:0:{}'),
('user/%/view', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_view_access', 0x613a313a7b693a303b693a313b7d, 'user_view_page', 0x613a313a7b693a303b693a313b7d, 5, 3, 'user/%', 'user/%', 'View', 't', '', 140, '', '', -10, '', '', 1, '', 'a:0:{}'),
('comment/%/view', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261636365737320636f6d6d656e7473223b7d, 'comment_permalink', 0x613a313a7b693a303b693a313b7d, 5, 3, 'comment/%', 'comment/%', 'View comment', 't', '', 140, '', '', -10, '', '', 1, '', 'a:0:{}'),
('admin/people/create', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a363a22637265617465223b7d, 7, 3, 'admin/people', 'admin/people', 'Add user', 't', '', 388, '', '', 0, 'modules/user/user.admin.inc', '', 1, '', 'a:0:{}'),
('admin/dashboard/drawer', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_show_disabled', 0x613a303a7b7d, 7, 3, '', 'admin/dashboard/drawer', '', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/appearance/list', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_themes_page', 0x613a303a7b7d, 7, 3, 'admin/appearance', 'admin/appearance', 'List', 't', '', 140, 'Select and configure your theme', '', -1, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/dashboard/update', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_update', 0x613a303a7b7d, 7, 3, '', 'admin/dashboard/update', '', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/dashboard/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_admin_blocks', 0x613a303a7b7d, 7, 3, '', 'admin/dashboard/configure', 'Configure available dashboard blocks', 't', '', 4, 'Configure which blocks can be shown on the dashboard.', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/appearance/disable', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_disable', 0x613a303a7b7d, 7, 3, '', 'admin/appearance/disable', 'Disable theme', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/appearance/enable', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_enable', 0x613a303a7b7d, 7, 3, '', 'admin/appearance/enable', 'Enable theme', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/people/people', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a343a226c697374223b7d, 7, 3, 'admin/people', 'admin/people', 'List', 't', '', 140, 'Find and manage people interacting with your site.', '', -10, 'modules/user/user.admin.inc', '', 1, '', 'a:0:{}'),
('admin/appearance/default', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_default', 0x613a303a7b7d, 7, 3, '', 'admin/appearance/default', 'Set default theme', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/modules/uninstall', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f6d6f64756c65735f756e696e7374616c6c223b7d, 7, 3, 'admin/modules', 'admin/modules', 'Uninstall', 't', '', 132, '', '', 20, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('aggregator/sources/%', 0x613a313a7b693a323b733a32303a2261676772656761746f725f666565645f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a22616363657373206e657773206665656473223b7d, 'aggregator_page_source', 0x613a313a7b693a303b693a323b7d, 6, 3, '', 'aggregator/sources/%', '', 't', '', 6, '', '', 0, 'modules/aggregator/aggregator.pages.inc', '', 0, '', 'a:0:{}'),
('comment/%/approve', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_approve', 0x613a313a7b693a303b693a313b7d, 5, 3, '', 'comment/%/approve', 'Approve', 't', '', 6, '', '', 1, 'modules/comment/comment.pages.inc', '', 0, '', 'a:0:{}'),
('admin/reports/updates', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_status', 0x613a303a7b7d, 7, 3, '', 'admin/reports/updates', 'Available updates', 't', '', 6, 'Get a status report about available updates for your installed modules and themes.', '', -50, 'modules/update/update.report.inc', '', 0, '', 'a:0:{}'),
('admin/content/comment', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a303a7b7d, 7, 3, 'admin/content', 'admin/content', 'Comments', 't', '', 134, 'List and edit site comments and the comment approval queue.', '', 0, 'modules/comment/comment.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/contact', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e7461637420666f726d73223b7d, 'contact_category_list', 0x613a303a7b7d, 7, 3, '', 'admin/structure/contact', 'Contact form', 't', '', 6, 'Create a system contact form and set up categories for the form to use.', '', 0, 'modules/contact/contact.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/types', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'node_overview_types', 0x613a303a7b7d, 7, 3, '', 'admin/structure/types', 'Content types', 't', '', 6, 'Manage content types, including default status, front page promotion, comment settings, etc.', '', 0, 'modules/node/content_types.inc', '', 0, '', 'a:0:{}'),
('admin/dashboard/customize', '', '', 'user_access', 0x613a313a7b693a303b733a31363a226163636573732064617368626f617264223b7d, 'dashboard_admin', 0x613a313a7b693a303b623a313b7d, 7, 3, '', 'admin/dashboard/customize', 'Customize dashboard', 't', '', 4, 'Customize your dashboard.', '', 0, '', '', 0, '', 'a:0:{}'),
('comment/%/delete', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_confirm_delete_page', 0x613a313a7b693a303b693a313b7d, 5, 3, 'comment/%', 'comment/%', 'Delete', 't', '', 132, '', '', 2, 'modules/comment/comment.admin.inc', '', 1, '', 'a:0:{}'),
('comment/%/edit', 0x613a313a7b693a313b733a31323a22636f6d6d656e745f6c6f6164223b7d, '', 'comment_access', 0x613a323a7b693a303b733a343a2265646974223b693a313b693a313b7d, 'comment_edit_page', 0x613a313a7b693a303b693a313b7d, 5, 3, 'comment/%', 'comment/%', 'Edit', 't', '', 132, '', '', 0, '', '', 1, '', 'a:0:{}'),
('admin/reports/fields', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'field_ui_fields_list', 0x613a303a7b7d, 7, 3, '', 'admin/reports/fields', 'Field list', 't', '', 6, 'Overview of fields on all entity types.', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/dblog', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_overview', 0x613a303a7b7d, 7, 3, '', 'admin/reports/dblog', 'Recent log messages', 't', '', 6, 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/status', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_status', 0x613a303a7b7d, 7, 3, '', 'admin/reports/status', 'Status report', 't', '', 6, 'Get a status report about your site''s operation and any detected problems.', '', -60, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/aggregator', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/aggregator', 'aggregator', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/block', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/block', 'block', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/color', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/color', 'color', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/comment', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/comment', 'comment', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/contact', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/contact', 'contact', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/contextual', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/contextual', 'contextual', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/dashboard', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/dashboard', 'dashboard', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/dblog', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/dblog', 'dblog', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/field', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/field', 'field', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/field_sql_storage', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/field_sql_storage', 'field_sql_storage', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/field_ui', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/field_ui', 'field_ui', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/file', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/file', 'file', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/filter', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/filter', 'filter', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/help', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/help', 'help', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/list', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/list', 'list', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/menu', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/menu', 'menu', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/node', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/node', 'node', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/number', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/number', 'number', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/options', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/options', 'options', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/php', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/php', 'php', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/search', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/search', 'search', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/superfish', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/superfish', 'superfish', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/system', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/system', 'system', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/taxonomy', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/taxonomy', 'taxonomy', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/text', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/text', 'text', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/toolbar', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/toolbar', 'toolbar', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/update', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/update', 'update', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('admin/help/user', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, 7, 3, '', 'admin/help/user', 'user', 't', '', 4, '', '', 0, 'modules/help/help.admin.inc', '', 0, '', 'a:0:{}'),
('comment/reply/%', 0x613a313a7b693a323b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a323b7d, 'comment_reply', 0x613a313a7b693a303b693a323b7d, 6, 3, '', 'comment/reply/%', 'Add new comment', 't', '', 6, '', '', 0, 'modules/comment/comment.pages.inc', '', 0, '', 'a:0:{}'),
('admin/structure/block', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'block_admin_display', 0x613a313a7b693a303b733a31313a22626c75656d617374657273223b7d, 7, 3, '', 'admin/structure/block', 'Blocks', 't', '', 6, 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc', '', 0, '', 'a:0:{}'),
('admin/modules/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a363a226d6f64756c65223b7d, 7, 3, 'admin/modules', 'admin/modules', 'Install new module', 't', '', 388, '', '', 25, 'modules/update/update.manager.inc', '', 1, '', 'a:0:{}'),
('admin/appearance/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a353a227468656d65223b7d, 7, 3, 'admin/appearance', 'admin/appearance', 'Install new theme', 't', '', 388, '', '', 25, 'modules/update/update.manager.inc', '', 1, '', 'a:0:{}'),
('admin/modules/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a363a226d6f64756c65223b7d, 7, 3, 'admin/modules', 'admin/modules', 'Update', 't', '', 132, '', '', 10, 'modules/update/update.manager.inc', '', 1, '', 'a:0:{}'),
('admin/appearance/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a353a227468656d65223b7d, 7, 3, 'admin/appearance', 'admin/appearance', 'Update', 't', '', 132, '', '', 10, 'modules/update/update.manager.inc', '', 1, '', 'a:0:{}'),
('user/%/cancel', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_cancel_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a22757365725f63616e63656c5f636f6e6669726d5f666f726d223b693a313b693a313b7d, 5, 3, '', 'user/%/cancel', 'Cancel account', 't', '', 6, '', '', 0, 'modules/user/user.pages.inc', '', 0, '', 'a:0:{}'),
('user/%/contact', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', '_contact_personal_tab_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a22636f6e746163745f706572736f6e616c5f666f726d223b693a313b693a313b7d, 5, 3, 'user/%', 'user/%', 'Contact', 't', '', 132, '', '', 2, 'modules/contact/contact.pages.inc', '', 1, '', 'a:0:{}'),
('admin/config/content', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/content', 'Content authoring', 't', '', 6, 'Settings related to formatting and authoring content.', 'left', -15, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/development', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/development', 'Development', 't', '', 6, 'Development tools.', 'right', -10, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('user/%/edit', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_edit_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31373a22757365725f70726f66696c655f666f726d223b693a313b693a313b7d, 5, 3, 'user/%', 'user/%', 'Edit', 't', '', 132, '', '', 0, 'modules/user/user.pages.inc', '', 1, '', 'a:0:{}'),
('admin/config/media', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/media', 'Media', 't', '', 6, 'Media tools.', 'left', -10, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/menu', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_overview_page', 0x613a303a7b7d, 7, 3, '', 'admin/structure/menu', 'Menus', 't', '', 6, 'Add new menus to your site, edit existing menus, and rename and reorganize menu links.', '', 0, 'modules/menu/menu.admin.inc', '', 0, '', 'a:0:{}'),
('admin/people/permissions', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a22757365725f61646d696e5f7065726d697373696f6e73223b7d, 7, 3, 'admin/people', 'admin/people', 'Permissions', 't', '', 132, 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc', '', 1, '', 'a:0:{}'),
('admin/update/ready', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a227570646174655f6d616e616765725f7570646174655f72656164795f666f726d223b7d, 7, 3, '', 'admin/update/ready', 'Ready to update', 't', '', 0, '', '', 0, 'modules/update/update.manager.inc', '', 0, '', 'a:0:{}'),
('admin/config/regional', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/regional', 'Regional and language', 't', '', 6, 'Regional settings, localization and translation.', 'left', -5, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('node/%/revisions', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', '_node_revision_access', 0x613a313a7b693a303b693a313b7d, 'node_revision_overview', 0x613a313a7b693a303b693a313b7d, 5, 3, 'node/%', 'node/%', 'Revisions', 't', '', 132, '', '', 2, 'modules/node/node.pages.inc', '', 1, '', 'a:0:{}'),
('admin/config/search', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/search', 'Search and metadata', 't', '', 6, 'Local site search, metadata and SEO.', 'left', -10, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/appearance/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b7d, 7, 3, 'admin/appearance', 'admin/appearance', 'Settings', 't', '', 132, 'Configure default and theme specific settings.', '', 20, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/system', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/system', 'System', 't', '', 6, 'General system related configuration.', 'right', -20, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/taxonomy', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a227461786f6e6f6d795f6f766572766965775f766f636162756c6172696573223b7d, 7, 3, '', 'admin/structure/taxonomy', 'Taxonomy', 't', '', 6, 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/access-denied', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a31333a226163636573732064656e696564223b7d, 7, 3, '', 'admin/reports/access-denied', 'Top ''access denied'' errors', 't', '', 6, 'View ''access denied'' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/page-not-found', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a31343a2270616765206e6f7420666f756e64223b7d, 7, 3, '', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 't', '', 6, 'View ''page not found'' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/search', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a363a22736561726368223b7d, 7, 3, '', 'admin/reports/search', 'Top search phrases', 't', '', 6, 'View most popular search phrases.', '', 0, 'modules/dblog/dblog.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/user-interface', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/user-interface', 'User interface', 't', '', 6, 'Tools that enhance the user interface.', 'right', -15, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/services', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/services', 'Web services', 't', '', 6, 'Tools related to web services.', 'right', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/workflow', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/workflow', 'Workflow', 't', '', 6, 'Content workflow, editorial workflow tools.', 'right', 5, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('node/%/edit', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a313b7d, 'node_page_edit', 0x613a313a7b693a303b693a313b7d, 5, 3, 'node/%', 'node/%', 'Edit', 't', '', 132, '', '', 0, 'modules/node/node.pages.inc', '', 3, '', 'a:0:{}'),
('aggregator/categories/%', 0x613a313a7b693a323b733a32343a2261676772656761746f725f63617465676f72795f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a22616363657373206e657773206665656473223b7d, 'aggregator_page_category', 0x613a313a7b693a303b693a323b7d, 6, 3, '', 'aggregator/categories/%', '', '_aggregator_category_title', 'a:1:{i:0;i:2;}', 6, '', '', 0, 'modules/aggregator/aggregator.pages.inc', '', 0, '', 'a:0:{}'),
('node/%/delete', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a363a2264656c657465223b693a313b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31393a226e6f64655f64656c6574655f636f6e6669726d223b693a313b693a313b7d, 5, 3, 'node/%', 'node/%', 'Delete', 't', '', 132, '', '', 1, 'modules/node/node.pages.inc', '', 2, '', 'a:0:{}'),
('admin/config/people', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, 7, 3, '', 'admin/config/people', 'People', 't', '', 6, 'Configure user accounts.', 'left', -20, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('taxonomy/term/%', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_page', 0x613a313a7b693a303b693a323b7d, 6, 3, '', 'taxonomy/term/%', 'Taxonomy term', 'taxonomy_term_title', 'a:1:{i:0;i:2;}', 6, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc', '', 0, '', 'a:0:{}'),
('node/add/page', '', '', 'node_access', 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a343a2270616765223b7d, 'node_add', 0x613a313a7b693a303b733a343a2270616765223b7d, 7, 3, '', 'node/add/page', 'Page', 'check_plain', '', 6, 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 0, 'modules/node/node.pages.inc', '', 0, '', 'a:0:{}'),
('node/add/story', '', '', 'node_access', 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a353a2273746f7279223b7d, 'node_add', 0x613a313a7b693a303b733a353a2273746f7279223b7d, 7, 3, '', 'node/add/story', 'Story', 'check_plain', '', 6, 'A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.', '', 0, 'modules/node/node.pages.inc', '', 0, '', 'a:0:{}'),
('search/node/%', 0x613a313a7b693a323b613a313a7b733a31343a226d656e755f7461696c5f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, 0x613a313a7b693a323b733a31363a226d656e755f7461696c5f746f5f617267223b7d, '_search_menu_access', 0x613a313a7b693a303b733a343a226e6f6465223b7d, 'search_view', 0x613a323a7b693a303b733a343a226e6f6465223b693a313b693a323b7d, 6, 3, 'search/node', 'search/node/%', 'Content', 't', '', 132, '', '', 0, 'modules/search/search.pages.inc', '', 1, '', 'a:0:{}'),
('search/user/%', 0x613a313a7b693a323b613a313a7b733a31343a226d656e755f7461696c5f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, 0x613a313a7b693a323b733a31363a226d656e755f7461696c5f746f5f617267223b7d, '_search_menu_access', 0x613a313a7b693a303b733a343a2275736572223b7d, 'search_view', 0x613a323a7b693a303b733a343a2275736572223b693a313b693a323b7d, 6, 3, 'search/node', 'search/node/%', 'Users', 't', '', 132, '', '', 0, 'modules/search/search.pages.inc', '', 1, '', 'a:0:{}'),
('admin/appearance/settings/global', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b7d, 15, 4, 'admin/appearance/settings', 'admin/appearance', 'Global settings', 't', '', 140, '', '', -1, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/list', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'node_overview_types', 0x613a303a7b7d, 15, 4, 'admin/structure/types', 'admin/structure/types', 'List', 't', '', 140, '', '', -10, 'modules/node/content_types.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/list', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a227461786f6e6f6d795f6f766572766965775f766f636162756c6172696573223b7d, 15, 4, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'List', 't', '', 140, '', '', -10, 'modules/taxonomy/taxonomy.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/menu/list', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_overview_page', 0x613a303a7b7d, 15, 4, 'admin/structure/menu', 'admin/structure/menu', 'List menus', 't', '', 140, '', '', -10, 'modules/menu/menu.admin.inc', '', 1, '', 'a:0:{}'),
('admin/content/comment/new', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a303a7b7d, 15, 4, 'admin/content/comment', 'admin/content', 'Published comments', 't', '', 140, '', '', -10, 'modules/comment/comment.admin.inc', '', 1, '', 'a:0:{}'),
('aggregator/categories/%/view', 0x613a313a7b693a323b733a32343a2261676772656761746f725f63617465676f72795f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a22616363657373206e657773206665656473223b7d, 'aggregator_page_category', 0x613a313a7b693a303b693a323b7d, 13, 4, 'aggregator/categories/%', 'aggregator/categories/%', 'View', 't', '', 140, '', '', -10, 'modules/aggregator/aggregator.pages.inc', '', 1, '', 'a:0:{}'),
('aggregator/sources/%/view', 0x613a313a7b693a323b733a32303a2261676772656761746f725f666565645f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a22616363657373206e657773206665656473223b7d, 'aggregator_page_source', 0x613a313a7b693a303b693a323b7d, 13, 4, 'aggregator/sources/%', 'aggregator/sources/%', 'View', 't', '', 140, '', '', -10, 'modules/aggregator/aggregator.pages.inc', '', 1, '', 'a:0:{}'),
('taxonomy/term/%/view', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_page', 0x613a313a7b693a303b693a323b7d, 13, 4, 'taxonomy/term/%', 'taxonomy/term/%', 'View', 't', '', 140, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc', '', 1, '', 'a:0:{}'),
('user/%/edit/account', 0x613a313a7b693a313b613a313a7b733a31383a22757365725f63617465676f72795f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, '', 'user_edit_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31373a22757365725f70726f66696c655f666f726d223b693a313b693a313b7d, 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 140, '', '', 0, 'modules/user/user.pages.inc', '', 1, '', 'a:0:{}'),
('admin/modules/list/confirm', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, 15, 4, '', 'admin/modules/list/confirm', 'List', 't', '', 4, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/updates/list', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_status', 0x613a303a7b7d, 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', 140, '', '', 0, 'modules/update/update.report.inc', '', 1, '', 'a:0:{}'),
('admin/people/permissions/list', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a22757365725f61646d696e5f7065726d697373696f6e73223b7d, 15, 4, 'admin/people/permissions', 'admin/people', 'Permissions', 't', '', 140, 'Determine access to features by selecting permissions for roles.', '', -8, 'modules/user/user.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/menu/parents', '', '', 'user_access', 0x613a313a7b693a303b623a313b7d, 'menu_parent_options_js', 0x613a303a7b7d, 15, 4, '', 'admin/structure/menu/parents', 'Parent menu items', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/modules/uninstall/confirm', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f6d6f64756c65735f756e696e7374616c6c223b7d, 15, 4, '', 'admin/modules/uninstall/confirm', 'Uninstall', 't', '', 4, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/updates/check', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_manual_status', 0x613a303a7b7d, 15, 4, '', 'admin/reports/updates/check', 'Manual update check', 't', '', 0, '', '', 0, 'modules/update/update.fetch.inc', '', 0, '', 'a:0:{}'),
('admin/reports/status/php', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_php', 0x613a303a7b7d, 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/status/run-cron', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_run_cron', 0x613a303a7b7d, 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `description`, `position`, `weight`, `include_file`, `delivery_callback`, `context`, `theme_callback`, `theme_arguments`) VALUES
('admin/content/comment/approval', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a313a7b693a303b733a383a22617070726f76616c223b7d, 15, 4, 'admin/content/comment', 'admin/content', 'Unapproved comments', 'comment_count_unpublished', '', 132, '', '', 0, 'modules/comment/comment.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/system/actions', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_manage', 0x613a303a7b7d, 15, 4, '', 'admin/config/system/actions', 'Actions', 't', '', 6, 'Manage the actions defined for your site.', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/block/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, 15, 4, 'admin/structure/block', 'admin/structure/block', 'Add block', 't', '', 388, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/contact/add', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e7461637420666f726d73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32363a22636f6e746163745f63617465676f72795f656469745f666f726d223b7d, 15, 4, 'admin/structure/contact', 'admin/structure/contact', 'Add category', 't', '', 388, '', '', 1, 'modules/contact/contact.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/add', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a226e6f64655f747970655f666f726d223b7d, 15, 4, 'admin/structure/types', 'admin/structure/types', 'Add content type', 't', '', 388, '', '', 0, 'modules/node/content_types.inc', '', 1, '', 'a:0:{}'),
('admin/structure/menu/add', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226d656e755f656469745f6d656e75223b693a313b733a333a22616464223b7d, 15, 4, 'admin/structure/menu', 'admin/structure/menu', 'Add menu', 't', '', 388, '', '', 0, 'modules/menu/menu.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/add', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a227461786f6e6f6d795f666f726d5f766f636162756c617279223b7d, 15, 4, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Add vocabulary', 't', '', 388, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc', '', 1, '', 'a:0:{}'),
('admin/appearance/settings/bartik', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a363a2262617274696b223b7d, 15, 4, 'admin/appearance/settings', 'admin/appearance', 'Bartik', 't', '', 132, '', '', 0, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/appearance/settings/bluemasters', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a34353a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f626c75656d6173746572732e696e666f223b733a343a226e616d65223b733a31313a22626c75656d617374657273223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a31323a22426c7565204d617374657273223b733a31313a226465736372697074696f6e223b733a34303a225468656d65206261736564206f6e20426c7565204d617374657273205053442074656d706c617465223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a343a22636f7265223b733a333a22372e78223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a343a7b733a32363a22616c6c20616e6420286d696e2d77696474683a20393830707829223b613a313a7b733a31313a226373732f3936302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3936302e637373223b7d733a34393a22616c6c20616e6420286d696e2d77696474683a2037363070782920616e6420286d61782d77696474683a20393739707829223b613a313a7b733a31313a226373732f3732302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3732302e637373223b7d733a32363a22616c6c20616e6420286d61782d77696474683a20373539707829223b613a313a7b733a31343a226373732f6d6f62696c652e637373223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f6d6f62696c652e637373223b7d733a333a22616c6c223b613a313a7b733a31333a226373732f7374796c652e637373223b733a34323a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f7374796c652e637373223b7d7d733a373a22726567696f6e73223b613a32333a7b733a363a22686561646572223b733a363a22486561646572223b733a31313a227365617263685f61726561223b733a31313a225365617263682061726561223b733a31303a226e617669676174696f6e223b733a31303a224e617669676174696f6e223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172204669727374223b733a363a2262616e6e6572223b733a363a2242616e6e6572223b733a31313a22686f6d655f617265615f31223b733a31313a22486f6d6520617265612031223b733a31313a22686f6d655f617265615f32223b733a31313a22486f6d6520617265612032223b733a31313a22686f6d655f617265615f33223b733a31313a22486f6d6520617265612033223b733a31333a22686f6d655f617265615f335f62223b733a31333a22486f6d65206172656120332062223b733a31333a22666f6f7465725f6c6566745f31223b733a31333a22466f6f746572206c6566742031223b733a31333a22666f6f7465725f6c6566745f32223b733a31333a22466f6f746572206c6566742032223b733a31333a22666f6f7465725f63656e746572223b733a31333a22466f6f7465722063656e746572223b733a31323a22666f6f7465725f7269676874223b733a31323a22466f6f746572207269676874223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31333a22666f6f7465725f626f74746f6d223b733a31333a22466f6f74657220426f74746f6d223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a31313a7b733a31383a22726573706f6e736976655f726573706f6e64223b733a313a2230223b733a31353a22726573706f6e736976655f6d657461223b733a313a2231223b733a31373a22736c69646573686f775f646973706c6179223b733a313a2231223b733a31323a22736c69646573686f775f6a73223b733a313a2231223b733a31363a22736c69646573686f775f656666656374223b733a353a22736c696465223b733a32313a22736c69646573686f775f6566666563745f74696d65223b733a313a2235223b733a32343a22736c69646573686f775f616e696d6174696f6e5f74696d65223b733a333a22302e35223b733a31363a22736c69646573686f775f72616e646f6d223b733a313a2230223b733a31383a22736c69646573686f775f636f6e74726f6c73223b733a313a2231223b733a31353a22736c69646573686f775f7061757365223b733a313a2231223b733a31353a22736c69646573686f775f746f756368223b733a313a2231223b7d733a373a2270726f6a656374223b733a31313a22626c75656d617374657273223b733a393a22646174657374616d70223b733a31303a2231333231333531383335223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a343a7b733a32363a22616c6c20616e6420286d696e2d77696474683a20393830707829223b613a313a7b733a31313a226373732f3936302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3936302e637373223b7d733a34393a22616c6c20616e6420286d696e2d77696474683a2037363070782920616e6420286d61782d77696474683a20393739707829223b613a313a7b733a31313a226373732f3732302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3732302e637373223b7d733a32363a22616c6c20616e6420286d61782d77696474683a20373539707829223b613a313a7b733a31343a226373732f6d6f62696c652e637373223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f6d6f62696c652e637373223b7d733a333a22616c6c223b613a313a7b733a31333a226373732f7374796c652e637373223b733a34323a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a31313a22626c75656d617374657273223b7d, 15, 4, 'admin/appearance/settings', 'admin/appearance', 'Blue Masters', 't', '', 132, '', '', 0, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('aggregator/categories/%/categorize', 0x613a313a7b693a323b733a32343a2261676772656761746f725f63617465676f72795f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32393a2261676772656761746f725f706167655f63617465676f72795f666f726d223b693a313b693a323b7d, 13, 4, 'aggregator/categories/%', 'aggregator/categories/%', 'Categorize', 't', '', 132, '', '', 0, 'modules/aggregator/aggregator.pages.inc', '', 1, '', 'a:0:{}'),
('aggregator/sources/%/categorize', 0x613a313a7b693a323b733a32303a2261676772656761746f725f666565645f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a2261676772656761746f725f706167655f736f757263655f666f726d223b693a313b693a323b7d, 13, 4, 'aggregator/sources/%', 'aggregator/sources/%', 'Categorize', 't', '', 132, '', '', 0, 'modules/aggregator/aggregator.pages.inc', '', 1, '', 'a:0:{}'),
('aggregator/categories/%/configure', 0x613a313a7b693a323b733a32343a2261676772656761746f725f63617465676f72795f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a2261676772656761746f725f666f726d5f63617465676f7279223b693a313b693a323b7d, 13, 4, 'aggregator/categories/%', 'aggregator/categories/%', 'Configure', 't', '', 132, '', '', 1, 'modules/aggregator/aggregator.admin.inc', '', 1, '', 'a:0:{}'),
('aggregator/sources/%/configure', 0x613a313a7b693a323b733a32303a2261676772656761746f725f666565645f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2261676772656761746f725f666f726d5f66656564223b693a313b693a323b7d, 13, 4, 'aggregator/sources/%', 'aggregator/sources/%', 'Configure', 't', '', 132, '', '', 1, 'modules/aggregator/aggregator.admin.inc', '', 1, '', 'a:0:{}'),
('admin/reports/event/%', 0x613a313a7b693a333b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_event', 0x613a313a7b693a303b693a333b7d, 14, 4, '', 'admin/reports/event/%', 'Details', 't', '', 6, '', '', 0, 'modules/dblog/dblog.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/services/aggregator', '', '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'aggregator_admin_overview', 0x613a303a7b7d, 15, 4, '', 'admin/config/services/aggregator', 'Feed aggregator', 't', '', 6, 'Configure which content your site aggregates from other sites, how often it polls them, and how they''re categorized.', '', 10, 'modules/aggregator/aggregator.admin.inc', '', 0, '', 'a:0:{}'),
('admin/appearance/settings/garland', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a373a226761726c616e64223b7d, 15, 4, 'admin/appearance/settings', 'admin/appearance', 'Garland', 't', '', 132, '', '', 0, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/ip-blocking', '', '', 'user_access', 0x613a313a7b693a303b733a31383a22626c6f636b20495020616464726573736573223b7d, 'system_ip_blocking', 0x613a303a7b7d, 15, 4, '', 'admin/config/people/ip-blocking', 'IP address blocking', 't', '', 6, 'Manage blocked IP addresses.', '', 10, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/status/rebuild', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a226e6f64655f636f6e6669677572655f72656275696c645f636f6e6669726d223b7d, 15, 4, '', 'admin/reports/status/rebuild', 'Rebuild permissions', 't', '', 0, '', '', 0, 'modules/node/node.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/menu/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a226d656e755f636f6e666967757265223b7d, 15, 4, 'admin/structure/menu', 'admin/structure/menu', 'Settings', 't', '', 132, '', '', 5, 'modules/menu/menu.admin.inc', '', 1, '', 'a:0:{}'),
('admin/reports/updates/settings', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31353a227570646174655f73657474696e6773223b7d, 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', 132, '', '', 50, 'modules/update/update.settings.inc', '', 1, '', 'a:0:{}'),
('admin/appearance/settings/seven', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a353a22736576656e223b7d, 15, 4, 'admin/appearance/settings', 'admin/appearance', 'Seven', 't', '', 132, '', '', 0, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/appearance/settings/stark', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a353a22737461726b223b7d, 15, 4, 'admin/appearance/settings', 'admin/appearance', 'Stark', 't', '', 132, '', '', 0, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31393a22757365725f61646d696e5f73657474696e6773223b7d, 15, 4, '', 'admin/config/people/accounts', 'Account settings', 't', '', 6, 'Configure default behavior of users, including registration requirements, e-mails, fields, and user pictures.', '', -10, 'modules/user/user.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/search/clean-urls', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f636c65616e5f75726c5f73657474696e6773223b7d, 15, 4, '', 'admin/config/search/clean-urls', 'Clean URLs', 't', '', 6, 'Enable or disable clean URLs for your site.', '', 5, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/system/cron', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2273797374656d5f63726f6e5f73657474696e6773223b7d, 15, 4, '', 'admin/config/system/cron', 'Cron', 't', '', 6, 'Manage automatic site maintenance tasks.', '', 20, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/regional/date-time', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f646174655f74696d655f73657474696e6773223b7d, 15, 4, '', 'admin/config/regional/date-time', 'Date and time', 't', '', 6, 'Configure display formats for date and time.', '', -15, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('taxonomy/term/%/edit', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'taxonomy_term_edit_access', 0x613a313a7b693a303b693a323b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31383a227461786f6e6f6d795f666f726d5f7465726d223b693a313b693a323b693a323b4e3b7d, 13, 4, 'taxonomy/term/%', 'taxonomy/term/%', 'Edit', 't', '', 132, '', '', 10, 'modules/taxonomy/taxonomy.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/media/file-system', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32373a2273797374656d5f66696c655f73797374656d5f73657474696e6773223b7d, 15, 4, '', 'admin/config/media/file-system', 'File system', 't', '', 6, 'Tell Drupal where to store uploaded files and how they are accessed.', '', -10, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/media/image-toolkit', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32393a2273797374656d5f696d6167655f746f6f6c6b69745f73657474696e6773223b7d, 15, 4, '', 'admin/config/media/image-toolkit', 'Image toolkit', 't', '', 6, 'Choose which image toolkit to use if you have installed optional toolkits.', '', 20, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/updates/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a363a227265706f7274223b7d, 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'Install new module or theme', 't', '', 388, '', '', 25, 'modules/update/update.manager.inc', '', 1, '', 'a:0:{}'),
('admin/config/development/logging', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32333a2273797374656d5f6c6f6767696e675f73657474696e6773223b7d, 15, 4, '', 'admin/config/development/logging', 'Logging and errors', 't', '', 6, 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destinations, such as syslog, database, email, etc.', '', -15, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/development/maintenance', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32383a2273797374656d5f736974655f6d61696e74656e616e63655f6d6f6465223b7d, 15, 4, '', 'admin/config/development/maintenance', 'Maintenance mode', 't', '', 6, 'Take the site offline for maintenance or bring it back online.', '', -10, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/development/performance', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32373a2273797374656d5f706572666f726d616e63655f73657474696e6773223b7d, 15, 4, '', 'admin/config/development/performance', 'Performance', 't', '', 6, 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', -20, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/services/rss-publishing', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f7273735f66656564735f73657474696e6773223b7d, 15, 4, '', 'admin/config/services/rss-publishing', 'RSS publishing', 't', '', 6, 'Configure the site description, the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/regional/settings', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f726567696f6e616c5f73657474696e6773223b7d, 15, 4, '', 'admin/config/regional/settings', 'Regional settings', 't', '', 6, 'Settings for the site''s default time zone and country.', '', -20, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/people/permissions/roles', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31363a22757365725f61646d696e5f726f6c6573223b7d, 15, 4, 'admin/people/permissions', 'admin/people', 'Roles', 't', '', 132, 'List, edit, or add user roles.', '', -5, 'modules/user/user.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/search/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220736561726368223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a227365617263685f61646d696e5f73657474696e6773223b7d, 15, 4, '', 'admin/config/search/settings', 'Search settings', 't', '', 6, 'Configure relevance settings for search and other indexing options.', '', -10, 'modules/search/search.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/system/site-information', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2273797374656d5f736974655f696e666f726d6174696f6e5f73657474696e6773223b7d, 15, 4, '', 'admin/config/system/site-information', 'Site information', 't', '', 6, 'Change site name, e-mail address, slogan, default front page, and number of posts per page, error pages.', '', -20, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/user-interface/superfish', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a227375706572666973685f61646d696e5f73657474696e6773223b7d, 15, 4, '', 'admin/config/user-interface/superfish', 'Superfish', 't', '', 6, 'Configure Superfish Menus', '', 0, 'sites/all/modules/superfish/superfish.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/content/formats', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2266696c7465725f61646d696e5f6f76657276696577223b7d, 15, 4, '', 'admin/config/content/formats', 'Text formats', 't', '', 6, 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc', '', 0, '', 'a:0:{}'),
('admin/reports/updates/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a363a227265706f7274223b7d, 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'Update', 't', '', 132, '', '', 10, 'modules/update/update.manager.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/%', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a227461786f6e6f6d795f6f766572766965775f7465726d73223b693a313b693a333b7d, 14, 4, '', 'admin/structure/taxonomy/%', '', 'entity_label', 'a:2:{i:0;s:19:"taxonomy_vocabulary";i:1;i:3;}', 6, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc', '', 0, '', 'a:0:{}'),
('taxonomy/term/%/feed', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_feed', 0x613a313a7b693a303b693a323b7d, 13, 4, '', 'taxonomy/term/%/feed', 'Taxonomy term', 'taxonomy_term_title', 'a:1:{i:0;i:2;}', 0, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc', '', 0, '', 'a:0:{}'),
('admin/structure/taxonomy/%/list', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a227461786f6e6f6d795f6f766572766965775f7465726d73223b693a313b693a333b7d, 29, 5, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'List', 't', '', 140, '', '', -20, 'modules/taxonomy/taxonomy.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/services/aggregator/list', '', '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'aggregator_admin_overview', 0x613a303a7b7d, 31, 5, 'admin/config/services/aggregator', 'admin/config/services/aggregator', 'List', 't', '', 140, '', '', -10, 'modules/aggregator/aggregator.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/content/formats/list', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2266696c7465725f61646d696e5f6f76657276696577223b7d, 31, 5, 'admin/config/content/formats', 'admin/config/content/formats', 'List', 't', '', 140, '', '', 0, 'modules/filter/filter.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31393a22757365725f61646d696e5f73657474696e6773223b7d, 31, 5, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Settings', 't', '', 140, '', '', -10, 'modules/user/user.admin.inc', '', 1, '', 'a:0:{}'),
('admin/dashboard/block-content/%/%', 0x613a323a7b693a333b4e3b693a343b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_show_block_content', 0x613a323a7b693a303b693a333b693a313b693a343b7d, 28, 5, '', 'admin/dashboard/block-content/%/%', '', 't', '', 0, '', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/config/content/formats/add', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'filter_admin_format_page', 0x613a303a7b7d, 31, 5, 'admin/config/content/formats', 'admin/config/content/formats', 'Add text format', 't', '', 388, '', '', 1, 'modules/filter/filter.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/system/actions/manage', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_manage', 0x613a303a7b7d, 31, 5, 'admin/config/system/actions', 'admin/config/system/actions', 'Manage actions', 't', '', 140, 'Manage the actions defined for your site.', '', -2, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/system/actions/orphan', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_remove_orphans', 0x613a303a7b7d, 31, 5, '', 'admin/config/system/actions/orphan', 'Remove orphans', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/taxonomy/%/add', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31383a227461786f6e6f6d795f666f726d5f7465726d223b693a313b613a303a7b7d693a323b693a333b7d, 29, 5, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Add term', 't', '', 388, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc', '', 1, '', 'a:0:{}');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `description`, `position`, `weight`, `include_file`, `delivery_callback`, `context`, `theme_callback`, `theme_arguments`) VALUES
('admin/structure/block/list/bartik', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a363a2262617274696b223b7d, 31, 5, 'admin/structure/block', 'admin/structure/block', 'Bartik', 't', '', 132, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/block/list/bluemasters', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a34353a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f626c75656d6173746572732e696e666f223b733a343a226e616d65223b733a31313a22626c75656d617374657273223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a31323a22426c7565204d617374657273223b733a31313a226465736372697074696f6e223b733a34303a225468656d65206261736564206f6e20426c7565204d617374657273205053442074656d706c617465223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a343a22636f7265223b733a333a22372e78223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a343a7b733a32363a22616c6c20616e6420286d696e2d77696474683a20393830707829223b613a313a7b733a31313a226373732f3936302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3936302e637373223b7d733a34393a22616c6c20616e6420286d696e2d77696474683a2037363070782920616e6420286d61782d77696474683a20393739707829223b613a313a7b733a31313a226373732f3732302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3732302e637373223b7d733a32363a22616c6c20616e6420286d61782d77696474683a20373539707829223b613a313a7b733a31343a226373732f6d6f62696c652e637373223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f6d6f62696c652e637373223b7d733a333a22616c6c223b613a313a7b733a31333a226373732f7374796c652e637373223b733a34323a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f7374796c652e637373223b7d7d733a373a22726567696f6e73223b613a32333a7b733a363a22686561646572223b733a363a22486561646572223b733a31313a227365617263685f61726561223b733a31313a225365617263682061726561223b733a31303a226e617669676174696f6e223b733a31303a224e617669676174696f6e223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172204669727374223b733a363a2262616e6e6572223b733a363a2242616e6e6572223b733a31313a22686f6d655f617265615f31223b733a31313a22486f6d6520617265612031223b733a31313a22686f6d655f617265615f32223b733a31313a22486f6d6520617265612032223b733a31313a22686f6d655f617265615f33223b733a31313a22486f6d6520617265612033223b733a31333a22686f6d655f617265615f335f62223b733a31333a22486f6d65206172656120332062223b733a31333a22666f6f7465725f6c6566745f31223b733a31333a22466f6f746572206c6566742031223b733a31333a22666f6f7465725f6c6566745f32223b733a31333a22466f6f746572206c6566742032223b733a31333a22666f6f7465725f63656e746572223b733a31333a22466f6f7465722063656e746572223b733a31323a22666f6f7465725f7269676874223b733a31323a22466f6f746572207269676874223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31333a22666f6f7465725f626f74746f6d223b733a31333a22466f6f74657220426f74746f6d223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a31313a7b733a31383a22726573706f6e736976655f726573706f6e64223b733a313a2230223b733a31353a22726573706f6e736976655f6d657461223b733a313a2231223b733a31373a22736c69646573686f775f646973706c6179223b733a313a2231223b733a31323a22736c69646573686f775f6a73223b733a313a2231223b733a31363a22736c69646573686f775f656666656374223b733a353a22736c696465223b733a32313a22736c69646573686f775f6566666563745f74696d65223b733a313a2235223b733a32343a22736c69646573686f775f616e696d6174696f6e5f74696d65223b733a333a22302e35223b733a31363a22736c69646573686f775f72616e646f6d223b733a313a2230223b733a31383a22736c69646573686f775f636f6e74726f6c73223b733a313a2231223b733a31353a22736c69646573686f775f7061757365223b733a313a2231223b733a31353a22736c69646573686f775f746f756368223b733a313a2231223b7d733a373a2270726f6a656374223b733a31313a22626c75656d617374657273223b733a393a22646174657374616d70223b733a31303a2231333231333531383335223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a343a7b733a32363a22616c6c20616e6420286d696e2d77696474683a20393830707829223b613a313a7b733a31313a226373732f3936302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3936302e637373223b7d733a34393a22616c6c20616e6420286d696e2d77696474683a2037363070782920616e6420286d61782d77696474683a20393739707829223b613a313a7b733a31313a226373732f3732302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3732302e637373223b7d733a32363a22616c6c20616e6420286d61782d77696474683a20373539707829223b613a313a7b733a31343a226373732f6d6f62696c652e637373223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f6d6f62696c652e637373223b7d733a333a22616c6c223b613a313a7b733a31333a226373732f7374796c652e637373223b733a34323a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a31313a22626c75656d617374657273223b7d, 31, 5, 'admin/structure/block', 'admin/structure/block', 'Blue Masters', 't', '', 140, '', '', -10, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/search/clean-urls/check', '', '', '1', 0x613a303a7b7d, 'drupal_json_output', 0x613a313a7b693a303b613a313a7b733a363a22737461747573223b623a313b7d7d, 31, 5, '', 'admin/config/search/clean-urls/check', 'Clean URL check', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/search/settings/reindex', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220736561726368223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a227365617263685f7265696e6465785f636f6e6669726d223b7d, 31, 5, '', 'admin/config/search/settings/reindex', 'Clear index', 't', '', 4, '', '', 0, 'modules/search/search.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/system/actions/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f616374696f6e735f636f6e666967757265223b7d, 31, 5, '', 'admin/config/system/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/contact/delete/%', 0x613a313a7b693a343b733a31323a22636f6e746163745f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e7461637420666f726d73223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a22636f6e746163745f63617465676f72795f64656c6574655f666f726d223b693a313b693a343b7d, 30, 5, '', 'admin/structure/contact/delete/%', 'Delete contact', 't', '', 6, '', '', 0, 'modules/contact/contact.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/taxonomy/%/edit', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a227461786f6e6f6d795f666f726d5f766f636162756c617279223b693a313b693a333b7d, 29, 5, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Edit', 't', '', 132, '', '', -10, 'modules/taxonomy/taxonomy.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/contact/edit/%', 0x613a313a7b693a343b733a31323a22636f6e746163745f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e7461637420666f726d73223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a22636f6e746163745f63617465676f72795f656469745f666f726d223b693a313b693a343b7d, 30, 5, '', 'admin/structure/contact/edit/%', 'Edit contact category', 't', '', 6, '', '', 0, 'modules/contact/contact.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/regional/date-time/formats', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_date_time_formats', 0x613a303a7b7d, 31, 5, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Formats', 't', '', 132, 'Configure display format strings for date and time.', '', -9, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/block/list/garland', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a373a226761726c616e64223b7d, 31, 5, 'admin/structure/block', 'admin/structure/block', 'Garland', 't', '', 132, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('user/reset/%/%/%', 0x613a333a7b693a323b4e3b693a333b4e3b693a343b4e3b7d, '', '1', 0x613a303a7b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31353a22757365725f706173735f7265736574223b693a313b693a323b693a323b693a333b693a333b693a343b7d, 24, 5, '', 'user/reset/%/%/%', 'Reset password', 't', '', 0, '', '', 0, 'modules/user/user.pages.inc', '', 0, '', 'a:0:{}'),
('admin/structure/block/list/seven', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a353a22736576656e223b7d, 31, 5, 'admin/structure/block', 'admin/structure/block', 'Seven', 't', '', 132, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/block/list/stark', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a353a22737461726b223b7d, 31, 5, 'admin/structure/block', 'admin/structure/block', 'Stark', 't', '', 132, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/%/display', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a373a2264656661756c74223b7d, 29, 5, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Manage display', 't', '', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts/display', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a373a2264656661756c74223b7d, 31, 5, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Manage display', 't', '', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/%/fields', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b7d, 29, 5, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Manage fields', 't', '', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts/fields', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b7d, 31, 5, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Manage fields', 't', '', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('node/%/revisions/%/view', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a313a7b693a303b693a313b7d, 'node_show', 0x613a323a7b693a303b693a313b693a313b623a313b7d, 21, 5, '', 'node/%/revisions/%/view', 'Revisions', 't', '', 6, '', '', 0, '', '', 0, '', 'a:0:{}'),
('admin/config/services/aggregator/settings', '', '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2261676772656761746f725f61646d696e5f666f726d223b7d, 31, 5, 'admin/config/services/aggregator', 'admin/config/services/aggregator', 'Settings', 't', '', 132, 'Configure the behavior of the feed aggregator, including when to discard feed items and how to present feed items and categories.', '', 0, 'modules/aggregator/aggregator.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/regional/date-time/types', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f646174655f74696d655f73657474696e6773223b7d, 31, 5, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Types', 't', '', 140, 'Configure display formats for date and time.', '', -10, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('node/%/revisions/%/delete', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a323a7b693a303b693a313b693a313b733a363a2264656c657465223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226e6f64655f7265766973696f6e5f64656c6574655f636f6e6669726d223b693a313b693a313b7d, 21, 5, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', 6, '', '', 0, 'modules/node/node.pages.inc', '', 0, '', 'a:0:{}'),
('admin/config/content/formats/%', 0x613a313a7b693a343b733a31383a2266696c7465725f666f726d61745f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'filter_admin_format_page', 0x613a313a7b693a303b693a343b7d, 30, 5, '', 'admin/config/content/formats/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:4;}', 6, '', '', 0, 'modules/filter/filter.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/menu/manage/%', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31383a226d656e755f6f766572766965775f666f726d223b693a313b693a343b7d, 30, 5, '', 'admin/structure/menu/manage/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:4;}', 6, '', '', 0, 'modules/menu/menu.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/types/manage/%', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226e6f64655f747970655f666f726d223b693a313b693a343b7d, 30, 5, '', 'admin/structure/types/manage/%', 'Edit content type', 'node_type_page_title', 'a:1:{i:0;i:4;}', 6, '', '', 0, 'modules/node/content_types.inc', '', 0, '', 'a:0:{}'),
('node/%/revisions/%/revert', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a323a7b693a303b693a313b693a313b733a363a22757064617465223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226e6f64655f7265766973696f6e5f7265766572745f636f6e6669726d223b693a313b693a313b7d, 21, 5, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', 6, '', '', 0, 'modules/node/node.pages.inc', '', 0, '', 'a:0:{}'),
('admin/structure/block/demo/bartik', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a363a2262617274696b223b7d, 31, 5, '', 'admin/structure/block/demo/bartik', 'Bartik', 't', '', 0, '', '', 0, 'modules/block/block.admin.inc', '', 0, '_block_custom_theme', 'a:1:{i:0;s:6:"bartik";}'),
('admin/structure/block/demo/bluemasters', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a34353a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f626c75656d6173746572732e696e666f223b733a343a226e616d65223b733a31313a22626c75656d617374657273223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a31323a22426c7565204d617374657273223b733a31313a226465736372697074696f6e223b733a34303a225468656d65206261736564206f6e20426c7565204d617374657273205053442074656d706c617465223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a343a22636f7265223b733a333a22372e78223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a343a7b733a32363a22616c6c20616e6420286d696e2d77696474683a20393830707829223b613a313a7b733a31313a226373732f3936302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3936302e637373223b7d733a34393a22616c6c20616e6420286d696e2d77696474683a2037363070782920616e6420286d61782d77696474683a20393739707829223b613a313a7b733a31313a226373732f3732302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3732302e637373223b7d733a32363a22616c6c20616e6420286d61782d77696474683a20373539707829223b613a313a7b733a31343a226373732f6d6f62696c652e637373223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f6d6f62696c652e637373223b7d733a333a22616c6c223b613a313a7b733a31333a226373732f7374796c652e637373223b733a34323a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f7374796c652e637373223b7d7d733a373a22726567696f6e73223b613a32333a7b733a363a22686561646572223b733a363a22486561646572223b733a31313a227365617263685f61726561223b733a31313a225365617263682061726561223b733a31303a226e617669676174696f6e223b733a31303a224e617669676174696f6e223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172204669727374223b733a363a2262616e6e6572223b733a363a2242616e6e6572223b733a31313a22686f6d655f617265615f31223b733a31313a22486f6d6520617265612031223b733a31313a22686f6d655f617265615f32223b733a31313a22486f6d6520617265612032223b733a31313a22686f6d655f617265615f33223b733a31313a22486f6d6520617265612033223b733a31333a22686f6d655f617265615f335f62223b733a31333a22486f6d65206172656120332062223b733a31333a22666f6f7465725f6c6566745f31223b733a31333a22466f6f746572206c6566742031223b733a31333a22666f6f7465725f6c6566745f32223b733a31333a22466f6f746572206c6566742032223b733a31333a22666f6f7465725f63656e746572223b733a31333a22466f6f7465722063656e746572223b733a31323a22666f6f7465725f7269676874223b733a31323a22466f6f746572207269676874223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31333a22666f6f7465725f626f74746f6d223b733a31333a22466f6f74657220426f74746f6d223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a31313a7b733a31383a22726573706f6e736976655f726573706f6e64223b733a313a2230223b733a31353a22726573706f6e736976655f6d657461223b733a313a2231223b733a31373a22736c69646573686f775f646973706c6179223b733a313a2231223b733a31323a22736c69646573686f775f6a73223b733a313a2231223b733a31363a22736c69646573686f775f656666656374223b733a353a22736c696465223b733a32313a22736c69646573686f775f6566666563745f74696d65223b733a313a2235223b733a32343a22736c69646573686f775f616e696d6174696f6e5f74696d65223b733a333a22302e35223b733a31363a22736c69646573686f775f72616e646f6d223b733a313a2230223b733a31383a22736c69646573686f775f636f6e74726f6c73223b733a313a2231223b733a31353a22736c69646573686f775f7061757365223b733a313a2231223b733a31353a22736c69646573686f775f746f756368223b733a313a2231223b7d733a373a2270726f6a656374223b733a31313a22626c75656d617374657273223b733a393a22646174657374616d70223b733a31303a2231333231333531383335223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a343a7b733a32363a22616c6c20616e6420286d696e2d77696474683a20393830707829223b613a313a7b733a31313a226373732f3936302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3936302e637373223b7d733a34393a22616c6c20616e6420286d696e2d77696474683a2037363070782920616e6420286d61782d77696474683a20393739707829223b613a313a7b733a31313a226373732f3732302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3732302e637373223b7d733a32363a22616c6c20616e6420286d61782d77696474683a20373539707829223b613a313a7b733a31343a226373732f6d6f62696c652e637373223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f6d6f62696c652e637373223b7d733a333a22616c6c223b613a313a7b733a31333a226373732f7374796c652e637373223b733a34323a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a31313a22626c75656d617374657273223b7d, 31, 5, '', 'admin/structure/block/demo/bluemasters', 'Blue Masters', 't', '', 0, '', '', 0, 'modules/block/block.admin.inc', '', 0, '_block_custom_theme', 'a:1:{i:0;s:11:"bluemasters";}');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `description`, `position`, `weight`, `include_file`, `delivery_callback`, `context`, `theme_callback`, `theme_arguments`) VALUES
('admin/structure/block/demo/garland', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a373a226761726c616e64223b7d, 31, 5, '', 'admin/structure/block/demo/garland', 'Garland', 't', '', 0, '', '', 0, 'modules/block/block.admin.inc', '', 0, '_block_custom_theme', 'a:1:{i:0;s:7:"garland";}'),
('admin/structure/block/demo/seven', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a353a22736576656e223b7d, 31, 5, '', 'admin/structure/block/demo/seven', 'Seven', 't', '', 0, '', '', 0, 'modules/block/block.admin.inc', '', 0, '_block_custom_theme', 'a:1:{i:0;s:5:"seven";}'),
('admin/structure/block/demo/stark', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a353a22737461726b223b7d, 31, 5, '', 'admin/structure/block/demo/stark', 'Stark', 't', '', 0, '', '', 0, 'modules/block/block.admin.inc', '', 0, '_block_custom_theme', 'a:1:{i:0;s:5:"stark";}'),
('admin/structure/types/manage/%/edit', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226e6f64655f747970655f666f726d223b693a313b693a343b7d, 61, 6, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit', 't', '', 140, '', '', 0, 'modules/node/content_types.inc', '', 1, '', 'a:0:{}'),
('admin/structure/menu/manage/%/list', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31383a226d656e755f6f766572766965775f666f726d223b693a313b693a343b7d, 61, 6, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'List links', 't', '', 140, '', '', -10, 'modules/menu/menu.admin.inc', '', 3, '', 'a:0:{}'),
('admin/config/regional/date-time/formats/lookup', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_date_time_lookup', 0x613a303a7b7d, 63, 6, '', 'admin/config/regional/date-time/formats/lookup', 'Date and time lookup', 't', '', 0, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/types/manage/%/delete', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226e6f64655f747970655f64656c6574655f636f6e6669726d223b693a313b693a343b7d, 61, 6, '', 'admin/structure/types/manage/%/delete', 'Delete', 't', '', 6, '', '', 0, 'modules/node/content_types.inc', '', 0, '', 'a:0:{}'),
('admin/people/permissions/roles/edit/%', 0x613a313a7b693a353b733a31343a22757365725f726f6c655f6c6f6164223b7d, '', 'user_role_edit_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31353a22757365725f61646d696e5f726f6c65223b693a313b693a353b7d, 62, 6, '', 'admin/people/permissions/roles/edit/%', 'Edit role', 't', '', 6, '', '', 0, 'modules/user/user.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/block/list/bartik/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, 63, 6, 'admin/structure/block/list/bartik', 'admin/structure/block', 'Add block', 't', '', 388, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/block/list/garland/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, 63, 6, 'admin/structure/block/list/garland', 'admin/structure/block', 'Add block', 't', '', 388, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/block/list/seven/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, 63, 6, 'admin/structure/block/list/seven', 'admin/structure/block', 'Add block', 't', '', 388, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/block/list/stark/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, 63, 6, 'admin/structure/block/list/stark', 'admin/structure/block', 'Add block', 't', '', 388, '', '', 0, 'modules/block/block.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/services/aggregator/add/category', '', '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2261676772656761746f725f666f726d5f63617465676f7279223b7d, 63, 6, 'admin/config/services/aggregator', 'admin/config/services/aggregator', 'Add category', 't', '', 388, '', '', 0, 'modules/aggregator/aggregator.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/services/aggregator/add/feed', '', '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2261676772656761746f725f666f726d5f66656564223b7d, 63, 6, 'admin/config/services/aggregator', 'admin/config/services/aggregator', 'Add feed', 't', '', 388, '', '', 0, 'modules/aggregator/aggregator.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/menu/manage/%/add', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31343a226d656e755f656469745f6974656d223b693a313b733a333a22616464223b693a323b4e3b693a333b693a343b7d, 61, 6, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Add link', 't', '', 388, '', '', 0, 'modules/menu/menu.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/block/manage/%/%', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32313a22626c6f636b5f61646d696e5f636f6e666967757265223b693a313b693a343b693a323b693a353b7d, 60, 6, '', 'admin/structure/block/manage/%/%', 'Configure block', 't', '', 6, '', '', 0, 'modules/block/block.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/taxonomy/%/display/default', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a373a2264656661756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a373a2264656661756c74223b7d, 59, 6, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Default', 't', '', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts/display/default', '', '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a373a2264656661756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a373a2264656661756c74223b7d, 63, 6, 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'Default', 't', '', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/ip-blocking/delete/%', 0x613a313a7b693a353b733a31353a22626c6f636b65645f69705f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a22626c6f636b20495020616464726573736573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a2273797374656d5f69705f626c6f636b696e675f64656c657465223b693a313b693a353b7d, 62, 6, '', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 't', '', 6, '', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/menu/manage/%/delete', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_delete_menu_page', 0x613a313a7b693a303b693a343b7d, 61, 6, '', 'admin/structure/menu/manage/%/delete', 'Delete menu', 't', '', 6, '', '', 0, 'modules/menu/menu.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/menu/item/%/delete', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_item_delete_page', 0x613a313a7b693a303b693a343b7d, 61, 6, '', 'admin/structure/menu/item/%/delete', 'Delete menu link', 't', '', 6, '', '', 0, 'modules/menu/menu.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/menu/item/%/edit', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31343a226d656e755f656469745f6974656d223b693a313b733a343a2265646974223b693a323b693a343b693a333b4e3b7d, 61, 6, '', 'admin/structure/menu/item/%/edit', 'Edit menu link', 't', '', 6, '', '', 0, 'modules/menu/menu.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/services/aggregator/add/opml', '', '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2261676772656761746f725f666f726d5f6f706d6c223b7d, 63, 6, 'admin/config/services/aggregator', 'admin/config/services/aggregator', 'Import OPML', 't', '', 388, '', '', 0, 'modules/aggregator/aggregator.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/services/aggregator/remove/%', 0x613a313a7b693a353b733a32303a2261676772656761746f725f666565645f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a2261676772656761746f725f61646d696e5f72656d6f76655f66656564223b693a313b693a353b7d, 62, 6, '', 'admin/config/services/aggregator/remove/%', 'Remove items', 't', '', 6, '', '', 0, 'modules/aggregator/aggregator.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/menu/item/%/reset', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a226d656e755f72657365745f6974656d5f636f6e6669726d223b693a313b693a343b7d, 61, 6, '', 'admin/structure/menu/item/%/reset', 'Reset menu link', 't', '', 6, '', '', 0, 'modules/menu/menu.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/taxonomy/%/display/full', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a343a2266756c6c223b693a333b733a31313a22757365725f616363657373223b693a343b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a343a2266756c6c223b7d, 59, 6, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Taxonomy term page', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/services/aggregator/update/%', 0x613a313a7b693a353b733a32303a2261676772656761746f725f666565645f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'aggregator_admin_refresh_feed', 0x613a313a7b693a303b693a353b7d, 62, 6, '', 'admin/config/services/aggregator/update/%', 'Update items', 't', '', 6, '', '', 0, 'modules/aggregator/aggregator.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/people/accounts/display/full', '', '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a343a2266756c6c223b693a333b733a31313a22757365725f616363657373223b693a343b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a343a2266756c6c223b7d, 63, 6, 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'User account', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/regional/date-time/types/add', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2273797374656d5f6164645f646174655f666f726d61745f747970655f666f726d223b7d, 63, 6, 'admin/config/regional/date-time/types', 'admin/config/regional/date-time', 'Add date type', 't', '', 388, 'Add new date type.', '', -10, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/regional/date-time/formats/add', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33343a2273797374656d5f636f6e6669677572655f646174655f666f726d6174735f666f726d223b7d, 63, 6, 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time', 'Add format', 't', '', 388, 'Allow users to add additional date formats.', '', -10, 'modules/system/system.admin.inc', '', 1, '', 'a:0:{}'),
('user/%/cancel/confirm/%/%', 0x613a333a7b693a313b733a393a22757365725f6c6f6164223b693a343b4e3b693a353b4e3b7d, '', 'user_cancel_access', 0x613a313a7b693a303b693a313b7d, 'user_cancel_confirm', 0x613a333a7b693a303b693a313b693a313b693a343b693a323b693a353b7d, 44, 6, '', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 't', '', 6, '', '', 0, 'modules/user/user.pages.inc', '', 0, '', 'a:0:{}'),
('admin/config/system/actions/delete/%', 0x613a313a7b693a353b733a31323a22616374696f6e735f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a2273797374656d5f616374696f6e735f64656c6574655f666f726d223b693a313b693a353b7d, 62, 6, '', 'admin/config/system/actions/delete/%', 'Delete action', 't', '', 6, 'Delete an action.', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/people/permissions/roles/delete/%', 0x613a313a7b693a353b733a31343a22757365725f726f6c655f6c6f6164223b7d, '', 'user_role_edit_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33303a22757365725f61646d696e5f726f6c655f64656c6574655f636f6e6669726d223b693a313b693a353b7d, 62, 6, '', 'admin/people/permissions/roles/delete/%', 'Delete role', 't', '', 6, '', '', 0, 'modules/user/user.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/content/formats/%/disable', 0x613a313a7b693a343b733a31383a2266696c7465725f666f726d61745f6c6f6164223b7d, '', '_filter_disable_format_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2266696c7465725f61646d696e5f64697361626c65223b693a313b693a343b7d, 61, 6, '', 'admin/config/content/formats/%/disable', 'Disable text format', 't', '', 6, '', '', 0, 'modules/filter/filter.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/menu/manage/%/edit', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31343a226d656e755f656469745f6d656e75223b693a313b733a343a2265646974223b693a323b693a343b7d, 61, 6, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Edit menu', 't', '', 132, '', '', 0, 'modules/menu/menu.admin.inc', '', 3, '', 'a:0:{}'),
('admin/structure/types/manage/%/display', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, 61, 6, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Manage display', 't', '', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/fields', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b7d, 61, 6, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Manage fields', 't', '', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/%/fields/%', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, 58, 6, '', 'admin/structure/taxonomy/%/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:5;}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/people/accounts/fields/%', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, 62, 6, '', 'admin/config/people/accounts/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:5;}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/block/manage/%/%/configure', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32313a22626c6f636b5f61646d696e5f636f6e666967757265223b693a313b693a343b693a323b693a353b7d, 121, 7, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 't', '', 140, '', '', 0, 'modules/block/block.admin.inc', '', 2, '', 'a:0:{}'),
('admin/structure/types/manage/%/display/default', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a373a2264656661756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, 123, 7, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Default', 't', '', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/services/aggregator/edit/category/%', 0x613a313a7b693a363b733a32343a2261676772656761746f725f63617465676f72795f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a2261676772656761746f725f666f726d5f63617465676f7279223b693a313b693a363b7d, 126, 7, '', 'admin/config/services/aggregator/edit/category/%', 'Edit category', 't', '', 6, '', '', 0, 'modules/aggregator/aggregator.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/services/aggregator/edit/feed/%', 0x613a313a7b693a363b733a32303a2261676772656761746f725f666565645f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e6973746572206e657773206665656473223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2261676772656761746f725f666f726d5f66656564223b693a313b693a363b7d, 126, 7, '', 'admin/config/services/aggregator/edit/feed/%', 'Edit feed', 't', '', 6, '', '', 0, 'modules/aggregator/aggregator.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/types/manage/%/display/full', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a343a2266756c6c223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a343a2266756c6c223b7d, 123, 7, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Full content', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/display/rss', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a333a22727373223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a333a22727373223b7d, 123, 7, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'RSS', 't', '', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/display/search_index', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a31323a227365617263685f696e646578223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a31323a227365617263685f696e646578223b7d, 123, 7, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Search index', 't', '', 132, '', '', 3, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/display/search_result', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a31333a227365617263685f726573756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a31333a227365617263685f726573756c74223b7d, 123, 7, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Search result', 't', '', 132, '', '', 4, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/display/teaser', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a363a22746561736572223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a363a22746561736572223b7d, 123, 7, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Teaser', 't', '', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/display', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, 123, 7, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Comment display', 't', '', 132, '', '', 4, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/fields', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b7d, 123, 7, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Comment fields', 't', '', 132, '', '', 3, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/block/manage/%/%/delete', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32353a22626c6f636b5f637573746f6d5f626c6f636b5f64656c657465223b693a313b693a343b693a323b693a353b7d, 121, 7, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Delete block', 't', '', 132, '', '', 0, 'modules/block/block.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/regional/date-time/formats/%/delete', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33303a2273797374656d5f646174655f64656c6574655f666f726d61745f666f726d223b693a313b693a353b7d, 125, 7, '', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 't', '', 6, 'Allow users to delete a configured date format.', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/regional/date-time/types/%/delete', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33353a2273797374656d5f64656c6574655f646174655f666f726d61745f747970655f666f726d223b693a313b693a353b7d, 125, 7, '', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 't', '', 6, 'Allow users to delete a configured date type.', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/config/regional/date-time/formats/%/edit', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33343a2273797374656d5f636f6e6669677572655f646174655f666f726d6174735f666f726d223b693a313b693a353b7d, 125, 7, '', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 't', '', 6, 'Allow users to edit a configured date format.', '', 0, 'modules/system/system.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/taxonomy/%/fields/%/delete', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a353b7d, 117, 7, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Delete', 't', '', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/%/fields/%/edit', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, 117, 7, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Edit', 't', '', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/%/fields/%/field-settings', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a353b7d, 117, 7, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Field settings', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/taxonomy/%/fields/%/widget-type', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a353b7d, 117, 7, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Widget type', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts/fields/%/delete', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a353b7d, 125, 7, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Delete', 't', '', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts/fields/%/edit', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, 125, 7, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Edit', 't', '', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts/fields/%/field-settings', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a353b7d, 125, 7, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Field settings', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/config/people/accounts/fields/%/widget-type', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a353b7d, 125, 7, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Widget type', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/fields/%', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a363b7d, 122, 7, '', 'admin/structure/types/manage/%/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:6;}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/display/default', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a373a2264656661756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, 247, 8, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%', 'Default', 't', '', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/display/full', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a343a2266756c6c223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a343a2266756c6c223b7d, 247, 8, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%', 'Full comment', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `description`, `position`, `weight`, `include_file`, `delivery_callback`, `context`, `theme_callback`, `theme_arguments`) VALUES
('admin/structure/types/manage/%/fields/%/delete', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a363b7d, 245, 8, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Delete', 't', '', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/fields/%/edit', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a363b7d, 245, 8, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Edit', 't', '', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/fields/%/field-settings', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a363b7d, 245, 8, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Field settings', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/fields/%/widget-type', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a363b7d, 245, 8, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Widget type', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/fields/%', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a373b7d, 246, 8, '', 'admin/structure/types/manage/%/comment/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:7;}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 0, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/fields/%/delete', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a373b7d, 493, 9, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Delete', 't', '', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/fields/%/edit', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a373b7d, 493, 9, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Edit', 't', '', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/fields/%/field-settings', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a373b7d, 493, 9, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Field settings', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}'),
('admin/structure/types/manage/%/comment/fields/%/widget-type', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a373b7d, 493, 9, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Widget type', 't', '', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc', '', 1, '', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE IF NOT EXISTS `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `sticky`, `tnid`, `translate`) VALUES
(1, 1, 'page', 'und', 'Portfolio', 1, 1, 1293296444, 1300216479, 1, 0, 0, 0, 0),
(2, 2, 'story', 'und', 'Creation of Beaches', 1, 1, 1293299349, 1300217001, 2, 1, 0, 0, 0),
(3, 3, 'page', 'und', 'About iPadMasters', 1, 1, 1293481652, 1300210377, 1, 0, 0, 0, 0),
(4, 4, 'story', 'und', 'Brazilian Vacations', 1, 1, 1293483804, 1300216987, 2, 1, 0, 0, 0),
(5, 5, 'story', 'und', 'Jamaica Secrets', 1, 1, 1293483907, 1300216974, 2, 1, 0, 0, 0),
(6, 6, 'page', 'und', 'Contact Us', 1, 1, 1293692314, 1295951909, 1, 0, 0, 0, 0),
(7, 7, 'page', 'und', 'Content', 1, 0, 1294092138, 1294092138, 0, 0, 0, 0, 0),
(8, 8, 'page', 'und', 'Testing new Page content type', 1, 1, 1300380336, 1300380336, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_access`
--

CREATE TABLE IF NOT EXISTS `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `node_access`
--

INSERT INTO `node_access` (`nid`, `gid`, `realm`, `grant_view`, `grant_update`, `grant_delete`) VALUES
(0, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_comment_statistics`
--

CREATE TABLE IF NOT EXISTS `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid of the last comment.',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `last_comment_uid` (`last_comment_uid`),
  KEY `cid` (`cid`),
  KEY `comment_count` (`comment_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `node_comment_statistics`
--

INSERT INTO `node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`, `cid`) VALUES
(1, 1293296444, NULL, 1, 0, 0),
(2, 1293299349, '', 1, 0, 0),
(3, 1293481652, NULL, 1, 0, 0),
(4, 1293483804, '', 1, 0, 0),
(5, 1300468035, '', 1, 2, 2),
(6, 1293692314, NULL, 1, 0, 0),
(7, 1294092138, NULL, 1, 0, 0),
(8, 1300380336, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_revision`
--

CREATE TABLE IF NOT EXISTS `node_revision` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `node_revision`
--

INSERT INTO `node_revision` (`nid`, `vid`, `uid`, `title`, `log`, `timestamp`, `status`, `comment`, `promote`, `sticky`) VALUES
(1, 1, 1, 'Portfolio', '', 1300216479, 1, 1, 0, 0),
(2, 2, 1, 'Creation of Beaches', '', 1300217001, 1, 2, 1, 0),
(3, 3, 1, 'About iPadMasters', '', 1300210377, 1, 1, 0, 0),
(4, 4, 1, 'Brazilian Vacations', '', 1300216987, 1, 2, 1, 0),
(5, 5, 1, 'Jamaica Secrets', '', 1300216974, 1, 2, 1, 0),
(6, 6, 1, 'Contact Us', '', 1295951909, 1, 1, 0, 0),
(7, 7, 1, 'Content', '', 1294092138, 0, 0, 0, 0),
(8, 8, 1, 'Testing new Page content type', '', 1300380336, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_type`
--

CREATE TABLE IF NOT EXISTS `node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `base` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `node_type`
--

INSERT INTO `node_type` (`type`, `name`, `base`, `description`, `help`, `has_title`, `title_label`, `custom`, `modified`, `locked`, `orig_type`, `module`, `disabled`) VALUES
('page', 'Page', 'node_content', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 1, 'Title', 1, 1, 0, 'page', 'node', 0),
('story', 'Story', 'node_content', 'A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.', '', 1, 'Title', 1, 1, 0, 'story', 'node', 0);

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE IF NOT EXISTS `queue` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  PRIMARY KEY (`item_id`),
  KEY `name_created` (`name`,`created`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores items in queues.' AUTO_INCREMENT=218 ;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`item_id`, `name`, `data`, `expire`, `created`) VALUES
(216, 'update_fetch_tasks', 0x613a383a7b733a343a226e616d65223b733a393a22737570657266697368223b733a343a22696e666f223b613a363a7b733a343a226e616d65223b733a393a22537570657266697368223b733a373a227061636b616765223b733a31343a225573657220696e74657266616365223b733a373a2276657273696f6e223b733a373a22372e782d312e38223b733a373a2270726f6a656374223b733a393a22737570657266697368223b733a393a22646174657374616d70223b733a31303a2231333031323437333639223b733a31363a225f696e666f5f66696c655f6374696d65223b693a313336333032363535323b7d733a393a22646174657374616d70223b733a31303a2231333031323437333639223b733a383a22696e636c75646573223b613a313a7b733a393a22737570657266697368223b733a393a22537570657266697368223b7d733a31323a2270726f6a6563745f74797065223b733a363a226d6f64756c65223b733a31343a2270726f6a6563745f737461747573223b623a313b733a31303a227375625f7468656d6573223b613a303a7b7d733a31313a22626173655f7468656d6573223b613a303a7b7d7d, 0, 1363363001),
(217, 'update_fetch_tasks', 0x613a383a7b733a343a226e616d65223b733a31313a22626c75656d617374657273223b733a343a22696e666f223b613a353a7b733a343a226e616d65223b733a31323a22426c7565204d617374657273223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a31313a22626c75656d617374657273223b733a393a22646174657374616d70223b733a31303a2231333231333531383335223b733a31363a225f696e666f5f66696c655f6374696d65223b693a313336323933363534323b7d733a393a22646174657374616d70223b733a31303a2231333231333531383335223b733a383a22696e636c75646573223b613a313a7b733a31313a22626c75656d617374657273223b733a31323a22426c7565204d617374657273223b7d733a31323a2270726f6a6563745f74797065223b733a353a227468656d65223b733a31343a2270726f6a6563745f737461747573223b623a313b733a31303a227375625f7468656d6573223b613a303a7b7d733a31313a22626173655f7468656d6573223b613a303a7b7d7d, 0, 1363363001),
(215, 'update_fetch_tasks', 0x613a383a7b733a343a226e616d65223b733a393a226c6962726172696573223b733a343a22696e666f223b613a363a7b733a343a226e616d65223b733a393a224c6962726172696573223b733a373a2276657273696f6e223b733a373a22372e782d322e31223b733a373a2270726f6a656374223b733a393a226c6962726172696573223b733a393a22646174657374616d70223b733a31303a2231333632383438343132223b733a373a227061636b616765223b733a353a224f74686572223b733a31363a225f696e666f5f66696c655f6374696d65223b693a313336333032363435383b7d733a393a22646174657374616d70223b733a31303a2231333632383438343132223b733a383a22696e636c75646573223b613a313a7b733a393a226c6962726172696573223b733a393a224c6962726172696573223b7d733a31323a2270726f6a6563745f74797065223b733a363a226d6f64756c65223b733a31343a2270726f6a6563745f737461747573223b623a313b733a31303a227375625f7468656d6573223b613a303a7b7d733a31313a22626173655f7468656d6573223b613a303a7b7d7d, 0, 1363363001),
(214, 'update_fetch_tasks', 0x613a383a7b733a343a226e616d65223b733a363a2264727570616c223b733a343a22696e666f223b613a363a7b733a343a226e616d65223b733a31303a2241676772656761746f72223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31363a225f696e666f5f66696c655f6374696d65223b693a313336323933363831313b7d733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a383a22696e636c75646573223b613a32393a7b733a31303a2261676772656761746f72223b733a31303a2241676772656761746f72223b733a353a22626c6f636b223b733a353a22426c6f636b223b733a353a22636f6c6f72223b733a353a22436f6c6f72223b733a373a22636f6d6d656e74223b733a373a22436f6d6d656e74223b733a373a22636f6e74616374223b733a373a22436f6e74616374223b733a31303a22636f6e7465787475616c223b733a31363a22436f6e7465787475616c206c696e6b73223b733a393a2264617368626f617264223b733a393a2244617368626f617264223b733a353a2264626c6f67223b733a31363a224461746162617365206c6f6767696e67223b733a353a226669656c64223b733a353a224669656c64223b733a31373a226669656c645f73716c5f73746f72616765223b733a31373a224669656c642053514c2073746f72616765223b733a383a226669656c645f7569223b733a383a224669656c64205549223b733a343a2266696c65223b733a343a2246696c65223b733a363a2266696c746572223b733a363a2246696c746572223b733a343a2268656c70223b733a343a2248656c70223b733a343a226c697374223b733a343a224c697374223b733a343a226d656e75223b733a343a224d656e75223b733a343a226e6f6465223b733a343a224e6f6465223b733a363a226e756d626572223b733a363a224e756d626572223b733a373a226f7074696f6e73223b733a373a224f7074696f6e73223b733a333a22706870223b733a31303a225048502066696c746572223b733a363a22736561726368223b733a363a22536561726368223b733a363a2273797374656d223b733a363a2253797374656d223b733a383a227461786f6e6f6d79223b733a383a225461786f6e6f6d79223b733a343a2274657874223b733a343a2254657874223b733a373a22746f6f6c626172223b733a373a22546f6f6c626172223b733a363a22757064617465223b733a31343a22557064617465206d616e61676572223b733a343a2275736572223b733a343a2255736572223b733a373a226761726c616e64223b733a373a224761726c616e64223b733a353a22736576656e223b733a353a22536576656e223b7d733a31323a2270726f6a6563745f74797065223b733a343a22636f7265223b733a31343a2270726f6a6563745f737461747573223b623a313b733a31303a227375625f7468656d6573223b613a303a7b7d733a31313a22626173655f7468656d6573223b613a303a7b7d7d, 0, 1363363001);

-- --------------------------------------------------------

--
-- Table structure for table `rdf_mapping`
--

CREATE TABLE IF NOT EXISTS `rdf_mapping` (
  `type` varchar(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` varchar(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` longblob COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.',
  PRIMARY KEY (`type`,`bundle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores custom RDF mappings for user defined content types...';

--
-- Dumping data for table `rdf_mapping`
--

INSERT INTO `rdf_mapping` (`type`, `bundle`, `mapping`) VALUES
('node', 'article', 0x613a31313a7b733a31313a226669656c645f696d616765223b613a323a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a383a226f673a696d616765223b693a313b733a31323a22726466733a736565416c736f223b7d733a343a2274797065223b733a333a2272656c223b7d733a31303a226669656c645f74616773223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31303a2264633a7375626a656374223b7d733a343a2274797065223b733a333a2272656c223b7d733a373a2272646674797065223b613a323a7b693a303b733a393a2273696f633a4974656d223b693a313b733a31333a22666f61663a446f63756d656e74223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d),
('node', 'page', 0x613a393a7b733a373a2272646674797065223b613a313a7b693a303b733a31333a22666f61663a446f63756d656e74223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `registry`
--

CREATE TABLE IF NOT EXISTS `registry` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(9) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`,`type`),
  KEY `hook` (`type`,`weight`,`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registry`
--

INSERT INTO `registry` (`name`, `type`, `filename`, `module`, `weight`) VALUES
('AccessDeniedTestCase', 'class', 'modules/system/system.test', 'system', 0),
('AddFeedTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('AdminMetaTagTestCase', 'class', 'modules/system/system.test', 'system', 0),
('AggregatorCronTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('AggregatorRenderingTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('AggregatorTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('ArchiverInterface', 'interface', 'includes/archiver.inc', '', 0),
('ArchiverTar', 'class', 'modules/system/system.archiver.inc', 'system', 0),
('ArchiverZip', 'class', 'modules/system/system.archiver.inc', 'system', 0),
('Archive_Tar', 'class', 'modules/system/system.tar.inc', 'system', 0),
('BatchMemoryQueue', 'class', 'includes/batch.queue.inc', '', 0),
('BatchQueue', 'class', 'includes/batch.queue.inc', '', 0),
('BlockAdminThemeTestCase', 'class', 'modules/block/block.test', 'block', -5),
('BlockCacheTestCase', 'class', 'modules/block/block.test', 'block', -5),
('BlockHTMLIdTestCase', 'class', 'modules/block/block.test', 'block', -5),
('BlockTestCase', 'class', 'modules/block/block.test', 'block', -5),
('CategorizeFeedItemTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('CategorizeFeedTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('ColorTestCase', 'class', 'modules/color/color.test', 'color', 0),
('CommentActionsTestCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentAnonymous', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentApprovalTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentBlockFunctionalTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentContentRebuild', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentController', 'class', 'modules/comment/comment.module', 'comment', 0),
('CommentFieldsTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentHelperCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentInterfaceTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentNodeAccessTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentPagerTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentPreviewTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentRSSUnitTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentTokenReplaceTestCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('ContactPersonalTestCase', 'class', 'modules/contact/contact.test', 'contact', 0),
('ContactSitewideTestCase', 'class', 'modules/contact/contact.test', 'contact', 0),
('CronRunTestCase', 'class', 'modules/system/system.test', 'system', 0),
('DashboardBlocksTestCase', 'class', 'modules/dashboard/dashboard.test', 'dashboard', 0),
('Database', 'class', 'includes/database/database.inc', '', 0),
('DatabaseCondition', 'class', 'includes/database/query.inc', '', 0),
('DatabaseConnection', 'class', 'includes/database/database.inc', '', 0),
('DatabaseConnectionNotDefinedException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseConnection_mysql', 'class', 'includes/database/mysql/database.inc', '', 0),
('DatabaseConnection_pgsql', 'class', 'includes/database/pgsql/database.inc', '', 0),
('DatabaseConnection_sqlite', 'class', 'includes/database/sqlite/database.inc', '', 0),
('DatabaseDriverNotSpecifiedException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseLog', 'class', 'includes/database/log.inc', '', 0),
('DatabaseSchema', 'class', 'includes/database/schema.inc', '', 0),
('DatabaseSchemaObjectDoesNotExistException', 'class', 'includes/database/schema.inc', '', 0),
('DatabaseSchemaObjectExistsException', 'class', 'includes/database/schema.inc', '', 0),
('DatabaseSchema_mysql', 'class', 'includes/database/mysql/schema.inc', '', 0),
('DatabaseSchema_pgsql', 'class', 'includes/database/pgsql/schema.inc', '', 0),
('DatabaseSchema_sqlite', 'class', 'includes/database/sqlite/schema.inc', '', 0),
('DatabaseStatementBase', 'class', 'includes/database/database.inc', '', 0),
('DatabaseStatementEmpty', 'class', 'includes/database/database.inc', '', 0),
('DatabaseStatementInterface', 'interface', 'includes/database/database.inc', '', 0),
('DatabaseStatementPrefetch', 'class', 'includes/database/prefetch.inc', '', 0),
('DatabaseStatement_sqlite', 'class', 'includes/database/sqlite/database.inc', '', 0),
('DatabaseTaskException', 'class', 'includes/install.inc', '', 0),
('DatabaseTasks', 'class', 'includes/install.inc', '', 0),
('DatabaseTasks_mysql', 'class', 'includes/database/mysql/install.inc', '', 0),
('DatabaseTasks_pgsql', 'class', 'includes/database/pgsql/install.inc', '', 0),
('DatabaseTasks_sqlite', 'class', 'includes/database/sqlite/install.inc', '', 0),
('DatabaseTransaction', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionCommitFailedException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionExplicitCommitNotAllowedException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionNameNonUniqueException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionNoActiveException', 'class', 'includes/database/database.inc', '', 0),
('DateTimeFunctionalTest', 'class', 'modules/system/system.test', 'system', 0),
('DBLogTestCase', 'class', 'modules/dblog/dblog.test', 'dblog', 0),
('DefaultMailSystem', 'class', 'modules/system/system.mail.inc', 'system', 0),
('DeleteQuery', 'class', 'includes/database/query.inc', '', 0),
('DeleteQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0),
('DrupalCacheInterface', 'interface', 'includes/cache.inc', '', 0),
('DrupalDatabaseCache', 'class', 'includes/cache.inc', '', 0),
('DrupalDefaultEntityController', 'class', 'includes/entity.inc', '', 0),
('DrupalEntityControllerInterface', 'interface', 'includes/entity.inc', '', 0),
('DrupalFakeCache', 'class', 'includes/cache-install.inc', '', 0),
('DrupalLocalStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0),
('DrupalPrivateStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0),
('DrupalPublicStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0),
('DrupalQueue', 'class', 'modules/system/system.queue.inc', 'system', 0),
('DrupalQueueInterface', 'interface', 'modules/system/system.queue.inc', 'system', 0),
('DrupalReliableQueueInterface', 'interface', 'modules/system/system.queue.inc', 'system', 0),
('DrupalStreamWrapperInterface', 'interface', 'includes/stream_wrappers.inc', '', 0),
('DrupalTemporaryStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0),
('DrupalUpdateException', 'class', 'includes/update.inc', '', 0),
('DrupalUpdaterInterface', 'interface', 'includes/updater.inc', '', 0),
('EnableDisableTestCase', 'class', 'modules/system/system.test', 'system', 0),
('EntityFieldQuery', 'class', 'includes/entity.inc', '', 0),
('EntityFieldQueryException', 'class', 'includes/entity.inc', '', 0),
('EntityPropertiesTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FeedParserTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('FieldAttachOtherTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldAttachStorageTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldAttachTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldBulkDeleteTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldCrudTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldDisplayAPITestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldException', 'class', 'modules/field/field.module', 'field', 0),
('FieldFormTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldInfoTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldInstanceCrudTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldsOverlapException', 'class', 'includes/database/database.inc', '', 0),
('FieldSqlStorageTestCase', 'class', 'modules/field/modules/field_sql_storage/field_sql_storage.test', 'field_sql_storage', 0),
('FieldTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldTranslationsTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldUIManageDisplayTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0),
('FieldUIManageFieldsTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0),
('FieldUITestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0),
('FieldUpdateForbiddenException', 'class', 'modules/field/field.module', 'field', 0),
('FieldValidationException', 'class', 'modules/field/field.attach.inc', 'field', 0),
('FileFieldDisplayTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldPathTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldRevisionTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldValidateTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldWidgetTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileManagedFileElementTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileTokenReplaceTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileTransfer', 'class', 'includes/filetransfer/filetransfer.inc', '', 0),
('FileTransferChmodInterface', 'interface', 'includes/filetransfer/filetransfer.inc', '', 0),
('FileTransferException', 'class', 'includes/filetransfer/filetransfer.inc', '', 0),
('FileTransferFTP', 'class', 'includes/filetransfer/ftp.inc', '', 0),
('FileTransferFTPExtension', 'class', 'includes/filetransfer/ftp.inc', '', 0),
('FileTransferLocal', 'class', 'includes/filetransfer/local.inc', '', 0),
('FileTransferSSH', 'class', 'includes/filetransfer/ssh.inc', '', 0),
('FilterAdminTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterCRUDTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterDefaultFormatTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterFormatAccessTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterHooksTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterNoFormatTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterSecurityTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterUnitTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FloodFunctionalTest', 'class', 'modules/system/system.test', 'system', 0),
('FrontPageTestCase', 'class', 'modules/system/system.test', 'system', 0),
('HelpTestCase', 'class', 'modules/help/help.test', 'help', 0),
('HookRequirementsTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ImportOPMLTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('InfoFileParserTestCase', 'class', 'modules/system/system.test', 'system', 0),
('InsertQuery', 'class', 'includes/database/query.inc', '', 0),
('InsertQuery_mysql', 'class', 'includes/database/mysql/query.inc', '', 0),
('InsertQuery_pgsql', 'class', 'includes/database/pgsql/query.inc', '', 0),
('InsertQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0),
('InvalidMergeQueryException', 'class', 'includes/database/database.inc', '', 0),
('IPAddressBlockingTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ListFieldTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0),
('ListFieldUITestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0),
('MailSystemInterface', 'interface', 'includes/mail.inc', '', 0),
('MemoryQueue', 'class', 'modules/system/system.queue.inc', 'system', 0),
('MenuNodeTestCase', 'class', 'modules/menu/menu.test', 'menu', 0),
('MenuTestCase', 'class', 'modules/menu/menu.test', 'menu', 0),
('MergeQuery', 'class', 'includes/database/query.inc', '', 0),
('ModuleDependencyTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ModuleRequiredTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ModuleTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ModuleUpdater', 'class', 'modules/system/system.updater.inc', 'system', 0),
('ModuleVersionTestCase', 'class', 'modules/system/system.test', 'system', 0),
('MultiStepNodeFormBasicOptionsTest', 'class', 'modules/node/node.test', 'node', 0),
('NewDefaultThemeBlocks', 'class', 'modules/block/block.test', 'block', -5),
('NodeAccessRebuildTestCase', 'class', 'modules/node/node.test', 'node', 0),
('SearchNodeAccessTest', 'class', 'modules/search/search.test', 'search', 0),
('NodeAdminTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeBlockFunctionalTest', 'class', 'modules/node/node.test', 'node', 0),
('NodeBlockTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeBuildContent', 'class', 'modules/node/node.test', 'node', 0),
('NodeController', 'class', 'modules/node/node.module', 'node', 0),
('NodeCreationTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeEntityFieldQueryAlter', 'class', 'modules/node/node.test', 'node', 0),
('NodeFeedTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeLoadHooksTestCase', 'class', 'modules/node/node.test', 'node', 0),
('OptionsSelectDynamicValuesTestCase', 'class', 'modules/field/modules/options/options.test', 'options', 0),
('NodePostSettingsTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeQueryAlter', 'class', 'modules/node/node.test', 'node', 0),
('NodeRevisionsTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeRSSContentTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeSaveTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTitleTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTitleXSSTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTokenReplaceTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTypePersistenceTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTypeTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NoFieldsException', 'class', 'includes/database/database.inc', '', 0),
('NoHelpTestCase', 'class', 'modules/help/help.test', 'help', 0),
('NonDefaultBlockAdmin', 'class', 'modules/block/block.test', 'block', -5),
('NumberFieldTestCase', 'class', 'modules/field/modules/number/number.test', 'number', 0),
('OptionsWidgetsTestCase', 'class', 'modules/field/modules/options/options.test', 'options', 0),
('PageEditTestCase', 'class', 'modules/node/node.test', 'node', 0),
('PageNotFoundTestCase', 'class', 'modules/system/system.test', 'system', 0),
('PagePreviewTestCase', 'class', 'modules/node/node.test', 'node', 0),
('PagerDefault', 'class', 'includes/pager.inc', '', 0),
('PageTitleFiltering', 'class', 'modules/system/system.test', 'system', 0),
('PageViewTestCase', 'class', 'modules/node/node.test', 'node', 0),
('PHPAccessTestCase', 'class', 'modules/php/php.test', 'php', 0),
('PHPFilterTestCase', 'class', 'modules/php/php.test', 'php', 0),
('PHPTestCase', 'class', 'modules/php/php.test', 'php', 0),
('Query', 'class', 'includes/database/query.inc', '', 0),
('QueryAlterableInterface', 'interface', 'includes/database/query.inc', '', 0),
('QueryConditionInterface', 'interface', 'includes/database/query.inc', '', 0),
('QueryExtendableInterface', 'interface', 'includes/database/select.inc', '', 0),
('QueryPlaceholderInterface', 'interface', 'includes/database/query.inc', '', 0),
('QueueTestCase', 'class', 'modules/system/system.test', 'system', 0),
('RemoveFeedItemTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('RemoveFeedTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('RetrieveFileTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SearchAdvancedSearchForm', 'class', 'modules/search/search.test', 'search', 0),
('SearchBlockTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchCommentCountToggleTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchCommentTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchConfigSettingsForm', 'class', 'modules/search/search.test', 'search', 0),
('SearchEmbedForm', 'class', 'modules/search/search.test', 'search', 0),
('SearchExactTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchExcerptTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchExpressionInsertExtractTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchKeywordsConditions', 'class', 'modules/search/search.test', 'search', 0),
('SearchLanguageTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchMatchTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchNumberMatchingTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchNumbersTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchPageOverride', 'class', 'modules/search/search.test', 'search', 0),
('SearchPageText', 'class', 'modules/search/search.test', 'search', 0),
('SearchQuery', 'class', 'modules/search/search.extender.inc', 'search', 0),
('SearchRankingTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchSimplifyTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchTokenizerTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SelectQuery', 'class', 'includes/database/select.inc', '', 0),
('SelectQueryExtender', 'class', 'includes/database/select.inc', '', 0),
('SelectQueryInterface', 'interface', 'includes/database/select.inc', '', 0),
('SelectQuery_pgsql', 'class', 'includes/database/pgsql/select.inc', '', 0),
('SelectQuery_sqlite', 'class', 'includes/database/sqlite/select.inc', '', 0),
('ShutdownFunctionsTest', 'class', 'modules/system/system.test', 'system', 0),
('SiteMaintenanceTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SkipDotsRecursiveDirectoryIterator', 'class', 'includes/filetransfer/filetransfer.inc', '', 0),
('StreamWrapperInterface', 'interface', 'includes/stream_wrappers.inc', '', 0),
('SummaryLengthTestCase', 'class', 'modules/node/node.test', 'node', 0),
('SystemAdminTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SystemAuthorizeCase', 'class', 'modules/system/system.test', 'system', 0),
('SystemBlockTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SystemInfoAlterTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SystemMainContentFallback', 'class', 'modules/system/system.test', 'system', 0),
('SystemQueue', 'class', 'modules/system/system.queue.inc', 'system', 0),
('SystemThemeFunctionalTest', 'class', 'modules/system/system.test', 'system', 0),
('TableSort', 'class', 'includes/tablesort.inc', '', 0),
('TaxonomyHooksTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyLegacyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('DatabaseTransactionOutOfOrderException', 'class', 'includes/database/database.inc', '', 0),
('TaxonomyTermController', 'class', 'modules/taxonomy/taxonomy.module', 'taxonomy', 0),
('TaxonomyTermFieldTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('UserPasswordResetTestCase', 'class', 'modules/user/user.test', 'user', 0),
('TaxonomyThemeTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTokenReplaceTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyVocabularyController', 'class', 'modules/taxonomy/taxonomy.module', 'taxonomy', 0),
('TaxonomyVocabularyFunctionalTest', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('UpdateCoreUnitTestCase', 'class', 'modules/update/update.test', 'update', 0),
('TaxonomyWebTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TestingMailSystem', 'class', 'modules/system/system.mail.inc', 'system', 0),
('TextFieldTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0),
('TextSummaryTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0),
('TextTranslationTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0),
('ThemeUpdater', 'class', 'modules/system/system.updater.inc', 'system', 0),
('TokenReplaceTestCase', 'class', 'modules/system/system.test', 'system', 0),
('TruncateQuery', 'class', 'includes/database/query.inc', '', 0),
('TruncateQuery_mysql', 'class', 'includes/database/mysql/query.inc', '', 0),
('TruncateQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0),
('UpdateCoreTestCase', 'class', 'modules/update/update.test', 'update', 0),
('UpdateFeedItemTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('UpdateFeedTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('UpdateQuery', 'class', 'includes/database/query.inc', '', 0),
('UpdateQuery_pgsql', 'class', 'includes/database/pgsql/query.inc', '', 0),
('UpdateQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0),
('Updater', 'class', 'includes/updater.inc', '', 0),
('UpdaterException', 'class', 'includes/updater.inc', '', 0),
('UpdaterFileTransferException', 'class', 'includes/updater.inc', '', 0),
('UpdateScriptFunctionalTest', 'class', 'modules/system/system.test', 'system', 0),
('UpdateTestContribCase', 'class', 'modules/update/update.test', 'update', 0),
('UpdateTestHelper', 'class', 'modules/update/update.test', 'update', 0),
('UpdateTestUploadCase', 'class', 'modules/update/update.test', 'update', 0),
('UserAccountLinksUnitTests', 'class', 'modules/user/user.test', 'user', 0),
('UserAdminTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserAuthmapAssignmentTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserAutocompleteTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserBlocksUnitTests', 'class', 'modules/user/user.test', 'user', 0),
('UserCancelTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserController', 'class', 'modules/user/user.module', 'user', 0),
('UserCreateTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserEditedOwnAccountTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserEditTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserLoginTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserPermissionsTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserPictureTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserRegistrationTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserRoleAdminTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserRolesAssignmentTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserSaveTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserSignatureTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserTimeZoneFunctionalTest', 'class', 'modules/user/user.test', 'user', 0),
('UserTokenReplaceTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserUserSearchTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserValidateCurrentPassCustomForm', 'class', 'modules/user/user.test', 'user', 0),
('UserValidationTestCase', 'class', 'modules/user/user.test', 'user', 0),
('AggregatorConfigurationTestCase', 'class', 'modules/aggregator/aggregator.test', 'aggregator', 0),
('BlockTemplateSuggestionsUnitTest', 'class', 'modules/block/block.test', 'block', -5),
('BlockHiddenRegionTestCase', 'class', 'modules/block/block.test', 'block', -5),
('BlockInvalidRegionTestCase', 'class', 'modules/block/block.test', 'block', -5),
('CommentThreadingTestCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentNodeChangesTestCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('ContextualDynamicContextTestCase', 'class', 'modules/contextual/contextual.test', 'contextual', 0),
('FieldUIAlterTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0),
('FilePrivateTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FilterSettingsTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('ListDynamicValuesTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0),
('ListDynamicValuesValidationTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0),
('NodeWebTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeLoadMultipleTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessRecordsTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessBaseTableTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeRevisionPermissionsTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessPagerTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessFieldTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeEntityViewModeAlterTest', 'class', 'modules/node/node.test', 'node', 0),
('SystemIndexPhpTest', 'class', 'modules/system/system.test', 'system', 0),
('TaxonomyVocabularyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermFunctionTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyRSSTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermIndexTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyLoadMultipleTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermFieldMultipleVocabularyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyEFQTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('DrupalCacheArray', 'class', 'includes/bootstrap.inc', '', 0),
('SchemaCache', 'class', 'includes/bootstrap.inc', '', 0),
('EntityMalformedException', 'class', 'includes/entity.inc', '', 0),
('ThemeRegistry', 'class', 'includes/theme.inc', '', 0),
('LibrariesTestCase', 'class', 'sites/all/modules/libraries/tests/libraries.test', 'libraries', 0),
('LibrariesUnitTestCase', 'class', 'sites/all/modules/libraries/tests/libraries.test', 'libraries', 0);

-- --------------------------------------------------------

--
-- Table structure for table `registry_file`
--

CREATE TABLE IF NOT EXISTS `registry_file` (
  `filename` varchar(255) NOT NULL,
  `hash` varchar(64) NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registry_file`
--

INSERT INTO `registry_file` (`filename`, `hash`) VALUES
('includes/actions.inc', 'f36b066681463c7dfe189e0430cb1a89bf66f7e228cbb53cdfcd93987193f759'),
('includes/ajax.inc', '03eadc82eeac4fb6c5a417d0092a99f4c6604ab0495f40c0282e9a68bc50431a'),
('includes/archiver.inc', 'bdbb21b712a62f6b913590b609fd17cd9f3c3b77c0d21f68e71a78427ed2e3e9'),
('includes/authorize.inc', '6d64d8c21aa01eb12fc29918732e4df6b871ed06e5d41373cb95c197ed661d13'),
('includes/batch.inc', '059da9e36e1f3717f27840aae73f10dea7d6c8daf16f6520401cc1ca3b4c0388'),
('includes/batch.queue.inc', '554b2e92e1dad0f7fd5a19cb8dff7e109f10fbe2441a5692d076338ec908de0f'),
('includes/bootstrap.inc', 'a33a9e85ccfaf70bcedeab22872ea1ab8ac9f04ade2b1012e61129c846d1f45f'),
('includes/cache-install.inc', 'e7ed123c5805703c84ad2cce9c1ca46b3ce8caeeea0d8ef39a3024a4ab95fa0e'),
('includes/cache.inc', '0a70a291f7ce423d1aab4816ef06a6eaf58b454a03a1f419ff309c1147c4765b'),
('includes/common.inc', 'bc10087927d1e9b41d102a90dd9afd21aaa60762396abf12132c38e06f5885d8'),
('includes/database/database.inc', '8caecb405825809b7861df05dcb194046b6a55677f8f334dc66544452d36270b'),
('includes/database/log.inc', '9feb5a17ae2fabcf26a96d2a634ba73da501f7bcfc3599a693d916a6971d00d1'),
('includes/database/mysql/database.inc', 'd4648a3212519b038654457b83466aabc1b928affdd56076c655ba3d8b79a54b'),
('includes/database/mysql/install.inc', '6ae316941f771732fbbabed7e1d6b4cbb41b1f429dd097d04b3345aa15e461a0'),
('includes/database/mysql/query.inc', '7d9ea18a7ff04b7aab6210abbd0313cb53325c19a47ff8ed6c0e591c6e7149c2'),
('includes/database/mysql/schema.inc', 'd8d3904ea9c23a526c2f2a7acc8ba870b31c378aac2eb53e2e41a73c6209c5bd'),
('includes/database/pgsql/database.inc', '56726100fd44f461a04886c590c9c472cc2b2a1b92eb26c7674bf3821a76bb64'),
('includes/database/pgsql/install.inc', '585b80c5bbd6f134bff60d06397f15154657a577d4da8d1b181858905f09dea5'),
('includes/database/pgsql/query.inc', 'cb4c84f8f1ffc73098ed71137248dcd078a505a7530e60d979d74b3a3cdaa658'),
('includes/database/pgsql/schema.inc', '8fd647e4557522283caef63e528c6e403fc0751a46e94aac867a281af85eac27'),
('includes/database/pgsql/select.inc', 'fd4bba7887c1dc6abc8f080fc3a76c01d92ea085434e355dc1ecb50d8743c22d'),
('includes/database/prefetch.inc', 'b5b207a66a69ecb52ee4f4459af16a7b5eabedc87254245f37cc33bebb61c0fb'),
('includes/database/query.inc', '128b5fdb90562d7f7a9e2662ff6f35251b1370ac215298e2c3297c87ebafd961'),
('includes/database/schema.inc', '7eb7251f331109757173353263d1031493c1198ae17a165a6f5a03d3f14f93e7'),
('includes/database/select.inc', '1c74fa55c7721a704f5ef3389032604bf7a60fced15c40d844aee3e1cead7dc6'),
('includes/database/sqlite/database.inc', 'ed2b9981794239cdad2cd04cf4bcdc896ad4d6b66179a4fa487b0d1ec2150a10'),
('includes/database/sqlite/install.inc', '381f3db8c59837d961978ba3097bb6443534ed1659fd713aa563963fa0c42cc5'),
('includes/database/sqlite/query.inc', '523ff7c05aa2b2aca08cad3743b321868ec772856f2b1c7af908bb236c6919ad'),
('includes/database/sqlite/schema.inc', '238414785aa96dd27f10f48c961783f4d1091392beee8d0e7ca8ae774e917da2'),
('includes/database/sqlite/select.inc', '8d1c426dbd337733c206cce9f59a172546c6ed856d8ef3f1c7bef05a16f7bf68'),
('includes/date.inc', '18c047be64f201e16d189f1cc47ed9dcf0a145151b1ee187e90511b24e5d2b36'),
('includes/entity.inc', '93ed9b3f29fb2a75852af3b4cf03ce0edf3e9eddf19e4b82eeba8659d3d5bc78'),
('includes/errors.inc', '0923cf3303e0e976756d159c80c86bbe039109bd90a35a9aca18027c68abd0aa'),
('includes/file.inc', 'e255d823e2652df64896af1f074beb0903bd63c30fa008089355692e1014c7fd'),
('includes/file.mimetypes.inc', 'f88c967550576694b7a1ce2afd0f2f1bbc1a91d21cc2c20f86c44d39ff353867'),
('includes/filetransfer/filetransfer.inc', 'ad42c3696d317f5ebb100c6aca003b8b52b80148ac9553361eab0731d1169592'),
('includes/filetransfer/ftp.inc', '589ebf4b8bd4a2973aa56a156ac1fa83b6c73e703391361fb573167670e0d832'),
('includes/filetransfer/local.inc', '7cbfdb46abbdf539640db27e66fb30e5265128f31002bd0dfc3af16ae01a9492'),
('includes/filetransfer/ssh.inc', '002e24a24cac133d12728bd3843868ce378681237d7fad420761af84e6efe5ad'),
('includes/form.inc', 'ccec80695ca7e2189783bd56863ee69a46e48f786787febbf2ebd15cf9f3deba'),
('includes/graph.inc', '8e0e313a8bb33488f371df11fc1b58d7cf80099b886cd1003871e2c896d1b536'),
('includes/image.inc', 'ea529f15dc0ac27dbd466ee8a38a9e3eb254c9388dc5a3df5d2033aa9f122e06'),
('includes/install.core.inc', '279ac33cbeba9b5e1e8b0999fc6cd37e10f559bcb9ad8c135aef09a1b2837b64'),
('includes/install.inc', 'b58dc8ba85d84b39196c1c20b57b45ec88ca62040595a34ccd1e72862a3a6363'),
('includes/iso.inc', '27730e6175b79c3b5d494582a124f6210289faa03bef099e16347bb914464c66'),
('includes/language.inc', 'bbb04c7f467d9419ed288fee8a2d092a507c553ee9824740091ca041c8159772'),
('includes/locale.inc', '8cc571c114587f2b30e4e24db17e97e51e81f9cc395fa01f348aba12cee8523e'),
('includes/lock.inc', 'daa62e95528f6b986b85680b600a896452bf2ce6f38921242857dcc5a3460a1b'),
('includes/mail.inc', '1c2f3e2cd0272751d1628b1e998472296164138b6ba054bb02103c416b96d4e9'),
('includes/menu.inc', 'e7d91cd217fce42d7fde220174b212e73acb2b1f4941255d007687a1adfc281b'),
('includes/module.inc', '17e8e3664d69ac4951908144ab119e772d0c67658de51db33a4fc4c6210f056f'),
('includes/pager.inc', '6f9494b85c07a2cc3be4e54aff2d2757485238c476a7da084d25bde1d88be6d8'),
('includes/password.inc', 'aba5df25a237c14cc69335c4cf72d57da130144410ab04d10917d9da21cd606c'),
('includes/path.inc', '1d939d6b59b07ef41e71c9d616c2e9a34712dd81f6110e1a1f280613b3228738'),
('includes/registry.inc', '4ffb8c9c8c179c1417ff01790f339edf50b5f7cc0c8bb976eef6858cc71e9bc8'),
('includes/session.inc', '7e309e8fb83649bcd838490f50dee04d8440f8771601558095a976f29efb0c30'),
('includes/stream_wrappers.inc', 'b04e31585a9a397b0edf7b3586050cbd4b1f631e283296e1c93f4356662faeb9'),
('includes/tablesort.inc', '3f3cb2820920f7edc0c3d046ffba4fc4e3b73a699a2492780371141cf501aa50'),
('includes/theme.inc', 'afc1cc778c7b82fd2a842397094467625559a671d06754993a23eef10216896b'),
('includes/theme.maintenance.inc', 'd110314b4d943c3e965fcefe452f6873b53cd6a8844154467dfcbb2b6142dc82'),
('includes/token.inc', 'a975300558711bb49406a5c7f78294648baa2e5c912cb66f0c78bb2991c0f3c3'),
('includes/unicode.entities.inc', '2b858138596d961fbaa4c6e3986e409921df7f76b6ee1b109c4af5970f1e0f54'),
('includes/unicode.inc', '465d9c1e8e57a525c304cb0c62dac8bb20c2caf011d2e93bcff607b10d4280a9'),
('includes/update.inc', 'fceffc2a28bdf089ef2374e562d52cddfb1cf2eea6ba9d692f78fb65ebed4bc1'),
('includes/updater.inc', 'd2da0e74ed86e93c209f16069f3d32e1a134ceb6c06a0044f78e841a1b54e380'),
('includes/utility.inc', '9b834814fd3f5ef10ce1946be30ef1ddf3f283c749f1ef1a4ebf845ecd524d59'),
('includes/xmlrpc.inc', 'c5b6ea78adeb135373d11aeaaea057d9fa8995faa4e8c0fec9b7c647f15cc4e0'),
('includes/xmlrpcs.inc', '79dc6e9882f4c506123d7dd8e228a61e22c46979c3aab21a5b1afa315ef6639c'),
('modules/aggregator/aggregator.test', '9a33a33d3c9153336e343d0305130d1939c87ebe1ba778908db9076ad53365ec'),
('modules/block/block.test', '7aefd627d62b44f9c1e9ee3aa9da6c6e2a7cfce01c6613e8bd24c0b9c464dd73'),
('modules/color/color.test', '013806279bd47ceb2f82ca854b57f880ba21058f7a2592c422afae881a7f5d15'),
('modules/comment/comment.module', '594bab37ef1f4d0b0f9a54c7a0f620698fa595bc6b61c8e62635f6dda70fe672'),
('modules/comment/comment.test', '5404277c15b1306a1ad5eca6703f7d2003567fea6085ffd2b1c3d65896acdf21'),
('modules/contact/contact.test', '6ad6e1585fef729036e64b58db83be22d09e2df41117036f3969e698533a4a7e'),
('modules/dashboard/dashboard.test', '270378b5c8ed0e7d0e00fbc62e617813c6dec1d79396229786942bf9fb738e16'),
('modules/dblog/dblog.test', '74b2ec1fd67c39edcc30d2460d9c9752311a1fc44c82836a22abff97a704604b'),
('modules/field/field.attach.inc', 'd1d0d7e63ccbe1e184bd137adfd0b17434f7a85ff97c579155bb88130fc1f3c5'),
('modules/field/field.module', '8cdfc5afe890564d7fc9f0cf3ae9a24f13396ae9f42da96b06a2c85290946bbd'),
('modules/field/modules/field_sql_storage/field_sql_storage.test', '8ede9843d771e307dfd3d7e7562976b07e0e0a9310a5cf409413581f199c897f'),
('modules/field/modules/list/tests/list.test', '9f366469763beb3fe0571d66318bac6df293fd15f4eb5cfe4850b9fb9a509f38'),
('modules/field/modules/number/number.test', 'cb55fbc3a1ceed154af673af727b4c5ee6ac2e7dc9d4e1cbc33f3f8e2269146c'),
('modules/field/modules/options/options.test', '8c6dd464fdb5cca90b0260bcfa5f56941b4b28edd879b23a795f0442f5368d4c'),
('modules/field/modules/text/text.test', '9d74c6d039f55dd7d6447a59186da8d48bf20617bfe58424612798f649797586'),
('modules/field/tests/field.test', '83b24244179ffb630f792bbc687907cba6ca480de731520cae8675c6cf1067fc'),
('modules/field_ui/field_ui.test', 'ca549daa46206221863098c6ee5da53a4c647a3016ee5903687804224a44dc9d'),
('modules/file/tests/file.test', '802532f0032f1740592379d7bd9c93f8c453f68b93f11bf0143bd5de648659c8'),
('modules/filter/filter.test', 'f439e0d529cae5089990c7f0c5059ece953ae14c56e8a753d6375acf0f873560'),
('modules/help/help.test', 'c6f03ece30548a6a345afcfac920d85afc418596a19dc4cf43f994391c5050d9'),
('modules/menu/menu.test', 'b8ee602184584fab464900a946090dc1f3d81c15b8176004ee62022814632430'),
('modules/node/node.module', '879ce1cc1800b36f0127b283ea4c2366c31f3954a8b24eb89451dccc16ba0ebd'),
('modules/node/node.test', '993e86ff2fc8dec1e2fae7b3b66cb9c220f130f2d3cf4f9c24c9fe3ba28379ae'),
('modules/php/php.test', '009f628f14137eb137d46c97e0ddef7a0c426707a7b4616c00c6d9446638f243'),
('modules/search/search.extender.inc', 'fea036745113dca3fea52ba956af605c4789f4acfa2ab1650a5843c6e173d7fe'),
('modules/search/search.test', '1fe9dfc982953f42f67d7eee9a855e7248373067ba55cfff001d8a750b83e695'),
('modules/system/system.archiver.inc', 'faa849f3e646a910ab82fd6c8bbf0a4e6b8c60725d7ba81ec0556bd716616cd1'),
('modules/system/system.mail.inc', '3c2c06b55bded609e72add89db41af3bb405d42b9553793acba5fe51be8861d8'),
('modules/system/system.queue.inc', 'caf4feda51bdf7ad62cf782bc23274d367154e51897f2732f07bd06982d85ab1'),
('modules/system/system.tar.inc', '8a31d91f7b3cd7eac25b3fa46e1ed9a8527c39718ba76c3f8c0bbbeaa3aa4086'),
('modules/system/system.test', 'ca539539bea3d2c070552f79dbae279e2872ba9d48af386c89ab6c1fc95488da'),
('modules/system/system.updater.inc', 'e2eeed65b833a6215f807b113f6fb4cc3cc487e93efcb1402ed87c536d2c9ea6'),
('modules/taxonomy/taxonomy.module', '389f4e8e040e99c02b4795983e7b44ffb00e766d2a4b3fa06aca98621073f6b2'),
('modules/taxonomy/taxonomy.test', 'c986487a1ffb9cd75b4ce607494055ddf5a9a82b40f7d7a98175c145a7a17a8c'),
('modules/update/update.test', 'f0c11dfc51716e9dd5980428a416cdead4246435e1dceaff75ce52c5f381d617'),
('modules/user/user.module', 'e3b673f877ae8fe6b741e29eb3a8c094135efaf8155629a48bdfb1cceb6e8aa1'),
('modules/user/user.test', '0cdf12305cce4a65da5be1155925ba2a83b6f5363d6c192f0cfec2985e835e20'),
('modules/contextual/contextual.test', '023dafa199bd325ecc55a17b2a3db46ac0a31e23059f701f789f3bc42427ba0b'),
('includes/json-encode.inc', '02a822a652d00151f79db9aa9e171c310b69b93a12f549bc2ce00533a8efa14e'),
('sites/all/modules/libraries/tests/libraries.test', '6dccb7969e83afd82de3c83af5e0b06c1f27e35ab1069f5f669640eed6d5d4af');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`),
  KEY `name_weight` (`name`,`weight`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`rid`, `name`, `weight`) VALUES
(1, 'anonymous user', 0),
(2, 'authenticated user', 0);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE IF NOT EXISTS `role_permission` (
  `rid` int(10) unsigned NOT NULL,
  `permission` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY (`rid`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`rid`, `permission`, `module`) VALUES
(1, 'access comments', 'comment'),
(1, 'access content', 'node'),
(1, 'access site-wide contact form', 'contact'),
(1, 'post comments', 'comment'),
(1, 'search content', 'search'),
(1, 'use advanced search', 'search'),
(1, 'use text format 1', 'filter'),
(2, 'access comments', 'comment'),
(2, 'access content', 'node'),
(2, 'post comments', 'comment'),
(2, 'skip comment approval', 'comment'),
(2, 'use text format 1', 'filter'),
(2, 'view own unpublished content', 'node');

-- --------------------------------------------------------

--
-- Table structure for table `search_dataset`
--

CREATE TABLE IF NOT EXISTS `search_dataset` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL COMMENT 'Type of item, e.g. node.',
  `data` longtext NOT NULL,
  `reindex` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search_dataset`
--

INSERT INTO `search_dataset` (`sid`, `type`, `data`, `reindex`) VALUES
(8, 'node', ' testing new page content type hello  ', 0),
(4, 'node', ' brazilian vacations lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arc porttitentum dealiquet ut risus nisi scelerisque in convallis et volutpat ada elit lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti nulla luctus temus augue dictum cursus curabitur non risus dui in sit amet tellus in lacus fringilla condimentuma t sit amet libero fusce purus ligula hendrerit ut vulputate eget vestibulum non diam vestib ulum facilisis leo id volutpat vestibulum eros ligula ornare urna pellentesque laoreet magna purus ac metus nulla facilisi beach vacation ocean sea photography ', 1363363115),
(7, 'node', ' content attachment size mtt300x250bannerjpg 159 kb a simple page to carry some resources images as attachments  ', 0),
(6, 'node', ' contact us lorem ipsum dolor sit amet consectetur adipiscing elit fusce vestibulum vehicula nisi ac vehic ula fusce malesuada est id enim dignissim mattis phasellus id tellus nunc in vehicula nisi fusce pellentesque augue adipiscing sagittis tincidunt mi magna sodales dolor vitae ornare ipsum nunc et augue nulla sapien enim rutrum sed pretium at euismod sed augue vestibul um quis nibh nisl facilisis adipiscing massa aliquam erat volutpat your name email adress subject your message send message  ', 0),
(3, 'node', ' about ipadmasters lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti nulla luctus temus augue dictum cursus curabitur non risus dui in sit amet tellus in lacus fringilla condimentuma t sit amet libero fusce purus ligula hendrerit ut vulputate eget vestibulum non diam vestib ulum facilisis leo id volutpat vestibulum eros ligula ornare urna pellentesque laoreet magna purus ac metus nulla facilisi mauris et risus nulla at venenatis turpis duis egestas elit eu imperdiet rhoncus nulla mi tem por dui eu dignissim odio mi vitae quam ut at tempus diam quisque accumsan ullamcorper nisl ut mollis orci suscipit in phasellus sagittis interdum nunc ultrices rhoncus est accumsan id sed blandit cursus sapien phasellus lacus arcu consequat non egestas eu vestibulum eu turpis nunc ut tortor sed felis auctor tincidunt sed at arcu lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arc porttitentum dealiquet ut risus nisi scelerisque in convallis et volutpat ada elit lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti nulla luctus temus augue dictum cursus curabitur non risus dui in sit amet tellus in lacus fringilla condimentuma t sit amet libero fusce purus ligula hendrerit ut vulputate eget vestibulum non diam vestib ulum facilisis leo id volutpat vestibulum eros ligula ornare urna pellentesque laoreet magna purus ac metus nulla facilisi lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti nulla luctus temus augue dictum cursus curabitur non risus dui in sit amet tellus in lacus fringilla condimentuma t sit amet libero fusce purus ligula hendrerit ut vulputate eget vestibulum non diam vestib ulum facilisis leo id volutpat vestibulum eros ligula lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi  ', 0),
(1, 'node', ' portfolio this is a heading 1 lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua this is a heading 2 lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua this is a linked heading 2 title class lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua this is a heading 3 lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua this is a heading 4 lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua a normal paragraph of text with inline links lorem ipsum dosectetur adipisicing elit sed do lorem ipsum dolor sit amet  this is a link elit labolore magna aliqua ut enim ad minim veniam lorem ipsum dosectetur adipisicing elit sed do lorem ipsum dolor sit amet consectetur adipisicing elit lorem ipsum dosectetur adipisicing elit sed do lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labolore magna aliqua ut enim ad minim veniam lorem ipsum dosectetur adipisicing elit sed do quoted text dosectetur adipisicing elit sed dolorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labolore magna aliqua ut enim ad minim veniam lorem ipsum dosectetur adipisicing elit sed dolorem ipsum dolor sit amet consectetur adipisicing ordered list this is a sample ordered list  lorem ipsum dolor sit amet consectetuer condimentum quis congue quisque augue elit dolor something goes here and another here then one more congue quisque augue elit dolor nibh unordered list this is a sample unordered list  condimentum quis congue quisque augue elit dolor something goes here and another here something here as well something here as well something here as well then one more nunc cursus sem et pretium sapien eget header h1 a display block height 80px width 300px sample status message page typography has been updated sample error message there is a security update available for your version of drupal to ensure the security of your server you should update immediately see the available updates page for more information sample warning message lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua account information header 1 header 2 row 1 cell 1 row 1 cell 2 row 2 cell 1 row 2 cell 2 row 3 cell 1 row 3 cell 2  ', 0),
(2, 'node', ' creation of beaches lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arc porttitentum dealiquet ut risus nisi scelerisque in convallis et volutpat ada elit lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti nulla luctus temus augue dictum cursus curabitur non risus dui in sit amet tellus in lacus fringilla condimentuma t sit amet libero fusce purus ligula hendrerit ut vulputate eget vestibulum non diam vestib ulum facilisis leo id volutpat vestibulum eros ligula ornare urna pellentesque laoreet magna purus ac metus nulla facilisi beach vacation ocean sea photography ', 1363363128),
(5, 'node', ' jamaica secrets lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arc porttitentum dealiquet ut risus nisi scelerisque in convallis et volutpat ada elit lorem ipsum dolor sit amet consectetur adipiscing elit nullam et risus non arcu porttitor feugi at in at neque in hac habitasse platea dictumst proin pretium neque at turpis fermentum de aliquet ut risus nisi scelerisque in convallis et volutpat malesuada elit ut nulla libero condi entum eget scelerisque eget blandit sit amet metus suspendisse potenti nulla luctus temus augue dictum cursus curabitur non risus dui in sit amet tellus in lacus fringilla condimentuma t sit amet libero fusce purus ligula hendrerit ut vulputate eget vestibulum non diam vestib ulum facilisis leo id volutpat vestibulum eros ligula ornare urna pellentesque laoreet magna purus ac metus nulla facilisi beach vacation ocean sea photography submitted by admin on fri 3182011 1857 before installing drupal please review the system requirements get started by downloading the official drupal core files these official releases come bundled with a variety of modules and themes to give you a good starting point to help build your site drupal core includes basic community features like blogging forums and contact forms and can be easily extended by downloading other contributed modules and themes reply submitted by admin on fri 3182011 1907 information on version numbers can be found in the online docume if you are using internet explorer and winzip save the file first as otherwise ie will corrupt the file s extension reply ', 1363363128);

-- --------------------------------------------------------

--
-- Table structure for table `search_index`
--

CREATE TABLE IF NOT EXISTS `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` float DEFAULT NULL,
  PRIMARY KEY (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search_index`
--

INSERT INTO `search_index` (`word`, `sid`, `type`, `score`) VALUES
('extension', 5, 'node', 0.839384),
('corrupt', 5, 'node', 0.842342),
('will', 5, 'node', 0.845322),
('otherwise', 5, 'node', 0.848323),
('first', 5, 'node', 0.851346),
('file', 5, 'node', 1.69377),
('hello', 8, 'node', 1),
('type', 8, 'node', 26),
('content', 8, 'node', 26),
('page', 8, 'node', 26),
('new', 8, 'node', 26),
('testing', 8, 'node', 26),
('eros', 4, 'node', 1),
('photography', 2, 'node', 11),
('sea', 2, 'node', 11),
('ocean', 2, 'node', 11),
('ornare', 4, 'node', 1),
('leo', 4, 'node', 1),
('facilisis', 4, 'node', 1),
('ulum', 4, 'node', 1),
('vestib', 4, 'node', 1),
('diam', 4, 'node', 1),
('save', 5, 'node', 0.857458),
('winzip', 5, 'node', 0.860547),
('explorer', 5, 'node', 0.863659),
('internet', 5, 'node', 0.866793),
('using', 5, 'node', 0.869951),
('are', 5, 'node', 0.873132),
('docume', 5, 'node', 22.7848),
('online', 5, 'node', 22.8687),
('found', 5, 'node', 22.9533),
('numbers', 5, 'node', 23.0385),
('cell', 1, 'node', 6),
('row', 1, 'node', 6),
('account', 1, 'node', 1),
('warning', 1, 'node', 1),
('information', 1, 'node', 2),
('updates', 1, 'node', 1),
('see', 1, 'node', 1),
('immediately', 1, 'node', 1),
('should', 1, 'node', 1),
('you', 1, 'node', 1),
('server', 1, 'node', 1),
('the', 1, 'node', 2),
('ensure', 1, 'node', 1),
('drupal', 1, 'node', 1),
('version', 1, 'node', 1),
('your', 1, 'node', 2),
('for', 1, 'node', 2),
('available', 1, 'node', 2),
('update', 1, 'node', 2),
('security', 1, 'node', 2),
('there', 1, 'node', 1),
('error', 1, 'node', 1),
('updated', 1, 'node', 1),
('been', 1, 'node', 1),
('has', 1, 'node', 1),
('typography', 1, 'node', 4),
('page', 1, 'node', 2),
('message', 1, 'node', 3),
('status', 1, 'node', 1),
('300px', 1, 'node', 1),
('width', 1, 'node', 1),
('80px', 1, 'node', 1),
('height', 1, 'node', 1),
('block', 1, 'node', 1),
('display', 1, 'node', 1),
('header', 1, 'node', 3),
('eget', 1, 'node', 1),
('sapien', 1, 'node', 1),
('pretium', 1, 'node', 1),
('sem', 1, 'node', 1),
('cursus', 1, 'node', 1),
('nunc', 1, 'node', 1),
('well', 1, 'node', 3),
('unordered', 1, 'node', 23),
('nibh', 1, 'node', 1),
('more', 1, 'node', 3),
('one', 1, 'node', 2),
('then', 1, 'node', 2),
('another', 1, 'node', 2),
('and', 1, 'node', 2),
('here', 1, 'node', 7),
('goes', 1, 'node', 2),
('something', 1, 'node', 5),
('augue', 1, 'node', 3),
('quisque', 1, 'node', 3),
('congue', 1, 'node', 3),
('quis', 1, 'node', 2),
('condimentum', 1, 'node', 2),
('consectetuer', 1, 'node', 1),
('sample', 1, 'node', 5),
('list', 1, 'node', 46),
('ordered', 1, 'node', 23),
('dolorem', 1, 'node', 2),
('quoted', 1, 'node', 1),
('veniam', 1, 'node', 3),
('minim', 1, 'node', 3),
('enim', 1, 'node', 3),
('labolore', 1, 'node', 3),
('link', 1, 'node', 11),
('dosectetur', 1, 'node', 6),
('links', 1, 'node', 1),
('inline', 1, 'node', 1),
('with', 1, 'node', 1),
('text', 1, 'node', 2),
('paragraph', 1, 'node', 1),
('normal', 1, 'node', 1),
('4', 1, 'node', 13),
('3', 1, 'node', 18),
('class', 1, 'node', 29),
('title', 1, 'node', 29),
('linked', 1, 'node', 29),
('2', 1, 'node', 54),
('aliqua', 1, 'node', 9),
('magna', 1, 'node', 9),
('dolore', 1, 'node', 6),
('labore', 1, 'node', 6),
('incididunt', 1, 'node', 18),
('tempor', 1, 'node', 18),
('eiusmod', 1, 'node', 18),
('sed', 1, 'node', 14),
('elit', 1, 'node', 19),
('adipisicing', 1, 'node', 16),
('consectetur', 1, 'node', 10),
('amet', 1, 'node', 12),
('sit', 1, 'node', 12),
('dolor', 1, 'node', 15),
('ipsum', 1, 'node', 17),
('lorem', 1, 'node', 15),
('1', 1, 'node', 32),
('heading', 1, 'node', 103),
('this', 1, 'node', 116),
('portfolio', 1, 'node', 26),
('vacation', 2, 'node', 11),
('beach', 2, 'node', 11),
('facilisi', 2, 'node', 1),
('magna', 2, 'node', 1),
('laoreet', 2, 'node', 1),
('pellentesque', 2, 'node', 1),
('urna', 2, 'node', 1),
('ornare', 2, 'node', 1),
('eros', 2, 'node', 1),
('leo', 2, 'node', 1),
('facilisis', 2, 'node', 1),
('ulum', 2, 'node', 1),
('vestib', 2, 'node', 1),
('diam', 2, 'node', 1),
('vestibulum', 2, 'node', 2),
('vulputate', 2, 'node', 1),
('hendrerit', 2, 'node', 1),
('ligula', 2, 'node', 2),
('purus', 2, 'node', 2),
('fusce', 2, 'node', 1),
('malesuada', 3, 'node', 2.96986),
('nulla', 3, 'node', 9.92465),
('consequat', 3, 'node', 1),
('sapien', 3, 'node', 1),
('sed', 3, 'node', 3),
('est', 3, 'node', 1),
('ultrices', 3, 'node', 1),
('nunc', 3, 'node', 2),
('interdum', 3, 'node', 1),
('sagittis', 3, 'node', 1),
('phasellus', 3, 'node', 2),
('suscipit', 3, 'node', 1),
('orci', 3, 'node', 1),
('mollis', 3, 'node', 1),
('nisl', 3, 'node', 1),
('ullamcorper', 3, 'node', 1),
('accumsan', 3, 'node', 2),
('quisque', 3, 'node', 1),
('tempus', 3, 'node', 1),
('quam', 3, 'node', 1),
('vitae', 3, 'node', 1),
('odio', 3, 'node', 1),
('dignissim', 3, 'node', 1),
('por', 3, 'node', 1),
('tem', 3, 'node', 1),
('rhoncus', 3, 'node', 2),
('imperdiet', 3, 'node', 1),
('egestas', 3, 'node', 2),
('duis', 3, 'node', 1),
('mauris', 3, 'node', 1),
('venenatis', 3, 'node', 1),
('facilisi', 3, 'node', 1.98493),
('magna', 3, 'node', 1.98493),
('laoreet', 3, 'node', 1.98493),
('pellentesque', 3, 'node', 1.98493),
('urna', 3, 'node', 1.98493),
('ornare', 3, 'node', 1.98493),
('eros', 3, 'node', 2.96986),
('leo', 3, 'node', 2.96986),
('facilisis', 3, 'node', 2.96986),
('ulum', 3, 'node', 2.96986),
('vestib', 3, 'node', 2.96986),
('diam', 3, 'node', 3.96986),
('vestibulum', 3, 'node', 6.93972),
('vulputate', 3, 'node', 2.96986),
('hendrerit', 3, 'node', 2.96986),
('purus', 3, 'node', 4.95479),
('ligula', 3, 'node', 5.93972),
('fusce', 3, 'node', 2.96986),
('condimentuma', 3, 'node', 2.96986),
('fringilla', 3, 'node', 2.96986),
('lacus', 3, 'node', 3.96986),
('tellus', 3, 'node', 2.96986),
('dui', 3, 'node', 3.96986),
('curabitur', 3, 'node', 2.96986),
('cursus', 3, 'node', 3.96986),
('dictum', 3, 'node', 2.96986),
('augue', 3, 'node', 2.96986),
('luctus', 3, 'node', 2.96986),
('temus', 3, 'node', 2.96986),
('potenti', 3, 'node', 2.96986),
('suspendisse', 3, 'node', 2.96986),
('metus', 3, 'node', 4.95479),
('blandit', 3, 'node', 3.96986),
('eget', 3, 'node', 8.90958),
('entum', 3, 'node', 2.96986),
('condi', 3, 'node', 2.96986),
('vestibulum', 4, 'node', 2),
('vulputate', 4, 'node', 1),
('hendrerit', 4, 'node', 1),
('ligula', 4, 'node', 2),
('purus', 4, 'node', 2),
('fusce', 4, 'node', 1),
('condimentuma', 4, 'node', 1),
('fringilla', 4, 'node', 1),
('lacus', 4, 'node', 1),
('tellus', 4, 'node', 1),
('dui', 4, 'node', 1),
('curabitur', 4, 'node', 1),
('cursus', 4, 'node', 1),
('dictum', 4, 'node', 1),
('augue', 4, 'node', 1),
('temus', 4, 'node', 1),
('luctus', 4, 'node', 1),
('ada', 4, 'node', 1),
('dealiquet', 4, 'node', 1),
('version', 5, 'node', 23.1243),
('information', 5, 'node', 23.2108),
('1907', 5, 'node', 0.896076),
('reply', 5, 'node', 19.0949),
('contributed', 5, 'node', 0.902857),
('other', 5, 'node', 0.906287),
('extended', 5, 'node', 0.909743),
('easily', 5, 'node', 0.913226),
('can', 5, 'node', 23.87),
('forms', 5, 'node', 0.920273),
('contact', 5, 'node', 0.923838),
('forums', 5, 'node', 0.927431),
('blogging', 5, 'node', 0.931053),
('like', 5, 'node', 0.934703),
('features', 5, 'node', 0.938382),
('community', 5, 'node', 0.942091),
('basic', 5, 'node', 0.945829),
('includes', 5, 'node', 0.949597),
('site', 5, 'node', 0.953396),
('your', 5, 'node', 0.957226),
('build', 5, 'node', 0.961087),
('help', 5, 'node', 0.96498),
('point', 5, 'node', 0.968904),
('starting', 5, 'node', 0.972861),
('good', 5, 'node', 0.976851),
('you', 5, 'node', 1.85401),
('give', 5, 'node', 0.98493),
('themes', 5, 'node', 1.88847),
('and', 5, 'node', 4.59372),
('modules', 5, 'node', 1.89676),
('variety', 5, 'node', 1),
('with', 5, 'node', 1),
('bundled', 5, 'node', 1),
('massa', 6, 'node', 1),
('facilisis', 6, 'node', 1),
('nisl', 6, 'node', 1),
('nibh', 6, 'node', 1),
('quis', 6, 'node', 1),
('vestibul', 6, 'node', 1),
('euismod', 6, 'node', 1),
('pretium', 6, 'node', 1),
('sed', 6, 'node', 2),
('rutrum', 6, 'node', 1),
('sapien', 6, 'node', 1),
('nulla', 6, 'node', 1),
('ornare', 6, 'node', 1),
('vitae', 6, 'node', 1),
('sodales', 6, 'node', 1),
('magna', 6, 'node', 1),
('tincidunt', 6, 'node', 1),
('sagittis', 6, 'node', 1),
('augue', 6, 'node', 3),
('pellentesque', 6, 'node', 1),
('nunc', 6, 'node', 2),
('tellus', 6, 'node', 1),
('phasellus', 6, 'node', 1),
('mattis', 6, 'node', 1),
('dignissim', 6, 'node', 1),
('enim', 6, 'node', 2),
('est', 6, 'node', 1),
('malesuada', 6, 'node', 1),
('ula', 6, 'node', 1),
('vehic', 6, 'node', 1),
('nisi', 6, 'node', 2),
('vehicula', 6, 'node', 2),
('vestibulum', 6, 'node', 1),
('fusce', 6, 'node', 3),
('elit', 6, 'node', 1),
('adipiscing', 6, 'node', 3),
('consectetur', 6, 'node', 1),
('amet', 6, 'node', 1),
('sit', 6, 'node', 1),
('dolor', 6, 'node', 2),
('ipsum', 6, 'node', 2),
('lorem', 6, 'node', 1),
('contact', 6, 'node', 26),
('content', 7, 'node', 26),
('attachment', 7, 'node', 1),
('size', 7, 'node', 1),
('mtt300x250bannerjpg', 7, 'node', 11),
('159', 7, 'node', 1),
('simple', 7, 'node', 1),
('page', 7, 'node', 1),
('carry', 7, 'node', 1),
('some', 7, 'node', 1),
('resources', 7, 'node', 1),
('images', 7, 'node', 1),
('attachments', 7, 'node', 1),
('libero', 3, 'node', 5.93972),
('volutpat', 3, 'node', 6.92874),
('convallis', 3, 'node', 3.95888),
('scelerisque', 3, 'node', 6.92874),
('nisi', 3, 'node', 3.95888),
('aliquet', 3, 'node', 2.96986),
('fermentum', 3, 'node', 2.96986),
('turpis', 3, 'node', 4.96986),
('pretium', 3, 'node', 2.96986),
('proin', 3, 'node', 2.96986),
('dictumst', 3, 'node', 2.96986),
('platea', 3, 'node', 2.96986),
('habitasse', 3, 'node', 2.96986),
('hac', 3, 'node', 2.96986),
('neque', 3, 'node', 5.93972),
('feugi', 3, 'node', 3.95479),
('porttitor', 3, 'node', 3.95479),
('arcu', 3, 'node', 5.95479),
('non', 3, 'node', 11.8945),
('aliquam', 6, 'node', 1),
('erat', 6, 'node', 1),
('volutpat', 6, 'node', 1),
('your', 6, 'node', 2),
('name', 6, 'node', 1),
('email', 6, 'node', 1),
('adress', 6, 'node', 1),
('subject', 6, 'node', 1),
('message', 6, 'node', 2),
('send', 6, 'node', 1),
('risus', 3, 'node', 12.8835),
('nullam', 3, 'node', 4.95479),
('elit', 3, 'node', 9.90958),
('adipiscing', 3, 'node', 4.95479),
('consectetur', 3, 'node', 4.95479),
('amet', 3, 'node', 13.8644),
('sit', 3, 'node', 13.8644),
('dolor', 3, 'node', 4.95479),
('ipsum', 3, 'node', 4.95479),
('lorem', 3, 'node', 4.95479),
('ipadmasters', 3, 'node', 26),
('about', 3, 'node', 26),
('come', 5, 'node', 1),
('releases', 5, 'node', 1),
('these', 5, 'node', 1),
('files', 5, 'node', 1),
('core', 5, 'node', 1.9496),
('official', 5, 'node', 2),
('downloading', 5, 'node', 1.90629),
('started', 5, 'node', 1),
('porttitentum', 4, 'node', 1),
('arc', 4, 'node', 1),
('suspendisse', 4, 'node', 2),
('condimentuma', 2, 'node', 1),
('fringilla', 2, 'node', 1),
('lacus', 2, 'node', 1),
('tellus', 2, 'node', 1),
('tortor', 3, 'node', 1),
('felis', 3, 'node', 1),
('auctor', 3, 'node', 1),
('tincidunt', 3, 'node', 1),
('arc', 3, 'node', 1),
('porttitentum', 3, 'node', 0.997306),
('dealiquet', 3, 'node', 0.993146),
('ada', 3, 'node', 0.989021),
('get', 5, 'node', 1),
('requirements', 5, 'node', 26),
('system', 5, 'node', 26),
('the', 5, 'node', 51.5625),
('review', 5, 'node', 26),
('please', 5, 'node', 26),
('drupal', 5, 'node', 27.9496),
('installing', 5, 'node', 26),
('before', 5, 'node', 26),
('1857', 5, 'node', 1),
('3182011', 5, 'node', 1.89608),
('fri', 5, 'node', 1.89608),
('admin', 5, 'node', 1.89608),
('submitted', 5, 'node', 1.89608),
('photography', 5, 'node', 11),
('sea', 5, 'node', 11),
('ocean', 5, 'node', 11),
('vacation', 5, 'node', 11),
('beach', 5, 'node', 11),
('facilisi', 5, 'node', 1),
('magna', 5, 'node', 1),
('laoreet', 5, 'node', 1),
('pellentesque', 5, 'node', 1),
('urna', 5, 'node', 1),
('ornare', 5, 'node', 1),
('eros', 5, 'node', 1),
('leo', 5, 'node', 1),
('facilisis', 5, 'node', 1),
('ulum', 5, 'node', 1),
('vestib', 5, 'node', 1),
('diam', 5, 'node', 1),
('vestibulum', 5, 'node', 2),
('vulputate', 5, 'node', 1),
('hendrerit', 5, 'node', 1),
('ligula', 5, 'node', 2),
('purus', 5, 'node', 2),
('fusce', 5, 'node', 1),
('condimentuma', 5, 'node', 1),
('fringilla', 5, 'node', 1),
('lacus', 5, 'node', 1),
('tellus', 5, 'node', 1),
('dui', 5, 'node', 1),
('curabitur', 5, 'node', 1),
('cursus', 5, 'node', 1),
('dictum', 5, 'node', 1),
('augue', 5, 'node', 1),
('temus', 5, 'node', 1),
('luctus', 5, 'node', 1),
('ada', 5, 'node', 1),
('dealiquet', 5, 'node', 1),
('porttitentum', 5, 'node', 1),
('arc', 5, 'node', 1),
('potenti', 5, 'node', 2),
('suspendisse', 5, 'node', 2),
('metus', 5, 'node', 3),
('blandit', 5, 'node', 2),
('eget', 5, 'node', 5),
('entum', 5, 'node', 2),
('condi', 5, 'node', 2),
('libero', 5, 'node', 3),
('nulla', 5, 'node', 4),
('malesuada', 5, 'node', 2),
('volutpat', 5, 'node', 4),
('dui', 2, 'node', 1),
('curabitur', 2, 'node', 1),
('cursus', 2, 'node', 1),
('dictum', 2, 'node', 1),
('augue', 2, 'node', 1),
('temus', 2, 'node', 1),
('luctus', 2, 'node', 1),
('convallis', 5, 'node', 3),
('scelerisque', 5, 'node', 5),
('nisi', 5, 'node', 3),
('aliquet', 5, 'node', 2),
('fermentum', 5, 'node', 2),
('turpis', 5, 'node', 2),
('pretium', 5, 'node', 2),
('proin', 5, 'node', 2),
('dictumst', 5, 'node', 2),
('platea', 5, 'node', 2),
('habitasse', 5, 'node', 2),
('hac', 5, 'node', 2),
('neque', 5, 'node', 4),
('feugi', 5, 'node', 2),
('porttitor', 5, 'node', 2),
('arcu', 5, 'node', 2),
('non', 5, 'node', 5),
('risus', 5, 'node', 7),
('nullam', 5, 'node', 3),
('elit', 5, 'node', 6),
('adipiscing', 5, 'node', 3),
('consectetur', 5, 'node', 3),
('amet', 5, 'node', 7),
('sit', 5, 'node', 7),
('dolor', 5, 'node', 3),
('ipsum', 5, 'node', 3),
('lorem', 5, 'node', 3),
('ada', 2, 'node', 1),
('dealiquet', 2, 'node', 1),
('porttitentum', 2, 'node', 1),
('arc', 2, 'node', 1),
('potenti', 2, 'node', 2),
('secrets', 5, 'node', 26),
('jamaica', 5, 'node', 26),
('potenti', 4, 'node', 2),
('metus', 4, 'node', 3),
('blandit', 4, 'node', 2),
('eget', 4, 'node', 5),
('condi', 4, 'node', 2),
('suspendisse', 2, 'node', 2),
('metus', 2, 'node', 3),
('entum', 4, 'node', 2),
('libero', 4, 'node', 3),
('nulla', 4, 'node', 4),
('blandit', 2, 'node', 2),
('eget', 2, 'node', 5),
('entum', 2, 'node', 2),
('condi', 2, 'node', 2),
('malesuada', 4, 'node', 2),
('libero', 2, 'node', 3),
('volutpat', 4, 'node', 4),
('convallis', 4, 'node', 3),
('nulla', 2, 'node', 4),
('scelerisque', 4, 'node', 5),
('nisi', 4, 'node', 3),
('malesuada', 2, 'node', 2),
('volutpat', 2, 'node', 4),
('convallis', 2, 'node', 3),
('scelerisque', 2, 'node', 5),
('nisi', 2, 'node', 3),
('aliquet', 2, 'node', 2),
('fermentum', 2, 'node', 2),
('turpis', 2, 'node', 2),
('pretium', 2, 'node', 2),
('proin', 2, 'node', 2),
('dictumst', 2, 'node', 2),
('platea', 2, 'node', 2),
('habitasse', 2, 'node', 2),
('hac', 2, 'node', 2),
('neque', 2, 'node', 4),
('feugi', 2, 'node', 2),
('porttitor', 2, 'node', 2),
('arcu', 2, 'node', 2),
('non', 2, 'node', 5),
('risus', 2, 'node', 7),
('nullam', 2, 'node', 3),
('elit', 2, 'node', 6),
('adipiscing', 2, 'node', 3),
('consectetur', 2, 'node', 3),
('amet', 2, 'node', 7),
('sit', 2, 'node', 7),
('dolor', 2, 'node', 3),
('ipsum', 2, 'node', 3),
('fermentum', 4, 'node', 2),
('lorem', 2, 'node', 3),
('beaches', 2, 'node', 26),
('creation', 2, 'node', 26),
('aliquet', 4, 'node', 2),
('turpis', 4, 'node', 2),
('pretium', 4, 'node', 2),
('proin', 4, 'node', 2),
('dictumst', 4, 'node', 2),
('platea', 4, 'node', 2),
('habitasse', 4, 'node', 2),
('hac', 4, 'node', 2),
('neque', 4, 'node', 4),
('feugi', 4, 'node', 2),
('porttitor', 4, 'node', 2),
('arcu', 4, 'node', 2),
('non', 4, 'node', 5),
('risus', 4, 'node', 7),
('nullam', 4, 'node', 3),
('elit', 4, 'node', 6),
('adipiscing', 4, 'node', 3),
('consectetur', 4, 'node', 3),
('amet', 4, 'node', 7),
('sit', 4, 'node', 7),
('dolor', 4, 'node', 3),
('ipsum', 4, 'node', 3),
('lorem', 4, 'node', 3),
('vacations', 4, 'node', 26),
('brazilian', 4, 'node', 26),
('urna', 4, 'node', 1),
('pellentesque', 4, 'node', 1),
('laoreet', 4, 'node', 1),
('magna', 4, 'node', 1),
('facilisi', 4, 'node', 1),
('beach', 4, 'node', 11),
('vacation', 4, 'node', 11),
('ocean', 4, 'node', 11),
('sea', 4, 'node', 11),
('photography', 4, 'node', 11);

-- --------------------------------------------------------

--
-- Table structure for table `search_node_links`
--

CREATE TABLE IF NOT EXISTS `search_node_links` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `caption` longtext,
  PRIMARY KEY (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `search_total`
--

CREATE TABLE IF NOT EXISTS `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `count` float DEFAULT NULL,
  PRIMARY KEY (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search_total`
--

INSERT INTO `search_total` (`word`, `count`) VALUES
('portfolio', 0.01639),
('this', 0.003728),
('heading', 0.004196),
('1', 0.013364),
('lorem', 0.0142616),
('ipsum', 0.0129825),
('dolor', 0.0138081),
('sit', 0.00897995),
('amet', 0.00897995),
('consectetur', 0.0170636),
('adipisicing', 0.026329),
('elit', 0.00897157),
('sed', 0.022276),
('eiusmod', 0.023481),
('tempor', 0.023481),
('incididunt', 0.023481),
('labore', 0.066947),
('dolore', 0.066947),
('magna', 0.028056),
('aliqua', 0.045757),
('2', 0.007969),
('linked', 0.014723),
('title', 0.014723),
('class', 0.014723),
('3', 0.023481),
('4', 0.032185),
('drupal', 0.0147485),
('sample', 0.079181),
('message', 0.079181),
('the', 0.00803343),
('and', 0.0613241),
('available', 0.176091),
('status', 0.30103),
('page', 0.014723),
('typography', 0.09691),
('has', 0.30103),
('been', 0.30103),
('updated', 0.30103),
('error', 0.30103),
('there', 0.30103),
('security', 0.176091),
('update', 0.176091),
('for', 0.176091),
('your', 0.0798054),
('version', 0.0176392),
('ensure', 0.30103),
('server', 0.30103),
('you', 0.130458),
('should', 0.30103),
('immediately', 0.30103),
('see', 0.30103),
('updates', 0.30103),
('more', 0.124939),
('information', 0.0168936),
('warning', 0.30103),
('one', 0.176091),
('header', 0.124939),
('display', 0.30103),
('block', 0.30103),
('height', 0.30103),
('80px', 0.30103),
('width', 0.30103),
('300px', 0.30103),
('text', 0.176091),
('consectetuer', 0.30103),
('adipiscing', 0.0248879),
('odio', 0.128714),
('quisque', 0.09691),
('volutpat', 0.0212632),
('mattis', 0.129183),
('eros', 0.0672599),
('nullam', 0.030057),
('malesuada', 0.041512),
('erat', 0.129797),
('turpis', 0.037888),
('suspendisse', 0.0459034),
('urna', 0.0794),
('nibh', 0.176091),
('non', 0.0158551),
('suscipit', 0.130981),
('extension', 0.30103),
('paragraph', 0.30103),
('with', 0.176091),
('links', 0.30103),
('ordered', 0.018483),
('list', 0.00934),
('condimentum', 0.176091),
('quis', 0.124939),
('congue', 0.124939),
('augue', 0.0348462),
('something', 0.079181),
('goes', 0.176091),
('here', 0.057992),
('another', 0.176091),
('then', 0.176091),
('unordered', 0.018483),
('well', 0.124939),
('nunc', 0.079181),
('cursus', 0.051335),
('sem', 0.30103),
('pretium', 0.037888),
('sapien', 0.124939),
('eget', 0.017094),
('corrupt', 0.30103),
('account', 0.30103),
('will', 0.30103),
('otherwise', 0.30103),
('first', 0.30103),
('file', 0.201506),
('save', 0.30103),
('winzip', 0.30103),
('explorer', 0.30103),
('internet', 0.30103),
('using', 0.30103),
('are', 0.30103),
('1907', 0.30103),
('docume', 0.0186543),
('online', 0.0185873),
('found', 0.0185202),
('numbers', 0.0184532),
('reply', 0.0221685),
('contributed', 0.30103),
('other', 0.30103),
('extended', 0.30103),
('easily', 0.30103),
('can', 0.0178234),
('forms', 0.30103),
('forums', 0.30103),
('blogging', 0.30103),
('like', 0.30103),
('features', 0.30103),
('community', 0.30103),
('basic', 0.30103),
('includes', 0.30103),
('site', 0.30103),
('build', 0.30103),
('help', 0.30103),
('point', 0.30103),
('starting', 0.30103),
('about', 0.015531),
('good', 0.30103),
('give', 0.30103),
('themes', 0.184557),
('modules', 0.1839),
('variety', 0.30103),
('bundled', 0.30103),
('come', 0.30103),
('releases', 0.30103),
('these', 0.30103),
('files', 0.30103),
('core', 0.179818),
('official', 0.176091),
('downloading', 0.18315),
('started', 0.30103),
('get', 0.30103),
('1857', 0.30103),
('3182011', 0.183954),
('fri', 0.183954),
('admin', 0.183954),
('submitted', 0.183954),
('requirements', 0.0163904),
('system', 0.0163904),
('review', 0.0163904),
('please', 0.0163904),
('installing', 0.0163904),
('before', 0.0163904),
('hello', 0.30103),
('type', 0.01639),
('new', 0.01639),
('testing', 0.01639),
('creation', 0.0163904),
('beaches', 0.0163904),
('risus', 0.0126318),
('arcu', 0.0348884),
('porttitor', 0.041572),
('feugi', 0.041572),
('neque', 0.0235579),
('hac', 0.0459034),
('habitasse', 0.0459034),
('platea', 0.0459034),
('dictumst', 0.0459034),
('proin', 0.0459034),
('fermentum', 0.0459034),
('aliquet', 0.0459034),
('nisi', 0.0281033),
('scelerisque', 0.0193665),
('convallis', 0.0322831),
('nulla', 0.0185429),
('libero', 0.0281382),
('condi', 0.0459034),
('entum', 0.0459034),
('blandit', 0.041512),
('metus', 0.030057),
('potenti', 0.0459034),
('luctus', 0.0672599),
('temus', 0.0672599),
('dictum', 0.0672599),
('curabitur', 0.0672599),
('dui', 0.0582266),
('tellus', 0.0582266),
('lacus', 0.0582266),
('fringilla', 0.0672599),
('condimentuma', 0.0672599),
('fusce', 0.0459034),
('purus', 0.0379379),
('ligula', 0.0349307),
('hendrerit', 0.0672599),
('vulputate', 0.0672599),
('vestibulum', 0.0300884),
('diam', 0.0582266),
('vestib', 0.0672599),
('ulum', 0.0672599),
('facilisis', 0.0582266),
('leo', 0.0672599),
('ornare', 0.067103),
('pellentesque', 0.067103),
('laoreet', 0.0794),
('facilisi', 0.0794),
('beach', 0.012965),
('vacation', 0.012965),
('ocean', 0.012965),
('sea', 0.012965),
('photography', 0.012965),
('ipadmasters', 0.01639),
('mauris', 0.30103),
('venenatis', 0.30103),
('duis', 0.30103),
('egestas', 0.176091),
('imperdiet', 0.30103),
('rhoncus', 0.176091),
('tem', 0.30103),
('por', 0.30103),
('dignissim', 0.176091),
('vitae', 0.176091),
('quam', 0.30103),
('tempus', 0.30103),
('accumsan', 0.176091),
('ullamcorper', 0.30103),
('nisl', 0.176091),
('mollis', 0.30103),
('orci', 0.30103),
('phasellus', 0.124939),
('sagittis', 0.176091),
('interdum', 0.30103),
('ultrices', 0.30103),
('est', 0.176091),
('consequat', 0.30103),
('tortor', 0.30103),
('felis', 0.30103),
('auctor', 0.30103),
('tincidunt', 0.176091),
('arc', 0.09691),
('porttitentum', 0.0969685),
('dealiquet', 0.0970591),
('ada', 0.097149),
('brazilian', 0.0163904),
('vacations', 0.0163904),
('jamaica', 0.0163904),
('secrets', 0.0163904),
('contact', 0.0158381),
('vehicula', 0.176091),
('vehic', 0.30103),
('ula', 0.30103),
('enim', 0.079181),
('sodales', 0.30103),
('rutrum', 0.30103),
('euismod', 0.30103),
('vestibul', 0.30103),
('massa', 0.30103),
('aliquam', 0.30103),
('normal', 0.30103),
('name', 0.30103),
('email', 0.30103),
('adress', 0.30103),
('subject', 0.30103),
('send', 0.30103),
('content', 0.008273),
('attachment', 0.30103),
('size', 0.30103),
('mtt300x250bannerjpg', 0.037789),
('159', 0.30103),
('simple', 0.30103),
('carry', 0.30103),
('some', 0.30103),
('resources', 0.30103),
('images', 0.30103),
('attachments', 0.30103),
('inline', 0.30103),
('dosectetur', 0.066947),
('link', 0.037789),
('labolore', 0.124939),
('minim', 0.124939),
('veniam', 0.124939),
('quoted', 0.30103),
('dolorem', 0.176091),
('row', 0.066947),
('cell', 0.066947);

-- --------------------------------------------------------

--
-- Table structure for table `semaphore`
--

CREATE TABLE IF NOT EXISTS `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE IF NOT EXISTS `sequences` (
  `value` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.',
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores IDs.' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sequences`
--

INSERT INTO `sequences` (`value`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.',
  `ssid` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  PRIMARY KEY (`sid`,`ssid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`),
  KEY `ssid` (`ssid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set`
--

CREATE TABLE IF NOT EXISTS `shortcut_set` (
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of the set.',
  PRIMARY KEY (`set_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information about sets of shortcuts links.';

--
-- Dumping data for table `shortcut_set`
--

INSERT INTO `shortcut_set` (`set_name`, `title`) VALUES
('shortcut-set-1', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set_users`
--

CREATE TABLE IF NOT EXISTS `shortcut_set_users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.',
  PRIMARY KEY (`uid`),
  KEY `set_name` (`set_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maps users to shortcut sets.';

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(12) NOT NULL DEFAULT '',
  `owner` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` blob COMMENT 'A serialized array containing information from the module’s .info file; keys can include name, description, package, version, core, dependencies, and php.',
  PRIMARY KEY (`filename`),
  KEY `type_name` (`type`,`name`),
  KEY `system_list` (`status`,`bootstrap`,`type`,`weight`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('themes/bartik/bartik.info', 'bartik', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, -1, 0, 0x613a31383a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d),
('themes/seven/seven.info', 'seven', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, -1, 0, 0x613a31383a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d),
('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, -1, 0, 0x613a31383a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d),
('themes/stark/stark.info', 'stark', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, -1, 0, 0x613a31373a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d),
('modules/system/system.module', 'system', 'module', '', 1, 0, 7077, 0, 0x613a31333a7b733a343a226e616d65223b733a363a2253797374656d223b733a31313a226465736372697074696f6e223b733a35343a2248616e646c65732067656e6572616c207369746520636f6e66696775726174696f6e20666f722061646d696e6973747261746f72732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a363a7b693a303b733a31393a2273797374656d2e61726368697665722e696e63223b693a313b733a31353a2273797374656d2e6d61696c2e696e63223b693a323b733a31363a2273797374656d2e71756575652e696e63223b693a333b733a31343a2273797374656d2e7461722e696e63223b693a343b733a31383a2273797374656d2e757064617465722e696e63223b693a353b733a31313a2273797374656d2e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a31393a2261646d696e2f636f6e6669672f73797374656d223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 1, 0, 7003, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a2241676772656761746f72223b733a31313a226465736372697074696f6e223b733a35373a22416767726567617465732073796e6469636174656420636f6e74656e7420285253532c205244462c20616e642041746f6d206665656473292e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a2261676772656761746f722e74657374223b7d733a393a22636f6e666967757265223b733a34313a2261646d696e2f636f6e6669672f73657276696365732f61676772656761746f722f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31343a2261676772656761746f722e637373223b733a33333a226d6f64756c65732f61676772656761746f722f61676772656761746f722e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/block/block.module', 'block', 'module', '', 1, 0, 7008, -5, 0x613a31323a7b733a343a226e616d65223b733a353a22426c6f636b223b733a31313a226465736372697074696f6e223b733a3134303a22436f6e74726f6c73207468652076697375616c206275696c64696e6720626c6f636b732061207061676520697320636f6e737472756374656420776974682e20426c6f636b732061726520626f786573206f6620636f6e74656e742072656e646572656420696e746f20616e20617265612c206f7220726567696f6e2c206f6620612077656220706167652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22626c6f636b2e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f626c6f636b223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/blog/blog.module', 'blog', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a343a22426c6f67223b733a31313a226465736372697074696f6e223b733a32353a22456e61626c6573206d756c74692d7573657220626c6f67732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22626c6f672e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/aggregator/tests/aggregator_test.module', 'aggregator_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32333a2241676772656761746f72206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a34363a22537570706f7274206d6f64756c6520666f722061676772656761746f722072656c617465642074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/book/book.module', 'book', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a343a22426f6f6b223b733a31313a226465736372697074696f6e223b733a36363a22416c6c6f777320757365727320746f2063726561746520616e64206f7267616e697a652072656c6174656420636f6e74656e7420696e20616e206f75746c696e652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22626f6f6b2e74657374223b7d733a393a22636f6e666967757265223b733a32373a2261646d696e2f636f6e74656e742f626f6f6b2f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22626f6f6b2e637373223b733a32313a226d6f64756c65732f626f6f6b2f626f6f6b2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/color/color.module', 'color', 'module', '', 1, 0, 7001, 0, 0x613a31313a7b733a343a226e616d65223b733a353a22436f6c6f72223b733a31313a226465736372697074696f6e223b733a37303a22416c6c6f77732061646d696e6973747261746f727320746f206368616e67652074686520636f6c6f7220736368656d65206f6620636f6d70617469626c65207468656d65732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22636f6c6f722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/comment/comment.module', 'comment', 'module', '', 1, 0, 7009, 0, 0x613a31333a7b733a343a226e616d65223b733a373a22436f6d6d656e74223b733a31313a226465736372697074696f6e223b733a35373a22416c6c6f777320757365727320746f20636f6d6d656e74206f6e20616e642064697363757373207075626c697368656420636f6e74656e742e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a343a2274657874223b7d733a353a2266696c6573223b613a323a7b693a303b733a31343a22636f6d6d656e742e6d6f64756c65223b693a313b733a31323a22636f6d6d656e742e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f636f6e74656e742f636f6d6d656e74223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31313a22636f6d6d656e742e637373223b733a32373a226d6f64756c65732f636f6d6d656e742f636f6d6d656e742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/contact/contact.module', 'contact', 'module', '', 1, 0, 7003, 0, 0x613a31323a7b733a343a226e616d65223b733a373a22436f6e74616374223b733a31313a226465736372697074696f6e223b733a36313a22456e61626c65732074686520757365206f6620626f746820706572736f6e616c20616e6420736974652d7769646520636f6e7461637420666f726d732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22636f6e746163742e74657374223b7d733a393a22636f6e666967757265223b733a32333a2261646d696e2f7374727563747572652f636f6e74616374223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 1, 7001, 0, 0x613a31313a7b733a343a226e616d65223b733a31363a224461746162617365206c6f6767696e67223b733a31313a226465736372697074696f6e223b733a34373a224c6f677320616e64207265636f7264732073797374656d206576656e747320746f207468652064617461626173652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a2264626c6f672e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 7010, 0, 0x613a31333a7b733a343a226e616d65223b733a363a2246696c746572223b733a31313a226465736372697074696f6e223b733a34333a2246696c7465727320636f6e74656e7420696e207072657061726174696f6e20666f7220646973706c61792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a2266696c7465722e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a32383a2261646d696e2f636f6e6669672f636f6e74656e742f666f726d617473223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/forum/forum.module', 'forum', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a353a22466f72756d223b733a31313a226465736372697074696f6e223b733a32373a2250726f76696465732064697363757373696f6e20666f72756d732e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a383a227461786f6e6f6d79223b693a313b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22666f72756d2e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f666f72756d223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a393a22666f72756d2e637373223b733a32333a226d6f64756c65732f666f72756d2f666f72756d2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a343a2248656c70223b733a31313a226465736372697074696f6e223b733a33353a224d616e616765732074686520646973706c6179206f66206f6e6c696e652068656c702e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a2268656c702e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/locale/locale.module', 'locale', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a363a224c6f63616c65223b733a31313a226465736372697074696f6e223b733a3131393a2241646473206c616e67756167652068616e646c696e672066756e6374696f6e616c69747920616e6420656e61626c657320746865207472616e736c6174696f6e206f6620746865207573657220696e7465726661636520746f206c616e677561676573206f74686572207468616e20456e676c6973682e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a226c6f63616c652e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f636f6e6669672f726567696f6e616c2f6c616e6775616765223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 7003, 0, 0x613a31323a7b733a343a226e616d65223b733a343a224d656e75223b733a31313a226465736372697074696f6e223b733a36303a22416c6c6f77732061646d696e6973747261746f727320746f20637573746f6d697a65207468652073697465206e617669676174696f6e206d656e752e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a226d656e752e74657374223b7d733a393a22636f6e666967757265223b733a32303a2261646d696e2f7374727563747572652f6d656e75223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/node/node.module', 'node', 'module', '', 1, 0, 7013, 0, 0x613a31343a7b733a343a226e616d65223b733a343a224e6f6465223b733a31313a226465736372697074696f6e223b733a36363a22416c6c6f777320636f6e74656e7420746f206265207375626d697474656420746f20746865207369746520616e6420646973706c61796564206f6e2070616765732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31313a226e6f64652e6d6f64756c65223b693a313b733a393a226e6f64652e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f7479706573223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a226e6f64652e637373223b733a32313a226d6f64756c65732f6e6f64652f6e6f64652e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/openid/openid.module', 'openid', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a363a224f70656e4944223b733a31313a226465736372697074696f6e223b733a34383a22416c6c6f777320757365727320746f206c6f6720696e746f20796f75722073697465207573696e67204f70656e49442e223b733a373a2276657273696f6e223b733a343a22372e3231223b733a373a227061636b616765223b733a343a22436f7265223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a226f70656e69642e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/path/path.module', 'path', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a343a2250617468223b733a31313a226465736372697074696f6e223b733a32383a22416c6c6f777320757365727320746f2072656e616d652055524c732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22706174682e74657374223b7d733a393a22636f6e666967757265223b733a32343a2261646d696e2f636f6e6669672f7365617263682f70617468223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/php/php.module', 'php', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a31303a225048502066696c746572223b733a31313a226465736372697074696f6e223b733a35303a22416c6c6f777320656d6265646465642050485020636f64652f736e69707065747320746f206265206576616c75617465642e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a383a227068702e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/actions_loop_test.module', 'actions_loop_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a22416374696f6e73206c6f6f702074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220616374696f6e206c6f6f702074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/poll/poll.module', 'poll', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a343a22506f6c6c223b733a31313a226465736372697074696f6e223b733a39353a22416c6c6f777320796f7572207369746520746f206361707475726520766f746573206f6e20646966666572656e7420746f7069637320696e2074686520666f726d206f66206d756c7469706c652063686f696365207175657374696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22706f6c6c2e74657374223b7d733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22706f6c6c2e637373223b733a32313a226d6f64756c65732f706f6c6c2f706f6c6c2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/profile/profile.module', 'profile', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a373a2250726f66696c65223b733a31313a226465736372697074696f6e223b733a33363a22537570706f72747320636f6e666967757261626c6520757365722070726f66696c65732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a2270726f66696c652e74657374223b7d733a393a22636f6e666967757265223b733a32373a2261646d696e2f636f6e6669672f70656f706c652f70726f66696c65223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/search/search.module', 'search', 'module', '', 1, 0, 7000, 0, 0x613a31333a7b733a343a226e616d65223b733a363a22536561726368223b733a31313a226465736372697074696f6e223b733a33363a22456e61626c657320736974652d77696465206b6579776f726420736561726368696e672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31393a227365617263682e657874656e6465722e696e63223b693a313b733a31313a227365617263682e74657374223b7d733a393a22636f6e666967757265223b733a32383a2261646d696e2f636f6e6669672f7365617263682f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a227365617263682e637373223b733a32353a226d6f64756c65732f7365617263682f7365617263682e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/statistics/statistics.module', 'statistics', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a2253746174697374696373223b733a31313a226465736372697074696f6e223b733a33373a224c6f677320616363657373207374617469737469637320666f7220796f757220736974652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a22737461746973746963732e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f636f6e6669672f73797374656d2f73746174697374696373223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/syslog/syslog.module', 'syslog', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a363a225379736c6f67223b733a31313a226465736372697074696f6e223b733a34313a224c6f677320616e64207265636f7264732073797374656d206576656e747320746f207379736c6f672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a227379736c6f672e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 7010, 0, 0x613a31343a7b733a343a226e616d65223b733a383a225461786f6e6f6d79223b733a31313a226465736372697074696f6e223b733a33383a22456e61626c6573207468652063617465676f72697a6174696f6e206f6620636f6e74656e742e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a373a226f7074696f6e73223b7d733a353a2266696c6573223b613a323a7b693a303b733a31353a227461786f6e6f6d792e6d6f64756c65223b693a313b733a31333a227461786f6e6f6d792e74657374223b7d733a393a22636f6e666967757265223b733a32343a2261646d696e2f7374727563747572652f7461786f6e6f6d79223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a383a227265717569726564223b623a313b733a31313a226578706c616e6174696f6e223b733a38353a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f626c75656d6173746572732f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d),
('modules/update/tests/aaa_update_test.module', 'aaa_update_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22414141205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3231223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, 7000, 0, 0x613a31313a7b733a343a226e616d65223b733a373a22547261636b6572223b733a31313a226465736372697074696f6e223b733a34353a22456e61626c657320747261636b696e67206f6620726563656e7420636f6e74656e7420666f722075736572732e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22747261636b65722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/translation/translation.module', 'translation', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a31393a22436f6e74656e74207472616e736c6174696f6e223b733a31313a226465736372697074696f6e223b733a35373a22416c6c6f777320636f6e74656e7420746f206265207472616e736c6174656420696e746f20646966666572656e74206c616e6775616765732e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a226c6f63616c65223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31363a227472616e736c6174696f6e2e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a373a2254726967676572223b733a31313a226465736372697074696f6e223b733a39303a22456e61626c657320616374696f6e7320746f206265206669726564206f6e206365727461696e2073797374656d206576656e74732c2073756368206173207768656e206e657720636f6e74656e7420697320637265617465642e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22747269676765722e74657374223b7d733a393a22636f6e666967757265223b733a32333a2261646d696e2f7374727563747572652f74726967676572223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/update/update.module', 'update', 'module', '', 1, 0, 7001, 0, 0x613a31323a7b733a343a226e616d65223b733a31343a22557064617465206d616e61676572223b733a31313a226465736372697074696f6e223b733a3130343a22436865636b7320666f7220617661696c61626c6520757064617465732c20616e642063616e207365637572656c7920696e7374616c6c206f7220757064617465206d6f64756c657320616e64207468656d65732076696120612077656220696e746572666163652e223b733a373a2276657273696f6e223b733a343a22372e3231223b733a373a227061636b616765223b733a343a22436f7265223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a227570646174652e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f7265706f7274732f757064617465732f73657474696e6773223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/upload/upload.module', 'upload', 'module', '', 0, 0, 0, 0, 0x613a31303a7b733a343a226e616d65223b733a363a2255706c6f6164223b733a31313a226465736372697074696f6e223b733a35313a22416c6c6f777320757365727320746f2075706c6f616420616e64206174746163682066696c657320746f20636f6e74656e742e223b733a373a227061636b616765223b733a31353a22436f7265202d206f7074696f6e616c223b733a373a2276657273696f6e223b733a343a22362e3230223b733a343a22636f7265223b733a333a22362e78223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231323932343437373838223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a31303a22646570656e64656e7473223b613a303a7b7d733a333a22706870223b733a353a22342e332e35223b7d),
('modules/user/user.module', 'user', 'module', '', 1, 0, 7018, 0, 0x613a31343a7b733a343a226e616d65223b733a343a2255736572223b733a31313a226465736372697074696f6e223b733a34373a224d616e6167657320746865207573657220726567697374726174696f6e20616e64206c6f67696e2073797374656d2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31313a22757365722e6d6f64756c65223b693a313b733a393a22757365722e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a31393a2261646d696e2f636f6e6669672f70656f706c65223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22757365722e637373223b733a32313a226d6f64756c65732f757365722f757365722e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/themes/bluemasters/bluemasters.info', 'bluemasters', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, -1, 0, 0x613a31373a7b733a343a226e616d65223b733a31323a22426c7565204d617374657273223b733a31313a226465736372697074696f6e223b733a34303a225468656d65206261736564206f6e20426c7565204d617374657273205053442074656d706c617465223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a343a22636f7265223b733a333a22372e78223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a343a7b733a32363a22616c6c20616e6420286d696e2d77696474683a20393830707829223b613a313a7b733a31313a226373732f3936302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3936302e637373223b7d733a34393a22616c6c20616e6420286d696e2d77696474683a2037363070782920616e6420286d61782d77696474683a20393739707829223b613a313a7b733a31313a226373732f3732302e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f3732302e637373223b7d733a32363a22616c6c20616e6420286d61782d77696474683a20373539707829223b613a313a7b733a31343a226373732f6d6f62696c652e637373223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f6d6f62696c652e637373223b7d733a333a22616c6c223b613a313a7b733a31333a226373732f7374796c652e637373223b733a34323a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f6373732f7374796c652e637373223b7d7d733a373a22726567696f6e73223b613a32333a7b733a363a22686561646572223b733a363a22486561646572223b733a31313a227365617263685f61726561223b733a31313a225365617263682061726561223b733a31303a226e617669676174696f6e223b733a31303a224e617669676174696f6e223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172204669727374223b733a363a2262616e6e6572223b733a363a2242616e6e6572223b733a31313a22686f6d655f617265615f31223b733a31313a22486f6d6520617265612031223b733a31313a22686f6d655f617265615f32223b733a31313a22486f6d6520617265612032223b733a31313a22686f6d655f617265615f33223b733a31313a22486f6d6520617265612033223b733a31333a22686f6d655f617265615f335f62223b733a31333a22486f6d65206172656120332062223b733a31333a22666f6f7465725f6c6566745f31223b733a31333a22466f6f746572206c6566742031223b733a31333a22666f6f7465725f6c6566745f32223b733a31333a22466f6f746572206c6566742032223b733a31333a22666f6f7465725f63656e746572223b733a31333a22466f6f7465722063656e746572223b733a31323a22666f6f7465725f7269676874223b733a31323a22466f6f746572207269676874223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31333a22666f6f7465725f626f74746f6d223b733a31333a22466f6f74657220426f74746f6d223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a31313a7b733a31383a22726573706f6e736976655f726573706f6e64223b733a313a2230223b733a31353a22726573706f6e736976655f6d657461223b733a313a2231223b733a31373a22736c69646573686f775f646973706c6179223b733a313a2231223b733a31323a22736c69646573686f775f6a73223b733a313a2231223b733a31363a22736c69646573686f775f656666656374223b733a353a22736c696465223b733a32313a22736c69646573686f775f6566666563745f74696d65223b733a313a2235223b733a32343a22736c69646573686f775f616e696d6174696f6e5f74696d65223b733a333a22302e35223b733a31363a22736c69646573686f775f72616e646f6d223b733a313a2230223b733a31383a22736c69646573686f775f636f6e74726f6c73223b733a313a2231223b733a31353a22736c69646573686f775f7061757365223b733a313a2231223b733a31353a22736c69646573686f775f746f756368223b733a313a2231223b7d733a373a2270726f6a656374223b733a31313a22626c75656d617374657273223b733a393a22646174657374616d70223b733a31303a2231333231333531383335223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a34333a2273697465732f616c6c2f7468656d65732f626c75656d6173746572732f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d);
INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('modules/simpletest/tests/ajax_forms_test.module', 'ajax_forms_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32363a22414a415820666f726d2074657374206d6f636b206d6f64756c65223b733a31313a226465736372697074696f6e223b733a32353a225465737420666f7220414a415820666f726d2063616c6c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/ajax_test.module', 'ajax_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a393a22414a41582054657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f7220414a4158206672616d65776f726b2074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/batch_test.module', 'batch_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31343a224261746368204150492074657374223b733a31313a226465736372697074696f6e223b733a33353a22537570706f7274206d6f64756c6520666f72204261746368204150492074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/update/tests/bbb_update_test.module', 'bbb_update_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22424242205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3231223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/block/tests/block_test.module', 'block_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a22426c6f636b2074657374223b733a31313a226465736372697074696f6e223b733a32313a2250726f7669646573207465737420626c6f636b732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/update/tests/ccc_update_test.module', 'ccc_update_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22434343205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3231223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/common_test.module', 'common_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a22436f6d6d6f6e2054657374223b733a31313a226465736372697074696f6e223b733a33323a22537570706f7274206d6f64756c6520666f7220436f6d6d6f6e2074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a31353a22636f6d6d6f6e5f746573742e637373223b733a34303a226d6f64756c65732f73696d706c65746573742f74657374732f636f6d6d6f6e5f746573742e637373223b7d733a353a227072696e74223b613a313a7b733a32313a22636f6d6d6f6e5f746573742e7072696e742e637373223b733a34363a226d6f64756c65732f73696d706c65746573742f74657374732f636f6d6d6f6e5f746573742e7072696e742e637373223b7d7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/contextual/contextual.module', 'contextual', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a31363a22436f6e7465787475616c206c696e6b73223b733a31313a226465736372697074696f6e223b733a37353a2250726f766964657320636f6e7465787475616c206c696e6b7320746f20706572666f726d20616374696f6e732072656c6174656420746f20656c656d656e7473206f6e206120706167652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a22636f6e7465787475616c2e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/dashboard/dashboard.module', 'dashboard', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a393a2244617368626f617264223b733a31313a226465736372697074696f6e223b733a3133363a2250726f766964657320612064617368626f617264207061676520696e207468652061646d696e69737472617469766520696e7465726661636520666f72206f7267616e697a696e672061646d696e697374726174697665207461736b7320616e6420747261636b696e6720696e666f726d6174696f6e2077697468696e20796f757220736974652e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a353a2266696c6573223b613a313a7b693a303b733a31343a2264617368626f6172642e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a22626c6f636b223b7d733a393a22636f6e666967757265223b733a32353a2261646d696e2f64617368626f6172642f637573746f6d697a65223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/database_test.module', 'database_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31333a2244617461626173652054657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72204461746162617365206c617965722074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/drupal_system_listing_compatible_test/drupal_system_listing_compatible_test.module', 'drupal_system_listing_compatible_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33373a2244727570616c2073797374656d206c697374696e6720636f6d70617469626c652074657374223b733a31313a226465736372697074696f6e223b733a36323a22537570706f7274206d6f64756c6520666f722074657374696e67207468652064727570616c5f73797374656d5f6c697374696e672066756e6374696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/drupal_system_listing_incompatible_test/drupal_system_listing_incompatible_test.module', 'drupal_system_listing_incompatible_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33393a2244727570616c2073797374656d206c697374696e6720696e636f6d70617469626c652074657374223b733a31313a226465736372697074696f6e223b733a36323a22537570706f7274206d6f64756c6520666f722074657374696e67207468652064727570616c5f73797374656d5f6c697374696e672066756e6374696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/entity_cache_test.module', 'entity_cache_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a22456e746974792063616368652074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f722074657374696e6720656e746974792063616368652e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a32383a22656e746974795f63616368655f746573745f646570656e64656e6379223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/entity_cache_test_dependency.module', 'entity_cache_test_dependency', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32383a22456e74697479206361636865207465737420646570656e64656e6379223b733a31313a226465736372697074696f6e223b733a35313a22537570706f727420646570656e64656e6379206d6f64756c6520666f722074657374696e6720656e746974792063616368652e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/entity_crud_hook_test.module', 'entity_crud_hook_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a22456e74697479204352554420486f6f6b732054657374223b733a31313a226465736372697074696f6e223b733a33353a22537570706f7274206d6f64756c6520666f72204352554420686f6f6b2074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/error_test.module', 'error_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a224572726f722074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f72206572726f7220616e6420657863657074696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/field/field.module', 'field', 'module', '', 1, 0, 7002, 0, 0x613a31333a7b733a343a226e616d65223b733a353a224669656c64223b733a31313a226465736372697074696f6e223b733a35373a224669656c642041504920746f20616464206669656c647320746f20656e746974696573206c696b65206e6f64657320616e642075736572732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a333a7b693a303b733a31323a226669656c642e6d6f64756c65223b693a313b733a31363a226669656c642e6174746163682e696e63223b693a323b733a31363a2274657374732f6669656c642e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31373a226669656c645f73716c5f73746f72616765223b7d733a383a227265717569726564223b623a313b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31353a227468656d652f6669656c642e637373223b733a32393a226d6f64756c65732f6669656c642f7468656d652f6669656c642e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/field_sql_storage/field_sql_storage.module', 'field_sql_storage', 'module', '', 1, 0, 7002, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a224669656c642053514c2073746f72616765223b733a31313a226465736372697074696f6e223b733a33373a2253746f726573206669656c64206461746120696e20616e2053514c2064617461626173652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a32323a226669656c645f73716c5f73746f726167652e74657374223b7d733a383a227265717569726564223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/tests/field_test.module', 'field_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31343a224669656c64204150492054657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220746865204669656c64204150492074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a353a2266696c6573223b613a313a7b693a303b733a32313a226669656c645f746573742e656e746974792e696e63223b7d733a373a2276657273696f6e223b733a343a22372e3231223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field_ui/field_ui.module', 'field_ui', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a383a224669656c64205549223b733a31313a226465736372697074696f6e223b733a33333a225573657220696e7465726661636520666f7220746865204669656c64204150492e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31333a226669656c645f75692e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/file/file.module', 'file', 'module', '', 1, 0, 0, 0, 0x613a31333a7b733a343a226e616d65223b733a343a2246696c65223b733a31313a226465736372697074696f6e223b733a32363a22446566696e657320612066696c65206669656c6420747970652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31353a2274657374732f66696c652e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a383a227265717569726564223b623a313b733a31313a226578706c616e6174696f6e223b733a38353a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f626c75656d6173746572732f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d),
('modules/file/tests/file_module_test.module', 'file_module_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a393a2246696c652074657374223b733a31313a226465736372697074696f6e223b733a35333a2250726f766964657320686f6f6b7320666f722074657374696e672046696c65206d6f64756c652066756e6374696f6e616c6974792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/file_test.module', 'file_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a393a2246696c652074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f722066696c652068616e646c696e672074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31363a2266696c655f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/filter_test.module', 'filter_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31383a2246696c7465722074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33333a2254657374732066696c74657220686f6f6b7320616e642066756e6374696f6e732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/form_test.module', 'form_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a22466f726d4150492054657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f7220466f726d204150492074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/image/image.module', 'image', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a353a22496d616765223b733a31313a226465736372697074696f6e223b733a33343a2250726f766964657320696d616765206d616e6970756c6174696f6e20746f6f6c732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a343a2266696c65223b7d733a353a2266696c6573223b613a313a7b693a303b733a31303a22696d6167652e74657374223b7d733a393a22636f6e666967757265223b733a33313a2261646d696e2f636f6e6669672f6d656469612f696d6167652d7374796c6573223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/image/tests/image_module_test.module', 'image_module_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a22496d6167652074657374223b733a31313a226465736372697074696f6e223b733a36393a2250726f766964657320686f6f6b20696d706c656d656e746174696f6e7320666f722074657374696e6720496d616765206d6f64756c652066756e6374696f6e616c6974792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a32343a22696d6167655f6d6f64756c655f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/image_test.module', 'image_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a22496d6167652074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220696d61676520746f6f6c6b69742074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/list/list.module', 'list', 'module', '', 1, 0, 7002, 0, 0x613a31313a7b733a343a226e616d65223b733a343a224c697374223b733a31313a226465736372697074696f6e223b733a36393a22446566696e6573206c697374206669656c642074797065732e205573652077697468204f7074696f6e7320746f206372656174652073656c656374696f6e206c697374732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a353a226669656c64223b693a313b733a373a226f7074696f6e73223b7d733a353a2266696c6573223b613a313a7b693a303b733a31353a2274657374732f6c6973742e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/list/tests/list_test.module', 'list_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a393a224c6973742074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220746865204c697374206d6f64756c652074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/locale/tests/locale_test.module', 'locale_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a224c6f63616c652054657374223b733a31313a226465736372697074696f6e223b733a34323a22537570706f7274206d6f64756c6520666f7220746865206c6f63616c65206c617965722074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/menu_test.module', 'menu_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22486f6f6b206d656e75207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72206d656e7520686f6f6b2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/module_test.module', 'module_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a224d6f64756c652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f72206d6f64756c652073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/node/tests/node_access_test.module', 'node_access_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32343a224e6f6465206d6f64756c6520616363657373207465737473223b733a31313a226465736372697074696f6e223b733a34333a22537570706f7274206d6f64756c6520666f72206e6f6465207065726d697373696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/node/tests/node_test.module', 'node_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a224e6f6465206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72206e6f64652072656c617465642074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/node/tests/node_test_exception.module', 'node_test_exception', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32373a224e6f6465206d6f64756c6520657863657074696f6e207465737473223b733a31313a226465736372697074696f6e223b733a35303a22537570706f7274206d6f64756c6520666f72206e6f64652072656c6174656420657863657074696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/number/number.module', 'number', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a363a224e756d626572223b733a31313a226465736372697074696f6e223b733a32383a22446566696e6573206e756d65726963206669656c642074797065732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31313a226e756d6265722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/openid/tests/openid_test.module', 'openid_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32313a224f70656e49442064756d6d792070726f7669646572223b733a31313a226465736372697074696f6e223b733a33333a224f70656e49442070726f7669646572207573656420666f722074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a226f70656e6964223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/options/options.module', 'options', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a373a224f7074696f6e73223b733a31313a226465736372697074696f6e223b733a38323a22446566696e65732073656c656374696f6e2c20636865636b20626f7820616e6420726164696f20627574746f6e207769646765747320666f72207465787420616e64206e756d65726963206669656c64732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31323a226f7074696f6e732e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/overlay/overlay.module', 'overlay', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a373a224f7665726c6179223b733a31313a226465736372697074696f6e223b733a35393a22446973706c617973207468652044727570616c2061646d696e697374726174696f6e20696e7465726661636520696e20616e206f7665726c61792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/rdf/rdf.module', 'rdf', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a333a22524446223b733a31313a226465736372697074696f6e223b733a3134383a22456e72696368657320796f757220636f6e74656e742077697468206d6574616461746120746f206c6574206f74686572206170706c69636174696f6e732028652e672e2073656172636820656e67696e65732c2061676772656761746f7273292062657474657220756e6465727374616e64206974732072656c6174696f6e736869707320616e6420617474726962757465732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a383a227264662e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/rdf/tests/rdf_test.module', 'rdf_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31363a22524446206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a33383a22537570706f7274206d6f64756c6520666f7220524446206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/requirements1_test.module', 'requirements1_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31393a22526571756972656d656e747320312054657374223b733a31313a226465736372697074696f6e223b733a38303a22546573747320746861742061206d6f64756c65206973206e6f7420696e7374616c6c6564207768656e206974206661696c7320686f6f6b5f726571756972656d656e74732827696e7374616c6c27292e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/requirements2_test.module', 'requirements2_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31393a22526571756972656d656e747320322054657374223b733a31313a226465736372697074696f6e223b733a39383a22546573747320746861742061206d6f64756c65206973206e6f7420696e7374616c6c6564207768656e20746865206f6e6520697420646570656e6473206f6e206661696c7320686f6f6b5f726571756972656d656e74732827696e7374616c6c292e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a31383a22726571756972656d656e7473315f74657374223b693a313b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/search/tests/search_embedded_form.module', 'search_embedded_form', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32303a2253656172636820656d62656464656420666f726d223b733a31313a226465736372697074696f6e223b733a35393a22537570706f7274206d6f64756c6520666f7220736561726368206d6f64756c652074657374696e67206f6620656d62656464656420666f726d732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/search/tests/search_extra_type.module', 'search_extra_type', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31363a2254657374207365617263682074797065223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220736561726368206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/session_test.module', 'session_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a2253657373696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f722073657373696f6e20646174612074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/shortcut/shortcut.module', 'shortcut', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a383a2253686f7274637574223b733a31313a226465736372697074696f6e223b733a36303a22416c6c6f777320757365727320746f206d616e61676520637573746f6d697a61626c65206c69737473206f662073686f7274637574206c696e6b732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31333a2273686f72746375742e74657374223b7d733a393a22636f6e666967757265223b733a33363a2261646d696e2f636f6e6669672f757365722d696e746572666163652f73686f7274637574223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/simpletest.module', 'simpletest', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a373a2254657374696e67223b733a31313a226465736372697074696f6e223b733a35333a2250726f76696465732061206672616d65776f726b20666f7220756e697420616e642066756e6374696f6e616c2074657374696e672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a34383a7b693a303b733a31353a2273696d706c65746573742e74657374223b693a313b733a32343a2264727570616c5f7765625f746573745f636173652e706870223b693a323b733a31383a2274657374732f616374696f6e732e74657374223b693a333b733a31353a2274657374732f616a61782e74657374223b693a343b733a31363a2274657374732f62617463682e74657374223b693a353b733a32303a2274657374732f626f6f7473747261702e74657374223b693a363b733a31363a2274657374732f63616368652e74657374223b693a373b733a31373a2274657374732f636f6d6d6f6e2e74657374223b693a383b733a32343a2274657374732f64617461626173655f746573742e74657374223b693a393b733a33323a2274657374732f656e746974795f637275645f686f6f6b5f746573742e74657374223b693a31303b733a32333a2274657374732f656e746974795f71756572792e74657374223b693a31313b733a31363a2274657374732f6572726f722e74657374223b693a31323b733a31353a2274657374732f66696c652e74657374223b693a31333b733a32333a2274657374732f66696c657472616e736665722e74657374223b693a31343b733a31353a2274657374732f666f726d2e74657374223b693a31353b733a31363a2274657374732f67726170682e74657374223b693a31363b733a31363a2274657374732f696d6167652e74657374223b693a31373b733a31353a2274657374732f6c6f636b2e74657374223b693a31383b733a31353a2274657374732f6d61696c2e74657374223b693a31393b733a31353a2274657374732f6d656e752e74657374223b693a32303b733a31373a2274657374732f6d6f64756c652e74657374223b693a32313b733a31363a2274657374732f70616765722e74657374223b693a32323b733a31393a2274657374732f70617373776f72642e74657374223b693a32333b733a31353a2274657374732f706174682e74657374223b693a32343b733a31393a2274657374732f72656769737472792e74657374223b693a32353b733a31373a2274657374732f736368656d612e74657374223b693a32363b733a31383a2274657374732f73657373696f6e2e74657374223b693a32373b733a32303a2274657374732f7461626c65736f72742e74657374223b693a32383b733a31363a2274657374732f7468656d652e74657374223b693a32393b733a31383a2274657374732f756e69636f64652e74657374223b693a33303b733a31373a2274657374732f7570646174652e74657374223b693a33313b733a31373a2274657374732f786d6c7270632e74657374223b693a33323b733a32363a2274657374732f757067726164652f757067726164652e74657374223b693a33333b733a33343a2274657374732f757067726164652f757067726164652e636f6d6d656e742e74657374223b693a33343b733a33333a2274657374732f757067726164652f757067726164652e66696c7465722e74657374223b693a33353b733a33323a2274657374732f757067726164652f757067726164652e666f72756d2e74657374223b693a33363b733a33333a2274657374732f757067726164652f757067726164652e6c6f63616c652e74657374223b693a33373b733a33313a2274657374732f757067726164652f757067726164652e6d656e752e74657374223b693a33383b733a33313a2274657374732f757067726164652f757067726164652e6e6f64652e74657374223b693a33393b733a33353a2274657374732f757067726164652f757067726164652e7461786f6e6f6d792e74657374223b693a34303b733a33343a2274657374732f757067726164652f757067726164652e747269676765722e74657374223b693a34313b733a33393a2274657374732f757067726164652f757067726164652e7472616e736c617461626c652e74657374223b693a34323b733a33333a2274657374732f757067726164652f757067726164652e75706c6f61642e74657374223b693a34333b733a33313a2274657374732f757067726164652f757067726164652e757365722e74657374223b693a34343b733a33363a2274657374732f757067726164652f7570646174652e61676772656761746f722e74657374223b693a34353b733a33333a2274657374732f757067726164652f7570646174652e747269676765722e74657374223b693a34363b733a33313a2274657374732f757067726164652f7570646174652e6669656c642e74657374223b693a34373b733a33303a2274657374732f757067726164652f7570646174652e757365722e74657374223b7d733a393a22636f6e666967757265223b733a34313a2261646d696e2f636f6e6669672f646576656c6f706d656e742f74657374696e672f73657474696e6773223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_dependencies_test.module', 'system_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a2253797374656d20646570656e64656e63792074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31393a225f6d697373696e675f646570656e64656e6379223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_test.module', 'system_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a2253797374656d2074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f722073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31383a2273797374656d5f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/taxonomy_test.module', 'taxonomy_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32303a225461786f6e6f6d792074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a34353a222254657374732066756e6374696f6e7320616e6420686f6f6b73206e6f74207573656420696e20636f7265222e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a383a227461786f6e6f6d79223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/text/text.module', 'text', 'module', '', 1, 0, 7000, 0, 0x613a31333a7b733a343a226e616d65223b733a343a2254657874223b733a31313a226465736372697074696f6e223b733a33323a22446566696e65732073696d706c652074657874206669656c642074797065732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a393a22746578742e74657374223b7d733a383a227265717569726564223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a31313a226578706c616e6174696f6e223b733a38353a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f626c75656d6173746572732f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d),
('modules/simpletest/tests/theme_test.module', 'theme_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a225468656d652074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72207468656d652073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('modules/toolbar/toolbar.module', 'toolbar', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a373a22546f6f6c626172223b733a31313a226465736372697074696f6e223b733a39393a2250726f7669646573206120746f6f6c62617220746861742073686f77732074686520746f702d6c6576656c2061646d696e697374726174696f6e206d656e75206974656d7320616e64206c696e6b732066726f6d206f74686572206d6f64756c65732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3231223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/translation/tests/translation_test.module', 'translation_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32343a22436f6e74656e74205472616e736c6174696f6e2054657374223b733a31313a226465736372697074696f6e223b733a34393a22537570706f7274206d6f64756c6520666f722074686520636f6e74656e74207472616e736c6174696f6e2074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/trigger/tests/trigger_test.module', 'trigger_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a22547269676765722054657374223b733a31313a226465736372697074696f6e223b733a33333a22537570706f7274206d6f64756c6520666f7220547269676765722074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3231223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/update/tests/update_test.module', 'update_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/update_test_1.module', 'update_test_1', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/update_test_2.module', 'update_test_2', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/update_test_3.module', 'update_test_3', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/url_alter_test.module', 'url_alter_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a2255726c5f616c746572207465737473223b733a31313a226465736372697074696f6e223b733a34353a224120737570706f7274206d6f64756c657320666f722075726c5f616c74657220686f6f6b2074657374696e672e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/user/tests/user_form_test.module', 'user_form_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a2255736572206d6f64756c6520666f726d207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72207573657220666f726d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/xmlrpc_test.module', 'xmlrpc_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a22584d4c2d5250432054657374223b733a31313a226465736372697074696f6e223b733a37353a22537570706f7274206d6f64756c6520666f7220584d4c2d525043207465737473206163636f7264696e6720746f207468652076616c696461746f72312073706563696669636174696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('profiles/default/default.profile', 'default', 'module', '', 0, 0, 0, 1000, 0x613a363a7b733a31323a22646570656e64656e63696573223b613a303a7b7d733a31313a226465736372697074696f6e223b733a303a22223b733a373a227061636b616765223b733a353a224f74686572223b733a373a2276657273696f6e223b4e3b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d7d),
('sites/all/modules/backup_migrate/backup_migrate.module', 'backup_migrate', 'module', '', 0, 0, 7203, 0, 0x613a31323a7b733a343a226e616d65223b733a31383a224261636b757020616e64204d696772617465223b733a31313a226465736372697074696f6e223b733a37353a224261636b7570206f72206d696772617465207468652044727570616c20446174616261736520717569636b6c7920616e6420776974686f757420756e6e656365737361727920646174612e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a353a7b693a303b733a32313a226261636b75705f6d6967726174652e6d6f64756c65223b693a313b733a32323a226261636b75705f6d6967726174652e696e7374616c6c223b693a323b733a32353a22696e636c756465732f64657374696e6174696f6e732e696e63223b693a333b733a32313a22696e636c756465732f70726f66696c65732e696e63223b693a343b733a32323a22696e636c756465732f7363686564756c65732e696e63223b7d733a393a22636f6e666967757265223b733a33343a2261646d696e2f636f6e6669672f73797374656d2f6261636b75705f6d696772617465223b733a373a2276657273696f6e223b733a373a22372e782d322e34223b733a373a2270726f6a656374223b733a31343a226261636b75705f6d696772617465223b733a393a22646174657374616d70223b733a31303a2231333338393033303733223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('profiles/standard/standard.profile', 'standard', 'module', '', 1, 0, 0, 1000, 0x613a31343a7b733a343a226e616d65223b733a383a225374616e64617264223b733a31313a226465736372697074696f6e223b733a35313a22496e7374616c6c207769746820636f6d6d6f6e6c792075736564206665617475726573207072652d636f6e666967757265642e223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a32313a7b693a303b733a353a22626c6f636b223b693a313b733a353a22636f6c6f72223b693a323b733a373a22636f6d6d656e74223b693a333b733a31303a22636f6e7465787475616c223b693a343b733a393a2264617368626f617264223b693a353b733a343a2268656c70223b693a363b733a353a22696d616765223b693a373b733a343a226c697374223b693a383b733a343a226d656e75223b693a393b733a363a226e756d626572223b693a31303b733a373a226f7074696f6e73223b693a31313b733a343a2270617468223b693a31323b733a383a227461786f6e6f6d79223b693a31333b733a353a2264626c6f67223b693a31343b733a363a22736561726368223b693a31353b733a383a2273686f7274637574223b693a31363b733a373a22746f6f6c626172223b693a31373b733a373a226f7665726c6179223b693a31383b733a383a226669656c645f7569223b693a31393b733a343a2266696c65223b693a32303b733a333a22726466223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b733a363a2268696464656e223b623a313b733a383a227265717569726564223b623a313b733a31373a22646973747269627574696f6e5f6e616d65223b733a363a2244727570616c223b7d),
('modules/simpletest/tests/common_test_cron_helper.module', 'common_test_cron_helper', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32333a22436f6d6d6f6e20546573742043726f6e2048656c706572223b733a31313a226465736372697074696f6e223b733a35363a2248656c706572206d6f64756c6520666f722043726f6e52756e54657374436173653a3a7465737443726f6e457863657074696f6e7328292e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/entity_query_access_test.module', 'entity_query_access_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32343a22456e74697479207175657279206163636573732074657374223b733a31313a226465736372697074696f6e223b733a34393a22537570706f7274206d6f64756c6520666f7220636865636b696e6720656e7469747920717565727920726573756c74732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/path_test.module', 'path_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22486f6f6b2070617468207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72207061746820686f6f6b2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_incompatible_core_version_dependencies_test.module', 'system_incompatible_core_version_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a35303a2253797374656d20696e636f6d70617469626c6520636f72652076657273696f6e20646570656e64656e636965732074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a33373a2273797374656d5f696e636f6d70617469626c655f636f72655f76657273696f6e5f74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_incompatible_core_version_test.module', 'system_incompatible_core_version_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33373a2253797374656d20696e636f6d70617469626c6520636f72652076657273696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22352e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_incompatible_module_version_dependencies_test.module', 'system_incompatible_module_version_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a35323a2253797374656d20696e636f6d70617469626c65206d6f64756c652076657273696f6e20646570656e64656e636965732074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a34363a2273797374656d5f696e636f6d70617469626c655f6d6f64756c655f76657273696f6e5f7465737420283e322e3029223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_incompatible_module_version_test.module', 'system_incompatible_module_version_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33393a2253797374656d20696e636f6d70617469626c65206d6f64756c652076657273696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/update_script_test.module', 'update_script_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31383a22557064617465207363726970742074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465207363726970742074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3231223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333632363136393936223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/libraries/libraries.module', 'libraries', 'module', '', 1, 0, 7200, 0, 0x613a31313a7b733a343a226e616d65223b733a393a224c6962726172696573223b733a31313a226465736372697074696f6e223b733a36343a22416c6c6f77732076657273696f6e2d646570656e64656e7420616e6420736861726564207573616765206f662065787465726e616c206c69627261726965732e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a32303a2274657374732f6c69627261726965732e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d322e31223b733a373a2270726f6a656374223b733a393a226c6962726172696573223b733a393a22646174657374616d70223b733a31303a2231333632383438343132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/libraries/tests/libraries_test.module', 'libraries_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32313a224c69627261726965732074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33363a225465737473206c69627261727920646574656374696f6e20616e64206c6f6164696e672e223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a393a226c6962726172696573223b7d733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d322e31223b733a373a2270726f6a656374223b733a393a226c6962726172696573223b733a393a22646174657374616d70223b733a31303a2231333632383438343132223b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/superfish/superfish.module', 'superfish', 'module', '', 1, 0, 7100, 0, 0x613a31323a7b733a343a226e616d65223b733a393a22537570657266697368223b733a31313a226465736372697074696f6e223b733a34363a226a51756572792053757065726669736820706c7567696e20666f7220796f75722044727570616c206d656e75732e223b733a373a227061636b616765223b733a31343a225573657220696e74657266616365223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a343a226d656e75223b693a313b733a393a226c6962726172696573223b7d733a393a22636f6e666967757265223b733a33373a2261646d696e2f636f6e6669672f757365722d696e746572666163652f737570657266697368223b733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a373a22372e782d312e38223b733a373a2270726f6a656374223b733a393a22737570657266697368223b733a393a22646174657374616d70223b733a31303a2231333031323437333639223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_index`
--

CREATE TABLE IF NOT EXISTS `taxonomy_index` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  KEY `term_node` (`tid`,`sticky`,`created`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

--
-- Dumping data for table `taxonomy_index`
--

INSERT INTO `taxonomy_index` (`nid`, `tid`, `sticky`, `created`) VALUES
(5, 1, 0, 1293483907),
(5, 2, 0, 1293483907),
(5, 3, 0, 1293483907),
(5, 4, 0, 1293483907),
(5, 5, 0, 1293483907),
(4, 1, 0, 1293483804),
(4, 2, 0, 1293483804),
(4, 3, 0, 1293483804),
(4, 4, 0, 1293483804),
(4, 5, 0, 1293483804),
(2, 1, 0, 1293299349),
(2, 2, 0, 1293299349),
(2, 3, 0, 1293299349),
(2, 4, 0, 1293299349),
(2, 5, 0, 1293299349);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_data`
--

CREATE TABLE IF NOT EXISTS `taxonomy_term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the description.',
  PRIMARY KEY (`tid`),
  KEY `vid_name` (`vid`,`name`),
  KEY `name` (`name`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `taxonomy_term_data`
--

INSERT INTO `taxonomy_term_data` (`tid`, `vid`, `name`, `description`, `weight`, `format`) VALUES
(1, 1, 'Photography', '', 0, NULL),
(2, 2, 'Beach', '', 0, NULL),
(3, 2, 'Vacation', '', 0, NULL),
(4, 2, 'Ocean', '', 0, NULL),
(5, 2, 'Sea', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_hierarchy`
--

CREATE TABLE IF NOT EXISTS `taxonomy_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taxonomy_term_hierarchy`
--

INSERT INTO `taxonomy_term_hierarchy` (`tid`, `parent`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_relation`
--

CREATE TABLE IF NOT EXISTS `taxonomy_term_relation` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_synonym`
--

CREATE TABLE IF NOT EXISTS `taxonomy_term_synonym` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_vocabulary`
--

CREATE TABLE IF NOT EXISTS `taxonomy_vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `taxonomy_vocabulary`
--

INSERT INTO `taxonomy_vocabulary` (`vid`, `name`, `description`, `hierarchy`, `module`, `weight`, `machine_name`) VALUES
(1, 'Categories', '', 1, 'taxonomy', 0, 'vocabulary_1'),
(2, 'Tags', '', 0, 'taxonomy', 0, 'vocabulary_2');

-- --------------------------------------------------------

--
-- Table structure for table `tracker_node`
--

CREATE TABLE IF NOT EXISTS `tracker_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `published` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is published.',
  `changed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved or commented on.',
  PRIMARY KEY (`nid`),
  KEY `tracker` (`published`,`changed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tracks when nodes were last changed or commented on.';

--
-- Dumping data for table `tracker_node`
--

INSERT INTO `tracker_node` (`nid`, `published`, `changed`) VALUES
(7, 0, 1294092138),
(6, 1, 1295951909),
(3, 1, 1300210377),
(1, 1, 1300216479),
(5, 1, 1300216974),
(4, 1, 1300216987),
(2, 1, 1300217001),
(8, 1, 1300380336);

-- --------------------------------------------------------

--
-- Table structure for table `tracker_user`
--

CREATE TABLE IF NOT EXISTS `tracker_user` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the node author or commenter.',
  `published` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is published.',
  `changed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved or commented on.',
  PRIMARY KEY (`nid`,`uid`),
  KEY `tracker` (`uid`,`published`,`changed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tracks when nodes were last changed or commented on, for...';

--
-- Dumping data for table `tracker_user`
--

INSERT INTO `tracker_user` (`nid`, `uid`, `published`, `changed`) VALUES
(7, 1, 0, 1294092138),
(6, 1, 1, 1295951909),
(3, 1, 1, 1300210377),
(1, 1, 1, 1300216479),
(5, 1, 1, 1300216974),
(4, 1, 1, 1300216987),
(2, 1, 1, 1300217001),
(8, 1, 1, 1300380336);

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.',
  PRIMARY KEY (`pid`),
  KEY `source_language_pid` (`source`,`language`,`pid`),
  KEY `alias_language_pid` (`alias`,`language`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(128) NOT NULL DEFAULT '',
  `mail` varchar(254) DEFAULT '' COMMENT 'User’s e-mail address.',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `signature_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the signature.',
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(32) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `init` varchar(254) DEFAULT '' COMMENT 'E-mail address used for initial account creation.',
  `data` longblob COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`),
  KEY `picture` (`picture`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `pass`, `mail`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `init`, `data`, `picture`) VALUES
(0, '', '', '', '', '', NULL, 0, 0, 0, 0, NULL, '', '', NULL, 0),
(1, 'admin', '$S$DS/1GsD.41IC/pwPt5LL1NhnUHHN2yV1YeLocmHZLZS9x18LRoiX', 'skounis@gmail.com', '', '', '1', 1292761309, 1363363083, 1363362988, 1, 'Europe/Helsinki', '', 'skounis@gmail.com', 0x613a313a7b733a373a22636f6e74616374223b693a313b7d, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longblob NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`name`, `value`) VALUES
('theme_default', 0x733a31313a22626c75656d617374657273223b),
('comment_default_mode_page', 0x693a313b),
('node_options_forum', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('drupal_private_key', 0x733a36343a2239303965646330316562373261323564333366396161666433376430613139306635663033343730353533383934663630366562323565313963636332336634223b),
('menu_masks', 0x613a33333a7b693a303b693a3439333b693a313b693a3234373b693a323b693a3234363b693a333b693a3234353b693a343b693a3132363b693a353b693a3132353b693a363b693a3132333b693a373b693a3132323b693a383b693a3132313b693a393b693a3131373b693a31303b693a36333b693a31313b693a36323b693a31323b693a36313b693a31333b693a36303b693a31343b693a35393b693a31353b693a35383b693a31363b693a34343b693a31373b693a33313b693a31383b693a33303b693a31393b693a32393b693a32303b693a32383b693a32313b693a32343b693a32323b693a32313b693a32333b693a31353b693a32343b693a31343b693a32353b693a31333b693a32363b693a31313b693a32373b693a373b693a32383b693a363b693a32393b693a353b693a33303b693a333b693a33313b693a323b693a33323b693a313b7d),
('cache_flush_cache_path', 0x693a303b),
('install_task', 0x733a343a22646f6e65223b),
('menu_expanded', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('site_name', 0x733a33323a22426c7565204d617374657273202d20467265652044727570616c205468656d65223b),
('site_mail', 0x733a31373a22736b6f756e697340676d61696c2e636f6d223b),
('date_default_timezone', 0x733a31353a224575726f70652f48656c73696e6b69223b),
('user_email_verification', 0x693a313b),
('clean_url', 0x693a313b),
('install_time', 0x693a313239323736313338303b),
('node_options_page', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('comment_page', 0x733a313a2230223b),
('theme_settings', 0x613a31363a7b733a31313a22746f67676c655f6c6f676f223b693a313b733a31313a22746f67676c655f6e616d65223b693a313b733a31333a22746f67676c655f736c6f67616e223b693a303b733a31343a22746f67676c655f6d697373696f6e223b693a313b733a32343a22746f67676c655f6e6f64655f757365725f70696374757265223b693a303b733a32373a22746f67676c655f636f6d6d656e745f757365725f70696374757265223b693a303b733a31333a22746f67676c655f736561726368223b693a313b733a31343a22746f67676c655f66617669636f6e223b693a313b733a32303a22746f67676c655f7072696d6172795f6c696e6b73223b693a313b733a32323a22746f67676c655f7365636f6e646172795f6c696e6b73223b693a313b733a31323a2264656661756c745f6c6f676f223b693a313b733a393a226c6f676f5f70617468223b733a303a22223b733a31313a226c6f676f5f75706c6f6164223b733a303a22223b733a31353a2264656661756c745f66617669636f6e223b693a313b733a31323a2266617669636f6e5f70617468223b733a303a22223b733a31343a2266617669636f6e5f75706c6f6164223b733a303a22223b7d),
('filter_fallback_format', 0x733a313a2234223b),
('drupal_http_request_fails', 0x623a303b),
('css_js_query_string', 0x733a363a226d6a706c746a223b),
('install_profile', 0x733a383a227374616e64617264223b),
('update_last_check', 0x693a313336333335383336343b),
('aggregator_teaser_length', 0x4e3b),
('site_slogan', 0x733a363a22536c6f67616e223b),
('cron_key', 0x733a34333a22775a5661414d55777a6c716272655239515549363168596a6854504b585468354b31345433735744587359223b),
('anonymous', 0x733a393a22416e6f6e796d6f7573223b),
('site_frontpage', 0x733a343a226e6f6465223b),
('menu_default_active_menus', 0x613a373a7b693a303b733a31303a226e617669676174696f6e223b693a313b733a31303a226d616e6167656d656e74223b693a323b733a393a22757365722d6d656e75223b693a333b733a393a226d61696e2d6d656e75223b693a343b733a31333a226d656e752d61626f75742d7573223b693a353b733a31353a226d656e752d63617465676f72696573223b693a363b733a32303a226d656e752d736974652d6e617669676174696f6e223b7d),
('node_submitted_page', 0x693a303b),
('file_temporary_path', 0x733a32333a2273697465732f64656661756c742f66696c65732f746d70223b),
('maintenance_mode_message', 0x733a3132303a22426c7565204d617374657273202d20667265652064727570616c207468656d652069732063757272656e746c7920756e646572206d61696e74656e616e63652e2057652073686f756c64206265206261636b2073686f72746c792e205468616e6b20796f7520666f7220796f75722070617469656e63652e223b),
('maintenance_mode', 0x693a303b),
('update_d7_requirements', 0x623a313b),
('path_alias_whitelist', 0x613a303a7b7d),
('empty_timezone_message', 0x693a313b),
('user_cancel_method', 0x733a32303a22757365725f63616e63656c5f726561737369676e223b),
('node_preview_page', 0x733a313a2231223b),
('node_preview_story', 0x733a313a2231223b),
('comment_preview_page', 0x733a313a2232223b),
('comment_default_mode_story', 0x693a313b),
('comment_preview_story', 0x733a313a2232223b),
('node_submitted_story', 0x693a313b),
('user_register', 0x733a313a2230223b),
('node_cron_last', 0x733a31303a2231333631383235383338223b),
('cron_last', 0x693a313336333335383335383b),
('admin_theme', 0x733a353a22736576656e223b),
('node_admin_theme', 0x693a313b),
('theme_bluemasters_settings', 0x613a32363a7b733a31313a22746f67676c655f6c6f676f223b693a313b733a31313a22746f67676c655f6e616d65223b693a313b733a31333a22746f67676c655f736c6f67616e223b693a313b733a32343a22746f67676c655f6e6f64655f757365725f70696374757265223b693a313b733a32373a22746f67676c655f636f6d6d656e745f757365725f70696374757265223b693a313b733a33323a22746f67676c655f636f6d6d656e745f757365725f766572696669636174696f6e223b693a313b733a31343a22746f67676c655f66617669636f6e223b693a303b733a31363a22746f67676c655f6d61696e5f6d656e75223b693a313b733a32313a22746f67676c655f7365636f6e646172795f6d656e75223b693a313b733a31323a2264656661756c745f6c6f676f223b693a313b733a393a226c6f676f5f70617468223b733a303a22223b733a31313a226c6f676f5f75706c6f6164223b733a303a22223b733a31353a2264656661756c745f66617669636f6e223b693a303b733a31323a2266617669636f6e5f70617468223b733a303a22223b733a31343a2266617669636f6e5f75706c6f6164223b733a303a22223b733a31373a22736c69646573686f775f646973706c6179223b693a303b733a31323a22736c69646573686f775f6a73223b693a313b733a31363a22736c69646573686f775f656666656374223b733a353a22736c696465223b733a32313a22736c69646573686f775f6566666563745f74696d65223b733a313a2235223b733a32343a22736c69646573686f775f616e696d6174696f6e5f74696d65223b733a333a22302e38223b733a31363a22736c69646573686f775f72616e646f6d223b693a303b733a31353a22736c69646573686f775f7061757365223b693a313b733a31383a22736c69646573686f775f636f6e74726f6c73223b693a313b733a31353a22736c69646573686f775f746f756368223b693a313b733a31383a22726573706f6e736976655f726573706f6e64223b693a303b733a31353a22726573706f6e736976655f6d657461223b693a313b7d),
('file_public_path', 0x733a31393a2273697465732f64656661756c742f66696c6573223b),
('file_private_path', 0x733a303a22223b),
('file_default_scheme', 0x733a363a227075626c6963223b),
('cache', 0x693a313b),
('cache_lifetime', 0x733a353a223836343030223b),
('page_cache_maximum_age', 0x733a353a223836343030223b),
('block_cache', 0x693a313b),
('page_compression', 0x693a313b),
('preprocess_css', 0x693a303b),
('preprocess_js', 0x693a303b),
('error_level', 0x733a313a2232223b),
('dblog_row_limit', 0x733a343a2231303030223b),
('additional_settings__active_tab_page', 0x733a31333a22656469742d776f726b666c6f77223b),
('comment_default_per_page_page', 0x733a323a223530223b),
('comment_anonymous_page', 0x693a303b),
('comment_subject_field_page', 0x693a313b),
('comment_form_location_page', 0x693a313b),
('menu_options_page', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('menu_parent_page', 0x733a31313a226d61696e2d6d656e753a30223b),
('additional_settings__active_tab_story', 0x733a31353a22656469742d7375626d697373696f6e223b),
('node_options_story', 0x613a323a7b693a303b733a363a22737461747573223b693a313b733a373a2270726f6d6f7465223b7d),
('comment_story', 0x733a313a2232223b),
('comment_default_per_page_story', 0x733a323a223530223b),
('comment_anonymous_story', 0x693a303b),
('comment_subject_field_story', 0x693a313b),
('comment_form_location_story', 0x693a313b),
('menu_options_story', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('menu_parent_story', 0x733a31313a226d61696e2d6d656e753a30223b),
('image_toolkit', 0x733a323a226764223b),
('default_nodes_main', 0x733a313a2232223b),
('site_403', 0x733a303a22223b),
('site_404', 0x733a303a22223b),
('menu_main_links_source', 0x733a393a226d61696e2d6d656e75223b),
('menu_secondary_links_source', 0x733a31333a226d656e752d61626f75742d7573223b),
('tracker_index_nid', 0x693a303b),
('user_admin_role', 0x733a313a2230223b),
('user_signatures', 0x693a313b),
('user_pictures', 0x693a313b),
('user_picture_path', 0x733a383a227069637475726573223b),
('user_picture_default', 0x733a34373a2273697465732f64656661756c742f66696c65732f70696374757265732f67656e657269632d6176617461722e6a7067223b),
('user_picture_dimensions', 0x733a353a223835783835223b),
('user_picture_file_size', 0x733a323a223330223b),
('user_picture_guidelines', 0x733a303a22223b),
('email__active_tab', 0x733a32343a22656469742d656d61696c2d61646d696e2d63726561746564223b),
('user_mail_register_admin_created_subject', 0x733a35383a22416e2061646d696e6973747261746f72206372656174656420616e206163636f756e7420666f7220796f75206174205b736974653a6e616d655d223b),
('user_mail_register_admin_created_body', 0x733a3437363a225b757365723a6e616d655d2c0d0a0d0a4120736974652061646d696e6973747261746f72206174205b736974653a6e616d655d20686173206372656174656420616e206163636f756e7420666f7220796f752e20596f75206d6179206e6f77206c6f6720696e20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420746f20796f75722062726f777365723a0d0a0d0a5b757365723a6f6e652d74696d652d6c6f67696e2d75726c5d0d0a0d0a54686973206c696e6b2063616e206f6e6c792062652075736564206f6e636520746f206c6f6720696e20616e642077696c6c206c65616420796f7520746f2061207061676520776865726520796f752063616e2073657420796f75722070617373776f72642e0d0a0d0a41667465722073657474696e6720796f75722070617373776f72642c20796f752077696c6c2062652061626c6520746f206c6f6720696e206174205b736974653a6c6f67696e2d75726c5d20696e2074686520667574757265207573696e673a0d0a0d0a757365726e616d653a205b757365723a6e616d655d0d0a70617373776f72643a20596f75722070617373776f72640d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_register_pending_approval_subject', 0x733a37313a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d202870656e64696e672061646d696e20617070726f76616c29223b),
('user_mail_register_pending_approval_body', 0x733a3238373a225b757365723a6e616d655d2c0d0a0d0a5468616e6b20796f7520666f72207265676973746572696e67206174205b736974653a6e616d655d2e20596f7572206170706c69636174696f6e20666f7220616e206163636f756e742069732063757272656e746c792070656e64696e6720617070726f76616c2e204f6e636520697420686173206265656e20617070726f7665642c20796f752077696c6c207265636569766520616e6f7468657220652d6d61696c20636f6e7461696e696e6720696e666f726d6174696f6e2061626f757420686f7720746f206c6f6720696e2c2073657420796f75722070617373776f72642c20616e64206f746865722064657461696c732e0d0a0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_register_no_approval_required_subject', 0x733a34363a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d223b),
('user_mail_register_no_approval_required_body', 0x733a3435303a225b757365723a6e616d655d2c0d0a0d0a5468616e6b20796f7520666f72207265676973746572696e67206174205b736974653a6e616d655d2e20596f75206d6179206e6f77206c6f6720696e20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420746f20796f75722062726f777365723a0d0a0d0a5b757365723a6f6e652d74696d652d6c6f67696e2d75726c5d0d0a0d0a54686973206c696e6b2063616e206f6e6c792062652075736564206f6e636520746f206c6f6720696e20616e642077696c6c206c65616420796f7520746f2061207061676520776865726520796f752063616e2073657420796f75722070617373776f72642e0d0a0d0a41667465722073657474696e6720796f75722070617373776f72642c20796f752077696c6c2062652061626c6520746f206c6f6720696e206174205b736974653a6c6f67696e2d75726c5d20696e2074686520667574757265207573696e673a0d0a0d0a757365726e616d653a205b757365723a6e616d655d0d0a70617373776f72643a20596f75722070617373776f72640d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_password_reset_subject', 0x733a36303a225265706c6163656d656e74206c6f67696e20696e666f726d6174696f6e20666f72205b757365723a6e616d655d206174205b736974653a6e616d655d223b),
('user_mail_password_reset_body', 0x733a3430373a225b757365723a6e616d655d2c0d0a0d0a41207265717565737420746f207265736574207468652070617373776f726420666f7220796f7572206163636f756e7420686173206265656e206d616465206174205b736974653a6e616d655d2e0d0a0d0a596f75206d6179206e6f77206c6f6720696e20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420746f20796f75722062726f777365723a0d0a0d0a5b757365723a6f6e652d74696d652d6c6f67696e2d75726c5d0d0a0d0a54686973206c696e6b2063616e206f6e6c792062652075736564206f6e636520746f206c6f6720696e20616e642077696c6c206c65616420796f7520746f2061207061676520776865726520796f752063616e2073657420796f75722070617373776f72642e2049742065787069726573206166746572206f6e652064617920616e64206e6f7468696e672077696c6c2068617070656e2069662069742773206e6f7420757365642e0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_status_activated_notify', 0x733a313a2231223b),
('user_mail_status_activated_subject', 0x733a35373a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d2028617070726f76656429223b),
('user_mail_status_activated_body', 0x733a3436313a225b757365723a6e616d655d2c0d0a0d0a596f7572206163636f756e74206174205b736974653a6e616d655d20686173206265656e206163746976617465642e0d0a0d0a596f75206d6179206e6f77206c6f6720696e20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420696e746f20796f75722062726f777365723a0d0a0d0a5b757365723a6f6e652d74696d652d6c6f67696e2d75726c5d0d0a0d0a54686973206c696e6b2063616e206f6e6c792062652075736564206f6e636520746f206c6f6720696e20616e642077696c6c206c65616420796f7520746f2061207061676520776865726520796f752063616e2073657420796f75722070617373776f72642e0d0a0d0a41667465722073657474696e6720796f75722070617373776f72642c20796f752077696c6c2062652061626c6520746f206c6f6720696e206174205b736974653a6c6f67696e2d75726c5d20696e2074686520667574757265207573696e673a0d0a0d0a757365726e616d653a205b757365723a6e616d655d0d0a70617373776f72643a20596f75722070617373776f72640d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_status_blocked_notify', 0x693a303b),
('user_mail_status_blocked_subject', 0x733a35363a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d2028626c6f636b656429223b),
('user_mail_status_blocked_body', 0x733a38353a225b757365723a6e616d655d2c0d0a0d0a596f7572206163636f756e74206f6e205b736974653a6e616d655d20686173206265656e20626c6f636b65642e0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_cancel_confirm_subject', 0x733a35393a224163636f756e742063616e63656c6c6174696f6e207265717565737420666f72205b757365723a6e616d655d206174205b736974653a6e616d655d223b),
('user_mail_cancel_confirm_body', 0x733a3338313a225b757365723a6e616d655d2c0d0a0d0a41207265717565737420746f2063616e63656c20796f7572206163636f756e7420686173206265656e206d616465206174205b736974653a6e616d655d2e0d0a0d0a596f75206d6179206e6f772063616e63656c20796f7572206163636f756e74206f6e205b736974653a75726c2d62726965665d20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420696e746f20796f75722062726f777365723a0d0a0d0a5b757365723a63616e63656c2d75726c5d0d0a0d0a4e4f54453a205468652063616e63656c6c6174696f6e206f6620796f7572206163636f756e74206973206e6f742072657665727369626c652e0d0a0d0a54686973206c696e6b206578706972657320696e206f6e652064617920616e64206e6f7468696e672077696c6c2068617070656e206966206974206973206e6f7420757365642e0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_status_canceled_notify', 0x693a303b),
('user_mail_status_canceled_subject', 0x733a35373a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d202863616e63656c656429223b),
('user_mail_status_canceled_body', 0x733a38363a225b757365723a6e616d655d2c0d0a0d0a596f7572206163636f756e74206f6e205b736974653a6e616d655d20686173206265656e2063616e63656c65642e0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('contact_default_status', 0x693a313b),
('cache_flush_cache_block', 0x693a313336333335393534323b),
('cache_flush_cache_field', 0x693a313336333335383335383b),
('cache_flush_cache', 0x693a313336333335383335383b),
('cache_flush_cache_filter', 0x693a313336333335383335383b),
('cache_flush_cache_page', 0x693a313336333335383335383b),
('cache_flush_cache_form', 0x693a303b),
('cache_flush_cache_menu', 0x693a313336333335383335383b),
('field_bundle_settings_node__page', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a303a7b7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a323a222d35223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('field_bundle_settings_node__story', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a353a7b733a363a22746561736572223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a313b7d733a343a2266756c6c223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a333a22727373223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31323a227365617263685f696e646578223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31333a227365617263685f726573756c74223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a323a222d35223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('cache_flush_cache_libraries', 0x693a303b),
('superfish_name_1', 0x733a31313a225375706572666973682031223b),
('superfish_menu_1', 0x733a31313a226d61696e2d6d656e753a30223b),
('superfish_depth_1', 0x733a323a222d31223b),
('superfish_type_1', 0x733a31303a22686f72697a6f6e74616c223b),
('superfish_style_1', 0x733a373a2264656661756c74223b),
('superfish_speed_1', 0x733a343a2266617374223b),
('superfish_delay_1', 0x733a333a22383030223b),
('superfish_pathclass_1', 0x733a31323a226163746976652d747261696c223b),
('superfish_pathlevels_1', 0x733a313a2231223b),
('superfish_slide_1', 0x733a383a22766572746963616c223b),
('superfish_arrow_1', 0x693a303b),
('superfish_shadow_1', 0x693a313b),
('superfish_bgf_1', 0x693a303b),
('superfish_spp_1', 0x693a303b),
('superfish_hid_1', 0x693a313b),
('superfish_touch_1', 0x693a303b),
('superfish_touchua_1', 0x693a303b),
('superfish_touchual_1', 0x733a303a22223b),
('superfish_supersubs_1', 0x693a313b),
('superfish_minwidth_1', 0x733a323a223132223b),
('superfish_maxwidth_1', 0x733a323a223237223b),
('superfish_multicolumn_1', 0x693a303b),
('superfish_mcexclude_1', 0x733a303a22223b),
('superfish_mcdepth_1', 0x733a313a2231223b),
('superfish_mclevels_1', 0x733a313a2231223b),
('superfish_firstlast_1', 0x693a313b),
('superfish_zebra_1', 0x693a313b),
('superfish_dfirstlast_1', 0x693a303b),
('superfish_dzebra_1', 0x693a303b),
('superfish_itemcount_1', 0x693a313b),
('superfish_itemcounter_1', 0x693a313b),
('superfish_itemdepth_1', 0x693a313b),
('superfish_hldescription_1', 0x693a303b),
('superfish_hldmenus_1', 0x733a303a22223b),
('superfish_hldexclude_1', 0x733a303a22223b),
('superfish_wrapmul_1', 0x733a303a22223b),
('superfish_wrapul_1', 0x733a303a22223b),
('superfish_wraphl_1', 0x733a303a22223b),
('superfish_wraphlt_1', 0x733a303a22223b),
('superfish_ulclass_1', 0x733a303a22223b),
('superfish_liclass_1', 0x733a303a22223b),
('superfish_hlclass_1', 0x733a303a22223b),
('superfish_pathcss_1', 0x733a303a22223b);

-- --------------------------------------------------------

--
-- Table structure for table `watchdog`
--

CREATE TABLE IF NOT EXISTS `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example "user" or "page not found."',
  `message` longtext NOT NULL,
  `variables` longblob NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT '' COMMENT 'Link to view the result of the event.',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
