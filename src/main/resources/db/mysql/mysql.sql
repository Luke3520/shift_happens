-- MySQL dump 10.13  Distrib 8.0.45, for Linux (aarch64)
--
-- Host: localhost    Database: shift_happens
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `audit_log_id` int NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `action_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_user` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_datetime` datetime DEFAULT NULL,
  `old_value_snapshot` text COLLATE utf8mb4_unicode_ci,
  `new_value_snapshot` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`audit_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES (1,'Shift',1,'DELETE','hr_admin','2026-04-30 02:59:14',NULL,NULL),(2,'Shift',11,'UPDATE','hr_admin','2026-05-13 12:59:14','{\"status\": \"PENDING\", \"updated_field\": \"department\", \"previous_value\": \"old\"}','{\"status\": \"INACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"contract\"}'),(3,'Shift',21,'UPDATE','hr_admin','2026-05-19 02:59:14',NULL,'{\"status\": \"ACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"contract\"}'),(4,'Shift',31,'DELETE','hr_admin','2026-05-14 19:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"email\"}'),(5,'Shift',41,'CREATE','shift_manager','2026-05-08 02:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"old\"}','{\"status\": \"PENDING\", \"new_value\": \"changed\", \"updated_field\": \"contract\"}'),(6,'Shift',51,'UPDATE','system','2026-05-20 01:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"old\"}',NULL),(7,'Shift',61,'DELETE','hr_admin','2026-04-26 09:59:14',NULL,NULL),(8,'Shift',81,'UPDATE','scheduler_service','2026-05-08 00:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"null\"}','{\"status\": \"PENDING\", \"new_value\": \"changed\", \"updated_field\": \"department\"}'),(9,'Shift',91,'UPDATE','department_head','2026-05-08 10:59:14',NULL,'{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"department\"}'),(10,'LeaveRequest',2,'UPDATE','hr_admin','2026-05-12 04:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"email\"}'),(11,'LeaveRequest',12,'DELETE','system','2026-05-22 09:59:14','{\"status\": \"PENDING\", \"updated_field\": \"contract\", \"previous_value\": \"old\"}','{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"status\"}'),(12,'LeaveRequest',22,'UPDATE','shift_manager','2026-05-10 10:59:14','{\"status\": \"PENDING\", \"updated_field\": \"email\", \"previous_value\": \"old\"}','{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"contract\"}'),(13,'LeaveRequest',32,'UPDATE','scheduler_service','2026-05-20 12:59:14',NULL,NULL),(14,'LeaveRequest',42,'UPDATE','hr_admin','2026-04-26 05:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(15,'LeaveRequest',52,'UPDATE','system','2026-05-10 11:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"contract\", \"previous_value\": \"previous\"}','{\"status\": \"PENDING\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(16,'LeaveRequest',62,'UPDATE','hr_admin','2026-05-11 20:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"null\"}','{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"email\"}'),(17,'LeaveRequest',72,'UPDATE','scheduler_service','2026-05-14 03:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"old\"}',NULL),(18,'LeaveRequest',82,'DELETE','hr_admin','2026-04-26 18:59:14','{\"status\": \"PENDING\", \"updated_field\": \"email\", \"previous_value\": \"null\"}','{\"status\": \"ACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"contract\"}'),(19,'LeaveRequest',92,'DELETE','shift_manager','2026-05-24 21:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"old\"}','{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"department\"}'),(20,'ShiftSwap',13,'UPDATE','system','2026-05-01 21:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"status\", \"previous_value\": \"old\"}',NULL),(21,'ShiftSwap',23,'UPDATE','scheduler_service','2026-05-11 15:59:14','{\"status\": \"PENDING\", \"updated_field\": \"status\", \"previous_value\": \"old\"}','{\"status\": \"PENDING\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(22,'ShiftSwap',33,'UPDATE','system','2026-04-29 05:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"old\"}','{\"status\": \"ACTIVE\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(23,'ShiftSwap',43,'CREATE','system','2026-05-11 12:59:14',NULL,NULL),(24,'ShiftSwap',53,'UPDATE','shift_manager','2026-05-21 00:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"contract\", \"previous_value\": \"previous\"}',NULL),(25,'ShiftSwap',63,'UPDATE','shift_manager','2026-05-11 09:59:14','{\"status\": \"PENDING\", \"updated_field\": \"contract\", \"previous_value\": \"old\"}','{\"status\": \"ACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"email\"}'),(26,'ShiftSwap',73,'DELETE','scheduler_service','2026-05-04 12:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"null\"}',NULL),(27,'ShiftSwap',83,'UPDATE','scheduler_service','2026-05-25 01:59:14',NULL,'{\"status\": \"ACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"contract\"}'),(28,'ShiftSwap',93,'DELETE','shift_manager','2026-05-22 17:59:14','{\"status\": \"PENDING\", \"updated_field\": \"contract\", \"previous_value\": \"old\"}','{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"status\"}'),(29,'EmployeeContract',4,'UPDATE','shift_manager','2026-05-20 12:59:14',NULL,'{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"status\"}'),(30,'EmployeeContract',14,'UPDATE','system','2026-05-03 22:59:14','{\"status\": \"PENDING\", \"updated_field\": \"contract\", \"previous_value\": \"old\"}','{\"status\": \"PENDING\", \"new_value\": \"changed\", \"updated_field\": \"status\"}'),(31,'EmployeeContract',24,'UPDATE','hr_admin','2026-05-12 08:59:14',NULL,NULL),(32,'EmployeeContract',34,'UPDATE','system','2026-04-30 08:59:14',NULL,'{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"contract\"}'),(33,'EmployeeContract',44,'CREATE','shift_manager','2026-05-21 02:59:14',NULL,'{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"email\"}'),(34,'EmployeeContract',54,'UPDATE','system','2026-04-27 02:59:14','{\"status\": \"PENDING\", \"updated_field\": \"status\", \"previous_value\": \"previous\"}','{\"status\": \"PENDING\", \"new_value\": \"changed\", \"updated_field\": \"department\"}'),(35,'EmployeeContract',64,'UPDATE','scheduler_service','2026-05-21 03:59:14',NULL,NULL),(36,'EmployeeContract',74,'UPDATE','department_head','2026-05-18 03:59:14','{\"status\": \"PENDING\", \"updated_field\": \"department\", \"previous_value\": \"previous\"}','{\"status\": \"INACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"contract\"}'),(37,'EmployeeContract',84,'UPDATE','department_head','2026-05-09 03:59:14','{\"status\": \"PENDING\", \"updated_field\": \"contract\", \"previous_value\": \"previous\"}',NULL),(38,'EmployeeContract',94,'CREATE','system','2026-05-17 06:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"status\"}'),(39,'Employee',5,'UPDATE','system','2026-05-07 08:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"old\"}','{\"status\": \"ACTIVE\", \"new_value\": \"new\", \"updated_field\": \"department\"}'),(40,'Employee',15,'UPDATE','department_head','2026-05-25 02:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"status\", \"previous_value\": \"previous\"}','{\"status\": \"INACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"status\"}'),(41,'Employee',25,'UPDATE','department_head','2026-05-24 04:59:14',NULL,NULL),(42,'Employee',35,'CREATE','shift_manager','2026-05-01 16:59:14','{\"status\": \"PENDING\", \"updated_field\": \"email\", \"previous_value\": \"previous\"}','{\"status\": \"ACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"status\"}'),(43,'Employee',45,'UPDATE','system','2026-05-20 18:59:14','{\"status\": \"PENDING\", \"updated_field\": \"department\", \"previous_value\": \"old\"}','{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"department\"}'),(44,'Employee',55,'DELETE','department_head','2026-05-06 02:59:14','{\"status\": \"PENDING\", \"updated_field\": \"status\", \"previous_value\": \"null\"}','{\"status\": \"PENDING\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(45,'Employee',65,'UPDATE','shift_manager','2026-05-21 11:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"previous\"}','{\"status\": \"INACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"email\"}'),(46,'Employee',75,'UPDATE','department_head','2026-05-02 23:59:14',NULL,NULL),(47,'Employee',85,'UPDATE','department_head','2026-04-26 06:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"old\"}',NULL),(48,'Employee',95,'UPDATE','department_head','2026-05-12 16:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"previous\"}','{\"status\": \"INACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"status\"}'),(49,'Shift',6,'UPDATE','department_head','2026-05-13 11:59:14','{\"status\": \"PENDING\", \"updated_field\": \"contract\", \"previous_value\": \"previous\"}','{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(50,'Shift',16,'DELETE','system','2026-04-27 07:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"contract\", \"previous_value\": \"old\"}','{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"email\"}'),(51,'Shift',36,'DELETE','hr_admin','2026-05-17 06:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"contract\"}'),(52,'Shift',46,'UPDATE','system','2026-05-09 01:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(53,'Shift',56,'UPDATE','hr_admin','2026-05-05 19:59:14',NULL,NULL),(54,'Shift',66,'DELETE','department_head','2026-05-14 22:59:14','{\"status\": \"PENDING\", \"updated_field\": \"department\", \"previous_value\": \"null\"}',NULL),(55,'Shift',76,'UPDATE','hr_admin','2026-04-26 20:59:14',NULL,NULL),(56,'Shift',86,'UPDATE','shift_manager','2026-05-21 17:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"contract\"}'),(57,'LeaveRequest',17,'CREATE','system','2026-05-11 15:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"previous\"}',NULL),(58,'LeaveRequest',27,'UPDATE','system','2026-05-11 16:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"contract\", \"previous_value\": \"old\"}','{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"email\"}'),(59,'LeaveRequest',37,'CREATE','hr_admin','2026-05-15 17:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"old\"}','{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"status\"}'),(60,'LeaveRequest',47,'UPDATE','department_head','2026-05-20 10:59:14','{\"status\": \"PENDING\", \"updated_field\": \"status\", \"previous_value\": \"previous\"}','{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"email\"}'),(61,'LeaveRequest',57,'DELETE','system','2026-05-22 07:59:14',NULL,NULL),(62,'LeaveRequest',67,'UPDATE','department_head','2026-04-30 07:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"contract\"}'),(63,'LeaveRequest',77,'UPDATE','department_head','2026-05-18 16:59:14',NULL,'{\"status\": \"PENDING\", \"new_value\": \"changed\", \"updated_field\": \"department\"}'),(64,'LeaveRequest',87,'CREATE','hr_admin','2026-05-13 06:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"null\"}','{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"contract\"}'),(65,'LeaveRequest',97,'UPDATE','system','2026-05-07 10:59:14',NULL,NULL),(66,'ShiftSwap',8,'UPDATE','shift_manager','2026-04-30 14:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"contract\", \"previous_value\": \"null\"}','{\"status\": \"PENDING\", \"new_value\": \"new\", \"updated_field\": \"contract\"}'),(67,'ShiftSwap',18,'UPDATE','department_head','2026-05-22 03:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"email\"}'),(68,'ShiftSwap',28,'DELETE','department_head','2026-05-06 11:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(69,'ShiftSwap',38,'UPDATE','hr_admin','2026-05-11 18:59:14','{\"status\": \"PENDING\", \"updated_field\": \"email\", \"previous_value\": \"previous\"}','{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"department\"}'),(70,'ShiftSwap',48,'UPDATE','department_head','2026-05-06 14:59:14',NULL,'{\"status\": \"PENDING\", \"new_value\": \"updated\", \"updated_field\": \"email\"}'),(71,'ShiftSwap',58,'UPDATE','scheduler_service','2026-05-06 04:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"status\", \"previous_value\": \"previous\"}','{\"status\": \"INACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"department\"}'),(72,'ShiftSwap',68,'UPDATE','hr_admin','2026-05-14 17:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"old\"}','{\"status\": \"INACTIVE\", \"new_value\": \"changed\", \"updated_field\": \"email\"}'),(73,'ShiftSwap',78,'DELETE','hr_admin','2026-05-07 02:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"null\"}',NULL),(74,'ShiftSwap',88,'UPDATE','system','2026-04-27 23:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"status\", \"previous_value\": \"previous\"}',NULL),(75,'EmployeeContract',9,'UPDATE','hr_admin','2026-05-20 09:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"contract\", \"previous_value\": \"old\"}','{\"status\": \"ACTIVE\", \"new_value\": \"new\", \"updated_field\": \"status\"}'),(76,'EmployeeContract',29,'UPDATE','hr_admin','2026-05-10 17:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"status\"}'),(77,'EmployeeContract',39,'UPDATE','system','2026-05-24 05:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"status\", \"previous_value\": \"old\"}',NULL),(78,'EmployeeContract',49,'CREATE','department_head','2026-05-06 12:59:14','{\"status\": \"PENDING\", \"updated_field\": \"contract\", \"previous_value\": \"previous\"}',NULL),(79,'EmployeeContract',59,'UPDATE','hr_admin','2026-05-03 21:59:14','{\"status\": \"PENDING\", \"updated_field\": \"status\", \"previous_value\": \"previous\"}','{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"contract\"}'),(80,'EmployeeContract',79,'UPDATE','scheduler_service','2026-05-22 21:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"old\"}','{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"email\"}'),(81,'EmployeeContract',89,'UPDATE','hr_admin','2026-05-20 07:59:14',NULL,NULL),(82,'EmployeeContract',99,'UPDATE','department_head','2026-05-06 09:59:14',NULL,'{\"status\": \"ACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"email\"}'),(83,'Employee',10,'UPDATE','shift_manager','2026-05-16 02:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"null\"}',NULL),(84,'Employee',20,'UPDATE','system','2026-05-12 20:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"old\"}',NULL),(85,'Employee',30,'CREATE','department_head','2026-05-06 16:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"updated\", \"updated_field\": \"status\"}'),(86,'Employee',40,'DELETE','shift_manager','2026-04-27 06:59:14',NULL,'{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"email\"}'),(87,'Employee',50,'UPDATE','scheduler_service','2026-05-12 20:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"previous\"}','{\"status\": \"ACTIVE\", \"new_value\": \"new\", \"updated_field\": \"contract\"}'),(88,'Employee',60,'UPDATE','system','2026-05-22 01:59:14','{\"status\": \"INACTIVE\", \"updated_field\": \"email\", \"previous_value\": \"null\"}',NULL),(89,'Employee',70,'UPDATE','department_head','2026-05-12 17:59:14','{\"status\": \"ACTIVE\", \"updated_field\": \"department\", \"previous_value\": \"old\"}','{\"status\": \"INACTIVE\", \"new_value\": \"new\", \"updated_field\": \"contract\"}'),(90,'Employee',80,'UPDATE','department_head','2026-05-02 13:59:14',NULL,'{\"status\": \"PENDING\", \"new_value\": \"new\", \"updated_field\": \"department\"}'),(91,'Employee',100,'UPDATE','system','2026-05-07 20:59:14',NULL,'{\"status\": \"PENDING\", \"new_value\": \"new\", \"updated_field\": \"email\"}'),(128,'EMPLOYEE',101,'INSERT','root@localhost','2026-05-25 10:59:14',NULL,'{\"email\": \"employee999@shift.dk\", \"hire_date\": \"2020-09-19\", \"last_name\": \"Last999\", \"user_role\": \"Employee\", \"first_name\": \"First999\", \"employee_id\": 101, \"phone_number\": \"+45 50000101\", \"login_password\": \"*****\", \"employee_number\": \"EMP00999\", \"employment_status\": \"ACTIVE\", \"primary_work_location_id\": 1}'),(129,'EMPLOYEE',101,'UPDATE','root@localhost','2026-05-25 10:59:14','{\"email\": \"employee999@shift.dk\", \"hire_date\": \"2020-09-19\", \"last_name\": \"Last999\", \"user_role\": \"Employee\", \"first_name\": \"First999\", \"employee_id\": 101, \"phone_number\": \"+45 50000101\", \"login_password\": \"*****\", \"employee_number\": \"EMP00999\", \"employment_status\": \"ACTIVE\", \"primary_work_location_id\": 1}','{\"email\": \"employee999@shift.dk\", \"hire_date\": \"2020-09-19\", \"last_name\": \"Last999\", \"user_role\": \"Employee\", \"first_name\": \"First999\", \"employee_id\": 101, \"phone_number\": \"+45 50000101\", \"login_password\": \"*****\", \"employee_number\": \"EMP00999\", \"employment_status\": \"INACTIVE\", \"primary_work_location_id\": 1}'),(130,'EMPLOYEE',101,'DELETE','root@localhost','2026-05-25 10:59:14','{\"email\": \"employee999@shift.dk\", \"hire_date\": \"2020-09-19\", \"last_name\": \"Last999\", \"user_role\": \"Employee\", \"first_name\": \"First999\", \"employee_id\": 101, \"phone_number\": \"+45 50000101\", \"login_password\": \"*****\", \"employee_number\": \"EMP00999\", \"employment_status\": \"INACTIVE\", \"primary_work_location_id\": 1}',NULL),(131,'EMPLOYEE',1,'UPDATE','root@localhost','2026-05-25 10:59:15','{\"email\": \"sofie.jensen@hospital.dk\", \"hire_date\": \"2018-03-15\", \"last_name\": \"Jensen\", \"user_role\": \"Employee\", \"first_name\": \"Sofie\", \"employee_id\": 1, \"phone_number\": \"+45 50123456\", \"login_password\": \"*****\", \"employee_number\": \"EMP00001\", \"employment_status\": \"ACTIVE\", \"primary_work_location_id\": 1}','{\"email\": \"sofie.jensen@hospital.dk\", \"hire_date\": \"2018-03-15\", \"last_name\": \"Jensen\", \"user_role\": \"Employee\", \"first_name\": \"Sofie\", \"employee_id\": 1, \"phone_number\": \"+45 50123456\", \"login_password\": \"*****\", \"employee_number\": \"EMP00001\", \"employment_status\": \"ACTIVE\", \"primary_work_location_id\": 1}'),(132,'EMPLOYEE',30,'UPDATE','root@localhost','2026-05-25 10:59:15','{\"email\": \"malthe.enevoldsen@hospital.dk\", \"hire_date\": \"2019-12-19\", \"last_name\": \"Enevoldsen\", \"user_role\": \"Manager\", \"first_name\": \"Malthe\", \"employee_id\": 30, \"phone_number\": \"+45 50112324\", \"login_password\": \"*****\", \"employee_number\": \"EMP00030\", \"employment_status\": \"ACTIVE\", \"primary_work_location_id\": 10}','{\"email\": \"malthe.enevoldsen@hospital.dk\", \"hire_date\": \"2019-12-19\", \"last_name\": \"Enevoldsen\", \"user_role\": \"Manager\", \"first_name\": \"Malthe\", \"employee_id\": 30, \"phone_number\": \"+45 50112324\", \"login_password\": \"*****\", \"employee_number\": \"EMP00030\", \"employment_status\": \"ACTIVE\", \"primary_work_location_id\": 10}'),(133,'EMPLOYEE',102,'INSERT','root@localhost','2026-05-25 10:59:15',NULL,'{\"email\": \"admin@shift.dk\", \"hire_date\": \"2026-05-25\", \"last_name\": \"User\", \"user_role\": \"Administrator\", \"first_name\": \"Admin\", \"employee_id\": 102, \"phone_number\": \"+45 00000001\", \"login_password\": \"*****\", \"employee_number\": \"ADM00001\", \"employment_status\": \"ACTIVE\", \"primary_work_location_id\": 1}');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Akutmodtagelse',1),(2,'Intensiv',1),(3,'Kirurgisk afdeling',1),(4,'Medicinsk afdeling',1),(5,'Børneafdeling',1),(6,'Ortopædkirurgi',1),(7,'Onkologi',1),(8,'Radiologi',1),(9,'Fysioterapi',1),(10,'Psykiatri',1),(11,'Ambulant behandling',1),(12,'Laboratorium',1),(13,'IT-support',1),(14,'Administration',1),(15,'Reception',1),(16,'Rengøring',1),(17,'Kantine',1),(18,'Transport',1),(19,'Lager',1),(20,'Sikkerhed',1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_department_insert` AFTER INSERT ON `department` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('DEPARTMENT', NEW.department_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('department_id', NEW.department_id, 'department_name', NEW.department_name, 'is_active', NEW.is_active));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_department_update` BEFORE UPDATE ON `department` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('DEPARTMENT', OLD.department_id, 'UPDATE', USER(), NOW(), 
    JSON_OBJECT('department_id', OLD.department_id, 'department_name', OLD.department_name, 'is_active', OLD.is_active),
    JSON_OBJECT('department_id', NEW.department_id, 'department_name', NEW.department_name, 'is_active', NEW.is_active));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_department_delete` BEFORE DELETE ON `department` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('DEPARTMENT', OLD.department_id, 'DELETE', USER(), NOW(), JSON_OBJECT('department_id', OLD.department_id, 'department_name', OLD.department_name, 'is_active', OLD.is_active), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hire_date` date NOT NULL,
  `employment_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_work_location_id` int NOT NULL,
  `user_role` enum('Administrator','Manager','Employee') COLLATE utf8mb4_unicode_ci DEFAULT 'Employee',
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `employee_number` (`employee_number`),
  KEY `fk_employee_location` (`primary_work_location_id`),
  KEY `idx_employee_email` (`email`),
  CONSTRAINT `fk_employee_location` FOREIGN KEY (`primary_work_location_id`) REFERENCES `work_location` (`work_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'EMP00001','Sofie','Jensen','sofie.jensen@hospital.dk','$2a$10$s53B7sTK0OeOrRP/VmrT6uZhMrmAOQXUxN/Rle/1aLnlgM4iobIx6','+45 50123456','2018-03-15','ACTIVE',1,'Employee'),(2,'EMP00002','Mads','Nielsen','mads.nielsen@hospital.dk','af28a7b03ce4eb512c4f548c0dd015ea0948680ebf732eb6ad631bf47355a3bc','+45 50234567','2019-07-01','ACTIVE',2,'Employee'),(3,'EMP00003','Ida','Hansen','ida.hansen@hospital.dk','122305ae60c0838397b9a383e498eac6899615a508c58b39d18abf6eb2b4d45c','+45 50345678','2020-01-20','ACTIVE',3,'Employee'),(4,'EMP00004','Frederik','Larsen','frederik.larsen@hospital.dk','2244538bf60c39c71db74e9fea03e2acde713b5dd43fa87c0bfbb773254251fc','+45 50456789','2017-11-10','INACTIVE',4,'Employee'),(5,'EMP00005','Emma','Pedersen','emma.pedersen@hospital.dk','f11d9a199ad1e2f5c4fb8989166f30e2ca8205d6ae8b6bf4d0ba7f3adb9c3c22','+45 50567890','2021-05-05','ACTIVE',5,'Employee'),(6,'EMP00006','Noah','Andersen','noah.andersen@hospital.dk','1eb8e5334a9c0852ba56bca5a1fe3650d3400bbcb405668f375aea4debabdf38','+45 50678901','2016-09-23','ACTIVE',6,'Employee'),(7,'EMP00007','Laura','Christensen','laura.christensen@hospital.dk','491aaab0bc4465fc278065a252dfbada28ddc7fa3406c132add56b13c6acd171','+45 50789012','2015-02-14','ACTIVE',7,'Employee'),(8,'EMP00008','William','Møller','william.moller@hospital.dk','2bb41d93357fd07f8c9499d8e9abf0a602bd88131829aaa6f7a6cdfc0c4d9056','+45 50890123','2018-12-30','INACTIVE',8,'Employee'),(9,'EMP00009','Josefine','Thomsen','josefine.thomsen@hospital.dk','b011af338370c8d8e1cba3652c928f596b8034b418db52bb67c02d4a1d3431c6','+45 50901234','2022-04-18','ACTIVE',9,'Employee'),(10,'EMP00010','Oliver','Poulsen','oliver.poulsen@hospital.dk','86569960df4a9170db407624969bca92d8560280e805073ae57562ea4b6b9fb6','+45 50111222','2019-08-27','ACTIVE',10,'Employee'),(11,'EMP00011','Katrine','Mortensen','katrine.mortensen@hospital.dk','6c78acaca957270d840bcd5f0f25f7bd1d25313cbdbc48d776d5f8e35cf2367c','+45 50122334','2017-06-12','ACTIVE',1,'Employee'),(12,'EMP00012','Andreas','Olsen','andreas.olsen@hospital.dk','7a369e29e01dcde98287e99d77af1b6f93f2c01597a105bb4bc5753f00c8b64c','+45 50233445','2018-09-03','ACTIVE',2,'Employee'),(13,'EMP00013','Camilla','Sørensen','camilla.sorensen@hospital.dk','e806f6d3888c354cae81c14a5f49bb77c34310dbf0a09cb113d5650f422860b5','+45 50344556','2020-02-17','ACTIVE',3,'Employee'),(14,'EMP00014','Magnus','Christiansen','magnus.christiansen@hospital.dk','1dfc656cf664293da709a28420511ce1f6f8b5611f107b5077d7bd88b9cf3e5c','+45 50455667','2016-12-22','INACTIVE',4,'Employee'),(15,'EMP00015','Julie','Madsen','julie.madsen@hospital.dk','208980f5a03fed1b8ce019710261ab38481f764ab6c65830d253383cd1f138a3','+45 50566778','2021-03-11','ACTIVE',5,'Employee'),(16,'EMP00016','Lucas','Knudsen','lucas.knudsen@hospital.dk','d2c1dcd30525f4d1df3f0b3915392005127494ff412a4965642de8e4d67a803b','+45 50677889','2015-10-29','ACTIVE',6,'Employee'),(17,'EMP00017','Maria','Kristensen','maria.kristensen@hospital.dk','d85ec6b19d6c3f79acacb9cc7b1e0131bab891edbec11371c8180dc11c28e9ad','+45 50788990','2019-01-05','ACTIVE',7,'Employee'),(18,'EMP00018','Alexander','Jepsen','alexander.jepsen@hospital.dk','abc912a79f4edf7668530ed596a5582c6085888f2743228ba1f1ec49882aca45','+45 50899001','2018-05-19','INACTIVE',8,'Employee'),(19,'EMP00019','Caroline','Lund','caroline.lund@hospital.dk','ae7127e3ec6e59aa387d161652dc50d033f80fa6bbc87f9f7c7d542e8b439fe4','+45 50900112','2022-07-23','ACTIVE',9,'Employee'),(20,'EMP00020','Sebastian','Bach','sebastian.bach@hospital.dk','31c61ccc7a87ee2545d59b9a9a570037fa9deb9c7ff667d1c2e92452e2753de9','+45 50111323','2019-11-14','ACTIVE',10,'Employee'),(21,'EMP00021','Mathilde','Holm','mathilde.holm@hospital.dk','87b8224a7ff756a69e20fe85a94c65d498076e800e69e06a1c89d9ccc1c62e93','+45 50122435','2017-08-08','ACTIVE',1,'Employee'),(22,'EMP00022','Jonas','Vestergaard','jonas.vestergaard@hospital.dk','4a9c2425e7e320b001bd07eb242cf3d2069a340604658ae74de0af14071e60a1','+45 50233546','2018-10-16','ACTIVE',2,'Employee'),(23,'EMP00023','Maja','Lauridsen','maja.lauridsen@hospital.dk','fb98e9389dbde22943a9981db411026c5fb972803f07ed1865909342502a9814','+45 50344657','2020-04-02','ACTIVE',3,'Employee'),(24,'EMP00024','Rasmus','Simonsen','rasmus.simonsen@hospital.dk','720be7637b91e09fc3a7a7f113a683058cfed8c53b701efa2932712023594ba2','+45 50455768','2016-11-27','INACTIVE',4,'Employee'),(25,'EMP00025','Nanna','Damgaard','nanna.damgaard@hospital.dk','0a1f505090e6001f293af854278b1705ca49abb77a5154ec5363d2b812ed30b4','+45 50566879','2021-06-18','ACTIVE',5,'Employee'),(26,'EMP00026','Victor','Leth','victor.leth@hospital.dk','b84805a4974d46f057e288dded0121e6b698f8dd0f8cf18b4d0a6d21e8a8cbe0','+45 50677980','2015-03-21','ACTIVE',6,'Employee'),(27,'EMP00027','Louise','Bjerregaard','louise.bjerregaard@hospital.dk','5c9ed0cbcfb82a9b1d8e9962e9ada5f49f5a036f3dc63f7b347693137065fbae','+45 50789091','2019-02-13','ACTIVE',7,'Employee'),(28,'EMP00028','Emil','Dahl','emil.dahl@hospital.dk','a66b02b9b89b4f23bca02b123dd371580c290e1f1dcc1ea7c270fac68fe4a271','+45 50890102','2018-08-25','INACTIVE',8,'Employee'),(29,'EMP00029','Signe','Friis','signe.friis@hospital.dk','f4d9a65cdb22ae2afc802d6c32e5c5ca278f7fc5ef77bea40b9cbc4974726ca9','+45 50901213','2022-10-30','ACTIVE',9,'Employee'),(30,'EMP00030','Malthe','Enevoldsen','malthe.enevoldsen@hospital.dk','$2a$10$s53B7sTK0OeOrRP/VmrT6uZhMrmAOQXUxN/Rle/1aLnlgM4iobIx6','+45 50112324','2019-12-19','ACTIVE',10,'Manager'),(31,'EMP00031','Anne','Gram','anne.gram@hospital.dk','59b14b1fcf3b707da761b9f24f29539d5431bbacf4b6a7e80c0d5dbb5c3e6c8c','+45 50123435','2017-04-04','ACTIVE',1,'Employee'),(32,'EMP00032','Simon','Hedegaard','simon.hedegaard@hospital.dk','aaa09d2c7984d0118daaf331baa53d94d0b27210944bde79e27018bbb8e18dec','+45 50234546','2018-11-11','ACTIVE',2,'Employee'),(33,'EMP00033','Helena','Iversen','helena.iversen@hospital.dk','55aa445bd077a53ba3eeb642ae1a79f3002712e53fb450d6c357b653681d4d61','+45 50345657','2020-06-06','ACTIVE',3,'Employee'),(34,'EMP00034','Tobias','Jørgensen','tobias.jorgensen@hospital.dk','54e29f54c239bb0752e424156b8653833edc8ef9a86d138a4ed2ac3fa2435287','+45 50456768','2016-01-15','INACTIVE',4,'Employee'),(35,'EMP00035','Cecilie','Krogh','cecilie.krogh@hospital.dk','ea943d303ff4c24b4f663c1d1ec1454c66a274db96b2e6fc8e21c9c77c29ca2a','+45 50567879','2021-08-09','ACTIVE',5,'Employee'),(36,'EMP00036','Oscar','Lind','oscar.lind@hospital.dk','0cf347faababbeabda8c31ee5c59dc20f7df1db56ced398b2492c283b677767c','+45 50678980','2015-06-20','ACTIVE',6,'Employee'),(37,'EMP00037','Nicoline','Munch','nicoline.munch@hospital.dk','ceb622d791aff01fe19213b3840df184325e6f72a1692ce463923e3eace77293','+45 50789091','2019-03-03','ACTIVE',7,'Employee'),(38,'EMP00038','Mikkel','Nyborg','mikkel.nyborg@hospital.dk','0133553a133bb4a9ebcafbbef55f8c076687a2be4b7b4fc272ae3483ab3d2904','+45 50890102','2018-10-14','INACTIVE',8,'Employee'),(39,'EMP00039','Amalie','Overgaard','amalie.overgaard@hospital.dk','b607f06677e087960e1f26c5a69fa1b76c47492f5a48c5c12fec6df54ec10ee2','+45 50901213','2022-12-01','ACTIVE',9,'Employee'),(40,'EMP00040','Patrick','Petersen','patrick.petersen@hospital.dk','10904382ad11c94bba0ff4f8d6622e2afae1ed2845fee87b61fbf5fff872e6d4','+45 50112324','2019-05-28','ACTIVE',10,'Employee'),(41,'EMP00041','Sara','Qvist','sara.qvist@hospital.dk','9dbdbb60e240cea178571ed92815422660f6d6df367e077417fb85697598819d','+45 50123435','2017-09-17','ACTIVE',1,'Employee'),(42,'EMP00042','Benjamin','Rasmussen','benjamin.rasmussen@hospital.dk','3760d1e819a261987d3accfbeaf7c1f2dd6cc50c4e6e87353dcd983abc4dfb38','+45 50234546','2018-12-22','ACTIVE',2,'Employee'),(43,'EMP00043','Line','Schmidt','line.schmidt@hospital.dk','ba3f8570cf58a809d9b702030adf0d0017b96c39f1fc4de6c232fab42a03d04a','+45 50345657','2020-08-13','ACTIVE',3,'Employee'),(44,'EMP00044','Kasper','Thygesen','kasper.thygesen@hospital.dk','88bee227315ea12591e3e884a1817a086d17a23e7681be224aae5f3d98356c70','+45 50456768','2016-03-30','INACTIVE',4,'Employee'),(45,'EMP00045','Victoria','Uldall','victoria.uldall@hospital.dk','783b9691fdcd43e7543319a32c81e53ba1fba4767a08c3b50e8257503e9ea83f','+45 50567879','2021-10-21','ACTIVE',5,'Employee'),(46,'EMP00046','Jeppe','Vang','jeppe.vang@hospital.dk','9c49dbce105f21007c8225bc68b5fc098c12568aeaa3b1a53f4d2ae4f29e8eca','+45 50678980','2015-08-02','ACTIVE',6,'Employee'),(47,'EMP00047','Mille','Westergaard','mille.westergaard@hospital.dk','3dc8e759ef0fcbd4f1b6f8e5fb5c8825d8f2f3dda6690bd239e4bbcb12ca7afe','+45 50789091','2019-04-15','ACTIVE',7,'Employee'),(48,'EMP00048','Rikke','Østergaard','rikke.ostergaard@hospital.dk','cc35700070ba254d3030469069fa50604b4484e4e08cc57c395da2005ac6218b','+45 50890102','2018-11-27','INACTIVE',8,'Employee'),(49,'EMP00049','Philip','Aagaard','philip.aagaard@hospital.dk','91fce7deb58d5b6469875d6a5f10cf7d8cb0df5f32b83d69e67eb03e64e93132','+45 50901213','2022-11-10','ACTIVE',9,'Employee'),(50,'EMP00050','Sidsel','Bendtsen','sidsel.bendtsen@hospital.dk','22dd5e8c2316f9cde2e500c09e19b9c49feffbea936f60c900d07a1129b5b60d','+45 50112324','2019-07-06','ACTIVE',10,'Employee'),(51,'EMP00051','Julie','Bonde','julie.bonde@hospital.dk','25b976ddce65fd1a416da9669b8a4c792098272aeac0c3824c2892d79dcffa47','+45 50123457','2018-04-15','ACTIVE',1,'Employee'),(52,'EMP00052','Martin','Brandt','martin.brandt@hospital.dk','e108bdabb77db593e1bf42e2acb49b82d7db39456465446d1f486c2bf3394cb2','+45 50234568','2019-08-01','ACTIVE',2,'Employee'),(53,'EMP00053','Sanne','Bæk','sanne.baek@hospital.dk','1f87763db1173e37f1ff0eb3771b7eb822d3abe72bc9365646c1cd4745396a1b','+45 50345679','2020-02-21','ACTIVE',3,'Employee'),(54,'EMP00054','Thomas','Berg','thomas.berg@hospital.dk','ca73ef5ce2daef627843272fb5ba89f6b4598b96c89a3b39f47ac66f74ead49b','+45 50456780','2017-12-11','INACTIVE',4,'Employee'),(55,'EMP00055','Pernille','Buhl','pernille.buhl@hospital.dk','0ef431c5f7549182ddd29051f222d1d60975f7335c8d5f9d272c598fccca83a4','+45 50567891','2021-06-15','ACTIVE',5,'Employee'),(56,'EMP00056','Henrik','Bøgh','henrik.bogh@hospital.dk','4b30da4d37a01cf64fe9e323ac3a5bdbd80407ad498936feae0881fe3a884479','+45 50678902','2016-10-23','ACTIVE',6,'Employee'),(57,'EMP00057','Lone','Bøttger','lone.bottger@hospital.dk','a196d60db0dff79e5d3a69c5d2ecd1104ff226beabcdac363a76e4bcae02c23d','+45 50789013','2015-03-14','ACTIVE',7,'Employee'),(58,'EMP00058','Peter','Bækgaard','peter.baekgaard@hospital.dk','923ce44e4b6f409ff7c7eb131c7be39e97a4bdf83c23709ae8f0d18978330ab4','+45 50890124','2018-11-30','INACTIVE',8,'Employee'),(59,'EMP00059','Mette','Bøje','mette.boje@hospital.dk','fedeeba6e2b448e061bb16aa1b0df856ca6e642078fdf6c34593190d4f93ead1','+45 50901235','2022-05-19','ACTIVE',9,'Employee'),(60,'EMP00060','Jesper','Bølling','jesper.bolling@hospital.dk','bc41d2f8f6096330bd6b9fb75c1b8fa237789f5fc756ad0521fb952acb13e768','+45 50111223','2019-09-27','ACTIVE',10,'Manager'),(61,'EMP00061','Nina','Børsting','nina.borsting@hospital.dk','d0a3d7595f51d35aa0d9ccae55c4e70a45f09061f713810b56020d427dcfff0c','+45 50122336','2017-07-12','ACTIVE',1,'Employee'),(62,'EMP00062','Søren','Bøttcher','soeren.boettcher@hospital.dk','4890841a8a2d82bf82eb08e6ef8f4b8fdeb0fbac982e11d340e923d8293256c3','+45 50233447','2018-10-05','ACTIVE',2,'Employee'),(63,'EMP00063','Tina','Bøving','tina.boving@hospital.dk','4944f5120eeae87469a41023a6cd42764fa648d80b44a022e879e63664689ff0','+45 50344558','2020-03-17','ACTIVE',3,'Employee'),(64,'EMP00064','Anders','Bøye','anders.boye@hospital.dk','0084b26962ee466c22634c0635ea308248cd6e76ddcc5e0ba230f89c6425c3a0','+45 50455669','2016-11-22','INACTIVE',4,'Employee'),(65,'EMP00065','Charlotte','Bøyesen','charlotte.boyesen@hospital.dk','33ae8ef3decec32f0cdd83c2613fd969184e9c03e7db247661000715f27a10eb','+45 50566780','2021-04-11','ACTIVE',5,'Employee'),(66,'EMP00066','Jan','Bøytler','jan.boeytler@hospital.dk','38843d93e2eb9db023566c2af625798c193188935f9f92e22cafbec1cece2abc','+45 50677891','2015-11-29','ACTIVE',6,'Employee'),(67,'EMP00067','Birgitte','Bøgholm','birgitte.bogholm@hospital.dk','a27001dce196d4d663cf34e7ad75d524af842b04a9dfdb0db22c17edb1628547','+45 50788992','2019-02-05','ACTIVE',7,'Employee'),(68,'EMP00068','Kasper','Bøje','kasper.boje@hospital.dk','066db1fd5c360dbc167eedb1a6d324f01f80a4a93a366bd1d63c545a3c62e7d1','+45 50899003','2018-06-19','INACTIVE',8,'Employee'),(69,'EMP00069','Lars','Bøllingtoft','lars.bollingtoft@hospital.dk','e9c1c6725c3870d32539d869757a7fa61a16c5f74c248a03e56d8044f36e0ab5','+45 50900114','2022-08-23','ACTIVE',9,'Employee'),(70,'EMP00070','Mads','Bønløkke','mads.bonloekke@hospital.dk','5cdfcc7feed328636f9f59ecd837d7a0b2c94d8a6cfdd59107c0a431dac791f0','+45 50111325','2019-10-14','ACTIVE',10,'Employee'),(71,'EMP00071','Pia','Bønlykke','pia.bonlykke@hospital.dk','2c1f2142d657c8069ec8c47fd49a5513dd71b73d2e6e310ca26052ff21bc5859','+45 50122437','2017-09-08','ACTIVE',1,'Employee'),(72,'EMP00072','Rikke','Børgesen','rikke.boergesen@hospital.dk','a3da505c185efe040ea45e25912ea1f9a04b8f01a8b3a6e7093da8fc26e9aae3','+45 50233548','2018-11-16','ACTIVE',2,'Employee'),(73,'EMP00073','Steffen','Børsting','steffen.borsting@hospital.dk','3df89fd050c744831d1afeb19aa07d2faeca235b267caf42f9589e44e8a3962a','+45 50344659','2020-05-02','ACTIVE',3,'Employee'),(74,'EMP00074','Tanja','Børup','tanja.borup@hospital.dk','bdb850e713324020732c377448eaadd3a08abedce3da9c24363c551c1bf3e4f0','+45 50455770','2016-10-27','INACTIVE',4,'Employee'),(75,'EMP00075','Ulrik','Børve','ulrik.borve@hospital.dk','b71cae306408cb1386337247494c64f7c29321bd9f60031bf4e9c12fa55b8f01','+45 50566881','2021-07-18','ACTIVE',5,'Employee'),(76,'EMP00076','Vibeke','Børving','vibeke.borving@hospital.dk','ae9219971f5488b30aeb72097ee70b0e8b36250327d85751e90302210b75d1b5','+45 50677982','2015-04-21','ACTIVE',6,'Employee'),(77,'EMP00077','Yvonne','Børzen','yvonne.borzen@hospital.dk','7e8ceca557af38e8ea61b263a89a04cfeb569143dd2eb20b1fcc35d5e6edb3d3','+45 50789093','2019-03-13','ACTIVE',7,'Employee'),(78,'EMP00078','Zenia','Bøsgaard','zenia.bosgaard@hospital.dk','54a8f7345d95294a724e9d5160fb75b80f76de685c8023609615771dc9c12f93','+45 50890104','2018-09-25','INACTIVE',8,'Employee'),(79,'EMP00079','Aksel','Bøtker','aksel.botker@hospital.dk','1d94202004497345a7361b1144c2c80b657ed4211da2c00c8fbe295f20086dd1','+45 50901215','2022-11-30','ACTIVE',9,'Employee'),(80,'EMP00080','Bente','Bøving','bente.boving@hospital.dk','7f3c78864037d6e532507695b9b0b86d7d28214894f6e2e447713504a2654a58','+45 50112326','2019-11-19','ACTIVE',10,'Employee'),(81,'EMP00081','Carsten','Bøye','carsten.boye@hospital.dk','8dbc73905315ae50a5bc0ef20b5e417ec064fe4fbe9a855109c130af1a9ff64e','+45 50123437','2017-05-04','ACTIVE',1,'Employee'),(82,'EMP00082','Dorte','Bøytler','dorte.boeytler@hospital.dk','482ae395f13b30f6c403697abf40cc379161c1d5ed2f12f8210a068f6ece19e8','+45 50234548','2018-12-11','ACTIVE',2,'Employee'),(83,'EMP00083','Erik','Bøgh','erik.bogh@hospital.dk','4f8a5219ab2fe1b5620849df56da966426c617fca0ae57ab37dfe42c5c1a4758','+45 50345659','2020-07-06','ACTIVE',3,'Employee'),(84,'EMP00084','Fie','Bøttger','fie.bottger@hospital.dk','f8b45fdc7d0c553280943a74f14fe2e2b6f4856edc359f8924ac09acd373ad61','+45 50456770','2016-02-15','INACTIVE',4,'Employee'),(85,'EMP00085','Gitte','Bøje','gitte.boje@hospital.dk','47936d7988c4c942e59a277a742080d82ce7933c17d5e9432d345b221ecb4c71','+45 50567881','2021-09-09','ACTIVE',5,'Employee'),(86,'EMP00086','Hans','Bølling','hans.bolling@hospital.dk','ef51fbafa6fd81a4931082e2056f4dc61ca39dcfc49de602dd38e2170289128b','+45 50678982','2015-07-20','ACTIVE',6,'Employee'),(87,'EMP00087','Inge','Børsting','inge.borsting@hospital.dk','8308bba8aea9d7ac04175ac6abd2978f7eee5de4aa975166c267237d6c353cf8','+45 50789093','2019-04-03','ACTIVE',7,'Employee'),(88,'EMP00088','Jens','Bøttcher','jens.boettcher@hospital.dk','8f645b7b6a2c0ffb06ba5f39d4bd5bc5f036f9a73caf036b730657afd08a2b53','+45 50890104','2018-11-14','INACTIVE',8,'Employee'),(89,'EMP00089','Karen','Bøving','karen.boving@hospital.dk','6d397e8c8b615738a16c479156386d75b1125aafd6b73024030efb59f214f328','+45 50901215','2022-12-11','ACTIVE',9,'Employee'),(90,'EMP00090','Lene','Bøye','lene.boye@hospital.dk','ccdde21c8e6e0088a861b2036f8826e8f3c6c65de64096242624a2c02a20d3b3','+45 50112326','2019-06-28','ACTIVE',10,'Manager'),(91,'EMP00091','Morten','Bøyesen','morten.boyesen@hospital.dk','484088edfe7e04ba032a6751135cd84de3f1c79af28b89feda7bbd07f331aab4','+45 50123437','2017-10-17','ACTIVE',1,'Employee'),(92,'EMP00092','Niels','Bøytler','niels.boeytler@hospital.dk','3576493c7dc902b9d7ce67600d9d417d97b91977c72ac5e5dd6028c541b9ad1a','+45 50234548','2018-12-22','ACTIVE',2,'Employee'),(93,'EMP00093','Ole','Bøgholm','ole.bogholm@hospital.dk','332c8a537dcfc770b94a40b0d9a7a095192bc2f77d48e4f563ecb63a50e70071','+45 50345659','2020-08-13','ACTIVE',3,'Employee'),(94,'EMP00094','Pia','Bøje','pia.boje@hospital.dk','07d2069e529ad3424b4fff9e186070a595d95fe70a557b117eb394e7b009ec17','+45 50456770','2016-03-30','INACTIVE',4,'Employee'),(95,'EMP00095','Rikke','Bøllingtoft','rikke.bollingtoft@hospital.dk','8c12389064a05bae9457de9323da18e53d7bee7805382fc8c52953dbf7e700e4','+45 50567881','2021-10-21','ACTIVE',5,'Employee'),(96,'EMP00096','Steen','Bønløkke','steen.bonloekke@hospital.dk','082ab26b41a0211017e1996dfb3d0b130e5c914975c9a3021c4625b8dde3a376','+45 50678982','2015-08-02','ACTIVE',6,'Employee'),(97,'EMP00097','Tove','Bønlykke','tove.bonlykke@hospital.dk','7f318caf9b696999dd6fdfd5af306485eafc05c7b743b9bc5d1ca2f88d2e91ff','+45 50789093','2019-04-15','ACTIVE',7,'Employee'),(98,'EMP00098','Ulla','Børgesen','ulla.boergesen@hospital.dk','4500ca57f2fd0c3b7396eb2aa0c5db61050a9f6bd39bba27dcd9c212edc47896','+45 50890104','2018-11-27','INACTIVE',8,'Employee'),(99,'EMP00099','Vivi','Børsting','vivi.borsting@hospital.dk','ed6cac80d1bec540a0aa71ab87a5903c27cf72989877fd0c9f2c258398442c64','+45 50901215','2022-11-10','ACTIVE',9,'Employee'),(100,'EMP00100','Yvonne','Bendtsen','yvonne.bendtsen@hospital.dk','49fbac107a92890920728fae0581a64a854d7926c1f405b537dc942a47efa151','+45 50112326','2019-07-06','ACTIVE',10,'Employee'),(102,'ADM00001','Admin','User','admin@shift.dk','$2a$10$s53B7sTK0OeOrRP/VmrT6uZhMrmAOQXUxN/Rle/1aLnlgM4iobIx6','+45 00000001','2026-05-25','ACTIVE',1,'Administrator');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_employee_ins` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN
    IF LENGTH(NEW.login_password) < 8 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Password needs to be longer than 8 chars.';
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_insert` AFTER INSERT ON `employee` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type,
                           entity_id,
                           action_type,
                           db_user,
                           action_datetime,
                           old_value_snapshot,
                           new_value_snapshot)
    VALUES ('EMPLOYEE',
            NEW.employee_id,
            'INSERT',
            USER(),
            NOW(),
            NULL,
            JSON_OBJECT(
                    'employee_id', NEW.employee_id,
                    'employee_number', NEW.employee_number,
                    'first_name', NEW.first_name,
                    'last_name', NEW.last_name,
                    'email', NEW.email,
                    'phone_number', NEW.phone_number,
                    'hire_date', NEW.hire_date,
                    'employment_status', NEW.employment_status,
                    'primary_work_location_id', NEW.primary_work_location_id,
                    'login_password', '*****', -- hidden password
                    'user_role', NEW.user_role
            ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_employee_update` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
    IF LENGTH(NEW.login_password) < 8 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Password needs to be longer than 8 chars.';
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_update` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type,
                           entity_id,
                           action_type,
                           db_user,
                           action_datetime,
                           old_value_snapshot,
                           new_value_snapshot)
    VALUES ('EMPLOYEE',
            OLD.employee_id,
            'UPDATE',
            USER(),
            NOW(),
            JSON_OBJECT(
                    'employee_id', OLD.employee_id,
                    'employee_number', OLD.employee_number,
                    'first_name', OLD.first_name,
                    'last_name', OLD.last_name,
                    'email', OLD.email,
                    'phone_number', OLD.phone_number,
                    'hire_date', OLD.hire_date,
                    'employment_status', OLD.employment_status,
                    'primary_work_location_id', OLD.primary_work_location_id,
                    'login_password', '*****', -- Password hidden
                    'user_role', OLD.user_role
            ),
            JSON_OBJECT(
                    'employee_id', NEW.employee_id,
                    'employee_number', NEW.employee_number,
                    'first_name', NEW.first_name,
                    'last_name', NEW.last_name,
                    'email', NEW.email,
                    'phone_number', NEW.phone_number,
                    'hire_date', NEW.hire_date,
                    'employment_status', NEW.employment_status,
                    'primary_work_location_id', NEW.primary_work_location_id,
                    'login_password', '*****', -- Password hidden
                    'user_role', NEW.user_role
            ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_delete` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type,
                           entity_id,
                           action_type,
                           db_user,
                           action_datetime,
                           old_value_snapshot,
                           new_value_snapshot)
    VALUES ('EMPLOYEE',
            OLD.employee_id,
            'DELETE',
            USER(),
            NOW(),
            JSON_OBJECT(
                    'employee_id', OLD.employee_id,
                    'employee_number', OLD.employee_number,
                    'first_name', OLD.first_name,
                    'last_name', OLD.last_name,
                    'email', OLD.email,
                    'phone_number', OLD.phone_number,
                    'hire_date', OLD.hire_date,
                    'employment_status', OLD.employment_status,
                    'primary_work_location_id', OLD.primary_work_location_id,
                    'login_password', '*****', -- Password hidden
                    'user_role', OLD.user_role
            ),
            NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_contract`
--

DROP TABLE IF EXISTS `employee_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `department_id` int NOT NULL,
  `contract_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `weekly_hours` int NOT NULL,
  `salary_amount` decimal(12,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`contract_id`),
  KEY `idx_dep_type_ac` (`department_id`,`contract_type`,`is_active`),
  KEY `fk_contract_employee` (`employee_id`),
  CONSTRAINT `fk_contract_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `fk_contract_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_contract`
--

LOCK TABLES `employee_contract` WRITE;
/*!40000 ALTER TABLE `employee_contract` DISABLE KEYS */;
INSERT INTO `employee_contract` VALUES (1,1,2,'PART_TIME','2025-04-08',NULL,31,51264.08,1),(2,11,12,'TEMP','2024-02-17',NULL,31,69091.57,1),(3,21,2,'FULL_TIME','2026-04-19',NULL,31,56363.17,1),(4,31,12,'PART_TIME','2023-01-10',NULL,31,54076.13,1),(5,41,2,'TEMP','2023-06-16',NULL,31,45177.93,1),(6,51,12,'FULL_TIME','2022-10-11',NULL,31,56695.56,1),(7,61,2,'PART_TIME','2022-05-29',NULL,31,35614.23,1),(8,71,12,'TEMP','2021-07-08',NULL,31,51410.29,1),(9,81,2,'FULL_TIME','2024-05-01',NULL,31,61267.51,1),(10,91,12,'PART_TIME','2025-07-28',NULL,31,66390.12,1),(11,2,3,'TEMP','2023-10-27',NULL,32,35004.70,1),(12,12,13,'FULL_TIME','2023-03-07',NULL,32,72578.27,1),(13,22,3,'PART_TIME','2021-04-15',NULL,32,68944.83,1),(14,32,13,'TEMP','2023-12-22',NULL,32,61747.38,1),(15,42,3,'FULL_TIME','2026-04-26',NULL,32,37696.69,1),(16,52,13,'PART_TIME','2024-10-16',NULL,32,45510.81,1),(17,62,3,'TEMP','2024-01-07',NULL,32,50435.12,1),(18,72,13,'FULL_TIME','2022-12-23',NULL,32,73669.93,1),(19,82,3,'PART_TIME','2021-02-22',NULL,32,70812.70,1),(20,92,13,'TEMP','2023-02-12',NULL,32,47411.95,1),(21,3,4,'FULL_TIME','2022-04-09',NULL,33,68512.75,1),(22,13,14,'PART_TIME','2021-04-26',NULL,33,40034.63,1),(23,23,4,'TEMP','2021-10-07',NULL,33,69043.22,1),(24,33,14,'FULL_TIME','2022-06-19',NULL,33,36509.46,1),(25,43,4,'PART_TIME','2026-03-18',NULL,33,37290.73,1),(26,53,14,'TEMP','2025-05-22',NULL,33,64938.74,1),(27,63,4,'FULL_TIME','2025-05-10',NULL,33,63219.58,1),(28,73,14,'PART_TIME','2021-02-27',NULL,33,61723.29,1),(29,83,4,'TEMP','2023-10-29',NULL,33,48766.32,1),(30,93,14,'FULL_TIME','2024-09-09',NULL,33,56050.40,1),(31,4,5,'PART_TIME','2022-08-02',NULL,34,71060.78,1),(32,14,15,'TEMP','2024-02-07',NULL,34,50701.27,1),(33,24,5,'FULL_TIME','2022-07-17',NULL,34,48777.17,1),(34,34,15,'PART_TIME','2023-01-24',NULL,34,35454.79,1),(35,44,5,'TEMP','2025-02-19',NULL,34,39646.49,1),(36,54,15,'FULL_TIME','2021-07-09',NULL,34,39190.25,1),(37,64,5,'PART_TIME','2021-09-25',NULL,34,72796.37,1),(38,74,15,'TEMP','2025-06-21',NULL,34,35418.71,1),(39,84,5,'FULL_TIME','2023-05-31',NULL,34,62788.28,1),(40,94,15,'PART_TIME','2021-10-23',NULL,34,39208.94,1),(41,5,6,'TEMP','2026-04-30',NULL,35,64875.31,1),(42,15,16,'FULL_TIME','2022-08-01',NULL,35,44750.50,1),(43,25,6,'PART_TIME','2025-09-11',NULL,35,71381.66,1),(44,35,16,'TEMP','2025-07-03',NULL,35,38497.10,1),(45,45,6,'FULL_TIME','2021-03-17',NULL,35,54010.04,1),(46,55,16,'PART_TIME','2023-06-23',NULL,35,44716.80,1),(47,65,6,'TEMP','2023-01-15',NULL,35,48528.79,1),(48,75,16,'FULL_TIME','2021-09-27',NULL,35,44595.81,1),(49,85,6,'PART_TIME','2022-11-09',NULL,35,55561.32,1),(50,95,16,'TEMP','2022-12-13',NULL,35,59302.82,1),(51,6,7,'FULL_TIME','2025-08-02',NULL,36,71701.71,1),(52,16,17,'PART_TIME','2025-08-11',NULL,36,73607.19,1),(53,26,7,'TEMP','2024-03-26',NULL,36,38221.25,1),(54,36,17,'FULL_TIME','2025-03-17',NULL,36,68739.03,1),(55,46,7,'PART_TIME','2023-04-19',NULL,36,47050.33,1),(56,56,17,'TEMP','2021-12-23',NULL,36,40304.94,1),(57,66,7,'FULL_TIME','2025-01-28',NULL,36,67340.86,1),(58,76,17,'PART_TIME','2024-08-26',NULL,36,41731.98,1),(59,86,7,'TEMP','2021-07-20',NULL,36,71839.94,1),(60,96,17,'FULL_TIME','2021-03-14',NULL,36,74370.99,1),(61,7,8,'PART_TIME','2025-12-30',NULL,37,51489.41,1),(62,17,18,'TEMP','2021-10-14',NULL,37,73959.84,1),(63,27,8,'FULL_TIME','2024-07-07',NULL,37,66832.25,1),(64,37,18,'PART_TIME','2021-03-16',NULL,37,49174.21,1),(65,47,8,'TEMP','2021-04-28',NULL,37,57819.73,1),(66,57,18,'FULL_TIME','2026-01-01',NULL,37,61006.97,1),(67,67,8,'PART_TIME','2026-03-19',NULL,37,43754.89,1),(68,77,18,'TEMP','2020-12-17',NULL,37,47280.13,1),(69,87,8,'FULL_TIME','2023-05-08',NULL,37,69528.54,1),(70,97,18,'PART_TIME','2022-11-11',NULL,37,60521.13,1),(71,8,9,'TEMP','2025-01-03',NULL,38,49144.66,1),(72,18,19,'FULL_TIME','2026-05-11',NULL,38,74058.35,1),(73,28,9,'PART_TIME','2021-09-09',NULL,38,49806.79,1),(74,38,19,'TEMP','2024-11-29',NULL,38,44803.92,1),(75,48,9,'FULL_TIME','2024-02-21',NULL,38,48013.30,1),(76,58,19,'PART_TIME','2024-04-05',NULL,38,74017.39,1),(77,68,9,'TEMP','2022-07-13',NULL,38,59210.75,1),(78,78,19,'FULL_TIME','2021-06-06',NULL,38,63847.73,1),(79,88,9,'PART_TIME','2021-07-23',NULL,38,45210.15,1),(80,98,19,'TEMP','2022-12-23',NULL,38,49363.37,1),(81,9,10,'FULL_TIME','2021-05-10',NULL,39,56012.69,1),(82,19,20,'PART_TIME','2021-08-29',NULL,39,64970.68,1),(83,29,10,'TEMP','2025-07-27',NULL,39,55328.76,1),(84,39,20,'FULL_TIME','2025-12-02',NULL,39,71510.36,1),(85,49,10,'PART_TIME','2024-09-30',NULL,39,65737.95,1),(86,59,20,'TEMP','2021-04-05',NULL,39,50427.93,1),(87,69,10,'FULL_TIME','2025-10-10',NULL,39,51489.04,1),(88,79,20,'PART_TIME','2022-06-16',NULL,39,49440.50,1),(89,89,10,'TEMP','2022-11-10',NULL,39,40968.09,1),(90,99,20,'FULL_TIME','2021-12-24',NULL,39,58429.16,1),(91,10,11,'PART_TIME','2023-08-12',NULL,30,66441.19,1),(92,20,1,'TEMP','2024-03-08',NULL,30,61520.18,1),(93,30,11,'FULL_TIME','2025-11-02',NULL,30,55912.66,1),(94,40,1,'PART_TIME','2024-09-19',NULL,30,73659.04,1),(95,50,11,'TEMP','2021-05-29',NULL,30,61307.81,1),(96,60,1,'FULL_TIME','2023-05-13',NULL,30,66917.06,1),(97,70,11,'PART_TIME','2024-08-09',NULL,30,44653.80,1),(98,80,1,'TEMP','2025-02-28',NULL,30,51168.66,1),(99,90,11,'FULL_TIME','2024-07-06',NULL,30,55320.35,1),(100,100,1,'PART_TIME','2023-08-14',NULL,30,35568.65,1);
/*!40000 ALTER TABLE `employee_contract` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_contract_ins` BEFORE INSERT ON `employee_contract` FOR EACH ROW BEGIN
    IF NEW.salary_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'salary_amount needs to be positive';
    END IF;
    IF NEW.weekly_hours <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'weekly_hours need to be positive';
    END IF;
    IF NEW.start_date > NEW.end_date THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'start_date cannot be after end_date';
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_no_contract_overlap_ins` BEFORE INSERT ON `employee_contract` FOR EACH ROW BEGIN
    IF NEW.is_active = 1 AND EXISTS (SELECT 1
                                     FROM employee_contract ec
                                     WHERE ec.employee_id = NEW.employee_id
                                       AND ec.is_active = 1
                                       AND NEW.start_date <= IFNULL(ec.end_date, '9999-12-31') -- New contract starts before an existing active contract ended
                                       AND ec.start_date <= IFNULL(NEW.end_date, '9999-12-31') -- Existing contract starts before new contract ends
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Contract period overlaps with an existing active contract.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_contract_insert` AFTER INSERT ON `employee_contract` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('EMPLOYEE_CONTRACT', NEW.contract_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('contract_id', NEW.contract_id, 'employee_id', NEW.employee_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_contract_update` BEFORE UPDATE ON `employee_contract` FOR EACH ROW BEGIN
    IF NEW.salary_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'salary_amount needs to be positive';
    END IF;
    IF NEW.weekly_hours <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'weekly_hours need to be positive';
    END IF;
    IF NEW.start_date > NEW.end_date THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'start_date cannot be after end_date';
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_no_contract_overlap_upd` BEFORE UPDATE ON `employee_contract` FOR EACH ROW BEGIN
    IF NEW.is_active = 1 AND EXISTS (SELECT 1
                                     FROM employee_contract ec
                                     WHERE ec.employee_id = NEW.employee_id
                                       AND ec.contract_id != OLD.contract_id
                                       AND ec.is_active = 1
                                       AND NEW.start_date <= IFNULL(ec.end_date, '9999-12-31')
                                       AND ec.start_date <= IFNULL(NEW.end_date, '9999-12-31')) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Contract period overlaps with an existing active contract.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_contract_update` BEFORE UPDATE ON `employee_contract` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('EMPLOYEE_CONTRACT', OLD.contract_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('contract_id', OLD.contract_id), JSON_OBJECT('contract_id', NEW.contract_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_contract_delete` BEFORE DELETE ON `employee_contract` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('EMPLOYEE_CONTRACT', OLD.contract_id, 'DELETE', USER(), NOW(), JSON_OBJECT('contract_id', OLD.contract_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_job_role`
--

DROP TABLE IF EXISTS `employee_job_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_job_role` (
  `employee_job_role_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `job_role_id` int NOT NULL,
  `assigned_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `proficiency_level` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`employee_job_role_id`),
  UNIQUE KEY `unq_emp_job` (`employee_id`,`job_role_id`),
  KEY `fk_ejr_role` (`job_role_id`),
  CONSTRAINT `fk_ejr_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_ejr_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_role` (`job_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_job_role`
--

LOCK TABLES `employee_job_role` WRITE;
/*!40000 ALTER TABLE `employee_job_role` DISABLE KEYS */;
INSERT INTO `employee_job_role` VALUES (1,1,2,'2026-05-24',NULL,'INTERMEDIATE'),(2,11,12,'2026-05-14',NULL,'ADVANCED'),(3,21,10,'2026-05-04',NULL,'BEGINNER'),(4,31,8,'2026-04-24',NULL,'INTERMEDIATE'),(5,41,6,'2026-04-14',NULL,'ADVANCED'),(6,51,4,'2026-04-04',NULL,'BEGINNER'),(7,61,2,'2026-03-25',NULL,'INTERMEDIATE'),(8,71,12,'2026-03-15',NULL,'ADVANCED'),(9,81,10,'2026-03-05',NULL,'BEGINNER'),(10,91,8,'2026-02-23',NULL,'INTERMEDIATE'),(11,2,3,'2026-05-23',NULL,'ADVANCED'),(12,12,1,'2026-05-13',NULL,'BEGINNER'),(13,22,11,'2026-05-03',NULL,'INTERMEDIATE'),(14,32,9,'2026-04-23',NULL,'ADVANCED'),(15,42,7,'2026-04-13',NULL,'BEGINNER'),(16,52,5,'2026-04-03',NULL,'INTERMEDIATE'),(17,62,3,'2026-03-24',NULL,'ADVANCED'),(18,72,1,'2026-03-14',NULL,'BEGINNER'),(19,82,11,'2026-03-04',NULL,'INTERMEDIATE'),(20,92,9,'2026-02-22',NULL,'ADVANCED'),(21,3,4,'2026-05-22',NULL,'BEGINNER'),(22,13,2,'2026-05-12',NULL,'INTERMEDIATE'),(23,23,12,'2026-05-02',NULL,'ADVANCED'),(24,33,10,'2026-04-22',NULL,'BEGINNER'),(25,43,8,'2026-04-12',NULL,'INTERMEDIATE'),(26,53,6,'2026-04-02',NULL,'ADVANCED'),(27,63,4,'2026-03-23',NULL,'BEGINNER'),(28,73,2,'2026-03-13',NULL,'INTERMEDIATE'),(29,83,12,'2026-03-03',NULL,'ADVANCED'),(30,93,10,'2026-02-21',NULL,'BEGINNER'),(31,4,5,'2026-05-21',NULL,'INTERMEDIATE'),(32,14,3,'2026-05-11',NULL,'ADVANCED'),(33,24,1,'2026-05-01',NULL,'BEGINNER'),(34,34,11,'2026-04-21',NULL,'INTERMEDIATE'),(35,44,9,'2026-04-11',NULL,'ADVANCED'),(36,54,7,'2026-04-01',NULL,'BEGINNER'),(37,64,5,'2026-03-22',NULL,'INTERMEDIATE'),(38,74,3,'2026-03-12',NULL,'ADVANCED'),(39,84,1,'2026-03-02',NULL,'BEGINNER'),(40,94,11,'2026-02-20',NULL,'INTERMEDIATE'),(41,5,6,'2026-05-20',NULL,'ADVANCED'),(42,15,4,'2026-05-10',NULL,'BEGINNER'),(43,25,2,'2026-04-30',NULL,'INTERMEDIATE'),(44,35,12,'2026-04-20',NULL,'ADVANCED'),(45,45,10,'2026-04-10',NULL,'BEGINNER'),(46,55,8,'2026-03-31',NULL,'INTERMEDIATE'),(47,65,6,'2026-03-21',NULL,'ADVANCED'),(48,75,4,'2026-03-11',NULL,'BEGINNER'),(49,85,2,'2026-03-01',NULL,'INTERMEDIATE'),(50,95,12,'2026-02-19',NULL,'ADVANCED'),(51,6,7,'2026-05-19',NULL,'BEGINNER'),(52,16,5,'2026-05-09',NULL,'INTERMEDIATE'),(53,26,3,'2026-04-29',NULL,'ADVANCED'),(54,36,1,'2026-04-19',NULL,'BEGINNER'),(55,46,11,'2026-04-09',NULL,'INTERMEDIATE'),(56,56,9,'2026-03-30',NULL,'ADVANCED'),(57,66,7,'2026-03-20',NULL,'BEGINNER'),(58,76,5,'2026-03-10',NULL,'INTERMEDIATE'),(59,86,3,'2026-02-28',NULL,'ADVANCED'),(60,96,1,'2026-02-18',NULL,'BEGINNER'),(61,7,8,'2026-05-18',NULL,'INTERMEDIATE'),(62,17,6,'2026-05-08',NULL,'ADVANCED'),(63,27,4,'2026-04-28',NULL,'BEGINNER'),(64,37,2,'2026-04-18',NULL,'INTERMEDIATE'),(65,47,12,'2026-04-08',NULL,'ADVANCED'),(66,57,10,'2026-03-29',NULL,'BEGINNER'),(67,67,8,'2026-03-19',NULL,'INTERMEDIATE'),(68,77,6,'2026-03-09',NULL,'ADVANCED'),(69,87,4,'2026-02-27',NULL,'BEGINNER'),(70,97,2,'2026-02-17',NULL,'INTERMEDIATE'),(71,8,9,'2026-05-17',NULL,'ADVANCED'),(72,18,7,'2026-05-07',NULL,'BEGINNER'),(73,28,5,'2026-04-27',NULL,'INTERMEDIATE'),(74,38,3,'2026-04-17',NULL,'ADVANCED'),(75,48,1,'2026-04-07',NULL,'BEGINNER'),(76,58,11,'2026-03-28',NULL,'INTERMEDIATE'),(77,68,9,'2026-03-18',NULL,'ADVANCED'),(78,78,7,'2026-03-08',NULL,'BEGINNER'),(79,88,5,'2026-02-26',NULL,'INTERMEDIATE'),(80,98,3,'2026-02-16',NULL,'ADVANCED'),(81,9,10,'2026-05-16',NULL,'BEGINNER'),(82,19,8,'2026-05-06',NULL,'INTERMEDIATE'),(83,29,6,'2026-04-26',NULL,'ADVANCED'),(84,39,4,'2026-04-16',NULL,'BEGINNER'),(85,49,2,'2026-04-06',NULL,'INTERMEDIATE'),(86,59,12,'2026-03-27',NULL,'ADVANCED'),(87,69,10,'2026-03-17',NULL,'BEGINNER'),(88,79,8,'2026-03-07',NULL,'INTERMEDIATE'),(89,89,6,'2026-02-25',NULL,'ADVANCED'),(90,99,4,'2026-02-15',NULL,'BEGINNER'),(91,10,11,'2026-05-15',NULL,'INTERMEDIATE'),(92,20,9,'2026-05-05',NULL,'ADVANCED'),(93,30,7,'2026-04-25',NULL,'BEGINNER'),(94,40,5,'2026-04-15',NULL,'INTERMEDIATE'),(95,50,3,'2026-04-05',NULL,'ADVANCED'),(96,60,1,'2026-03-26',NULL,'BEGINNER'),(97,70,11,'2026-03-16',NULL,'INTERMEDIATE'),(98,80,9,'2026-03-06',NULL,'ADVANCED'),(99,90,7,'2026-02-24',NULL,'BEGINNER'),(100,100,5,'2026-02-14',NULL,'INTERMEDIATE');
/*!40000 ALTER TABLE `employee_job_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_job_role_insert` AFTER INSERT ON `employee_job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('EMPLOYEE_JOB_ROLE', NEW.employee_job_role_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('employee_id', NEW.employee_id, 'job_role_id', NEW.job_role_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_job_role_update` BEFORE UPDATE ON `employee_job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('EMPLOYEE_JOB_ROLE', OLD.employee_job_role_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('employee_job_role_id', OLD.employee_job_role_id), JSON_OBJECT('employee_job_role_id', NEW.employee_job_role_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_employee_job_role_delete` BEFORE DELETE ON `employee_job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('EMPLOYEE_JOB_ROLE', OLD.employee_job_role_id, 'DELETE', USER(), NOW(), JSON_OBJECT('employee_job_role_id', OLD.employee_job_role_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `job_role`
--

DROP TABLE IF EXISTS `job_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_role` (
  `job_role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_role_description` text COLLATE utf8mb4_unicode_ci,
  `is_certification_required` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`job_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_role`
--

LOCK TABLES `job_role` WRITE;
/*!40000 ALTER TABLE `job_role` DISABLE KEYS */;
INSERT INTO `job_role` VALUES (1,'Sygeplejerske','Uddannet sygeplejerske',1),(2,'Læge','Speciallæge',1),(3,'Afdelingsleder','Leder af afdeling',0),(4,'Social- og sundhedsassistent','Støtter patientpleje',0),(5,'Receptionist','Reception og patientmodtagelse',0),(6,'Sikkerhedsvagt','Sikkerhed på hospitalet',1),(7,'Rengøringsassistent','Rengøring af faciliteter',0),(8,'Bioanalytiker','Laboratoriearbejde',1),(9,'Farmaceut','Medicinhåndtering',1),(10,'Portør','Transport af patienter',0),(11,'Lagerarbejder','Lager og logistik',0),(12,'IT-supporter','Teknisk support',0);
/*!40000 ALTER TABLE `job_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_job_role_insert` AFTER INSERT ON `job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('JOB_ROLE', NEW.job_role_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('role_name', NEW.role_name));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_job_role_update` BEFORE UPDATE ON `job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('JOB_ROLE', OLD.job_role_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('role_name', OLD.role_name), JSON_OBJECT('role_name', NEW.role_name));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_job_role_delete` BEFORE DELETE ON `job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('JOB_ROLE', OLD.job_role_id, 'DELETE', USER(), NOW(), JSON_OBJECT('job_role_id', OLD.job_role_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `leave_approval`
--

DROP TABLE IF EXISTS `leave_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_approval` (
  `leave_approval_id` int NOT NULL AUTO_INCREMENT,
  `leave_request_id` int NOT NULL,
  `approver_employee_id` int NOT NULL,
  `decision` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_comment` text COLLATE utf8mb4_unicode_ci,
  `decision_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`leave_approval_id`),
  KEY `fk_leave_approval_request` (`leave_request_id`),
  KEY `fk_leave_approval_employee` (`approver_employee_id`),
  CONSTRAINT `fk_leave_approval_employee` FOREIGN KEY (`approver_employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_leave_approval_request` FOREIGN KEY (`leave_request_id`) REFERENCES `leave_request` (`leave_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_approval`
--

LOCK TABLES `leave_approval` WRITE;
/*!40000 ALTER TABLE `leave_approval` DISABLE KEYS */;
INSERT INTO `leave_approval` VALUES (1,11,87,'REJECTED','No conflicts with schedule','2026-05-02 20:59:14'),(2,24,52,'APPROVED','Leave granted','2026-04-29 14:59:14'),(3,28,50,'REJECTED',NULL,'2026-05-21 10:59:14'),(4,39,65,'PENDING','Coverage confirmed','2026-05-12 10:59:14'),(5,41,93,'APPROVED',NULL,'2026-04-28 05:59:14'),(6,45,3,'APPROVED',NULL,'2026-04-28 19:59:14'),(7,54,7,'REJECTED','Approved by department manager',NULL),(8,57,70,'APPROVED','No conflicts with schedule','2026-05-14 12:59:14'),(9,1,13,'APPROVED',NULL,'2026-05-24 08:59:14'),(10,4,100,'PENDING','Standard sick leave policy applied','2026-05-23 16:59:14'),(11,7,22,'APPROVED','Approved without issue','2026-05-26 03:59:14'),(12,17,93,'PENDING',NULL,'2026-05-25 16:59:14'),(13,33,85,'REJECTED',NULL,'2026-05-24 12:59:14'),(14,47,86,'APPROVED',NULL,NULL),(15,51,77,'APPROVED','HR noted medical absence','2026-05-24 11:59:14'),(16,53,68,'APPROVED',NULL,'2026-05-26 07:59:14'),(17,61,82,'APPROVED',NULL,NULL),(18,64,64,'APPROVED','Standard sick leave policy applied','2026-05-28 05:59:14'),(19,66,46,'APPROVED','Medical leave approved','2026-05-27 00:59:14'),(20,13,40,'APPROVED',NULL,NULL),(21,25,56,'APPROVED','Approved under statutory leave policy',NULL),(22,29,79,'APPROVED',NULL,'2026-05-03 21:59:14'),(23,40,84,'APPROVED','Approved under statutory leave policy','2026-05-06 13:59:14'),(24,42,49,'REJECTED',NULL,'2026-05-10 21:59:14'),(25,55,90,'APPROVED','Approved under statutory leave policy',NULL),(26,58,49,'APPROVED','Approved under statutory leave policy',NULL),(27,60,93,'APPROVED','Approved under statutory leave policy','2026-05-06 10:59:14'),(28,68,23,'APPROVED','Approved under statutory leave policy','2026-05-16 04:59:14'),(29,70,18,'APPROVED',NULL,'2026-05-18 08:59:14'),(30,2,18,'APPROVED',NULL,NULL),(31,8,5,'APPROVED','Approved under statutory leave policy',NULL),(32,15,85,'APPROVED','Approved under statutory leave policy','2026-04-29 13:59:14'),(33,18,14,'APPROVED',NULL,'2026-04-30 17:59:14'),(34,20,7,'APPROVED',NULL,NULL),(35,34,27,'APPROVED',NULL,'2026-05-01 04:59:14'),(36,48,31,'APPROVED',NULL,'2026-05-05 15:59:14'),(37,52,70,'APPROVED','Approved under statutory leave policy','2026-05-17 10:59:14'),(38,67,28,'APPROVED','Approved under statutory leave policy','2026-05-04 17:59:14'),(39,9,85,'REJECTED','Schedule permits absence','2026-05-16 20:59:14'),(40,14,41,'REJECTED',NULL,'2026-05-25 11:59:14'),(41,22,94,'APPROVED','Schedule permits absence','2026-05-09 12:59:14'),(42,26,8,'APPROVED','Schedule permits absence','2026-05-17 20:59:14'),(43,30,93,'REJECTED','Reviewed and approved','2026-05-20 15:59:14'),(44,43,13,'PENDING',NULL,'2026-05-20 18:59:14'),(45,69,8,'APPROVED',NULL,'2026-05-06 14:59:14'),(46,5,4,'APPROVED',NULL,NULL),(47,16,48,'REJECTED','No issues detected',NULL),(48,19,97,'APPROVED','No issues detected','2026-05-09 17:59:14'),(49,21,80,'REJECTED',NULL,NULL),(50,32,71,'REJECTED',NULL,NULL),(51,35,56,'APPROVED',NULL,'2026-05-22 10:59:14'),(52,49,2,'APPROVED',NULL,NULL),(53,62,39,'PENDING',NULL,'2026-05-09 23:59:14'),(54,10,87,'APPROVED','Approved pending coverage confirmation','2026-05-28 07:59:14'),(55,12,67,'REJECTED','Schedule permits absence',NULL),(56,23,43,'APPROVED','Reviewed and approved','2026-04-30 01:59:14'),(57,27,29,'APPROVED',NULL,NULL),(58,31,37,'APPROVED',NULL,NULL),(59,38,38,'APPROVED',NULL,NULL),(60,44,2,'PENDING',NULL,'2026-05-17 08:59:14'),(61,56,37,'APPROVED',NULL,'2026-04-27 17:59:14'),(62,59,76,'APPROVED',NULL,NULL),(63,3,71,'APPROVED','Schedule permits absence',NULL),(64,6,10,'REJECTED','No issues detected','2026-05-21 01:59:14'),(65,36,95,'APPROVED',NULL,NULL),(66,37,87,'PENDING',NULL,NULL),(67,46,5,'REJECTED',NULL,NULL),(68,50,92,'APPROVED','Approved pending coverage confirmation',NULL),(69,63,12,'APPROVED','Reviewed and approved','2026-04-30 18:59:14'),(70,65,33,'APPROVED',NULL,'2026-05-15 07:59:14');
/*!40000 ALTER TABLE `leave_approval` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_approval_insert` AFTER INSERT ON `leave_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_APPROVAL', NEW.leave_approval_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('leave_request_id', NEW.leave_request_id, 'decision', NEW.decision));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_approval_update` BEFORE UPDATE ON `leave_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_APPROVAL', OLD.leave_approval_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('decision', OLD.decision), JSON_OBJECT('decision', NEW.decision));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_approval_delete` BEFORE DELETE ON `leave_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_APPROVAL', OLD.leave_approval_id, 'DELETE', USER(), NOW(), JSON_OBJECT('leave_approval_id', OLD.leave_approval_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `leave_ledger`
--

DROP TABLE IF EXISTS `leave_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_ledger` (
  `leave_ledger_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `change_amount_days` decimal(6,2) DEFAULT NULL,
  `transaction_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_entity_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_entity_id` int DEFAULT NULL,
  `transaction_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`leave_ledger_id`),
  KEY `idx_leave_ledger_emp_type` (`employee_id`,`leave_type_id`),
  KEY `fk_leave_ledger_type` (`leave_type_id`),
  CONSTRAINT `fk_leave_ledger_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_leave_ledger_type` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_ledger`
--

LOCK TABLES `leave_ledger` WRITE;
/*!40000 ALTER TABLE `leave_ledger` DISABLE KEYS */;
INSERT INTO `leave_ledger` VALUES (1,1,2,2.00,'USAGE','LeaveRequest',1,'2026-05-24 10:59:14'),(2,11,4,2.00,'USAGE','LeaveRequest',11,'2026-05-14 10:59:14'),(3,21,6,2.00,'USAGE','LeaveRequest',21,'2026-05-04 10:59:14'),(4,31,8,2.00,'USAGE','LeaveRequest',31,'2026-05-24 10:59:14'),(5,41,2,2.00,'USAGE','LeaveRequest',41,'2026-05-14 10:59:14'),(6,51,4,2.00,'USAGE','LeaveRequest',51,'2026-05-04 10:59:14'),(7,61,6,2.00,'USAGE','LeaveRequest',61,'2026-05-24 10:59:14'),(8,71,8,2.00,'USAGE','LeaveRequest',71,'2026-05-14 10:59:14'),(9,81,2,2.00,'USAGE','LeaveRequest',81,'2026-05-04 10:59:14'),(10,91,4,2.00,'USAGE','LeaveRequest',91,'2026-05-24 10:59:14'),(11,2,3,3.00,'ACCRUAL','LeaveRequest',2,'2026-05-23 10:59:14'),(12,12,5,3.00,'ACCRUAL','LeaveRequest',12,'2026-05-13 10:59:14'),(13,22,7,3.00,'ACCRUAL','LeaveRequest',22,'2026-05-03 10:59:14'),(14,32,1,3.00,'ACCRUAL','LeaveRequest',32,'2026-05-23 10:59:14'),(15,42,3,3.00,'ACCRUAL','LeaveRequest',42,'2026-05-13 10:59:14'),(16,52,5,3.00,'ACCRUAL','LeaveRequest',52,'2026-05-03 10:59:14'),(17,62,7,3.00,'ACCRUAL','LeaveRequest',62,'2026-05-23 10:59:14'),(18,72,1,3.00,'ACCRUAL','LeaveRequest',72,'2026-05-13 10:59:14'),(19,82,3,3.00,'ACCRUAL','LeaveRequest',82,'2026-05-03 10:59:14'),(20,92,5,3.00,'ACCRUAL','LeaveRequest',92,'2026-05-23 10:59:14'),(21,3,4,4.00,'USAGE','LeaveRequest',3,'2026-05-22 10:59:14'),(22,13,6,4.00,'USAGE','LeaveRequest',13,'2026-05-12 10:59:14'),(23,23,8,4.00,'USAGE','LeaveRequest',23,'2026-05-02 10:59:14'),(24,33,2,4.00,'USAGE','LeaveRequest',33,'2026-05-22 10:59:14'),(25,43,4,4.00,'USAGE','LeaveRequest',43,'2026-05-12 10:59:14'),(26,53,6,4.00,'USAGE','LeaveRequest',53,'2026-05-02 10:59:14'),(27,63,8,4.00,'USAGE','LeaveRequest',63,'2026-05-22 10:59:14'),(28,73,2,4.00,'USAGE','LeaveRequest',73,'2026-05-12 10:59:14'),(29,83,4,4.00,'USAGE','LeaveRequest',83,'2026-05-02 10:59:14'),(30,93,6,4.00,'USAGE','LeaveRequest',93,'2026-05-22 10:59:14'),(31,4,5,5.00,'ACCRUAL','LeaveRequest',4,'2026-05-21 10:59:14'),(32,14,7,5.00,'ACCRUAL','LeaveRequest',14,'2026-05-11 10:59:14'),(33,24,1,5.00,'ACCRUAL','LeaveRequest',24,'2026-05-01 10:59:14'),(34,34,3,5.00,'ACCRUAL','LeaveRequest',34,'2026-05-21 10:59:14'),(35,44,5,5.00,'ACCRUAL','LeaveRequest',44,'2026-05-11 10:59:14'),(36,54,7,5.00,'ACCRUAL','LeaveRequest',54,'2026-05-01 10:59:14'),(37,64,1,5.00,'ACCRUAL','LeaveRequest',64,'2026-05-21 10:59:14'),(38,74,3,5.00,'ACCRUAL','LeaveRequest',74,'2026-05-11 10:59:14'),(39,84,5,5.00,'ACCRUAL','LeaveRequest',84,'2026-05-01 10:59:14'),(40,94,7,5.00,'ACCRUAL','LeaveRequest',94,'2026-05-21 10:59:14'),(41,5,6,1.00,'USAGE','LeaveRequest',5,'2026-05-20 10:59:14'),(42,15,8,1.00,'USAGE','LeaveRequest',15,'2026-05-10 10:59:14'),(43,25,2,1.00,'USAGE','LeaveRequest',25,'2026-04-30 10:59:14'),(44,35,4,1.00,'USAGE','LeaveRequest',35,'2026-05-20 10:59:14'),(45,45,6,1.00,'USAGE','LeaveRequest',45,'2026-05-10 10:59:14'),(46,55,8,1.00,'USAGE','LeaveRequest',55,'2026-04-30 10:59:14'),(47,65,2,1.00,'USAGE','LeaveRequest',65,'2026-05-20 10:59:14'),(48,75,4,1.00,'USAGE','LeaveRequest',75,'2026-05-10 10:59:14'),(49,85,6,1.00,'USAGE','LeaveRequest',85,'2026-04-30 10:59:14'),(50,95,8,1.00,'USAGE','LeaveRequest',95,'2026-05-20 10:59:14'),(51,6,7,2.00,'ACCRUAL','LeaveRequest',6,'2026-05-19 10:59:14'),(52,16,1,2.00,'ACCRUAL','LeaveRequest',16,'2026-05-09 10:59:14'),(53,26,3,2.00,'ACCRUAL','LeaveRequest',26,'2026-04-29 10:59:14'),(54,36,5,2.00,'ACCRUAL','LeaveRequest',36,'2026-05-19 10:59:14'),(55,46,7,2.00,'ACCRUAL','LeaveRequest',46,'2026-05-09 10:59:14'),(56,56,1,2.00,'ACCRUAL','LeaveRequest',56,'2026-04-29 10:59:14'),(57,66,3,2.00,'ACCRUAL','LeaveRequest',66,'2026-05-19 10:59:14'),(58,76,5,2.00,'ACCRUAL','LeaveRequest',76,'2026-05-09 10:59:14'),(59,86,7,2.00,'ACCRUAL','LeaveRequest',86,'2026-04-29 10:59:14'),(60,96,1,2.00,'ACCRUAL','LeaveRequest',96,'2026-05-19 10:59:14'),(61,7,8,3.00,'USAGE','LeaveRequest',7,'2026-05-18 10:59:14'),(62,17,2,3.00,'USAGE','LeaveRequest',17,'2026-05-08 10:59:14'),(63,27,4,3.00,'USAGE','LeaveRequest',27,'2026-04-28 10:59:14'),(64,37,6,3.00,'USAGE','LeaveRequest',37,'2026-05-18 10:59:14'),(65,47,8,3.00,'USAGE','LeaveRequest',47,'2026-05-08 10:59:14'),(66,57,2,3.00,'USAGE','LeaveRequest',57,'2026-04-28 10:59:14'),(67,67,4,3.00,'USAGE','LeaveRequest',67,'2026-05-18 10:59:14'),(68,77,6,3.00,'USAGE','LeaveRequest',77,'2026-05-08 10:59:14'),(69,87,8,3.00,'USAGE','LeaveRequest',87,'2026-04-28 10:59:14'),(70,97,2,3.00,'USAGE','LeaveRequest',97,'2026-05-18 10:59:14'),(71,8,1,4.00,'ACCRUAL','LeaveRequest',8,'2026-05-17 10:59:14'),(72,18,3,4.00,'ACCRUAL','LeaveRequest',18,'2026-05-07 10:59:14'),(73,28,5,4.00,'ACCRUAL','LeaveRequest',28,'2026-04-27 10:59:14'),(74,38,7,4.00,'ACCRUAL','LeaveRequest',38,'2026-05-17 10:59:14'),(75,48,1,4.00,'ACCRUAL','LeaveRequest',48,'2026-05-07 10:59:14'),(76,58,3,4.00,'ACCRUAL','LeaveRequest',58,'2026-04-27 10:59:14'),(77,68,5,4.00,'ACCRUAL','LeaveRequest',68,'2026-05-17 10:59:14'),(78,78,7,4.00,'ACCRUAL','LeaveRequest',78,'2026-05-07 10:59:14'),(79,88,1,4.00,'ACCRUAL','LeaveRequest',88,'2026-04-27 10:59:14'),(80,98,3,4.00,'ACCRUAL','LeaveRequest',98,'2026-05-17 10:59:14'),(81,9,2,5.00,'USAGE','LeaveRequest',9,'2026-05-16 10:59:14'),(82,19,4,5.00,'USAGE','LeaveRequest',19,'2026-05-06 10:59:14'),(83,29,6,5.00,'USAGE','LeaveRequest',29,'2026-04-26 10:59:14'),(84,39,8,5.00,'USAGE','LeaveRequest',39,'2026-05-16 10:59:14'),(85,49,2,5.00,'USAGE','LeaveRequest',49,'2026-05-06 10:59:14'),(86,59,4,5.00,'USAGE','LeaveRequest',59,'2026-04-26 10:59:14'),(87,69,6,5.00,'USAGE','LeaveRequest',69,'2026-05-16 10:59:14'),(88,79,8,5.00,'USAGE','LeaveRequest',79,'2026-05-06 10:59:14'),(89,89,2,5.00,'USAGE','LeaveRequest',89,'2026-04-26 10:59:14'),(90,99,4,5.00,'USAGE','LeaveRequest',99,'2026-05-16 10:59:14'),(91,10,3,1.00,'ACCRUAL','LeaveRequest',10,'2026-05-15 10:59:14'),(92,20,5,1.00,'ACCRUAL','LeaveRequest',20,'2026-05-05 10:59:14'),(93,30,7,1.00,'ACCRUAL','LeaveRequest',30,'2026-05-25 10:59:14'),(94,40,1,1.00,'ACCRUAL','LeaveRequest',40,'2026-05-15 10:59:14'),(95,50,3,1.00,'ACCRUAL','LeaveRequest',50,'2026-05-05 10:59:14'),(96,60,5,1.00,'ACCRUAL','LeaveRequest',60,'2026-05-25 10:59:14'),(97,70,7,1.00,'ACCRUAL','LeaveRequest',70,'2026-05-15 10:59:14'),(98,80,1,1.00,'ACCRUAL','LeaveRequest',80,'2026-05-05 10:59:14'),(99,90,3,1.00,'ACCRUAL','LeaveRequest',90,'2026-05-25 10:59:14'),(100,100,5,1.00,'ACCRUAL','LeaveRequest',100,'2026-05-15 10:59:14');
/*!40000 ALTER TABLE `leave_ledger` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_ledger_amount` BEFORE INSERT ON `leave_ledger` FOR EACH ROW BEGIN
    IF NEW.change_amount_days = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ledger change cannot be zero';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_ledger_insert` AFTER INSERT ON `leave_ledger` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_LEDGER', NEW.leave_ledger_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('employee_id', NEW.employee_id, 'change_amount_days', NEW.change_amount_days));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_ledger_update` BEFORE UPDATE ON `leave_ledger` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_LEDGER', OLD.leave_ledger_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('change_amount_days', OLD.change_amount_days), JSON_OBJECT('change_amount_days', NEW.change_amount_days));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_no_delete_leave_ledger` BEFORE DELETE ON `leave_ledger` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ledger entries cannot be deleted';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `leave_request`
--

DROP TABLE IF EXISTS `leave_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_request` (
  `leave_request_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `request_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `requested_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`leave_request_id`),
  KEY `idx_leave_ledger_emp_type` (`employee_id`,`leave_type_id`),
  KEY `fk_leave_request_type` (`leave_type_id`),
  KEY `idx_leave_employee` (`employee_id`),
  CONSTRAINT `fk_leave_request_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_leave_request_type` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_request`
--

LOCK TABLES `leave_request` WRITE;
/*!40000 ALTER TABLE `leave_request` DISABLE KEYS */;
INSERT INTO `leave_request` VALUES (1,1,2,'2026-05-24','2026-05-25','APPROVED',NULL,'2026-05-23 10:59:14'),(2,11,4,'2026-07-05','2026-10-31','PENDING','Private commitment','2026-04-30 10:59:14'),(3,31,8,'2026-06-30','2026-07-03','PENDING','Appointment','2026-05-05 10:59:14'),(4,41,2,'2026-05-19','2026-05-22','APPROVED',NULL,'2026-05-23 10:59:14'),(5,61,6,'2026-05-31','2026-06-07','PENDING','Family matters','2026-04-27 10:59:14'),(6,71,8,'2026-06-10','2026-06-14','REJECTED','Appointment','2026-05-19 10:59:14'),(7,81,2,'2026-05-21','2026-05-24','APPROVED','Flu symptoms','2026-05-25 10:59:14'),(8,91,4,'2026-09-23','2026-12-16','PENDING',NULL,'2026-05-25 10:59:14'),(9,12,5,'2026-06-11','2026-06-15','APPROVED',NULL,'2026-05-15 10:59:14'),(10,22,7,'2026-06-21','2026-06-27','APPROVED','Professional development','2026-05-25 10:59:14'),(11,32,1,'2026-07-06','2026-07-25','APPROVED','Travel abroad','2026-04-30 10:59:14'),(12,62,7,'2026-06-01','2026-06-04','PENDING','Certification study','2026-05-17 10:59:14'),(13,82,3,'2026-09-14','2026-12-16','PENDING',NULL,'2026-05-21 10:59:14'),(14,92,5,'2026-07-01','2026-07-07','APPROVED','Personal reasons','2026-05-24 10:59:14'),(15,3,4,'2026-06-27','2026-09-05','APPROVED','Appointment','2026-04-27 10:59:14'),(16,13,6,'2026-06-12','2026-06-15','PENDING',NULL,'2026-05-18 10:59:14'),(17,33,2,'2026-05-20','2026-05-23','APPROVED','Flu symptoms','2026-05-24 10:59:14'),(18,43,4,'2026-08-06','2026-10-14','APPROVED','Private commitment','2026-04-28 10:59:14'),(19,53,6,'2026-07-22','2026-07-24','APPROVED','Family matters','2026-05-07 10:59:14'),(20,83,4,'2026-09-15','2026-11-25','PENDING',NULL,'2026-05-18 10:59:14'),(21,93,6,'2026-07-02','2026-07-07','PENDING','Private commitment','2026-05-25 10:59:14'),(22,4,5,'2026-06-03','2026-06-08','APPROVED','Appointment','2026-05-09 10:59:14'),(23,14,7,'2026-06-13','2026-06-14','APPROVED','Certification study','2026-04-27 10:59:14'),(24,24,1,'2026-06-28','2026-07-03','APPROVED','Rest and recovery','2026-04-29 10:59:14'),(25,34,3,'2026-07-28','2026-10-12','PENDING',NULL,'2026-05-23 10:59:14'),(26,44,5,'2026-07-13','2026-07-16','APPROVED',NULL,'2026-05-16 10:59:14'),(27,54,7,'2026-07-23','2026-07-25','PENDING',NULL,'2026-05-24 10:59:14'),(28,64,1,'2026-08-07','2026-08-25','APPROVED','Summer holiday','2026-05-20 10:59:14'),(29,74,3,'2026-09-06','2026-11-13','APPROVED','Private commitment','2026-05-02 10:59:14'),(30,84,5,'2026-06-23','2026-06-29','APPROVED','Family matters','2026-05-18 10:59:14'),(31,94,7,'2026-07-03','2026-07-04','PENDING','Certification study','2026-05-23 10:59:14'),(32,5,6,'2026-06-04','2026-06-09','PENDING',NULL,'2026-04-27 10:59:14'),(33,25,2,'2026-05-21','2026-05-23','REJECTED',NULL,'2026-05-23 10:59:14'),(34,35,4,'2026-07-29','2026-09-01','APPROVED','Family matters','2026-04-30 10:59:14'),(35,45,6,'2026-07-14','2026-07-18','APPROVED','Personal reasons','2026-05-19 10:59:14'),(36,55,8,'2026-07-24','2026-07-28','PENDING','Private commitment','2026-05-04 10:59:14'),(37,95,8,'2026-07-04','2026-07-06','PENDING',NULL,'2026-04-30 10:59:14'),(38,6,7,'2026-06-05','2026-06-12','PENDING',NULL,'2026-05-25 10:59:14'),(39,16,1,'2026-06-20','2026-06-30','APPROVED','School holiday with children','2026-05-09 10:59:14'),(40,26,3,'2026-07-20','2026-09-24','APPROVED',NULL,'2026-05-06 10:59:14'),(41,56,1,'2026-07-30','2026-08-07','APPROVED',NULL,'2026-04-27 10:59:14'),(42,66,3,'2026-08-29','2026-12-24','REJECTED',NULL,'2026-05-09 10:59:14'),(43,76,5,'2026-06-15','2026-06-22','APPROVED','Personal reasons','2026-05-20 10:59:14'),(44,86,7,'2026-06-25','2026-06-30','APPROVED','Certification study','2026-05-16 10:59:14'),(45,96,1,'2026-09-08','2026-09-21','APPROVED','Rest and recovery','2026-04-28 10:59:14'),(46,7,8,'2026-06-06','2026-06-13','PENDING','Family matters','2026-05-01 10:59:14'),(47,17,2,'2026-05-22','2026-05-23','PENDING','Short-term illness','2026-05-23 10:59:14'),(48,27,4,'2026-07-21','2026-09-24','APPROVED',NULL,'2026-05-03 10:59:14'),(49,37,6,'2026-07-06','2026-07-08','PENDING',NULL,'2026-05-08 10:59:14'),(50,47,8,'2026-07-16','2026-07-22','PENDING','Private commitment','2026-05-20 10:59:14'),(51,57,2,'2026-05-24','2026-05-28','APPROVED','Short-term illness','2026-05-24 10:59:14'),(52,67,4,'2026-08-30','2026-10-07','APPROVED','Personal reasons','2026-05-16 10:59:14'),(53,97,2,'2026-05-19','2026-05-22','APPROVED',NULL,'2026-05-25 10:59:14'),(54,8,1,'2026-06-12','2026-06-25','PENDING',NULL,'2026-05-25 10:59:14'),(55,18,3,'2026-07-12','2026-11-21','PENDING','Family matters','2026-05-21 10:59:14'),(56,38,7,'2026-07-07','2026-07-12','APPROVED','Certification study','2026-04-26 10:59:14'),(57,48,1,'2026-07-22','2026-07-28','APPROVED','Family trip','2026-05-13 10:59:14'),(58,58,3,'2026-08-21','2026-11-20','PENDING',NULL,'2026-05-21 10:59:14'),(59,78,7,'2026-06-17','2026-06-18','PENDING','Course attendance','2026-05-20 10:59:14'),(60,98,3,'2026-09-30','2026-11-17','APPROVED','Family matters','2026-05-04 10:59:14'),(61,9,2,'2026-05-23','2026-05-27','PENDING','Short-term illness','2026-05-23 10:59:14'),(62,29,6,'2026-06-28','2026-07-03','APPROVED','Family matters','2026-05-08 10:59:14'),(63,39,8,'2026-07-08','2026-07-14','APPROVED',NULL,'2026-04-30 10:59:14'),(64,49,2,'2026-05-25','2026-05-28','APPROVED',NULL,'2026-05-25 10:59:14'),(65,79,8,'2026-06-18','2026-06-22','APPROVED','Family matters','2026-05-12 10:59:14'),(66,89,2,'2026-05-20','2026-05-25','APPROVED',NULL,'2026-05-24 10:59:14'),(67,99,4,'2026-10-01','2026-12-10','APPROVED',NULL,'2026-05-03 10:59:14'),(68,10,3,'2026-07-04','2026-09-20','APPROVED','Appointment','2026-05-13 10:59:14'),(69,20,5,'2026-06-19','2026-06-23','APPROVED','Appointment','2026-05-04 10:59:14'),(70,50,3,'2026-08-13','2026-09-09','APPROVED',NULL,'2026-05-17 10:59:14'),(71,60,5,'2026-05-30','2026-06-03','PENDING','Appointment','2026-05-11 10:59:14'),(72,70,7,'2026-06-09','2026-06-10','PENDING','Course attendance','2026-05-05 10:59:14'),(73,80,1,'2026-08-23','2026-08-30','REJECTED','Rest and recovery','2026-05-17 10:59:14'),(74,100,5,'2026-07-09','2026-07-12','PENDING','Private commitment','2026-05-17 10:59:14');
/*!40000 ALTER TABLE `leave_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_request_insert` AFTER INSERT ON `leave_request` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_REQUEST', NEW.leave_request_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('employee_id', NEW.employee_id, 'leave_type_id', NEW.leave_type_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_prevent_employee_change` BEFORE UPDATE ON `leave_request` FOR EACH ROW BEGIN
    IF OLD.employee_id <> NEW.employee_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee cannot be changed';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_request_update` BEFORE UPDATE ON `leave_request` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_REQUEST', OLD.leave_request_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('request_status', OLD.request_status), JSON_OBJECT('request_status', NEW.request_status));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_request_delete` BEFORE DELETE ON `leave_request` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_REQUEST', OLD.leave_request_id, 'DELETE', USER(), NOW(), JSON_OBJECT('leave_request_id', OLD.leave_request_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_type` (
  `leave_type_id` int NOT NULL AUTO_INCREMENT,
  `leave_type_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_type_description` text COLLATE utf8mb4_unicode_ci,
  `requires_approval` tinyint(1) DEFAULT '1',
  `is_paid_leave` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`leave_type_id`),
  KEY `idx_paid_approval` (`leave_type_id`,`requires_approval`,`is_paid_leave`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` VALUES (1,'Vacation','Paid annual leave',1,1),(2,'Sick Leave','Medical leave',1,1),(3,'Maternity','Maternity leave',1,1),(4,'Paternity','Paternity leave',1,1),(5,'Unpaid Leave','Unpaid time off',1,0),(6,'Bereavement','Family death leave',1,1),(7,'Study Leave','Education leave',1,0),(8,'Emergency Leave','Emergency personal leave',1,1);
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_type_insert` AFTER INSERT ON `leave_type` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_TYPE', NEW.leave_type_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('leave_type_name', NEW.leave_type_name));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_type_update` BEFORE UPDATE ON `leave_type` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_TYPE', OLD.leave_type_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('leave_type_name', OLD.leave_type_name), JSON_OBJECT('leave_type_name', NEW.leave_type_name));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_leave_type_delete` BEFORE DELETE ON `leave_type` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('LEAVE_TYPE', OLD.leave_type_id, 'DELETE', USER(), NOW(), JSON_OBJECT('leave_type_id', OLD.leave_type_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `work_location_id` int NOT NULL,
  `shift_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `shift_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`shift_id`),
  KEY `idx_dep_loc` (`department_id`,`work_location_id`),
  KEY `fk_shift_location` (`work_location_id`),
  KEY `idx_shift_datetime` (`start_datetime`,`end_datetime`),
  CONSTRAINT `fk_shift_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `fk_shift_location` FOREIGN KEY (`work_location_id`) REFERENCES `work_location` (`work_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,2,2,'Intensiv Aftenvagt','2026-05-26 15:00:00','2026-05-26 23:00:00','COMPLETED'),(2,3,3,'Kirurgisk Nattevagt','2026-05-27 23:00:00','2026-05-27 07:00:00','CANCELLED'),(3,4,4,'Medicinsk Weekendvagt','2026-05-28 07:00:00','2026-05-28 15:00:00','PLANNED'),(4,5,5,'Børneafdeling Beredskabsvagt','2026-05-29 15:00:00','2026-05-29 23:00:00','COMPLETED'),(5,6,6,'Ortopæd Morgenvagt','2026-05-30 23:00:00','2026-05-30 07:00:00','CANCELLED'),(6,7,7,'Onkologi Dagvagt','2026-05-31 07:00:00','2026-05-31 15:00:00','PLANNED'),(7,8,8,'Radiologi Aftenvagt','2026-06-01 15:00:00','2026-06-01 23:00:00','COMPLETED'),(8,9,9,'Fysioterapi Nattevagt','2026-06-02 23:00:00','2026-06-02 07:00:00','CANCELLED'),(9,10,10,'Psykiatri Weekendvagt','2026-06-03 07:00:00','2026-06-03 15:00:00','PLANNED'),(10,11,1,'Ambulant Beredskabsvagt','2026-06-04 15:00:00','2026-06-04 23:00:00','COMPLETED'),(11,12,2,'Laboratorium Morgenvagt','2026-06-05 23:00:00','2026-06-05 07:00:00','CANCELLED'),(12,13,3,'IT Dagvagt','2026-06-06 07:00:00','2026-06-06 15:00:00','PLANNED'),(13,14,4,'Administration Aftenvagt','2026-06-07 15:00:00','2026-06-07 23:00:00','COMPLETED'),(14,15,5,'Reception Nattevagt','2026-05-25 23:00:00','2026-05-25 07:00:00','CANCELLED'),(15,16,6,'Rengøring Weekendvagt','2026-05-26 07:00:00','2026-05-26 15:00:00','PLANNED'),(16,17,7,'Kantine Beredskabsvagt','2026-05-27 15:00:00','2026-05-27 23:00:00','COMPLETED'),(17,18,8,'Transport Morgenvagt','2026-05-28 23:00:00','2026-05-28 07:00:00','CANCELLED'),(18,19,9,'Lager Dagvagt','2026-05-29 07:00:00','2026-05-29 15:00:00','PLANNED'),(19,20,10,'Sikkerhed Aftenvagt','2026-05-30 15:00:00','2026-05-30 23:00:00','COMPLETED'),(20,1,1,'Akut Nattevagt','2026-05-31 23:00:00','2026-05-31 07:00:00','CANCELLED'),(21,2,2,'Intensiv Weekendvagt','2026-06-01 07:00:00','2026-06-01 15:00:00','PLANNED'),(22,3,3,'Kirurgisk Beredskabsvagt','2026-06-02 15:00:00','2026-06-02 23:00:00','COMPLETED'),(23,4,4,'Medicinsk Morgenvagt','2026-06-03 23:00:00','2026-06-03 07:00:00','CANCELLED'),(24,5,5,'Børneafdeling Dagvagt','2026-06-04 07:00:00','2026-06-04 15:00:00','PLANNED'),(25,6,6,'Ortopæd Aftenvagt','2026-06-05 15:00:00','2026-06-05 23:00:00','COMPLETED'),(26,7,7,'Onkologi Nattevagt','2026-06-06 23:00:00','2026-06-06 07:00:00','CANCELLED'),(27,8,8,'Radiologi Weekendvagt','2026-06-07 07:00:00','2026-06-07 15:00:00','PLANNED'),(28,9,9,'Fysioterapi Beredskabsvagt','2026-05-25 15:00:00','2026-05-25 23:00:00','COMPLETED'),(29,10,10,'Psykiatri Morgenvagt','2026-05-26 23:00:00','2026-05-26 07:00:00','CANCELLED'),(30,11,1,'Ambulant Dagvagt','2026-05-27 07:00:00','2026-05-27 15:00:00','PLANNED'),(31,12,2,'Laboratorium Aftenvagt','2026-05-28 15:00:00','2026-05-28 23:00:00','COMPLETED'),(32,13,3,'IT Nattevagt','2026-05-29 23:00:00','2026-05-29 07:00:00','CANCELLED'),(33,14,4,'Administration Weekendvagt','2026-05-30 07:00:00','2026-05-30 15:00:00','PLANNED'),(34,15,5,'Reception Beredskabsvagt','2026-05-31 15:00:00','2026-05-31 23:00:00','COMPLETED'),(35,16,6,'Rengøring Morgenvagt','2026-06-01 23:00:00','2026-06-01 07:00:00','CANCELLED'),(36,17,7,'Kantine Dagvagt','2026-06-02 07:00:00','2026-06-02 15:00:00','PLANNED'),(37,18,8,'Transport Aftenvagt','2026-06-03 15:00:00','2026-06-03 23:00:00','COMPLETED'),(38,19,9,'Lager Nattevagt','2026-06-04 23:00:00','2026-06-04 07:00:00','CANCELLED'),(39,20,10,'Sikkerhed Weekendvagt','2026-06-05 07:00:00','2026-06-05 15:00:00','PLANNED'),(40,1,1,'Akut Beredskabsvagt','2026-06-06 15:00:00','2026-06-06 23:00:00','COMPLETED'),(41,2,2,'Intensiv Morgenvagt','2026-06-07 23:00:00','2026-06-07 07:00:00','CANCELLED'),(42,3,3,'Kirurgisk Dagvagt','2026-05-25 07:00:00','2026-05-25 15:00:00','PLANNED'),(43,4,4,'Medicinsk Aftenvagt','2026-05-26 15:00:00','2026-05-26 23:00:00','COMPLETED'),(44,5,5,'Børneafdeling Nattevagt','2026-05-27 23:00:00','2026-05-27 07:00:00','CANCELLED'),(45,6,6,'Ortopæd Weekendvagt','2026-05-28 07:00:00','2026-05-28 15:00:00','PLANNED'),(46,7,7,'Onkologi Beredskabsvagt','2026-05-29 15:00:00','2026-05-29 23:00:00','COMPLETED'),(47,8,8,'Radiologi Morgenvagt','2026-05-30 23:00:00','2026-05-30 07:00:00','CANCELLED'),(48,9,9,'Fysioterapi Dagvagt','2026-05-31 07:00:00','2026-05-31 15:00:00','PLANNED'),(49,10,10,'Psykiatri Aftenvagt','2026-06-01 15:00:00','2026-06-01 23:00:00','COMPLETED'),(50,11,1,'Ambulant Nattevagt','2026-06-02 23:00:00','2026-06-02 07:00:00','CANCELLED'),(51,12,2,'Laboratorium Weekendvagt','2026-06-03 07:00:00','2026-06-03 15:00:00','PLANNED'),(52,13,3,'IT Beredskabsvagt','2026-06-04 15:00:00','2026-06-04 23:00:00','COMPLETED'),(53,14,4,'Administration Morgenvagt','2026-06-05 23:00:00','2026-06-05 07:00:00','CANCELLED'),(54,15,5,'Reception Dagvagt','2026-06-06 07:00:00','2026-06-06 15:00:00','PLANNED'),(55,16,6,'Rengøring Aftenvagt','2026-06-07 15:00:00','2026-06-07 23:00:00','COMPLETED'),(56,17,7,'Kantine Nattevagt','2026-05-25 23:00:00','2026-05-25 07:00:00','CANCELLED'),(57,18,8,'Transport Weekendvagt','2026-05-26 07:00:00','2026-05-26 15:00:00','PLANNED'),(58,19,9,'Lager Beredskabsvagt','2026-05-27 15:00:00','2026-05-27 23:00:00','COMPLETED'),(59,20,10,'Sikkerhed Morgenvagt','2026-05-28 23:00:00','2026-05-28 07:00:00','CANCELLED'),(60,1,1,'Akut Dagvagt','2026-05-29 07:00:00','2026-05-29 15:00:00','PLANNED'),(61,2,2,'Intensiv Aftenvagt','2026-05-30 15:00:00','2026-05-30 23:00:00','COMPLETED'),(62,3,3,'Kirurgisk Nattevagt','2026-05-31 23:00:00','2026-05-31 07:00:00','CANCELLED'),(63,4,4,'Medicinsk Weekendvagt','2026-06-01 07:00:00','2026-06-01 15:00:00','PLANNED'),(64,5,5,'Børneafdeling Beredskabsvagt','2026-06-02 15:00:00','2026-06-02 23:00:00','COMPLETED'),(65,6,6,'Ortopæd Morgenvagt','2026-06-03 23:00:00','2026-06-03 07:00:00','CANCELLED'),(66,7,7,'Onkologi Dagvagt','2026-06-04 07:00:00','2026-06-04 15:00:00','PLANNED'),(67,8,8,'Radiologi Aftenvagt','2026-06-05 15:00:00','2026-06-05 23:00:00','COMPLETED'),(68,9,9,'Fysioterapi Nattevagt','2026-06-06 23:00:00','2026-06-06 07:00:00','CANCELLED'),(69,10,10,'Psykiatri Weekendvagt','2026-06-07 07:00:00','2026-06-07 15:00:00','PLANNED'),(70,11,1,'Ambulant Beredskabsvagt','2026-05-25 15:00:00','2026-05-25 23:00:00','COMPLETED'),(71,12,2,'Laboratorium Morgenvagt','2026-05-26 23:00:00','2026-05-26 07:00:00','CANCELLED'),(72,13,3,'IT Dagvagt','2026-05-27 07:00:00','2026-05-27 15:00:00','PLANNED'),(73,14,4,'Administration Aftenvagt','2026-05-28 15:00:00','2026-05-28 23:00:00','COMPLETED'),(74,15,5,'Reception Nattevagt','2026-05-29 23:00:00','2026-05-29 07:00:00','CANCELLED'),(75,16,6,'Rengøring Weekendvagt','2026-05-30 07:00:00','2026-05-30 15:00:00','PLANNED'),(76,17,7,'Kantine Beredskabsvagt','2026-05-31 15:00:00','2026-05-31 23:00:00','COMPLETED'),(77,18,8,'Transport Morgenvagt','2026-06-01 23:00:00','2026-06-01 07:00:00','CANCELLED'),(78,19,9,'Lager Dagvagt','2026-06-02 07:00:00','2026-06-02 15:00:00','PLANNED'),(79,20,10,'Sikkerhed Aftenvagt','2026-06-03 15:00:00','2026-06-03 23:00:00','COMPLETED'),(80,1,1,'Akut Nattevagt','2026-06-04 23:00:00','2026-06-04 07:00:00','CANCELLED'),(81,2,2,'Intensiv Weekendvagt','2026-06-05 07:00:00','2026-06-05 15:00:00','PLANNED'),(82,3,3,'Kirurgisk Beredskabsvagt','2026-06-06 15:00:00','2026-06-06 23:00:00','COMPLETED'),(83,4,4,'Medicinsk Morgenvagt','2026-06-07 23:00:00','2026-06-07 07:00:00','CANCELLED'),(84,5,5,'Børneafdeling Dagvagt','2026-05-25 07:00:00','2026-05-25 15:00:00','PLANNED'),(85,6,6,'Ortopæd Aftenvagt','2026-05-26 15:00:00','2026-05-26 23:00:00','COMPLETED'),(86,7,7,'Onkologi Nattevagt','2026-05-27 23:00:00','2026-05-27 07:00:00','CANCELLED'),(87,8,8,'Radiologi Weekendvagt','2026-05-28 07:00:00','2026-05-28 15:00:00','PLANNED'),(88,9,9,'Fysioterapi Beredskabsvagt','2026-05-29 15:00:00','2026-05-29 23:00:00','COMPLETED'),(89,10,10,'Psykiatri Morgenvagt','2026-05-30 23:00:00','2026-05-30 07:00:00','CANCELLED'),(90,11,1,'Ambulant Dagvagt','2026-05-31 07:00:00','2026-05-31 15:00:00','PLANNED'),(91,12,2,'Laboratorium Aftenvagt','2026-06-01 15:00:00','2026-06-01 23:00:00','COMPLETED'),(92,13,3,'IT Nattevagt','2026-06-02 23:00:00','2026-06-02 07:00:00','CANCELLED'),(93,14,4,'Administration Weekendvagt','2026-06-03 07:00:00','2026-06-03 15:00:00','PLANNED'),(94,15,5,'Reception Beredskabsvagt','2026-06-04 15:00:00','2026-06-04 23:00:00','COMPLETED'),(95,16,6,'Rengøring Morgenvagt','2026-06-05 23:00:00','2026-06-05 07:00:00','CANCELLED'),(96,17,7,'Kantine Dagvagt','2026-06-06 07:00:00','2026-06-06 15:00:00','PLANNED'),(97,18,8,'Transport Aftenvagt','2026-06-07 15:00:00','2026-06-07 23:00:00','COMPLETED'),(98,19,9,'Lager Nattevagt','2026-05-25 23:00:00','2026-05-25 07:00:00','CANCELLED'),(99,20,10,'Sikkerhed Weekendvagt','2026-05-26 07:00:00','2026-05-26 15:00:00','PLANNED'),(100,1,1,'Akut Beredskabsvagt','2026-05-27 15:00:00','2026-05-27 23:00:00','COMPLETED');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_insert` AFTER INSERT ON `shift` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT', NEW.shift_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('shift_name', NEW.shift_name, 'start_datetime', NEW.start_datetime));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_update` BEFORE UPDATE ON `shift` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT', OLD.shift_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('shift_id', OLD.shift_id), JSON_OBJECT('shift_id', NEW.shift_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_delete` BEFORE DELETE ON `shift` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT', OLD.shift_id, 'DELETE', USER(), NOW(), JSON_OBJECT('shift_id', OLD.shift_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shift_approval`
--

DROP TABLE IF EXISTS `shift_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_approval` (
  `shift_approval_id` int NOT NULL AUTO_INCREMENT,
  `shift_assignment_id` int NOT NULL,
  `approver_employee_id` int NOT NULL,
  `decision` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval_comment` text COLLATE utf8mb4_unicode_ci,
  `decision_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`shift_approval_id`),
  KEY `fk_shift_approval_assignment` (`shift_assignment_id`),
  KEY `fk_shift_approval_employee` (`approver_employee_id`),
  CONSTRAINT `fk_shift_approval_assignment` FOREIGN KEY (`shift_assignment_id`) REFERENCES `shift_assignment` (`shift_assignment_id`),
  CONSTRAINT `fk_shift_approval_employee` FOREIGN KEY (`approver_employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_approval`
--

LOCK TABLES `shift_approval` WRITE;
/*!40000 ALTER TABLE `shift_approval` DISABLE KEYS */;
INSERT INTO `shift_approval` VALUES (1,1,10,'APPROVED','Approved by department manager','2026-05-26 00:59:14'),(2,2,17,'APPROVED','Awaiting final staffing confirmation','2026-05-27 06:59:14'),(3,3,7,'APPROVED','Shift requirement fulfilled','2026-05-26 23:59:14'),(4,4,11,'APPROVED','Coverage confirmed','2026-05-27 04:59:14'),(5,5,14,'APPROVED',NULL,'2026-05-25 15:59:14'),(6,6,8,'APPROVED','Scheduling conflict detected','2026-05-25 23:59:14'),(7,7,22,'APPROVED','Employee available for assignment','2026-05-26 23:59:14'),(8,8,20,'APPROVED','Awaiting final staffing confirmation','2026-05-26 16:59:14'),(9,9,24,'APPROVED','Coverage confirmed','2026-05-25 17:59:14'),(10,10,21,'APPROVED','Insufficient staffing budget','2026-05-26 11:59:14'),(11,11,18,'APPROVED','Assignment no longer required','2026-05-25 18:59:14'),(12,12,21,'PENDING','Approved by department manager','2026-05-25 19:59:14'),(13,13,27,'APPROVED','Employee lacks required certification','2026-05-24 18:59:14'),(14,14,23,'APPROVED','Requires senior approval','2026-05-24 22:59:14'),(15,15,26,'APPROVED','Staffing level acceptable','2026-05-24 12:59:14'),(16,16,23,'PENDING','Coverage confirmed','2026-05-24 15:59:14'),(17,17,29,'APPROVED','Shift requirement fulfilled','2026-05-24 16:59:14'),(18,18,30,'APPROVED','Approved by department manager','2026-05-25 05:59:14'),(19,19,32,'PENDING','Coverage confirmed','2026-05-26 00:59:14'),(20,20,23,'APPROVED','Pending department review','2026-05-24 20:59:14'),(21,21,35,'PENDING','Staffing level acceptable','2026-05-24 12:59:14'),(22,22,24,'APPROVED','Needs schedule coordination','2026-05-24 07:59:14'),(23,23,28,'APPROVED','Employee available for assignment','2026-05-24 01:59:14'),(24,24,30,'APPROVED','Requires senior approval','2026-05-24 21:59:14'),(25,25,35,'APPROVED','Shift requirement fulfilled','2026-05-24 01:59:14'),(26,26,30,'APPROVED',NULL,'2026-05-24 14:59:14'),(27,27,35,'APPROVED','Needs schedule coordination','2026-05-25 06:59:14'),(28,28,36,'APPROVED',NULL,'2026-05-23 20:59:14'),(29,29,41,'APPROVED','Coverage confirmed','2026-05-25 01:59:14'),(30,30,36,'APPROVED','Staffing level acceptable','2026-05-25 06:59:14'),(31,31,45,'PENDING','Needs schedule coordination','2026-05-24 08:59:14'),(32,32,43,'APPROVED','Employee available for assignment','2026-05-23 11:59:14'),(33,33,37,'APPROVED','Coverage confirmed','2026-05-24 10:59:14'),(34,34,48,'APPROVED',NULL,'2026-05-24 02:59:14'),(35,35,47,'APPROVED','Employee available for assignment','2026-05-24 04:59:14'),(36,36,39,'APPROVED','Needs schedule coordination','2026-05-23 21:59:14'),(37,37,46,'APPROVED',NULL,'2026-05-22 15:59:14'),(38,38,41,'APPROVED',NULL,'2026-05-22 14:59:14'),(39,39,43,'PENDING','Coverage confirmed','2026-05-23 23:59:14'),(40,40,54,'APPROVED','Pending department review','2026-05-24 03:59:14'),(41,41,47,'APPROVED','Approved by department manager','2026-05-22 21:59:14'),(42,42,51,'APPROVED','Approved by department manager','2026-05-21 22:59:14'),(43,43,56,'APPROVED',NULL,'2026-05-22 18:59:14'),(44,44,47,'PENDING','Shift requirement fulfilled','2026-05-21 13:59:14'),(45,45,57,'APPROVED','Shift requirement fulfilled','2026-05-23 01:59:14'),(46,46,59,'APPROVED','Staffing level acceptable','2026-05-21 16:59:14'),(47,47,60,'PENDING','Pending department review','2026-05-22 05:59:14'),(48,48,58,'APPROVED','Requires senior approval','2026-05-22 23:59:14'),(49,49,62,'PENDING','Employee available for assignment','2026-05-21 22:59:14'),(50,50,63,'APPROVED','Approved by department manager','2026-05-23 10:59:14'),(51,51,65,'APPROVED','Pending department review','2026-05-20 14:59:14'),(52,52,53,'PENDING','Approved by department manager','2026-05-21 11:59:14'),(53,53,55,'APPROVED','Staffing level acceptable','2026-05-20 17:59:14'),(54,54,56,'APPROVED','Employee available for assignment','2026-05-21 17:59:14'),(55,55,58,'APPROVED','Needs schedule coordination','2026-05-22 02:59:14'),(56,56,70,'PENDING','Coverage confirmed','2026-05-22 00:59:14'),(57,57,71,'APPROVED','Pending department review','2026-05-21 01:59:14'),(58,58,59,'APPROVED','Employee available for assignment','2026-05-21 12:59:14'),(59,59,66,'APPROVED','Staffing level acceptable','2026-05-21 15:59:14'),(60,60,64,'APPROVED','Employee available for assignment','2026-05-20 18:59:14'),(61,61,76,'APPROVED','Shift requirement fulfilled','2026-05-20 10:59:14'),(62,62,63,'REJECTED','Staffing level acceptable','2026-05-20 16:59:14'),(63,63,68,'APPROVED','Awaiting final staffing confirmation','2026-05-20 19:59:14'),(64,64,66,'APPROVED','Shift requirement fulfilled','2026-05-20 12:59:14'),(65,65,68,'APPROVED','Coverage confirmed','2026-05-19 22:59:14'),(66,66,69,'APPROVED','Needs schedule coordination','2026-05-20 11:59:14'),(67,67,80,'APPROVED',NULL,'2026-05-20 01:59:14'),(68,68,72,'APPROVED','Requires senior approval','2026-05-19 20:59:14'),(69,69,74,'PENDING','Awaiting final staffing confirmation','2026-05-20 00:59:14'),(70,70,71,'APPROVED','Staffing level acceptable','2026-05-19 17:59:14');
/*!40000 ALTER TABLE `shift_approval` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_approval_insert` AFTER INSERT ON `shift_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_APPROVAL', NEW.shift_approval_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('shift_assignment_id', NEW.shift_assignment_id, 'decision', NEW.decision));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_approval_update` BEFORE UPDATE ON `shift_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_APPROVAL', OLD.shift_approval_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('decision', OLD.decision), JSON_OBJECT('decision', NEW.decision));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_approval_delete` BEFORE DELETE ON `shift_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_APPROVAL', OLD.shift_approval_id, 'DELETE', USER(), NOW(), JSON_OBJECT('shift_approval_id', OLD.shift_approval_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shift_assignment`
--

DROP TABLE IF EXISTS `shift_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_assignment` (
  `shift_assignment_id` int NOT NULL AUTO_INCREMENT,
  `shift_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `assignment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_datetime` datetime DEFAULT NULL,
  `check_in_datetime` datetime DEFAULT NULL,
  `check_out_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`shift_assignment_id`),
  UNIQUE KEY `uq_shift_employee` (`shift_id`,`employee_id`),
  KEY `fk_sa_employee` (`employee_id`),
  CONSTRAINT `fk_sa_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_sa_shift` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_assignment`
--

LOCK TABLES `shift_assignment` WRITE;
/*!40000 ALTER TABLE `shift_assignment` DISABLE KEYS */;
INSERT INTO `shift_assignment` VALUES (1,10,10,'COMPLETED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(2,20,20,'ASSIGNED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(3,30,30,'COMPLETED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(4,40,40,'ASSIGNED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(5,50,50,'COMPLETED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(6,60,60,'ASSIGNED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(7,70,70,'COMPLETED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(8,80,80,'ASSIGNED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(9,90,90,'COMPLETED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(10,100,100,'ASSIGNED','2026-05-25 10:59:14','2026-05-25 11:59:14','2026-05-25 18:59:14'),(11,1,1,'CONFIRMED','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(12,11,11,'NO_SHOW','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(13,21,21,'CONFIRMED','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(14,31,31,'NO_SHOW','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(15,41,41,'CONFIRMED','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(16,51,51,'NO_SHOW','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(17,61,61,'CONFIRMED','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(18,71,71,'NO_SHOW','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(19,81,81,'CONFIRMED','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(20,91,91,'NO_SHOW','2026-05-24 10:59:14','2026-05-24 11:59:14','2026-05-24 18:59:14'),(21,2,2,'COMPLETED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(22,12,12,'ASSIGNED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(23,22,22,'COMPLETED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(24,32,32,'ASSIGNED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(25,42,42,'COMPLETED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(26,52,52,'ASSIGNED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(27,62,62,'COMPLETED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(28,72,72,'ASSIGNED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(29,82,82,'COMPLETED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(30,92,92,'ASSIGNED','2026-05-23 10:59:14','2026-05-23 11:59:14','2026-05-23 18:59:14'),(31,3,3,'NO_SHOW','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(32,13,13,'CONFIRMED','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(33,23,23,'NO_SHOW','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(34,33,33,'CONFIRMED','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(35,43,43,'NO_SHOW','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(36,53,53,'CONFIRMED','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(37,63,63,'NO_SHOW','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(38,73,73,'CONFIRMED','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(39,83,83,'NO_SHOW','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(40,93,93,'CONFIRMED','2026-05-22 10:59:14','2026-05-22 11:59:14','2026-05-22 18:59:14'),(41,4,4,'ASSIGNED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(42,14,14,'COMPLETED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(43,24,24,'ASSIGNED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(44,34,34,'COMPLETED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(45,44,44,'ASSIGNED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(46,54,54,'COMPLETED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(47,64,64,'ASSIGNED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(48,74,74,'COMPLETED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(49,84,84,'ASSIGNED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(50,94,94,'COMPLETED','2026-05-21 10:59:14','2026-05-21 11:59:14','2026-05-21 18:59:14'),(51,5,5,'CONFIRMED','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(52,15,15,'NO_SHOW','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(53,25,25,'CONFIRMED','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(54,35,35,'NO_SHOW','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(55,45,45,'CONFIRMED','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(56,55,55,'NO_SHOW','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(57,65,65,'CONFIRMED','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(58,75,75,'NO_SHOW','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(59,85,85,'CONFIRMED','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(60,95,95,'NO_SHOW','2026-05-20 10:59:14','2026-05-20 11:59:14','2026-05-20 18:59:14'),(61,6,6,'COMPLETED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(62,16,16,'ASSIGNED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(63,26,26,'COMPLETED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(64,36,36,'ASSIGNED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(65,46,46,'COMPLETED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(66,56,56,'ASSIGNED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(67,66,66,'COMPLETED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(68,76,76,'ASSIGNED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(69,86,86,'COMPLETED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(70,96,96,'ASSIGNED','2026-05-19 10:59:14','2026-05-19 11:59:14','2026-05-19 18:59:14'),(71,7,7,'NO_SHOW','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(72,17,17,'CONFIRMED','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(73,27,27,'NO_SHOW','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(74,37,37,'CONFIRMED','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(75,47,47,'NO_SHOW','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(76,57,57,'CONFIRMED','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(77,67,67,'NO_SHOW','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(78,77,77,'CONFIRMED','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(79,87,87,'NO_SHOW','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(80,97,97,'CONFIRMED','2026-05-18 10:59:14','2026-05-18 11:59:14','2026-05-18 18:59:14'),(81,8,8,'ASSIGNED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(82,18,18,'COMPLETED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(83,28,28,'ASSIGNED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(84,38,38,'COMPLETED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(85,48,48,'ASSIGNED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(86,58,58,'COMPLETED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(87,68,68,'ASSIGNED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(88,78,78,'COMPLETED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(89,88,88,'ASSIGNED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(90,98,98,'COMPLETED','2026-05-17 10:59:14','2026-05-17 11:59:14','2026-05-17 18:59:14'),(91,9,9,'CONFIRMED','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(92,19,19,'NO_SHOW','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(93,29,29,'CONFIRMED','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(94,39,39,'NO_SHOW','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(95,49,49,'CONFIRMED','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(96,59,59,'NO_SHOW','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(97,69,69,'CONFIRMED','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(98,79,79,'NO_SHOW','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(99,89,89,'CONFIRMED','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14'),(100,99,99,'NO_SHOW','2026-05-16 10:59:14','2026-05-16 11:59:14','2026-05-16 18:59:14');
/*!40000 ALTER TABLE `shift_assignment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_assignment_insert` AFTER INSERT ON `shift_assignment` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_ASSIGNMENT', NEW.shift_assignment_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('shift_id', NEW.shift_id, 'employee_id', NEW.employee_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_assignment_update` BEFORE UPDATE ON `shift_assignment` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_ASSIGNMENT', OLD.shift_assignment_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('assignment_status', OLD.assignment_status), JSON_OBJECT('assignment_status', NEW.assignment_status));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_assignment_delete` BEFORE DELETE ON `shift_assignment` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_ASSIGNMENT', OLD.shift_assignment_id, 'DELETE', USER(), NOW(), JSON_OBJECT('shift_assignment_id', OLD.shift_assignment_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shift_required_job_role`
--

DROP TABLE IF EXISTS `shift_required_job_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_required_job_role` (
  `shift_required_job_role_id` int NOT NULL AUTO_INCREMENT,
  `shift_id` int NOT NULL,
  `job_role_id` int NOT NULL,
  `required_employee_count` int DEFAULT '1',
  PRIMARY KEY (`shift_required_job_role_id`),
  UNIQUE KEY `unq_shift_jr` (`shift_id`,`job_role_id`),
  KEY `fk_srjr_role` (`job_role_id`),
  CONSTRAINT `fk_srjr_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_role` (`job_role_id`),
  CONSTRAINT `fk_srjr_shift` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_required_job_role`
--

LOCK TABLES `shift_required_job_role` WRITE;
/*!40000 ALTER TABLE `shift_required_job_role` DISABLE KEYS */;
INSERT INTO `shift_required_job_role` VALUES (1,10,11,2),(2,20,9,3),(3,30,7,1),(4,40,5,2),(5,50,3,3),(6,60,1,1),(7,70,11,2),(8,80,9,3),(9,90,7,1),(10,100,5,2),(11,1,2,2),(12,11,12,3),(13,21,10,1),(14,31,8,2),(15,41,6,3),(16,51,4,1),(17,61,2,2),(18,71,12,3),(19,81,10,1),(20,91,8,2),(21,2,3,3),(22,12,1,1),(23,22,11,2),(24,32,9,3),(25,42,7,1),(26,52,5,2),(27,62,3,3),(28,72,1,1),(29,82,11,2),(30,92,9,3),(31,3,4,1),(32,13,2,2),(33,23,12,3),(34,33,10,1),(35,43,8,2),(36,53,6,3),(37,63,4,1),(38,73,2,2),(39,83,12,3),(40,93,10,1),(41,4,5,2),(42,14,3,3),(43,24,1,1),(44,34,11,2),(45,44,9,3),(46,54,7,1),(47,64,5,2),(48,74,3,3),(49,84,1,1),(50,94,11,2),(51,5,6,3),(52,15,4,1),(53,25,2,2),(54,35,12,3),(55,45,10,1),(56,55,8,2),(57,65,6,3),(58,75,4,1),(59,85,2,2),(60,95,12,3),(61,6,7,1),(62,16,5,2),(63,26,3,3),(64,36,1,1),(65,46,11,2),(66,56,9,3),(67,66,7,1),(68,76,5,2),(69,86,3,3),(70,96,1,1),(71,7,8,2),(72,17,6,3),(73,27,4,1),(74,37,2,2),(75,47,12,3),(76,57,10,1),(77,67,8,2),(78,77,6,3),(79,87,4,1),(80,97,2,2),(81,8,9,3),(82,18,7,1),(83,28,5,2),(84,38,3,3),(85,48,1,1),(86,58,11,2),(87,68,9,3),(88,78,7,1),(89,88,5,2),(90,98,3,3),(91,9,10,1),(92,19,8,2),(93,29,6,3),(94,39,4,1),(95,49,2,2),(96,59,12,3),(97,69,10,1),(98,79,8,2),(99,89,6,3),(100,99,4,1);
/*!40000 ALTER TABLE `shift_required_job_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_required_job_role_insert` AFTER INSERT ON `shift_required_job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_REQUIRED_JOB_ROLE', NEW.shift_required_job_role_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('shift_id', NEW.shift_id, 'job_role_id', NEW.job_role_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_required_job_role_update` BEFORE UPDATE ON `shift_required_job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_REQUIRED_JOB_ROLE', OLD.shift_required_job_role_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('shift_required_job_role_id', OLD.shift_required_job_role_id), JSON_OBJECT('shift_required_job_role_id', NEW.shift_required_job_role_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_required_job_role_delete` BEFORE DELETE ON `shift_required_job_role` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_REQUIRED_JOB_ROLE', OLD.shift_required_job_role_id, 'DELETE', USER(), NOW(), JSON_OBJECT('shift_required_job_role_id', OLD.shift_required_job_role_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shift_swap`
--

DROP TABLE IF EXISTS `shift_swap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_swap` (
  `shift_swap_id` int NOT NULL AUTO_INCREMENT,
  `original_shift_assignment_id` int NOT NULL,
  `employee_from_id` int NOT NULL,
  `employee_to_id` int NOT NULL,
  `swap_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_datetime` datetime DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`shift_swap_id`),
  KEY `fk_shift_swap_assignment` (`original_shift_assignment_id`),
  KEY `fk_swap_employee_from` (`employee_from_id`),
  KEY `fk_swap_employee_to` (`employee_to_id`),
  CONSTRAINT `fk_shift_swap_assignment` FOREIGN KEY (`original_shift_assignment_id`) REFERENCES `shift_assignment` (`shift_assignment_id`),
  CONSTRAINT `fk_swap_employee_from` FOREIGN KEY (`employee_from_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_swap_employee_to` FOREIGN KEY (`employee_to_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_swap`
--

LOCK TABLES `shift_swap` WRITE;
/*!40000 ALTER TABLE `shift_swap` DISABLE KEYS */;
INSERT INTO `shift_swap` VALUES (1,2,20,81,'REQUESTED','2026-05-23 13:59:14','Feeling unwell'),(2,6,60,13,'REQUESTED','2026-05-25 07:59:14','Transport issues'),(3,7,70,67,'APPROVED','2026-05-22 12:59:14','Medical appointment'),(4,8,80,52,'REQUESTED','2026-05-24 17:59:14','Medical appointment'),(5,9,90,41,'DECLINED','2026-05-23 20:59:14','Personal emergency'),(6,11,1,54,'REQUESTED','2026-05-21 17:59:14','Exam / education'),(7,13,21,32,'DECLINED','2026-05-22 12:59:14','Feeling unwell'),(8,14,31,64,'DECLINED','2026-05-22 21:59:14','Requested day off overlap'),(9,15,41,60,'REQUESTED','2026-05-21 22:59:14','Requested day off overlap'),(10,16,51,96,'APPROVED','2026-05-23 02:59:14','Medical appointment'),(11,20,91,60,'APPROVED','2026-05-23 09:59:14','Medical appointment'),(12,25,42,90,'APPROVED','2026-05-22 21:59:14','Transport issues'),(13,31,3,50,'DECLINED','2026-05-19 22:59:14','Exam / education'),(14,32,13,45,'APPROVED','2026-05-21 03:59:14','Requested day off overlap'),(15,33,23,31,'APPROVED','2026-05-21 03:59:14','Transport issues'),(16,34,33,68,'REQUESTED','2026-05-20 12:59:14','Requested day off overlap'),(17,36,53,29,'APPROVED','2026-05-22 02:59:14','Medical appointment'),(18,38,73,48,'REQUESTED','2026-05-21 03:59:14','Family obligation'),(19,39,83,99,'APPROVED','2026-05-21 11:59:14','Transport issues'),(20,40,93,55,'REQUESTED','2026-05-21 16:59:14','Medical appointment'),(21,41,4,27,'APPROVED','2026-05-19 17:59:14','Exam / education'),(22,43,24,15,'REQUESTED','2026-05-20 21:59:14','Requested day off overlap'),(23,45,44,2,'APPROVED','2026-05-21 02:59:14','Personal emergency'),(24,46,54,84,'APPROVED','2026-05-19 00:59:14','Requested day off overlap'),(25,48,74,92,'APPROVED','2026-05-19 10:59:14','Personal emergency'),(26,50,94,50,'REQUESTED','2026-05-19 03:59:14','Exam / education');
/*!40000 ALTER TABLE `shift_swap` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_swap_insert` AFTER INSERT ON `shift_swap` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_SWAP', NEW.shift_swap_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('employee_from_id', NEW.employee_from_id, 'employee_to_id', NEW.employee_to_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_swap_update` BEFORE UPDATE ON `shift_swap` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_SWAP', OLD.shift_swap_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('swap_status', OLD.swap_status), JSON_OBJECT('swap_status', NEW.swap_status));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_swap_delete` BEFORE DELETE ON `shift_swap` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_SWAP', OLD.shift_swap_id, 'DELETE', USER(), NOW(), JSON_OBJECT('shift_swap_id', OLD.shift_swap_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shift_swap_approval`
--

DROP TABLE IF EXISTS `shift_swap_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_swap_approval` (
  `shift_swap_approval_id` int NOT NULL AUTO_INCREMENT,
  `shift_swap_id` int NOT NULL,
  `approver_employee_id` int NOT NULL,
  `decision` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shift_swap_comment` text COLLATE utf8mb4_unicode_ci,
  `decision_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`shift_swap_approval_id`),
  KEY `fk_shift_swap_approval_swap` (`shift_swap_id`),
  KEY `fk_shift_swap_approval_employee` (`approver_employee_id`),
  CONSTRAINT `fk_shift_swap_approval_employee` FOREIGN KEY (`approver_employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_shift_swap_approval_swap` FOREIGN KEY (`shift_swap_id`) REFERENCES `shift_swap` (`shift_swap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_swap_approval`
--

LOCK TABLES `shift_swap_approval` WRITE;
/*!40000 ALTER TABLE `shift_swap_approval` DISABLE KEYS */;
INSERT INTO `shift_swap_approval` VALUES (1,1,81,'APPROVED','Within allowed weekly hours','2026-05-23 19:59:14'),(2,2,100,'APPROVED','Requires senior approval','2026-05-25 21:59:14'),(3,3,96,'APPROVED','No staffing conflicts detected','2026-05-23 16:59:14'),(4,4,68,'REJECTED','Request conflicts with staffing plan','2026-05-25 09:59:14'),(5,5,86,'REJECTED','Within allowed weekly hours','2026-05-24 16:59:14'),(6,6,45,'REJECTED','No staffing conflicts detected','2026-05-22 11:59:14'),(7,7,32,'REJECTED','Within allowed weekly hours','2026-05-24 02:59:14'),(8,8,86,'REJECTED','Manager approval granted','2026-05-23 09:59:14'),(9,9,70,'APPROVED','Approved by shift coordinator','2026-05-23 05:59:14'),(10,10,89,'APPROVED','Within allowed weekly hours','2026-05-24 11:59:14'),(11,11,77,'APPROVED',NULL,'2026-05-24 14:59:14'),(12,12,64,'APPROVED',NULL,'2026-05-24 02:59:14'),(13,13,61,'REJECTED','Within allowed weekly hours','2026-05-21 12:59:14'),(14,14,16,'APPROVED','Requires senior approval','2026-05-21 22:59:14'),(15,15,7,'APPROVED','Coverage confirmed for department','2026-05-22 11:59:14'),(16,16,91,'APPROVED','No staffing conflicts detected','2026-05-22 09:59:14'),(17,17,49,'APPROVED','Insufficient coverage for requested swap','2026-05-22 06:59:14'),(18,18,100,'APPROVED','Coverage confirmed for department','2026-05-22 06:59:14'),(19,19,16,'APPROVED','No staffing conflicts detected','2026-05-21 12:59:14'),(20,20,63,'APPROVED','Employee not eligible for swap at this time','2026-05-23 11:59:14'),(21,21,2,'APPROVED','Coverage confirmed for department','2026-05-21 10:59:14'),(22,22,34,'APPROVED',NULL,'2026-05-21 19:59:14'),(23,23,66,'APPROVED','Coverage confirmed for department','2026-05-22 12:59:14'),(24,24,21,'APPROVED',NULL,'2026-05-21 00:59:14'),(25,25,19,'APPROVED',NULL,'2026-05-19 15:59:14'),(26,26,14,'REJECTED','Requires senior approval','2026-05-20 17:59:14');
/*!40000 ALTER TABLE `shift_swap_approval` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_swap_approval_insert` AFTER INSERT ON `shift_swap_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_SWAP_APPROVAL', NEW.shift_swap_approval_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('shift_swap_id', NEW.shift_swap_id, 'decision', NEW.decision));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_swap_approval_update` BEFORE UPDATE ON `shift_swap_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_SWAP_APPROVAL', OLD.shift_swap_approval_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('decision', OLD.decision), JSON_OBJECT('decision', NEW.decision));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shift_swap_approval_delete` BEFORE DELETE ON `shift_swap_approval` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('SHIFT_SWAP_APPROVAL', OLD.shift_swap_approval_id, 'DELETE', USER(), NOW(), JSON_OBJECT('shift_swap_approval_id', OLD.shift_swap_approval_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_employee_leave_overview`
--

DROP TABLE IF EXISTS `vw_employee_leave_overview`;
/*!50001 DROP VIEW IF EXISTS `vw_employee_leave_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee_leave_overview` AS SELECT 
 1 AS `leave_request_id`,
 1 AS `employee_id`,
 1 AS `employee_number`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `leave_type_id`,
 1 AS `leave_type_name`,
 1 AS `is_paid_leave`,
 1 AS `requires_approval`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `request_status`,
 1 AS `reason`,
 1 AS `requested_datetime`,
 1 AS `leave_approval_id`,
 1 AS `approval_decision`,
 1 AS `approval_comment`,
 1 AS `approval_datetime`,
 1 AS `approver_number`,
 1 AS `approver_first_name`,
 1 AS `approver_last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee_overview`
--

DROP TABLE IF EXISTS `vw_employee_overview`;
/*!50001 DROP VIEW IF EXISTS `vw_employee_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee_overview` AS SELECT 
 1 AS `employee_id`,
 1 AS `employee_number`,
 1 AS `full_name`,
 1 AS `email`,
 1 AS `employment_status`,
 1 AS `department_name`,
 1 AS `contract_type`,
 1 AS `weekly_hours`,
 1 AS `primary_location`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee_shift_overview`
--

DROP TABLE IF EXISTS `vw_employee_shift_overview`;
/*!50001 DROP VIEW IF EXISTS `vw_employee_shift_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee_shift_overview` AS SELECT 
 1 AS `shift_assignment_id`,
 1 AS `employee_id`,
 1 AS `employee_number`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `shift_id`,
 1 AS `shift_name`,
 1 AS `start_datetime`,
 1 AS `end_datetime`,
 1 AS `shift_status`,
 1 AS `department_name`,
 1 AS `location_name`,
 1 AS `assignment_status`,
 1 AS `assigned_datetime`,
 1 AS `check_in_datetime`,
 1 AS `check_out_datetime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_leave_balance`
--

DROP TABLE IF EXISTS `vw_leave_balance`;
/*!50001 DROP VIEW IF EXISTS `vw_leave_balance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_leave_balance` AS SELECT 
 1 AS `employee_id`,
 1 AS `full_name`,
 1 AS `leave_type_id`,
 1 AS `leave_type_name`,
 1 AS `balance_days`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pending_leave_requests`
--

DROP TABLE IF EXISTS `vw_pending_leave_requests`;
/*!50001 DROP VIEW IF EXISTS `vw_pending_leave_requests`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pending_leave_requests` AS SELECT 
 1 AS `leave_request_id`,
 1 AS `employee_id`,
 1 AS `employee_name`,
 1 AS `leave_type_name`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `days_requested`,
 1 AS `reason`,
 1 AS `requested_datetime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_shift_schedule`
--

DROP TABLE IF EXISTS `vw_shift_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_shift_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_shift_schedule` AS SELECT 
 1 AS `shift_id`,
 1 AS `shift_name`,
 1 AS `start_datetime`,
 1 AS `end_datetime`,
 1 AS `shift_status`,
 1 AS `department_name`,
 1 AS `location_name`,
 1 AS `shift_assignment_id`,
 1 AS `assignment_status`,
 1 AS `employee_id`,
 1 AS `assigned_employee`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `work_location`
--

DROP TABLE IF EXISTS `work_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_location` (
  `work_location_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`work_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_location`
--

LOCK TABLES `work_location` WRITE;
/*!40000 ALTER TABLE `work_location` DISABLE KEYS */;
INSERT INTO `work_location` VALUES (1,'Rigshospitalet','Blegdamsvej 9',NULL,'København','Danmark','Europe/Copenhagen',1),(2,'Aarhus Universitetshospital','Palle Juul-Jensens Blvd. 99',NULL,'Aarhus','Danmark','Europe/Copenhagen',1),(3,'Odense Universitetshospital','J.B. Winsløws Vej 4',NULL,'Odense','Danmark','Europe/Copenhagen',1),(4,'Aalborg Universitetshospital','Hobrovej 18-22',NULL,'Aalborg','Danmark','Europe/Copenhagen',1),(5,'Esbjerg Sygehus','Finsensgade 35',NULL,'Esbjerg','Danmark','Europe/Copenhagen',1),(6,'Randers Sygehus','Skovlyvej 15',NULL,'Randers','Danmark','Europe/Copenhagen',1),(7,'Herning Sygehus','Gl. Landevej 61',NULL,'Herning','Danmark','Europe/Copenhagen',1),(8,'Hillerød Hospital','Dyrehavevej 29',NULL,'Hillerød','Danmark','Europe/Copenhagen',1),(9,'Slagelse Sygehus','Ingemannsvej 18',NULL,'Slagelse','Danmark','Europe/Copenhagen',1),(10,'Vejle Sygehus','Beriderbakken 4',NULL,'Vejle','Danmark','Europe/Copenhagen',1);
/*!40000 ALTER TABLE `work_location` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_work_location_insert` AFTER INSERT ON `work_location` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('WORK_LOCATION', NEW.work_location_id, 'INSERT', USER(), NOW(), NULL, JSON_OBJECT('work_location_id', NEW.work_location_id, 'location_name', NEW.location_name, 'city', NEW.city));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_work_location_update` BEFORE UPDATE ON `work_location` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('WORK_LOCATION', OLD.work_location_id, 'UPDATE', USER(), NOW(), JSON_OBJECT('work_location_id', OLD.work_location_id), JSON_OBJECT('work_location_id', NEW.work_location_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_work_location_delete` BEFORE DELETE ON `work_location` FOR EACH ROW BEGIN
    INSERT INTO audit_log (entity_type, entity_id, action_type, db_user, action_datetime, old_value_snapshot, new_value_snapshot)
    VALUES ('WORK_LOCATION', OLD.work_location_id, 'DELETE', USER(), NOW(), JSON_OBJECT('work_location_id', OLD.work_location_id), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'shift_happens'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_department_headcount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_department_headcount`(
    p_department_id INT
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*)
    INTO v_count
    FROM employee_contract ec
             JOIN employee e ON ec.employee_id = e.employee_id
    WHERE ec.department_id = p_department_id
      AND ec.is_active = 1
      AND e.employment_status = 'ACTIVE';

    RETURN v_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_leave_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_leave_balance`(
    p_employee_id INT,
    p_leave_type_id INT
) RETURNS decimal(6,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_balance DECIMAL(6, 2);

    SELECT COALESCE(SUM(change_amount_days), 0)
    INTO v_balance
    FROM leave_ledger
    WHERE employee_id = p_employee_id
      AND leave_type_id = p_leave_type_id;

    RETURN v_balance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approve_leave_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approve_leave_request`(
    IN p_leave_request_id INT,
    IN p_approver_employee_id INT,
    IN p_decision VARCHAR(20),
    IN p_leave_comment TEXT
)
BEGIN
    DECLARE v_employee_id INT;
    DECLARE v_leave_type_id INT;
    DECLARE v_days_requested DECIMAL(6,2);
    DECLARE v_leave_balance DECIMAL(6,2);
    DECLARE v_is_manager INT;
    DECLARE v_request_status VARCHAR(20);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            RESIGNAL;
        END;

    START TRANSACTION;

    /* Fetch and lock leave request */
    SELECT employee_id,
           leave_type_id,
           DATEDIFF(end_date, start_date) + 1,
           request_status
    INTO v_employee_id,
        v_leave_type_id,
        v_days_requested,
        v_request_status
    FROM leave_request
    WHERE leave_request_id = p_leave_request_id
    LIMIT 1
    FOR UPDATE;

    IF v_employee_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Leave request does not exist';
    END IF;

    IF v_request_status <> 'PENDING' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Leave request is not pending';
    END IF;

    /* Validate approver */
    SELECT fk_user_role_id
    INTO v_is_manager
    FROM employee
    WHERE employee_id = p_approver_employee_id
    LIMIT 1;

    IF v_is_manager IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Approver does not exist';
    END IF;

    IF v_is_manager <> 3 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Only managers can approve leave requests';
    END IF;

    /* Insert approval record */
    INSERT INTO leave_approval (
        leave_request_id,
        approver_employee_id,
        decision,
        leave_comment,
        decision_datetime
    )
    VALUES (
               p_leave_request_id,
               p_approver_employee_id,
               p_decision,
            p_leave_comment,
               NOW()
           );

    /* If approved, process balance and update */
    IF p_decision = 'APPROVED' THEN

        SELECT COALESCE(SUM(change_amount_days), 0)
        INTO v_leave_balance
        FROM leave_ledger
        WHERE employee_id = v_employee_id
          AND leave_type_id = v_leave_type_id;

        IF v_leave_balance < v_days_requested THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Insufficient leave balance';
        END IF;

        UPDATE leave_request
        SET request_status = 'APPROVED'
        WHERE leave_request_id = p_leave_request_id;

        INSERT INTO leave_ledger (
            employee_id,
            leave_type_id,
            change_amount_days,
            transaction_type,
            reference_entity_type,
            reference_entity_id,
            transaction_datetime
        )
        VALUES (
                   v_employee_id,
                   v_leave_type_id,
                   -v_days_requested,
                   'USAGE',
                   'LeaveRequest',
                   p_leave_request_id,
                   NOW()
               );

    END IF;

    IF p_decision = 'REJECTED' THEN
        UPDATE leave_request
        SET request_status = 'REJECTED'
        WHERE leave_request_id = p_leave_request_id;
    END IF;

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_assign_employee_to_shift` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_assign_employee_to_shift`(
    IN p_shift_id INT,
    IN p_employee_id INT
)
BEGIN
    DECLARE v_conflict_count INT;
    DECLARE v_shift_start DATETIME;
    DECLARE v_shift_end DATETIME;

    -- Get the shift times
    SELECT start_datetime, end_datetime
    INTO v_shift_start, v_shift_end
    FROM shift
    WHERE shift_id = p_shift_id;

    -- Check for overlapping shift assignments
    SELECT COUNT(*)
    INTO v_conflict_count
    FROM shift_assignment sa
             JOIN shift s ON sa.shift_id = s.shift_id
    WHERE sa.employee_id = p_employee_id
      AND sa.assignment_status IN ('ASSIGNED', 'CONFIRMED')
      AND s.start_datetime < v_shift_end
      AND s.end_datetime > v_shift_start;

    IF v_conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee has a conflicting shift assignment';
    END IF;

    INSERT INTO shift_assignment (shift_id, employee_id,
                                  assignment_status, assigned_datetime)
    VALUES (p_shift_id, p_employee_id,
            'ASSIGNED', NOW());

    SELECT LAST_INSERT_ID() AS new_assignment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_submit_leave_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_submit_leave_request`(
    IN p_employee_id INT,
    IN p_leave_type_id INT,
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_reason TEXT
)
BEGIN
    DECLARE v_days_requested DECIMAL(6, 2);
    DECLARE v_balance DECIMAL(6, 2);

    SET v_days_requested = DATEDIFF(p_end_date, p_start_date) + 1;

    -- Check balance using our function
    SET v_balance = fn_get_leave_balance(p_employee_id, p_leave_type_id);

    IF v_balance < v_days_requested THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient leave balance to submit this request';
    END IF;

    INSERT INTO leave_request (employee_id, leave_type_id,
                               start_date, end_date,
                               request_status, reason, requested_datetime)
    VALUES (p_employee_id, p_leave_type_id,
            p_start_date, p_end_date,
            'PENDING', p_reason, NOW());

    SELECT LAST_INSERT_ID() AS new_leave_request_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_employee_leave_overview`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee_leave_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee_leave_overview` AS select `lr`.`leave_request_id` AS `leave_request_id`,`e`.`employee_id` AS `employee_id`,`e`.`employee_number` AS `employee_number`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`email` AS `email`,`lt`.`leave_type_id` AS `leave_type_id`,`lt`.`leave_type_name` AS `leave_type_name`,`lt`.`is_paid_leave` AS `is_paid_leave`,`lt`.`requires_approval` AS `requires_approval`,`lr`.`start_date` AS `start_date`,`lr`.`end_date` AS `end_date`,`lr`.`request_status` AS `request_status`,`lr`.`reason` AS `reason`,`lr`.`requested_datetime` AS `requested_datetime`,`la`.`leave_approval_id` AS `leave_approval_id`,`la`.`decision` AS `approval_decision`,`la`.`leave_comment` AS `approval_comment`,`la`.`decision_datetime` AS `approval_datetime`,`approver`.`employee_number` AS `approver_number`,`approver`.`first_name` AS `approver_first_name`,`approver`.`last_name` AS `approver_last_name` from ((((`leave_request` `lr` join `employee` `e` on((`lr`.`employee_id` = `e`.`employee_id`))) join `leave_type` `lt` on((`lr`.`leave_type_id` = `lt`.`leave_type_id`))) left join `leave_approval` `la` on((`lr`.`leave_request_id` = `la`.`leave_request_id`))) left join `employee` `approver` on((`la`.`approver_employee_id` = `approver`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee_overview`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee_overview` AS select `e`.`employee_id` AS `employee_id`,`e`.`employee_number` AS `employee_number`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `full_name`,`e`.`email` AS `email`,`e`.`employment_status` AS `employment_status`,`d`.`department_name` AS `department_name`,`ec`.`contract_type` AS `contract_type`,`ec`.`weekly_hours` AS `weekly_hours`,`wl`.`location_name` AS `primary_location` from (((`employee` `e` left join `employee_contract` `ec` on(((`e`.`employee_id` = `ec`.`employee_id`) and (`ec`.`is_active` = 1)))) left join `department` `d` on((`ec`.`department_id` = `d`.`department_id`))) left join `work_location` `wl` on((`e`.`primary_work_location_id` = `wl`.`work_location_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee_shift_overview`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee_shift_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee_shift_overview` AS select `sa`.`shift_assignment_id` AS `shift_assignment_id`,`e`.`employee_id` AS `employee_id`,`e`.`employee_number` AS `employee_number`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`email` AS `email`,`s`.`shift_id` AS `shift_id`,`s`.`shift_name` AS `shift_name`,`s`.`start_datetime` AS `start_datetime`,`s`.`end_datetime` AS `end_datetime`,`s`.`shift_status` AS `shift_status`,`d`.`department_name` AS `department_name`,`wl`.`location_name` AS `location_name`,`sa`.`assignment_status` AS `assignment_status`,`sa`.`assigned_datetime` AS `assigned_datetime`,`sa`.`check_in_datetime` AS `check_in_datetime`,`sa`.`check_out_datetime` AS `check_out_datetime` from ((((`shift_assignment` `sa` join `employee` `e` on((`sa`.`employee_id` = `e`.`employee_id`))) join `shift` `s` on((`sa`.`shift_id` = `s`.`shift_id`))) join `department` `d` on((`s`.`department_id` = `d`.`department_id`))) join `work_location` `wl` on((`s`.`work_location_id` = `wl`.`work_location_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_leave_balance`
--

/*!50001 DROP VIEW IF EXISTS `vw_leave_balance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_leave_balance` AS select `e`.`employee_id` AS `employee_id`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `full_name`,`lt`.`leave_type_id` AS `leave_type_id`,`lt`.`leave_type_name` AS `leave_type_name`,coalesce(sum(`ll`.`change_amount_days`),0) AS `balance_days` from ((`employee` `e` join `leave_type` `lt`) left join `leave_ledger` `ll` on(((`e`.`employee_id` = `ll`.`employee_id`) and (`lt`.`leave_type_id` = `ll`.`leave_type_id`)))) group by `e`.`employee_id`,`e`.`first_name`,`e`.`last_name`,`lt`.`leave_type_id`,`lt`.`leave_type_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pending_leave_requests`
--

/*!50001 DROP VIEW IF EXISTS `vw_pending_leave_requests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pending_leave_requests` AS select `lr`.`leave_request_id` AS `leave_request_id`,`e`.`employee_id` AS `employee_id`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `employee_name`,`lt`.`leave_type_name` AS `leave_type_name`,`lr`.`start_date` AS `start_date`,`lr`.`end_date` AS `end_date`,((to_days(`lr`.`end_date`) - to_days(`lr`.`start_date`)) + 1) AS `days_requested`,`lr`.`reason` AS `reason`,`lr`.`requested_datetime` AS `requested_datetime` from ((`leave_request` `lr` join `employee` `e` on((`lr`.`employee_id` = `e`.`employee_id`))) join `leave_type` `lt` on((`lr`.`leave_type_id` = `lt`.`leave_type_id`))) where (`lr`.`request_status` = 'PENDING') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_shift_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_shift_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_shift_schedule` AS select `s`.`shift_id` AS `shift_id`,`s`.`shift_name` AS `shift_name`,`s`.`start_datetime` AS `start_datetime`,`s`.`end_datetime` AS `end_datetime`,`s`.`shift_status` AS `shift_status`,`d`.`department_name` AS `department_name`,`wl`.`location_name` AS `location_name`,`sa`.`shift_assignment_id` AS `shift_assignment_id`,`sa`.`assignment_status` AS `assignment_status`,`e`.`employee_id` AS `employee_id`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `assigned_employee` from ((((`shift` `s` join `department` `d` on((`s`.`department_id` = `d`.`department_id`))) join `work_location` `wl` on((`s`.`work_location_id` = `wl`.`work_location_id`))) left join `shift_assignment` `sa` on((`s`.`shift_id` = `sa`.`shift_id`))) left join `employee` `e` on((`sa`.`employee_id` = `e`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 11:06:23
