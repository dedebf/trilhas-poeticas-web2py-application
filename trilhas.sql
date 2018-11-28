-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "trilhas02" -----------------------------
CREATE DATABASE IF NOT EXISTS `trilhas02` CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `trilhas02`;
-- ---------------------------------------------------------


-- CREATE TABLE "auth_cas" -------------------------------------
CREATE TABLE `auth_cas` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NULL,
	`created_on` DateTime NULL,
	`service` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`ticket` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`renew` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "auth_event" -----------------------------------
CREATE TABLE `auth_event` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`time_stamp` DateTime NULL,
	`client_ip` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`user_id` Int( 11 ) NULL,
	`origin` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`description` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 211;
-- -------------------------------------------------------------


-- CREATE TABLE "auth_group" -----------------------------------
CREATE TABLE `auth_group` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`role` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`description` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 20;
-- -------------------------------------------------------------


-- CREATE TABLE "auth_membership" ------------------------------
CREATE TABLE `auth_membership` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NULL,
	`group_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 20;
-- -------------------------------------------------------------


-- CREATE TABLE "auth_permission" ------------------------------
CREATE TABLE `auth_permission` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`group_id` Int( 11 ) NULL,
	`name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`table_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`record_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "auth_user" ------------------------------------
CREATE TABLE `auth_user` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`first_name` VarChar( 128 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`last_name` VarChar( 128 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`email` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`password` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`registration_key` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`reset_password_key` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`registration_id` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`descricao` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`avatar` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NOT NULL DEFAULT '2017-05-30 16:55:41',
	`modified_on` DateTime NOT NULL DEFAULT '2017-05-30 16:55:41',
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 19;
-- -------------------------------------------------------------


-- CREATE TABLE "t_parental_ratings" ---------------------------
CREATE TABLE `t_parental_ratings` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_description` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 9;
-- -------------------------------------------------------------


-- CREATE TABLE "t_parental_ratings_archive" -------------------
CREATE TABLE `t_parental_ratings_archive` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_description` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`current_record` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "t_pois" ---------------------------------------
CREATE TABLE `t_pois` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_track` Int( 11 ) NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_content` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_latitude` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_longitude` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_placing` Int( 11 ) NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 138;
-- -------------------------------------------------------------


-- CREATE TABLE "t_pois_archive" -------------------------------
CREATE TABLE `t_pois_archive` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_track` Int( 11 ) NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_content` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_latitude` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_longitude` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_placing` Int( 11 ) NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`current_record` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "t_reports" ------------------------------------
CREATE TABLE `t_reports` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_description` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_email` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_track` Int( 11 ) NOT NULL,
	`f_poi` Int( 11 ) NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------


-- CREATE TABLE "t_reports_archive" ----------------------------
CREATE TABLE `t_reports_archive` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_parental_rating` Int( 11 ) NOT NULL,
	`f_description` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_owner` Int( 11 ) NOT NULL,
	`f_create_date` DateTime NOT NULL DEFAULT '2017-04-18 13:11:12',
	`f_icon` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`current_record` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "t_tags" ---------------------------------------
CREATE TABLE `t_tags` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 69;
-- -------------------------------------------------------------


-- CREATE TABLE "t_tags_archive" -------------------------------
CREATE TABLE `t_tags_archive` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`current_record` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "t_track_pois" ---------------------------------
CREATE TABLE `t_track_pois` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_track` Int( 11 ) NOT NULL,
	`f_poi` Int( 11 ) NOT NULL,
	`f_order` Int( 11 ) NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "t_track_pois_archive" -------------------------
CREATE TABLE `t_track_pois_archive` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_track` Int( 11 ) NOT NULL,
	`f_poi` Int( 11 ) NOT NULL,
	`f_order` Int( 11 ) NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`current_record` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "t_track_ratings" ------------------------------
CREATE TABLE `t_track_ratings` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_score` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 0,
	`f_track` Int( 11 ) NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`f_feedback` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`f_email` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------


-- CREATE TABLE "t_track_ratings_archive" ----------------------
CREATE TABLE `t_track_ratings_archive` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_score` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 0,
	`f_track` Int( 11 ) NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`current_record` Int( 11 ) NULL,
	`f_feedback` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`f_email` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "t_track_tags" ---------------------------------
CREATE TABLE `t_track_tags` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_track` Int( 11 ) NOT NULL,
	`f_tag` Int( 11 ) NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 161;
-- -------------------------------------------------------------


-- CREATE TABLE "t_track_tags_archive" -------------------------
CREATE TABLE `t_track_tags_archive` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_track` Int( 11 ) NOT NULL,
	`f_tag` Int( 11 ) NOT NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`current_record` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "t_tracks" -------------------------------------
CREATE TABLE `t_tracks` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_parental_rating` Int( 11 ) NOT NULL,
	`f_owner` Int( 11 ) NOT NULL,
	`f_create_date` DateTime NOT NULL DEFAULT '2016-11-17 15:55:11',
	`f_icon` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`f_description` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 25;
-- -------------------------------------------------------------


-- CREATE TABLE "t_tracks_archive" -----------------------------
CREATE TABLE `t_tracks_archive` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`f_name` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`f_parental_rating` Int( 11 ) NOT NULL,
	`f_owner` Int( 11 ) NOT NULL,
	`f_create_date` DateTime NOT NULL DEFAULT '2016-11-17 15:55:11',
	`f_icon` VarChar( 512 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`is_active` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`created_on` DateTime NULL,
	`created_by` Int( 11 ) NULL,
	`modified_on` DateTime NULL,
	`modified_by` Int( 11 ) NULL,
	`current_record` Int( 11 ) NULL,
	`f_description` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- Dump data of "auth_cas" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_event" -------------------------------
INSERT INTO `auth_event`(`id`,`time_stamp`,`client_ip`,`user_id`,`origin`,`description`) VALUES 
( '1', '2016-11-17 15:56:40', '179.214.96.126', NULL, 'auth', 'Group 1 created' ),
( '2', '2016-11-17 15:56:40', '179.214.96.126', '1', 'auth', 'User 1 Registered' ),
( '3', '2016-11-17 16:03:33', '179.214.96.126', '1', 'auth', 'User 1 Profile updated' ),
( '4', '2016-11-17 16:31:26', '179.214.96.126', '1', 'auth', 'User 1 Logged-in' ),
( '5', '2016-11-17 16:32:14', '179.214.96.126', '1', 'auth', 'User 1 Profile updated' ),
( '6', '2016-11-17 16:32:28', '179.214.96.126', '1', 'auth', 'User 1 Logged-in' ),
( '7', '2016-11-17 16:38:39', '179.214.96.126', '1', 'auth', 'User 1 Logged-in' ),
( '8', '2016-11-17 16:38:53', '179.214.96.126', '1', 'auth', 'User 1 Profile updated' ),
( '9', '2016-11-17 16:57:56', '179.214.96.126', '1', 'auth', 'User 1 Logged-out' ),
( '10', '2016-11-17 17:16:46', '179.214.96.126', '2', 'auth', 'User 2 Logged-in' ),
( '11', '2016-11-17 17:24:34', '179.214.96.126', '2', 'auth', 'User 2 Logged-out' ),
( '12', '2016-11-17 17:28:47', '179.214.96.126', '1', 'auth', 'User 1 Logged-in' ),
( '13', '2016-11-17 18:34:23', '177.13.72.4', NULL, 'auth', 'Group 3 created' ),
( '14', '2016-11-17 18:34:23', '177.13.72.4', '3', 'auth', 'User 3 Registered' ),
( '15', '2016-11-17 19:01:50', '177.13.72.4', '3', 'auth', 'User 3 Logged-in' ),
( '16', '2016-11-17 19:02:19', '177.13.72.4', '3', 'auth', 'User 3 Profile updated' ),
( '17', '2016-11-19 14:50:14', '177.79.35.197', NULL, 'auth', 'Group 4 created' ),
( '18', '2016-11-19 14:50:14', '177.79.35.197', '4', 'auth', 'User 4 Registered' ),
( '19', '2016-11-19 14:54:22', '177.79.35.197', '4', 'auth', 'User 4 Profile updated' ),
( '20', '2016-11-19 15:02:14', '172.16.13.2', '1', 'auth', 'User 1 Logged-in' ),
( '21', '2016-11-19 16:16:55', '177.79.35.197', '4', 'auth', 'User 4 Logged-in' ),
( '22', '2016-11-21 09:53:24', '189.59.20.134', NULL, 'auth', 'Group 5 created' ),
( '23', '2016-11-21 09:53:24', '189.59.20.134', '5', 'auth', 'User 5 Registered' ),
( '24', '2016-11-28 15:23:48', '200.166.197.198', NULL, 'auth', 'User 3 Password reset' ),
( '25', '2016-11-28 20:31:38', '201.22.136.73', '5', 'auth', 'User 5 Logged-in' ),
( '26', '2016-11-29 11:21:57', '189.6.24.63', NULL, 'auth', 'User 4 Password reset' ),
( '27', '2016-11-29 11:24:25', '189.6.24.63', '4', 'auth', 'User 4 Logged-in' ),
( '28', '2016-11-30 14:13:35', '189.6.24.63', '4', 'auth', 'User 4 Logged-in' ),
( '29', '2016-12-12 21:07:58', '187.113.27.166', '5', 'auth', 'User 5 Logged-out' ),
( '30', '2016-12-12 21:17:29', '187.113.27.166', NULL, 'auth', 'Group 6 created' ),
( '31', '2016-12-12 21:17:29', '187.113.27.166', '6', 'auth', 'User 6 Registered' ),
( '32', '2016-12-12 21:49:16', '187.113.27.166', '6', 'auth', 'User 6 Profile updated' ),
( '33', '2016-12-12 21:49:48', '187.113.27.166', '6', 'auth', 'User 6 Profile updated' ),
( '34', '2016-12-14 23:15:35', '177.13.226.43', NULL, 'auth', 'Group 7 created' ),
( '35', '2016-12-14 23:15:35', '177.13.226.43', '7', 'auth', 'User 7 Registered' ),
( '36', '2016-12-15 10:08:41', '10.80.25.98', NULL, 'auth', 'Group 8 created' ),
( '37', '2016-12-15 10:08:41', '10.80.25.98', '8', 'auth', 'User 8 Registered' ),
( '38', '2016-12-15 11:10:21', '177.133.55.150', '5', 'auth', 'User 5 Logged-in' ),
( '39', '2016-12-15 20:10:44', '201.54.48.97', '6', 'auth', 'User 6 Logged-in' ),
( '40', '2016-12-15 21:14:14', '201.54.48.97', '6', 'auth', 'User 6 Logged-in' ),
( '41', '2016-12-16 14:59:33', '189.6.24.90', '4', 'auth', 'User 4 Logged-out' ),
( '42', '2016-12-16 15:38:12', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '43', '2016-12-16 15:44:50', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '44', '2016-12-16 15:46:10', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '45', '2016-12-16 16:03:41', '200.219.133.102', NULL, 'auth', 'Group 9 created' ),
( '46', '2016-12-16 16:03:41', '200.219.133.102', '9', 'auth', 'User 9 Registered' ),
( '47', '2016-12-16 16:04:36', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '48', '2016-12-18 12:32:48', '187.65.176.211', '6', 'auth', 'User 6 Logged-in' ),
( '49', '2016-12-18 20:37:53', '187.65.176.211', '6', 'auth', 'User 6 Logged-in' ),
( '50', '2016-12-18 21:40:55', '179.176.117.91', '7', 'auth', 'User 7 Logged-in' ),
( '51', '2016-12-19 09:27:26', '179.176.117.91', '7', 'auth', 'User 7 Logged-in' ),
( '52', '2016-12-20 17:03:47', '177.132.238.173', '4', 'auth', 'User 4 Logged-in' ),
( '53', '2016-12-20 17:29:34', '177.132.238.173', '5', 'auth', 'User 5 Logged-out' ),
( '54', '2016-12-20 17:30:17', '177.132.238.173', '5', 'auth', 'User 5 Logged-in' ),
( '55', '2016-12-20 17:33:26', '177.132.238.173', '4', 'auth', 'User 4 Logged-in' ),
( '56', '2016-12-20 17:35:02', '177.132.238.173', '5', 'auth', 'User 5 Logged-out' ),
( '57', '2016-12-20 17:38:37', '177.132.238.173', '5', 'auth', 'User 5 Logged-in' ),
( '58', '2016-12-27 18:32:27', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '59', '2017-01-18 19:07:41', '189.27.28.134', '5', 'auth', 'User 5 Profile updated' ),
( '60', '2017-01-18 19:21:08', '189.27.28.134', '4', 'auth', 'User 4 Logged-in' ),
( '61', '2017-01-18 19:21:26', '189.27.28.134', '4', 'auth', 'User 4 Logged-out' ),
( '62', '2017-01-18 19:21:30', '189.27.28.134', '4', 'auth', 'User 4 Logged-in' ),
( '63', '2017-01-18 19:43:01', '189.27.28.134', '4', 'auth', 'User 4 Logged-out' ),
( '64', '2017-01-18 19:53:18', '189.27.28.134', NULL, 'auth', 'Group 10 created' ),
( '65', '2017-01-18 19:53:18', '189.27.28.134', '10', 'auth', 'User 10 Registered' ),
( '66', '2017-01-18 19:56:25', '189.27.28.134', NULL, 'auth', 'Group 11 created' ),
( '67', '2017-01-18 19:56:25', '189.27.28.134', '11', 'auth', 'User 11 Registered' ),
( '68', '2017-01-18 20:10:27', '189.27.28.134', '10', 'auth', 'User 10 Logged-out' ),
( '69', '2017-01-18 20:19:37', '189.27.28.134', '4', 'auth', 'User 4 Logged-in' ),
( '70', '2017-01-18 21:50:08', '189.27.28.134', '11', 'auth', 'User 11 Logged-in' ),
( '71', '2017-01-18 22:13:58', '189.27.28.134', NULL, 'auth', 'Group 12 created' ),
( '72', '2017-01-18 22:13:58', '189.27.28.134', '12', 'auth', 'User 12 Registered' ),
( '73', '2017-01-19 14:38:20', '189.6.16.196', '11', 'auth', 'User 11 Logged-in' ),
( '74', '2017-01-19 15:46:23', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '75', '2017-01-19 17:24:20', '189.6.24.90', NULL, 'auth', 'User 4 Password reset' ),
( '76', '2017-01-19 17:31:43', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '77', '2017-01-19 17:35:53', '189.6.24.90', '4', 'auth', 'User 4 Logged-out' ),
( '78', '2017-01-19 17:36:04', '189.6.24.90', '10', 'auth', 'User 10 Logged-in' ),
( '79', '2017-01-19 17:42:42', '189.6.24.90', '10', 'auth', 'User 10 Logged-out' ),
( '80', '2017-01-19 18:18:57', '189.6.24.90', '10', 'auth', 'User 10 Logged-in' ),
( '81', '2017-01-19 18:19:02', '189.6.24.90', '10', 'auth', 'User 10 Logged-out' ),
( '82', '2017-01-20 11:19:15', '177.96.217.188', '5', 'auth', 'User 5 Logged-in' ),
( '83', '2017-01-22 20:18:37', '189.114.3.120', '5', 'auth', 'User 5 Logged-in' ),
( '84', '2017-01-23 17:36:05', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '85', '2017-01-23 20:12:55', '186.214.153.243', NULL, 'auth', 'Group 13 created' ),
( '86', '2017-01-23 20:12:55', '186.214.153.243', '13', 'auth', 'User 13 Registered' ),
( '87', '2017-01-23 20:13:26', '186.214.153.243', '13', 'auth', 'User 13 Profile updated' ),
( '88', '2017-01-23 20:14:30', '186.214.153.243', '13', 'auth', 'User 13 Profile updated' ),
( '89', '2017-01-23 20:15:08', '186.214.153.243', '13', 'auth', 'User 13 Profile updated' ),
( '90', '2017-01-23 20:49:39', '186.214.153.243', '4', 'auth', 'User 4 Logged-in' ),
( '91', '2017-01-23 20:57:07', '186.214.153.243', '13', 'auth', 'User 13 Logged-out' ),
( '92', '2017-01-23 20:57:15', '186.214.153.243', '13', 'auth', 'User 13 Logged-in' ),
( '93', '2017-01-23 21:21:23', '186.214.153.243', '4', 'auth', 'User 4 Logged-in' ),
( '94', '2017-01-23 21:22:04', '186.214.153.243', '4', 'auth', 'User 4 Logged-in' ),
( '95', '2017-01-24 12:11:43', '189.74.17.165', '5', 'auth', 'User 5 Logged-in' ),
( '96', '2017-01-24 12:22:10', '189.74.17.165', '5', 'auth', 'User 5 Logged-out' ),
( '97', '2017-01-24 12:25:42', '189.74.17.165', NULL, 'auth', 'Group 14 created' ),
( '98', '2017-01-24 12:25:42', '189.74.17.165', '14', 'auth', 'User 14 Registered' ),
( '99', '2017-01-24 17:18:16', '177.207.232.141', '7', 'auth', 'User 7 Logged-in' ),
( '100', '2017-01-25 14:23:22', '189.6.24.90', '10', 'auth', 'User 10 Logged-in' ),
( '101', '2017-01-25 14:25:38', '189.6.24.90', '10', 'auth', 'User 10 Logged-out' ),
( '102', '2017-01-25 20:24:43', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '103', '2017-01-26 16:17:30', '189.6.26.96', '10', 'auth', 'User 10 Logged-in' ),
( '104', '2017-01-26 16:22:56', '189.6.26.96', '10', 'auth', 'User 10 Profile updated' ),
( '105', '2017-01-26 16:23:28', '189.6.26.96', '10', 'auth', 'User 10 Profile updated' ),
( '106', '2017-01-26 16:35:32', '189.6.26.96', '10', 'auth', 'User 10 Profile updated' ),
( '107', '2017-01-26 16:36:18', '189.6.26.96', '10', 'auth', 'User 10 Profile updated' ),
( '108', '2017-01-27 19:41:02', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '109', '2017-01-31 15:51:40', '179.185.93.70', '7', 'auth', 'User 7 Logged-in' ),
( '110', '2017-01-31 21:41:50', '177.13.237.158', '7', 'auth', 'User 7 Logged-in' ),
( '111', '2017-01-31 23:19:38', '189.6.24.90', '13', 'auth', 'User 13 Logged-in' ),
( '112', '2017-01-31 23:29:21', '189.6.24.90', '13', 'auth', 'User 13 Profile updated' ),
( '113', '2017-02-01 00:10:54', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '114', '2017-02-01 12:32:14', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '115', '2017-02-01 16:44:03', '177.13.236.62', '7', 'auth', 'User 7 Logged-in' ),
( '116', '2017-02-01 18:12:16', '177.133.54.9', '5', 'auth', 'User 5 Logged-out' ),
( '117', '2017-02-01 18:20:48', '177.133.54.9', '8', 'auth', 'User 8 Logged-in' ),
( '118', '2017-02-01 19:28:38', '177.133.54.9', '4', 'auth', 'User 4 Logged-in' ),
( '119', '2017-02-01 20:43:25', '177.133.54.9', '8', 'auth', 'User 8 Logged-out' ),
( '120', '2017-02-01 21:54:47', '177.133.54.9', NULL, 'auth', 'Group 15 created' ),
( '121', '2017-02-01 21:54:47', '177.133.54.9', '15', 'auth', 'User 15 Registered' ),
( '122', '2017-02-02 00:06:39', '177.133.54.9', NULL, 'auth', 'Group 16 created' ),
( '123', '2017-02-02 00:06:39', '177.133.54.9', '16', 'auth', 'User 16 Registered' ),
( '124', '2017-02-02 09:58:49', '10.80.25.86', '8', 'auth', 'User 8 Logged-in' ),
( '125', '2017-02-02 12:13:01', '10.80.25.86', '8', 'auth', 'User 8 Logged-in' ),
( '126', '2017-02-04 10:08:25', '201.22.153.121', '5', 'auth', 'User 5 Logged-in' ),
( '127', '2017-02-04 17:48:15', '177.96.252.59', '5', 'auth', 'User 5 Logged-out' ),
( '128', '2017-02-04 17:48:51', '177.96.252.59', '6', 'auth', 'User 6 Logged-in' ),
( '129', '2017-02-04 17:52:13', '177.96.252.59', '5', 'auth', 'User 5 Logged-out' ),
( '130', '2017-02-04 17:52:31', '177.96.252.59', '6', 'auth', 'User 6 Logged-in' ),
( '131', '2017-02-05 10:51:46', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '132', '2017-02-05 10:52:31', '189.6.37.40', '4', 'auth', 'User 4 Logged-out' ),
( '133', '2017-02-05 10:55:06', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '134', '2017-02-05 11:01:46', '189.6.37.40', '1', 'auth', 'User 1 Logged-in' ),
( '135', '2017-02-05 11:24:16', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '136', '2017-02-05 11:25:37', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '137', '2017-02-05 11:33:22', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '138', '2017-02-05 11:34:30', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '139', '2017-02-05 11:36:33', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '140', '2017-02-05 11:38:39', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '141', '2017-02-05 11:44:23', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '142', '2017-02-05 11:50:49', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '143', '2017-02-05 13:27:16', '177.96.252.59', '5', 'auth', 'User 5 Logged-in' ),
( '144', '2017-02-05 14:00:07', '191.176.121.108', '6', 'auth', 'User 6 Logged-in' ),
( '145', '2017-02-05 14:23:49', '189.6.37.40', '4', 'auth', 'User 4 Logged-in' ),
( '146', '2017-02-05 15:59:30', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '147', '2017-02-05 22:02:00', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '148', '2017-02-05 22:13:36', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '149', '2017-02-06 14:25:59', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '150', '2017-02-07 13:59:29', '201.54.48.30', '6', 'auth', 'User 6 Logged-in' ),
( '151', '2017-02-08 14:50:11', '189.6.26.96', '10', 'auth', 'User 10 Logged-in' ),
( '152', '2017-02-08 14:51:50', '189.6.26.96', '10', 'auth', 'User 10 Profile updated' ),
( '153', '2017-02-08 15:00:28', '189.6.26.96', '10', 'auth', 'User 10 Logged-in' ),
( '154', '2017-02-09 17:23:00', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '155', '2017-02-09 17:31:08', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '156', '2017-02-09 18:15:52', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '157', '2017-02-12 22:55:35', '191.176.121.108', '6', 'auth', 'User 6 Logged-in' ),
( '158', '2017-02-15 18:14:54', '189.27.6.33', '6', 'auth', 'User 6 Logged-in' ),
( '159', '2017-02-15 20:13:05', '187.59.142.43', '5', 'auth', 'User 5 Logged-out' ),
( '160', '2017-02-15 20:26:12', '187.59.142.43', NULL, 'auth', 'Group 17 created' ),
( '161', '2017-02-15 20:26:12', '187.59.142.43', '17', 'auth', 'User 17 Registered' ),
( '162', '2017-02-15 22:31:20', '189.6.26.96', '10', 'auth', 'User 10 Logged-in' ),
( '163', '2017-02-16 15:35:59', '189.61.73.205', '6', 'auth', 'User 6 Logged-in' ),
( '164', '2017-02-21 23:47:04', '189.6.24.90', '13', 'auth', 'User 13 Logged-in' ),
( '165', '2017-02-23 00:56:19', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '166', '2017-02-24 20:33:30', '201.22.190.8', '5', 'auth', 'User 5 Logged-in' ),
( '167', '2017-02-27 23:40:50', '189.6.24.90', '11', 'auth', 'User 11 Logged-in' ),
( '168', '2017-03-02 19:07:03', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '169', '2017-03-05 17:50:50', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '170', '2017-03-07 01:36:45', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '171', '2017-03-07 02:56:31', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '172', '2017-03-07 17:18:11', '186.213.248.164', '11', 'auth', 'User 11 Logged-in' ),
( '173', '2017-03-10 11:07:50', '189.6.24.90', '4', 'auth', 'User 4 Logged-in' ),
( '174', '2017-03-10 15:47:06', '187.113.29.106', '5', 'auth', 'User 5 Logged-out' ),
( '175', '2017-03-10 15:52:03', '187.113.29.106', '5', 'auth', 'User 5 Logged-in' ),
( '176', '2017-03-15 15:34:36', '189.6.24.208', '10', 'auth', 'User 10 Logged-in' ),
( '177', '2017-04-05 16:58:50', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '178', '2017-04-05 17:29:11', '127.0.0.1', '1', 'auth', 'User 1 Logged-out' ),
( '179', '2017-04-05 17:34:14', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '180', '2017-04-10 13:29:22', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '181', '2017-04-10 14:30:19', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '182', '2017-04-10 14:30:35', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '183', '2017-04-10 14:32:25', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '184', '2017-04-11 14:23:39', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '185', '2017-04-11 14:25:29', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '186', '2017-04-11 14:27:00', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '187', '2017-04-11 14:27:06', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '188', '2017-04-11 14:29:56', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '189', '2017-04-11 14:31:25', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '190', '2017-04-11 14:31:33', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '191', '2017-04-11 14:47:16', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '192', '2017-04-11 14:47:33', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '193', '2017-04-16 00:32:52', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '194', '2017-04-16 13:17:55', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '195', '2017-04-20 18:43:14', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '196', '2017-04-22 17:33:09', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '197', '2017-04-22 17:39:29', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '198', '2017-04-22 17:40:00', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '199', '2017-04-22 17:41:09', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '200', '2017-04-22 17:43:01', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '201', '2017-04-22 17:45:07', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '202', '2017-05-30 16:56:16', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '203', '2017-05-30 17:02:28', '127.0.0.1', '4', 'auth', 'User 4 Profile updated' ),
( '204', '2017-05-30 18:42:25', '127.0.0.1', '4', 'auth', 'User 4 Profile updated' ),
( '205', '2017-06-02 18:14:53', '127.0.0.1', NULL, 'auth', 'Group 19 created' ),
( '206', '2017-06-02 18:14:53', '127.0.0.1', '18', 'auth', 'User 18 Registered' ),
( '207', '2017-06-03 16:35:56', '127.0.0.1', '4', 'auth', 'User 4 Logged-in' ),
( '208', '2017-06-03 16:36:42', '127.0.0.1', '4', 'auth', 'User 4 Logged-out' ),
( '209', '2017-12-01 19:10:22', '::1', '4', 'auth', 'User 4 Logged-in' ),
( '210', '2018-01-10 21:02:39', '::1', '4', 'auth', 'User 4 Logged-in' );
-- ---------------------------------------------------------


-- Dump data of "auth_group" -------------------------------
INSERT INTO `auth_group`(`id`,`role`,`description`) VALUES 
( '1', 'user_1', 'Group uniquely assigned to user 1' ),
( '2', 'admin', '' ),
( '3', 'user_3', 'Group uniquely assigned to user 3' ),
( '4', 'user_4', 'Group uniquely assigned to user 4' ),
( '5', 'user_5', 'Group uniquely assigned to user 5' ),
( '6', 'user_6', 'Group uniquely assigned to user 6' ),
( '7', 'user_7', 'Group uniquely assigned to user 7' ),
( '8', 'user_8', 'Group uniquely assigned to user 8' ),
( '9', 'user_9', 'Group uniquely assigned to user 9' ),
( '10', 'user_10', 'Group uniquely assigned to user 10' ),
( '11', 'user_11', 'Group uniquely assigned to user 11' ),
( '12', 'user_12', 'Group uniquely assigned to user 12' ),
( '13', 'user_13', 'Group uniquely assigned to user 13' ),
( '14', 'user_14', 'Group uniquely assigned to user 14' ),
( '15', 'user_15', 'Group uniquely assigned to user 15' ),
( '16', 'user_16', 'Group uniquely assigned to user 16' ),
( '17', 'user_17', 'Group uniquely assigned to user 17' ),
( '18', 'manager', 'Gerente dos dados' ),
( '19', 'user_18', 'Group uniquely assigned to user 18' );
-- ---------------------------------------------------------


-- Dump data of "auth_membership" --------------------------
INSERT INTO `auth_membership`(`id`,`user_id`,`group_id`) VALUES 
( '1', '1', '1' ),
( '2', '2', '2' ),
( '3', '3', '3' ),
( '4', '4', '2' ),
( '5', '5', '5' ),
( '6', '6', '6' ),
( '7', '7', '7' ),
( '8', '8', '8' ),
( '9', '9', '9' ),
( '10', '10', '10' ),
( '11', '11', '11' ),
( '12', '12', '12' ),
( '13', '13', '13' ),
( '14', '14', '14' ),
( '15', '15', '15' ),
( '16', '16', '16' ),
( '17', '17', '17' ),
( '18', '5', '18' ),
( '19', '18', '19' );
-- ---------------------------------------------------------


-- Dump data of "auth_permission" --------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_user" --------------------------------
INSERT INTO `auth_user`(`id`,`first_name`,`last_name`,`email`,`password`,`registration_key`,`reset_password_key`,`registration_id`,`descricao`,`avatar`,`created_on`,`modified_on`) VALUES 
( '1', 'Francisco', 'Barretto', 'kikobarretto@gmail.com', 'pbkdf2(1000,20,sha512)$b731f4fe47a0c4ec$1e63ffec2222f4fee1edf0e152b6cd88bd9e0e10', '', '', '', 'Francisco Barretto', 'auth_user.avatar.9e44f3ca62561492.53637265656e2053686f7420323031362d31302d33312061742031352e31362e30392e706e67.png', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '2', 'admin', 'admin', 'admin@admin.com', 'pbkdf2(1000,20,sha512)$8febcbc49661f601$d1eea86a0184b4bff413e967abfc4330bdeccc1a', '', '', '', '', '', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '3', 'Murilo', 'Fero', 'Muferro@gmail.com', 'pbkdf2(1000,20,sha512)$a6c32a6114d25722$7f7f711d836fff7a3906f19bf8f8cdd358fdffb5', '', '', '', 'Oi', 'auth_user.avatar.b039fa596d76650e.31343536333337335f31303231303935363437343038363230345f373439363633373633343934383139373031335f6e2e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '4', 'André', 'Freitas', 'dedebf@gmail.com', 'pbkdf2(1000,20,sha512)$8b853e32064adf16$7fcc00a7a827dd191c2962a2d64825d86bc84f51', '', '', '', 'Descrição do André o/', 'auth_user.avatar.a1b8986d867e7f5c.7468756d6230312e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 18:42:19' ),
( '5', 'João Victor', 'Pacífico', 'joaovictorpd@gmail.com', 'pbkdf2(1000,20,sha512)$ac1b77a14d89ca32$66f4652d53335f0ee5d4feb4f83ab34a6fc389dc', '', '', '', 'Poeta das coisas pequeninas. Diretor artístico e curador do sistema Trilhas Poéticas.', 'auth_user.avatar.bedba4a02687fd85.31313233323133335f3434303734373535363131363337385f3731333333323535313337323935333138375f6f2e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '6', 'Vinicius Borba', 'AE', 'viniciusbae85@gmail.com', 'pbkdf2(1000,20,sha512)$ba904b5ae6d6fd1e$77c163d5d84e6fa86cba3f05383865a0e4c594f1', '', '', '', 'Poeta e produtor do coletivo Radicais Livres S/A, Vinicius Borba é agitador cultural da comunidade de São Sebastião-DF, e produz saraus há 14 anos pela comunidade.
Lançou seu primeiro livro, o Fora da Ordem, que tem voz e vez nessa primeira trilha poética no projeto. Vinicius também foi articulador de comunicação do Coletivo palavra e segue parceiro de projetos e loucuras artísticas desse Coletivo, tendo também produzido a versão digital de seu primeiro livro seguindo a dinâmica de ARte de Interface, como propõe o Coletivo, com hipertexto, multimídia e colaboração.', 'auth_user.avatar.86f99f47de84ddca.56425f5065422e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '7', 'Marina', 'Mara', 'marinamara@gmail.com', 'pbkdf2(1000,20,sha512)$9faf0ee057ce309e$4ed6fc07da202486115b1b03b907471354be84fa', '', '', '', 'Marina Mara é poeta brasiliense e ativista lírica.', 'auth_user.avatar.88e0c2093dd776bf.4d6172696e61204d61726120656d20706572666f726d616e636520636c697070696e672e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '8', 'Tairo', 'Lima', 'tairoloiola@gmail.com', 'pbkdf2(1000,20,sha512)$8a3cf99132e972ab$20e75919857b988eb43cfb56a61685c1906698a5', '', '', '', 'poeta', 'auth_user.avatar.9d2d4730ca1163ef.31323033313338305f313638373631383239343830313738375f313134323333353132313632313639353230345f6f2e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '9', 'Thiago', 'Gualberto', 'tdelima@gmail.com', 'pbkdf2(1000,20,sha512)$a8b8e0bfbb7d6f38$eed51979f1a35088c737b5304532f10c201245fb', '', '', '', 'namastop', 'auth_user.avatar.a0d80f03ee0c88ce.31313935343738315f31303230373334393635303438373837355f3632353335323036333839353930353531335f6e2e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '10', 'Yasmin', 'Adorno', 'yasmin.adornof@gmail.com', 'pbkdf2(1000,20,sha512)$b1ebc785b319d034$8b92aa38e391aae81f34a432f2654b7f4dacb703', '', '', '', 'Yasmin Adorno é artista visual residente em Brasília, Bacharel em Artes Visuais pela Universidade de Brasília e co-fundadora do Espaço AVI. Atualmente trabalha no CAPS – Centro de Assistência Psicossocial, em Brasília junto à uma equipe multidisciplinar coordenando uma oficina de cinema e video. Estudou fotografia no centro cultural ROJAS em Buenos Aires, UBA. Trabalhou na mostra Cultura Inclusiva como monitora de pintura e vídeo para cegos, cominando em uma exposição no CCBB de Brasília. Em 2015 para o processo de formação e ateliê EAVerão no Parque Lage. Já participou de residências artísticas e exposições nacionais e internacionais. Em 2016 acontece a primeira individual do espaço AVI.', 'auth_user.avatar.a9238b48b4d5af82.466f746f2063726961646120656d2031382d31312d313520c3a0732031322e30312023322e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '11', 'Henrique', 'Moll', 'hickmoll@hotmail.com', 'pbkdf2(1000,20,sha512)$a612ec70d84a595e$23c01a96a76987d4021c2bfc00784c2395e2c9e4', '', '', '', 'Henrique Moll é Biomédico de formação, gestor e idealizador da empresa Vórtice Social Media e colaborador do Coletivo Palavra. Poeta de ocasião, gosta de escrever e trilhar caminhos por essa capital turbulenta.', 'auth_user.avatar.bf0f05922c1949da.536e6170636861742d353533353130333737313131343636313538302e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '12', 'Murilo', 'Timo', 'murilotimo@gmail.com', 'pbkdf2(1000,20,sha512)$9e58fee15e33b6e3$9bf14790039fcd60a592af14eac455b564f47e5f', '', '', '', 'Ainda estou aprendendo a aprender', '', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '13', 'Renato', 'Moll', 'mollrenato@gmail.com', 'pbkdf2(1000,20,sha512)$940931e933d76a9b$bc6ad30f2c4912e3880f62475a8e0b6178feaeec', '', '', '', 'Desenhista, pintor e animador brasiliense. Em sua carreira, busca fomentar posturas equilibradas no planeta, dar movimento e interatividade à sua obra, somar-se a grupos, coletivos, projetos e iniciativas que visem a sustentabilidade, a difusão da cultura, o fazer artístico e o empoderamento do povo – em especial àqueles em situação de vulnerabilidade.​', 'auth_user.avatar.b08f9c7442eba132.6364625f31375f6c6f772e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '14', 'Thiago', 'Jorge', 'thijoca@gmail.com', 'pbkdf2(1000,20,sha512)$b82292440278c11a$aa539e822a12b7a140bf9265ecfd964d82bc50a1', '', '', '', '', 'auth_user.avatar.8012fe39a7cb6df8.74686961676f206f6b6f6b2e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '15', 'Erick', 'Velozo', 'Stibium@gmail.com', 'pbkdf2(1000,20,sha512)$93bba206c20907b9$aaa70ed3357efff86b92d4fa00976dbb55172a1c', '', '', '', 'Dj e produtor. Cofundador do coletivo palavra.', '', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '16', 'Verônica', 'Pires', 'veronicappsoares@gmail.com', 'pbkdf2(1000,20,sha512)$aab48c91d42b3c7c$c4707dea3cc0d8c19a75d6d36434eaab3d4da104', '', '', '', 'Aspirante a corpo cósmico e coracionalmente brincante.', 'auth_user.avatar.a1877a07b517a7da.31323430303435375f3732323231343537373837393139315f333931323234313531303731343539323434305f6e2e6a7067.jpg', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '17', 'leandro', 'morais', 'leandromoraiseu@yahoo.com.br', 'pbkdf2(1000,20,sha512)$871ef13b5d58c948$03059eb9b10fc8abb1cce8bb5cf9cb579bf925ae', '', '', '', '', '', '2017-05-30 16:55:41', '2017-05-30 16:55:41' ),
( '18', 'Maurício', 'Chades', 'maudca@gmail.com', 'pbkdf2(1000,20,sha512)$a3038462bbac4c27$59aea403f67931768a4bd88ad33655534483acf5', '', '', '', 'Mauríccio', '', '2017-06-02 18:14:53', '2017-06-02 18:14:10' );
-- ---------------------------------------------------------


-- Dump data of "t_parental_ratings" -----------------------
INSERT INTO `t_parental_ratings`(`id`,`f_name`,`f_description`,`is_active`,`created_on`,`created_by`,`modified_on`,`modified_by`) VALUES 
( '3', 'Livre', 'Recomendado à todas as idades', 'T', '2015-10-15 23:48:42', '1', '2015-10-15 23:48:42', '1' ),
( '4', '10', 'Não recomendado para menores de dez anos', 'T', '2015-10-15 23:49:13', '1', '2015-10-15 23:49:13', '1' ),
( '5', '12', 'Não recomendado para menores de doze anos', 'T', '2015-10-15 23:49:29', '1', '2015-10-15 23:49:29', '1' ),
( '6', '14', 'Não recomendado para menores de catorze anos', 'T', '2015-10-15 23:49:59', '1', '2015-10-15 23:49:59', '1' ),
( '7', '16', 'Não recomendado para menores de dezesseis anos', 'T', '2015-10-15 23:50:25', '1', '2015-10-15 23:50:25', '1' ),
( '8', '18', 'Não recomendado para menores de dezoito anos', 'T', '2015-10-15 23:50:46', '1', '2015-10-15 23:50:46', '1' );
-- ---------------------------------------------------------


-- Dump data of "t_parental_ratings_archive" ---------------
-- ---------------------------------------------------------


-- Dump data of "t_pois" -----------------------------------
INSERT INTO `t_pois`(`id`,`f_track`,`f_name`,`f_content`,`f_latitude`,`f_longitude`,`f_placing`,`is_active`,`created_on`,`created_by`,`modified_on`,`modified_by`) VALUES 
( '1', '1', 'Science', '<p>https://www.youtube.com/watch?v=yIjg0mdsqjM</p>
', '-8.080984688871991', '-34.87060546875', '0', 'T', '2016-11-17 16:50:11', '1', '2016-11-17 16:50:11', '1' ),
( '2', '1', 'Mangue', '<p><img alt="" id="a" src="http://www.astrocentro.com.br/files_astrocentrobr/field/image/astrologia-astrocentro_1790.jpg" /></p>
', '-7.058304516874186', '-34.88433837890625', '1', 'T', '2016-11-17 16:52:41', '1', '2016-11-17 16:52:41', '1' ),
( '3', '1', 'Luxô', '<p><img alt="" id="aaa" src="http://imagem.band.com.br/f_265983.jpg" /></p>
', '-7.534977445430501', '-34.888973236083984', '2', 'T', '2016-11-17 16:54:03', '1', '2016-11-17 16:54:03', '1' ),
( '4', '1', 'Secô', '<p><img alt="" id="aaa" src="https://meusonhar.com.br/wp-content/uploads/2015/04/sonhar-com-seca.jpg" /></p>
', '-6.871892962887516', '-38.48785400390625', '3', 'T', '2016-11-17 16:56:34', '1', '2016-11-17 16:56:34', '1' ),
( '5', '2', 'Ponto 1', '<p>Teste</p>
', '-15.807107144974562', '-47.88064956665039', '0', 'T', '2016-11-17 18:35:32', '3', '2017-01-25 20:27:36', '4' ),
( '6', '3', 'desk ponto', '<p>oioioioioi</p>
', '-8.45353596136076', '-60.64453125', '0', 'T', '2016-11-17 19:07:54', '3', '2016-11-17 19:07:54', '3' ),
( '7', '4', 'teste ponto 1', '<p><img alt="" src=" http://extraordinaryintelligence.com/wp-content/uploads/2009/06/3085magicmushroomsworld.jpg" style="float:left; height:100px; margin-right:10px; width:100px" />Type the title here</p>

<p>&nbsp;</p>

<p>Type the text here</p>

<p>&nbsp;</p>

<p>asfdasdfasdf</p>

<p>teste alterando ponto</p>

<p>&nbsp;</p>

<div data-oembed-url="https://www.youtube.com/watch?v=3hEnbwxNrz0">
<div>
<div style="height:0px; left:0px; padding-bottom:56.2493%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="https://www.youtube.com/embed/3hEnbwxNrz0?wmode=transparent&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;enablejsapi=1" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>

<p>asdfadsfadf</p>

<p>&nbsp;</p>

<p>asdfadfadfadsfasdfadsfadfadfadfadf</p>

<p>&nbsp;</p>

<p>asdfasdf</p>

<p>&nbsp;</p>

<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/05fkTvgj-5c" width="560"></iframe></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', '-15.795557183093031', '-47.877559661865234', '0', 'T', '2016-11-19 14:51:41', '4', '2017-02-06 15:44:17', '4' ),
( '8', '4', 'teste ponto 2', '<p>Descri&ccedil;&atilde;o do teste ponto 2</p>
', '-15.798365211547859', '-47.88013458251953', '0', 'F', '2016-11-19 14:56:59', '4', '2017-04-05 17:49:01', '4' ),
( '9', '4', 'Ponto 3 teste', '<p>Descri&ccedil;&atilde;o do ponto 3</p>
', '-15.788619534134423', '-47.879791259765625', '1', 'F', '2016-11-19 16:17:42', '4', '2017-04-05 17:49:01', '4' ),
( '10', '5', 'Benedictus', '<p>Mais um dia que nasce</p>

<p>se imp&otilde;e no horizonte</p>

<p>Sorrio para o espelho</p>

<p>pelo simples prazer de me rever</p>

<p>&nbsp;</p>

<p>Nada me paga</p>

<p>a brisa fria da manh&atilde;,</p>

<p>o cheiro de caf&eacute; que se acomoda na sala,</p>

<p>a luz do sol que domina o quarto,</p>

<p>as flores que sorriem um novo dia,</p>

<p>&nbsp;</p>

<p>No caderno escrevo</p>

<p>novos poemas bioqu&iacute;micos</p>

<p>algoritmos que celebram</p>

<p>a intrincada arquitetura da vida</p>

<p>&nbsp;</p>

<p>Nada me paga</p>

<p>o sol que aquece minha pele aos poucos,</p>

<p>as pessoas que encontro pelo caminho,</p>

<p>o sorriso sincero de amigos,</p>

<p>os carros que passam na rua sem parar</p>

<p>&nbsp;</p>

<p>Num papel descrevo</p>

<p>a festa que se celebra em cada canto,</p>

<p>a vida que floresce nas cal&ccedil;adas,</p>

<p>o novo dia que j&aacute; come&ccedil;ou</p>
', '-15.770609789170615', '-47.87558555603027', '0', 'T', '2016-11-28 21:12:42', '5', '2016-11-28 21:12:42', '5' ),
( '11', '6', '', '<p>Mais um dia que nasce</p>

<p>se imp&otilde;e no horizonte</p>

<p>Sorrio para o espelho</p>

<p>pelo simples prazer de me rever</p>

<p>&nbsp;</p>

<p>Nada me paga</p>

<p>a brisa fria da manh&atilde;,</p>

<p>o cheiro de caf&eacute; que se acomoda na sala,</p>

<p>a luz do sol que domina o quarto,</p>

<p>as flores que sorriem um novo dia</p>
', '-15.771043438023511', '-47.87562847137451', '0', 'T', '2016-11-28 21:44:20', '5', '2017-02-05 13:29:38', '5' ),
( '12', '6', '', '<p>Nada me paga</p>

<p>o sol que aquece minha pele aos poucos,</p>

<p>as pessoas que encontro pelo caminho,</p>

<p>o sorriso sincero de amigos,</p>

<p>os carros que passam na rua sem parar</p>

<p>&nbsp;</p>

<p>Num papel descrevo</p>

<p>a festa que se celebra em cada canto,</p>

<p>a vida que floresce nas cal&ccedil;adas,</p>

<p>o novo dia que j&aacute; come&ccedil;ou</p>
', '-15.770155490023354', '-47.87161588668823', '1', 'T', '2016-11-28 21:53:41', '5', '2016-11-28 21:53:41', '5' ),
( '13', '6', '', '<p>A borboleta brota</p>

<p>Da pupa o ponto</p>

<p>&Eacute; sempre certo</p>

<p>&nbsp;</p>

<p>Nasce cresce renasce</p>

<p>Assim sempre de ser h&aacute;</p>

<p>&nbsp;</p>

<p>As flores brotam nesta esta&ccedil;&atilde;o</p>

<p>Depois murcham morrem</p>

<p>Tornam a renascer</p>

<p>A cada ciclo que passa</p>

<p>Sempre bonitas</p>

<p>Me tocam de novo</p>

<p>Como se fosse a primeira vez</p>

<p>&nbsp;</p>

<p>O sol sempre h&aacute; de nascer</p>

<p>Isso &eacute; o que me conforta</p>

<p>&nbsp;</p>

<p>Seu calor banha de luz todas as coisas</p>

<p>Reflete das flores a cor</p>

<p>Que n&atilde;o guardam para si</p>

<p>&nbsp;</p>

<p>Vejo no passeio as flores</p>

<p>Desabrocharem em cores vivas</p>

<p>Amarelas r&oacute;seas azuis</p>

<p>Formam s&iacute;ncopes rente ao gramado</p>
', '-15.769277863181207', '-47.86941647529602', '2', 'T', '2016-11-28 21:56:51', '5', '2016-11-28 21:56:51', '5' ),
( '14', '6', '', '<p>Perd&atilde;o pois pequei</p>

<p>no s&eacute;timo mandamento</p>

<p>Vidas s&atilde;o como flores</p>

<p>secando ao vento</p>

<p>brotam florescem desabrocham</p>

<p>depois murcham e secam</p>

<p>e morrem</p>

<p>e s&atilde;o levadas como p&oacute;</p>

<p>&nbsp;</p>

<p>Para onde v&atilde;o as almas dos que morrem de sede?</p>

<p>Se ao menos Baleia pudesse me contar</p>

<p>ou a flor do cerrado pudesse expressar</p>

<p>Talvez a gente s&oacute; continue fazendo o que fazer</p>

<p>a cadela ca&ccedil;ando pacas,</p>

<p>a jabuticabeira dando frutos</p>

<p>e eu regando plantas mortas</p>

<p>at&eacute; descobrir o fim</p>

<p>&nbsp;</p>

<p>Que ser&aacute; das vidas que j&aacute; n&atilde;o s&atilde;o?</p>

<p>Haver&aacute; no outro mundo perd&atilde;o?</p>

<p>Aos que negam aos viventes</p>

<p>&aacute;gua, luz e nitratos</p>

<p>Seria a morte um contrato?</p>

<p>E aqueles que matam regar&atilde;o a culpa</p>

<p>e os que morrem voltar&atilde;o como mudas</p>

<p>e jabuticabeiras ser&atilde;o jasmins</p>

<p>pra nos contar que a vida sempre tem um fim?</p>
', '-15.766167677980619', '-47.87057787179947', '3', 'T', '2016-11-28 22:14:25', '5', '2016-11-28 22:14:25', '5' ),
( '15', '6', '', '<p>E as mudas que plantei</p>

<p>est&atilde;o grandes</p>

<p>est&atilde;o s&aacute;bias, maduras</p>

<p>como testemunhas de tudo que aqui j&aacute; passou</p>

<p>&nbsp;</p>

<p>Olha as flores novas</p>

<p>Coloridas</p>

<p>Onde mariposas v&ecirc;m repousar</p>

<p>Logo as mariposas j&aacute; n&atilde;o ser&atilde;o</p>

<p>E nem as flores</p>

<p>Mas haver&atilde;o sempre ninfas pupas</p>

<p>E o ciclo se refaz</p>
', '-15.765929251548858', '-47.87068247795105', '4', 'T', '2016-11-28 22:16:14', '5', '2016-11-28 22:16:14', '5' ),
( '16', '6', '', '<p>Olha aquele gramado onde eu costumava me sentar</p>

<p>Lendo poemas, olhando o sol</p>

<p>Observando as formigas</p>

<p>Elas nunca param</p>

<p>Sempre est&atilde;o indo a algum lugar</p>

<p>E mesmo quando se perdem do grupo</p>

<p>Continuam andando</p>
', '-15.761876564437722', '-47.86751210689545', '5', 'T', '2016-11-28 22:22:20', '5', '2016-11-28 22:22:20', '5' ),
( '17', '6', '', '<p>J&aacute; passei aqui tantas vezes</p>

<p>E hoje vi</p>

<p>Apararam a grama</p>

<p>Olha como ficou bonito</p>

<p>E plantaram &aacute;rvores novas</p>

<p>Tudo se renova</p>

<p>&nbsp;</p>

<p>Apararam a grama e agora posso me sentar l&aacute; de novo</p>

<p>Nas manh&atilde;s de sol</p>

<p>Sentir a grama</p>

<p>E as formigas andando pelo meu corpo</p>

<p>Me perder no tempo</p>
', '-15.7622567117958', '-47.86795735359192', '6', 'T', '2016-11-28 22:24:03', '5', '2016-11-28 22:24:03', '5' ),
( '18', '6', '', '<p>Sentada na grama</p>

<p>as formigas caminham sobre seu corpo</p>

<p>passam despecebidas</p>

<p>invis&iacute;veis</p>

<p>Uma formiga desprevenida</p>

<p>caminha sobre a imensid&atilde;o branca</p>

<p>do seu decote</p>

<p>e lhe morde o seio</p>

<p>&nbsp;</p>

<p>esse fato insignificante</p>

<p>sem nenhum prop&oacute;sito aparente</p>

<p>lhe acorda de suas medita&ccedil;&otilde;es</p>

<p>e agora se torna vis&iacute;vel</p>

<p>aquele pequeno inseto</p>

<p>contrasta sobre o piso berrante</p>

<p>e um pequeno ponto</p>

<p>lhe desperta uma dor aguda</p>

<p>que s&oacute; parece crescer</p>

<p>&nbsp;</p>

<p>Agora s&atilde;o s&oacute; voc&ecirc;s dois</p>

<p>voc&ecirc; e a formiga</p>

<p>todas as outras desapareceram</p>

<p>ela permanece presente junto ao seu cora&ccedil;&atilde;o</p>

<p>e agora n&atilde;o &eacute; s&oacute; mais uma</p>
', '-15.761494523517474', '-47.869775891304016', '7', 'T', '2016-11-28 22:29:24', '5', '2016-11-28 22:29:24', '5' ),
( '19', '6', '', '<p>outra seca vem</p>

<p>mandacarus sob o sol</p>

<p>nada no c&eacute;u</p>
', '-15.768183405249959', '-47.87419080734253', '8', 'T', '2016-11-28 23:14:38', '5', '2016-11-28 23:14:38', '5' ),
( '20', '6', '', '<p><strong>A sinfonia das coisas pequeninas</strong></p>

<p>&nbsp;</p>

<p><em>Benedictus</em></p>

<p>&nbsp;</p>

<p>M</p>

<p>ais um dia que nasce</p>

<p>se imp&otilde;e no horizonte</p>

<p>Sorrio para o espelho</p>

<p>pelo simples prazer de me rever</p>

<p>&nbsp;</p>

<p>Nada me paga</p>

<p>a brisa fria da manh&atilde;,</p>

<p>o cheiro de caf&eacute; que se acomoda na sala,</p>

<p>a luz do sol que domina o quarto,</p>

<p>as flores que sorriem um novo dia,</p>

<p>&nbsp;</p>

<p>No caderno escrevo</p>

<p>novos poemas bioqu&iacute;micos</p>

<p>algoritmos que celebram</p>

<p>a intrincada arquitetura da vida</p>

<p>&nbsp;</p>

<p>Nada me paga</p>

<p>o sol que aquece minha pele aos poucos,</p>

<p>as pessoas que encontro pelo caminho,</p>

<p>o sorriso sincero de amigos,</p>

<p>os carros que passam na rua sem parar</p>

<p>&nbsp;</p>

<p>Num papel descrevo</p>

<p>a festa que se celebra em cada canto,</p>

<p>a vida que floresce nas cal&ccedil;adas,</p>

<p>o novo dia que j&aacute; come&ccedil;ou</p>

<p>&nbsp;</p>

<p><em>Magnificat</em></p>

<p>&nbsp;</p>

<p>A borboleta brota</p>

<p>Da pupa o ponto</p>

<p>&Eacute; sempre certo</p>

<p>&nbsp;</p>

<p>Nasce cresce renasce</p>

<p>Assim sempre de ser h&aacute;</p>

<p>&nbsp;</p>

<p>As flores brotam nesta esta&ccedil;&atilde;o</p>

<p>Depois murcham morrem</p>

<p>Tornam a renascer</p>

<p>A cada ciclo que passa</p>

<p>Sempre bonitas</p>

<p>Me tocam de novo</p>

<p>Como se fosse a primeira vez</p>

<p>&nbsp;</p>

<p>O sol sempre h&aacute; de nascer</p>

<p>Isso &eacute; o que me conforta</p>

<p>&nbsp;</p>

<p>Seu calor banha de luz todas as coisas</p>

<p>Reflete das flores a cor</p>

<p>Que n&atilde;o guardam para si</p>

<p>&nbsp;</p>

<p>Vejo no passeio as flores</p>

<p>Desabrocharem em cores vivas</p>

<p>Amarelas r&oacute;seas azuis</p>

<p>Formam s&iacute;ncopes rente ao gramado</p>

<p>&nbsp;</p>

<p>J&aacute; passei aqui tantas vezes</p>

<p>E hoje vi</p>

<p>Apararam a grama</p>

<p>Olha como ficou bonito</p>

<p>E plantaram &aacute;rvores novas</p>

<p>Tudo se renova</p>

<p>&nbsp;</p>

<p>Aquelas mudas de ip&ecirc; que plantei</p>

<p>Todas destru&iacute;das lixeiras</p>

<p>Mas plantaram outras no lugar</p>

<p>Olha como est&atilde;o crescidas!</p>

<p>E floridas!</p>

<p>&nbsp;</p>

<p>E as mudas que plantei</p>

<p>est&atilde;o grandes</p>

<p>est&atilde;o s&aacute;bias, maduras</p>

<p>como testemunhas de tudo que aqui j&aacute; passou</p>

<p>&nbsp;</p>

<p>Olha as flores novas</p>

<p>Coloridas</p>

<p>Onde mariposas v&ecirc;m repousar</p>

<p>Logo as mariposas j&aacute; n&atilde;o ser&atilde;o</p>

<p>E nem as flores</p>

<p>Mas haver&atilde;o sempre ninfas pupas</p>

<p>E o ciclo se refaz</p>

<p>&nbsp;</p>

<p>Olha aquele gramado onde eu costumava me sentar</p>

<p>Lendo poemas, olhando o sol</p>

<p>Observando as formigas</p>

<p>Elas nunca param</p>

<p>Sempre est&atilde;o indo a algum lugar</p>

<p>E mesmo quando se perdem do grupo</p>

<p>Continuam andando</p>

<p>&nbsp;</p>

<p>Apararam a grama e agora posso me sentar l&aacute; de novo</p>

<p>Nas manh&atilde;s de sol</p>

<p>Sentir a grama</p>

<p>E as formigas andando pelo meu corpo</p>

<p>Me perder no tempo</p>

<p>&nbsp;</p>

<p>O astro-rei se esconde mais uma vez no horizonte</p>

<p>S&oacute; me conforta a certeza de que ele vai voltar</p>

<p>At&eacute; logo, velho amigo!</p>
', '-15.770575544988867', '-47.875328063964844', '9', 'T', '2016-11-28 23:23:55', '5', '2016-11-28 23:23:55', '5' ),
( '21', '7', 'Igrejinha', '<p style="text-align:center">&nbsp;</p>

<p style="text-align:center"><em><strong>azulejo azul</strong></em></p>

<p style="text-align:center"><em>marinho<br />
tenho<br />
alma de<br />
passarinho<br />
que no azulejo<br />
azul marinho<br />
bateu athos<br />
e voou</em></p>

<p style="text-align:center">&nbsp;</p>

<p style="text-align:right">Marina Mara</p>

<p>&nbsp;</p>

<p><img alt="" src="http://silvanabertolucci.com.br/wp-content/uploads/2014/04/Igrejinha-01.jpg" style="float:right" /><strong>Dicas para turistas:</strong></p>

<p>&nbsp;</p>

<p>A Igreja Nossa Senhora de F&aacute;tima foi o primeiro templo em alvenaria a ser erguido em Bras&iacute;lia.</p>

<p>Seguindo a tradi&ccedil;&atilde;o cat&oacute;lica, o povoamento da nova cidade come&ccedil;ou em torno dessa Igreja, inaugurada em 28 de junho de 1958.</p>

<p>A capela foi projetada por Oscar Niemeyer e sua arquitetura faz refer&ecirc;ncia a um chap&eacute;u de freiras. Em seu interior e na fachada encontram-se azulejos de Athos Bulc&atilde;o.</p>

<p>&nbsp;</p>

<p>Al&eacute;m da vista&ccedil;&atilde;o durante o dia, a grande atra&ccedil;&atilde;o nesse ponto &eacute; o cachorro quente, todas as noites, em frente &agrave; Igrejinha.</p>

<p>As missas ocorrem todos os dias &agrave;s 18:30 e tamb&eacute;m nos domingos &agrave;s 8:00 e &agrave;s 10:00.</p>
', '-15.8141802914228', '-47.903544902801514', '0', 'T', '2016-11-29 21:00:11', '5', '2017-01-24 12:17:10', '5' ),
( '22', '4', 'Psy Alice Cat', '<p><a href="http://38.media.tumblr.com/tumblr_lxdt1rMfF31qkayzlo1_500.gif"><img alt="" src="http://38.media.tumblr.com/tumblr_lxdt1rMfF31qkayzlo1_500.gif" style="height:355px; width:500px" /></a></p>

<p>Testando&nbsp;a adi&ccedil;&atilde;o de imagens,&nbsp;</p>
', '-15.760205732592766', '-47.87120819091797', '1', 'T', '2016-11-30 13:04:59', '4', '2017-04-05 17:49:01', '4' ),
( '23', '8', 'Não Me Representa', '<p>&nbsp;</p>

<p>Conhecer o advers&aacute;rio, reconhecer seu opressor, denunciar a canalhice absurda que este elemento promove diante da injusti&ccedil;a e impunidade, combater o conservadorismo atroz alimentado por fundamentalismos e sede de poder, entender quem n&atilde;o&nbsp;nos representa para assim fustig&aacute;-los sem d&oacute;. Sem a mesma d&oacute; com que todos/as os/as nossas/os s&atilde;o oprimidas/os h&aacute;, pelo menos, cinco s&eacute;culos neste continente latino. Pois &ldquo;Quero mais democracia, horror &agrave;s oligarquias, elas n&atilde;o nos representam!&rdquo;. #FascistasN&atilde;oPassar&atilde;o #ForadaOrdem</p>

<div data-oembed-url="https://youtu.be/n_Bv0wtGBCs">
<div style="max-width:320px"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->
<div>
<div style="height:0px; left:0px; padding-bottom:56.2493%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="https://www.youtube.com/embed/n_Bv0wtGBCs?wmode=transparent&amp;rel=0&amp;autohide=1&amp;showinfo=0&amp;enablejsapi=1" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>
</div>

<p>&nbsp;</p>
', '-15.799581495443293', '-47.86419153213501', '0', 'T', '2016-12-12 21:28:35', '6', '2017-02-12 23:21:51', '6' ),
( '24', '8', 'Proesias In Concert - Onde tudo começou', '<p>&nbsp;</p>

<p>Emancipar seres pela for&ccedil;a da palavra, pelo amor e generosidade de quem l&ecirc; para os&nbsp;outros e outras suas intimidades, nos m&aacute;gicos saraus da vida. Em meio ao tilintar de copos de cerveja, gargalhadas fartas dessa gente desabusada que frui a boemia das perifas nossas, onde a palavra&nbsp;se transforma&nbsp;na mais temida arma pelo sistema que nos sacaneia secularmente. Reuni&atilde;o dos m&aacute;rtires, a&ccedil;&atilde;o gri&ocirc;, sem meio termo!</p>

<p><img alt="" src="http://i32.photobucket.com/albums/d33/joaovictorpacifico/radicaisoficial_zpsjeah5cnl.png" style="height:571px; width:444px" /></p>

<p>A inspira&ccedil;&atilde;o vem do Sarau Radical, escola de onde partimos Fora da Ordem desde 2003 construindo uma cena forte e pujante como at&eacute; hoje os/as poetas da comunidade de S&atilde;o Sebasti&atilde;o ocupam a cidade e promovem nossa constru&ccedil;&atilde;o e consci&ecirc;ncia de n&oacute;s mesmas, nossas&nbsp; for&ccedil;as e origens, nossa autocr&iacute;tica e nega&ccedil;&atilde;o, enfim, a multiplica&ccedil;&atilde;o da capacidade r&iacute;mica de cada ser, como a um Buda que ilumina outrem demonstrando que tamb&eacute;m nele e nela est&aacute; a condi&ccedil;&atilde;o para a ilumina&ccedil;&atilde;o, por meio da euto-representa&ccedil;&atilde;o, de falar de nossa hist&oacute;ria, nossa mem&oacute;ria, nossas conquistas e, porque n&atilde;o, nossas eternas alegrias de viver a Quebrada nossa! A Arte como caminho, seguindo sempre radicais e livres.</p>

<p>Proesias In concert</p>

<p>Sarau &eacute; verso, &eacute; encanto<br />
Aula de sabor espanto<br />
Rara luz, emancipando<br />
Alta corte de favelas<br />
Unida ao n&oacute;, mas desatando<br />
&nbsp;</p>

<p>Sarau &eacute; estrondo, trovejando<br />
Argumento explosivo, livre girando<br />
Rasgado em versos, recitando<br />
Aula de esperan&ccedil;a, acalanto<br />
Ungida pelos mestres deste canto<br />
&nbsp;</p>

<p>Sarau &eacute; reuni&atilde;o das m&aacute;rtires<br />
Assembleia Anti-tiranos<br />
Resist&ecirc;ncia em profus&atilde;o<br />
Armada de desenganos<br />
Umoja para meus manos<br />
&nbsp;</p>

<p>Sarau &eacute; luz e som<br />
Agita&ccedil;&atilde;o de insanos<br />
Regime sustenido ao extremo<br />
A&ccedil;&atilde;o Gri&ocirc;, sem meio termo<br />
Ocupa&ccedil;&atilde;o de verso e prosa, e pronto!</p>

<p>&nbsp;</p>
', '-15.905923343056486', '-47.77226150035858', '1', 'T', '2016-12-12 21:48:19', '6', '2017-03-19 18:49:59', '5' ),
( '25', '8', 'Quebrada Nossa', '<p>​</p>

<div>Conhecer as manhas e as manh&atilde;s dessa cidade n&atilde;o tem pre&ccedil;o... manjar cada esquina, saber o melhor lugar pra ver o p&ocirc;r do sol e o nascer da lua cheia num morro com 180 graus de vis&atilde;o sob o raro c&eacute;u do Cerrado e suas mil milh&otilde;es de estrelas, dar role na Gameleira e olaria, o downhill pros carrinho loco e as agruras do sistema carcer&aacute;rio que aqui aflige m&atilde;es e filhos da quebrada nossa. Reconhecer minha comunidade e suas belezas, beber dessa &aacute;gua e daqui fugir &eacute; dif&iacute;cil meu amigo.&nbsp; Se liga na rima que aqui &eacute; #S&atilde;oSebasQuebradaDeRocha .</div>

<div>&nbsp;</div>

<div><img alt="" src="http://i32.photobucket.com/albums/d33/joaovictorpacifico/32121847313_07514d47a4_o_zps9ziybfy5.jpg" style="height:538px; width:960px" /></div>

<div>&nbsp;</div>

<div>
<div data-oembed-url="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099726159381/?type=3&amp;theater">
<div id="fb-root">&nbsp;</div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
  fjs.parentNode.insertBefore(js, fjs);
}(document, \'script\', \'facebook-jssdk\'));</script>

<div class="fb-post" data-href="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099726159381/?type=3&amp;theater" data-width="550">
<blockquote cite="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099726159381/?type=3" class="fb-xfbml-parse-ignore">
<p>Foto: Elton Skartazini, reportagem sorbe o livro Fora da Ordem</p>
Posted by <a href="https://www.facebook.com/PoetaViniciusBorba/">Vinicius Borba</a> on&nbsp;<a href="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099726159381/?type=3">15hb Februari 2017</a></blockquote>
</div>
</div>

<p>&nbsp;</p>
</div>

<div>&nbsp;</div>

<div>Das tuas olarias milhares de tijolos para a constru&ccedil;&atilde;o de Bras&iacute;lia. Da tua antiga fazenda Papuda a negritude escravizada que foram sustento do poder colonial, e seus descentes que hoje ainda s&atilde;o quem mais morre pelas guerras de gangues, aprisionadas por ironia numa senzala piorada, uma masmorra tenebrosa conhecida pleo mesmo nome da antiga fazenda. Essa fonte de contradi&ccedil;&atilde;o &eacute; a Quebrada Nossa, mas &eacute; tamb&eacute;m lugar de belezas mil e gente forte, politizada, aguerrida, filhotes do esp&iacute;rito de luta do mineiro Ti&atilde;o Areia que resistiu a retirada dos oper&aacute;rios e antigos oleiros da Agrovila, quando coron&eacute;is propuseram a inunda&ccedil;&atilde;o para composi&ccedil;&atilde;o do Lago Parano&aacute;. Os &quot;Areias&quot; desta Terra seguem na resist&ecirc;ncia de Ti&atilde;o, n&atilde;o mais pela perman&ecirc;ncia da cidade, mas pela dignidade da vida e nossos direitos. Nossa cultura e arte vivas em cada esquina, cada sarau (ao menos quatro coletivos realizam saraus na cidade) al&eacute;m da nossa natureza festeira, do pouso de folia ao forr&oacute; arrochado. Pra quem sabe chegar, ligan&oacute;is, respeita as cara e &eacute; s&oacute; colar. #S&atilde;oSebasQuebradaDeRocha</div>

<div>&nbsp;</div>

<div><img alt="Óleo sobre tela e tecido. Carlione Ramos." src="http://i32.photobucket.com/albums/d33/joaovictorpacifico/32121846723_5e1eb690ab_o_zps4zjsr3np.jpg?t=1489874106" style="float:right; height:652px; width:661px" /></div>

<div>&nbsp;</div>

<div><strong>S&atilde;o Sebas, Quebrada Nossa</strong></div>

<div>Por Vinicius Borba</div>

<div>​</div>

<div>Agrovila quebrada nossa,<br />
Trajet&oacute;ria<br />
Nossa hist&oacute;ria rima em versos<br />
Resist&ecirc;ncia, tuas ruas<br />
Tuas noites de sarau</div>

<div>​<br />
Lua ao alto deste morro<br />
Gameleira e Olaria<br />
E eu subia, eu subia<br />
Parecia que era o c&eacute;u<br />
Era c&oacute;rgo, bosque, mata<br />
Era um povo lutador<br />
Quebrada nossa, trajet&oacute;ria<br />
Sempre mais com muito amor</div>

<div>&nbsp;</div>

<div>E a dor das juventudes<br />
Transviadas n&rsquo;agress&atilde;o<br />
Muitas mortes e atitudes,&nbsp;<br />
Geram ciclos de horror<br />
M&atilde;es de L&aacute;grimas<br />
Desgra&ccedil;as<br />
Nas delegas corredor</div>

<div>&nbsp;</div>

<div>Essa quebra que resiste,<br />
Esse povo lutador,<br />
Que lutou independ&ecirc;ncia<br />
Que constr&oacute;i a capital<br />
Dos Areias desta terra<br />
Barro, argila, fundador<br />
De tijolo, suor e vida<br />
S&atilde;o Sebas nossa querida<br />
Quebrada de sonhador</div>

<p>​</p>

<p>​</p>
', '-15.897966262483445', '-47.767864018678665', '2', 'T', '2016-12-15 21:33:25', '6', '2017-03-19 19:01:21', '5' ),
( '26', '8', 'Pois sou poeta!', '<div data-oembed-url="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099656159388/?type=3&amp;theater">
<div id="fb-root">&nbsp;</div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
  fjs.parentNode.insertBefore(js, fjs);
}(document, \'script\', \'facebook-jssdk\'));</script>

<div class="fb-post" data-href="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099656159388/?type=3&amp;theater" data-width="550">
<blockquote cite="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099656159388/?type=3" class="fb-xfbml-parse-ignore">
<p>Lend&aacute;rio Calend&aacute;rio Maia</p>
Posted by <a href="https://www.facebook.com/PoetaViniciusBorba/">Vinicius Borba</a> on&nbsp;<a href="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099656159388/?type=3">15hb Februari 2017</a></blockquote>
</div>
</div>

<p>&nbsp;O mundo treme sob as paran&oacute;ias apocal&iacute;pticas h&aacute; muitos s&eacute;culos. Relatos do fim do mundo e sua destrui&ccedil;&atilde;o s&atilde;o previstos h&aacute; uma data. Mas a associa&ccedil;&atilde;o das<strong><a href="https://www.youtube.com/watch?v=F0tKuqyBkYg&amp;list=PLlfydQAvN0kxZ6Y_HhbFKMSExvRnoLiZm"> Sete Profecias Maias</a></strong>, em plena execu&ccedil;&atilde;o desde o ano de 2012 e antes, nesta fase por eles indicada como per&iacute;odo de transi&ccedil;&atilde;o entre Eras, levou muita gente a acreditar que tudo estaria no fim para aquele ano. A sabedoria e acertividade do calend&aacute;rio do tradicional e misterioso povo ind&iacute;gena pr&eacute;-colombiano p&ocirc;s muita gente de orelhas em p&eacute;. Desde 2000 malucos rumaram inclusive em dire&ccedil;&atilde;o &agrave; Chapada dos Veadeiros na expectativa deste fim, e tant@s outr@s quase piraram em suas igrejas, tamb&eacute;m em grande parte fundadas no medo alheio para manter seus projetos de poder da teologia da prosperidade que lucra diariamente mais com o falso-moralismo e o sensacionalismo midi&aacute;tico nessa constru&ccedil;&atilde;o de fim de mundo. Ironizando essas e outras facetas dessa fita, Borba prop&otilde;e uma c&ocirc;mica rela&ccedil;&atilde;o sobre seu momento paterno (com a primeira beb&ecirc; justamente em 2011) e sua conclus&atilde;o convicta sobre qual deve ser nossa postura diante do fim do mundo, &ldquo;Pois sou poeta rapaz!&rdquo;, e assim como tod@s somos que possamos superar obst&aacute;culos e construir esse mundo cada dia melhor, esteja acabando ou n&atilde;o!</p>

<p><strong>Pois sou poeta</strong></p>

<p>Pois sou poeta rapaz,<br />
Nunca que ningu&eacute;m lhe disse?<br />
Poeta de rua, poeta da noite,<br />
Da favela, da taverna<br />
contra o a&ccedil;oite, de tantos outros como eu</p>

<p>E em tempos de fim de mundo<br />
Apocalipses pr&eacute;-colombianos<br />
Antes de entrar em paranoias<br />
Fiz foi trazer duas joias<br />
Pra poder logo com tudo</p>

<p>Trouxe foi duas meninas ao mundo<br />
Enquanto covardes diziam:<br />
-- Olha a crise! Olha a bolsa?!<br />
L&aacute; estava eu fazendo menino, sem medo da calv&iacute;cie<br />
Pois sou poeta rapaz, nunca que ningu&eacute;m lhe disse?</p>

<p>Que se tem coisa melhor<br />
Que trazer menino ao mundo<br />
Nunca que vi, nem to pra essas mesmices</p>

<p>E trouxe logo foi duas gatinhas,<br />
Que foi pra passar a r&eacute;gua<br />
Manu e Milena, meus dois melhores poemas</p>

<p>Se algo de fato me assusta? Para com o futuro de minhas crias??<br />
Hum, vejamos...<br />
Pode a b&iacute;blia estar certa...?<br />
N&atilde;o!<br />
Podem os Maias estar certos??<br />
N&atilde;o, n&atilde;o, n&atilde;o.<br />
Pode o InriCristo estar certo?<br />
N&atilde;&atilde;&atilde;&atilde;oooo!</p>

<p>Tudo que sei &eacute; que,<br />
Se tenho algum medo por minhas crias<br />
Por minha prole querida<br />
&Eacute; que o mundo n&atilde;o mude<br />
&Eacute; que jornalistas n&atilde;o furem seus chefes e edi&ccedil;&otilde;es<br />
Que professores n&atilde;o amem suas profiss&otilde;es<br />
Que n&oacute;s da favela nos matemos,&nbsp;<br />
antes de enfrentar os patr&otilde;es</p>

<p>Que cada poeta em seus cora&ccedil;&otilde;es<br />
Se neguem a gritar seus versos<br />
Se neguem a riscar verdades cruas<br />
Que junto ao povo n&atilde;o invadam as ruas<br />
E tomem a unha o que lhe &eacute; de Direito<br />
Por que liberdade conquistada<br />
&Eacute; o &uacute;nico caminho<br />
Pra quem tem esp&iacute;rito de luta<br />
E se com papel e pena<br />
Fazemos nossa labuta<br />
Ent&atilde;o que se grite<br />
E pras novas gera&ccedil;&otilde;es registre e ensine<br />
O peso de nosso fardo, miss&atilde;o, sacerd&oacute;cio, calv&iacute;cie<br />
Pois sou poeta rapaz! Nunca que ningu&eacute;m lhe disse.</p>

<p><strong><a href="https://www.facebook.com/PoetaViniciusBorba/?fref=ts">Vinicius Borba</a></strong></p>

<p>&nbsp;</p>
', '-15.78484605538637', '-47.91146278381348', '3', 'T', '2016-12-15 21:49:03', '6', '2017-03-21 13:04:11', '5' ),
( '27', '8', 'Grito Latino', '<p>&nbsp;</p>

<p><strong>Grito Latino</strong></p>

<p>Vinicius Borba, <a href="https://issuu.com/viniciusborba0/docs/fora_da_ordem_hiper_poemas_de_vinic">do livro Fora da Ordem</a></p>

<div>
<div data-oembed-url="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099592826061/?type=3&amp;theater">
<div id="fb-root">&nbsp;</div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
  fjs.parentNode.insertBefore(js, fjs);
}(document, \'script\', \'facebook-jssdk\'));</script>

<div class="fb-post" data-href="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099592826061/?type=3&amp;theater" data-width="550">
<blockquote cite="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099592826061/?type=3" class="fb-xfbml-parse-ignore">
<p>Pintura quase rupestre.. Marco Antonio del Chile, no Canto da Coruja, S&atilde;o Jorge, S&atilde;oJorge Chapada Dos Veadeiros</p>
Опубліковано <a href="https://www.facebook.com/PoetaViniciusBorba/">Vinicius Borba</a>&nbsp;<a href="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099592826061/?type=3">15 лютого 2017 р.</a></blockquote>
</div>
</div>

<p>&nbsp;</p>
</div>

<div><img alt="Inspiração da arte Inca, pelas mãos del maestro de artesanias Marco Antonio, del Chile, no Canto da Coruja, coração da Chapada dos Veadeiros, vilarejo de São Jorge" src="https://www.facebook.com/PoetaViniciusBorba/photos/a.973099539492733.1073741843.720552114747478/973099592826061/?type=3&amp;theater" style="float:right" /></div>

<div>&nbsp;</div>

<div>
<div>Eu ou&ccedil;o um grito<br />
Um grito seco<br />
N&atilde;o &eacute; gemido<br />
&Eacute; desespero</div>

<div>&nbsp;</div>

<div>Eu ou&ccedil;o um grito<br />
Um desapego<br />
Reivindico<br />
N&atilde;o pe&ccedil;o arrego</div>

<div>&nbsp;</div>

<div>O que exijo<br />
Por desemprego<br />
Menos delito<br />
Algum lampejo</div>

<div>&nbsp;</div>

<div>N&atilde;o seja a bala<br />
Que quando estala<br />
&Eacute; a esperan&ccedil;a<br />
Que aqui nos cala</div>

<div>&nbsp;</div>

<div>Em cada auto<br />
De resist&ecirc;ncia<br />
S&atilde;o mais dois gritos<br />
De indec&ecirc;ncia</div>

<div>&nbsp;</div>

<div>Rajadas secas<br />
De madrugada<br />
Conhe&ccedil;o bem<br />
Essa pegada</div>

<div>&nbsp;</div>

<div>A quem resiste<br />
Enfrenta a morte<br />
Pe&ccedil;o que grite<br />
Que seja forte</div>

<div>&nbsp;</div>

<div>Vem logo atr&aacute;s<br />
A outra marcha<br />
Vem com escolta<br />
N&atilde;o t&aacute; com nada</div>

<div>&nbsp;</div>

<div>Segue incluida<br />
E grita forte<br />
&Eacute; a guarimba<br />
Quer nossa morte</div>

<div>&nbsp;</div>

<div>Essa outra marcha<br />
Que grita &oacute;dio<br />
Quer mais Maiami<br />
Exige o &oacute;cio</div>

<div>&nbsp;</div>

<div>Seu privil&eacute;gio<br />
Mant&eacute;m minha morte<br />
O seu poder<br />
&Eacute; meu a&ccedil;oite</div>

<div>&nbsp;</div>

<div>Abra o ouvido<br />
Entenda o mote<br />
Marchando grito<br />
Sul &eacute; meu norte</div>

<div>&nbsp;</div>

<div>Marchando eu grito<br />
E grito forte<br />
Norte &eacute; o Sul<br />
Sul &eacute; meu norte</div>

<div>​</div>

<div>La negra nos cuenta quienes somos!</div>

<div>https://www.youtube.com/watch?v=yJAOZ4bPGMA</div>
</div>
', '-15.79726833006665', '-47.88870558142662', '4', 'T', '2016-12-18 13:21:42', '6', '2017-02-15 18:55:45', '6' ),
( '28', '8', 'Tempos de ódio', '<p>Em tempos de intoler&acirc;ncia crescente e polariza&ccedil;&atilde;o pol&iacute;tica por disputas de hegemonia com os mesmos tra&ccedil;os de guerra fria, esquentando a cada dia, nosso povo inicia um processo terr&iacute;vel, aproveitando o aquecimento para chocar ovos da serpente do fascismo, como no ataque recente da Universidade de Bras&iacute;lia, por parte de fascistas com bombas e viol&ecirc;ncia contra estudantes desarmados. Isso alimentado pela omiss&atilde;o da reitoria que, ao se omitir, bem como da omiss&atilde;o da Pol&iacute;cia Civil e do Governo do Distrito Federal na &eacute;poca alimentou tal grau de viol&ecirc;ncia e extremismo no templo do conhecimento, no Campus que leva o nome de Darcy Ribeiro. Esse tipo de viol&ecirc;ncia, como aponta o poema Tempos de &oacute;dio, &ldquo;Cria monstros, sataniza, e iludindo que higieniza... A nazi-pocresia ressucita&rdquo;.</p>

<p>V&iacute;deo:&nbsp;&nbsp;Ataque&nbsp;fascista na Universidade de Bras&iacute;lia, 2016: M&iacute;dia Ninja</p>

<p><a href="https://www.youtube.com/watch?v=WsxPN-_6fds" target="_blank">https://www.youtube.com/watch?v=WsxPN-_6fds</a></p>

<div><strong>Tempos de &oacute;dio</strong><br />
Por Vinicius Borba</div>

<div><img alt="Nankin sobre papel: Carlione Ramos" src="https://photos.google.com/photo/AF1QipO43wxJn9Gavhz7oJ1cXg7E4jzQVZAwosuzoeeg" style="float:right; height:800px; width:400px" /></div>

<div>Em sua insustent&aacute;vel leveza<br />
Seres seguem fazendo estragos<br />
E demonstrando sua fraqueza<br />
Respeito a vida segue escasso</div>

<div>&nbsp;</div>

<div>Eu vejo este ciclo h&aacute; s&eacute;culos<br />
Ainda assusto com as trag&eacute;dias<br />
E alguns est&uacute;pidos fl&aacute;cidos<br />
Tentam convencer de suas com&eacute;dias</div>

<div>&nbsp;</div>

<div>Vomitam feras de assass&iacute;nio<br />
Ideias fontes de exterm&iacute;nio<br />
Justificam o imposs&iacute;vel<br />
Com seus pobres racioc&iacute;nios</div>

<div>&nbsp;</div>

<div>Hoje erguem moralistas<br />
Al&ccedil;am v&ocirc;o alguns nazi<br />
Mentirosos um tanto loquazes<br />
Embebedam multid&otilde;es, nojentos vorazes</div>

<div>&nbsp;</div>

<div>Lembram daquela Matrix?<br />
Que parecem esquecer,<br />
ou se negam a saber?<br />
Mister Smith quer poder!</div>

<div>&nbsp;</div>

<div>Se seguir essa batida<br />
Assim ser&aacute; e vai feder<br />
S&oacute; para alguns, N&atilde;o se iluda<br />
N&atilde;o vai ter pra onde correr<br />
&nbsp;</div>

<div>Pobre, negro, gay ou puta<br />
Com defici&ecirc;ncia, afrodescend&ecirc;ncia<br />
De Religi&atilde;o africana, ou fumante da erva bruta,<br />
Militante de esquerda ou progressista de luta</div>

<div>&nbsp;</div>

<div>A ilus&atilde;o moralista<br />
Na verdade n&atilde;o limpa<br />
De sangue lambuza, traumatiza<br />
Cria monstros, sataniza<br />
E iludindo que higieniza<br />
A nazi-pocrisia ressucita</div>
', '-15.762521188167141', '-47.87015810608864', '5', 'T', '2016-12-18 13:43:39', '6', '2016-12-18 13:43:39', '6' ),
( '29', '8', 'Com a força de pioneiro', '<p>Algumas cidades do DF s&atilde;o pr&oacute;digas na participa&ccedil;&atilde;o dessa primeira gera&ccedil;&atilde;o, nossos e nossas famosas&nbsp;pioneiras, homens e mulheres que, na juventude, constru&iacute;ram&nbsp;essa cidade, candangas e candangos que hoje ainda nos orgulham por sua for&ccedil;a e abnega&ccedil;&atilde;o na constru&ccedil;&atilde;o da capital federal, a cidade monumento Bras&iacute;lia, o sonho de Dom Bosco. Tamb&eacute;m com muito amor, poetas, atrizes, m&uacute;sicos, arteiras visuais e tantas outras figuras da cena cultural s&atilde;o nossas pineiras Cult, que seguem edificando a identidade desse lugar, discutindo, criticando e refazendo nossa cara. Esse poema &eacute; mais uma ode&nbsp;a essa gente, mais uma homenagem como a que Juscelino edificou em plena Pra&ccedil;a dos Tr&ecirc;s Poderes! Bem sabemos que a hist&oacute;ria de muitos oper&aacute;rios e mulheres ficou esquecida nesses tijolos, mas a n&oacute;s que sabemos onde muitas delas ainda hoje circulam cabe homenage&aacute;-los de cora&ccedil;&atilde;o. Gratid&atilde;o em rimas!</p>

<div><strong>Com a for&ccedil;a de pioneiro</strong></div>

<div>Por Vinicius Borba</div>

<div><img alt="Nanking sobre papel. Carlione Ramos" src="https://photos.google.com/photo/AF1QipMOyMZqGcYuZrQX2bG_3lvnIzt-A6IG8JB-zLJs" style="float:right; height:1000px; width:500px" /></div>

<div>O povo primeiro<br />
lutou forte e conseguiu,<br />
No prazo que o homem pediu,<br />
Mostrar o valor do pioneiro.</div>

<div>&nbsp;</div>

<div>A beleza rimada.<br />
A silhueta projetada,<br />
em palavras sensuais<br />
e declamada, em atos rituais.</div>

<div>&nbsp;</div>

<div>Assim foi o projeto,<br />
Que Juscelino imaginou.<br />
Em pleno Planalto,<br />
Castelo concreto.<br />
Do qual a ditadura dura,<br />
O afastou!</div>

<div>&nbsp;</div>

<div>Mas hoje a vit&oacute;ria &eacute; certa.<br />
Aos amigos da vida,<br />
Vivendo aqui<br />
concretizam a meta<br />
dos objetivos<br />
Postos na vinda.</div>

<div>&nbsp;</div>

<div>E vencendo em tudo,<br />
Mostramos o valor<br />
dos calangos,<br />
Gigantes mudos<br />
Que agora mostram na voz,<br />
O amor, a dor e o calor.</div>

<div>&nbsp;</div>

<div>As vezes me sinto,<br />
Candango verdadeiro<br />
Quando sinto o cheiro<br />
De comida caipira e at&eacute; de cajueiro.</div>

<div>&nbsp;</div>

<div>Neste Cerrado indom&aacute;vel<br />
Abrindo caminho talvez.<br />
Sigo desbravando a vida,<br />
Inabal&aacute;vel!<br />
Como pioneiro da primeira vez.<br />
&nbsp;</div>

<div>Tirando caba&ccedil;o...<br />
Destas terras virgens!<br />
Sugando a fruta seca, o sabor.</div>

<div>Soprando a poesia, e a fuligem.<br />
Deste atemporal destino,<br />
Tirando a dor, fazendo amor<br />
&nbsp;</div>

<div>Poetando a hist&oacute;ria<br />
Me tornando criador.<br />
E sem d&uacute;vidas da vit&oacute;ria<br />
Me tornando do destino, mestre mor!<br />
Vou construindo, com muitos e at&eacute; s&oacute;<br />
Este castelo lindo,<br />
Que jamais se tornar&aacute; p&oacute;.<br />
Minha mem&oacute;ria,<br />
De pioneiro Cult,<br />
Sem d&oacute;!</div>

<p>Conhe&ccedil;a mais sobre essa hist&oacute;ria e quem foram os gigantes mudos que fizeram esta tal de capital.</p>

<p>https://www.youtube.com/watch?v=iDcz3Uw21wI</p>
', '-15.800300870255993', '-47.86097288131714', '6', 'T', '2016-12-18 20:50:45', '6', '2016-12-18 20:54:01', '6' ),
( '30', '8', 'Refugiadas/os', '<p>As dores de quem pede asilo, de refugiados e refugiadas, calam fundo em quem conhece as agruras de ter de fugir e abandonar seu pa&iacute;s, fam&iacute;lia e amigos &agrave; pr&oacute;pria sorte.&nbsp;Sem saber se h&aacute; futuro ou passado, quem dir&aacute; se haver&aacute; para onde voltar, povos da Am&eacute;rica Central, de &Aacute;frica e Oriente M&eacute;dio migram sob enormes riscos de morte para onde possam resgatar um m&iacute;nimo de dignidade da vida. Tamb&eacute;m neste desespero vivem as v&iacute;timas doutro tipo de ref&uacute;gios. Refugiad@s de preconceitos v&aacute;rios, pais de santo e homossexuais tamb&eacute;m sofrem dessas agruras.</p>

<p><strong>Refugiados/ as</strong></p>

<p>Por Vinicius Borba</p>

<div>Meu ref&uacute;gio &eacute; minha consci&ecirc;ncia<br />
Meu ref&uacute;gio &eacute; minha resist&ecirc;ncia<br />
Todo sangue e gl&oacute;ria que n&atilde;o me perten&ccedil;a<br />
Se do desespero alheio e da morte dependa</div>

<div>&nbsp;</div>

<div>Mais um corpo infanto desembarca nas areias brancas<br />
Sem vida se arrasta, j&aacute; n&atilde;o desengana<br />
E ainda que por b&ecirc;n&ccedil;&atilde;o se abra a fronteira insana<br />
A foto s&oacute; choca em escala pois o cad&aacute;ver n&atilde;o vem do Gana</div>

<div><img alt="Agência EFE" src="https://photos.google.com/photo/AF1QipOvCFbVbGYry_6m3si1o3D5PNJRLEwnW6PW1fe0" style="float:right; height:350px; width:500px" /></div>

<div>A guerra violenta que agora abala<br />
Foi mais um movimento comercial Yanke<br />
Enquanto o povo chora toda essa desgra&ccedil;a<br />
A ind&uacute;stria golp-estado vende mais um tanque</div>

<div>&nbsp;</div>

<div>A <a href="https://photos.google.com/photo/AF1QipPcGbKZ4yRE2Wm_nQkiqe0S5c23kHsUDp6zjjfp">S&iacute;ria que sangra l&aacute;grimas</a><br />
&Eacute; a mesma Nig&eacute;ria das meninas sequestradas<br />
Filhas do &oacute;dio que o ocidente embala<br />
Retratos de um tempo feudal,<br />
De col&ocirc;nia e escravid&atilde;o<br />
As mesmas falas Cruzadas</div>

<div>&nbsp;</div>

<div>As v&iacute;timas refugiadas<br />
Levando rasteira de jornalista rea&ccedil;a<br />
Decidem entre morrer naufragadas<br />
Ou a morte em vida,<br />
no inferno dos campos refugiadas.</div>

<div>&nbsp;</div>

<div>Aqui tamb&eacute;m temos refugiados<br />
V&iacute;timas das mesmas viola&ccedil;&otilde;es<br />
Um holocausto di&aacute;rio<br />
Marcad@s por persegui&ccedil;&otilde;es</div>

<div>&nbsp;</div>

<div>Pais de santo e terreiros queimados<br />
Homossexuais tamb&eacute;m refugiados<br />
Presos ao pr&oacute;prio corpo,<br />
E seus predicados</div>

<div>&nbsp;</div>

<div>Refugiad@s de seus direitos<br />
Refugiad@s da dignidade da vida<br />
Resistentes contra a chaga ferida<br />
Da dor que vem dos humanos direitos<br />
Da viola&ccedil;&atilde;o que n&atilde;o se cont&eacute;m<br />
Refugiad@s de uma guerra c&iacute;nica n&atilde;o declarada</div>

<div>​Refugiad@s de uma guerra c&iacute;nica n&atilde;o declarada</div>

<div>Refugiad@s de uma guerra c&iacute;nica n&atilde;o declarada</div>
', '-15.7999962248253', '-47.867072224617004', '7', 'T', '2016-12-18 21:34:24', '6', '2016-12-18 21:36:48', '6' ),
( '31', '8', 'Sarau Enamorados - uma história de amor', '<p>Nem s&oacute; de lutas &eacute; feito ser Fora da Ordem.. amar qui&ccedil;&aacute; seja o que h&aacute; de mais subversivo num momento da humanidade em que a desumaniza&ccedil;&atilde;o &eacute; o modus operandi da constru&ccedil;&atilde;o de um fascismo velado, com garras cada vez mais aparentes, um ovo de serpente que deve, mais do que nunca, ser combatido com #MaisAmorEMenos&Oacute;dio.</p>

<div><img alt="Ilustração: Nankin sobre papel, Carlione Ramos" src="https://photos.google.com/photo/AF1QipP9yub8w2P6rbkzU1Rd-_iPQ_x6kozIhDraiK9m" style="float:right; height:900px; width:600px" /></div>

<div><strong>Sarau Enamorados</strong></div>

<div>Vinicius Borba</div>

<div>&nbsp;</div>

<div>A vejo... no sop&eacute; da porta.<br />
E penso se pe&ccedil;o beijo,<br />
N&atilde;o pe&ccedil;o, n&atilde;o posso.<br />
Beijo n&atilde;o se pede, se rouba!</div>

<div>&nbsp;</div>

<div>A vejo... num Sarau Alternativo.<br />
E penso se tento a sorte?<br />
Mas olho... Tem macho &agrave; roda.<br />
E me&ccedil;o palmo a palmo a largura dos ossos...<br />
Pois vai que o tal corno se incomode..<br />
Hum! Minha vida, o pouco que me resta?<br />
Sempre tive o tal medo da morte<br />
E mais vale um covarde vivo,<br />
Que o her&oacute;i presunto besta, no pacote.</div>

<div>&nbsp;</div>

<div>A vejo, num Sarau da Tribo.<br />
At&eacute; que o mosca v&eacute;io...quase n&atilde;o varejeira...<br />
Quase n&atilde;o varejeirava!<br />
Mas tava todo no prumo,<br />
As tran&ccedil;as tran&ccedil;adas, no rumo,<br />
Daquela que ent&atilde;o me bicava:</div>

<div>&nbsp;</div>

<div>E z&oacute;ia eu. E z&oacute;ia ela...<br />
E um tal de n&atilde;o sei qual foi<br />
que inventei de ir na mesa mais perto da dela,<br />
E soltar uma piscadela<br />
Para ver se n&atilde;o tinha jeito.</div>

<div>&nbsp;</div>

<div>Pra qu&ecirc;!??<br />
Pois come&ccedil;a ent&atilde;o<br />
Aquele tal de forr&oacute;,<br />
Bom de agarrar e n&atilde;o mais ficar s&oacute;.<br />
Que fui me desavexar..<br />
Pois j&aacute; tava s&oacute; o p&oacute;,<br />
Mas n&atilde;o tinha a cara de chegar.</div>

<div>&nbsp;</div>

<div>Tumei tr&ecirc;s quatro goro,<br />
Foi que ent&atilde;o eu me enfezei:<br />
-- Agora eu chego nessa mulher!<br />
E a ela me projetei.</div>

<div>&nbsp;</div>

<div>E a cada passo que eu dava...<br />
O intestino soprava (...)<br />
E o frio me arrefecia.<br />
A menos de um metro e meio do &ldquo;rela bucho&rdquo; do amor...<br />
Sentei na cadeira outra vez.</div>

<div>&nbsp;</div>

<div>O z&oacute;in dela chega entristece.<br />
Pois n&atilde;o &eacute; que num s&oacute; passe,<br />
sua pele se enrubece<br />
Enchendo de indigna&ccedil;&atilde;o<br />
Me pega pela m&atilde;o<br />
Puxa para ralar...<br />
E disse: --Bora dan&ccedil;ar!! Cabra frouxo!<br />
Eu disse: -- Arrocha! Bote a mexer os cachos<br />
Que &eacute; hoje que eu tiro o atraso!</div>

<div>&nbsp;</div>

<div>Pra qu&ecirc;?!</div>

<div>Pois foi no Riacho Fundo II,<br />
Que fui confirmar minha sina.<br />
Duas semanas depois l&aacute; estava,<br />
T&atilde;o linda, t&atilde;o bela, Dulcineia!<br />
Num frevo dos cumpade comum,<br />
Que abonam a nossa hist&oacute;ria.</div>

<div>&nbsp;</div>

<div>E desde ent&atilde;o &eacute; assim,<br />
No susto do in&iacute;cio,<br />
Na certeza do agora,<br />
Um sentimento que cresce no peito<br />
E neste frenesi<br />
Dos acontecimentos &eacute; que a gente<br />
Se enrosca, se ama, se namora.</div>

<div>&nbsp;</div>

<div>E dou gritos a desvairada patuleia:<br />
--Mo&ccedil;as de meu passado pr&oacute;ximo!..<br />
Convivas da esb&oacute;rnia e boemia.<br />
A primeira dama... j&aacute; est&aacute; de posse!<br />
Dulcineia, Dulcineia, Dulcineia!</div>

<div>E que venham o moinhos de Cervantes.</div>

<p>&nbsp;</p>
', '-15.833044196113785', '-48.05657833814621', '8', 'T', '2016-12-18 21:48:07', '6', '2016-12-18 21:48:07', '6' ),
( '32', '8', 'Candidata - Lugar de cerveja gelada também é na repartição!', '<p>Pra quem bebe ao sair da reparti&ccedil;&atilde;o, ou j&aacute; se arrependeu de ter negado suas paix&otilde;es em artes pelas necessidades humanas que o mundo nos traz... Para quem elegeu a poesia, mais boteco, mais boemia, n&atilde;o deixe de passar pelo CONIC, Setor de Divers&otilde;es Sul. Na d&uacute;vida, n&atilde;o alimente os animais. Mas n&atilde;o deixe de tomar uma gelada.</p>

<p><img alt="Conic, Área Central de Brasília, sede da Faculdade de Artes Dulcina de Moraes. Conheça a ocupa!" src="https://photos.google.com/photo/AF1QipPfrhI4kZYJiwVY8zgDJOQhWZ7BaUqaqFwSGllv" style="float:left; height:960px; width:640px" /></p>

<p><strong>Candidata</strong></p>

<div>Por Vinicius Borba</div>

<div>&nbsp;</div>

<div>Certa feita<br />
Um poeta me inquiri<br />
Onde andas?<br />
Mostra a peita?</div>

<div>Ao que lhe informo o diagn&oacute;stico,<br />
com cara de Bras&iacute;lia:</div>

<div>&nbsp;</div>

<div>-- Burrocratite cr&ocirc;nica!<br />
Dilema de Behr,<br />
Entre o carimbo e a papelada.</div>

<div>&nbsp;</div>

<div>-- Sabe como &eacute; poeta...<br />
Poesia vivo por amor!<br />
Mas de amor mesmo,<br />
Nem casamento vive!<br />
&nbsp;</div>

<div>Arrumei um tern&atilde;o bruto, burrocratite!<br />
Fui trampar num gabinete eleito, acredite...</div>

<div>&nbsp;</div>

<div>Ao que Rego J&uacute;nior,<br />
Com a Boemia e desfa&ccedil;atez de poeta<br />
Me retruca com azia:</div>

<div>&ldquo;T&aacute; vendo, t&aacute; vendo... N&atilde;o elegeu a poesia?&rdquo;</div>

<div>&nbsp;</div>

<div>Pois teje eleita!</div>
', '-15.795309414007215', '-47.88437783718109', '9', 'T', '2016-12-18 22:02:25', '6', '2017-02-04 17:50:38', '6' ),
( '33', '9', 'O fantasma do Beira ', '<p>Morreu na</p>

<p>Mesa do bar</p>

<p>Engasgado com</p>

<p>Versos de adeus</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Bras&iacute;lia, 11 de novembro de 1984, cinco para meia noite. Na mesma hora do assassinato do jornalista M&aacute;rio Eug&ecirc;nio, Carlos teve um infarto na mesa sete do Beirute e morreu. O poeta n&atilde;o suportou a dor em seu peito ao ler o bilhete de adeus de seu amado, que se exilou ao saber que seria a pr&oacute;xima v&iacute;tima do Esquadr&atilde;o da Morte. Ainda hoje Carlos aparece no banheiro do Beira para vomitar nas privadas sua poesia n&atilde;o dita.</p>
', '-15.819671922957216', '-47.907536029815674', '0', 'T', '2016-12-18 22:13:14', '7', '2017-03-21 13:05:25', '5' ),
( '34', '9', 'Babi Babilônia', '<p><em>Babi bateu as botas</em></p>

<p><em>Da Rockonha &agrave; Babil&ocirc;nia</em></p>

<p><em>Fugindo dos p&eacute;-de-bota</em></p>

<p>&nbsp;</p>

<p>Bras&iacute;lia, anos 80. &nbsp;Babi foi presa na Rockonha, com mais trezentas pessoas acusadas de subvers&atilde;o. A caminho do quartel, Babi pulou da veraneio vasca&iacute;na em movimento e rolou tesourinha abaixo, morrendo no gramado. Um taxista que passava pelo local&nbsp; afirma t&ecirc;-la visto se levantar ap&oacute;s o acidente e correr at&eacute; a Babil&ocirc;nia, onde suas botas foram encontradas na manh&atilde; seguinte.</p>
', '-15.772787313960631', '-47.87967324256897', '1', 'T', '2016-12-18 22:32:57', '7', '2016-12-18 22:32:57', '7' ),
( '35', '8', 'Incendeia', '<p>O imperativo Incendeia traz um pouco do horror que sentimos a cada desumano ataque aos povos ind&iacute;genas, seja numa parada de &ocirc;nibus numa madrugada fria com &aacute;lcool e f&oacute;sforo por parte de playboys impunes, mais uma vez.&nbsp;Ou pelos capatazes de seus pais coron&eacute;is no interior do pa&iacute;s, para incendiar uma aldeia inteira a troco de tomar as terras destes povos tradicionais, tradicionalmente espoliados neste pa&iacute;s, cada vez menos na&ccedil;&atilde;o. Cada povo tradicional agredido neste pa&iacute;s, cada viola&ccedil;&atilde;o de direito humano contra o povo perif&eacute;rico neste Brasil afora, incendeia meu cora&ccedil;&atilde;o!</p>

<p><a href="https://www.youtube.com/watch?v=oLbhGYfDmQg" target="_blank">https://www.youtube.com/watch?v=oLbhGYfDmQg</a></p>

<p>Bro Mc&rsquo;s - Eju Orendive</p>

<div><strong>Incandeia</strong></div>

<div>Por Vinicius Borba</div>

<div>&nbsp;</div>

<div>Cada Kaiow&aacute; que cai na aldeia<br />
Cada canto de Tekoha que queima<br />
Incendeia meu cora&ccedil;&atilde;o</div>

<div>&nbsp;</div>

<div>Cada mil&iacute;cia encapuzada que chacina nas favelas<br />
Cada mano meu que morre de quebrada do meu lado<br />
Incendeia meu cora&ccedil;&atilde;o</div>

<div>&nbsp;</div>

<div>Cada m&atilde;e de santo morta pelo &oacute;dio do pastor<br />
Como se tamb&eacute;m n&atilde;o fosse Oxal&aacute; nosso senhor<br />
Incendeia meu cora&ccedil;&atilde;o</div>

<div>&nbsp;</div>

<div>Como pode num pa&iacute;s t&atilde;o rico em tudo<br />
O &oacute;dio ser t&atilde;o maior que a gan&acirc;ncia o absurdo<br />
Incendeia Meu cora&ccedil;&atilde;o</div>

<div>&nbsp;</div>

<div>Te levanta juventude, pelo justo de responsa<br />
Democr&aacute;tica segue em luta, de redes e de ruas!<br />
Incendeia meu cora&ccedil;&atilde;o</div>

<div>​</div>

<div><img alt="Ilustração: Nankin sobre papel, Carlione Ramos" src="https://photos.google.com/photo/AF1QipOY3Tr7xXauWcpMAU7cscxRIHiZeWuA2Xww5zBE" style="height:900px; width:600px" /></div>
', '-15.803423693961352', '-47.89734363555908', '10', 'T', '2016-12-18 22:33:46', '6', '2016-12-18 22:33:46', '6' ),
( '36', '9', 'A jacaré do Lago Paranoá', '<p>&nbsp;
<p><em>Da cintura para cima &eacute; mulher</em></p>
</p>

<p><em>Para baixo do umbigo uma jacar&eacute;</em></p>

<p><em>Que aparece no Lago Parano&aacute;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</em></p>

<p><em>Prateada de lua para enfeiti&ccedil;ar</em></p>

<p><em>Quem a meia noite por ali passar</em></p>

<p>&nbsp;</p>

<p>Em 1959, quando inundaram a fenda habitada por candangos da Vila Planalto, batizada de Lago Parano&aacute;, a candanga Iara dormia em seu barraco com seus tr&ecirc;s filhos, que foram engolidos pela correnteza de lama vermelha da constru&ccedil;&atilde;o da Capital. Iara conseguiu se salvar, mas passou o resto dos seus dias vagando na lama e no Lago em busca de suas crian&ccedil;as, at&eacute; o dia que foi devorada, por sua pr&oacute;pria vontade, por um jacar&eacute; que h&aacute; dias a espreitava.</p>

<p>&nbsp;</p>
', '-15.80023445327313', '-47.830116748809814', '2', 'T', '2016-12-18 22:37:09', '7', '2016-12-18 22:37:09', '7' ),
( '37', '9', 'O buraco do Tatu', '<p><em>Alguns seres encantados</em></p>

<p><em>Tem segredos sangrados</em></p>

<p><em>Sepultados em vida</em></p>

<p><em>S&atilde;o sentinelas das ruas</em></p>

<p><em>Nessa gira constante</em></p>

<p><em>S&atilde;o o nosso olhar</em></p>

<p><em>Um passo a diante</em></p>

<p>&nbsp;</p>

<p>Tatu era mineiro e se tornou candango em Bras&iacute;lia em 1958. Antes de subir no pau-de-arara rumo a Bras&iacute;lia, Tatu se despediu da mulher e dos quatro filhos, que se mudariam para a capital no pr&oacute;ximo natal. Seis meses ap&oacute;s sua partida, chegou &agrave; Minas Gerais a not&iacute;cia de sua morte na constru&ccedil;&atilde;o do viaduto pr&oacute;ximo &agrave; Rodovi&aacute;ria do Plano Piloto, onde, nas noites de natal, Tatu vaga coberto de cimento.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', '-15.794001050516716', '-47.88286507129669', '3', 'T', '2016-12-18 22:40:03', '7', '2016-12-18 22:40:03', '7' ),
( '38', '9', 'O palhaço do Planalto', '<p><em>Hoje tem carnaval?</em></p>

<p><em>Tem sim senhor!</em></p>

<p><em>Hoje tem marmita boa?</em></p>

<p><em>Tem n&atilde;o senhor!</em></p>

<p><em>Gritaram 300 candangos</em></p>

<p><em>Tem n&atilde;o senhor!</em></p>

<p><em>Gritaram 200 candangos</em></p>

<p><em>Tem n&atilde;o senhor!</em></p>

<p><em>Sem candangos n&atilde;o</em></p>

<p><em>Puderam mais gritar.</em></p>

<p>&nbsp;</p>

<p>No carnaval de 1959 Martinho e Coreta trocaram o gris do cimento e do sab&atilde;o por coloridas maquiagens e fizeram do acampamento da construtora Pacheco Fernandes Dantas seu picadeiro. Durante um beijo fugaz, o casal foi alvejado pelos militares junto a dezenas de outros foli&otilde;es que protestavam por direitos b&aacute;sicos. O casal que caiu entrela&ccedil;ado morreu com uma bala s&oacute;, a primeira daquela chacina. Nas noites de carnaval, o casal ainda percorre os vazios corredores que ajudaram a edificar, trajando as fantasias ocultadas junto a seus corpos e suas hist&oacute;rias.</p>
', '-15.79902591846694', '-47.86090850830078', '4', 'T', '2016-12-18 22:41:09', '7', '2017-01-03 15:02:30', '7' ),
( '39', '8', 'Ode a Spartacus ou Como precisamos disso', '<div><strong>Ode &agrave; Spartacus ou como precisamos disso</strong></div>

<div>Por Vin&iacute;cius Borba</div>

<div>&nbsp;</div>

<div>Quando invado em poesia um ba&uacute; lotado<br />
Quando invado um banco rico totalmente armado<br />
Quando invado a fazenda do grileiro safado<br />
Quando ocupo o esqueleto-pr&eacute;dio vazio especulado<br />
Quando invado sua mente e deixo tudo devassado<br />
Quando destruo sua moral inconsequente nesse Estado<br />
Quando invado a casa do corrupto armado<br />
Ou apedrejo os seus c&atilde;es por engolirem calados<br />
Quando invado o sinal e simplesmente falo</div>

<div>&nbsp;</div>

<div>O que todo o meu povo sente h&aacute; muito tempo calado</div>

<div>Eu n&atilde;o aceito mais tanta desculpa louv&aacute;vel<br />
E vou pro choque, linha de frente<br />
A&ccedil;&atilde;o direta, eu abalo</div>

<div>&nbsp;</div>

<div>Explodo seu esquema, seu gabinete, sua linha editorial<br />
Por que n&atilde;o nasci pra ficar de joelhos, nem pra pagar pau</div>

<div>A minha luta &eacute; das antigas<br />
N&atilde;o renego minhas origens<br />
Povo humilde, forte, aguerrido que nunca desiste</div>

<div>&nbsp;</div>

<div>Vinicius Borba na guerrilha<br />
Poeta radical livre<br />
Quebrada S&atilde;o Sebasti&atilde;o<br />
Perifa DF na resist</div>

<div>&nbsp;</div>

<div>E n&atilde;o assiste omisso<br />
Toda essa sacanagem<br />
Que vem maquiada, patrocinada<br />
Governo, m&iacute;dia, pilantragem</div>

<div>Minha poesia, &eacute; soco na boca do est&ocirc;mago desse sistema<br />
Que se repete, escraviza<br />
A maioria nos esquema</div>

<div>&nbsp;</div>

<div>Aqui no DF &ldquo;companheiro&rdquo; que se corrompeu &eacute; mato<br />
Sob argumento da revolu&ccedil;&atilde;o em &ldquo;nova fase&rdquo;<br />
M&oacute; garganta puro descaso<br />
N&atilde;o enxergam que como orienta o grande Galeano<br />
O pior pecado &eacute; o atentado contra a esperan&ccedil;a dos manos</div>

<div>&nbsp;</div>

<div>Quando eu invado sua mente<br />
Inconsequente com minha rima<br />
&Eacute; para lembrar o que nos disse e orientou<br />
o primeiro escravo revolucion&aacute;rio um dia</div>

<div>&nbsp;</div>

<div>Perguntados sobre com o que<br />
Poderiam ajudar na luta<br />
Cada qual se ergueu<br />
Para fazer armas, colaborar na labuta</div>

<div>&nbsp;</div>

<div>Mas um garoto ainda jovem<br />
Com pena e pap&eacute;is em baixo do bra&ccedil;o<br />
Respondeu com humildade<br />
dando a frente um largo passo</div>

<div>&nbsp;</div>

<div>&ldquo;Guerreiro, eu s&oacute; sei fazer poesia<br />
Relato minha aldeia, nossa luta, nosso dia-a-dia&rdquo;<br />
E aquele escravo, forjado a ferro e fogo para batalha,<br />
Se ergueu e respondeu, evitando os canalhas:</div>

<div>&nbsp;</div>

<div>&ldquo;Poeta, pra que nossa vit&oacute;ria seja completa,<br />
para n&atilde;o esquecermos de onde viemos<br />
e para onde vamos na certa<br />
Dependemos do sonho e resist&ecirc;ncia que no peito levas!</div>

<div>&nbsp;</div>

<div>N&atilde;o baixe a guarda!<br />
N&atilde;o aceita corrup&ccedil;&atilde;o!<br />
N&atilde;o seja omisso.<br />
Foste mandado pelos deuses,<br />
como precisamos disso!&rdquo;</div>
', '-15.794096367031414', '-47.882304824888706', '11', 'T', '2016-12-18 22:41:19', '6', '2016-12-18 22:41:19', '6' ),
( '40', '9', 'Réquien nipocandango', '<p><em>Sepultada</em></p>

<p><em>&Agrave; sombra</em></p>

<p><em>De um Ip&ecirc;</em></p>

<p><em>H&aacute; uma flor</em></p>

<p><em>Menina que</em></p>

<p><em>N&atilde;o chegou</em></p>

<p><em>A florescer</em></p>

<p>&nbsp;</p>

<p>No dia 11 de setembro de 1973, Saki caiu de um ip&ecirc; em sua quadra, SQN 405, morrendo ali, rodeada de flores brancas. A m&atilde;e de Saki plantou a mesma &aacute;rvore ao lado de seu t&uacute;mulo para que flores nunca faltasse &agrave; filha no m&ecirc;s de sua morte. As flores ef&ecirc;meras ornam com capricho o t&uacute;mulo da menina, o segundo mais visitado e florido do cemit&eacute;rio Campo da Esperan&ccedil;a.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', '-15.817029351959345', '-47.930946350097656', '5', 'T', '2016-12-18 22:42:41', '7', '2017-01-03 15:03:14', '7' ),
( '41', '9', 'O sangue do Minhocão', '<p><em>O golpe de estado</em></p>

<p><em>Sofreu um golpe de estudo</em></p>

<p><em>Foi alvejado com livros</em></p>

<p><em>E o que jorrou do povo</em></p>

<p><em>Foram seus sonhos</em></p>

<p><em>E n&atilde;o mais seu sangue</em></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Universidade de Bras&iacute;lia, agosto de 1968. Na tentativa de proteger uma estudante que estava na linha de tiros dos militares, Milton, um faxineiro do minhoc&atilde;o, &nbsp;correu em sua dire&ccedil;&atilde;o, sendo alvejado antes mesmo de toc&aacute;-la. Milton morreu ali, sujando com sangue e ironia o ch&atilde;o que havia limpado naquela manh&atilde; e que at&eacute; hoje ainda exala notas de sangue fresco no ar.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', '-15.763179456408833', '-47.87086486816406', '6', 'T', '2016-12-18 22:43:45', '7', '2016-12-18 22:43:45', '7' ),
( '42', '9', 'A Cigana dos Prazeres', '<p><em>A cigana</em></p>

<p><em>Sangrou</em></p>

<p><em>E se consagrou</em></p>

<p><em>Sagrada</em></p>

<p>&nbsp;</p>

<p>Sexta-feira, 13 de dezembro de 1968. Ap&oacute;s a assinatura do AI 5, o coronel-presidente Arthur Costa e Silva ordenou o fechamento imediato do Congresso Nacional. No local passava um grupo de ciganos Calon rec&eacute;m chegados &agrave; Bras&iacute;lia que, assustados com a trucul&ecirc;ncia dos militares, seguiram rumo &agrave; rodovi&aacute;ria do Plano Piloto em uma charrete. Pr&oacute;ximo &agrave; quadra 201 Norte, a charrete tombou em uma eros&atilde;o com lama e restos de constru&ccedil;&atilde;o, afogando Maria dos Prazeres, a cartomante do grupo. No local de sua morte brotou uma amendoeira, a qual resiste gigantesca at&eacute; hoje &agrave; Ordem e ao Progresso em uma &aacute;rea nobre de Bras&iacute;lia. No outono, a &aacute;rvore lan&ccedil;a folhas vermelhas e cartas de baralho no ar.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', '-15.784162603122622', '-47.878261394798756', '7', 'T', '2016-12-18 22:47:45', '7', '2016-12-18 22:47:45', '7' ),
( '43', '8', 'Juventude de lutas', '<p>A constru&ccedil;&atilde;o dos movimentos de juventude de lutas no DF e no Brasil passa, nos anos 2000, pelo debate de horizontalidade e verticalidade, movimentos partid&aacute;rios e apartid&aacute;rios, a luta pelo direito &agrave; cidade e a busca de uma nova &eacute;tica na pol&iacute;tica. O que &eacute; ser juventude de lutas para voc&ecirc;?<a href="https://www.youtube.com/watch?v=cjce9zmIxtc" target="_blank">https://www.youtube.com/watch?v=cjce9zmIxtc</a></p>

<div><strong>Juventude de Luta</strong></div>

<div>Vinicius Borba</div>

<div>&nbsp;</div>

<div>Toda vez que te perguntam<br />
De onde vem tua ess&ecirc;ncia<br />
N&atilde;o se fa&ccedil;a apar&ecirc;ncia<br />
Responda: Sou Juventude de Luta</div>

<div>&nbsp;</div>

<div>Quando nosso tempo aflora<br />
E h&aacute; tempos de turbul&ecirc;ncia<br />
Quando o mal e a indec&ecirc;ncia<br />
Tomam conta dos poderes<br />
&Eacute; hora de assim dizeres<br />
Sou Juventude de Luta</div>

<div>&nbsp;</div>

<div>Enquanto o certo for o certo<br />
E houver valor na disputa<br />
Se com quem voc&ecirc; combate<br />
Honra a saia, a cal&ccedil;a e a boina<br />
Responda firme a pergunta<br />
Sou Juventude de Luta<br />
&nbsp;<br />
Se tu sabes qual tua origem<br />
Da favela, campo ou asfalto<br />
Se n&atilde;o nega a luta de classes<br />
O teu papel no assalto<br />
Derruba o corrupto no ato<br />
Reage ao pelego de fato<br />
Sou Juventude de Luta</div>

<div>&nbsp;</div>

<div>Mas se a tenta&ccedil;&atilde;o bate a porta<br />
Por emprego, dinheiro, sexo ou droga<br />
N&atilde;o te esquece da labuta<br />
N&atilde;o te entrega na primeira hora</div>

<div>Por que as coisas do mundo<br />
A gente consome e passa<br />
Mas nosso compromisso de luta<br />
Nossa mem&oacute;ria corrupta<br />
N&atilde;o se apaga<br />
Est&aacute; todo mundo vendo<br />
E depois n&atilde;o tem remendo<br />
Que a consci&ecirc;ncia refa&ccedil;a</div>

<div>Pra quem vive na trapa&ccedil;a</div>

<div>&nbsp;</div>

<div>J&aacute; acha at&eacute; natural<br />
Trai @s pr&oacute;pri@s companheir@s<br />
Achando que &eacute; @ tal<br />
Acaba no isolamento<br />
Com suas rela&ccedil;&otilde;es compradas<br />
Com Maquiavel abra&ccedil;adas<br />
Mas sem luta no firmamento</div>

<div>&nbsp;</div>

<div>N&atilde;o contavam com minha ast&uacute;cia?<br />
Se ilude @ anti-her&oacute;i<br />
Vit&oacute;rias sem qualquer fid&uacute;cia<br />
Castelos de areia constr&oacute;i<br />
Sendo que ao primeiro vento<br />
Sua corrup&ccedil;&atilde;o se esvai</div>

<div>&nbsp;</div>

<div>E a juventude de luta<br />
De anseios, energia e valores na disputa?<br />
Uma gera&ccedil;&atilde;o se frustra<br />
Os princ&iacute;pios se v&atilde;o ao l&eacute;u</div>

<div>&nbsp;</div>

<div>E a tua balela de: depois passa...<br />
Deixa marcas indel&eacute;veis.<br />
Silencia a flor no rev&eacute;s.<br />
Se perde um jovem de luta.</div>

<div>&nbsp;</div>

<div>Nosso pecado contra a esperan&ccedil;a<br />
&Eacute; a morbidez que nos toma<br />
&Eacute; a trai&ccedil;&atilde;o de si mesm@<br />
Pois ser Juventude de Luta<br />
&Eacute; constru&ccedil;&atilde;o, &eacute; disputa<br />
&Eacute; descobrir no passo a passo<br />
@s mestres nessa labuta</div>

<div>&nbsp;</div>

<div>Sem amarras para contradi&ccedil;&otilde;es</div>

<div>Enfrentar o mundo em inten&ccedil;&otilde;es<br />
Entre a incoer&ecirc;ncia e a loucura<br />
Rompendo com a amargura<br />
Desancando @s canalhas</div>

<div>&nbsp;</div>

<div>Se pisar... que aguente a batalha<br />
Pois n&atilde;o cabe aliviar.<br />
X9 tem que rodar<br />
Trai&ccedil;&atilde;o com inimigo? V&aacute; l&aacute;.<br />
Mas entre n&oacute;s,<br />
&Eacute; mostrar uma marca de car&aacute;ter.</div>

<div>&nbsp;</div>

<div>N&atilde;o renego a pol&iacute;tica<br />
Ela &eacute; caminho, &eacute; trajeto<br />
&Eacute; meio, n&atilde;o apenas um fim certo<br />
A gente tem que lidar<br />
Aprender a disputar e seguir<br />
Car&aacute;ter reto<br />
A vida &eacute; feita de lutas</div>

<div>&nbsp;</div>

<div>N&atilde;o h&aacute; que temer o incerto<br />
H&aacute; que temer cabritagem<br />
H&aacute; que temer trairagem<br />
E evitar dar de espert@</div>

<div><br />
Por que quem vai pra disputa<br />
Representa comunidade,<br />
Se alinha com uma postura<br />
Quem sustenta tem respeito<br />
Quem num guenta esmorece<br />
Mas quem luta com responsa<br />
Levanta bandeira da esperan&ccedil;a<br />
E quando pegam fazendo lamban&ccedil;a<br />
Mata o sonho, acaba a dan&ccedil;a<br />
Tipo som quando d&aacute; brek</div>

<div>&nbsp;</div>

<div>O que a gente se esquece,<br />
&Eacute; que @ militante comprad@<br />
Agora est&aacute; do seu lado<br />
Mas n&atilde;o dura, se esquece<br />
E o dinheiro pelo dinheiro<br />
O poder pelo poder,<br />
O patr&atilde;o sempre tem mais<br />
Ao final @ oprimid@<br />
Vira opressor@ contumaz</div>

<div>&nbsp;</div>

<div>Se pretender entrar numas<br />
Te prepara pro pior<br />
Companheir@ que &eacute; companheir@<br />
Nunca corrompe a banca<br />
Se n&atilde;o entendeu o recado<br />
Teje ligad@, escuta<br />
Somos Juventude de Luta<br />
E o bicho vai pegar!</div>
', '-15.796940554918151', '-47.87925481796265', '12', 'T', '2016-12-18 22:50:22', '6', '2016-12-18 22:50:22', '6' ),
( '44', '9', 'A morte da nascente', '<p><em>S&atilde;o Santxi&ecirc;</em></p>

<p><em>Recorro a voc&ecirc;</em></p>

<p><em>Para proteger</em></p>

<p><em>Nossa terrinha</em></p>

<p><em>Em nome de</em></p>

<p><em>Todas as vidas</em></p>

<p><em>Afogadas na</em></p>

<p><em>Tesourinha</em></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Em 1957, um grupo da etnia Fulni&ocirc; se mudou para a Terra Ind&iacute;gena Bananal, onde foi edificado o impopular Setor Noroeste anos depois. Na constru&ccedil;&atilde;o do novo setor sobre cerrado nativo e hist&oacute;ria ancestral, o Santu&aacute;rio dos Paj&eacute;s foi engolido por tratores e trucul&ecirc;ncia. Tal prepot&ecirc;ncia despertou a f&uacute;ria do deus Tup&atilde;, sentida por toda a cidade desde ent&atilde;o, seja em forma de alagamentos ou falta de &aacute;gua na tombada capital do Brasil.</p>

<p>&nbsp;</p>
', '-15.750561481394183', '-47.91038990020752', '8', 'T', '2016-12-18 22:51:45', '7', '2016-12-18 22:51:45', '7' ),
( '45', '8', 'Honestino Eterno', '<p>300 desaparecidos apenas? &Eacute; isso mesmo ditadura? N&atilde;o n&atilde;o. Segundo relat&oacute;rios da Comiss&atilde;o Nacional da Verdade o processo de ditadura militar no Brasil&nbsp;houve pelo menos oito mil mortos entre os povos ind&iacute;genas para coloniza&ccedil;&atilde;o de territ&oacute;rios no norte do pa&iacute;s, constru&ccedil;&atilde;o de grandes estradas e obras e etc. E ainda cerca de 1500 militares expulsos, perseguidos, exilados e torturados pelo regime. Dentre os 300 militantes da resist&ecirc;ncia armada brutalmente torturados, estupradas, mortos e desaparecidas (sem paradeiro), est&aacute; Honestino Guimar&atilde;es, jovem que marca a trajet&oacute;ria de&nbsp; Bras&iacute;lia e hoje&nbsp;representa a mem&oacute;ria de lutas desta cidade, inclusive com&nbsp;o rebatismo da antiga ponte que levava nome de ditador sanguin&aacute;rio, um dos generais que comandou os assassinatos e persegui&ccedil;&otilde;es a militantes pol&iacute;ticos no Brasil, sendo a ponte rebatizada Ponte Honestino Guimar&atilde;es.</p>

<div><strong>Honestino Eterno</strong></div>

<div>Por Vinicius Borba</div>

<div>​</div>

<div>Acabem com essa tortura!<br />
A tortura do holocausto,<br />
A tortura do sil&ecirc;ncio,<br />
A tortura de Honestino, sem destino paradeiro.</div>

<div><br />
Acabem com essa tortura!<br />
Libertem almas daqueles que ainda aguardam<br />
Um retorno, pura amargura,<br />
Um vazio enquanto amam.</div>

<div>&nbsp;</div>

<div>Tanta luta n&atilde;o foi lembrada.<br />
Aos que diziam defender o pa&iacute;s,<br />
amor ao ch&atilde;o, sua raiz,<br />
Esqueceram que &eacute; dos jovens o amor nessa constru&ccedil;&atilde;o<br />
Que se h&aacute; pa&iacute;s, povo, na&ccedil;&atilde;o,<br />
Isso surge da voz que grita, da voz que diz.</div>

<div>&nbsp;</div>

<div>Mas se silenciaram a luta,<br />
N&atilde;o calar&atilde;o nossa mem&oacute;ria.<br />
E que se cale esse c&aacute;lice, cala-te C&aacute;lice!</div>

<div>&nbsp;</div>

<div>Que se repete, em cada Amarildo,<br />
em cada moleque morto na viela escura.<br />
Em cada oprimid@ espancad@ em via p&uacute;blica.<br />
Por exigir a letra morta, antes esperan&ccedil;a pura.</div>

<div>&nbsp;</div>

<div>Levanta de novo essa nossa luta,<br />
Nos junta, leva &agrave;s ruas!<br />
E Honestino revive na W3,<br />
Na Rod&ocirc;, nas UnBs, seus C&acirc;mpus e contradi&ccedil;&otilde;es<br />
&nbsp;</div>

<div>Renasce, pois Cale-se n&atilde;o posso mais!<br />
N&atilde;o me calo nunca mais.</div>

<div>Guimar&atilde;es &eacute; nosso ontem, nosso hoje<br />
Mas amanh&atilde;,<br />
Honestamente<br />
Amanh&atilde; j&aacute; &eacute; maior Maior,<br />
Honestamente Eterno!</div>

<p><a href="https://www.youtube.com/watch?v=nlDbO_nV9_Q" target="_blank">https://www.youtube.com/watch?v=nlDbO_nV9_Q</a></p>

<p>&nbsp;</p>
', '-15.825101368932168', '-47.87517249584198', '13', 'T', '2016-12-18 22:58:37', '6', '2016-12-18 23:51:37', '6' ),
( '46', '8', 'Elo Fraco ou Elo Forte', '<p>Seremos sempre testados/ as em situa&ccedil;&otilde;es cruciais. Resta a n&oacute;s saber como iremos agir, sustentar a franqueza e a dignidade da vida, e seguir caminhando!</p>

<p><a href="https://issuu.com/viniciusborba0/docs/fora_da_ordem_hiper_poemas_de_vinic">Leia, fa&ccedil;a download e envie para as pessoas o livro Fora da Ordem </a></p>

<div><strong>Elo fraco, ou elo forte?<img alt="" src="https://photos.google.com/photo/AF1QipPsBt3LJLXU1FyjLrueqFYR7uj1wdY_4Ei3L8cN" style="float:right; height:250px; width:600px" /></strong></div>

<div><br />
Elo fraco, ou elo forte?</div>

<div>Se n&atilde;o h&aacute; quem ou&ccedil;a<br />
E n&atilde;o h&aacute; quem leia,<br />
Tamb&eacute;m n&atilde;o h&aacute; quem viva</div>

<div>E n&atilde;o h&aacute; quem creia</div>

<div>&nbsp;</div>

<div>Revolta humana<br />
Contra o sil&ecirc;ncio divino,<br />
At&eacute; quando esperar?<br />
Gritam de fome os meninos!</div>

<div>&nbsp;</div>

<div>Faroeste caboclo ou Distrito Federal?<br />
Capitalismo para os loucos,<br />
Comem pasto no curral eleitoral.</div>

<div>&nbsp;</div>

<div>A vida n&atilde;o espera.<br />
O universo transp&otilde;e eras.<br />
Se da quebra a corrente est&aacute; a merc&ecirc;<br />
Jamais esque&ccedil;a: o elo fraco, pode ser voc&ecirc;.</div>

<div>&nbsp;</div>

<div>Dizer que n&atilde;o &eacute;s capaz?<br />
F&aacute;cil fuga, covardia.<br />
Se &eacute;s forte e audaz<br />
Ao pr&oacute;prio ser desafia</div>

<div>​</div>

<div>Na simplicidade destes versos,<br />
Pe&ccedil;o feche essa ferida<br />
Fortalecendo estes elos,<br />
Na nossa corrente da vida.</div>

<div>&nbsp;</div>

<div><img alt="Descubra de onde é esta vista! E curta como ninguém!" src="https://photos.google.com/photo/AF1QipO0os8_73FVNcI9vRtvSmQLfKVN2c35IOA_ScEL" style="height:200px; width:600px" /></div>
', '-15.890296165889008', '-47.79719531536102', '14', 'T', '2016-12-18 23:09:36', '6', '2016-12-18 23:58:46', '6' ),
( '47', '10', 'Primeiro ponto', '<p style="text-align:center">Eu j&aacute; sei tudo o que eu queria saber</p>

<p style="text-align:center">Agora s&oacute; quero ouvir de voc&ecirc;</p>

<p style="text-align:center">Por que &eacute; que a gente &eacute; assim</p>

<p style="text-align:center">T&atilde;o sozinho</p>

<p style="text-align:center">Sem ninho</p>

<p style="text-align:center">Por que voc&ecirc; n&atilde;o vem a mim</p>

<p style="text-align:center">Preciso de carinho</p>

<p style="text-align:center">Preciso te dar</p>

<p style="text-align:center">O que s&oacute; eu tenho pra voc&ecirc;</p>

<p style="text-align:center">Todo aquele quase querer</p>

<p style="text-align:center">Escrito no seu olhar</p>

<p style="text-align:center">Preciso falar</p>

<p style="text-align:center">A palavra que n&atilde;o sai da sua boca</p>

<p style="text-align:center">E decifrar</p>

<p style="text-align:center">Os mist&eacute;rios debaixo da sua roupa</p>

<p style="text-align:center">Voc&ecirc; sabe que eu sei</p>

<p style="text-align:center">Que em todos os sonhos te encontrei</p>

<p style="text-align:center">Porque quando estou ao seu lado</p>

<p style="text-align:center">&Eacute; como sonhar acordado</p>

<p>&nbsp;</p>

<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/2WlAN2cMDro&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>
', '-15.78396659932158', '-47.878063917160034', '0', 'T', '2016-12-21 01:33:35', '5', '2017-03-21 13:31:59', '5' ),
( '48', '7', 'Praça dos cogumelos', '<p>O cerrado &eacute; belo por si s&oacute;. Coube ao g&ecirc;nio criativo de Burle Marx aliar a beleza tortuosa das &aacute;rvores com os cogumelos flutuantes de concreto futurista e o famoso Bloco levitando entre a vegeta&ccedil;&atilde;o.</p>

<p>&nbsp;</p>

<p><img alt="" src="http://www.40forever.com.br/wp-content/uploads/2013/06/SQS-308-com-jardins-Burle-Marx-1.jpg" /></p>
', '-15.814837161381105', '-47.905240058898926', '1', 'T', '2016-12-23 20:44:02', '5', '2017-03-19 18:33:28', '5' ),
( '49', '7', 'Banca da Conceição', '<p style="text-align:center"><em>Grande Bras&iacute;lia</em></p>

<p style="text-align:center"><em>que vai de Brazl&acirc;ndia a S&atilde;o Sebasti&atilde;o</em></p>

<p style="text-align:center"><em>do Gama a Planaltina</em></p>

<p style="text-align:center"><em>Grande Concei&ccedil;&atilde;o</em><br />
&nbsp;</p>

<p style="text-align:right">Nicolas Behr</p>

<p>&nbsp;</p>

<p><img src="http://gpsbrasilia.com.br/fotoJornal/mthumb/foto-1422016-41219-Novos-caminhos.jpg" style="height:560px; width:840px" /></p>

<p>A Banca da Concei&ccedil;&atilde;o, na 308 Sul, &eacute; uma das menores do Plano Piloto e, por certo, uma das mais vigiadas pelos moradores da quadra-modelo de Bras&iacute;lia. &Eacute; a porta de entrada de turistas, arquitetos e estudantes que querem saber como &eacute; viver em superquadra, um modelo de moradia e conviv&ecirc;ncia urbana que Lucio Costa aprimorou a partir de princ&iacute;pios do urbanismo moderno.</p>

<p>Loja de souvenires da 308 Sul, a banquinha t&ecirc;m v&aacute;rios t&iacute;tulos de arquitetura, hist&oacute;ria, literatura, quadrinhos e muito mais, tudo a cara de Bras&iacute;lia!</p>

<p>Tamb&eacute;m &eacute; poss&iacute;vel comprar mimos e artesanatos de artistas locais.</p>
', '-15.814586147354094', '-47.90558874607086', '2', 'T', '2016-12-23 20:52:25', '5', '2017-03-19 18:32:11', '5' ),
( '50', '7', 'Espelho d\'água', '<blockquote>
<p>Segundo esta lenda, muito antiga por sinal, a carpa tinha que atingir a fonte do rio que corta a China, o Huang Ho (Rio Amarelo), na &eacute;poca da desova. Para isso, tinha que nadar contra a correnteza e saltar cascatas at&eacute; &agrave; montanha Jishinhan. A carpa que alcan&ccedil;asse o topo tornava-se um drag&atilde;o.</p>
</blockquote>

<p><img alt="" src="https://naterradoipe.files.wordpress.com/2011/08/dsc02226_mod.jpg" /></p>
', '-15.81392876009572', '-47.90564775466919', '3', 'T', '2016-12-23 20:57:43', '5', '2017-03-19 18:32:34', '5' ),
( '51', '7', 'Espaço Cultural Renato Russo', '<p>Outrora um espa&ccedil;o cultural multiuso - com galeria, teatro e v&aacute;rios cursos - o Espa&ccedil;o Cultural Renato Russo est&aacute; fechado.</p>

<p><br />
Destaque para a fachada toda grafitada (e alguns pok&eacute;stops) e para a R&aacute;dio Cultura FM - 100,9, que ainda funciona dentro das instala&ccedil;&otilde;es do Espa&ccedil;o Cultural.</p>

<p>&nbsp;</p>

<p><img alt="Coletivo SA todas as quintas 23h 100,9 FM" src="http://imgsapp.diariodepernambuco.com.br/app/noticia_127983242361/2015/05/12/576241/20150512215327880780i.jpg" style="height:450px; width:750px" /></p>
', '-15.81295841720159', '-47.90571212768555', '4', 'T', '2016-12-23 21:00:24', '5', '2017-03-19 18:33:02', '5' ),
( '52', '11', 'Exú', '<p>Ex&uacute; rege as<br />
A&ccedil;&otilde;es humanas<br />
&Eacute; o movimento<br />
&Eacute; a boca que<br />
Come o mundo<br />
Para alimentar voc&ecirc;<br />
Laroy&ecirc;!</p>

<p>Marina Mara</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', '-15.82039449495235', '-47.87811756134033', '0', 'T', '2016-12-27 10:55:59', '7', '2017-03-21 13:33:27', '5' ),
( '53', '11', 'Oxalá', '<p>Claro e certeiro<br />
Como conselho<br />
De pai para filho<br />
Brilhante como<br />
Nuvem quando<br />
Despe o sol<br />
Em pleno ar<br />
&Ecirc;pa bab&aacute;!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '1', 'T', '2016-12-27 11:02:14', '7', '2016-12-27 11:02:14', '7' ),
( '54', '11', 'Iemanjá', '<p>Sagrada e profunda<br />
Como f&eacute; de<br />
Pescador<br />
Perfumada e fecunda<br />
Como santa<br />
No andor<br />
Encantando com<br />
Florde laranjeira<br />
O ar<br />
Odoi&aacute;!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '2', 'T', '2016-12-27 11:05:14', '7', '2016-12-27 11:05:14', '7' ),
( '55', '11', 'Oxóssi', '<p>&Eacute; mata que<br />
N&atilde;o morre<br />
Nem com fogo<br />
Nem com serra<br />
Pois de sua terra<br />
&Eacute; guardi&atilde;o<br />
E senhor<br />
Ok&ecirc; ar&ocirc;!</p>

<p>Marina Mara</p>

<p>&nbsp;</p>
', '-15.82039449495235', '-47.87811756134033', '3', 'T', '2016-12-27 11:08:21', '7', '2016-12-27 11:08:21', '7' ),
( '56', '11', 'Xangô', '<p>Xang&ocirc; troveja<br />
Prote&ccedil;&atilde;o<br />
E justi&ccedil;a no<br />
Caminho dos<br />
Filhos seus<br />
Para que na<br />
Caminhada<br />
Nunca vacile<br />
Ka&ocirc; cabecile!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '4', 'T', '2016-12-27 11:10:42', '7', '2016-12-27 11:10:42', '7' ),
( '57', '11', 'Ogum', '<p>S&atilde;o jorges<br />
S&atilde;o guerreiros<br />
&Eacute; filho forte<br />
Que a ferro<br />
E fogo enfrenta<br />
O mundo em nome<br />
Do que cr&ecirc;<br />
Ogum i&ecirc;!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '5', 'T', '2016-12-27 11:13:29', '7', '2016-12-27 11:13:29', '7' ),
( '58', '11', 'Ewá', '<p>Guardi&atilde; da<br />
Mata virgem<br />
E de tudo<br />
Que &eacute; virginal<br />
Guerreira das<br />
Estrelas que<br />
Tem o dom<br />
De adivinhar<br />
Ri Ro Ew&aacute;!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '6', 'T', '2016-12-27 11:15:12', '7', '2016-12-27 11:15:12', '7' ),
( '59', '11', 'Oxum', '<p>Minha m&atilde;e tem<br />
Cora&ccedil;&atilde;o de pedra<br />
Lapidada pela<br />
&Aacute;gua do rio<br />
Forte e doce<br />
Como f&ecirc;mea no cio<br />
Gerando em mel<br />
Cada filho seu<br />
Oraieie&ocirc;!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '7', 'T', '2016-12-27 11:17:45', '7', '2016-12-27 11:17:45', '7' ),
( '60', '11', 'Iansã', '<p>B&aacute;rbara musa<br />
Que sopra<br />
Borboletas s&oacute;<br />
Pra encantar o ar<br />
Colorindo de rubro<br />
Um raio que alcan&ccedil;a<br />
Onde o vento alcan&ccedil;ar<br />
Eparrey, Oy&aacute;!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '8', 'T', '2016-12-27 11:19:19', '7', '2016-12-27 11:19:19', '7' ),
( '61', '11', 'Obá', '<p>Mulher guerreira<br />
Que tem iemanj&aacute;<br />
Como m&atilde;e<br />
E seu pai &eacute; oxal&aacute;<br />
&Eacute; o sagrado feminino<br />
De arma em punho<br />
Para nos proteger<br />
Ob&agrave; Sir&eacute;!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '9', 'T', '2016-12-27 11:23:53', '7', '2016-12-27 11:23:53', '7' ),
( '62', '11', 'Logun Edé', '<p>Salve Logun Ed&eacute;<br />
Herdeiro da beleza<br />
De sua m&atilde;e Oxum<br />
E da ast&uacute;cia de<br />
Seu pai Od&eacute;<br />
Deus da surpresa<br />
E da abund&acirc;ncia<br />
Que a vida trouxe<br />
Loci loci !</p>

<p><br />
Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '10', 'T', '2016-12-27 11:25:18', '7', '2016-12-27 11:25:18', '7' ),
( '63', '11', 'Nanã', '<p>Foi can&ocirc;<br />
A nan&atilde; que<br />
Nin&ocirc; ca&ecirc;<br />
Com noel<br />
E mim&ocirc;<br />
Com mel a<br />
Abelha rainha</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '11', 'T', '2016-12-27 11:27:40', '7', '2016-12-27 11:27:40', '7' ),
( '64', '11', 'Oxumaré', '<p>&Eacute; o arco-&iacute;ris<br />
Aquarelando o<br />
Caminho entre<br />
A terra e o c&eacute;u<br />
Concluindo<br />
Mais um ciclo<br />
Que se foi<br />
Arroboboi!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '12', 'T', '2016-12-27 11:29:20', '7', '2016-12-27 11:29:20', '7' ),
( '65', '11', 'Ossain', '<p>&Eacute; o xam&atilde; que<br />
Te chama para<br />
O baile das<br />
Folhas que<br />
No outono<br />
Dan&ccedil;am ao<br />
Entardecer<br />
Ew&ecirc; ew&ecirc;!</p>

<p>Marina Mara</p>

<p>&nbsp;</p>
', '-15.82039449495235', '-47.87811756134033', '13', 'T', '2016-12-27 11:42:26', '7', '2016-12-27 11:42:26', '7' ),
( '66', '11', 'Omolu', '<p>&Eacute; lava de vulc&atilde;o<br />
Que cura at&eacute; dor<br />
Do cora&ccedil;&atilde;o<br />
&Eacute; o senhor<br />
Da terra que<br />
Est&aacute; onde<br />
Eu estou<br />
Atot&ocirc;!</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '14', 'T', '2016-12-27 11:44:23', '7', '2016-12-27 11:44:23', '7' ),
( '67', '11', 'Ibeji', '<p>Ibeji &eacute; a nossa crian&ccedil;a</p>

<p>Protetora dos sorrisos</p>

<p>Do novo e do melhor</p>

<p>&Eacute; a felicidade de</p>

<p>Estar vivo e a certeza</p>

<p>De nunca estar s&oacute;</p>

<p>Bejir&oacute;&oacute;!</p>

<p>&nbsp;</p>

<p>Marina Mara</p>
', '-15.82039449495235', '-47.87811756134033', '15', 'T', '2016-12-27 12:01:05', '7', '2016-12-27 12:01:05', '7' ),
( '68', '11', '', '', '-15.791673900210926', '-47.88964033126831', '16', 'T', '2016-12-27 12:01:25', '7', '2017-01-25 20:32:50', '4' ),
( '69', '12', 'Áries', '<p>Aconselhar um ariano</p>

<p>&Eacute; jogar seu tempo fora</p>

<p>Ela prefere desafios</p>

<p>Pois seu tempo &eacute; agora</p>
', '-15.69923480567669', '-47.82955884933472', '0', 'T', '2016-12-27 13:08:30', '7', '2016-12-27 13:08:30', '7' ),
( '70', '12', 'Touro', '<p>Touro sozinho</p>

<p>&Eacute; cabe&ccedil;a dura</p>

<p>Acompanhado</p>

<p>&Eacute; cora&ccedil;&atilde;o mole</p>
', '-15.826360776446784', '-47.8734290599823', '1', 'T', '2016-12-27 13:19:26', '7', '2016-12-27 13:19:26', '7' ),
( '71', '12', 'Gêmeos', '<p>G&ecirc;meos tem</p>

<p>Que ser muitos</p>

<p>Para dar conta</p>

<p>De si mesmo</p>
', '-15.763179456408833', '-47.87086486816406', '2', 'T', '2016-12-27 13:20:47', '7', '2016-12-27 13:20:47', '7' ),
( '72', '12', 'Câncer', '<p>Cancerianos</p>

<p>Se sentem</p>

<p>Vivos quando</p>

<p>Morrem de amor</p>
', '-15.861411701823029', '-47.82872200012207', '3', 'T', '2016-12-27 13:24:20', '7', '2016-12-27 13:24:20', '7' ),
( '73', '12', 'Leão', '<p>Leoninos</p>

<p>N&atilde;o se acham</p>

<p>Se encontram</p>

<p>&nbsp;</p>
', '-15.790601743793674', '-47.893009185791016', '4', 'T', '2016-12-27 13:25:22', '7', '2016-12-27 13:25:22', '7' ),
( '74', '12', 'Virgem', '<p>Detalhes nunca</p>

<p>Ser&atilde;o pequenos</p>

<p>Aos olhos de</p>

<p>Um virginiano</p>
', '-15.800223444262933', '-47.90914535522461', '5', 'T', '2016-12-27 13:26:32', '7', '2016-12-27 13:26:32', '7' ),
( '75', '12', 'Libra', '<p>Libra se</p>

<p>Equilibra</p>

<p>Entre mente</p>

<p>E cora&ccedil;&atilde;o</p>
', '-15.82413118320675', '-47.92927265167236', '6', 'T', '2016-12-27 13:29:04', '7', '2016-12-27 13:45:15', '7' ),
( '76', '12', 'Escorpião', '<p>A infidelidade</p>

<p>Para a escorpi&atilde;o</p>

<p>&Eacute; descumprir</p>

<p>As ordens que</p>

<p>V&ecirc;m do cora&ccedil;&atilde;o</p>
', '-15.822856381577687', '-47.83000409603119', '7', 'T', '2016-12-27 13:32:06', '7', '2016-12-27 13:32:06', '7' ),
( '77', '12', 'Sagitário', '<p>Sagitariano</p>

<p>Chega sempre</p>

<p>Onde quer</p>

<p>Pois carrega</p>

<p>Consigo</p>

<p>O foco e a f&eacute;</p>
', '-15.869543967367594', '-47.917213439941406', '8', 'T', '2016-12-27 13:33:09', '7', '2016-12-27 13:33:09', '7' ),
( '78', '12', 'Capricórnio', '<p>Capricorniano</p>

<p>Tem certeza de que</p>

<p>Ter&aacute; d&uacute;vidas</p>
', '-15.800636382550405', '-47.861294746398926', '9', 'T', '2016-12-27 13:36:45', '7', '2016-12-27 13:36:45', '7' ),
( '79', '12', 'Aquário', '<p>As ra&iacute;zes</p>

<p>De aqu&aacute;rio</p>

<p>S&atilde;o suas</p>

<p>Asas</p>

<p>&nbsp;</p>
', '-15.800602831345977', '-47.86729484796524', '10', 'T', '2016-12-27 13:39:13', '7', '2016-12-27 13:39:13', '7' ),
( '80', '12', 'Peixes', '<p>Peixes habita&nbsp;</p>

<p>O mundo da lua</p>

<p>At&eacute; quando</p>

<p>Refletida no mar</p>
', '-15.787483884446706', '-47.899038791656494', '11', 'T', '2016-12-27 13:44:21', '7', '2016-12-27 13:44:21', '7' ),
( '81', '12', '', '', '', '', '12', 'F', '2016-12-27 13:44:38', '7', '2016-12-27 13:44:38', '7' ),
( '82', '13', 'skate, pipas, carroças ou caminhadas. ', '<p><strong>Vadiagem:</strong></p>

<p>Substantivo feminino; ato ou efeito de vadiar.</p>

<p>Ociosidade, vagabundagem.&nbsp;</p>

<p>&nbsp;</p>

<p>No&nbsp;descampado&nbsp;do parano&aacute; pipas voam no c&eacute;u.&nbsp;</p>

<p>Bras&iacute;lia &eacute; constitu&iacute;da por espa&ccedil;os cheios e vazios, convivendo um ao lado do outro. Os espa&ccedil;os vazios se nutrem de res&iacute;duos dos cheios, como nesse lote vago.&nbsp;Entulhos se confudem&nbsp;com tocos de madeira, latinhas ou garrafas se misturando&nbsp;com a grama. F&oacute;sseis por todo ch&atilde;o, sof&aacute;, televis&atilde;o, revistas ou pedrinhas de cascalho.&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="" src="http://imageshack.com/a/img922/5673/0bg6Fu.jpg" style="height:576px; width:768px" /></p>

<p>Texto teste Lotes Vadios</p>
', '-15.767856788002746', '-47.78521656990051', '0', 'T', '2017-01-18 20:06:51', '10', '2017-03-21 13:34:54', '5' ),
( '83', '15', '1 - Praça do Cidadão ', '<p>Come&ccedil;amos em um lugar de reuni&atilde;o,</p>

<p>Aqui voc&ecirc; encontra um cidad&atilde;o</p>

<p>Aquele al&iacute; que faz poesia em Hip Hop com o corpo girando no ch&atilde;o.</p>

<p>Aqui tem esporte, graffiti e inclus&atilde;o</p>

<p>Eventos sociais da periferia,</p>

<p>Tudo feito com paix&atilde;o...</p>

<p>&nbsp;</p>

<p>+</p>

<p><strong><a href="https://www.youtube.com/watch?v=QhhSa9d_zJA">Seja um cidad&atilde;o</a></strong></p>

<p>&nbsp;</p>
', '-15.812642194961104', '-48.10288667678833', '0', 'T', '2017-01-18 20:14:23', '11', '2017-03-21 13:44:24', '5' ),
( '84', '15', '2 - Praça do DI ', '<p>.... Comecei a caminhar, fui parar l&aacute; no DI</p>

<p>Acha-la n&atilde;o &eacute; t&atilde;o dif&iacute;cil assim.</p>

<p>Est&aacute; aqui, emergindo entre as quadras</p>

<p>Se sentindo emoldurada,</p>

<p>Entre lojas e cal&ccedil;adas.</p>

<p>Mas h&aacute; de ter muito</p>

<p>Voc&ecirc; pode conversar, caminhar ou jogar</p>

<p>E at&eacute; de skate andar.</p>

<p>Isso se a rampa, a Administra&ccedil;&atilde;o n&atilde;o derrubar...</p>

<p>&nbsp;</p>

<p>+</p>

<p><strong><a href="https://pt.wikipedia.org/wiki/Praça_do_DI_(Taguatinga)">Pra&ccedil;a do DI</a></strong></p>
', '-15.826587863267166', '-48.0581259727478', '1', 'T', '2017-01-18 20:18:20', '11', '2017-02-27 23:44:50', '11' ),
( '85', '15', '3 - Praça do Relógio', '<p>.... Por falar em Administra&ccedil;&atilde;o, me dirigi para onde ela est&aacute;.</p>

<p>Que horas s&atilde;o?</p>

<p>Poder&aacute; perder o metr&ocirc;</p>

<p>&Eacute; s&oacute; descer a escadinha, chegou!</p>

<p>Olha para cima. &Eacute; um rel&oacute;gio que dita o dia</p>

<p>Da cidade que se movimenta sozinha.</p>

<p>N&atilde;o &eacute; central da Capital, mas t&atilde;o quanto visceral</p>

<p>L&aacute; de cima, um tic tac observando o fluxo</p>

<p>De uma pra&ccedil;a em que muita gente passa...</p>

<p>&nbsp;</p>

<p>+</p>

<p><strong><a href="https://pt.wikipedia.org/wiki/Praça_do_Relógio_(Taguatinga)">Tic Tac Tic Tac...</a></strong></p>

<p>&nbsp;</p>
', '-15.833297131455192', '-48.05690288543701', '2', 'T', '2017-01-18 20:22:22', '11', '2017-02-27 23:45:40', '11' ),
( '86', '15', '4 - Praça dos Cristais', '<p>.... Peguei o &ocirc;nibus para encontrar generais,</p>

<p>Tudo arrumadinho, digno de postais.</p>

<p>De frente para o centro militar, qualquer um aqui transita</p>

<p>Disposto &agrave; uma foto ou simplesmente uma visita.</p>

<p>Muito espa&ccedil;o aqui h&aacute; e sempre&nbsp;tem um&nbsp;recruta para limpar.</p>

<p>Bem no centro dela, n&atilde;o brilha como o ombro dos Oficiais</p>

<p>Mas est&aacute; ali, de concreto, um bando de cristais...</p>

<p>&nbsp;</p>

<p>+</p>

<p><strong><a href="http://jornalismo.iesb.br/2016/03/11/praca-dos-cristais-um-monumento-escondido-na-capital-federal/">os belos cristais de concreto</a></strong></p>

<p>&nbsp;</p>
', '-15.77317415322619', '-47.921204566955566', '3', 'T', '2017-01-18 20:23:48', '11', '2017-02-27 23:46:46', '11' ),
( '87', '15', '5 - Praça do Cruzeiro', '<p>.... Aqui do ladinho andei at&eacute; a cruz</p>

<p>Um elevado na cidade que seduz.</p>

<p>Ao findar o dia, em sua companhia,</p>

<p>Um dos melhores pontos para ver o sol se por.</p>

<p>A primeira missa aqui foi feita. Nenhuma desfeita.</p>

<p>Sentar em paz e olhar, essa &eacute; a Pra&ccedil;a do Cruzeiro</p>

<p>Se bem que, &agrave;s vezes, isso aqui t&aacute; muito cheio...</p>

<p>&nbsp;</p>

<p>+</p>

<p><strong><a href="http://www.brasilianatrilha.com.br/2015/10/por-do-sol-ma-praca-do-cruzeiro.html">Babydoll de Nylon combina com voc&ecirc;....</a></strong></p>

<p>&nbsp;</p>
', '-15.783663925156658', '-47.915239334106445', '4', 'T', '2017-01-18 20:25:37', '11', '2017-02-27 23:47:46', '11' ),
( '88', '14', '', '', '-15.783815835119215', '-47.87818193435669', '0', 'T', '2017-01-18 20:28:53', '5', '2017-03-21 13:42:54', '5' ),
( '89', '15', '6 - Praça dos Prazeres', '<p>.... Levantei, subi, &agrave; Asa Norte me dirigi.</p>

<p>Uma pra&ccedil;a improvisada, j&aacute; &eacute; carnaval</p>

<p>Um balaio de gente</p>

<p>Um novo ponto de foli&otilde;es na Capital.</p>

<p>Foi nomeada &ldquo;Dos Prazeres&rdquo;, claro!</p>

<p>&Eacute; o que voc&ecirc; ganha l&aacute;.</p>

<p>Acabar com o sil&ecirc;ncio chato, ela surgiu em um pequeno espa&ccedil;o para isso.</p>

<p>Uma boa parada pra pular, antes da pra&ccedil;a mais famosa visitar...</p>

<p>&nbsp;</p>

<p>+</p>

<p><strong><a href="http://www.achabrasilia.com/tag/praca-dos-prazeres/">Prazer, pra&ccedil;a.</a></strong></p>

<p>&nbsp;</p>
', '-15.783875573433718', '-47.878447473049164', '5', 'T', '2017-01-18 20:30:07', '11', '2017-02-27 23:48:41', '11' ),
( '90', '15', '7 - Praça dos Três Poderes', '<p>.... Aqui cheguei entre formas e concretos</p>

<p>Que mant&eacute;m essa tr&iacute;ade junta.</p>

<p>Um legisla outro julga e h&aacute; um que executa</p>

<p>Frio, mas belo, &eacute; aqui que o pa&iacute;s se move</p>

<p>De forma peculiar, essa pra&ccedil;a &eacute; mais brasileira do que de Bras&iacute;lia,</p>

<p>Comp&otilde;e toda uma matilha.</p>

<p>Voc&ecirc; pode visitar, comprar um souvenir, quem sabe protestar...</p>

<p>S&oacute; n&atilde;o se incomode com os pombos,</p>

<p>H&aacute; coisas em volta desta pra&ccedil;a, digamos, mais dispostas a sujar.&nbsp;</p>

<p>&nbsp;</p>

<p>+</p>

<p><strong><a href="http://www.soubrasilia.com/brasilia/praca-dos-tres-poderes/">Lesgislativo / Executivo / Judici&aacute;rio</a></strong></p>

<p>&nbsp;</p>
', '-15.800657029442673', '-47.861294746398926', '6', 'T', '2017-01-18 20:31:41', '11', '2017-02-27 23:49:53', '11' ),
( '91', '14', '', '', '-15.784049322735644', '-47.87818059325218', '1', 'T', '2017-01-18 20:38:29', '5', '2017-01-18 20:38:29', '5' ),
( '92', '14', '', '', '-15.784094018308702', '-47.87818729877472', '2', 'T', '2017-01-22 22:05:35', '5', '2017-01-22 22:05:35', '5' ),
( '93', '14', '', '', '-15.784107396869592', '-47.87826910614967', '3', 'T', '2017-01-23 09:00:58', '5', '2017-01-23 09:00:58', '5' ),
( '94', '14', '', '', '-15.784052785676534', '-47.87827916443348', '4', 'T', '2017-01-23 10:06:02', '5', '2017-01-23 10:06:02', '5' ),
( '95', '14', '', '', '-15.784055302139924', '-47.87848234176636', '5', 'T', '2017-01-23 10:07:08', '5', '2017-01-23 10:07:08', '5' ),
( '96', '14', '', '', '-15.783870411283248', '-47.87834823131561', '6', 'T', '2017-01-23 16:05:53', '5', '2017-01-23 16:05:53', '5' ),
( '97', '16', '', '<p><img alt="" src="http://imageshack.com/a/img921/4296/Kx8PdB.jpg" /></p>

<p>Fachada do Balaio Caf&eacute; em 2015.</p>
', '-15.783838491978017', '-47.87844076752663', '0', 'T', '2017-01-23 19:51:09', '5', '2017-03-21 13:44:57', '5' ),
( '98', '16', '', '<p><img alt="" src="http://imagizer.imageshack.us/a/img923/6784/VoDVOg.jpg" /></p>
', '-15.784101761525811', '-47.87850245833397', '1', 'T', '2017-01-23 19:52:37', '5', '2017-03-21 13:45:40', '5' ),
( '99', '16', '', '', '-15.784039815780625', '-47.878362983465195', '2', 'T', '2017-01-23 19:53:20', '5', '2017-01-23 19:53:20', '5' ),
( '100', '16', '', '', '-15.784084167218008', '-47.87832744419575', '3', 'T', '2017-01-23 19:54:26', '5', '2017-01-23 19:54:26', '5' ),
( '101', '16', '', '', '-15.784054484842176', '-47.87816785275936', '4', 'T', '2017-01-23 19:55:37', '5', '2017-01-23 19:55:37', '5' ),
( '102', '16', '', '<p><iframe frameborder="0" height="315" scrolling="no" src="https://www.youtube.com/embed/aP6qft4X1nY" width="560"></iframe></p>
', '-15.783833329826601', '-47.87815645337105', '5', 'T', '2017-01-23 19:56:31', '5', '2017-02-01 18:11:51', '5' ),
( '103', '16', '', '', '-15.783825586599239', '-47.87837103009224', '6', 'T', '2017-01-23 19:57:19', '5', '2017-01-23 19:57:19', '5' ),
( '104', '17', 'Bikish', '<p><img alt="" src="https://c2.staticflickr.com/8/7278/7483290870_3ffca872cb_b.jpg" style="float:left; height:577px; width:1024px" />2012</p>

<p><img alt="" src="http://renatomoll.com.br/wp-content/uploads/2017/01/Trilha_pontos_01.jpg" style="height:294px; width:1042px" /></p>
', '-15.757803102305203', '-47.89330154657364', '0', 'T', '2017-01-23 20:37:05', '13', '2017-03-21 14:00:06', '5' ),
( '105', '17', 'Tortada', '<p><img alt="" src="https://c2.staticflickr.com/6/5097/5561455356_81661119e3_b.jpg" />2011</p>

<p><img alt="" src="https://c1.staticflickr.com/5/4041/4540825947_672021fce7_o.jpg" />2010</p>

<p><img alt="" src="http://renatomoll.com.br/wp-content/uploads/2017/01/Trilha_pontos_02.jpg" /></p>
', '-15.759237068793054', '-47.892993092536926', '1', 'T', '2017-01-23 21:14:10', '13', '2017-03-21 13:55:20', '5' ),
( '106', '13', 'campo de antenas ', '<p>Campos vazios, lugares para antenas. Parecem est&aacute;ticos, esses lugares mas s&atilde;o lugares de fluxo. Fluxo virtual.&nbsp;</p>

<p><u>Paisagens s&atilde;o;</u></p>

<p>espa&ccedil;os urbanos, equipamentos industriais (tratores, f&aacute;bricas, postes e outros), sistemas de abastecimento e armazenamento de energia, autoestradas, artefatos diversos ligados a vida contempor&acirc;nea que colocam novos valores como o da funcionalidade, intensidade, velocidade e mobilidade na experi&ecirc;ncia contempor&acirc;nea.</p>

<p>&nbsp;</p>

<p>Parar, contemplar&nbsp;antenas.&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp; &nbsp;&nbsp;O movimento e a velocidade afirmam-se quase todo tempo como uma presen&ccedil;a urbana. Na cidade atravessada por fluxos e massas, quase se perde a possibilidade de se contemplar. Sempre em a&ccedil;&atilde;o a cidade povoada por m&aacute;quinas, pessoas, luzes, ru&iacute;dos, multiplica seus pontos de vista, o que me permite metamorfosear seus espa&ccedil;os.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', '-15.826608507510912', '-47.98562049865723', '1', 'T', '2017-01-26 16:50:54', '10', '2017-03-21 13:35:21', '5' ),
( '107', '13', 'lago à vista', '<p>Provavelmente, voc&ecirc; conhece o lago parano&aacute;. J&aacute; foi a ermida?</p>

<p>v&aacute; a esse terreno vadio, veja que bela vista, flores do cerrado, lote sem propriet&aacute;rio.&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', '-15.826463997760413', '-47.81977415084839', '2', 'T', '2017-01-26 17:05:04', '10', '2017-03-21 13:39:05', '5' ),
( '108', '17', 'Piratas', '<p><img alt="" src="https://c2.staticflickr.com/2/1198/5130645754_cbfe9a2f4a_b.jpg" /></p>

<p>Renato Moll e Gabrieluan&nbsp;-&nbsp;2011</p>

<p><img alt="" src="http://imageshack.com/a/img922/5272/pL1RIq.jpg" /></p>
', '-15.762554771513303', '-47.89211332798004', '2', 'T', '2017-02-01 00:13:05', '13', '2017-03-21 13:55:52', '5' ),
( '109', '17', 'Onipresente', '<p><img alt="" src="https://c1.staticflickr.com/7/6029/6003441940_87afb5aa48_b.jpg" /></p>

<p>2011</p>

<p><img alt="" src="http://imageshack.com/a/img922/5784/ISIUOh.jpg" /></p>
', '-15.762464424365149', '-47.89209187030792', '3', 'T', '2017-02-01 00:26:33', '13', '2017-02-01 01:07:35', '13' ),
( '110', '17', 'Olhar W3', '<p><img alt="" src="https://c2.staticflickr.com/6/5348/9544300125_5d6170d2b8_o.jpg" /></p>

<p>2013</p>

<p><img alt="" src="http://imageshack.com/a/img923/2598/6PUVa4.jpg" /></p>
', '-15.770510325544738', '-47.8894579410553', '4', 'T', '2017-02-01 00:32:00', '13', '2017-02-01 01:08:06', '13' ),
( '111', '17', 'Hayaya!', '<p><img alt="" src="https://c2.staticflickr.com/8/7149/6565814713_5eb322e45f_b.jpg" /></p>

<p>Tigo e Moll -&nbsp;2011</p>
', '-15.771883543407718', '-47.88840651512146', '5', 'F', '2017-02-01 00:37:23', '13', '2017-02-01 00:37:23', '13' ),
( '112', '17', 'Black Block', '<p><img alt="" src="https://c1.staticflickr.com/3/2848/10144897285_c5a339c7d3_b.jpg" /></p>

<p>2013</p>

<p><img alt="" src="http://imageshack.com/a/img923/2310/fhENkB.jpg" /></p>
', '-15.769126773335373', '-47.885799407958984', '5', 'T', '2017-02-01 00:41:12', '13', '2017-03-21 13:56:21', '5' ),
( '113', '17', 'Ei Moleque', '<p><img alt="" src="https://c1.staticflickr.com/5/4028/4471399638_ae84711862_b.jpg" /></p>

<p>2010</p>

<p><img alt="" src="http://imageshack.com/a/img923/7355/9G1Tka.jpg" /></p>
', '-15.762332775591563', '-47.881880700588226', '6', 'T', '2017-02-01 00:44:28', '13', '2017-02-01 01:10:00', '13' ),
( '114', '17', 'Assalto', '<p><img alt="" src="https://c2.staticflickr.com/8/7002/6427742013_77514d655d_b.jpg" /></p>

<p>2011</p>

<p><img alt="" src="http://imageshack.com/a/img924/1407/qLCqUO.jpg" /></p>
', '-15.76008182648842', '-47.89184510707855', '7', 'T', '2017-02-01 00:49:34', '13', '2017-02-01 01:10:39', '13' ),
( '115', '17', 'Pirulito', '<p><img alt="" src="https://c1.staticflickr.com/7/6131/5989566890_14dac92425_b.jpg" /></p>

<p>2011</p>

<p><img alt="" src="http://imageshack.com/a/img923/2687/OuClK1.jpg" /></p>
', '-15.75741782695488', '-47.893770933151245', '8', 'T', '2017-02-01 00:54:00', '13', '2017-02-01 01:11:14', '13' ),
( '116', '17', 'Cores e Valores', '<p><img alt="" src="https://c1.staticflickr.com/3/2879/13153706914_75fb45c93b_b.jpg" /></p>

<p>2014</p>

<p><img alt="" src="http://imageshack.com/a/img923/8092/uL3HpP.jpg" /></p>
', '-15.750716371273748', '-47.89492964744568', '9', 'T', '2017-02-01 00:57:10', '13', '2017-03-21 14:03:40', '5' ),
( '117', '17', 'Onipresente', '<p><img alt="" src="https://c2.staticflickr.com/8/7032/6440044677_c9415e1eea_b.jpg" /></p>

<p>2011</p>

<p><img alt="" src="http://imageshack.com/a/img922/558/4oLvcv.jpg" /></p>
', '-15.739915100712388', '-47.89506375789642', '10', 'T', '2017-02-01 01:02:36', '13', '2017-02-01 01:12:17', '13' ),
( '118', '18', 'Transversal', '<p style="text-align:justify">o sono frequenta os puteiros da transversal enquanto eu gozo fuma&ccedil;a num resto de papel com algum poema que escrevi ontem. aquele chevette continua queimando e a porra do vizinho n&atilde;o para de repetir a m&uacute;sica do f&aacute;bio j&uacute;nior pro pai. &agrave;s vezes morar s&oacute; pode ser mais deprimente que morar com os pais mas j&aacute; n&atilde;o d&aacute; pra abrir m&atilde;o das visitas que frequentam meu Cafofo imundo. se voc&ecirc; faz um bom trabalho elas nemlembram do cheiro da pia de uma semana ou do frango cru pq acabou o g&aacute;s. faz tr&ecirc;s meses que aquele cara morreu aqui na frente e eu ainda acho que o defeito da cal&ccedil;ada&eacute; sangue. faz tr&ecirc;s meses que eu comprei as plantas que agora morrem. faz tr&ecirc;s mesesque n&atilde;o rola emo&ccedil;&atilde;o na minha vida que n&atilde;o seja minha chefe me chamando pra conversar. hoje de noite vi dois mendigos trepando na sacada do cart&oacute;rio. o amor fode a burocracia.</p>
', '-15.7687412183252', '-47.77776002883911', '0', 'T', '2017-02-01 18:54:39', '8', '2017-03-21 14:05:09', '5' ),
( '119', '18', 'Travesso', '<p>a centr&iacute;fuga da m&aacute;quina de lavar parou de funcionar depois que a gente deixou de transar em cima dela. s&oacute; aceita tri&acirc;ngulos amorosos. disse que sozinho peso demais pra ela que veio com limite de peso de f&aacute;brica. acabou que eu que n&atilde;o acredito em monogamia passei a sentir ci&uacute;mes da atriz porn&ocirc; que tinha os olhos parecidos com os seus. aposto que quando acordo esbaforido voc&ecirc; tem espasmos na perna igual quando eu metia bem fundo. uma vez voc&ecirc; me disse que estamos sempre a procura da mesma pessoa mas eu nunca te procurei. cansei de s&oacute; encontrar conforto no lado do colch&atilde;oque voc&ecirc; mijava logo depois de gozar. at&eacute; hoje carrego Primeiras Est&oacute;rias na mochila na esperan&ccedil;a de entender alguma coisa. ainda abro o whastapp na nossa conversa praver se voc&ecirc; est&aacute; digitando pra mim. seria mais f&aacute;cil se livrar de mim se voc&ecirc; tivesse me tido h&aacute; 20 anos atr&aacute;s. agora eu encrustei que nem o piche do para-lamas do seu carro.n&atilde;o saio nem com querosene. nem se tacar fogo. nem comprando um carro novo. eu sou o filho pr&oacute;digo do seu cu aveludado.</p>

<p>&nbsp;</p>
', '-15.768820291142342', '-47.77957320213318', '1', 'T', '2017-02-01 19:00:41', '8', '2017-03-21 14:06:45', '5' ),
( '120', '18', 'Truvoa', '<p>Melodia</p>

<p>&nbsp;</p>

<p>voc&ecirc; foi embora numa quarta de cinzas</p>

<p>&nbsp;</p>

<p>e os caro&ccedil;os da sua cabe&ccedil;a</p>

<p>&nbsp;</p>

<p>viraram calos nas minhas m&atilde;os</p>

<p>&nbsp;</p>

<p>abri a pasta com os poemas que te fiz</p>

<p>&nbsp;</p>

<p>e cai numa p&aacute;gina que vende escravos sexuais na deep web</p>

<p>&nbsp;</p>

<p>exclu&iacute; seus sambas do meu computador</p>

<p>&nbsp;</p>

<p>o sofrimento que te causei nunca se tornou melodia</p>

<p>&nbsp;</p>

<p>s&oacute; restaram os nudes que mais parecem</p>

<p>&nbsp;</p>

<p>fotos de exames ginecol&oacute;gicos</p>

<p>&nbsp;</p>

<p>e uma suculenta que morre nos excessos</p>

<p>&nbsp;</p>

<p>que nem eu</p>

<p>&nbsp;</p>

<p>bastou uma semana sem gozar no seu cu</p>

<p>&nbsp;</p>
', '-15.776051301624246', '-47.780204862356186', '2', 'T', '2017-02-01 19:02:30', '8', '2017-03-21 14:07:18', '5' ),
( '121', '18', '', '<p>a cama ainda t&aacute; cheia de porra e purpurina</p>

<p>e o macarr&atilde;o de sexta virou pel&uacute;cia na panela</p>

<p>a maconha acabou antes do meu namoro</p>

<p>&nbsp;</p>
', '-15.775743130638114', '-47.779927253723145', '3', 'T', '2017-02-01 19:05:30', '8', '2017-03-21 14:10:04', '5' ),
( '122', '18', '', '<p style="text-align:justify">depois de tr&ecirc;s semanas voltei a cagar algo s&oacute;lido. achei que era o &aacute;lcool mas n&atilde;o parei de beber. tava h&aacute; um tempo s&oacute; na punheta e hoje gastei meus &uacute;ltimos 50 reais&nbsp; darescis&atilde;o com uma travesti brocha. achei pouco profissional ela n&atilde;o ter um viagra na bolsa. dei um trago na sucupira empoeirada e sai sem reclamar. tretar com as primas j&aacute; me rendeu uma cicatriz mas Leonor realmente me amava. uma facada no rosto n&atilde;o &eacute; pra qualquer paix&atilde;ozinha. se ela quisesse me matar tinha jogado &aacute;gua fervendo no ouvido. o problema &eacute; que ela queria andar na rua de m&atilde;os dadas e na &eacute;poca eu n&atilde;opodia aceitar isso, achava que ia acabar com a minha reputa&ccedil;&atilde;o. talvez as coisas fossem diferentes se eu soubesse que j&aacute; n&atilde;o tinha reputa&ccedil;&atilde;o. bons tempos quando as putas disputavam quem ia me dar primeiro. hoje nem lendo uns poemas velhos ganho desconto. des&ccedil;o a principal e vejo um cara disparado cruzando a igreja. trope&ccedil;o nas pedras soltas e meto o joelho no cercado da fonte desativada. uma l&aacute;grima escorre. j&aacute; n&atilde;o sei se &eacute; por conta da porrada. gasto um tempo ali massageando a patela, pesando se n&atilde;o durmo por ali mesmo. mal levanto e levo um enquadro. falo que eles se atrasaram que o cara j&aacute; trepou num pinheiro e meu beque t&aacute; na mente. ganho uns tapas mas dessa vez bem r&aacute;pido. na porta de casa pe&ccedil;o um cigarro do mendigo e ganho dois. acordo com o pastor gritando. entro na igreja decidido. ajoelho e o caraempurra a m&atilde;o na minha cabe&ccedil;a. o balan&ccedil;o com o bafo me fazem vomitar no sapato lustrado dele. a igreja se excita e o pastor manda o papo que tirou meu c&acirc;ncer no p&acirc;ncreas. aceito jesus e agrade&ccedil;o a todos . de manh&atilde; cedinho s&oacute; tem boteco aberto na transversal. a caminhada &eacute; longa pra n&atilde;o conseguir um fiado. entro no mercado e m&oacute;co uma Paratudo no casaco. o seguran&ccedil;a finge que n&atilde;o v&ecirc;. ningu&eacute;m gosta de arrumar confus&atilde;o logo cedo. caio pro lago. nunca aprendi a nadar mas sempre gostei de ficar com os p&eacute;s mergulhados como quem se aquece pra entrar. por medo nunca deixei a &aacute;gua passar da cintura. entro devagar cantarolando Solu&ccedil;os. os arrepios acompanham cada nota desafinada. dou um trago na ponta e s&oacute; solto l&aacute; em baixo. quando j&aacute; n&atilde;o d&aacute; p&eacute;.</p>

<p style="text-align:justify">&nbsp;</p>
', '-15.784671919268972', '-47.78127908706665', '4', 'T', '2017-02-01 19:05:38', '8', '2017-03-21 14:10:29', '5' ),
( '123', '18', '', '<p style="text-align:center">NOSSAS BOCAS</p>

<p style="text-align:center">TROCAM BALAS</p>
', '-15.798516279601055', '-47.80928134918213', '5', 'T', '2017-02-01 19:06:28', '8', '2017-03-21 14:10:44', '5' ),
( '124', '19', '', '<p style="text-align:center"><span style="font-size:28px">REALIZE </span></p>

<p style="text-align:center"><span style="font-size:28px">SEUS </span></p>

<p style="text-align:center"><span style="font-size:28px">MEDOS</span></p>
', '-15.822099797590994', '-47.83049628138542', '0', 'T', '2017-02-01 19:31:23', '8', '2017-03-21 14:12:53', '5' ),
( '125', '20', '', '<p>08/09/2016</p>

<p>voc&ecirc; me falou de uma cidade na &Iacute;ndia onde as pessoas se mudam para esperar a morte. estomorrendo num lugar que tem mais gente por metro quadrado que a &Aacute;sia inteira, Vania. desprezei amores como quem joga fora guimbas de cigarro. pisei em vidas como se limpasse o chinelo sujo de merda na grama e me tornei um homem atr&aacute;s de resigna&ccedil;&atilde;o com este mundo podre. nem Deus pode saber das coisas que eu fiz. lei nenhuma &eacute; t&atilde;o cruel quanto a puni&ccedil;&atilde;o que aplico a mim mesmo. seis anos nesse lugar j&aacute; bastavam. a vida a&iacute; fora n&atilde;o &eacute; t&atilde;o pior. fa&ccedil;o quest&atilde;o de carregar meus dem&ocirc;nios nas costas. quando sair daqui vamos pra ro&ccedil;a. vida simples, plantar nossa comida. nada de asfalto nem pr&eacute;dios. vou voltar a tocar viola e voc&ecirc; vai poder cantar o dia inteiro com sua voz de sabi&aacute; da montanha. &agrave;s vezes esque&ccedil;o seu cheiro e isso me tira o f&ocirc;lego. n&atilde;o est&atilde;o liberando o rem&eacute;dio da press&atilde;o e eu sinto dores terr&iacute;veis nas t&ecirc;mporas. esses dias ouvi Flor da Paisagem num radinho que comprei com alguns ma&ccedil;os de cigarros e juro pra voc&ecirc; que pensei em fazer a Tereza. pensei mesmo, Vania. n&atilde;o fiz porque tiraram os len&ccedil;&oacute;is e os colch&otilde;es da cela. a dire&ccedil;&atilde;o sabe de tudo. a esperan&ccedil;a de que voc&ecirc; ainda me quer &eacute; o que me sustenta. voc&ecirc; ainda me quer? ainda quer ter um filho comigo? vontade de apertar seu bucho leite de saquinho. sentir sua pele macia feito &aacute;gua que circunda pedra decachoeira. seu cangote &eacute; aonde voc&ecirc; mora. espero domingo com a ansiedade dos s&eacute;culos que eu n&atilde;o vivi. voc&ecirc; pode comprar umas coisas pra mim? estou indo embora a qualquermomento. te amo muito...aqui tem acontecido muitas coisas.</p>
', '-15.903277495256456', '-47.8180401921054', '0', 'T', '2017-02-01 19:38:54', '8', '2017-03-21 14:16:14', '5' ),
( '126', '19', '', '<p style="text-align:justify"><span style="font-size:26px">seu</span></p>

<p style="text-align:justify"><span style="font-size:26px">amor dan&ccedil;a</span></p>

<p style="text-align:justify"><span style="font-size:26px">ou</span></p>

<p style="text-align:justify"><span style="font-size:26px">seu</span></p>

<p style="text-align:justify"><span style="font-size:26px">amorda&ccedil;a? </span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:26px">o amor nem &eacute; seu</span></p>
', '', '', '1', 'T', '2017-02-01 19:44:19', '8', '2017-03-21 14:13:26', '5' ),
( '127', '13', 'outras formas', '<p>Aqui, podemos observar um composi&ccedil;&atilde;o de cavaletes feitos de EVA instalados.</p>

<p>Para que servem?</p>

<p>vadiar.</p>

<p>A paisagem&nbsp;</p>

<p style="text-align:justify"><span style="font-size:11.0pt"><span style="font-family:&quot;Times New Roman&quot;">Composta esta a&iacute; e j&aacute; n&atilde;o mais enterrada na natureza, em um modelo universal. paisagens&nbsp;s&atilde;o&nbsp;feitas, criadas e instauradas e, para l&ecirc;-las, &eacute; preciso hesitar, tatear, experimentar, retomar e sempre recome&ccedil;ar. Refrescar continuamente sua composi&ccedil;&atilde;o. </span></span></p>

<p style="text-align:justify"><span style="font-size:11.0pt"><span style="font-family:&quot;Times New Roman&quot;">Sugest&atilde;o:</span></span></p>

<p style="text-align:justify"><span style="font-size:11.0pt"><span style="font-family:&quot;Times New Roman&quot;">fa&ccedil;a </span></span><span style="font-size:11.0pt"><span style="font-family:&quot;Times New Roman&quot;">tamb</span></span><span style="font-size:11.0pt"><span style="font-family:&quot;Times New Roman&quot;">&eacute;m</span></span><span style="font-size:11.0pt"><span style="font-family:&quot;Times New Roman&quot;"> algo aqui.&nbsp;</span></span></p>
', '-15.757206151074383', '-47.8147691488266', '3', 'T', '2017-02-08 15:25:35', '10', '2017-03-21 13:40:49', '5' ),
( '128', '23', '{ 1 } ', '<p>{ start }</p>

<p>&nbsp;</p>

<p>{ end }&nbsp;</p>
', '-15.831893373891543', '-47.801513671875', '0', 'T', '2017-02-09 17:24:21', '4', '2017-03-21 14:17:46', '5' ),
( '129', '13', 'vista 1 ', '', '-15.826629151752558', '-47.98476755619049', '4', 'T', '2017-02-15 22:46:25', '10', '2017-03-21 13:41:13', '5' ),
( '130', '13', 'vista 2. ', '<p>Mais ao sul da cidade. A vista continua composta por antenas, torres, gramado e vazio.&nbsp;</p>

<p>perto a uma subesta&ccedil;&atilde;o de energia Furnas, antenas e mais antenas se espalham, juntando um grande campo vazio que liga o guar&aacute; &agrave; samambaia.</p>

<p>O percurso das antenas pode ser observado no metro, durante a viagem pela janela,&nbsp;</p>
', '-15.87313526953749', '-48.085312843322754', '5', 'T', '2017-02-15 22:54:29', '10', '2017-03-21 13:41:33', '5' ),
( '131', '24', '', '', '-15.792501343186114', '-47.822842597961426', '0', 'F', '2017-02-28 01:00:31', '11', '2017-02-28 01:00:31', '11' ),
( '132', '24', 'Espelho da Alvorada - Espelho de Alice', '<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="" src="https://guia.melhoresdestinos.com.br/system/fotos_local/fotos/2372/show/palacio-da-alvorada.jpg" style="height:332px; width:500px" /></p>

<p>(Pal&aacute;cio da Alvorada)</p>

<p>&nbsp;</p>

<p><strong>Alice atrav&eacute;s do espelho&nbsp; - De Lewis Carroll</strong></p>

<p>Em uma tarde de inverno Alice se sente entediada ao n&atilde;o poder fazer nada al&eacute;m de ficar trancada em casa observando sua gata Dinah dar banho em uma de suas filhotinhas enquanto a outra destr&oacute;i tudo o que v&ecirc; pela frente. Determinada a por fim na bagun&ccedil;a provocada por Kitty, ela d&aacute; uma bronca severa na gatinha ao mesmo tempo em que relata algumas de suas experi&ecirc;ncias no Pa&iacute;s das Maravilhas. Ao narrar tudo aquilo, ela s&oacute; queria poder viver uma aventura nova e diferente, mal sabe ela que por tr&aacute;s do espelho de sua casa h&aacute; um mundo completamente diferente para ser explorado.</p>

<p>Ao chegar no lugar que fica Atrav&eacute;s do Espelho, ela se depara com flores que falam, caminhos que s&oacute; se alcan&ccedil;am se tra&ccedil;ados pelo lado oposto e com figuras que ela j&aacute; conhece h&aacute; muito tempo. Mas diante de tudo o que est&aacute; ao alcance de seus olhos h&aacute; uma coisa que a deixa completamente extasiada: um jogo de xadrez. E esse n&atilde;o &eacute; um simples jogo de tabuleiro, na verdade, ele precisa ser percorrido &agrave; bordo de um trem com paradas estrat&eacute;gicas onde cada pe&ccedil;a est&aacute; localizada, principalmente para aqueles que querem ascender de posi&ccedil;&atilde;o, como &eacute; o caso de Alice que sonha em se torna uma rainha e d&aacute; in&iacute;cio a uma nova aventura.</p>

<p><img alt="" src="https://4.bp.blogspot.com/-ivO_wGiMzHQ/V1RH1xIoQRI/AAAAAAAACnE/1IPibywY87cLrtu5z2KuCCGUzpvElK4lQCKgB/s1600/IMG_7387.JPG" style="height:500px; width:500px" /></p>

<p>&nbsp;</p>
', '-15.792501343186114', '-47.822842597961426', '0', 'T', '2017-02-28 01:14:59', '11', '2017-03-07 17:27:05', '11' ),
( '133', '24', 'Espelho do Itamaraty - Refletindo a Medusa', '<p><img alt="" src="https://inspiringthingsdesign.files.wordpress.com/2011/08/espelho-dagua.jpg?w=640&amp;h=400" style="height:313px; width:500px" /></p>

<p>(Pal&aacute;cio do Itamaraty - Minist&eacute;rio das Rela&ccedil;&otilde;es Exteriores)</p>

<p>&nbsp;</p>

<p><strong>O Mito da Medusa</strong></p>

<p>Simbolicamente, Medusa era tr&aacute;gica, solit&aacute;ria e figura uma mulher incapaz de amar e ser amada, pois odeia os homens por ter sido seduzida e, por outro lado, odeia as mulheres, pois n&atilde;o se conforma em ser um monstro.</p>

<p>Conta o mito que Medusa foi uma sacerdotisa do templo de&nbsp;<a href="https://www.todamateria.com.br/deusa-grega-atena/"><span style="color:#000000">Atena</span></a>&nbsp;(em algumas vers&otilde;es ela j&aacute; era a criatura m&iacute;tica, contudo, ainda n&atilde;o tinha sido amaldi&ccedil;oada).</p>

<p>No entanto, Medusa &eacute; assediada amorosamente por Poseidon, o deus dos mares, cedendo aos seus encantos ao deitar com ele no templo da deusa Atena. Com isso, Atena transforma seu cabelo em serpentes e seu rosto num horr&iacute;vel semblante capaz de transformar em pedra todos que encontram seus olhos.</p>

<p>Assim, Medusa passou a viver na extremidade do ocidental do mundo, junto a entrada do reino dos mortos e, ao redor de seu covil, diversas est&aacute;tuas de pedra de homens e animais -suas v&iacute;timas- adornavam o ambiente.</p>

<p>O her&oacute;i Perseu &eacute; uma figura posteriormente inserida pela mitologia grega. Ele recebe a tarefa de matar Medusa, com o objetivo de entregar ao rei Polidete sua cabe&ccedil;a, para que este a presenteie ao rei de Pisa, &Eacute;nomao, que assim lhe conceder&aacute; a m&atilde;o de sua filha, Hipod&acirc;mia.&nbsp;</p>

<p>Segundo o mito, ela foi decapitada pelo her&oacute;i, o qual lutou com a G&oacute;rgona olhando apenas o seu reflexo no escudo polido.</p>

<p>Ao decapit&aacute;-la, algo inusitado ocorreu: duas criaturas nasceram, pois Medusa estava gr&aacute;vida de Poseidon. Assim, surgiram o cavalo alado P&eacute;gaso e o gigante dourado Crisaor.</p>

<div data-oembed-url="http://www.travelingintuscany.com/images/city/firenze/perseus1700.jpg">
<div style="max-width:320px"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->
<div style="max-width:840px">
<div style="height:0px; left:0px; padding-bottom:73%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="//cdn.iframe.ly/oXUg8k" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>
</div>

<p>(est&aacute;tua&nbsp;de bronze de Perseus, por Benvenuto Cellini&nbsp;- em&nbsp;Piazza della Signoria de Floren&ccedil;a)</p>
', '-15.8000066513249', '-47.86735653877258', '1', 'T', '2017-02-28 01:40:28', '11', '2017-03-07 17:34:11', '11' ),
( '134', '24', 'Espelho do Museu - Reflexo e Retrato', '<div data-oembed-url="http://studioplanoverde.com.br/site/wp-content/uploads/2013/11/copy-of-peixes_no_espelho_dagua1.jpg">
<div style="max-width:320px"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->
<div style="max-width:660px">
<div style="height:0px; left:0px; padding-bottom:66.3636%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="//cdn.iframe.ly/KZMKLP" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>
</div>

<p>(Museu da Rep&uacute;blica)</p>

<p>&nbsp;</p>

<p><strong>O Retrato de Dorian Gray</strong></p>

<p>&nbsp;</p>

<p>Dorian Gray &eacute; um jovem humilde, que acaba de ingressar na alta sociedade inglesa. Por sua beleza fora do normal e uma personalidade doce, gentil e am&aacute;vel, ele torna-se a inspira&ccedil;&atilde;o do pintor Basil Hallward, que resolve retratar um quadro do belo rapaz. Basil &eacute; um artista que est&aacute; impressionado e encantado com a beleza de Dorian; ele acredita que a beleza de Dorian &eacute; respons&aacute;vel pela nova modalidade em sua arte como pintor. Atrav&eacute;s de Basil, Dorian conhece Lord Henry Wotton, e ele logo se encanta com a vis&atilde;o de mundo hedonista do aristocrata: que a beleza e a satisfa&ccedil;&atilde;o sensual s&atilde;o as &uacute;nicas coisas que valem a pena perseguir na vida.</p>

<p>Entendendo que sua beleza ir&aacute; eventualmente desaparecer, Dorian expressa o desejo de vender sua alma, para garantir que o retrato, em vez dele, envelhe&ccedil;a e desapare&ccedil;a. O desejo &eacute; concedido, e Dorian persegue uma vida<span style="color:#000000"> libertina</span> de experi&ecirc;ncias variadas e amorais; enquanto isso seu retrato envelhece e regista todos os pecados que corrompem&nbsp;sua alma.</p>

<div data-oembed-url="http://3.bp.blogspot.com/_dhQ8aqdtQ38/SkT7JyvdXxI/AAAAAAAAAEY/EqMnqHIrbkg/s400/portraitofdoriangrayyk8.jpg">
<div style="max-width:320px"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->
<div style="max-width:375.59999999999997px">
<div style="height:0px; left:0px; padding-bottom:127.7955%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="//cdn.iframe.ly/tzC3vU" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>
</div>

<p>&nbsp;</p>
', '-15.79674440575668', '-47.87865400314331', '2', 'T', '2017-02-28 01:59:16', '11', '2017-03-07 17:35:32', '11' ),
( '135', '24', 'Espelho do Congresso - O reflexo de Bruxas Más', '<div data-oembed-url="http://memoria.ebc.com.br/agenciabrasil/sites/_agenciabrasil/files/gallery_assist/24/gallery_assist690299/AgenciaBrasil070312_JFC3598.JPG">
<div style="max-width:320px"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->
<div style="max-width:3312px">
<div style="height:0px; left:0px; padding-bottom:66.558%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="//cdn.iframe.ly/jScZK0" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>
</div>

<p>(Congresso Nacional)</p>

<p>&nbsp;</p>

<p><strong>A Bruxa&nbsp;M&aacute; da Branca de Neve</strong></p>

<p>A<strong>&nbsp;</strong>Rainha&nbsp;&eacute; a principal antagonista do filme de 1937 da Disney,&nbsp;<em>Branca de Neve&nbsp;e os Sete&nbsp;An&otilde;es</em>&nbsp;e o primeiro vil&atilde;o em uma anima&ccedil;&atilde;o da Disney para os cinemas. Determinada a permanecer como a mais bela de todas, a rainha cria um ci&uacute;me doentio por Branca de Neve, a &uacute;nica cuja beleza supera a sua. Ela finalmente usa magia negra para se transformar em uma bruxa, em uma &uacute;ltima tentativa de acabar com sua rival.&nbsp;Ela pode se comunicar com um Espelho M&aacute;gico, que possivelmente foi criado por ela. Depois &eacute; mostrado que de fato, ela utiliza m&aacute;gia negra e parece entender muito bem sobre o assunto, desde que pode envenenar uma ma&ccedil;&atilde;, para matar Branca de Neve e tamb&eacute;m pode se transformar em uma velha, para enganar a princesa.</p>

<p>O&nbsp;Espelho M&aacute;gico&nbsp;&eacute; um objeto em destaque primeiramente no filme de 1937,&nbsp;dentro do Espelho M&aacute;gico habita o Escravo, um esp&iacute;rito aprisionado (semelhante a uma m&aacute;scara teatral, cercada por fuma&ccedil;a e fogo) que sempre fala a verdade, normalmente em forma de verso.</p>

<p>Curiosidades:&nbsp;</p>

<p>Seu nome&nbsp;original &eacute; &quot;Rainha Grimhilde&quot;, mas na produ&ccedil;&atilde;o da Disney &eacute; chamada apenas de Rainha M&aacute; ou Rainha da Neve.</p>

<p>Na primeira vers&atilde;o dos Irm&atilde;os Grimm do conto de fadas, a Rainha era&nbsp;a m&atilde;e&nbsp;real de Branca de Neve, no&nbsp;entanto, em todas as vers&otilde;es posteriores ela era madrasta da hero&iacute;na, como ela est&aacute; no filme.</p>

<div data-oembed-url="http://www.santacarona.com/wp-content/uploads/2016/05/espelho.png">
<div style="max-width:320px"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->
<div style="max-width:1728px">
<div style="height:0px; left:0px; padding-bottom:75%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="//cdn.iframe.ly/h9WVI0" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>
</div>

<p>(Rainha&nbsp;M&aacute; - Walt Disney 1937)</p>
', '-15.799418212180145', '-47.86494255065918', '3', 'T', '2017-02-28 02:14:12', '11', '2017-03-07 17:39:22', '11' ),
( '136', '24', 'Espelho do Planalto - Afogando-se em sua imagem', '<div data-oembed-url="http://2.bp.blogspot.com/-O2Rg48pe9IM/TjBBj2FD0oI/AAAAAAAABVc/El-84neVVog/s1600/palacio-do-planalto-espelho-dagua.jpg">
<div style="max-width:320px"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->
<div style="max-width:900px">
<div style="height:0px; left:0px; padding-bottom:66.4%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="//cdn.iframe.ly/xnxoKf" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>
</div>

<p>(Pal&aacute;cio do Planalto)</p>

<p>&nbsp;</p>

<p><strong>Mito de Narciso</strong></p>

<p>Narciso era um belo rapaz, filho do deus do rio C&eacute;fiso e da ninfa Lir&iacute;ope. Por ocasi&atilde;o de seu nascimento, seus pais consultaram o or&aacute;culo Tir&eacute;sias para saber qual seria o destino do menino. A resposta foi que ele teria uma longa vida, se nunca visse a pr&oacute;pria face.</p>

<p>Muitas mo&ccedil;as e ninfas apaixonaram-se por Narciso, quando ele chegou &agrave; idade adulta. Por&eacute;m, o belo jovem n&atilde;o se interessava por nenhuma delas. A ninfa Eco, uma das mais apaixonadas, n&atilde;o se conformou com a indiferen&ccedil;a de Narciso e afastou-se amargurada para um lugar deserto, onde definhou at&eacute; que somente restaram dela os gemidos. As mo&ccedil;as desprezadas pediram aos deuses para ving&aacute;-las.</p>

<p>N&ecirc;mesis apiedou-se delas e induziu Narciso, depois de uma ca&ccedil;ada num dia muito quente, a debru&ccedil;ar-se numa fonte para beber &aacute;gua. Descuidando-se de tudo o mais, ele permaneceu im&oacute;vel na contempla&ccedil;&atilde;o ininterrupta de sua face refletida e assim morreu. No pr&oacute;prio submundo de Hades ele tentava ver nas &aacute;guas do Estige as fei&ccedil;&otilde;es pelas quais se apaixonara.</p>

<div data-oembed-url="https://upload.wikimedia.org/wikipedia/commons/8/80/Jan_Cossiers_-_Narciso.jpg">
<div style="max-width:320px"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->
<div style="max-width:3500.4px">
<div style="height:0px; left:0px; padding-bottom:105.2794%; position:relative; width:100%"><iframe allowfullscreen="" frameborder="0" src="//cdn.iframe.ly/wk2197" style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;" tabindex="-1"></iframe></div>
</div>
</div>
</div>

<p>(Narciso - &Oacute;leo sobre&nbsp;tela de&nbsp;Jan Cossiers)</p>
', '-15.799459506210997', '-47.86075830459595', '4', 'T', '2017-02-28 02:22:15', '11', '2017-03-07 17:25:27', '11' ),
( '137', '4', 'teste last poi', '<p>testes poi remove</p>
', '-15.506619106633572', '-47.9058837890625', '1', 'F', '2017-04-05 17:47:22', '4', '2017-04-05 17:49:01', '4' );
-- ---------------------------------------------------------


-- Dump data of "t_pois_archive" ---------------------------
-- ---------------------------------------------------------


-- Dump data of "t_reports" --------------------------------
INSERT INTO `t_reports`(`id`,`f_description`,`f_email`,`f_track`,`f_poi`,`is_active`,`created_on`,`created_by`,`modified_on`,`modified_by`) VALUES 
( '1', '123_testando', 'dedebf@gmail.com', '10', '1', 'T', '2017-04-18 13:11:45', NULL, '2017-04-18 13:12:06', NULL ),
( '2', 'Lotes Vadios/r/nundefined/r/nTipo da denuncia: c/r/nConteúdo: asdfasdf/r/n', 'userEmail@gmail.com', '13', NULL, 'T', '2017-04-19 17:16:10', NULL, '2017-04-19 17:17:37', NULL ),
( '3', 'Lotes Vadios/r/nundefined/r/nTipo da denuncia: f/r/nConteúdo: aaaaaaaaaaaaaaaaaaaaaaaaa/r/n', 'userEmail@gmail.com', '13', NULL, 'T', '2017-04-19 17:19:11', NULL, '2017-04-19 17:19:11', NULL );
-- ---------------------------------------------------------


-- Dump data of "t_reports_archive" ------------------------
-- ---------------------------------------------------------


-- Dump data of "t_tags" -----------------------------------
INSERT INTO `t_tags`(`id`,`f_name`,`is_active`,`created_on`,`created_by`,`modified_on`,`modified_by`) VALUES 
( '1', 'teste', 'T', '2016-11-17 18:35:01', '3', '2016-11-19 14:55:35', '4' ),
( '2', 'oi', 'T', '2016-11-17 18:35:01', '3', '2016-11-17 19:06:17', '3' ),
( '3', 'trilha de teste', 'T', '2016-11-19 14:50:56', '4', '2016-11-19 14:50:56', '4' ),
( '4', 'poesia', 'T', '2016-11-21 10:19:37', '5', '2017-01-31 15:53:19', '7' ),
( '5', 'coisas pequeninas ', 'T', '2016-11-21 10:19:37', '5', '2016-11-21 10:19:37', '5' ),
( '6', 'asa norte', 'T', '2016-11-21 10:19:37', '5', '2017-01-18 20:06:43', '5' ),
( '7', 'unb', 'T', '2016-11-21 10:19:37', '5', '2016-12-20 16:38:19', '5' ),
( '8', 'poema', 'T', '2016-11-28 21:35:57', '5', '2016-12-20 16:38:19', '5' ),
( '9', 'poemas', 'T', '2016-11-28 21:35:57', '5', '2016-12-20 16:38:19', '5' ),
( '10', 'brasília', 'T', '2016-11-29 01:18:40', '5', '2017-02-01 01:13:33', '13' ),
( '11', 'arquitetura', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '12', 'turismo', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '13', 'piloto', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '14', 'asa sul', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '15', 'plano piloto', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '16', 'niemeyer', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '17', 'lucio costa', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '18', 'burle marx', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '19', 'teste 123', 'T', '2016-11-29 11:38:08', '4', '2016-11-29 11:38:08', '4' ),
( '20', 'tag trilha teste', 'T', '2016-11-29 11:38:08', '4', '2016-11-29 11:38:08', '4' ),
( '21', 'fora da ordem', 'T', '2016-12-12 21:22:17', '6', '2016-12-12 21:22:17', '6' ),
( '22', ' poéticas fora da ordem', 'T', '2016-12-12 21:22:17', '6', '2016-12-12 21:22:17', '6' ),
( '23', 'vinicius borba', 'T', '2016-12-12 21:22:17', '6', '2016-12-12 21:22:17', '6' ),
( '24', 'são sebas', 'T', '2016-12-12 21:22:17', '6', '2016-12-12 21:22:17', '6' ),
( '25', 'são sebastião', 'T', '2016-12-12 21:22:17', '6', '2016-12-12 21:22:17', '6' ),
( '26', 'plano pilatos', 'T', '2016-12-12 21:22:17', '6', '2016-12-12 21:22:17', '6' ),
( '27', 'trilhas', 'T', '2016-12-12 21:22:17', '6', '2016-12-12 21:22:17', '6' ),
( '28', 'radicais livres s/a', 'T', '2016-12-12 21:22:17', '6', '2016-12-12 21:22:17', '6' ),
( '29', 'construção de brasília', 'T', '2016-12-18 21:52:32', '7', '2017-01-31 15:53:19', '7' ),
( '30', 'ai5', 'T', '2016-12-18 21:52:32', '7', '2017-01-31 15:53:19', '7' ),
( '31', 'ditadura militar', 'T', '2016-12-18 21:52:32', '7', '2017-01-31 15:53:19', '7' ),
( '32', 'históras de terror em brasília', 'T', '2016-12-18 21:52:32', '7', '2017-01-31 15:53:19', '7' ),
( '33', 'marina mara', 'T', '2016-12-18 21:52:32', '7', '2017-01-31 15:53:19', '7' ),
( '34', 'tutorial', 'T', '2016-12-20 17:49:48', '5', '2016-12-20 17:49:48', '5' ),
( '35', 'trilhas poéticas', 'T', '2016-12-20 17:49:48', '5', '2016-12-20 17:49:48', '5' ),
( '36', 'listen!', 'T', '2016-12-20 17:49:48', '5', '2016-12-20 17:49:48', '5' ),
( '37', 'orixás', 'T', '2016-12-27 10:38:44', '7', '2017-01-31 15:52:18', '7' ),
( '38', 'poesia de marina mara', 'T', '2016-12-27 10:38:44', '7', '2017-01-31 15:52:18', '7' ),
( '39', 'intolerância religiosa', 'T', '2016-12-27 10:38:44', '7', '2017-01-31 15:52:18', '7' ),
( '40', 'prainha', 'T', '2016-12-27 10:38:44', '7', '2017-01-31 15:52:18', '7' ),
( '41', 'praça dos orixás', 'T', '2016-12-27 10:38:44', '7', '2017-01-31 15:52:18', '7' ),
( '42', 'balaio vive', 'T', '2017-01-18 20:06:43', '5', '2017-01-23 19:50:22', '5' ),
( '43', 'praça dos prazeres', 'T', '2017-01-18 20:06:43', '5', '2017-01-23 19:50:22', '5' ),
( '44', 'lounge poético', 'T', '2017-01-18 20:06:43', '5', '2017-01-23 19:50:22', '5' ),
( '45', 'praça', 'T', '2017-01-18 20:09:14', '11', '2017-01-18 20:15:31', '11' ),
( '46', 'trilha', 'T', '2017-01-18 20:09:14', '11', '2017-01-18 20:15:31', '11' ),
( '47', 'distritofederal', 'T', '2017-01-18 20:09:14', '11', '2017-01-18 20:15:31', '11' ),
( '48', 'desbravar', 'T', '2017-01-18 20:09:14', '11', '2017-01-18 20:15:31', '11' ),
( '49', 'balaio café', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5' ),
( '50', 'declamação', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5' ),
( '51', '#passado', 'T', '2017-01-23 20:21:07', '13', '2017-01-23 21:16:00', '13' ),
( '52', 'renatomoll', 'T', '2017-01-31 23:28:45', '13', '2017-02-01 01:13:33', '13' ),
( '53', 'trilha01', 'T', '2017-01-31 23:28:45', '13', '2017-02-01 01:13:33', '13' ),
( '54', 'mundotela', 'T', '2017-01-31 23:28:45', '13', '2017-02-01 01:13:33', '13' ),
( '55', 'brasil', 'T', '2017-01-31 23:28:45', '13', '2017-02-01 01:13:33', '13' ),
( '56', 'arteurbana', 'T', '2017-01-31 23:28:45', '13', '2017-02-01 01:13:33', '13' ),
( '57', 'graffiti', 'T', '2017-01-31 23:28:45', '13', '2017-02-01 01:13:33', '13' ),
( '58', 'passado', 'T', '2017-01-31 23:28:45', '13', '2017-02-01 01:13:33', '13' ),
( '59', 'df', 'T', '2017-01-31 23:28:45', '13', '2017-02-01 01:13:33', '13' ),
( '60', '{ }', 'T', '2017-02-09 17:23:41', '4', '2017-02-09 17:23:41', '4' ),
( '61', 'espelho', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '62', 'palácios', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '63', 'ministérios', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '64', 'interior', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '65', 'reflexo', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '66', 'refletir', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '67', 'histórias', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '68', 'mitos', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' );
-- ---------------------------------------------------------


-- Dump data of "t_tags_archive" ---------------------------
-- ---------------------------------------------------------


-- Dump data of "t_track_pois" -----------------------------
-- ---------------------------------------------------------


-- Dump data of "t_track_pois_archive" ---------------------
-- ---------------------------------------------------------


-- Dump data of "t_track_ratings" --------------------------
INSERT INTO `t_track_ratings`(`id`,`f_score`,`f_track`,`is_active`,`created_on`,`created_by`,`modified_on`,`modified_by`,`f_feedback`,`f_email`) VALUES 
( '1', '1', '4', 'T', '2017-04-13 13:47:13', '4', '2017-04-13 13:47:13', '4', '', 'dedebf@gmail.com' ),
( '2', '1', '5', 'T', '2017-04-13 15:31:27', NULL, '2017-04-13 15:31:27', NULL, NULL, 'dedebf@gmail.com' );
-- ---------------------------------------------------------


-- Dump data of "t_track_ratings_archive" ------------------
-- ---------------------------------------------------------


-- Dump data of "t_track_tags" -----------------------------
INSERT INTO `t_track_tags`(`id`,`f_track`,`f_tag`,`is_active`,`created_on`,`created_by`,`modified_on`,`modified_by`) VALUES 
( '1', '2', '1', 'T', '2016-11-17 18:35:01', '3', '2016-11-17 18:35:01', '3' ),
( '2', '2', '2', 'T', '2016-11-17 18:35:01', '3', '2016-11-17 18:35:01', '3' ),
( '3', '3', '2', 'T', '2016-11-17 19:06:17', '3', '2016-11-17 19:06:17', '3' ),
( '7', '5', '4', 'T', '2016-11-21 10:19:37', '5', '2016-11-21 10:19:37', '5' ),
( '8', '5', '5', 'T', '2016-11-21 10:19:37', '5', '2016-11-21 10:19:37', '5' ),
( '9', '5', '6', 'T', '2016-11-21 10:19:37', '5', '2016-11-21 10:19:37', '5' ),
( '10', '5', '7', 'T', '2016-11-21 10:19:37', '5', '2016-11-21 10:19:37', '5' ),
( '16', '7', '10', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '17', '7', '4', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '18', '7', '11', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '19', '7', '12', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '20', '7', '13', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '21', '7', '14', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '22', '7', '15', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '23', '7', '16', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '24', '7', '17', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '25', '7', '18', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5' ),
( '26', '4', '19', 'T', '2016-11-29 11:38:08', '4', '2016-11-29 11:38:08', '4' ),
( '27', '4', '20', 'T', '2016-11-29 11:38:08', '4', '2016-11-29 11:38:08', '4' ),
( '50', '6', '4', 'T', '2016-12-20 16:38:19', '5', '2016-12-20 16:38:19', '5' ),
( '51', '6', '6', 'T', '2016-12-20 16:38:19', '5', '2016-12-20 16:38:19', '5' ),
( '52', '6', '7', 'T', '2016-12-20 16:38:19', '5', '2016-12-20 16:38:19', '5' ),
( '53', '6', '8', 'T', '2016-12-20 16:38:19', '5', '2016-12-20 16:38:19', '5' ),
( '54', '6', '9', 'T', '2016-12-20 16:38:19', '5', '2016-12-20 16:38:19', '5' ),
( '55', '10', '34', 'T', '2016-12-20 17:49:48', '5', '2016-12-20 17:49:48', '5' ),
( '56', '10', '35', 'T', '2016-12-20 17:49:48', '5', '2016-12-20 17:49:48', '5' ),
( '57', '10', '36', 'T', '2016-12-20 17:49:48', '5', '2016-12-20 17:49:48', '5' ),
( '91', '14', '42', 'T', '2017-01-18 20:06:43', '5', '2017-01-18 20:06:43', '5' ),
( '92', '14', '43', 'T', '2017-01-18 20:06:43', '5', '2017-01-18 20:06:43', '5' ),
( '93', '14', '6', 'T', '2017-01-18 20:06:43', '5', '2017-01-18 20:06:43', '5' ),
( '94', '14', '4', 'T', '2017-01-18 20:06:43', '5', '2017-01-18 20:06:43', '5' ),
( '95', '14', '44', 'T', '2017-01-18 20:06:43', '5', '2017-01-18 20:06:43', '5' ),
( '102', '15', '45', 'T', '2017-01-18 20:15:31', '11', '2017-01-18 20:15:31', '11' ),
( '103', '15', '46', 'T', '2017-01-18 20:15:31', '11', '2017-01-18 20:15:31', '11' ),
( '104', '15', '47', 'T', '2017-01-18 20:15:31', '11', '2017-01-18 20:15:31', '11' ),
( '105', '15', '10', 'T', '2017-01-18 20:15:31', '11', '2017-01-18 20:15:31', '11' ),
( '106', '15', '4', 'T', '2017-01-18 20:15:31', '11', '2017-01-18 20:15:31', '11' ),
( '107', '15', '48', 'T', '2017-01-18 20:15:31', '11', '2017-01-18 20:15:31', '11' ),
( '108', '16', '42', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5' ),
( '109', '16', '4', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5' ),
( '110', '16', '44', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5' ),
( '111', '16', '49', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5' ),
( '112', '16', '43', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5' ),
( '113', '16', '50', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5' ),
( '117', '11', '37', 'T', '2017-01-31 15:52:18', '7', '2017-01-31 15:52:18', '7' ),
( '118', '11', '38', 'T', '2017-01-31 15:52:18', '7', '2017-01-31 15:52:18', '7' ),
( '119', '11', '39', 'T', '2017-01-31 15:52:18', '7', '2017-01-31 15:52:18', '7' ),
( '120', '11', '40', 'T', '2017-01-31 15:52:18', '7', '2017-01-31 15:52:18', '7' ),
( '121', '11', '41', 'T', '2017-01-31 15:52:18', '7', '2017-01-31 15:52:18', '7' ),
( '128', '9', '29', 'T', '2017-01-31 15:53:19', '7', '2017-01-31 15:53:19', '7' ),
( '129', '9', '30', 'T', '2017-01-31 15:53:19', '7', '2017-01-31 15:53:19', '7' ),
( '130', '9', '31', 'T', '2017-01-31 15:53:19', '7', '2017-01-31 15:53:19', '7' ),
( '131', '9', '4', 'T', '2017-01-31 15:53:19', '7', '2017-01-31 15:53:19', '7' ),
( '132', '9', '32', 'T', '2017-01-31 15:53:19', '7', '2017-01-31 15:53:19', '7' ),
( '133', '9', '33', 'T', '2017-01-31 15:53:19', '7', '2017-01-31 15:53:19', '7' ),
( '143', '17', '52', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '144', '17', '53', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '145', '17', '54', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '146', '17', '10', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '147', '17', '55', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '148', '17', '56', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '149', '17', '57', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '150', '17', '58', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '151', '17', '59', 'T', '2017-02-01 01:13:33', '13', '2017-02-01 01:13:33', '13' ),
( '152', '23', '60', 'T', '2017-02-09 17:23:41', '4', '2017-02-09 17:23:41', '4' ),
( '153', '24', '61', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '154', '24', '62', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '155', '24', '63', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '156', '24', '64', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '157', '24', '65', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '158', '24', '66', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '159', '24', '67', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' ),
( '160', '24', '68', 'T', '2017-02-28 01:42:08', '11', '2017-02-28 01:42:08', '11' );
-- ---------------------------------------------------------


-- Dump data of "t_track_tags_archive" ---------------------
-- ---------------------------------------------------------


-- Dump data of "t_tracks" ---------------------------------
INSERT INTO `t_tracks`(`id`,`f_name`,`f_parental_rating`,`f_owner`,`f_create_date`,`f_icon`,`is_active`,`created_on`,`created_by`,`modified_on`,`modified_by`,`f_description`) VALUES 
( '1', 'Zambô!', '3', '1', '2016-11-17 16:48:50', 't_tracks.f_icon.b974bb0062dbe748.31302d616d617a696e672d6f70746963616c2d696c6c7573696f6e732d38393735332e6a7067.jpg', 'T', '2016-11-17 16:48:50', '1', '2017-02-05 11:02:37', '1', 'Um passeio no mundo livre á é ã ç' ),
( '2', 'Primeira trilha mobile', '7', '3', '2016-11-17 18:35:01', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2016-11-17 18:35:01', '3', '2016-11-17 18:35:01', '3', 'Teste da primeira trilha mobile' ),
( '3', 'trilha no desk', '5', '3', '2016-11-17 19:06:17', 't_tracks.f_icon.87bd5cefb5a5dcb3.31343639313132335f3633343538333837333336383838305f353635373630373134333136373337323535365f6e2e706e67.png', 'T', '2016-11-17 19:06:17', '3', '2016-11-17 19:06:17', '3', 'Ma oi' ),
( '4', 'Trilhas teste', '3', '4', '2016-11-19 14:50:56', 't_tracks.f_icon.892c415eab85b643.333232323734362e6a7067.jpg', 'T', '2016-11-19 14:50:56', '4', '2016-11-29 11:38:08', '4', 'Trilha de teste' ),
( '5', 'Trilha das coisas pequeninas', '5', '5', '2016-11-21 10:19:37', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'F', '2016-11-21 10:19:37', '5', '2016-11-21 10:19:37', '5', 'Um passeio pela bucólica Asa Norte com as lentes que desvelam as coisas pequeninas do dia-a-dia' ),
( '6', 'Trilha das coisas pequeninas', '4', '5', '2016-11-28 21:35:57', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2016-11-28 21:35:57', '5', '2016-12-20 16:38:19', '5', 'Um passeio pela bucólica Asa Norte com as lentes que desvelam as coisas pequeninas do dia-a-dia' ),
( '7', 'Trilha do piloto', '3', '5', '2016-11-29 01:18:40', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2016-11-29 01:18:40', '5', '2016-11-29 01:18:40', '5', 'O protagonista aqui é a superquadra modelo de Brasília. A arte fica por conta dos idealizadores do Plano Piloto: Lucio Costa, Burle Marx, Oscar Niemeyer dentre outros.' ),
( '8', 'Poéticas Fora da Ordem - DF', '3', '6', '2016-12-12 21:22:17', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2016-12-12 21:22:17', '6', '2017-02-04 17:49:08', '6', 'Poéticas Fora da Ordem são inspirações da resistência de Vinicius Borba em sua lombra calanga em pleno faroeste caboclo. Discutindo essências, aparências e as diversas faces dos podres poderes, o poeta desconstrói visões e preconceitos, debate direitos humanos e direitos dos manos e segue na construção da identidade periférica enquanto vive a insana ilha da fantasia, de fora pra dentro, Fora da Ordem.' ),
( '9', 'Mitologia de Brasília', '6', '7', '2016-12-18 21:52:32', 't_tracks.f_icon.8e76be7b45ac54cb.5472696c6861204d69746f6c6f6769612064652042726173c3ad6c69612e6a7067.jpg', 'T', '2016-12-18 21:52:32', '7', '2017-01-31 15:53:19', '7', 'O terror fantástico, o lirismo irônico e os personagens fictícios se misturam a fatos reais para contar parte da história de Brasília. Os nove minicontos a seguir têm como cenário o bar Beirute, a tesourinha, a Babilônia, o Santuário dos Pajés, a rodoviária do Plano Piloto, entre outros. Os fatos ficcionais de terror são - ironicamente -  menos assustadores que os fatos históricos citados nesta obra, relembrando parte “surreal” de nossa história sociopolítica. Boa trilha!' ),
( '10', 'Tutorial', '3', '5', '2016-12-20 17:49:48', 't_tracks.f_icon.ac2ed3cd32b9f43a.6d61737465725f73776f72645f666f725f6d696e6563726166745f315f325f355f5f746578747572655f7061636b5f5f62795f636f6e7864656d697874612d643536706737672e706e67.png', 'T', '2016-12-20 17:49:48', '5', '2016-12-20 17:49:48', '5', 'It\'s dangerous to go outside. Here, take this!' ),
( '11', 'Trilha dos Orixás', '3', '7', '2016-12-27 10:38:44', 't_tracks.f_icon.85f0999177415db7.5472696c686120646f73204f726978c3a1732e6a7067.jpg', 'T', '2016-12-27 10:38:44', '7', '2017-01-31 15:52:18', '7', 'A Trilha dos Orixás é curta mas tem uma longa história de ancestralidade, amor e luta para nos contar. Nossa trilha é dentro da Praça dos Orixás, a nossa Prainha que fica às margens do Lago Paranoá, ao lado da ponte Honestino Guimarães, Asa Sul. A Prainha é um lindo ponto turístico da ciadade, mas acima de tudo, o local é um ponto de celebração das religiões de matriz africana. O mais belo e o que mais sofre com a intolerância religiosa de gente sem Deus no coração.  A Praça dos Orixás foi atacada por vândalos diversas vezes, sendo que em 2006 teve quatro estátuas arrancadas de seus pedestais. Em 2009 a praça foi restaurada e reaberta ao público. Ela foi reinaugurada exibindo 16 estátuas de orixás de autoria do artista plástico baiano Tatti Moreno e na nossa trilha, cada estátua ganhou um poema da poeta brasiliense Marina Mara.' ),
( '12', 'Trilha dos Signos', '3', '7', '2016-12-27 13:00:52', 't_tracks.f_icon.9df44ccc544adea7.5472696c686120646f73205369676e6f732e6a7067.jpg', 'T', '2016-12-27 13:00:52', '7', '2016-12-27 13:47:23', '7', 'Se lugares tivessem signos, onde estaria áries em Brasília? Qual signo combinaria com a saudosa piscina de ondas do Pitón (Parque da Cidade)? O pilhado sagitário estaria no CONIC (Setor de Diversões Sul)? E escorpião, peixes, onde estariam? Conheçam a Trilha dos Signos, um passeio pela cidade, pelos astros, planetas e pela delícia de sermos quem somos.   Com amor,  Marina Mara  (ariana+escorpião)' ),
( '13', 'Lotes Vadios', '3', '10', '2017-01-18 19:55:19', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2017-01-18 19:55:19', '10', '2017-02-15 22:40:22', '10', 'Os caminhos apontados nessas trilha são; lugares desocupados onde coisas acontecem, pequenos acontecimentos nos lotes vazios inscrevem algumas paisagens. Brasília a cidade onde sempre se vê o horizonte. ' ),
( '14', 'Trilha dos prazeres', '3', '5', '2017-01-18 20:06:43', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'F', '2017-01-18 20:06:43', '5', '2017-01-18 20:06:43', '5', 'Tombamento virtual da Praça dos Prazeres, território artístico-espiritual da liberdade, da boemia e da poesia.' ),
( '15', 'Traçando Praças', '3', '11', '2017-01-18 20:09:14', 't_tracks.f_icon.9fb374bb60c77363.32303136303532323138343233382e6a7067.jpg', 'T', '2017-01-18 20:09:14', '11', '2017-01-18 20:15:31', '11', 'A trilha das praças foi idealizada para ser percorrida e entendida, apreciada e escavada. Em cada ponto se acha uma poesia que traça o perfil do local, pode-se seguir na ordem para ter o texto integral ou montar seus pedaços depois. Algumas das praças são menos "famosas" do que outras, e vale a pena a visita.' ),
( '16', 'Trilha dos prazeres', '3', '5', '2017-01-23 19:50:22', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2017-01-23 19:50:22', '5', '2017-01-23 19:50:22', '5', 'Tombamento virtual da Praça dos Prazeres, território artístico-espiritual da liberdade, da boemia e da poesia. Os sete pontos são os sete pilares que delimitam o terreiro virtual dos nosso trabalhos poéticos.' ),
( '17', 'No Mundo Tela', '7', '13', '2017-01-23 20:21:07', 't_tracks.f_icon.b16e860b7487b6c7.393534343330303132355f356436313730643262385f6f2e6a7067.jpg', 'T', '2017-01-23 20:21:07', '13', '2017-02-01 01:13:33', '13', 'Esse caminho vai te levar a lugares que já existiram:  o passeio te conduzirá por um percurso de pinturas antigas, ou nem tanto, que já não estão mais visíveis a olho nu, mas que ainda entranham a história material das ruas de Brasília. As obras registradas nos espaços, são do artista Renato Moll e ajudam a traçar virtualmente o caminho do autor, e a vivência pela sua cidade natal.' ),
( '18', 'avenida transversal', '3', '8', '2017-02-01 18:49:17', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2017-02-01 18:49:17', '8', '2017-02-01 19:40:41', '8', 'romances pequenos e outros poemas' ),
( '19', '', '3', '8', '2017-02-01 19:29:47', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2017-02-01 19:29:47', '8', '2017-03-21 14:14:36', '5', '' ),
( '20', '08̣/09/2016', '3', '8', '2017-02-01 19:36:00', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2017-02-01 19:36:00', '8', '2017-02-01 20:02:21', '8', 'aqui tem acontecido muitas coisas' ),
( '21', 'Pôr-se ao sol', '3', '16', '2017-02-02 00:11:45', 't_tracks.f_icon.872a82606d19bb77.31363137343737395f313333393334393436393434393736375f363531333239383837353039333235303137355f6e2e6a7067.jpg', 'T', '2017-02-02 00:11:45', '16', '2017-02-02 00:11:45', '16', 'Aí... so(u)l!' ),
( '22', '', '3', '8', '2017-02-02 10:00:16', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'T', '2017-02-02 10:00:16', '8', '2017-02-02 10:00:16', '8', '' ),
( '23', '{ } ', '3', '4', '2017-02-09 17:23:41', 't_tracks.f_icon.b288bd4d11698af0.64656661756c745f69636f6e5f747261636b2e706e67.png', 'F', '2017-02-09 17:23:41', '4', '2017-02-09 17:23:41', '4', '{ }' ),
( '24', 'Trilha dos espelhos', '4', '11', '2017-02-28 00:05:12', 't_tracks.f_icon.94e307e3d036d95c.6361726176616767696f2d6e61726369736f2e6a7067.jpg', 'T', '2017-02-28 00:05:12', '11', '2017-02-28 01:42:08', '11', 'Você já se olhou hoje? Você pode ter parado em frente ao espelho para ajeitar-se mas, você se olhou hoje?
Pelos muitos monumentos da cidade existem os ditos espelhos d\'água, que circundam, enfeitam e ostentam como se fosse acima de suas águas, um poder que emerge.
Assim como o mitológico Narciso, deixe seu reflexo por entre esses marcos te guiar, observe cada arquitetura nela refletida e perceba que a melhor das estruturas irá encontrar ao se olhar.
Cada ponto traz consigo um momento marcante de, podemos dizer, reflexão?
Cada local percorrido uma relação do ser humano com seu próprio reflexo. Quem sabe servindo para você, explorador dessa trilha, olhar dessa vez mais para dentro de si do que estás a ver em seu exterior refletido nas águas.' );
-- ---------------------------------------------------------


-- Dump data of "t_tracks_archive" -------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "user_id__idx" ---------------------------------
CREATE INDEX `user_id__idx` USING BTREE ON `auth_cas`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "user_id__idx" ---------------------------------
CREATE INDEX `user_id__idx` USING BTREE ON `auth_event`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "group_id__idx" --------------------------------
CREATE INDEX `group_id__idx` USING BTREE ON `auth_membership`( `group_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "user_id__idx" ---------------------------------
CREATE INDEX `user_id__idx` USING BTREE ON `auth_membership`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "group_id__idx" --------------------------------
CREATE INDEX `group_id__idx` USING BTREE ON `auth_permission`( `group_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_parental_ratings`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_parental_ratings`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_parental_ratings_archive`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "current_record__idx" --------------------------
CREATE INDEX `current_record__idx` USING BTREE ON `t_parental_ratings_archive`( `current_record` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_parental_ratings_archive`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_pois`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_pois`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_pois`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_pois_archive`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "current_record__idx" --------------------------
CREATE INDEX `current_record__idx` USING BTREE ON `t_pois_archive`( `current_record` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_pois_archive`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_pois_archive`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_reports`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_poi__idx" -----------------------------------
CREATE INDEX `f_poi__idx` USING BTREE ON `t_reports`( `f_poi` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_reports`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_reports`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_reports_archive`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "current_record__idx" --------------------------
CREATE INDEX `current_record__idx` USING BTREE ON `t_reports_archive`( `current_record` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_owner__idx" ---------------------------------
CREATE INDEX `f_owner__idx` USING BTREE ON `t_reports_archive`( `f_owner` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_parental_rating__idx" -----------------------
CREATE INDEX `f_parental_rating__idx` USING BTREE ON `t_reports_archive`( `f_parental_rating` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_reports_archive`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_tags`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_tags`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_tags_archive`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "current_record__idx" --------------------------
CREATE INDEX `current_record__idx` USING BTREE ON `t_tags_archive`( `current_record` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_tags_archive`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_track_pois`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_poi__idx" -----------------------------------
CREATE INDEX `f_poi__idx` USING BTREE ON `t_track_pois`( `f_poi` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_track_pois`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_track_pois`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_track_pois_archive`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "current_record__idx" --------------------------
CREATE INDEX `current_record__idx` USING BTREE ON `t_track_pois_archive`( `current_record` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_poi__idx" -----------------------------------
CREATE INDEX `f_poi__idx` USING BTREE ON `t_track_pois_archive`( `f_poi` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_track_pois_archive`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_track_pois_archive`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_track_ratings`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_track_ratings`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_track_ratings`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_track_ratings_archive`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "current_record__idx" --------------------------
CREATE INDEX `current_record__idx` USING BTREE ON `t_track_ratings_archive`( `current_record` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_track_ratings_archive`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_track_ratings_archive`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_track_tags`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_tag__idx" -----------------------------------
CREATE INDEX `f_tag__idx` USING BTREE ON `t_track_tags`( `f_tag` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_track_tags`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_track_tags`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_track_tags_archive`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "current_record__idx" --------------------------
CREATE INDEX `current_record__idx` USING BTREE ON `t_track_tags_archive`( `current_record` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_tag__idx" -----------------------------------
CREATE INDEX `f_tag__idx` USING BTREE ON `t_track_tags_archive`( `f_tag` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_track__idx" ---------------------------------
CREATE INDEX `f_track__idx` USING BTREE ON `t_track_tags_archive`( `f_track` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_track_tags_archive`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_tracks`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_owner__idx" ---------------------------------
CREATE INDEX `f_owner__idx` USING BTREE ON `t_tracks`( `f_owner` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_parental_rating__idx" -----------------------
CREATE INDEX `f_parental_rating__idx` USING BTREE ON `t_tracks`( `f_parental_rating` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_tracks`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "created_by__idx" ------------------------------
CREATE INDEX `created_by__idx` USING BTREE ON `t_tracks_archive`( `created_by` );
-- -------------------------------------------------------------


-- CREATE INDEX "current_record__idx" --------------------------
CREATE INDEX `current_record__idx` USING BTREE ON `t_tracks_archive`( `current_record` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_owner__idx" ---------------------------------
CREATE INDEX `f_owner__idx` USING BTREE ON `t_tracks_archive`( `f_owner` );
-- -------------------------------------------------------------


-- CREATE INDEX "f_parental_rating__idx" -----------------------
CREATE INDEX `f_parental_rating__idx` USING BTREE ON `t_tracks_archive`( `f_parental_rating` );
-- -------------------------------------------------------------


-- CREATE INDEX "modified_by__idx" -----------------------------
CREATE INDEX `modified_by__idx` USING BTREE ON `t_tracks_archive`( `modified_by` );
-- -------------------------------------------------------------


-- CREATE LINK "auth_cas_ibfk_1" -------------------------------
ALTER TABLE `auth_cas`
	ADD CONSTRAINT `auth_cas_ibfk_1` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "auth_event_ibfk_1" -----------------------------
ALTER TABLE `auth_event`
	ADD CONSTRAINT `auth_event_ibfk_1` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "auth_membership_ibfk_1" ------------------------
ALTER TABLE `auth_membership`
	ADD CONSTRAINT `auth_membership_ibfk_1` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "auth_membership_ibfk_2" ------------------------
ALTER TABLE `auth_membership`
	ADD CONSTRAINT `auth_membership_ibfk_2` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "auth_permission_ibfk_1" ------------------------
ALTER TABLE `auth_permission`
	ADD CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_parental_ratings_ibfk_1" ---------------------
ALTER TABLE `t_parental_ratings`
	ADD CONSTRAINT `t_parental_ratings_ibfk_1` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_parental_ratings_ibfk_2" ---------------------
ALTER TABLE `t_parental_ratings`
	ADD CONSTRAINT `t_parental_ratings_ibfk_2` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_parental_ratings_archive_ibfk_1" -------------
ALTER TABLE `t_parental_ratings_archive`
	ADD CONSTRAINT `t_parental_ratings_archive_ibfk_1` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_parental_ratings_archive_ibfk_2" -------------
ALTER TABLE `t_parental_ratings_archive`
	ADD CONSTRAINT `t_parental_ratings_archive_ibfk_2` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_parental_ratings_archive_ibfk_3" -------------
ALTER TABLE `t_parental_ratings_archive`
	ADD CONSTRAINT `t_parental_ratings_archive_ibfk_3` FOREIGN KEY ( `current_record` )
	REFERENCES `t_parental_ratings`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_pois_ibfk_1" ---------------------------------
ALTER TABLE `t_pois`
	ADD CONSTRAINT `t_pois_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_pois_ibfk_2" ---------------------------------
ALTER TABLE `t_pois`
	ADD CONSTRAINT `t_pois_ibfk_2` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_pois_ibfk_3" ---------------------------------
ALTER TABLE `t_pois`
	ADD CONSTRAINT `t_pois_ibfk_3` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_pois_archive_ibfk_1" -------------------------
ALTER TABLE `t_pois_archive`
	ADD CONSTRAINT `t_pois_archive_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_pois_archive_ibfk_2" -------------------------
ALTER TABLE `t_pois_archive`
	ADD CONSTRAINT `t_pois_archive_ibfk_2` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_pois_archive_ibfk_3" -------------------------
ALTER TABLE `t_pois_archive`
	ADD CONSTRAINT `t_pois_archive_ibfk_3` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_pois_archive_ibfk_4" -------------------------
ALTER TABLE `t_pois_archive`
	ADD CONSTRAINT `t_pois_archive_ibfk_4` FOREIGN KEY ( `current_record` )
	REFERENCES `t_pois`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_ibfk_1" ------------------------------
ALTER TABLE `t_reports`
	ADD CONSTRAINT `t_reports_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_ibfk_2" ------------------------------
ALTER TABLE `t_reports`
	ADD CONSTRAINT `t_reports_ibfk_2` FOREIGN KEY ( `f_poi` )
	REFERENCES `t_pois`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_ibfk_3" ------------------------------
ALTER TABLE `t_reports`
	ADD CONSTRAINT `t_reports_ibfk_3` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_ibfk_4" ------------------------------
ALTER TABLE `t_reports`
	ADD CONSTRAINT `t_reports_ibfk_4` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_archive_ibfk_1" ----------------------
ALTER TABLE `t_reports_archive`
	ADD CONSTRAINT `t_reports_archive_ibfk_1` FOREIGN KEY ( `f_parental_rating` )
	REFERENCES `t_parental_ratings`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_archive_ibfk_2" ----------------------
ALTER TABLE `t_reports_archive`
	ADD CONSTRAINT `t_reports_archive_ibfk_2` FOREIGN KEY ( `f_owner` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_archive_ibfk_3" ----------------------
ALTER TABLE `t_reports_archive`
	ADD CONSTRAINT `t_reports_archive_ibfk_3` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_archive_ibfk_4" ----------------------
ALTER TABLE `t_reports_archive`
	ADD CONSTRAINT `t_reports_archive_ibfk_4` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_reports_archive_ibfk_5" ----------------------
ALTER TABLE `t_reports_archive`
	ADD CONSTRAINT `t_reports_archive_ibfk_5` FOREIGN KEY ( `current_record` )
	REFERENCES `t_reports`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tags_ibfk_1" ---------------------------------
ALTER TABLE `t_tags`
	ADD CONSTRAINT `t_tags_ibfk_1` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tags_ibfk_2" ---------------------------------
ALTER TABLE `t_tags`
	ADD CONSTRAINT `t_tags_ibfk_2` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tags_archive_ibfk_1" -------------------------
ALTER TABLE `t_tags_archive`
	ADD CONSTRAINT `t_tags_archive_ibfk_1` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tags_archive_ibfk_2" -------------------------
ALTER TABLE `t_tags_archive`
	ADD CONSTRAINT `t_tags_archive_ibfk_2` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tags_archive_ibfk_3" -------------------------
ALTER TABLE `t_tags_archive`
	ADD CONSTRAINT `t_tags_archive_ibfk_3` FOREIGN KEY ( `current_record` )
	REFERENCES `t_tags`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_ibfk_1" ---------------------------
ALTER TABLE `t_track_pois`
	ADD CONSTRAINT `t_track_pois_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_ibfk_2" ---------------------------
ALTER TABLE `t_track_pois`
	ADD CONSTRAINT `t_track_pois_ibfk_2` FOREIGN KEY ( `f_poi` )
	REFERENCES `t_pois`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_ibfk_3" ---------------------------
ALTER TABLE `t_track_pois`
	ADD CONSTRAINT `t_track_pois_ibfk_3` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_ibfk_4" ---------------------------
ALTER TABLE `t_track_pois`
	ADD CONSTRAINT `t_track_pois_ibfk_4` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_archive_ibfk_1" -------------------
ALTER TABLE `t_track_pois_archive`
	ADD CONSTRAINT `t_track_pois_archive_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_archive_ibfk_2" -------------------
ALTER TABLE `t_track_pois_archive`
	ADD CONSTRAINT `t_track_pois_archive_ibfk_2` FOREIGN KEY ( `f_poi` )
	REFERENCES `t_pois`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_archive_ibfk_3" -------------------
ALTER TABLE `t_track_pois_archive`
	ADD CONSTRAINT `t_track_pois_archive_ibfk_3` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_archive_ibfk_4" -------------------
ALTER TABLE `t_track_pois_archive`
	ADD CONSTRAINT `t_track_pois_archive_ibfk_4` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_pois_archive_ibfk_5" -------------------
ALTER TABLE `t_track_pois_archive`
	ADD CONSTRAINT `t_track_pois_archive_ibfk_5` FOREIGN KEY ( `current_record` )
	REFERENCES `t_track_pois`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_ratings_ibfk_1" ------------------------
ALTER TABLE `t_track_ratings`
	ADD CONSTRAINT `t_track_ratings_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_ratings_ibfk_2" ------------------------
ALTER TABLE `t_track_ratings`
	ADD CONSTRAINT `t_track_ratings_ibfk_2` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_ratings_ibfk_3" ------------------------
ALTER TABLE `t_track_ratings`
	ADD CONSTRAINT `t_track_ratings_ibfk_3` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_ratings_archive_ibfk_1" ----------------
ALTER TABLE `t_track_ratings_archive`
	ADD CONSTRAINT `t_track_ratings_archive_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_ratings_archive_ibfk_2" ----------------
ALTER TABLE `t_track_ratings_archive`
	ADD CONSTRAINT `t_track_ratings_archive_ibfk_2` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_ratings_archive_ibfk_3" ----------------
ALTER TABLE `t_track_ratings_archive`
	ADD CONSTRAINT `t_track_ratings_archive_ibfk_3` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_ratings_archive_ibfk_4" ----------------
ALTER TABLE `t_track_ratings_archive`
	ADD CONSTRAINT `t_track_ratings_archive_ibfk_4` FOREIGN KEY ( `current_record` )
	REFERENCES `t_track_ratings`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_ibfk_1" ---------------------------
ALTER TABLE `t_track_tags`
	ADD CONSTRAINT `t_track_tags_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_ibfk_2" ---------------------------
ALTER TABLE `t_track_tags`
	ADD CONSTRAINT `t_track_tags_ibfk_2` FOREIGN KEY ( `f_tag` )
	REFERENCES `t_tags`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_ibfk_3" ---------------------------
ALTER TABLE `t_track_tags`
	ADD CONSTRAINT `t_track_tags_ibfk_3` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_ibfk_4" ---------------------------
ALTER TABLE `t_track_tags`
	ADD CONSTRAINT `t_track_tags_ibfk_4` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_archive_ibfk_1" -------------------
ALTER TABLE `t_track_tags_archive`
	ADD CONSTRAINT `t_track_tags_archive_ibfk_1` FOREIGN KEY ( `f_track` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_archive_ibfk_2" -------------------
ALTER TABLE `t_track_tags_archive`
	ADD CONSTRAINT `t_track_tags_archive_ibfk_2` FOREIGN KEY ( `f_tag` )
	REFERENCES `t_tags`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_archive_ibfk_3" -------------------
ALTER TABLE `t_track_tags_archive`
	ADD CONSTRAINT `t_track_tags_archive_ibfk_3` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_archive_ibfk_4" -------------------
ALTER TABLE `t_track_tags_archive`
	ADD CONSTRAINT `t_track_tags_archive_ibfk_4` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_track_tags_archive_ibfk_5" -------------------
ALTER TABLE `t_track_tags_archive`
	ADD CONSTRAINT `t_track_tags_archive_ibfk_5` FOREIGN KEY ( `current_record` )
	REFERENCES `t_track_tags`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_ibfk_1" -------------------------------
ALTER TABLE `t_tracks`
	ADD CONSTRAINT `t_tracks_ibfk_1` FOREIGN KEY ( `f_parental_rating` )
	REFERENCES `t_parental_ratings`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_ibfk_2" -------------------------------
ALTER TABLE `t_tracks`
	ADD CONSTRAINT `t_tracks_ibfk_2` FOREIGN KEY ( `f_owner` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_ibfk_3" -------------------------------
ALTER TABLE `t_tracks`
	ADD CONSTRAINT `t_tracks_ibfk_3` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_ibfk_4" -------------------------------
ALTER TABLE `t_tracks`
	ADD CONSTRAINT `t_tracks_ibfk_4` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_archive_ibfk_1" -----------------------
ALTER TABLE `t_tracks_archive`
	ADD CONSTRAINT `t_tracks_archive_ibfk_1` FOREIGN KEY ( `f_parental_rating` )
	REFERENCES `t_parental_ratings`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_archive_ibfk_2" -----------------------
ALTER TABLE `t_tracks_archive`
	ADD CONSTRAINT `t_tracks_archive_ibfk_2` FOREIGN KEY ( `f_owner` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_archive_ibfk_3" -----------------------
ALTER TABLE `t_tracks_archive`
	ADD CONSTRAINT `t_tracks_archive_ibfk_3` FOREIGN KEY ( `created_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_archive_ibfk_4" -----------------------
ALTER TABLE `t_tracks_archive`
	ADD CONSTRAINT `t_tracks_archive_ibfk_4` FOREIGN KEY ( `modified_by` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "t_tracks_archive_ibfk_5" -----------------------
ALTER TABLE `t_tracks_archive`
	ADD CONSTRAINT `t_tracks_archive_ibfk_5` FOREIGN KEY ( `current_record` )
	REFERENCES `t_tracks`( `id` )
	ON DELETE Cascade
	ON UPDATE Restrict;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


