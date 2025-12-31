/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - asd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`asd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `asd`;

/*Table structure for table `asd_assign_table` */

DROP TABLE IF EXISTS `asd_assign_table`;

CREATE TABLE `asd_assign_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` longtext NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  `PARENT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_assign_table_EXPERT_id_e4daec41_fk_ASD_expert_table_id` (`EXPERT_id`),
  KEY `ASD_assign_table_PARENT_id_4715235a_fk_ASD_parent_table_id` (`PARENT_id`),
  CONSTRAINT `ASD_assign_table_EXPERT_id_e4daec41_fk_ASD_expert_table_id` FOREIGN KEY (`EXPERT_id`) REFERENCES `asd_expert_table` (`id`),
  CONSTRAINT `ASD_assign_table_PARENT_id_4715235a_fk_ASD_parent_table_id` FOREIGN KEY (`PARENT_id`) REFERENCES `asd_parent_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_assign_table` */

/*Table structure for table `asd_child_assessment` */

DROP TABLE IF EXISTS `asd_child_assessment`;

CREATE TABLE `asd_child_assessment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `report` varchar(100) NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  `PARENT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_child_assessment_EXPERT_id_c1295e55_fk_ASD_expert_table_id` (`EXPERT_id`),
  KEY `ASD_child_assessment_PARENT_id_b69a41c1_fk_ASD_parent_table_id` (`PARENT_id`),
  CONSTRAINT `ASD_child_assessment_EXPERT_id_c1295e55_fk_ASD_expert_table_id` FOREIGN KEY (`EXPERT_id`) REFERENCES `asd_expert_table` (`id`),
  CONSTRAINT `ASD_child_assessment_PARENT_id_b69a41c1_fk_ASD_parent_table_id` FOREIGN KEY (`PARENT_id`) REFERENCES `asd_parent_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_child_assessment` */

insert  into `asd_child_assessment`(`id`,`report`,`EXPERT_id`,`PARENT_id`) values 
(1,'hbhnj',1,1);

/*Table structure for table `asd_complaint_table` */

DROP TABLE IF EXISTS `asd_complaint_table`;

CREATE TABLE `asd_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `issue` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  `PARENT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_complaint_table_EXPERT_id_ec2bb8f9_fk_ASD_expert_table_id` (`EXPERT_id`),
  KEY `ASD_complaint_table_PARENT_id_a07c14af_fk_ASD_parent_table_id` (`PARENT_id`),
  CONSTRAINT `ASD_complaint_table_EXPERT_id_ec2bb8f9_fk_ASD_expert_table_id` FOREIGN KEY (`EXPERT_id`) REFERENCES `asd_expert_table` (`id`),
  CONSTRAINT `ASD_complaint_table_PARENT_id_a07c14af_fk_ASD_parent_table_id` FOREIGN KEY (`PARENT_id`) REFERENCES `asd_parent_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_complaint_table` */

insert  into `asd_complaint_table`(`id`,`issue`,`reply`,`date`,`EXPERT_id`,`PARENT_id`) values 
(1,'ugiu','rewr','2024-03-28',1,1),
(3,'fhhjj','vhfffghb','2024-03-15',1,2),
(4,'not okay ','pending','2024-04-13',2,4),
(5,'okay ','pending','2024-04-13',1,4);

/*Table structure for table `asd_doubt_table` */

DROP TABLE IF EXISTS `asd_doubt_table`;

CREATE TABLE `asd_doubt_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doubt` longtext NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(100) NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  `PARENT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_doubt_table_EXPERT_id_3768f4a4_fk_ASD_expert_table_id` (`EXPERT_id`),
  KEY `ASD_doubt_table_PARENT_id_e5e8ef60_fk_ASD_parent_table_id` (`PARENT_id`),
  CONSTRAINT `ASD_doubt_table_EXPERT_id_3768f4a4_fk_ASD_expert_table_id` FOREIGN KEY (`EXPERT_id`) REFERENCES `asd_expert_table` (`id`),
  CONSTRAINT `ASD_doubt_table_PARENT_id_e5e8ef60_fk_ASD_parent_table_id` FOREIGN KEY (`PARENT_id`) REFERENCES `asd_parent_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_doubt_table` */

insert  into `asd_doubt_table`(`id`,`doubt`,`date`,`reply`,`EXPERT_id`,`PARENT_id`) values 
(1,'hhhh','2024-04-06','kfjueh',1,2),
(2,'why','2024-04-03','nothing',1,1),
(3,'how','2024-04-13','pending',1,4),
(4,'poovaan time aayo','2024-04-13','pending',3,4),
(5,'when','2024-04-13','pending',1,4);

/*Table structure for table `asd_expert_table` */

DROP TABLE IF EXISTS `asd_expert_table`;

CREATE TABLE `asd_expert_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `proof` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `experience` int NOT NULL,
  `phone_no` bigint NOT NULL,
  `mail_id` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_expert_table_LOGIN_id_43b7d719_fk_ASD_login_table_id` (`LOGIN_id`),
  CONSTRAINT `ASD_expert_table_LOGIN_id_43b7d719_fk_ASD_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `asd_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_expert_table` */

insert  into `asd_expert_table`(`id`,`name`,`image`,`place`,`pin`,`proof`,`DOB`,`experience`,`phone_no`,`mail_id`,`gender`,`LOGIN_id`) values 
(1,'Naziyan','806433_cRQPRiq.png','Thamarassery',673573,'man-sign-human-icon-men-symbol-vector-13933839_nXLImvN.jpg','2024-03-23',2,6282529939,'naziyan075@gmail.com','Male',7),
(2,'nainu','man-sign-human-icon-men-symbol-vector-13933839_qyBc5Jm.jpg','panamaram',670721,'man-sign-human-icon-men-symbol-vector-13933839_ndqBNfh.jpg','2002-10-22',5,8111958611,'nainufathima1@gmail.com','Female',8),
(3,'ehsan','man-sign-human-icon-men-symbol-vector-13933839_6GrG404.jpg','edavanna',678766,'man-sign-human-icon-men-symbol-vector-13933839_OLyPSIr.jpg','2024-03-25',3,98787987987,'ehsan@gmail.com','Male',10),
(4,'nida','man-sign-human-icon-men-symbol-vector-13933839_N37ndD3.jpg','thamarassery',654321,'man-sign-human-icon-men-symbol-vector-13933839_xW9Ec1R.jpg','2024-04-11',5,1234567890,'nida12@gmail.com','Female',11),
(5,'niyaa','man-sign-human-icon-men-symbol-vector-13933839_YCexBZ5.jpg','thamarassery',654321,'man-sign-human-icon-men-symbol-vector-13933839_tUuaMAy.jpg','2024-04-17',5,1234567890,'nida12@gmail.com','Female',12);

/*Table structure for table `asd_feedback_table` */

DROP TABLE IF EXISTS `asd_feedback_table`;

CREATE TABLE `asd_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `PARENT_id` bigint NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_feedback_table_PARENT_id_3112858b_fk_ASD_parent_table_id` (`PARENT_id`),
  KEY `ASD_feedback_table_EXPERT_id_84c7a686_fk_ASD_expert_table_id` (`EXPERT_id`),
  CONSTRAINT `ASD_feedback_table_EXPERT_id_84c7a686_fk_ASD_expert_table_id` FOREIGN KEY (`EXPERT_id`) REFERENCES `asd_expert_table` (`id`),
  CONSTRAINT `ASD_feedback_table_PARENT_id_3112858b_fk_ASD_parent_table_id` FOREIGN KEY (`PARENT_id`) REFERENCES `asd_parent_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_feedback_table` */

insert  into `asd_feedback_table`(`id`,`feedback`,`date`,`PARENT_id`,`EXPERT_id`) values 
(1,'nice','2024-04-13',4,1),
(2,'good','2024-04-13',4,1);

/*Table structure for table `asd_guidance_table` */

DROP TABLE IF EXISTS `asd_guidance_table`;

CREATE TABLE `asd_guidance_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `guidance` longtext NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  `PARENT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_guidance_table_EXPERT_id_58b2fca5_fk_ASD_expert_table_id` (`EXPERT_id`),
  KEY `ASD_guidance_table_PARENT_id_d2254f12_fk_ASD_parent_table_id` (`PARENT_id`),
  CONSTRAINT `ASD_guidance_table_EXPERT_id_58b2fca5_fk_ASD_expert_table_id` FOREIGN KEY (`EXPERT_id`) REFERENCES `asd_expert_table` (`id`),
  CONSTRAINT `ASD_guidance_table_PARENT_id_d2254f12_fk_ASD_parent_table_id` FOREIGN KEY (`PARENT_id`) REFERENCES `asd_parent_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_guidance_table` */

insert  into `asd_guidance_table`(`id`,`guidance`,`EXPERT_id`,`PARENT_id`) values 
(1,'asd',1,1),
(2,'asdcvf',1,2),
(3,'sfds',1,1),
(4,'psijgiowrjhpeiry',1,4);

/*Table structure for table `asd_login_table` */

DROP TABLE IF EXISTS `asd_login_table`;

CREATE TABLE `asd_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_login_table` */

insert  into `asd_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','123','admin'),
(7,'naziyan','123','expert'),
(8,'nain','075','expert'),
(9,'parent','parent','parent'),
(10,'ehsan','999','reject'),
(11,'exp1','123','pending'),
(12,'exp1','123','pending'),
(13,'Ehsan','1234','parent'),
(14,'Ehsan','123','parent');

/*Table structure for table `asd_parent_table` */

DROP TABLE IF EXISTS `asd_parent_table`;

CREATE TABLE `asd_parent_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `child_name` varchar(100) NOT NULL,
  `phone_no` bigint NOT NULL,
  `mail_id` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_parent_table_LOGIN_id_a69ec9d0_fk_ASD_login_table_id` (`LOGIN_id`),
  CONSTRAINT `ASD_parent_table_LOGIN_id_a69ec9d0_fk_ASD_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `asd_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_parent_table` */

insert  into `asd_parent_table`(`id`,`name`,`child_name`,`phone_no`,`mail_id`,`LOGIN_id`) values 
(1,'kguui','bjhio',868987790,'bkjhli',9),
(2,'lllal','wd',9876543,'yuyuytuy',1),
(3,'Ehsan','Hisham',1234567890,'ehsan@gmail.com',13),
(4,'Ehsan','Hisham',1234567890,'ehsan@gmail.com',14);

/*Table structure for table `asd_study_material` */

DROP TABLE IF EXISTS `asd_study_material`;

CREATE TABLE `asd_study_material` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `material` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `discription` longtext NOT NULL,
  `PARENT_id` bigint NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_study_material_PARENT_id_cf070bec_fk_ASD_parent_table_id` (`PARENT_id`),
  KEY `ASD_study_material_EXPERT_id_9fbc6f34_fk_ASD_expert_table_id` (`EXPERT_id`),
  CONSTRAINT `ASD_study_material_EXPERT_id_9fbc6f34_fk_ASD_expert_table_id` FOREIGN KEY (`EXPERT_id`) REFERENCES `asd_expert_table` (`id`),
  CONSTRAINT `ASD_study_material_PARENT_id_cf070bec_fk_ASD_parent_table_id` FOREIGN KEY (`PARENT_id`) REFERENCES `asd_parent_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_study_material` */

insert  into `asd_study_material`(`id`,`material`,`date`,`discription`,`PARENT_id`,`EXPERT_id`) values 
(1,'notes','2024-02-15','idh study materials',2,1),
(2,'man-sign-human-icon-men-symbol-vector-13933839_ndqBNfh.jpg','2024-03-28','ijioji',1,1),
(3,'man-sign-human-icon-men-symbol-vector-13933839_ndqBNfh.jpg','2024-03-28','jgfuyjgi',1,1),
(4,'man-sign-human-icon-men-symbol-vector-13933839_ndqBNfh.jpg','2024-04-06','dsqs',4,1);

/*Table structure for table `asd_tips_table` */

DROP TABLE IF EXISTS `asd_tips_table`;

CREATE TABLE `asd_tips_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tips` longtext NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ASD_tips_table_EXPERT_id_683dddc3_fk_ASD_expert_table_id` (`EXPERT_id`),
  CONSTRAINT `ASD_tips_table_EXPERT_id_683dddc3_fk_ASD_expert_table_id` FOREIGN KEY (`EXPERT_id`) REFERENCES `asd_expert_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `asd_tips_table` */

insert  into `asd_tips_table`(`id`,`tips`,`EXPERT_id`) values 
(7,'wgtwrtgwrgtwr',1);

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add expert_table',7,'add_expert_table'),
(26,'Can change expert_table',7,'change_expert_table'),
(27,'Can delete expert_table',7,'delete_expert_table'),
(28,'Can view expert_table',7,'view_expert_table'),
(29,'Can add login_table',8,'add_login_table'),
(30,'Can change login_table',8,'change_login_table'),
(31,'Can delete login_table',8,'delete_login_table'),
(32,'Can view login_table',8,'view_login_table'),
(33,'Can add parent_table',9,'add_parent_table'),
(34,'Can change parent_table',9,'change_parent_table'),
(35,'Can delete parent_table',9,'delete_parent_table'),
(36,'Can view parent_table',9,'view_parent_table'),
(37,'Can add tips_table',10,'add_tips_table'),
(38,'Can change tips_table',10,'change_tips_table'),
(39,'Can delete tips_table',10,'delete_tips_table'),
(40,'Can view tips_table',10,'view_tips_table'),
(41,'Can add study_material',11,'add_study_material'),
(42,'Can change study_material',11,'change_study_material'),
(43,'Can delete study_material',11,'delete_study_material'),
(44,'Can view study_material',11,'view_study_material'),
(45,'Can add guidance_table',12,'add_guidance_table'),
(46,'Can change guidance_table',12,'change_guidance_table'),
(47,'Can delete guidance_table',12,'delete_guidance_table'),
(48,'Can view guidance_table',12,'view_guidance_table'),
(49,'Can add feedback_table',13,'add_feedback_table'),
(50,'Can change feedback_table',13,'change_feedback_table'),
(51,'Can delete feedback_table',13,'delete_feedback_table'),
(52,'Can view feedback_table',13,'view_feedback_table'),
(53,'Can add doubt_table',14,'add_doubt_table'),
(54,'Can change doubt_table',14,'change_doubt_table'),
(55,'Can delete doubt_table',14,'delete_doubt_table'),
(56,'Can view doubt_table',14,'view_doubt_table'),
(57,'Can add complaint_table',15,'add_complaint_table'),
(58,'Can change complaint_table',15,'change_complaint_table'),
(59,'Can delete complaint_table',15,'delete_complaint_table'),
(60,'Can view complaint_table',15,'view_complaint_table'),
(61,'Can add child_assessment',16,'add_child_assessment'),
(62,'Can change child_assessment',16,'change_child_assessment'),
(63,'Can delete child_assessment',16,'delete_child_assessment'),
(64,'Can view child_assessment',16,'view_child_assessment'),
(65,'Can add assign_table',17,'add_assign_table'),
(66,'Can change assign_table',17,'change_assign_table'),
(67,'Can delete assign_table',17,'delete_assign_table'),
(68,'Can view assign_table',17,'view_assign_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(17,'ASD','assign_table'),
(16,'ASD','child_assessment'),
(15,'ASD','complaint_table'),
(14,'ASD','doubt_table'),
(7,'ASD','expert_table'),
(13,'ASD','feedback_table'),
(12,'ASD','guidance_table'),
(8,'ASD','login_table'),
(9,'ASD','parent_table'),
(11,'ASD','study_material'),
(10,'ASD','tips_table'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'ASD','0001_initial','2024-03-22 10:14:39.599676'),
(2,'contenttypes','0001_initial','2024-03-22 10:14:39.647753'),
(3,'auth','0001_initial','2024-03-22 10:14:40.342391'),
(4,'admin','0001_initial','2024-03-22 10:14:40.537399'),
(5,'admin','0002_logentry_remove_auto_add','2024-03-22 10:14:40.546904'),
(6,'admin','0003_logentry_add_action_flag_choices','2024-03-22 10:14:40.546904'),
(7,'contenttypes','0002_remove_content_type_name','2024-03-22 10:14:40.658198'),
(8,'auth','0002_alter_permission_name_max_length','2024-03-22 10:14:40.753873'),
(9,'auth','0003_alter_user_email_max_length','2024-03-22 10:14:40.786135'),
(10,'auth','0004_alter_user_username_opts','2024-03-22 10:14:40.786135'),
(11,'auth','0005_alter_user_last_login_null','2024-03-22 10:14:40.881232'),
(12,'auth','0006_require_contenttypes_0002','2024-03-22 10:14:40.896854'),
(13,'auth','0007_alter_validators_add_error_messages','2024-03-22 10:14:40.896854'),
(14,'auth','0008_alter_user_username_max_length','2024-03-22 10:14:40.993027'),
(15,'auth','0009_alter_user_last_name_max_length','2024-03-22 10:14:41.055761'),
(16,'auth','0010_alter_group_name_max_length','2024-03-22 10:14:41.071788'),
(17,'auth','0011_update_proxy_permissions','2024-03-22 10:14:41.087590'),
(18,'auth','0012_alter_user_first_name_max_length','2024-03-22 10:14:41.198313'),
(19,'sessions','0001_initial','2024-03-22 10:14:41.214428'),
(20,'ASD','0002_assign_table','2024-03-23 05:27:26.746190'),
(21,'ASD','0003_study_material_expert','2024-03-28 08:30:30.454622'),
(22,'ASD','0004_feedback_table_expert','2024-04-13 11:16:35.039952');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('5e2ap84tsgjly7cgfjxxysi8e3lmlqj2','eyJsaWQiOjd9:1rtOTm:Kou9cE51LRzZRqwLdfnZccjO4k7ragWVxaIAkP2WH2I','2024-04-21 09:06:22.051494'),
('7mytjabldf6weysj5e6hj0rww9ogk7ji','eyJsaWQiOjd9:1rtQHz:rGSdb8lQL15Yo-ZMzXVW5pfUpHd21qHwIL6BCxCnXdA','2024-04-21 11:02:19.296324'),
('e5ymvfefsekh0xo0tv3hz4id3iuflxgu','eyJsaWQiOjd9:1rtOHt:KnY25fpfmvmfVyjXTl45sQ0z5r3wsV9_V5KNqA5SeAQ','2024-04-21 08:54:05.059546'),
('kmlzxr38asj6bfxwda1em01ckbbtofqf','eyJsaWQiOjd9:1rtShJ:Se6nKT3j9vwf1L5Pvb1a6kyHaO9WJJceQb1MPtcDOrQ','2024-04-21 13:36:37.275479'),
('u3iyhwbhpzjswa55x6s2qu2eqc1ysy1m','eyJsaWQiOjd9:1rtPCf:2xhy32G8JRCv0jy6Rt_UfSFVvLIaX2TEaMq9a8D6I8o','2024-04-21 09:52:45.351690'),
('v0pre02zym6pxgypvx86g1j6zsdyy4nu','eyJsbCI6MywibGlkIjo3LCJwcCI6MSwiZGlkIjoyfQ:1rszoV:SPPmBvtmEfoYP9A-L1HVFliJyF3kOmb-UtFpL-cA_uM','2024-04-20 06:46:07.952476');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
