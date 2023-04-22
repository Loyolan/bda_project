-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour bd_gestion_bancaires
DROP DATABASE IF EXISTS `bd_gestion_bancaires`;
CREATE DATABASE IF NOT EXISTS `bd_gestion_bancaires` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_gestion_bancaires`;

-- Listage de la structure de la table bd_gestion_bancaires. app_auditcompte
DROP TABLE IF EXISTS `app_auditcompte`;
CREATE TABLE IF NOT EXISTS `app_auditcompte` (
  `id_av` int(11) NOT NULL AUTO_INCREMENT,
  `type_action` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `solde_anc` int(11) NOT NULL,
  `solde_nouv` int(11) NOT NULL,
  `utilisateur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_av`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.app_auditcompte : ~0 rows (environ)
DELETE FROM `app_auditcompte`;
/*!40000 ALTER TABLE `app_auditcompte` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_auditcompte` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. app_auditoperation
DROP TABLE IF EXISTS `app_auditoperation`;
CREATE TABLE IF NOT EXISTS `app_auditoperation` (
  `type_operation` char(50) DEFAULT NULL,
  `id_ao` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `num_cheque` varchar(5) NOT NULL,
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `montant` int(11) NOT NULL,
  `utilisateur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_ao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.app_auditoperation : ~0 rows (environ)
DELETE FROM `app_auditoperation`;
/*!40000 ALTER TABLE `app_auditoperation` DISABLE KEYS */;
INSERT INTO `app_auditoperation` (`type_operation`, `id_ao`, `date`, `num_cheque`, `num_compte`, `nom_client`, `montant`, `utilisateur`) VALUES
	('operation', 1, '2023-04-16', '213', '2909', 'test', 23, 'root'),
	('operation', 2, '2023-04-17', '21243', '2909', 'test', 3000, 'root');
/*!40000 ALTER TABLE `app_auditoperation` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. app_auditretrait
DROP TABLE IF EXISTS `app_auditretrait`;
CREATE TABLE IF NOT EXISTS `app_auditretrait` (
  `id_av` int(11) NOT NULL AUTO_INCREMENT,
  `type_action` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `num_ret` varchar(5) NOT NULL,
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `montant_anc` int(11) NOT NULL,
  `montant_nouv` int(11) NOT NULL,
  `utilisateur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_av`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.app_auditretrait : ~0 rows (environ)
DELETE FROM `app_auditretrait`;
/*!40000 ALTER TABLE `app_auditretrait` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_auditretrait` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. app_auditversement
DROP TABLE IF EXISTS `app_auditversement`;
CREATE TABLE IF NOT EXISTS `app_auditversement` (
  `id_av` int(11) NOT NULL AUTO_INCREMENT,
  `type_action` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `num_vers` varchar(5) NOT NULL,
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `montant_anc` int(11) NOT NULL,
  `montant_nouv` int(11) NOT NULL,
  `utilisateur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_av`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.app_auditversement : ~1 rows (environ)
DELETE FROM `app_auditversement`;
/*!40000 ALTER TABLE `app_auditversement` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_auditversement` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. app_client
DROP TABLE IF EXISTS `app_client`;
CREATE TABLE IF NOT EXISTS `app_client` (
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `solde` int(11) NOT NULL,
  PRIMARY KEY (`num_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.app_client : ~3 rows (environ)
DELETE FROM `app_client`;
/*!40000 ALTER TABLE `app_client` DISABLE KEYS */;
INSERT INTO `app_client` (`num_compte`, `nom_client`, `solde`) VALUES
	('2190', 'Koto', 600),
	('2909', 'Ando', 13000);
/*!40000 ALTER TABLE `app_client` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. app_retrait
DROP TABLE IF EXISTS `app_retrait`;
CREATE TABLE IF NOT EXISTS `app_retrait` (
  `num_ret` int(11) NOT NULL AUTO_INCREMENT,
  `num_cheque` varchar(5) NOT NULL,
  `montant` int(11) NOT NULL,
  `num_compte_id` varchar(5) NOT NULL,
  PRIMARY KEY (`num_ret`),
  KEY `app_retrait_num_compte_id_3f73b8d4_fk_app_client_num_compte` (`num_compte_id`),
  CONSTRAINT `app_retrait_num_compte_id_3f73b8d4_fk_app_client_num_compte` FOREIGN KEY (`num_compte_id`) REFERENCES `app_client` (`num_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.app_retrait : ~0 rows (environ)
DELETE FROM `app_retrait`;
/*!40000 ALTER TABLE `app_retrait` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_retrait` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. app_user
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE IF NOT EXISTS `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(8) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.app_user : ~0 rows (environ)
DELETE FROM `app_user`;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. app_versement
DROP TABLE IF EXISTS `app_versement`;
CREATE TABLE IF NOT EXISTS `app_versement` (
  `num_vers` int(11) NOT NULL AUTO_INCREMENT,
  `num_cheque` varchar(5) NOT NULL,
  `montant` int(11) NOT NULL,
  `num_compte_id` varchar(5) NOT NULL,
  PRIMARY KEY (`num_vers`),
  KEY `app_versement_num_compte_id_ff2e5a0e_fk_app_client_num_compte` (`num_compte_id`),
  CONSTRAINT `app_versement_num_compte_id_ff2e5a0e_fk_app_client_num_compte` FOREIGN KEY (`num_compte_id`) REFERENCES `app_client` (`num_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.app_versement : ~1 rows (environ)
DELETE FROM `app_versement`;
/*!40000 ALTER TABLE `app_versement` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_versement` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. auth_group
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.auth_group : ~0 rows (environ)
DELETE FROM `auth_group`;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. auth_group_permissions
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.auth_group_permissions : ~0 rows (environ)
DELETE FROM `auth_group_permissions`;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. auth_permission
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.auth_permission : ~56 rows (environ)
DELETE FROM `auth_permission`;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add audit compte', 7, 'add_auditcompte'),
	(26, 'Can change audit compte', 7, 'change_auditcompte'),
	(27, 'Can delete audit compte', 7, 'delete_auditcompte'),
	(28, 'Can view audit compte', 7, 'view_auditcompte'),
	(29, 'Can add audit operation', 8, 'add_auditoperation'),
	(30, 'Can change audit operation', 8, 'change_auditoperation'),
	(31, 'Can delete audit operation', 8, 'delete_auditoperation'),
	(32, 'Can view audit operation', 8, 'view_auditoperation'),
	(33, 'Can add audit retrait', 9, 'add_auditretrait'),
	(34, 'Can change audit retrait', 9, 'change_auditretrait'),
	(35, 'Can delete audit retrait', 9, 'delete_auditretrait'),
	(36, 'Can view audit retrait', 9, 'view_auditretrait'),
	(37, 'Can add audit versement', 10, 'add_auditversement'),
	(38, 'Can change audit versement', 10, 'change_auditversement'),
	(39, 'Can delete audit versement', 10, 'delete_auditversement'),
	(40, 'Can view audit versement', 10, 'view_auditversement'),
	(41, 'Can add client', 11, 'add_client'),
	(42, 'Can change client', 11, 'change_client'),
	(43, 'Can delete client', 11, 'delete_client'),
	(44, 'Can view client', 11, 'view_client'),
	(45, 'Can add user', 12, 'add_user'),
	(46, 'Can change user', 12, 'change_user'),
	(47, 'Can delete user', 12, 'delete_user'),
	(48, 'Can view user', 12, 'view_user'),
	(49, 'Can add versement', 13, 'add_versement'),
	(50, 'Can change versement', 13, 'change_versement'),
	(51, 'Can delete versement', 13, 'delete_versement'),
	(52, 'Can view versement', 13, 'view_versement'),
	(53, 'Can add retrait', 14, 'add_retrait'),
	(54, 'Can change retrait', 14, 'change_retrait'),
	(55, 'Can delete retrait', 14, 'delete_retrait'),
	(56, 'Can view retrait', 14, 'view_retrait');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. auth_user
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.auth_user : ~0 rows (environ)
DELETE FROM `auth_user`;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. auth_user_groups
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.auth_user_groups : ~0 rows (environ)
DELETE FROM `auth_user_groups`;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. auth_user_user_permissions
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.auth_user_user_permissions : ~0 rows (environ)
DELETE FROM `auth_user_user_permissions`;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. django_admin_log
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.django_admin_log : ~0 rows (environ)
DELETE FROM `django_admin_log`;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. django_content_type
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.django_content_type : ~14 rows (environ)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(7, 'app', 'auditcompte'),
	(8, 'app', 'auditoperation'),
	(9, 'app', 'auditretrait'),
	(10, 'app', 'auditversement'),
	(11, 'app', 'client'),
	(14, 'app', 'retrait'),
	(12, 'app', 'user'),
	(13, 'app', 'versement'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. django_migrations
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.django_migrations : ~19 rows (environ)
DELETE FROM `django_migrations`;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2023-03-20 10:26:59.793103'),
	(2, 'auth', '0001_initial', '2023-03-20 10:27:05.755192'),
	(3, 'admin', '0001_initial', '2023-03-20 10:27:07.084991'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-20 10:27:07.116243'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-20 10:27:07.147491'),
	(6, 'app', '0001_initial', '2023-03-20 10:27:10.694365'),
	(7, 'contenttypes', '0002_remove_content_type_name', '2023-03-20 10:27:11.788118'),
	(8, 'auth', '0002_alter_permission_name_max_length', '2023-03-20 10:27:11.944362'),
	(9, 'auth', '0003_alter_user_email_max_length', '2023-03-20 10:27:12.084989'),
	(10, 'auth', '0004_alter_user_username_opts', '2023-03-20 10:27:12.131864'),
	(11, 'auth', '0005_alter_user_last_login_null', '2023-03-20 10:27:12.585050'),
	(12, 'auth', '0006_require_contenttypes_0002', '2023-03-20 10:27:12.631871'),
	(13, 'auth', '0007_alter_validators_add_error_messages', '2023-03-20 10:27:12.678736'),
	(14, 'auth', '0008_alter_user_username_max_length', '2023-03-20 10:27:12.788115'),
	(15, 'auth', '0009_alter_user_last_name_max_length', '2023-03-20 10:27:12.928747'),
	(16, 'auth', '0010_alter_group_name_max_length', '2023-03-20 10:27:13.069365'),
	(17, 'auth', '0011_update_proxy_permissions', '2023-03-20 10:27:13.131872'),
	(18, 'auth', '0012_alter_user_first_name_max_length', '2023-03-20 10:27:13.272495'),
	(19, 'gestion_bancaires', '0001_initial', '2023-03-20 10:27:16.631861'),
	(20, 'sessions', '0001_initial', '2023-03-20 10:27:17.197589');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. django_session
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.django_session : ~0 rows (environ)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. gestion_bancaires_auditcompte
DROP TABLE IF EXISTS `gestion_bancaires_auditcompte`;
CREATE TABLE IF NOT EXISTS `gestion_bancaires_auditcompte` (
  `id_av` int(11) NOT NULL AUTO_INCREMENT,
  `type_action` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `solde_anc` int(11) NOT NULL,
  `solde_nouv` int(11) NOT NULL,
  `utilisateur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_av`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.gestion_bancaires_auditcompte : ~0 rows (environ)
DELETE FROM `gestion_bancaires_auditcompte`;
/*!40000 ALTER TABLE `gestion_bancaires_auditcompte` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_bancaires_auditcompte` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. gestion_bancaires_auditoperation
DROP TABLE IF EXISTS `gestion_bancaires_auditoperation`;
CREATE TABLE IF NOT EXISTS `gestion_bancaires_auditoperation` (
  `id_ao` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `num_cheque` varchar(5) NOT NULL,
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `montant` int(11) NOT NULL,
  `utilisateur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_ao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.gestion_bancaires_auditoperation : ~0 rows (environ)
DELETE FROM `gestion_bancaires_auditoperation`;
/*!40000 ALTER TABLE `gestion_bancaires_auditoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_bancaires_auditoperation` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. gestion_bancaires_auditretrait
DROP TABLE IF EXISTS `gestion_bancaires_auditretrait`;
CREATE TABLE IF NOT EXISTS `gestion_bancaires_auditretrait` (
  `id_av` int(11) NOT NULL AUTO_INCREMENT,
  `type_action` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `num_ret` varchar(5) NOT NULL,
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `montant_anc` int(11) NOT NULL,
  `montant_nouv` int(11) NOT NULL,
  `utilisateur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_av`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.gestion_bancaires_auditretrait : ~0 rows (environ)
DELETE FROM `gestion_bancaires_auditretrait`;
/*!40000 ALTER TABLE `gestion_bancaires_auditretrait` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_bancaires_auditretrait` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. gestion_bancaires_auditversement
DROP TABLE IF EXISTS `gestion_bancaires_auditversement`;
CREATE TABLE IF NOT EXISTS `gestion_bancaires_auditversement` (
  `id_av` int(11) NOT NULL AUTO_INCREMENT,
  `type_action` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `num_vers` varchar(5) NOT NULL,
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `montant_anc` int(11) NOT NULL,
  `montant_nouv` int(11) NOT NULL,
  `utilisateur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_av`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.gestion_bancaires_auditversement : ~0 rows (environ)
DELETE FROM `gestion_bancaires_auditversement`;
/*!40000 ALTER TABLE `gestion_bancaires_auditversement` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_bancaires_auditversement` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. gestion_bancaires_client
DROP TABLE IF EXISTS `gestion_bancaires_client`;
CREATE TABLE IF NOT EXISTS `gestion_bancaires_client` (
  `num_compte` varchar(5) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `solde` int(11) NOT NULL,
  PRIMARY KEY (`num_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.gestion_bancaires_client : ~0 rows (environ)
DELETE FROM `gestion_bancaires_client`;
/*!40000 ALTER TABLE `gestion_bancaires_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_bancaires_client` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. gestion_bancaires_retrait
DROP TABLE IF EXISTS `gestion_bancaires_retrait`;
CREATE TABLE IF NOT EXISTS `gestion_bancaires_retrait` (
  `num_ret` int(11) NOT NULL AUTO_INCREMENT,
  `num_cheque` varchar(5) NOT NULL,
  `montant` int(11) NOT NULL,
  `num_compte_id` varchar(5) NOT NULL,
  PRIMARY KEY (`num_ret`),
  KEY `gestion_bancaires_re_num_compte_id_1ece4894_fk_gestion_b` (`num_compte_id`),
  CONSTRAINT `gestion_bancaires_re_num_compte_id_1ece4894_fk_gestion_b` FOREIGN KEY (`num_compte_id`) REFERENCES `gestion_bancaires_client` (`num_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.gestion_bancaires_retrait : ~0 rows (environ)
DELETE FROM `gestion_bancaires_retrait`;
/*!40000 ALTER TABLE `gestion_bancaires_retrait` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_bancaires_retrait` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. gestion_bancaires_user
DROP TABLE IF EXISTS `gestion_bancaires_user`;
CREATE TABLE IF NOT EXISTS `gestion_bancaires_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(8) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.gestion_bancaires_user : ~0 rows (environ)
DELETE FROM `gestion_bancaires_user`;
/*!40000 ALTER TABLE `gestion_bancaires_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_bancaires_user` ENABLE KEYS */;

-- Listage de la structure de la table bd_gestion_bancaires. gestion_bancaires_versement
DROP TABLE IF EXISTS `gestion_bancaires_versement`;
CREATE TABLE IF NOT EXISTS `gestion_bancaires_versement` (
  `num_vers` int(11) NOT NULL AUTO_INCREMENT,
  `num_cheque` varchar(5) NOT NULL,
  `montant` int(11) NOT NULL,
  `num_compte_id` varchar(5) NOT NULL,
  PRIMARY KEY (`num_vers`),
  KEY `gestion_bancaires_ve_num_compte_id_6c95bb85_fk_gestion_b` (`num_compte_id`),
  CONSTRAINT `gestion_bancaires_ve_num_compte_id_6c95bb85_fk_gestion_b` FOREIGN KEY (`num_compte_id`) REFERENCES `gestion_bancaires_client` (`num_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bd_gestion_bancaires.gestion_bancaires_versement : ~0 rows (environ)
DELETE FROM `gestion_bancaires_versement`;
/*!40000 ALTER TABLE `gestion_bancaires_versement` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_bancaires_versement` ENABLE KEYS */;

-- Listage de la structure de déclencheur bd_gestion_bancaires. ajout_auto_compte_en_versement
DROP TRIGGER IF EXISTS `ajout_auto_compte_en_versement`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ajout_auto_compte_en_versement` AFTER INSERT ON `app_versement` FOR EACH ROW update app_client set solde = solde + NEW.montant where num_compte=NEW.num_compte_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. ajout_auto_compte_retrait
DROP TRIGGER IF EXISTS `ajout_auto_compte_retrait`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ajout_auto_compte_retrait` BEFORE INSERT ON `app_retrait` FOR EACH ROW BEGIN
	update app_client set solde = solde - NEW.montant where num_compte=NEW.num_compte_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. delete_auto_compte_en_versement
DROP TRIGGER IF EXISTS `delete_auto_compte_en_versement`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_auto_compte_en_versement` AFTER DELETE ON `app_versement` FOR EACH ROW update app_client set solde = solde - OLD.montant where num_compte=OLD.num_compte_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. delete_auto_compte_retrait
DROP TRIGGER IF EXISTS `delete_auto_compte_retrait`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_auto_compte_retrait` BEFORE DELETE ON `app_retrait` FOR EACH ROW BEGIN
	update app_client set solde = solde + OLD.montant where num_compte=OLD.num_compte_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trigger_audit_compte_insert
DROP TRIGGER IF EXISTS `trigger_audit_compte_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_audit_compte_insert` AFTER INSERT ON `app_client` FOR EACH ROW BEGIN
	insert into app_auditcompte VALUES ("0","ajout",NOW(),NEW.num_compte,(SELECT nom_client  
	FROM app_client WHERE num_compte=NEW.num_compte),NEW.solde,NEW.solde,"root");
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trigger_audit_compte_mod
DROP TRIGGER IF EXISTS `trigger_audit_compte_mod`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_audit_compte_mod` BEFORE UPDATE ON `app_client` FOR EACH ROW BEGIN
	insert into app_auditcompte VALUES ("0","modification",NOW(),OLD.num_compte,(SELECT nom_client  
	FROM app_client WHERE num_compte=OLD.num_compte),OLD.solde,NEW.solde,"root");
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trigger_audit_compte_sup
DROP TRIGGER IF EXISTS `trigger_audit_compte_sup`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_audit_compte_sup` BEFORE DELETE ON `app_client` FOR EACH ROW BEGIN
	insert into app_auditcompte VALUES ("0","suppression",NOW(),OLD.num_compte,(SELECT nom_client FROM app_client WHERE num_compte=OLD.num_compte),OLD.solde,0,"root");
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trigger_audit_retrait_mod
DROP TRIGGER IF EXISTS `trigger_audit_retrait_mod`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_audit_retrait_mod` AFTER UPDATE ON `app_retrait` FOR EACH ROW BEGIN
	insert into app_auditretrait VALUES ("0","modification",NOW(),OLD.num_ret,OLD.num_compte_id,(SELECT nom_client  
	FROM app_client WHERE num_compte=OLD.num_compte_id),OLD.montant,NEW.montant,"root");
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trigger_audit_retrait_sup
DROP TRIGGER IF EXISTS `trigger_audit_retrait_sup`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_audit_retrait_sup` AFTER DELETE ON `app_retrait` FOR EACH ROW BEGIN
	insert into app_auditretrait VALUES ("0","suppression",NOW(),OLD.num_ret,OLD.num_compte_id,(SELECT nom_client FROM app_client WHERE num_compte=OLD.num_compte_id),OLD.montant,0,"root");
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trigger_audit_versement_mod
DROP TRIGGER IF EXISTS `trigger_audit_versement_mod`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_audit_versement_mod` AFTER UPDATE ON `app_versement` FOR EACH ROW BEGIN
	insert into app_auditversement VALUES ("0","modification",NOW(),OLD.num_vers,OLD.num_compte_id,(SELECT nom_client  
	FROM app_client WHERE num_compte=OLD.num_compte_id),OLD.montant,NEW.montant,"root");
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trigger_audit_versement_sup
DROP TRIGGER IF EXISTS `trigger_audit_versement_sup`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_audit_versement_sup` AFTER DELETE ON `app_versement` FOR EACH ROW BEGIN
	insert into app_auditversement VALUES ("0","suppression",NOW(),OLD.num_vers,OLD.num_compte_id,(SELECT nom_client FROM app_client WHERE num_compte=OLD.num_compte_id),OLD.montant,0,"root");
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trigger_delete_retrait
DROP TRIGGER IF EXISTS `trigger_delete_retrait`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_delete_retrait` AFTER DELETE ON `app_retrait` FOR EACH ROW BEGIN
	update app_client set solde = solde + OLD.montant where num_compte=OLD.num_compte_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. trrigger_ajout_retrait
DROP TRIGGER IF EXISTS `trrigger_ajout_retrait`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trrigger_ajout_retrait` AFTER INSERT ON `app_retrait` FOR EACH ROW BEGIN
	update app_client set solde = solde - NEW.montant where num_compte=NEW.num_compte_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. update_auto_compte_en_versement
DROP TRIGGER IF EXISTS `update_auto_compte_en_versement`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `update_auto_compte_en_versement` AFTER UPDATE ON `app_versement` FOR EACH ROW BEGIN
if NEW.num_vers = OLD.num_vers then update app_client set solde = solde + abs(OLD.montant-NEW.montant) 
where num_compte=OLD.num_compte_id;
else update app_client set solde = solde + NEW.montant 
where num_compte=NEW.num_compte_id; update app_client set solde = solde - OLD.montant 
where num_compte=OLD.num_compte_id; end if; 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur bd_gestion_bancaires. update_auto_compte_retrait
DROP TRIGGER IF EXISTS `update_auto_compte_retrait`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `update_auto_compte_retrait` BEFORE UPDATE ON `app_retrait` FOR EACH ROW BEGIN
	if NEW.num_ret = OLD.num_ret then update app_client set solde = solde + abs(OLD.montant-NEW.montant) 
	where num_compte=OLD.num_compte_id;
	else update app_client set solde = solde - NEW.montant 
	where num_compte=NEW.num_compte_id; update app_client set solde = solde + OLD.montant 
	where num_compte=OLD.num_compte_id; end if; 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
