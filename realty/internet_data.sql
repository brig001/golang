/*
Navicat MySQL Data Transfer

Source Server         : cloudproject
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : internet_data

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2019-06-01 19:00:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cloudproject.app_develop`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.app_develop`;
CREATE TABLE `cloudproject.app_develop` (
  `develop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000' COMMENT '搴旂敤ID',
  `develop_name` varchar(80) NOT NULL,
  `develop_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '鍏朵粬淇℃伅澶囨敞',
  `del_flag` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`develop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.app_develop
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.component`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.component`;
CREATE TABLE `cloudproject.component` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鍞竴鑷涓婚敭id',
  `component_conf_id` int(11) NOT NULL COMMENT '瀵瑰簲鐨勯厤缃甶d',
  `url` varchar(128) NOT NULL COMMENT '閰嶇疆url',
  `desc` varchar(256) DEFAULT '' COMMENT '娣诲姞鎻忚堪',
  `create_time` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `component_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='绗笁鏂逛腑闂翠欢鍒楄〃';

-- ----------------------------
-- Records of cloudproject.component
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.log_templet`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.log_templet`;
CREATE TABLE `cloudproject.log_templet` (
  `log_templet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_templet_name` varchar(100) NOT NULL DEFAULT '' COMMENT '鏃ュ織妯℃澘鍚嶇О',
  `log_templet_key` varchar(30) NOT NULL DEFAULT '' COMMENT '鏃ュ織妯℃澘key',
  `log_templet_type` varchar(10) NOT NULL DEFAULT '0' COMMENT '鏃ュ織妯℃澘绫诲瀷',
  `log_templet_version` varchar(50) NOT NULL DEFAULT '' COMMENT '鏃ュ織妯℃澘鐗堟湰',
  `log_templet_context` varchar(3000) NOT NULL DEFAULT '' COMMENT '鏃ュ織妯℃澘璇存槑',
  `log_templet_format` varchar(500) NOT NULL DEFAULT '' COMMENT '鏃ュ織妯℃澘鏍煎紡',
  `log_templet_expamle` varchar(3000) NOT NULL DEFAULT '' COMMENT '鏃ュ織妯℃澘渚嬪瓙',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `del_flag` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  PRIMARY KEY (`log_templet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.log_templet
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.parent_project_link_host`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.parent_project_link_host`;
CREATE TABLE `cloudproject.parent_project_link_host` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `parent_project_id` int(11) NOT NULL COMMENT '鍒嗙粍id',
  `host_id` int(11) NOT NULL COMMENT '涓绘満id',
  `create_time` datetime DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `update_time` datetime DEFAULT NULL COMMENT '淇敼鏃堕棿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.parent_project_link_host
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_cluster`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_cluster`;
CREATE TABLE `cloudproject.t_cluster` (
  `cluster_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(100) NOT NULL DEFAULT '',
  `cluster_elk` varchar(100) NOT NULL DEFAULT '',
  `cluster_elk_port` varchar(10) NOT NULL DEFAULT '',
  `cluster_physical_network` varchar(100) NOT NULL,
  `cluster_sdn_network` varchar(100) NOT NULL,
  `cluster_service_network` varchar(100) NOT NULL,
  `cluster_harbor` varchar(100) NOT NULL,
  `cluster_service_controller_url` varchar(100) NOT NULL DEFAULT '',
  `cluster_status` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000' COMMENT '0: 寮傚父鐘舵€? 1: 姝ｅ父, 2: 姝ｅ湪鍒涘缓涓?',
  `cluster_type` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000' COMMENT '0: 榛樿鐨勯泦缇?1: allinone',
  `cluster_external_network_port` smallint(5) unsigned zerofill NOT NULL DEFAULT '30080' COMMENT '闆嗙兢澶栭儴璁块棶绔彛',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_cluster_node`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_cluster_node`;
CREATE TABLE `cloudproject.t_cluster_node` (
  `cluster_node_id` int(11) NOT NULL AUTO_INCREMENT,
  `cluster_id` int(10) unsigned zerofill NOT NULL,
  `cluster_node_name` varchar(100) NOT NULL,
  `cluster_node_ip` varchar(100) NOT NULL,
  `cluster_node_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1: master  2: node',
  `cluster_node_username` varchar(100) NOT NULL,
  `cluster_node_password` varchar(100) NOT NULL,
  `cluster_node_state` int(11) NOT NULL DEFAULT '0' COMMENT '鑺傜偣鐘舵€?0绛夊緟娣诲姞 1涓绘満娣诲姞涓?2 涓绘満娣诲姞鎴愬姛 3娣诲姞澶辫触 4涓绘満娣诲姞瓒呮椂 5绛夊緟鍒犻櫎 6鍒犻櫎涓?7鍒犻櫎澶辫触 8鍒犻櫎鎴愬姛 9鍒犻櫎瓒呮椂',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`cluster_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_cluster_node
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_cluster_node_group_link`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_cluster_node_group_link`;
CREATE TABLE `cloudproject.t_cluster_node_group_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cluster_node_group_id` int(10) unsigned NOT NULL COMMENT '鍒嗙粍id',
  `cluster_node_id` int(11) NOT NULL COMMENT '鑺傜偣id',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_cluster_node_group_link
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_config`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_config`;
CREATE TABLE `cloudproject.t_config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_project_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鐖堕」鐩甀D',
  `config_name` varchar(200) NOT NULL DEFAULT '' COMMENT '閰嶇疆鏂囦欢鍚嶇О',
  `config_file_name` varchar(200) NOT NULL,
  `config_file_content` varchar(12000) NOT NULL DEFAULT '' COMMENT '閰嶇疆鏂囦欢鍐呭',
  `createtime` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '鏄惁鍒犻櫎',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_config
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_default_config`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_default_config`;
CREATE TABLE `cloudproject.t_default_config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(50) NOT NULL DEFAULT '',
  `config_key` varchar(30) NOT NULL DEFAULT '',
  `config_context` varchar(2000) NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cloudproject.t_default_config
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_parent_project`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_parent_project`;
CREATE TABLE `cloudproject.t_parent_project` (
  `parent_project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_project_name` varchar(100) NOT NULL,
  `parent_project_type` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000' COMMENT '0:浜戞湇鍔￠」鐩?1:vm椤圭洰',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `parent_project_k8s_name` varchar(50) NOT NULL DEFAULT '',
  `cluster_node_group_id` int(11) NOT NULL DEFAULT '0',
  `parent_project_group_id` int(10) NOT NULL DEFAULT '0' COMMENT '鐖堕」鐩粍id',
  `parent_project_env_type` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000' COMMENT '0:鏃犵埗椤圭洰缁?1:娴嬭瘯椤圭洰 2:鐢熶骇椤圭洰',
  PRIMARY KEY (`parent_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_parent_project
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_privilege`;
CREATE TABLE `cloudproject.t_privilege` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(50) NOT NULL,
  `privilege_key` varchar(20) NOT NULL,
  `deleted` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `create_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `t_privilegecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_project_config`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_project_config`;
CREATE TABLE `cloudproject.t_project_config` (
  `project_config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `config_id` int(10) NOT NULL,
  `project_config_name` varchar(100) NOT NULL DEFAULT '',
  `project_config_path` varchar(200) NOT NULL DEFAULT '',
  `project_config_mountpoint` varchar(100) NOT NULL DEFAULT '',
  `createtime` datetime NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_project_config
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_project_environment_variable`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_project_environment_variable`;
CREATE TABLE `cloudproject.t_project_environment_variable` (
  `project_environment_variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `project_environment_variable_name` varchar(100) NOT NULL,
  `project_environment_variable_value` varchar(100) NOT NULL,
  `createtime` datetime NOT NULL,
  `deleted` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  PRIMARY KEY (`project_environment_variable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_project_environment_variable
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_project_image`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_project_image`;
CREATE TABLE `cloudproject.t_project_image` (
  `project_image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `project_image_name` varchar(200) NOT NULL DEFAULT '',
  `project_image_container` varchar(50) NOT NULL DEFAULT '',
  `project_image_bigjson` varchar(5000) NOT NULL DEFAULT '',
  `project_image_warehouse` varchar(200) NOT NULL DEFAULT '' COMMENT '闀滃儚浠撳簱鍦板潃',
  `project_image_build_number` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_project_image
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_project_image_environment_variable`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_project_image_environment_variable`;
CREATE TABLE `cloudproject.t_project_image_environment_variable` (
  `project_image_environment_variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_image_id` int(10) unsigned NOT NULL COMMENT '椤圭洰闀滃儚id',
  `project_image_environment_variable_name` varchar(100) NOT NULL,
  `project_image_environment_variable_value` varchar(100) NOT NULL,
  `createtime` datetime NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_image_environment_variable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_project_image_environment_variable
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_project_job`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_project_job`;
CREATE TABLE `cloudproject.t_project_job` (
  `project_job_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL COMMENT '椤圭洰ID',
  `project_release_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0:婧愮爜鍙戝竷 1:image闀滃儚鍙戝竷 2锛欳D鍙戝竷',
  `project_job_name` varchar(30) NOT NULL DEFAULT '',
  `project_job_type` tinyint(4) NOT NULL DEFAULT '0',
  `project_job_order` tinyint(4) NOT NULL DEFAULT '0',
  `project_job_open` tinyint(4) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_project_job
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_project_log`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_project_log`;
CREATE TABLE `cloudproject.t_project_log` (
  `project_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_log_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1:绯荤粺 2锛氱敤鎴疯嚜瀹氫箟',
  `project_log_name` varchar(100) NOT NULL DEFAULT '',
  `project_log_path` varchar(200) NOT NULL DEFAULT '',
  `createtime` datetime NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_project_log
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_project_network_inner`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_project_network_inner`;
CREATE TABLE `cloudproject.t_project_network_inner` (
  `project_network_inner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_network_inner_name` varchar(100) NOT NULL DEFAULT '' COMMENT '鍚嶇О',
  `project_network_inner_k8s_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'k8sname',
  `project_network_inner_pod_port` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '瀹瑰櫒绔彛',
  `project_network_inner_service_port` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '鏈嶅姟绔彛',
  `project_network_inner_protocol` varchar(20) NOT NULL DEFAULT '' COMMENT '鍗忚(http, https)',
  `project_network_inner_path` varchar(200) NOT NULL DEFAULT '' COMMENT '璁块棶璺緞',
  `createtime` datetime NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_network_inner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_project_network_inner
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_service`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_service`;
CREATE TABLE `cloudproject.t_service` (
  `service_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) NOT NULL,
  `parentproject_name` varchar(100) NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_service
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_user`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_user`;
CREATE TABLE `cloudproject.t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uid` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_ldapdn` varchar(100) NOT NULL,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1:root鐢ㄦ埛 2:鏅€氱敤鎴?ldap鐢ㄦ埛)',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0:姝ｅ父 2:鍒犻櫎',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_user_link_application`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_user_link_application`;
CREATE TABLE `cloudproject.t_user_link_application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '鐢ㄦ埛id',
  `app_id` int(11) NOT NULL COMMENT '搴旂敤id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_user_link_application
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_user_parent_project`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_user_parent_project`;
CREATE TABLE `cloudproject.t_user_parent_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_project_id` int(11) NOT NULL,
  `deleted` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_user_parent_project
-- ----------------------------

-- ----------------------------
-- Table structure for `cloudproject.t_user_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `cloudproject.t_user_privilege`;
CREATE TABLE `cloudproject.t_user_privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `deleted` tinyint(3) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloudproject.t_user_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_account_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_privilege`;
CREATE TABLE `sys_account_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `account_id` int(11) DEFAULT '0' COMMENT '账户ID',
  `privilege_id` int(11) DEFAULT '0' COMMENT '权限ID',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '逻辑删除标记:0正常,1删除',
  `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `create_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人姓名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录账户分配的权限信息';

-- ----------------------------
-- Records of sys_account_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_account_privilegegroup`
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_privilegegroup`;
CREATE TABLE `sys_account_privilegegroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `account_id` int(11) DEFAULT '0' COMMENT '账户ID',
  `privilegegroup_id` int(11) DEFAULT '0' COMMENT '权限组ID',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '逻辑删除标记;0:否,1:是',
  `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `create_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人姓名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录账户分配的权限组信息';

-- ----------------------------
-- Records of sys_account_privilegegroup
-- ----------------------------

-- ----------------------------
-- Table structure for `t_canton`
-- ----------------------------
DROP TABLE IF EXISTS `t_canton`;
CREATE TABLE `t_canton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addressid` int(11) DEFAULT NULL,
  `province` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `city` varchar(150) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_canton
-- ----------------------------
INSERT INTO `t_canton` VALUES ('1', '100000', '全国', '全国');
INSERT INTO `t_canton` VALUES ('2', '110000', '北京市', '北京市');
INSERT INTO `t_canton` VALUES ('3', '120000', '天津市', '天津市');
INSERT INTO `t_canton` VALUES ('4', '130000', '河北省', '河北省');
INSERT INTO `t_canton` VALUES ('5', '130100', '河北省', '石家庄市');
INSERT INTO `t_canton` VALUES ('6', '130200', '河北省', '唐山市');
INSERT INTO `t_canton` VALUES ('7', '130300', '河北省', '秦皇岛市');
INSERT INTO `t_canton` VALUES ('8', '130400', '河北省', '邯郸市');
INSERT INTO `t_canton` VALUES ('9', '130500', '河北省', '邢台市');
INSERT INTO `t_canton` VALUES ('10', '130600', '河北省', '保定市');
INSERT INTO `t_canton` VALUES ('11', '130700', '河北省', '张家口市');
INSERT INTO `t_canton` VALUES ('12', '130800', '河北省', '承德市');
INSERT INTO `t_canton` VALUES ('13', '130900', '河北省', '沧州市');
INSERT INTO `t_canton` VALUES ('14', '131000', '河北省', '廊坊市');
INSERT INTO `t_canton` VALUES ('15', '131100', '河北省', '衡水市');
INSERT INTO `t_canton` VALUES ('16', '140000', '山西省', '山西省');
INSERT INTO `t_canton` VALUES ('17', '140100', '山西省', '太原市');
INSERT INTO `t_canton` VALUES ('18', '140200', '山西省', '大同市');
INSERT INTO `t_canton` VALUES ('19', '140300', '山西省', '阳泉市');
INSERT INTO `t_canton` VALUES ('20', '140400', '山西省', '长治市');
INSERT INTO `t_canton` VALUES ('21', '140500', '山西省', '晋城市');
INSERT INTO `t_canton` VALUES ('22', '140600', '山西省', '朔州市');
INSERT INTO `t_canton` VALUES ('23', '140700', '山西省', '晋中市');
INSERT INTO `t_canton` VALUES ('24', '140800', '山西省', '运城市');
INSERT INTO `t_canton` VALUES ('25', '140900', '山西省', '忻州市');
INSERT INTO `t_canton` VALUES ('26', '141000', '山西省', '临汾市');
INSERT INTO `t_canton` VALUES ('27', '141100', '山西省', '吕梁市');
INSERT INTO `t_canton` VALUES ('28', '150000', '内蒙古自治区', '内蒙古自治区');
INSERT INTO `t_canton` VALUES ('29', '150100', '内蒙古自治区', '呼和浩特市');
INSERT INTO `t_canton` VALUES ('30', '150200', '内蒙古自治区', '包头市');
INSERT INTO `t_canton` VALUES ('31', '150300', '内蒙古自治区', '乌海市');
INSERT INTO `t_canton` VALUES ('32', '150400', '内蒙古自治区', '赤峰市');
INSERT INTO `t_canton` VALUES ('33', '150500', '内蒙古自治区', '通辽市');
INSERT INTO `t_canton` VALUES ('34', '150600', '内蒙古自治区', '鄂尔多斯市');
INSERT INTO `t_canton` VALUES ('35', '150700', '内蒙古自治区', '呼伦贝尔市');
INSERT INTO `t_canton` VALUES ('36', '150800', '内蒙古自治区', '巴彦淖尔市');
INSERT INTO `t_canton` VALUES ('37', '150900', '内蒙古自治区', '乌兰察布市');
INSERT INTO `t_canton` VALUES ('38', '152200', '内蒙古自治区', '兴安盟');
INSERT INTO `t_canton` VALUES ('39', '152500', '内蒙古自治区', '锡林郭勒盟');
INSERT INTO `t_canton` VALUES ('40', '152900', '内蒙古自治区', '阿拉善盟');
INSERT INTO `t_canton` VALUES ('41', '210000', '辽宁省', '辽宁省');
INSERT INTO `t_canton` VALUES ('42', '210100', '辽宁省', '沈阳市');
INSERT INTO `t_canton` VALUES ('43', '210200', '辽宁省', '大连市');
INSERT INTO `t_canton` VALUES ('44', '210300', '辽宁省', '鞍山市');
INSERT INTO `t_canton` VALUES ('45', '210400', '辽宁省', '抚顺市');
INSERT INTO `t_canton` VALUES ('46', '210500', '辽宁省', '本溪市');
INSERT INTO `t_canton` VALUES ('47', '210600', '辽宁省', '丹东市');
INSERT INTO `t_canton` VALUES ('48', '210700', '辽宁省', '锦州市');
INSERT INTO `t_canton` VALUES ('49', '210800', '辽宁省', '营口市');
INSERT INTO `t_canton` VALUES ('50', '210900', '辽宁省', '阜新市');
INSERT INTO `t_canton` VALUES ('51', '211000', '辽宁省', '辽阳市');
INSERT INTO `t_canton` VALUES ('52', '211100', '辽宁省', '盘锦市');
INSERT INTO `t_canton` VALUES ('53', '211200', '辽宁省', '铁岭市');
INSERT INTO `t_canton` VALUES ('54', '211300', '辽宁省', '朝阳市');
INSERT INTO `t_canton` VALUES ('55', '211400', '辽宁省', '葫芦岛市');
INSERT INTO `t_canton` VALUES ('56', '220000', '吉林省', '吉林省');
INSERT INTO `t_canton` VALUES ('57', '220100', '吉林省', '长春市');
INSERT INTO `t_canton` VALUES ('58', '220200', '吉林省', '吉林市');
INSERT INTO `t_canton` VALUES ('59', '220300', '吉林省', '四平市');
INSERT INTO `t_canton` VALUES ('60', '220400', '吉林省', '辽源市');
INSERT INTO `t_canton` VALUES ('61', '220500', '吉林省', '通化市');
INSERT INTO `t_canton` VALUES ('62', '220600', '吉林省', '白山市');
INSERT INTO `t_canton` VALUES ('63', '220700', '吉林省', '松原市');
INSERT INTO `t_canton` VALUES ('64', '220800', '吉林省', '白城市');
INSERT INTO `t_canton` VALUES ('65', '222400', '吉林省', '延边朝鲜族自治州');
INSERT INTO `t_canton` VALUES ('66', '230000', '黑龙江省', '黑龙江省');
INSERT INTO `t_canton` VALUES ('67', '230100', '黑龙江省', '哈尔滨市');
INSERT INTO `t_canton` VALUES ('68', '230200', '黑龙江省', '齐齐哈尔市');
INSERT INTO `t_canton` VALUES ('69', '230300', '黑龙江省', '鸡西市');
INSERT INTO `t_canton` VALUES ('70', '230400', '黑龙江省', '鹤岗市');
INSERT INTO `t_canton` VALUES ('71', '230500', '黑龙江省', '双鸭山市');
INSERT INTO `t_canton` VALUES ('72', '230600', '黑龙江省', '大庆市');
INSERT INTO `t_canton` VALUES ('73', '230700', '黑龙江省', '伊春市');
INSERT INTO `t_canton` VALUES ('74', '230800', '黑龙江省', '佳木斯市');
INSERT INTO `t_canton` VALUES ('75', '230900', '黑龙江省', '七台河市');
INSERT INTO `t_canton` VALUES ('76', '231000', '黑龙江省', '牡丹江市');
INSERT INTO `t_canton` VALUES ('77', '231100', '黑龙江省', '黑河市');
INSERT INTO `t_canton` VALUES ('78', '231200', '黑龙江省', '绥化市');
INSERT INTO `t_canton` VALUES ('79', '232700', '黑龙江省', '大兴安岭地区');
INSERT INTO `t_canton` VALUES ('80', '310000', '上海市', '上海市');
INSERT INTO `t_canton` VALUES ('81', '320000', '江苏省', '江苏省');
INSERT INTO `t_canton` VALUES ('82', '320100', '江苏省', '南京市');
INSERT INTO `t_canton` VALUES ('83', '320200', '江苏省', '无锡市');
INSERT INTO `t_canton` VALUES ('84', '320300', '江苏省', '徐州市');
INSERT INTO `t_canton` VALUES ('85', '320400', '江苏省', '常州市');
INSERT INTO `t_canton` VALUES ('86', '320500', '江苏省', '苏州市');
INSERT INTO `t_canton` VALUES ('87', '320600', '江苏省', '南通市');
INSERT INTO `t_canton` VALUES ('88', '320700', '江苏省', '连云港市');
INSERT INTO `t_canton` VALUES ('89', '320800', '江苏省', '淮安市');
INSERT INTO `t_canton` VALUES ('90', '320900', '江苏省', '盐城市');
INSERT INTO `t_canton` VALUES ('91', '321000', '江苏省', '扬州市');
INSERT INTO `t_canton` VALUES ('92', '321100', '江苏省', '镇江市');
INSERT INTO `t_canton` VALUES ('93', '321200', '江苏省', '泰州市');
INSERT INTO `t_canton` VALUES ('94', '321300', '江苏省', '宿迁市');
INSERT INTO `t_canton` VALUES ('95', '340000', '安徽省', '安徽省');
INSERT INTO `t_canton` VALUES ('96', '340100', '安徽省', '合肥市');
INSERT INTO `t_canton` VALUES ('97', '340200', '安徽省', '芜湖市');
INSERT INTO `t_canton` VALUES ('98', '340300', '安徽省', '蚌埠市');
INSERT INTO `t_canton` VALUES ('99', '340400', '安徽省', '淮南市');
INSERT INTO `t_canton` VALUES ('100', '340500', '安徽省', '马鞍山市');
INSERT INTO `t_canton` VALUES ('101', '340600', '安徽省', '淮北市');
INSERT INTO `t_canton` VALUES ('102', '340700', '安徽省', '铜陵市');
INSERT INTO `t_canton` VALUES ('103', '340800', '安徽省', '安庆市');
INSERT INTO `t_canton` VALUES ('104', '341000', '安徽省', '黄山市');
INSERT INTO `t_canton` VALUES ('105', '341100', '安徽省', '滁州市');
INSERT INTO `t_canton` VALUES ('106', '341200', '安徽省', '阜阳市');
INSERT INTO `t_canton` VALUES ('107', '341300', '安徽省', '宿州市');
INSERT INTO `t_canton` VALUES ('108', '341500', '安徽省', '六安市');
INSERT INTO `t_canton` VALUES ('109', '341600', '安徽省', '亳州市');
INSERT INTO `t_canton` VALUES ('110', '341700', '安徽省', '池州市');
INSERT INTO `t_canton` VALUES ('111', '341800', '安徽省', '宣城市');
INSERT INTO `t_canton` VALUES ('112', '350000', '福建省', '福建省');
INSERT INTO `t_canton` VALUES ('113', '350100', '福建省', '福州市');
INSERT INTO `t_canton` VALUES ('114', '350200', '福建省', '厦门市');
INSERT INTO `t_canton` VALUES ('115', '350300', '福建省', '莆田市');
INSERT INTO `t_canton` VALUES ('116', '350400', '福建省', '三明市');
INSERT INTO `t_canton` VALUES ('117', '350500', '福建省', '泉州市');
INSERT INTO `t_canton` VALUES ('118', '350600', '福建省', '漳州市');
INSERT INTO `t_canton` VALUES ('119', '350700', '福建省', '南平市');
INSERT INTO `t_canton` VALUES ('120', '350800', '福建省', '龙岩市');
INSERT INTO `t_canton` VALUES ('121', '350900', '福建省', '宁德市');
INSERT INTO `t_canton` VALUES ('122', '360000', '江西省', '江西省');
INSERT INTO `t_canton` VALUES ('123', '360100', '江西省', '南昌市');
INSERT INTO `t_canton` VALUES ('124', '360200', '江西省', '景德镇市');
INSERT INTO `t_canton` VALUES ('125', '360300', '江西省', '萍乡市');
INSERT INTO `t_canton` VALUES ('126', '360400', '江西省', '九江市');
INSERT INTO `t_canton` VALUES ('127', '360500', '江西省', '新余市');
INSERT INTO `t_canton` VALUES ('128', '360600', '江西省', '鹰潭市');
INSERT INTO `t_canton` VALUES ('129', '360700', '江西省', '赣州市');
INSERT INTO `t_canton` VALUES ('130', '360800', '江西省', '吉安市');
INSERT INTO `t_canton` VALUES ('131', '360900', '江西省', '宜春市');
INSERT INTO `t_canton` VALUES ('132', '361000', '江西省', '抚州市');
INSERT INTO `t_canton` VALUES ('133', '361100', '江西省', '上饶市');
INSERT INTO `t_canton` VALUES ('134', '370000', '山东省', '山东省');
INSERT INTO `t_canton` VALUES ('135', '370100', '山东省', '济南市');
INSERT INTO `t_canton` VALUES ('136', '370200', '山东省', '青岛市');
INSERT INTO `t_canton` VALUES ('137', '370300', '山东省', '淄博市');
INSERT INTO `t_canton` VALUES ('138', '370400', '山东省', '枣庄市');
INSERT INTO `t_canton` VALUES ('139', '370500', '山东省', '东营市');
INSERT INTO `t_canton` VALUES ('140', '370600', '山东省', '烟台市');
INSERT INTO `t_canton` VALUES ('141', '370700', '山东省', '潍坊市');
INSERT INTO `t_canton` VALUES ('142', '370800', '山东省', '济宁市');
INSERT INTO `t_canton` VALUES ('143', '370900', '山东省', '泰安市');
INSERT INTO `t_canton` VALUES ('144', '371000', '山东省', '威海市');
INSERT INTO `t_canton` VALUES ('145', '371100', '山东省', '日照市');
INSERT INTO `t_canton` VALUES ('146', '371200', '山东省', '莱芜市');
INSERT INTO `t_canton` VALUES ('147', '371300', '山东省', '临沂市');
INSERT INTO `t_canton` VALUES ('148', '371400', '山东省', '德州市');
INSERT INTO `t_canton` VALUES ('149', '371500', '山东省', '聊城市');
INSERT INTO `t_canton` VALUES ('150', '371600', '山东省', '滨州市');
INSERT INTO `t_canton` VALUES ('151', '371700', '山东省', '菏泽市');
INSERT INTO `t_canton` VALUES ('152', '410000', '河南省', '河南省');
INSERT INTO `t_canton` VALUES ('153', '410100', '河南省', '郑州市');
INSERT INTO `t_canton` VALUES ('154', '410200', '河南省', '开封市');
INSERT INTO `t_canton` VALUES ('155', '410300', '河南省', '洛阳市');
INSERT INTO `t_canton` VALUES ('156', '410400', '河南省', '平顶山市');
INSERT INTO `t_canton` VALUES ('157', '410500', '河南省', '安阳市');
INSERT INTO `t_canton` VALUES ('158', '410600', '河南省', '鹤壁市');
INSERT INTO `t_canton` VALUES ('159', '410700', '河南省', '新乡市');
INSERT INTO `t_canton` VALUES ('160', '410800', '河南省', '焦作市');
INSERT INTO `t_canton` VALUES ('161', '410900', '河南省', '濮阳市');
INSERT INTO `t_canton` VALUES ('162', '411000', '河南省', '许昌市');
INSERT INTO `t_canton` VALUES ('163', '411100', '河南省', '漯河市');
INSERT INTO `t_canton` VALUES ('164', '411200', '河南省', '三门峡市');
INSERT INTO `t_canton` VALUES ('165', '411300', '河南省', '南阳市');
INSERT INTO `t_canton` VALUES ('166', '411400', '河南省', '商丘市');
INSERT INTO `t_canton` VALUES ('167', '411500', '河南省', '信阳市');
INSERT INTO `t_canton` VALUES ('168', '411600', '河南省', '周口市');
INSERT INTO `t_canton` VALUES ('169', '411700', '河南省', '驻马店市');
INSERT INTO `t_canton` VALUES ('170', '420000', '湖北省', '湖北省');
INSERT INTO `t_canton` VALUES ('171', '420100', '湖北省', '武汉市');
INSERT INTO `t_canton` VALUES ('172', '420200', '湖北省', '黄石市');
INSERT INTO `t_canton` VALUES ('173', '420300', '湖北省', '十堰市');
INSERT INTO `t_canton` VALUES ('174', '420500', '湖北省', '宜昌市');
INSERT INTO `t_canton` VALUES ('175', '420600', '湖北省', '襄阳市');
INSERT INTO `t_canton` VALUES ('176', '420700', '湖北省', '鄂州市');
INSERT INTO `t_canton` VALUES ('177', '420800', '湖北省', '荆门市');
INSERT INTO `t_canton` VALUES ('178', '420900', '湖北省', '孝感市');
INSERT INTO `t_canton` VALUES ('179', '421000', '湖北省', '荆州市');
INSERT INTO `t_canton` VALUES ('180', '421100', '湖北省', '黄冈市');
INSERT INTO `t_canton` VALUES ('181', '421200', '湖北省', '咸宁市');
INSERT INTO `t_canton` VALUES ('182', '421300', '湖北省', '随州市');
INSERT INTO `t_canton` VALUES ('183', '422800', '湖北省', '恩施土家族苗族自治州');
INSERT INTO `t_canton` VALUES ('184', '430000', '湖南省', '湖南省');
INSERT INTO `t_canton` VALUES ('185', '430100', '湖南省', '长沙市');
INSERT INTO `t_canton` VALUES ('186', '430200', '湖南省', '株洲市');
INSERT INTO `t_canton` VALUES ('187', '430300', '湖南省', '湘潭市');
INSERT INTO `t_canton` VALUES ('188', '430400', '湖南省', '衡阳市');
INSERT INTO `t_canton` VALUES ('189', '430500', '湖南省', '邵阳市');
INSERT INTO `t_canton` VALUES ('190', '430600', '湖南省', '岳阳市');
INSERT INTO `t_canton` VALUES ('191', '430700', '湖南省', '常德市');
INSERT INTO `t_canton` VALUES ('192', '430800', '湖南省', '张家界市');
INSERT INTO `t_canton` VALUES ('193', '430900', '湖南省', '益阳市');
INSERT INTO `t_canton` VALUES ('194', '431000', '湖南省', '郴州市');
INSERT INTO `t_canton` VALUES ('195', '431100', '湖南省', '永州市');
INSERT INTO `t_canton` VALUES ('196', '431200', '湖南省', '怀化市');
INSERT INTO `t_canton` VALUES ('197', '431300', '湖南省', '娄底市');
INSERT INTO `t_canton` VALUES ('198', '433100', '湖南省', '湘西土家族苗族自治州');
INSERT INTO `t_canton` VALUES ('199', '440000', '广东省', '广东省');
INSERT INTO `t_canton` VALUES ('200', '440100', '广东省', '广州市');
INSERT INTO `t_canton` VALUES ('201', '440200', '广东省', '韶关市');
INSERT INTO `t_canton` VALUES ('202', '440300', '广东省', '深圳市');
INSERT INTO `t_canton` VALUES ('203', '440400', '广东省', '珠海市');
INSERT INTO `t_canton` VALUES ('204', '440500', '广东省', '汕头市');
INSERT INTO `t_canton` VALUES ('205', '440600', '广东省', '佛山市');
INSERT INTO `t_canton` VALUES ('206', '440700', '广东省', '江门市');
INSERT INTO `t_canton` VALUES ('207', '440800', '广东省', '湛江市');
INSERT INTO `t_canton` VALUES ('208', '440900', '广东省', '茂名市');
INSERT INTO `t_canton` VALUES ('209', '441200', '广东省', '肇庆市');
INSERT INTO `t_canton` VALUES ('210', '441300', '广东省', '惠州市');
INSERT INTO `t_canton` VALUES ('211', '441400', '广东省', '梅州市');
INSERT INTO `t_canton` VALUES ('212', '441500', '广东省', '汕尾市');
INSERT INTO `t_canton` VALUES ('213', '441600', '广东省', '河源市');
INSERT INTO `t_canton` VALUES ('214', '441700', '广东省', '阳江市');
INSERT INTO `t_canton` VALUES ('215', '441800', '广东省', '清远市');
INSERT INTO `t_canton` VALUES ('216', '441900', '广东省', '东莞市');
INSERT INTO `t_canton` VALUES ('217', '442000', '广东省', '中山市');
INSERT INTO `t_canton` VALUES ('218', '445100', '广东省', '潮州市');
INSERT INTO `t_canton` VALUES ('219', '445200', '广东省', '揭阳市');
INSERT INTO `t_canton` VALUES ('220', '445300', '广东省', '云浮市');
INSERT INTO `t_canton` VALUES ('221', '450000', '广西壮族自治区', '广西壮族自治区');
INSERT INTO `t_canton` VALUES ('222', '450100', '广西壮族自治区', '南宁市');
INSERT INTO `t_canton` VALUES ('223', '450200', '广西壮族自治区', '柳州市');
INSERT INTO `t_canton` VALUES ('224', '450300', '广西壮族自治区', '桂林市');
INSERT INTO `t_canton` VALUES ('225', '450400', '广西壮族自治区', '梧州市');
INSERT INTO `t_canton` VALUES ('226', '450500', '广西壮族自治区', '北海市');
INSERT INTO `t_canton` VALUES ('227', '450600', '广西壮族自治区', '防城港市');
INSERT INTO `t_canton` VALUES ('228', '450700', '广西壮族自治区', '钦州市');
INSERT INTO `t_canton` VALUES ('229', '450800', '广西壮族自治区', '贵港市');
INSERT INTO `t_canton` VALUES ('230', '450900', '广西壮族自治区', '玉林市');
INSERT INTO `t_canton` VALUES ('231', '451000', '广西壮族自治区', '百色市');
INSERT INTO `t_canton` VALUES ('232', '451100', '广西壮族自治区', '贺州市');
INSERT INTO `t_canton` VALUES ('233', '451200', '广西壮族自治区', '河池市');
INSERT INTO `t_canton` VALUES ('234', '451300', '广西壮族自治区', '来宾市');
INSERT INTO `t_canton` VALUES ('235', '451400', '广西壮族自治区', '崇左市');
INSERT INTO `t_canton` VALUES ('236', '460000', '海南省', '海南省');
INSERT INTO `t_canton` VALUES ('237', '460100', '海南省', '海口市');
INSERT INTO `t_canton` VALUES ('238', '460200', '海南省', '三亚市');
INSERT INTO `t_canton` VALUES ('239', '460300', '海南省', '三沙市');
INSERT INTO `t_canton` VALUES ('240', '500000', '重庆市', '重庆市');
INSERT INTO `t_canton` VALUES ('241', '510000', '四川省', '四川省');
INSERT INTO `t_canton` VALUES ('242', '510100', '四川省', '成都市');
INSERT INTO `t_canton` VALUES ('243', '510300', '四川省', '自贡市');
INSERT INTO `t_canton` VALUES ('244', '510400', '四川省', '攀枝花市');
INSERT INTO `t_canton` VALUES ('245', '510500', '四川省', '泸州市');
INSERT INTO `t_canton` VALUES ('246', '510600', '四川省', '德阳市');
INSERT INTO `t_canton` VALUES ('247', '510700', '四川省', '绵阳市');
INSERT INTO `t_canton` VALUES ('248', '510800', '四川省', '广元市');
INSERT INTO `t_canton` VALUES ('249', '510900', '四川省', '遂宁市');
INSERT INTO `t_canton` VALUES ('250', '511000', '四川省', '内江市');
INSERT INTO `t_canton` VALUES ('251', '511100', '四川省', '乐山市');
INSERT INTO `t_canton` VALUES ('252', '511300', '四川省', '南充市');
INSERT INTO `t_canton` VALUES ('253', '511400', '四川省', '眉山市');
INSERT INTO `t_canton` VALUES ('254', '511500', '四川省', '宜宾市');
INSERT INTO `t_canton` VALUES ('255', '511600', '四川省', '广安市');
INSERT INTO `t_canton` VALUES ('256', '511700', '四川省', '达州市');
INSERT INTO `t_canton` VALUES ('257', '511800', '四川省', '雅安市');
INSERT INTO `t_canton` VALUES ('258', '511900', '四川省', '巴中市');
INSERT INTO `t_canton` VALUES ('259', '512000', '四川省', '资阳市');
INSERT INTO `t_canton` VALUES ('260', '513200', '四川省', '阿坝藏族羌族自治州');
INSERT INTO `t_canton` VALUES ('261', '513300', '四川省', '甘孜藏族自治州');
INSERT INTO `t_canton` VALUES ('262', '513400', '四川省', '凉山彝族自治州');
INSERT INTO `t_canton` VALUES ('263', '520000', '贵州省', '贵州省');
INSERT INTO `t_canton` VALUES ('264', '520100', '贵州省', '贵阳市');
INSERT INTO `t_canton` VALUES ('265', '520200', '贵州省', '六盘水市');
INSERT INTO `t_canton` VALUES ('266', '520300', '贵州省', '遵义市');
INSERT INTO `t_canton` VALUES ('267', '520400', '贵州省', '安顺市');
INSERT INTO `t_canton` VALUES ('268', '520500', '贵州省', '毕节市');
INSERT INTO `t_canton` VALUES ('269', '520600', '贵州省', '铜仁市');
INSERT INTO `t_canton` VALUES ('270', '522300', '贵州省', '黔西南布依族苗族自治州');
INSERT INTO `t_canton` VALUES ('271', '522600', '贵州省', '黔东南苗族侗族自治州');
INSERT INTO `t_canton` VALUES ('272', '522700', '贵州省', '黔南布依族苗族自治州');
INSERT INTO `t_canton` VALUES ('273', '530000', '云南省', '云南省');
INSERT INTO `t_canton` VALUES ('274', '530100', '云南省', '昆明市');
INSERT INTO `t_canton` VALUES ('275', '530300', '云南省', '曲靖市');
INSERT INTO `t_canton` VALUES ('276', '530400', '云南省', '玉溪市');
INSERT INTO `t_canton` VALUES ('277', '530500', '云南省', '保山市');
INSERT INTO `t_canton` VALUES ('278', '530600', '云南省', '昭通市');
INSERT INTO `t_canton` VALUES ('279', '530700', '云南省', '丽江市');
INSERT INTO `t_canton` VALUES ('280', '530800', '云南省', '普洱市');
INSERT INTO `t_canton` VALUES ('281', '530900', '云南省', '临沧市');
INSERT INTO `t_canton` VALUES ('282', '532300', '云南省', '楚雄彝族自治州');
INSERT INTO `t_canton` VALUES ('283', '532500', '云南省', '红河哈尼族彝族自治州');
INSERT INTO `t_canton` VALUES ('284', '532600', '云南省', '文山壮族苗族自治州');
INSERT INTO `t_canton` VALUES ('285', '532800', '云南省', '西双版纳傣族自治州');
INSERT INTO `t_canton` VALUES ('286', '532900', '云南省', '大理白族自治州');
INSERT INTO `t_canton` VALUES ('287', '533100', '云南省', '德宏傣族景颇族自治州');
INSERT INTO `t_canton` VALUES ('288', '533300', '云南省', '怒江傈僳族自治州');
INSERT INTO `t_canton` VALUES ('289', '533400', '云南省', '迪庆藏族自治州');
INSERT INTO `t_canton` VALUES ('290', '540000', '西藏自治区', '西藏自治区');
INSERT INTO `t_canton` VALUES ('291', '540100', '西藏自治区', '拉萨市');
INSERT INTO `t_canton` VALUES ('292', '540200', '西藏自治区', '日喀则市');
INSERT INTO `t_canton` VALUES ('293', '540300', '西藏自治区', '昌都市');
INSERT INTO `t_canton` VALUES ('294', '540400', '西藏自治区', '林芝市');
INSERT INTO `t_canton` VALUES ('295', '542200', '西藏自治区', '山南地区');
INSERT INTO `t_canton` VALUES ('296', '542400', '西藏自治区', '那曲地区');
INSERT INTO `t_canton` VALUES ('297', '542500', '西藏自治区', '阿里地区');
INSERT INTO `t_canton` VALUES ('298', '610000', '陕西省', '陕西省');
INSERT INTO `t_canton` VALUES ('299', '610100', '陕西省', '西安市');
INSERT INTO `t_canton` VALUES ('300', '610200', '陕西省', '铜川市');
INSERT INTO `t_canton` VALUES ('301', '610300', '陕西省', '宝鸡市');
INSERT INTO `t_canton` VALUES ('302', '610400', '陕西省', '咸阳市');
INSERT INTO `t_canton` VALUES ('303', '610500', '陕西省', '渭南市');
INSERT INTO `t_canton` VALUES ('304', '610600', '陕西省', '延安市');
INSERT INTO `t_canton` VALUES ('305', '610700', '陕西省', '汉中市');
INSERT INTO `t_canton` VALUES ('306', '610800', '陕西省', '榆林市');
INSERT INTO `t_canton` VALUES ('307', '610900', '陕西省', '安康市');
INSERT INTO `t_canton` VALUES ('308', '611000', '陕西省', '商洛市');
INSERT INTO `t_canton` VALUES ('309', '620000', '甘肃省', '甘肃省');
INSERT INTO `t_canton` VALUES ('310', '620100', '甘肃省', '兰州市');
INSERT INTO `t_canton` VALUES ('311', '620200', '甘肃省', '嘉峪关市');
INSERT INTO `t_canton` VALUES ('312', '620300', '甘肃省', '金昌市');
INSERT INTO `t_canton` VALUES ('313', '620400', '甘肃省', '白银市');
INSERT INTO `t_canton` VALUES ('314', '620500', '甘肃省', '天水市');
INSERT INTO `t_canton` VALUES ('315', '620600', '甘肃省', '武威市');
INSERT INTO `t_canton` VALUES ('316', '620700', '甘肃省', '张掖市');
INSERT INTO `t_canton` VALUES ('317', '620800', '甘肃省', '平凉市');
INSERT INTO `t_canton` VALUES ('318', '620900', '甘肃省', '酒泉市');
INSERT INTO `t_canton` VALUES ('319', '621000', '甘肃省', '庆阳市');
INSERT INTO `t_canton` VALUES ('320', '621100', '甘肃省', '定西市');
INSERT INTO `t_canton` VALUES ('321', '621200', '甘肃省', '陇南市');
INSERT INTO `t_canton` VALUES ('322', '622900', '甘肃省', '临夏回族自治州');
INSERT INTO `t_canton` VALUES ('323', '623000', '甘肃省', '甘南藏族自治州');
INSERT INTO `t_canton` VALUES ('324', '630000', '青海省', '青海省');
INSERT INTO `t_canton` VALUES ('325', '630100', '青海省', '西宁市');
INSERT INTO `t_canton` VALUES ('326', '630200', '青海省', '海东市');
INSERT INTO `t_canton` VALUES ('327', '632200', '青海省', '海北藏族自治州');
INSERT INTO `t_canton` VALUES ('328', '632300', '青海省', '黄南藏族自治州');
INSERT INTO `t_canton` VALUES ('329', '632500', '青海省', '海南藏族自治州');
INSERT INTO `t_canton` VALUES ('330', '632600', '青海省', '果洛藏族自治州');
INSERT INTO `t_canton` VALUES ('331', '632700', '青海省', '玉树藏族自治州');
INSERT INTO `t_canton` VALUES ('332', '632800', '青海省', '海西蒙古族藏族自治州');
INSERT INTO `t_canton` VALUES ('333', '640000', '宁夏回族自治区', '宁夏回族自治区');
INSERT INTO `t_canton` VALUES ('334', '640100', '宁夏回族自治区', '银川市');
INSERT INTO `t_canton` VALUES ('335', '640200', '宁夏回族自治区', '石嘴山市');
INSERT INTO `t_canton` VALUES ('336', '640300', '宁夏回族自治区', '吴忠市');
INSERT INTO `t_canton` VALUES ('337', '640400', '宁夏回族自治区', '固原市');
INSERT INTO `t_canton` VALUES ('338', '640500', '宁夏回族自治区', '中卫市');
INSERT INTO `t_canton` VALUES ('339', '650000', '新疆维吾尔自治区', '新疆维吾尔自治区');
INSERT INTO `t_canton` VALUES ('340', '650100', '新疆维吾尔自治区', '乌鲁木齐市');
INSERT INTO `t_canton` VALUES ('341', '650200', '新疆维吾尔自治区', '克拉玛依市');
INSERT INTO `t_canton` VALUES ('342', '650400', '新疆维吾尔自治区', '吐鲁番市');
INSERT INTO `t_canton` VALUES ('343', '652200', '新疆维吾尔自治区', '哈密地区');
INSERT INTO `t_canton` VALUES ('344', '652300', '新疆维吾尔自治区', '昌吉回族自治州');
INSERT INTO `t_canton` VALUES ('345', '652700', '新疆维吾尔自治区', '博尔塔拉蒙古自治州');
INSERT INTO `t_canton` VALUES ('346', '652800', '新疆维吾尔自治区', '巴音郭楞蒙古自治州');
INSERT INTO `t_canton` VALUES ('347', '652900', '新疆维吾尔自治区', '阿克苏地区');
INSERT INTO `t_canton` VALUES ('348', '653000', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州');
INSERT INTO `t_canton` VALUES ('349', '653100', '新疆维吾尔自治区', '喀什地区');
INSERT INTO `t_canton` VALUES ('350', '653200', '新疆维吾尔自治区', '和田地区');
INSERT INTO `t_canton` VALUES ('351', '654000', '新疆维吾尔自治区', '伊犁哈萨克自治州');
INSERT INTO `t_canton` VALUES ('352', '654200', '新疆维吾尔自治区', '塔城地区');
INSERT INTO `t_canton` VALUES ('353', '654300', '新疆维吾尔自治区', '阿勒泰地区');
INSERT INTO `t_canton` VALUES ('354', '710000', '台湾省', '台湾省');
INSERT INTO `t_canton` VALUES ('355', '810000', '香港特别行政区', '香港特别行政区');
INSERT INTO `t_canton` VALUES ('356', '820000', '澳门特别行政区', '澳门特别行政区');
INSERT INTO `t_canton` VALUES ('358', '139001', '河北省', '定州市');
INSERT INTO `t_canton` VALUES ('359', '139002', '河北省', '辛集市');
INSERT INTO `t_canton` VALUES ('360', '419001', '河南省', '济源市');
INSERT INTO `t_canton` VALUES ('362', '429004', '湖北省', '仙桃市');
INSERT INTO `t_canton` VALUES ('363', '429005', '湖北省', '潜江市');
INSERT INTO `t_canton` VALUES ('364', '429006', '湖北省', '天门市');
INSERT INTO `t_canton` VALUES ('365', '429021', '湖北省', '神农架林区');
INSERT INTO `t_canton` VALUES ('367', '469001', '海南省', '五指山市');
INSERT INTO `t_canton` VALUES ('368', '469002', '海南省', '琼海市');
INSERT INTO `t_canton` VALUES ('369', '460400', '海南省', '儋州市');
INSERT INTO `t_canton` VALUES ('370', '469005', '海南省', '文昌市');
INSERT INTO `t_canton` VALUES ('371', '469006', '海南省', '万宁市');
INSERT INTO `t_canton` VALUES ('372', '469007', '海南省', '东方市\r\n东方市\r\n东方市');
INSERT INTO `t_canton` VALUES ('373', '469021', '海南省', '定安县');
INSERT INTO `t_canton` VALUES ('374', '469022', '海南省', '屯昌县');
INSERT INTO `t_canton` VALUES ('375', '469023', '海南省', '澄迈县');
INSERT INTO `t_canton` VALUES ('376', '469024', '海南省', '临高县');
INSERT INTO `t_canton` VALUES ('377', '469025', '海南省', '白沙黎族自治县');
INSERT INTO `t_canton` VALUES ('378', '469026', '海南省', '昌江黎族自治县');
INSERT INTO `t_canton` VALUES ('379', '469027', '海南省', '乐东黎族自治县');
INSERT INTO `t_canton` VALUES ('380', '469028', '海南省', '陵水黎族自治县');
INSERT INTO `t_canton` VALUES ('381', '469029', '海南省', '保亭黎族苗族自治县\r\n保亭黎族苗族自治县\r\n保亭黎族苗族自治县');
INSERT INTO `t_canton` VALUES ('382', '469030', '海南省', '琼中黎族苗族自治县');
INSERT INTO `t_canton` VALUES ('384', '659001', '新疆维吾尔自治区', '石河子市');
INSERT INTO `t_canton` VALUES ('385', '659002', '新疆维吾尔自治区', '阿拉尔市');
INSERT INTO `t_canton` VALUES ('386', '659003', '新疆维吾尔自治区', '图木舒克市');
INSERT INTO `t_canton` VALUES ('387', '659004', '新疆维吾尔自治区', '五家渠市');
INSERT INTO `t_canton` VALUES ('388', '330000', '浙江省', '浙江省');
INSERT INTO `t_canton` VALUES ('389', '330100', '浙江省', '杭州市');
INSERT INTO `t_canton` VALUES ('390', '330200', '浙江省', '宁波市');
INSERT INTO `t_canton` VALUES ('391', '330300', '浙江省', '温州市');
INSERT INTO `t_canton` VALUES ('392', '330400', '浙江省', '嘉兴市');
INSERT INTO `t_canton` VALUES ('393', '330500', '浙江省', '湖州市');
INSERT INTO `t_canton` VALUES ('394', '330600', '浙江省', '绍兴市');
INSERT INTO `t_canton` VALUES ('395', '330700', '浙江省', '金华市');
INSERT INTO `t_canton` VALUES ('396', '330800', '浙江省', '衢州市');
INSERT INTO `t_canton` VALUES ('397', '330900', '浙江省', '舟山市');
INSERT INTO `t_canton` VALUES ('398', '331000', '浙江省', '台州市');
INSERT INTO `t_canton` VALUES ('399', '331100', '浙江省', '丽水市');

-- ----------------------------
-- Table structure for `t_lianjia_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_lianjia_data`;
CREATE TABLE `t_lianjia_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantonid` int(11) NOT NULL,
  `solding` int(11) unsigned zerofill DEFAULT NULL COMMENT '正在出售中的数量',
  `90days_sold` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '近90天成交数量',
  `yesterday_look` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '昨日代看数量',
  `yesterday_new_house` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `yesterday_new_consumer` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `renting` int(11) unsigned DEFAULT '0' COMMENT '当日出租房源总数',
  `agent` int(11) unsigned DEFAULT '0' COMMENT '经纪人(业务员)',
  `properties_sale` int(11) unsigned DEFAULT '0' COMMENT '新楼盘',
  `date` date DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lianjia_data
-- ----------------------------
INSERT INTO `t_lianjia_data` VALUES ('1', '110000', '00000085991', '00000009569', '00000002238', '0000000000', '0000000000', '40559', '24222', '0', '2017-06-20');
INSERT INTO `t_lianjia_data` VALUES ('2', '110000', '00000087211', '00000008388', '00000007237', '0000000000', '0000000000', '40410', '24591', '0', '2017-06-30');
INSERT INTO `t_lianjia_data` VALUES ('3', '110000', '00000087322', '00000008414', '00000020549', '0000000000', '0000000000', '39907', '24448', '0', '2017-07-03');
INSERT INTO `t_lianjia_data` VALUES ('4', '110000', '00000087474', '00000008433', '00000003302', '0000000000', '0000000000', '40456', '24714', '0', '2017-07-04');
INSERT INTO `t_lianjia_data` VALUES ('5', '110000', '00000087650', '00000008378', '00000004034', '0000000000', '0000000000', '40315', '24899', '0', '2017-07-05');
INSERT INTO `t_lianjia_data` VALUES ('6', '110000', '00000087701', '00000008347', '00000005077', '0000000000', '0000000000', '40269', '25035', '0', '2017-07-06');
INSERT INTO `t_lianjia_data` VALUES ('7', '110000', '00008780474', '00000008302', '00000007473', '0000000000', '0000000000', '39307', '25137', '0', '2017-07-07');
INSERT INTO `t_lianjia_data` VALUES ('8', '110000', '00000087903', '00000083027', '00000007473', '0000000000', '0000000000', '38892', '25137', '0', '2017-07-07');
INSERT INTO `t_lianjia_data` VALUES ('9', '110000', '00000087744', '00000008087', '00000007992', '0000000000', '0000000000', '38360', '25389', '0', '2017-07-08');
INSERT INTO `t_lianjia_data` VALUES ('10', '110000', '00000088061', '00000008017', '00000021011', '0000000000', '0000000000', '36428', '25382', '0', '2017-07-10');
INSERT INTO `t_lianjia_data` VALUES ('11', '110000', '00000088259', '00000008017', '00000021011', '0000000000', '0000000000', '36818', '25382', '0', '2017-07-10');
INSERT INTO `t_lianjia_data` VALUES ('12', '110000', '00000088117', '00000007978', '00000003113', '0000000000', '0000000000', '36697', '25470', '0', '2017-07-11');
INSERT INTO `t_lianjia_data` VALUES ('15', '110000', '00000088200', '00000007978', '00000003113', '0000000000', '0000000000', '36913', '25470', '0', '2017-07-11');
INSERT INTO `t_lianjia_data` VALUES ('17', '110000', '00000088154', '00000007934', '00000003796', '0000000000', '0000000000', '36933', '25555', '0', '2017-07-12');
INSERT INTO `t_lianjia_data` VALUES ('18', '110000', '00000088490', '00000007934', '00000003796', '0000000000', '0000000000', '36976', '25555', '0', '2017-07-12');
INSERT INTO `t_lianjia_data` VALUES ('34', '110000', '00000087729', '00000007909', '00000006072', '0000000000', '0000000000', '36456', '25642', '0', '2017-07-13');
INSERT INTO `t_lianjia_data` VALUES ('35', '110000', '00000087618', '00000007855', '00000007328', '0000000000', '0000000000', '35814', '25775', '0', '2017-07-14');
INSERT INTO `t_lianjia_data` VALUES ('36', '110000', '00000087488', '00000007566', '00000003225', '0000000000', '0000000000', '32155', '26115', '0', '2017-07-18');
INSERT INTO `t_lianjia_data` VALUES ('38', '110000', '00000087446', '00000007516', '00000003759', '0000000000', '0000000000', '32076', '26077', '0', '2017-07-19');
INSERT INTO `t_lianjia_data` VALUES ('41', '110000', '00000087820', '00000007472', '00000006201', '0000000000', '0000000000', '32355', '26048', '0', '2017-07-20');
INSERT INTO `t_lianjia_data` VALUES ('54', '110000', '00000088161', '00000007439', '00000007483', '0000000000', '0000000000', '33021', '26060', '0', '2017-07-21');
INSERT INTO `t_lianjia_data` VALUES ('58', '110000', '00000088195', '00000007262', '00000018786', '0000000000', '0000000000', '32890', '26114', '0', '2017-07-24');
INSERT INTO `t_lianjia_data` VALUES ('59', '110000', '00000088534', '00000007191', '00000003060', '0000000000', '0000000000', '33310', '26200', '0', '2017-07-25');
INSERT INTO `t_lianjia_data` VALUES ('60', '110000', '00000088728', '00000007106', '00000003407', '0000000000', '0000000000', '33845', '26191', '0', '2017-07-26');
INSERT INTO `t_lianjia_data` VALUES ('64', '110000', '00000088657', '00000007022', '00000005671', '0000000000', '0000000000', '34189', '26195', '0', '2017-07-27');
INSERT INTO `t_lianjia_data` VALUES ('71', '110000', '00000088675', '00000006887', '00000007354', '0000000000', '0000000000', '34104', '26218', '0', '2017-07-28');
INSERT INTO `t_lianjia_data` VALUES ('73', '110000', '00000088587', '00000006847', '00000007948', '0000000000', '0000000000', '33611', '26276', '0', '2017-07-29');
INSERT INTO `t_lianjia_data` VALUES ('75', '110000', '00000088492', '00000006948', '00000020581', '0000000000', '0000000000', '32800', '26267', '0', '2017-07-30');
INSERT INTO `t_lianjia_data` VALUES ('76', '110000', '00000088615', '00000007049', '00000018805', '0000000000', '0000000000', '32912', '26290', '0', '2017-07-31');
INSERT INTO `t_lianjia_data` VALUES ('78', '110000', '00000075046', '00000007016', '00000004074', '0000000000', '0000000000', '32985', '26256', '0', '2017-08-01');
INSERT INTO `t_lianjia_data` VALUES ('80', '110000', '00000075617', '00000006934', '00000003902', '0000000000', '0000000000', '33531', '26129', '0', '2017-08-02');
INSERT INTO `t_lianjia_data` VALUES ('82', '110000', '00000075878', '00000006883', '00000006292', '0000000000', '0000000000', '33737', '26092', '0', '2017-08-03');
INSERT INTO `t_lianjia_data` VALUES ('85', '110000', '00000075963', '00000006811', '00000007905', '0000000000', '0000000000', '33657', '25961', '0', '2017-08-04');
INSERT INTO `t_lianjia_data` VALUES ('86', '110000', '00000075871', '00000006618', '00000007870', '0000000000', '0000000000', '33238', '25944', '0', '2017-08-05');
INSERT INTO `t_lianjia_data` VALUES ('88', '110000', '00000076096', '00000006609', '00000022955', '0000000000', '0000000000', '32703', '25915', '0', '2017-08-07');
INSERT INTO `t_lianjia_data` VALUES ('90', '110000', '00000076025', '00000006571', '00000003655', '0000000000', '0000000000', '33078', '25940', '0', '2017-08-08');
INSERT INTO `t_lianjia_data` VALUES ('92', '110000', '00000076014', '00000006518', '00000003742', '0000000000', '0000000000', '33034', '25976', '0', '2017-08-09');
INSERT INTO `t_lianjia_data` VALUES ('97', '110000', '00000076132', '00000006500', '00000005756', '0000000000', '0000000000', '32995', '25975', '0', '2017-08-10');
INSERT INTO `t_lianjia_data` VALUES ('98', '110000', '00000076077', '00000006469', '00000009028', '0000000000', '0000000000', '32873', '25961', '0', '2017-08-11');
INSERT INTO `t_lianjia_data` VALUES ('100', '110000', '00000075916', '00000006302', '00000009461', '0000000000', '0000000000', '32131', '25925', '0', '2017-08-12');
INSERT INTO `t_lianjia_data` VALUES ('102', '110000', '00000075591', '00000006258', '00000023909', '0000000000', '0000000000', '31304', '25871', '0', '2017-08-13');
INSERT INTO `t_lianjia_data` VALUES ('106', '110000', '00000075366', '00000006261', '00000004583', '0000000000', '0000000000', '30571', '25856', '0', '2017-08-15');
INSERT INTO `t_lianjia_data` VALUES ('109', '110000', '00000075189', '00000006263', '00000004266', '0000000000', '0000000000', '30327', '25789', '0', '2017-08-16');
INSERT INTO `t_lianjia_data` VALUES ('110', '110000', '00000072897', '00000006233', '00000007327', '0000000000', '0000000000', '30069', '25697', '0', '2017-08-17');
INSERT INTO `t_lianjia_data` VALUES ('111', '110000', '00000073105', '00000006201', '00000008992', '0000000000', '0000000000', '30007', '25664', '0', '2017-08-18');
INSERT INTO `t_lianjia_data` VALUES ('113', '110000', '00000073123', '00000006053', '00000009493', '0000000000', '0000000000', '29466', '25623', '0', '2017-08-19');
INSERT INTO `t_lianjia_data` VALUES ('114', '110000', '00000073095', '00000006026', '00000023138', '0000000000', '0000000000', '29055', '25608', '0', '2017-08-20');
INSERT INTO `t_lianjia_data` VALUES ('115', '110000', '00000072775', '00000006090', '00000021574', '0000000000', '0000000000', '28350', '25591', '0', '2017-08-21');
INSERT INTO `t_lianjia_data` VALUES ('116', '110000', '00000072567', '00000006070', '00000004122', '0000000000', '0000000000', '28229', '25539', '0', '2017-08-22');
INSERT INTO `t_lianjia_data` VALUES ('118', '110000', '00000072524', '00000006030', '00000004470', '0000000000', '0000000000', '28401', '25473', '0', '2017-08-23');
INSERT INTO `t_lianjia_data` VALUES ('120', '110000', '00000072521', '00000005970', '00000007566', '0000000000', '0000000000', '28367', '25400', '0', '2017-08-24');
INSERT INTO `t_lianjia_data` VALUES ('122', '110000', '00000072428', '00000005883', '00000008769', '0000000000', '0000000000', '28158', '25360', '0', '2017-08-25');
INSERT INTO `t_lianjia_data` VALUES ('123', '110000', '00000072413', '00000005769', '00000009013', '0000000000', '0000000000', '27865', '25354', '0', '2017-08-26');
INSERT INTO `t_lianjia_data` VALUES ('125', '110000', '00000072353', '00000005850', '00000024859', '0000000000', '0000000000', '27334', '25308', '0', '2017-08-27');
INSERT INTO `t_lianjia_data` VALUES ('127', '110000', '00000072361', '00000005957', '00000023353', '0000000000', '0000000000', '27097', '25306', '0', '2017-08-28');
INSERT INTO `t_lianjia_data` VALUES ('133', '110000', '00000072411', '00000005960', '00000003703', '0000000000', '0000000000', '27301', '25293', '0', '2017-08-29');
INSERT INTO `t_lianjia_data` VALUES ('134', '110000', '00000072410', '00000005895', '00000003476', '0000000000', '0000000000', '27187', '25233', '0', '2017-08-30');
INSERT INTO `t_lianjia_data` VALUES ('135', '110000', '00000072482', '00000005941', '00000007395', '0000000000', '0000000000', '27185', '25137', '0', '2017-08-31');
INSERT INTO `t_lianjia_data` VALUES ('136', '110000', '00000072614', '00000005970', '00000008626', '0000000000', '0000000000', '26940', '24913', '0', '2017-09-01');
INSERT INTO `t_lianjia_data` VALUES ('137', '110000', '00000072786', '00000005880', '00000009308', '0000000000', '0000000000', '27165', '24794', '0', '2017-09-02');
INSERT INTO `t_lianjia_data` VALUES ('139', '110000', '00000072712', '00000005896', '00000025125', '0000000000', '0000000000', '26836', '24770', '0', '2017-09-03');
INSERT INTO `t_lianjia_data` VALUES ('140', '110000', '00000072651', '00000005962', '00000025850', '0000000000', '0000000000', '26639', '24783', '0', '2017-09-04');
INSERT INTO `t_lianjia_data` VALUES ('141', '110000', '00000072912', '00000005956', '00000005188', '0000000000', '0000000000', '27519', '24725', '0', '2017-09-05');
INSERT INTO `t_lianjia_data` VALUES ('143', '110000', '00000073146', '00000005938', '00000003984', '0000000000', '0000000000', '28103', '24605', '0', '2017-09-06');
INSERT INTO `t_lianjia_data` VALUES ('144', '110000', '00000073510', '00000005937', '00000007101', '0000000000', '0000000000', '28608', '24568', '0', '2017-09-07');
INSERT INTO `t_lianjia_data` VALUES ('145', '110000', '00000073635', '00000005916', '00000007632', '0000000000', '0000000000', '29755', '24573', '0', '2017-09-08');
INSERT INTO `t_lianjia_data` VALUES ('146', '110000', '00000074033', '00000005810', '00000010476', '0000000000', '0000000000', '30450', '24521', '0', '2017-09-09');
INSERT INTO `t_lianjia_data` VALUES ('147', '110000', '00000074193', '00000005831', '00000024122', '0000000000', '0000000000', '29979', '24500', '0', '2017-09-10');
INSERT INTO `t_lianjia_data` VALUES ('148', '110000', '00000074152', '00000005924', '00000024727', '0000000000', '0000000000', '29720', '24502', '0', '2017-09-11');
INSERT INTO `t_lianjia_data` VALUES ('149', '110000', '00000073859', '00000005927', '00000003582', '0000000000', '0000000000', '31034', '24575', '0', '2017-09-12');
INSERT INTO `t_lianjia_data` VALUES ('150', '110000', '00000074396', '00000005912', '00000004448', '0000000000', '0000000000', '31303', '24608', '0', '2017-09-13');
INSERT INTO `t_lianjia_data` VALUES ('151', '110000', '00000074770', '00000005918', '00000008006', '0000000000', '0000000000', '31330', '24563', '0', '2017-09-14');
INSERT INTO `t_lianjia_data` VALUES ('152', '110000', '00000075025', '00000005894', '00000009073', '0000000000', '0000000000', '31156', '24534', '0', '2017-09-15');
INSERT INTO `t_lianjia_data` VALUES ('153', '110000', '00000075231', '00000005831', '00000008499', '0000000000', '0000000000', '31295', '24533', '0', '2017-09-16');
INSERT INTO `t_lianjia_data` VALUES ('154', '110000', '00000075205', '00000005881', '00000025974', '0000000000', '0000000000', '30873', '24513', '0', '2017-09-17');
INSERT INTO `t_lianjia_data` VALUES ('155', '110000', '00000075248', '00000005953', '00000026772', '0000000000', '0000000000', '30763', '24504', '0', '2017-09-18');
INSERT INTO `t_lianjia_data` VALUES ('156', '110000', '00000075615', '00000005960', '00000005077', '0000000000', '0000000000', '31758', '24513', '0', '2017-09-19');
INSERT INTO `t_lianjia_data` VALUES ('157', '110000', '00000075644', '00000005970', '00000004125', '0000000000', '0000000000', '31987', '24501', '0', '2017-09-20');
INSERT INTO `t_lianjia_data` VALUES ('158', '110000', '00000075755', '00000005981', '00000003433', '0000000000', '0000000000', '32664', '24460', '0', '2017-09-21');
INSERT INTO `t_lianjia_data` VALUES ('159', '110000', '00000075634', '00000005989', '00000008617', '0000000000', '0000000000', '32529', '24418', '0', '2017-09-22');
INSERT INTO `t_lianjia_data` VALUES ('160', '110000', '00000075634', '00000005918', '00000010626', '0000000000', '0000000000', '32790', '24403', '0', '2017-09-23');
INSERT INTO `t_lianjia_data` VALUES ('161', '110000', '00000075744', '00000006076', '00000018465', '0000000000', '0000000000', '32579', '24371', '0', '2017-09-25');
INSERT INTO `t_lianjia_data` VALUES ('162', '110000', '00000075637', '00000006047', '00000002173', '0000000000', '0000000000', '32467', '24386', '0', '2017-09-26');
INSERT INTO `t_lianjia_data` VALUES ('163', '110000', '00000075551', '00000006054', '00000003909', '0000000000', '0000000000', '32732', '24358', '0', '2017-09-27');
INSERT INTO `t_lianjia_data` VALUES ('168', '110000', '00000075756', '00000006126', '00000009121', '0000000000', '0000000000', '32607', '24242', '0', '2017-09-29');
INSERT INTO `t_lianjia_data` VALUES ('169', '110000', '00000075839', '00000006139', '00000010118', '0000000000', '0000000000', '32733', '24181', '0', '2017-09-30');
INSERT INTO `t_lianjia_data` VALUES ('170', '110000', '00000075954', '00000006175', '00000008273', '0000000000', '0000000000', '32589', '24105', '0', '2017-10-01');
INSERT INTO `t_lianjia_data` VALUES ('171', '110000', '00000075965', '00000006149', '00000010916', '0000000000', '0000000000', '33008', '24082', '0', '2017-10-02');
INSERT INTO `t_lianjia_data` VALUES ('172', '110000', '00000076157', '00000006114', '00000005872', '0000000000', '0000000000', '33432', '24063', '0', '2017-10-03');
INSERT INTO `t_lianjia_data` VALUES ('173', '110000', '00000076158', '00000006067', '00000008383', '0000000000', '0000000000', '33398', '24042', '0', '2017-10-04');
INSERT INTO `t_lianjia_data` VALUES ('174', '110000', '00000076220', '00000006028', '00000006522', '0000000000', '0000000000', '33579', '24037', '0', '2017-10-05');
INSERT INTO `t_lianjia_data` VALUES ('175', '110000', '00000076401', '00000006000', '00000009674', '0000000000', '0000000000', '33772', '24034', '0', '2017-10-06');
INSERT INTO `t_lianjia_data` VALUES ('176', '110000', '00000076568', '00000005884', '00000014695', '0000000000', '0000000000', '34052', '24033', '0', '2017-10-07');
INSERT INTO `t_lianjia_data` VALUES ('178', '110000', '00000076912', '00000005794', '00000018288', '0000000000', '0000000000', '34460', '24029', '0', '2017-10-08');
INSERT INTO `t_lianjia_data` VALUES ('179', '110000', '00000076898', '00000005768', '00000020349', '0000000000', '0000000000', '34403', '24044', '0', '2017-10-09');
INSERT INTO `t_lianjia_data` VALUES ('181', '110000', '00000077000', '00000005804', '00000004895', '0000000000', '0000000000', '34723', '24018', '0', '2017-10-10');
INSERT INTO `t_lianjia_data` VALUES ('182', '110000', '00000076957', '00000005835', '00000004224', '0000000000', '0000000000', '34811', '23883', '0', '2017-10-11');
INSERT INTO `t_lianjia_data` VALUES ('183', '110000', '00000077065', '00000005854', '00000004652', '0000000000', '0000000000', '34783', '23765', '0', '2017-10-12');
INSERT INTO `t_lianjia_data` VALUES ('184', '110000', '00000077274', '00000005865', '00000007739', '0000000000', '0000000000', '34811', '23700', '0', '2017-10-13');
INSERT INTO `t_lianjia_data` VALUES ('185', '110000', '00000077360', '00000005773', '00000009786', '0000000000', '0000000000', '34706', '23663', '0', '2017-10-14');
INSERT INTO `t_lianjia_data` VALUES ('186', '110000', '00000077571', '00000005828', '00000022601', '0000000000', '0000000000', '34792', '23650', '0', '2017-10-15');
INSERT INTO `t_lianjia_data` VALUES ('187', '110000', '00000077637', '00000005947', '00000016733', '0000000000', '0000000000', '34729', '23637', '0', '2017-10-16');
INSERT INTO `t_lianjia_data` VALUES ('188', '110000', '00000077616', '00000005978', '00000001860', '0000000000', '0000000000', '34642', '23673', '0', '2017-10-17');
INSERT INTO `t_lianjia_data` VALUES ('190', '110000', '00000077636', '00000005972', '00000003641', '0000000000', '0000000000', '34681', '23716', '0', '2017-10-18');
INSERT INTO `t_lianjia_data` VALUES ('191', '110000', '00000077592', '00000005984', '00000005317', '0000000000', '0000000000', '34625', '23789', '0', '2017-10-19');
INSERT INTO `t_lianjia_data` VALUES ('192', '110000', '00000077660', '00000005994', '00000006266', '0000000000', '0000000000', '34693', '23733', '0', '2017-10-20');
INSERT INTO `t_lianjia_data` VALUES ('193', '110000', '00000077805', '00000005922', '00000006463', '0000000000', '0000000000', '34868', '23693', '0', '2017-10-21');
INSERT INTO `t_lianjia_data` VALUES ('194', '110000', '00000077881', '00000005922', '00000017258', '0000000000', '0000000000', '34925', '23672', '0', '2017-10-22');
INSERT INTO `t_lianjia_data` VALUES ('195', '110000', '00000077925', '00000006002', '00000017366', '0000000000', '0000000000', '35139', '23660', '0', '2017-10-23');
INSERT INTO `t_lianjia_data` VALUES ('196', '110000', '00000077890', '00000006004', '00000003417', '0000000000', '0000000000', '35126', '23668', '0', '2017-10-24');
INSERT INTO `t_lianjia_data` VALUES ('197', '110000', '00000077904', '00000005991', '00000003189', '0000000000', '0000000000', '35088', '23653', '0', '2017-10-25');
INSERT INTO `t_lianjia_data` VALUES ('198', '110000', '00000078033', '00000005992', '00000004872', '0000000000', '0000000000', '35028', '23600', '0', '2017-10-26');
INSERT INTO `t_lianjia_data` VALUES ('199', '110000', '00000078158', '00000005972', '00000005160', '0000000000', '0000000000', '34943', '23574', '0', '2017-10-27');
INSERT INTO `t_lianjia_data` VALUES ('200', '110000', '00000078331', '00000005878', '00000016365', '0000000000', '0000000000', '34902', '23490', '0', '2017-10-29');
INSERT INTO `t_lianjia_data` VALUES ('201', '110000', '00000078222', null, null, '0000000000', '0000000000', '34821', null, '0', '2017-10-28');
INSERT INTO `t_lianjia_data` VALUES ('202', '110000', '00000078365', '00000005945', '00000015308', '0000000000', '0000000000', '34905', '23467', '0', '2017-10-30');
INSERT INTO `t_lianjia_data` VALUES ('203', '110000', '00000078282', '00000005959', '00000003029', '0000000000', '0000000000', '34557', '23433', '0', '2017-10-31');
INSERT INTO `t_lianjia_data` VALUES ('204', '110000', '00000078074', '00000005973', '00000002717', '0000000000', '0000000000', '34453', '23148', '0', '2017-11-01');
INSERT INTO `t_lianjia_data` VALUES ('205', '110000', '00000078188', '00000006007', '00000004262', '0000000000', '0000000000', '35011', '25635', '0', '2017-11-02');
INSERT INTO `t_lianjia_data` VALUES ('206', '110000', '00000078302', '00000006016', '00000005597', '0000000000', '0000000000', '35049', '25483', '0', '2017-11-03');
INSERT INTO `t_lianjia_data` VALUES ('207', '110000', '00000078550', '00000005931', '00000006247', '0000000000', '0000000000', '35132', '25215', '0', '2017-11-04');
INSERT INTO `t_lianjia_data` VALUES ('209', '110000', '00000079193', '00000005958', '00000019395', '0000000000', '0000000000', '35835', '25133', '0', '2017-11-05');
INSERT INTO `t_lianjia_data` VALUES ('210', '110000', '00000079236', '00000006056', '00000018318', '0000000000', '0000000000', '35890', '25088', '0', '2017-11-06');
INSERT INTO `t_lianjia_data` VALUES ('212', '110000', '00000079168', '00000006059', '00000003850', '0000000000', '0000000000', '35735', '24897', '0', '2017-11-07');
INSERT INTO `t_lianjia_data` VALUES ('213', '110000', '00000079192', '00000006051', '00000003110', '0000000000', '0000000000', '35831', '24826', '0', '2017-11-08');
INSERT INTO `t_lianjia_data` VALUES ('215', '110000', '00000079381', '00000006055', '00000005532', '0000000000', '0000000000', '35805', '24606', '0', '2017-11-09');
INSERT INTO `t_lianjia_data` VALUES ('217', '110000', '00000079694', '00000006067', '00000005794', '0000000000', '0000000000', '35762', '24491', '0', '2017-11-10');
INSERT INTO `t_lianjia_data` VALUES ('218', '110000', '00000080008', '00000006001', '00000007133', '0000000000', '0000000000', '35744', '24275', '0', '2017-11-11');
INSERT INTO `t_lianjia_data` VALUES ('219', '110000', '00000080048', '00000006044', '00000019546', '0000000000', '0000000000', '35837', '23982', '0', '2017-11-12');
INSERT INTO `t_lianjia_data` VALUES ('221', '110000', '00000080069', '00000006109', '00000019836', '0000000000', '0000000000', '36040', '23825', '0', '2017-11-13');
INSERT INTO `t_lianjia_data` VALUES ('222', '110000', '00000079889', '00000006099', '00000003590', '0000000000', '0000000000', '36026', '23570', '0', '2017-11-14');
INSERT INTO `t_lianjia_data` VALUES ('223', '110000', '00000079611', '00000006086', '00000002822', '0000000000', '0000000000', '36112', '23386', '0', '2017-11-15');
INSERT INTO `t_lianjia_data` VALUES ('225', '110000', '00000079515', '00000006098', '00000005615', '0000000000', '0000000000', '36213', '23105', '0', '2017-11-16');
INSERT INTO `t_lianjia_data` VALUES ('228', '110000', '00000078627', '00000006105', '00000004357', '0000000000', '0000000000', '36120', '22888', '0', '2017-11-17');
INSERT INTO `t_lianjia_data` VALUES ('229', '110000', '00000078545', '00000006011', '00000005968', '0000000000', '0000000000', '36003', '22752', '0', '2017-11-18');
INSERT INTO `t_lianjia_data` VALUES ('230', '110000', '00000078575', '00000006004', '00000019807', '0000000000', '0000000000', '36266', '22745', '0', '2017-11-19');
INSERT INTO `t_lianjia_data` VALUES ('231', '110000', '00000078580', '00000006060', '00000019811', '0000000000', '0000000000', '36364', '22733', '0', '2017-11-20');
INSERT INTO `t_lianjia_data` VALUES ('233', '110000', '00000078266', '00000006059', '00000003567', '0000000000', '0000000000', '36495', '22689', '0', '2017-11-21');
INSERT INTO `t_lianjia_data` VALUES ('234', '110000', '00000077983', '00000006060', '00000002787', '0000000000', '0000000000', '36632', '22612', '0', '2017-11-22');
INSERT INTO `t_lianjia_data` VALUES ('235', '110000', '00000077886', '00000006058', '00000003354', '0000000000', '0000000000', '36714', '22522', '0', '2017-11-23');
INSERT INTO `t_lianjia_data` VALUES ('236', '110000', '00000077723', '00000006012', '00000003462', '0000000000', '0000000000', '36599', '22482', '0', '2017-11-24');
INSERT INTO `t_lianjia_data` VALUES ('237', '110000', '00000077864', '00000005919', '00000006945', '0000000000', '0000000000', '36635', '22462', '0', '2017-11-25');
INSERT INTO `t_lianjia_data` VALUES ('239', '110000', '00000077780', '00000005931', '00000020834', '0000000000', '0000000000', '36768', '22462', '0', '2017-11-26');
INSERT INTO `t_lianjia_data` VALUES ('240', '110000', '00000077743', '00000006000', '00000021567', '0000000000', '0000000000', '36636', '22450', '0', '2017-11-27');
INSERT INTO `t_lianjia_data` VALUES ('241', '110000', '00000077712', '00000005975', '00000003962', '0000000000', '0000000000', '36634', '22394', '0', '2017-11-28');
INSERT INTO `t_lianjia_data` VALUES ('243', '110000', '00000077733', '00000005951', '00000003180', '0000000000', '0000000000', '36660', '22376', '0', '2017-11-29');
INSERT INTO `t_lianjia_data` VALUES ('245', '110000', '00000077574', '00000005956', '00000004338', '0000000000', '0000000000', '36545', '22295', '0', '2017-11-30');
INSERT INTO `t_lianjia_data` VALUES ('247', '110000', '00000077360', '00000005993', '00000005790', '0000000000', '0000000000', '36554', '22129', '0', '2017-12-01');
INSERT INTO `t_lianjia_data` VALUES ('249', '110000', '00000077235', '00000005913', '00000007386', '0000000000', '0000000000', '36808', '22067', '0', '2017-12-02');
INSERT INTO `t_lianjia_data` VALUES ('250', '110000', '00000077328', '00000005954', '00000021577', '0000000000', '0000000000', '37055', '22050', '0', '2017-12-03');
INSERT INTO `t_lianjia_data` VALUES ('251', '110000', '00000077173', '00000006005', '00000021276', '0000000000', '0000000000', '37013', '22045', '0', '2017-12-04');
INSERT INTO `t_lianjia_data` VALUES ('253', '110000', '00000077082', '00000006002', '00000003719', '0000000000', '0000000000', '37182', '22090', '0', '2017-12-05');
INSERT INTO `t_lianjia_data` VALUES ('254', '110000', '00000077120', '00000005978', '00000003223', '0000000000', '0000000000', '37240', '22070', '0', '2017-12-06');
INSERT INTO `t_lianjia_data` VALUES ('255', '110000', '00000077103', '00000005960', '00000005273', '0000000000', '0000000000', '37307', '22034', '0', '2017-12-07');
INSERT INTO `t_lianjia_data` VALUES ('256', '110000', '00000076811', '00000005948', '00000006205', '0000000000', '0000000000', '37172', '21991', '0', '2017-12-08');
INSERT INTO `t_lianjia_data` VALUES ('257', '110000', '00000076212', '00000005840', '00000006309', '0000000000', '0000000000', '37185', '21904', '0', '2017-12-09');
INSERT INTO `t_lianjia_data` VALUES ('260', '110000', '00000076216', '00000005820', '00000019979', '0000000000', '0000000000', '37202', '21888', '0', '2017-12-10');
INSERT INTO `t_lianjia_data` VALUES ('261', '110000', '00000076117', '00000005881', '00000019880', '0000000000', '0000000000', '37125', '21865', '0', '2017-12-11');
INSERT INTO `t_lianjia_data` VALUES ('263', '110000', '00000075908', '00000005897', '00000003617', '0000000000', '0000000000', '37120', '21723', '0', '2017-12-12');
INSERT INTO `t_lianjia_data` VALUES ('265', '110000', '00000075708', '00000005889', '00000002840', '0000000000', '0000000000', '37159', '21568', '0', '2017-12-13');
INSERT INTO `t_lianjia_data` VALUES ('267', '110000', '00000075504', '00000005888', '00000004531', '0000000000', '0000000000', '37015', '21451', '0', '2017-12-14');
INSERT INTO `t_lianjia_data` VALUES ('268', '110000', '00000075469', '00000005857', '00000005476', '0000000000', '0000000000', '36901', '21343', '0', '2017-12-15');
INSERT INTO `t_lianjia_data` VALUES ('270', '110000', '00000075130', '00000005753', '00000004047', '0000000000', '0000000000', '36906', '21246', '0', '2017-12-16');
INSERT INTO `t_lianjia_data` VALUES ('275', '110000', '00000075166', '00000005772', '00000018681', '0000000000', '0000000000', '37013', '21236', '0', '2017-12-17');
INSERT INTO `t_lianjia_data` VALUES ('276', '110000', '00000074561', '00000005837', '00000018348', '0000000000', '0000000000', '36870', '21203', '0', '2017-12-18');
INSERT INTO `t_lianjia_data` VALUES ('277', '110000', '00000073994', '00000005844', '00000003570', '0000000000', '0000000000', '36900', '21135', '0', '2017-12-19');
INSERT INTO `t_lianjia_data` VALUES ('280', '110000', '00000073807', '00000005829', '00000003056', '0000000000', '0000000000', '37020', '21061', '0', '2017-12-20');
INSERT INTO `t_lianjia_data` VALUES ('284', '110000', '00000073684', '00000005824', '00000004229', '0000000000', '0000000000', '37211', '21004', '0', '2017-12-21');
INSERT INTO `t_lianjia_data` VALUES ('287', '110000', '00000073610', '00000005715', '00000006222', '0000000000', '0000000000', '37221', '20998', '0', '2017-12-23');
INSERT INTO `t_lianjia_data` VALUES ('288', '110000', '00000073616', '00000005726', '00000018463', '0000000000', '0000000000', '37262', '21000', '0', '2017-12-24');
INSERT INTO `t_lianjia_data` VALUES ('293', '110000', '00000073548', '00000005842', '00000016708', '0000000000', '0000000000', '37142', '20989', '0', '2017-12-25');
INSERT INTO `t_lianjia_data` VALUES ('295', '110000', '00000073399', '00000005839', '00000003604', '0000000000', '0000000000', '37166', '20953', '0', '2017-12-26');
INSERT INTO `t_lianjia_data` VALUES ('296', '110000', '00000073320', '00000005788', '00000003107', '0000000000', '0000000000', '37278', '20947', '0', '2017-12-27');
INSERT INTO `t_lianjia_data` VALUES ('297', '110000', '00000073219', '00000005782', '00000005063', '0000000000', '0000000000', '37101', '20928', '0', '2017-12-28');
INSERT INTO `t_lianjia_data` VALUES ('298', '110000', '00000073435', '00000005802', '00000003910', '0000000000', '0000000000', '37040', '20970', '0', '2017-12-29');
INSERT INTO `t_lianjia_data` VALUES ('299', '110000', '00000073355', '00000005839', '00000006286', '0000000000', '0000000000', '37008', '20929', '0', '2017-12-30');
INSERT INTO `t_lianjia_data` VALUES ('301', '110000', '00000073335', '00000005927', '00000015189', '0000000000', '0000000000', '36986', '20987', '0', '2017-12-31');
INSERT INTO `t_lianjia_data` VALUES ('302', '110000', '00000073210', '00000006002', '00000014270', '0000000000', '0000000000', '36950', '21034', '0', '2018-01-01');
INSERT INTO `t_lianjia_data` VALUES ('303', '110000', '00000073210', '00000006002', '00000014270', '0000000000', '0000000000', '37193', '21034', '0', '2018-01-01');
INSERT INTO `t_lianjia_data` VALUES ('304', '110000', '00000073152', '00000006005', '00000006723', '0000000000', '0000000000', '37190', '21042', '0', '2018-01-02');
INSERT INTO `t_lianjia_data` VALUES ('305', '110000', '00000073120', '00000006023', '00000002516', '0000000000', '0000000000', '37589', '21039', '0', '2018-01-03');
INSERT INTO `t_lianjia_data` VALUES ('306', '110000', '00000073226', '00000006045', '00000002583', '0000000000', '0000000000', '37603', '20878', '0', '2018-01-04');
INSERT INTO `t_lianjia_data` VALUES ('307', '110000', '00000073405', '00000006081', '00000002644', '0000000000', '0000000000', '37620', '20848', '0', '2018-01-05');
INSERT INTO `t_lianjia_data` VALUES ('308', '110000', '00000073464', '00000006121', '00000005342', '0000000000', '0000000000', '37649', '20838', '0', '2018-01-06');
INSERT INTO `t_lianjia_data` VALUES ('309', '110000', '00000073534', '00000006205', '00000018907', '0000000000', '0000000000', '37840', '20833', '0', '2018-01-07');
INSERT INTO `t_lianjia_data` VALUES ('310', '110000', '00000073510', '00000006258', '00000013379', '0000000000', '0000000000', '37629', '20831', '0', '2018-01-08');
INSERT INTO `t_lianjia_data` VALUES ('311', '110000', '00000073505', '00000006258', '00000013379', '0000000000', '0000000000', '37674', '20831', '0', '2018-01-09');
INSERT INTO `t_lianjia_data` VALUES ('312', '110000', '00000073533', '00000006258', '00000013379', '0000000000', '0000000000', '37804', '20780', '0', '2018-01-09');
INSERT INTO `t_lianjia_data` VALUES ('313', '110000', '00000073254', '00000006215', '00000002892', '0000000000', '0000000000', '37767', '20769', '0', '2018-01-10');
INSERT INTO `t_lianjia_data` VALUES ('314', '110000', '00000073389', '00000006216', '00000004316', '0000000000', '0000000000', '37714', '20690', '0', '2018-01-11');
INSERT INTO `t_lianjia_data` VALUES ('315', '110000', '00000073464', '00000006216', '00000005032', '0000000000', '0000000000', '37608', '20399', '0', '2018-01-12');
INSERT INTO `t_lianjia_data` VALUES ('316', '110000', '00000073464', '00000006216', '00000005032', '0000000000', '0000000000', '37608', '20399', '0', '2018-01-12');
INSERT INTO `t_lianjia_data` VALUES ('317', '110000', '00000073337', '00000006220', '00000019190', '0000000000', '0000000000', '37612', '20226', '0', '2018-01-15');
INSERT INTO `t_lianjia_data` VALUES ('318', '110000', '00000073185', '00000006262', '00000003149', '0000000000', '0000000000', '37674', '20066', '0', '2018-01-17');
INSERT INTO `t_lianjia_data` VALUES ('319', '110000', '00000073230', '00000006257', '00000004639', '0000000000', '0000000000', '37650', '20001', '0', '2018-01-18');
INSERT INTO `t_lianjia_data` VALUES ('320', '110000', '00000073320', '00000006267', '00000005033', '0000000000', '0000000000', '37594', '19951', '0', '2018-01-19');
INSERT INTO `t_lianjia_data` VALUES ('321', '110000', '00000073353', '00000006267', '00000005033', '0000000000', '0000000000', '37385', '19951', '0', '2018-01-19');
INSERT INTO `t_lianjia_data` VALUES ('322', '110000', '00000073337', '00000006234', '00000005029', '0000000000', '0000000000', '37367', '19918', '0', '2018-01-20');
INSERT INTO `t_lianjia_data` VALUES ('323', '110000', '00000073341', '00000006287', '00000018157', '0000000000', '0000000000', '37378', '19906', '0', '2018-01-21');
INSERT INTO `t_lianjia_data` VALUES ('324', '110000', '00000073306', '00000006407', '00000016642', '0000000000', '0000000000', '37398', '19896', '0', '2018-01-22');
INSERT INTO `t_lianjia_data` VALUES ('325', '110000', '00000073201', '00000006473', '00000003396', '0000000000', '0000000000', '37203', '19972', '0', '2018-01-23');
INSERT INTO `t_lianjia_data` VALUES ('326', '110000', '00000073075', '00000006498', '00000002677', '0000000000', '0000000000', '37324', '19919', '0', '2018-01-24');
INSERT INTO `t_lianjia_data` VALUES ('327', '110000', '00000073044', '00000006548', '00000003375', '0000000000', '0000000000', '37041', '19865', '0', '2018-01-25');
INSERT INTO `t_lianjia_data` VALUES ('328', '110000', '00000073038', '00000006548', '00000003375', '0000000000', '0000000000', '36981', '19865', '0', '2018-01-25');
INSERT INTO `t_lianjia_data` VALUES ('329', '110000', '00000072980', '00000006573', '00000001716', '0000000000', '0000000000', '36761', '19806', '0', '2018-01-26');
INSERT INTO `t_lianjia_data` VALUES ('330', '110000', '00000072947', '00000006545', '00000003104', '0000000000', '0000000000', '36765', '19747', '0', '2018-01-27');
INSERT INTO `t_lianjia_data` VALUES ('331', '110000', '00000072961', '00000006633', '00000010077', '0000000000', '0000000000', '36718', '19738', '0', '2018-01-28');
INSERT INTO `t_lianjia_data` VALUES ('332', '110000', '00000072970', '00000006633', '00000010077', '0000000000', '0000000000', '36697', '19738', '0', '2018-01-28');
INSERT INTO `t_lianjia_data` VALUES ('333', '110000', '00000072967', '00000006759', '00000011991', '0000000000', '0000000000', '36718', '19734', '0', '2018-01-29');
INSERT INTO `t_lianjia_data` VALUES ('334', '110000', '00000072802', '00000006815', '00000002714', '0000000000', '0000000000', '36549', '19660', '0', '2018-01-30');
INSERT INTO `t_lianjia_data` VALUES ('335', '110000', '00000072742', '00000006815', '00000002714', '0000000000', '0000000000', '36481', '19660', '0', '2018-01-30');
INSERT INTO `t_lianjia_data` VALUES ('336', '110000', '00000072616', '00000006847', '00000002504', '0000000000', '0000000000', '36416', '19612', '0', '2018-01-31');
INSERT INTO `t_lianjia_data` VALUES ('337', '110000', '00000072330', '00000006916', '00000002425', '0000000000', '0000000000', '36258', '19482', '0', '2018-02-01');
INSERT INTO `t_lianjia_data` VALUES ('338', '110000', '00000058962', '00000000000', '00000000000', '0000000000', '0000000000', '35118', '19550', '0', '2018-02-09');
INSERT INTO `t_lianjia_data` VALUES ('346', '110000', '00000058966', '00000000000', '00000000000', '0000000000', '0000000000', '35187', '19469', '0', '2018-02-10');
INSERT INTO `t_lianjia_data` VALUES ('347', '110000', '00000058894', '00000000000', '00000000000', '0000000000', '0000000000', '35301', '19440', '0', '2018-02-11');
INSERT INTO `t_lianjia_data` VALUES ('348', '110000', '00000058882', '00000000000', '00000000000', '0000000000', '0000000000', '35357', '19388', '0', '2018-02-12');
INSERT INTO `t_lianjia_data` VALUES ('349', '110000', '00000058809', '00000000000', '00000000000', '0000000000', '0000000000', '35357', '19360', '0', '2018-02-13');
INSERT INTO `t_lianjia_data` VALUES ('350', '110000', '00000058852', '00000000000', '00000000000', '0000000000', '0000000000', '35376', '19360', '0', '2018-02-14');
INSERT INTO `t_lianjia_data` VALUES ('351', '110000', '00000058784', '00000000000', '00000000000', '0000000000', '0000000000', '35340', '19361', '0', '2018-02-20');
INSERT INTO `t_lianjia_data` VALUES ('352', '110000', '00000058791', '00000000000', '00000000000', '0000000000', '0000000000', '35229', '19361', '0', '2018-02-22');
INSERT INTO `t_lianjia_data` VALUES ('356', '110000', '00000059887', '00000000000', '00000000000', '0000000000', '0000000000', '36716', '19300', '0', '2018-02-24');
INSERT INTO `t_lianjia_data` VALUES ('358', '110000', '00000061312', '00000000000', '00000000000', '0000000000', '0000000000', '37714', '19236', '0', '2018-02-25');
INSERT INTO `t_lianjia_data` VALUES ('360', '110000', '00000061957', '00000000000', '00000000000', '0000000000', '0000000000', '38015', '19236', '0', '2018-02-26');
INSERT INTO `t_lianjia_data` VALUES ('362', '110000', '00000062357', '00000000000', '00000000000', '0000000000', '0000000000', '37750', '19208', '0', '2018-02-27');
INSERT INTO `t_lianjia_data` VALUES ('364', '110000', '00000063134', '00000000000', '00000000000', '0000000000', '0000000000', '35886', '19150', '0', '2018-02-28');
INSERT INTO `t_lianjia_data` VALUES ('367', '110000', '00000063598', '00000000000', '00000000000', '0000000000', '0000000000', '36568', '18991', '0', '2018-03-01');
INSERT INTO `t_lianjia_data` VALUES ('370', '110000', '00000063991', '00000000000', '00000000000', '0000000000', '0000000000', '36745', '18862', '0', '2018-03-02');
INSERT INTO `t_lianjia_data` VALUES ('371', '110000', '00000064287', '00000000000', '00000000000', '0000000000', '0000000000', '35472', '18898', '0', '2018-03-03');
INSERT INTO `t_lianjia_data` VALUES ('373', '110000', '00000065685', '00000000000', '00000000000', '0000000000', '0000000000', '18560', '18915', '0', '2018-03-04');
INSERT INTO `t_lianjia_data` VALUES ('375', '110000', '00000066266', '00000000000', '00000000000', '0000000000', '0000000000', '38137', '18924', '0', '2018-03-05');
INSERT INTO `t_lianjia_data` VALUES ('377', '110000', '00000066518', '00000000000', '00000000000', '0000000000', '0000000000', '38383', '18885', '0', '2018-03-06');
INSERT INTO `t_lianjia_data` VALUES ('381', '110000', '00000067260', '00000000000', '00000000000', '0000000000', '0000000000', '38957', '18899', '0', '2018-03-07');
INSERT INTO `t_lianjia_data` VALUES ('383', '110000', '00000067690', '00000000000', '00000000000', '0000000000', '0000000000', '38977', '18844', '0', '2018-03-08');
INSERT INTO `t_lianjia_data` VALUES ('384', '110000', '00000068010', '00000000000', '00000000000', '0000000000', '0000000000', '39059', '18921', '0', '2018-03-08');
INSERT INTO `t_lianjia_data` VALUES ('385', '110000', '00000068327', '00000000000', '00000000000', '0000000000', '0000000000', '38797', '18921', '0', '2018-03-09');
INSERT INTO `t_lianjia_data` VALUES ('386', '110000', '00000068483', '00000000000', '00000000000', '0000000000', '0000000000', '38861', '18963', '0', '2018-03-10');
INSERT INTO `t_lianjia_data` VALUES ('387', '110000', '00000069403', '00000000000', '00000000000', '0000000000', '0000000000', '39317', '18969', '0', '2018-03-11');
INSERT INTO `t_lianjia_data` VALUES ('389', '110000', '00000070122', '00000000000', '00000000000', '0000000000', '0000000000', '39725', '18954', '0', '2018-03-12');
INSERT INTO `t_lianjia_data` VALUES ('393', '110000', '00000070342', '00000000000', '00000000000', '0000000000', '0000000000', '38486', '18837', '0', '2018-03-13');
INSERT INTO `t_lianjia_data` VALUES ('395', '110000', '00000070890', '00000000000', '00000000000', '0000000000', '0000000000', '39013', '18749', '0', '2018-03-14');
INSERT INTO `t_lianjia_data` VALUES ('397', '110000', '00000070802', '00000000000', '00000000000', '0000000000', '0000000000', '38858', '18602', '0', '2018-03-15');
INSERT INTO `t_lianjia_data` VALUES ('399', '110000', '00000071069', '00000000000', '00000000000', '0000000000', '0000000000', '38769', '18522', '0', '2018-03-16');
INSERT INTO `t_lianjia_data` VALUES ('400', '110000', '00000071119', '00000000000', '00000000000', '0000000000', '0000000000', '38711', '18450', '0', '2018-03-17');
INSERT INTO `t_lianjia_data` VALUES ('401', '110000', '00000071583', '00000000000', '00000000000', '0000000000', '0000000000', '38324', '18424', '0', '2018-03-18');
INSERT INTO `t_lianjia_data` VALUES ('404', '110000', '00000072070', '00000000000', '00000000000', '0000000000', '0000000000', '37691', '18412', '0', '2018-03-19');
INSERT INTO `t_lianjia_data` VALUES ('406', '110000', '00000072160', '00000000000', '00000000000', '0000000000', '0000000000', '37542', '18361', '0', '2018-03-20');
INSERT INTO `t_lianjia_data` VALUES ('409', '110000', '00000072492', '00000000000', '00000000000', '0000000000', '0000000000', '37443', '18289', '0', '2018-03-21');
INSERT INTO `t_lianjia_data` VALUES ('411', '110000', '00000072226', '00000000000', '00000000000', '0000000000', '0000000000', '37086', '18199', '0', '2018-03-22');
INSERT INTO `t_lianjia_data` VALUES ('413', '110000', '00000072081', '00000000000', '00000000000', '0000000000', '0000000000', '36771', '18114', '0', '2018-03-23');
INSERT INTO `t_lianjia_data` VALUES ('414', '110000', '00000072117', '00000000000', '00000000000', '0000000000', '0000000000', '36097', '18238', '0', '2018-03-24');
INSERT INTO `t_lianjia_data` VALUES ('416', '110000', '00000072647', '00000000000', '00000000000', '0000000000', '0000000000', '35459', '18229', '0', '2018-03-25');
INSERT INTO `t_lianjia_data` VALUES ('418', '110000', '00000072602', '00000000000', '00000000000', '0000000000', '0000000000', '35121', '18222', '0', '2018-03-26');
INSERT INTO `t_lianjia_data` VALUES ('420', '110000', '00000072756', '00000000000', '00000000000', '0000000000', '0000000000', '34967', '17871', '0', '2018-03-27');
INSERT INTO `t_lianjia_data` VALUES ('423', '110000', '00000072960', '00000000000', '00000000000', '0000000000', '0000000000', '34616', '17840', '0', '2018-03-28');
INSERT INTO `t_lianjia_data` VALUES ('426', '110000', '00000072943', '00000000000', '00000000000', '0000000000', '0000000000', '34215', '17788', '0', '2018-03-29');
INSERT INTO `t_lianjia_data` VALUES ('428', '110000', '00000073070', '00000000000', '00000000000', '0000000000', '0000000000', '33829', '17738', '0', '2018-03-30');
INSERT INTO `t_lianjia_data` VALUES ('429', '110000', '00000073171', '00000000000', '00000000000', '0000000000', '0000000000', '33375', '17837', '0', '2018-03-31');
INSERT INTO `t_lianjia_data` VALUES ('430', '110000', '00000073462', '00000000000', '00000000000', '0000000000', '0000000000', '32916', '17779', '0', '2018-04-01');
INSERT INTO `t_lianjia_data` VALUES ('431', '110000', '00000073631', '00000000000', '00000000000', '0000000000', '0000000000', '32992', '17748', '0', '2018-04-02');
INSERT INTO `t_lianjia_data` VALUES ('432', '110000', '00000073695', '00000000000', '00000000000', '0000000000', '0000000000', '32798', '17709', '0', '2018-04-03');
INSERT INTO `t_lianjia_data` VALUES ('433', '110000', '00000074002', '00000000000', '00000000000', '0000000000', '0000000000', '32521', '17658', '0', '2018-04-05');
INSERT INTO `t_lianjia_data` VALUES ('434', '110000', '00000074355', '00000000000', '00000000000', '0000000000', '0000000000', '32500', '17685', '0', '2018-04-06');
INSERT INTO `t_lianjia_data` VALUES ('435', '110000', '00000074566', '00000000000', '00000000000', '0000000000', '0000000000', '32363', '17693', '0', '2018-04-07');
INSERT INTO `t_lianjia_data` VALUES ('436', '110000', '00000074928', '00000000000', '00000000000', '0000000000', '0000000000', '32271', '17694', '0', '2018-04-08');
INSERT INTO `t_lianjia_data` VALUES ('437', '110000', '00000075158', '00000000000', '00000000000', '0000000000', '0000000000', '35090', '17649', '0', '2018-04-09');
INSERT INTO `t_lianjia_data` VALUES ('439', '110000', '00000075435', '00000000000', '00000000000', '0000000000', '0000000000', '35046', '17596', '0', '2018-04-10');
INSERT INTO `t_lianjia_data` VALUES ('440', '110000', '00000075461', '00000000000', '00000000000', '0000000000', '0000000000', '35301', '17556', '0', '2018-04-11');
INSERT INTO `t_lianjia_data` VALUES ('442', '110000', '00000075546', '00000000000', '00000000000', '0000000000', '0000000000', '35257', '17473', '0', '2018-04-12');
INSERT INTO `t_lianjia_data` VALUES ('443', '110000', '00000075341', '00000000000', '00000000000', '0000000000', '0000000000', '35192', '17429', '0', '2018-04-13');
INSERT INTO `t_lianjia_data` VALUES ('444', '110000', '00000075252', '00000000000', '00000000000', '0000000000', '0000000000', '34845', '17456', '0', '2018-04-14');
INSERT INTO `t_lianjia_data` VALUES ('445', '110000', '00000075148', '00000000000', '00000000000', '0000000000', '0000000000', '34801', '17501', '0', '2018-04-15');
INSERT INTO `t_lianjia_data` VALUES ('447', '110000', '00000075487', '00000000000', '00000000000', '0000000000', '0000000000', '34559', '17492', '0', '2018-04-16');
INSERT INTO `t_lianjia_data` VALUES ('448', '110000', '00000075509', '00000000000', '00000000000', '0000000000', '0000000000', '34518', '17441', '0', '2018-04-17');
INSERT INTO `t_lianjia_data` VALUES ('450', '110000', '00000075920', '00000000000', '00000000000', '0000000000', '0000000000', '34593', '17399', '0', '2018-04-18');
INSERT INTO `t_lianjia_data` VALUES ('451', '110000', '00000075969', '00000000000', '00000000000', '0000000000', '0000000000', '34732', '17364', '0', '2018-04-19');
INSERT INTO `t_lianjia_data` VALUES ('453', '110000', '00000075946', '00000000000', '00000000000', '0000000000', '0000000000', '34361', '17399', '0', '2018-04-20');
INSERT INTO `t_lianjia_data` VALUES ('454', '110000', '00000076350', '00000000000', '00000000000', '0000000000', '0000000000', '33722', '17399', '0', '2018-04-21');
INSERT INTO `t_lianjia_data` VALUES ('456', '110000', '00000076566', '00000000000', '00000000000', '0000000000', '0000000000', '33456', '17475', '0', '2018-04-22');
INSERT INTO `t_lianjia_data` VALUES ('457', '110000', '00000076694', '00000000000', '00000000000', '0000000000', '0000000000', '33399', '17470', '0', '2018-04-23');
INSERT INTO `t_lianjia_data` VALUES ('458', '110000', '00000076431', '00000000000', '00000000000', '0000000000', '0000000000', '33253', '17395', '0', '2018-04-24');
INSERT INTO `t_lianjia_data` VALUES ('461', '110000', '00000076524', '00000000000', '00000000000', '0000000000', '0000000000', '33132', '17381', '0', '2018-04-25');
INSERT INTO `t_lianjia_data` VALUES ('463', '110000', '00000076234', '00000000000', '00000000000', '0000000000', '0000000000', '32254', '17332', '0', '2018-04-26');
INSERT INTO `t_lianjia_data` VALUES ('464', '110000', '00000075541', '00000000000', '00000000000', '0000000000', '0000000000', '28182', '17358', '0', '2018-04-28');
INSERT INTO `t_lianjia_data` VALUES ('465', '110000', '00000075939', '00000000000', '00000000000', '0000000000', '0000000000', '27562', '17345', '0', '2018-04-29');
INSERT INTO `t_lianjia_data` VALUES ('466', '110000', '00000075904', '00000000000', '00000000000', '0000000000', '0000000000', '27211', '17350', '0', '2018-04-30');
INSERT INTO `t_lianjia_data` VALUES ('467', '110000', '00000076254', '00000000000', '00000000000', '0000000000', '0000000000', '26601', '17317', '0', '2018-05-01');
INSERT INTO `t_lianjia_data` VALUES ('468', '110000', '00000076111', '00000000000', '00000000000', '0000000000', '0000000000', '26337', '17292', '0', '2018-05-03');
INSERT INTO `t_lianjia_data` VALUES ('469', '110000', '00000076067', '00000000000', '00000000000', '0000000000', '0000000000', '26052', '17271', '0', '2018-05-04');
INSERT INTO `t_lianjia_data` VALUES ('470', '110000', '00000076054', '00000000000', '00000000000', '0000000000', '0000000000', '26006', '17237', '0', '2018-05-05');
INSERT INTO `t_lianjia_data` VALUES ('471', '110000', '00000076317', '00000000000', '00000000000', '0000000000', '0000000000', '25722', '17230', '0', '2018-05-06');
INSERT INTO `t_lianjia_data` VALUES ('473', '110000', '00000076116', '00000000000', '00000000000', '0000000000', '0000000000', '25518', '17226', '0', '2018-05-07');
INSERT INTO `t_lianjia_data` VALUES ('475', '110000', '00000075839', '00000000000', '00000000000', '0000000000', '0000000000', '25301', '17245', '0', '2018-05-08');
INSERT INTO `t_lianjia_data` VALUES ('476', '110000', '00000075838', '00000000000', '00000000000', '0000000000', '0000000000', '25283', '17265', '0', '2018-05-09');
INSERT INTO `t_lianjia_data` VALUES ('478', '110000', '00000075925', '00000000000', '00000000000', '0000000000', '0000000000', '25204', '17251', '0', '2018-05-10');
INSERT INTO `t_lianjia_data` VALUES ('480', '110000', '00000075682', '00000000000', '00000000000', '0000000000', '0000000000', '25054', '17262', '0', '2018-05-11');
INSERT INTO `t_lianjia_data` VALUES ('481', '110000', '00000075740', '00000000000', '00000000000', '0000000000', '0000000000', '26668', '17289', '0', '2018-05-12');
INSERT INTO `t_lianjia_data` VALUES ('482', '110000', '00000075770', '00000000000', '00000000000', '0000000000', '0000000000', '26288', '17274', '0', '2018-05-13');
INSERT INTO `t_lianjia_data` VALUES ('484', '110000', '00000075825', '00000000000', '00000000000', '0000000000', '0000000000', '25708', '17265', '0', '2018-05-14');
INSERT INTO `t_lianjia_data` VALUES ('485', '110000', '00000075724', '00000000000', '00000000000', '0000000000', '0000000000', '25483', '17219', '0', '2018-05-15');
INSERT INTO `t_lianjia_data` VALUES ('488', '110000', '00000076090', '00000000000', '00000000000', '0000000000', '0000000000', '25161', '17184', '0', '2018-05-16');
INSERT INTO `t_lianjia_data` VALUES ('490', '110000', '00000075974', '00000000000', '00000000000', '0000000000', '0000000000', '24951', '17136', '0', '2018-05-17');
INSERT INTO `t_lianjia_data` VALUES ('492', '110000', '00000075920', '00000000000', '00000000000', '0000000000', '0000000000', '24732', '17140', '0', '2018-05-18');
INSERT INTO `t_lianjia_data` VALUES ('493', '110000', '00000075715', '00000000000', '00000000000', '0000000000', '0000000000', '24551', '17181', '0', '2018-05-19');
INSERT INTO `t_lianjia_data` VALUES ('494', '110000', '00000075994', '00000000000', '00000000000', '0000000000', '0000000000', '24133', '17173', '0', '2018-05-20');
INSERT INTO `t_lianjia_data` VALUES ('497', '110000', '00000075592', '00000000000', '00000000000', '0000000000', '0000000000', '23999', '17169', '0', '2018-05-21');
INSERT INTO `t_lianjia_data` VALUES ('499', '110000', '00000075498', '00000000000', '00000000000', '0000000000', '0000000000', '23874', '17119', '0', '2018-05-22');
INSERT INTO `t_lianjia_data` VALUES ('502', '110000', '00000075633', '00000000000', '00000000000', '0000000000', '0000000000', '23742', '17114', '0', '2018-05-23');
INSERT INTO `t_lianjia_data` VALUES ('506', '110000', '00000075468', '00000000000', '00000000000', '0000000000', '0000000000', '23539', '17065', '0', '2018-05-24');
INSERT INTO `t_lianjia_data` VALUES ('509', '110000', '00000075515', '00000000000', '00000000000', '0000000000', '0000000000', '23364', '17059', '0', '2018-05-25');
INSERT INTO `t_lianjia_data` VALUES ('510', '110000', '00000075576', '00000000000', '00000000000', '0000000000', '0000000000', '23259', '17143', '0', '2018-05-26');
INSERT INTO `t_lianjia_data` VALUES ('511', '110000', '00000075662', '00000000000', '00000000000', '0000000000', '0000000000', '23044', '17154', '0', '2018-05-27');
INSERT INTO `t_lianjia_data` VALUES ('515', '110000', '00000075866', '00000000000', '00000000000', '0000000000', '0000000000', '22801', '17145', '0', '2018-05-28');
INSERT INTO `t_lianjia_data` VALUES ('516', '110000', '00000075877', '00000000000', '00000000000', '0000000000', '0000000000', '22686', '17117', '0', '2018-05-29');
INSERT INTO `t_lianjia_data` VALUES ('519', '110000', '00000075168', '00000000000', '00000000000', '0000000000', '0000000000', '23059', '17092', '0', '2018-05-30');
INSERT INTO `t_lianjia_data` VALUES ('521', '110000', '00000074628', '00000000000', '00000000000', '0000000000', '0000000000', '25214', '17050', '0', '2018-05-31');
INSERT INTO `t_lianjia_data` VALUES ('523', '110000', '00000074434', '00000000000', '00000000000', '0000000000', '0000000000', '25020', '17030', '0', '2018-06-01');
INSERT INTO `t_lianjia_data` VALUES ('525', '110000', '00000074153', '00000000000', '00000000000', '0000000000', '0000000000', '25023', '17017', '0', '2018-06-02');
INSERT INTO `t_lianjia_data` VALUES ('526', '110000', '00000074340', '00000000000', '00000000000', '0000000000', '0000000000', '24830', '17012', '0', '2018-06-03');
INSERT INTO `t_lianjia_data` VALUES ('527', '110000', '00000074355', '00000000000', '00000000000', '0000000000', '0000000000', '24738', '17004', '0', '2018-06-04');
INSERT INTO `t_lianjia_data` VALUES ('528', '110000', '00000074232', '00000000000', '00000000000', '0000000000', '0000000000', '24655', '16987', '0', '2018-06-05');
INSERT INTO `t_lianjia_data` VALUES ('530', '110000', '00000074340', '00000000000', '00000000000', '0000000000', '0000000000', '23703', '16964', '0', '2018-06-06');
INSERT INTO `t_lianjia_data` VALUES ('532', '110000', '00000074505', '00000000000', '00000000000', '0000000000', '0000000000', '24129', '17054', '0', '2018-06-07');
INSERT INTO `t_lianjia_data` VALUES ('535', '110000', '00000074487', '00000000000', '00000000000', '0000000000', '0000000000', '24092', '17140', '0', '2018-06-08');
INSERT INTO `t_lianjia_data` VALUES ('536', '110000', '00000074596', '00000000000', '00000000000', '0000000000', '0000000000', '24277', '17197', '0', '2018-06-09');
INSERT INTO `t_lianjia_data` VALUES ('537', '110000', '00000074585', '00000000000', '00000000000', '0000000000', '0000000000', '24095', '17197', '0', '2018-06-10');
INSERT INTO `t_lianjia_data` VALUES ('540', '110000', '00000074755', '00000000000', '00000000000', '0000000000', '0000000000', '23930', '17197', '0', '2018-06-11');
INSERT INTO `t_lianjia_data` VALUES ('543', '110000', '00000074503', '00000000000', '00000000000', '0000000000', '0000000000', '23866', '17202', '0', '2018-06-12');
INSERT INTO `t_lianjia_data` VALUES ('545', '110000', '00000074525', '00000000000', '00000000000', '0000000000', '0000000000', '24000', '17210', '0', '2018-06-13');
INSERT INTO `t_lianjia_data` VALUES ('546', '110000', '00000074309', '00000000000', '00000000000', '0000000000', '0000000000', '23877', '16922', '0', '2018-06-14');
INSERT INTO `t_lianjia_data` VALUES ('547', '110000', '00000073970', '00000000000', '00000000000', '0000000000', '0000000000', '23843', '16975', '0', '2018-06-15');
INSERT INTO `t_lianjia_data` VALUES ('551', '110000', '00000073887', '00000000000', '00000000000', '0000000000', '0000000000', '20540', '16955', '0', '2018-06-16');
INSERT INTO `t_lianjia_data` VALUES ('552', '110000', '00000074040', '00000000000', '00000000000', '0000000000', '0000000000', '20108', '16946', '0', '2018-06-17');
INSERT INTO `t_lianjia_data` VALUES ('553', '110000', '00000073832', '00000000000', '00000000000', '0000000000', '0000000000', '19737', '16942', '0', '2018-06-18');
INSERT INTO `t_lianjia_data` VALUES ('554', '110000', '00000073685', '00000000000', '00000000000', '0000000000', '0000000000', '19635', '16933', '0', '2018-06-19');
INSERT INTO `t_lianjia_data` VALUES ('557', '110000', '00000073724', '00000000000', '00000000000', '0000000000', '0000000000', '20357', '16913', '0', '2018-06-20');
INSERT INTO `t_lianjia_data` VALUES ('558', '110000', '00000073443', '00000000000', '00000000000', '0000000000', '0000000000', '20069', '16876', '0', '2018-06-21');
INSERT INTO `t_lianjia_data` VALUES ('561', '110000', '00000073311', '00000000000', '00000000000', '0000000000', '0000000000', '20012', '16824', '0', '2018-06-22');
INSERT INTO `t_lianjia_data` VALUES ('562', '110000', '00000073327', '00000000000', '00000000000', '0000000000', '0000000000', '19706', '16794', '0', '2018-06-23');
INSERT INTO `t_lianjia_data` VALUES ('563', '110000', '00000073413', '00000000000', '00000000000', '0000000000', '0000000000', '19450', '16787', '0', '2018-06-24');
INSERT INTO `t_lianjia_data` VALUES ('565', '110000', '00000073357', '00000000000', '00000000000', '0000000000', '0000000000', '19195', '16910', '0', '2018-06-25');
INSERT INTO `t_lianjia_data` VALUES ('566', '110000', '00000073250', '00000000000', '00000000000', '0000000000', '0000000000', '19085', '16936', '0', '2018-06-26');
INSERT INTO `t_lianjia_data` VALUES ('568', '110000', '00000073176', '00000000000', '00000000000', '0000000000', '0000000000', '18829', '16909', '0', '2018-06-27');
INSERT INTO `t_lianjia_data` VALUES ('572', '110000', '00000073095', '00000000000', '00000000000', '0000000000', '0000000000', '18742', '16884', '0', '2018-06-28');
INSERT INTO `t_lianjia_data` VALUES ('574', '110000', '00000072871', '00000000000', '00000000000', '0000000000', '0000000000', '18685', '17012', '0', '2018-06-29');
INSERT INTO `t_lianjia_data` VALUES ('577', '110000', '00000072813', '00000000000', '00000000000', '0000000000', '0000000000', '18227', '17013', '0', '2018-06-30');
INSERT INTO `t_lianjia_data` VALUES ('578', '110000', '00000072641', '00000000000', '00000000000', '0000000000', '0000000000', '18174', '16976', '0', '2018-07-01');
INSERT INTO `t_lianjia_data` VALUES ('581', '110000', '00000072806', '00000000000', '00000000000', '0000000000', '0000000000', '18236', '16976', '0', '2018-07-02');
INSERT INTO `t_lianjia_data` VALUES ('584', '110000', '00000072704', '00000000000', '00000000000', '0000000000', '0000000000', '18288', '16949', '0', '2018-07-03');
INSERT INTO `t_lianjia_data` VALUES ('587', '110000', '00000072843', '00000000000', '00000000000', '0000000000', '0000000000', '18343', '16861', '0', '2018-07-04');
INSERT INTO `t_lianjia_data` VALUES ('591', '110000', '00000072853', '00000000000', '00000000000', '0000000000', '0000000000', '18457', '16806', '21', '2018-07-05');
INSERT INTO `t_lianjia_data` VALUES ('599', '110000', '00000073525', '00000000000', '00000000000', '0000000000', '0000000000', '18859', '17130', '21', '2018-07-06');
INSERT INTO `t_lianjia_data` VALUES ('605', '110000', '00000073677', '00000000000', '00000000000', '0000000000', '0000000000', '18720', '17169', '21', '2018-07-07');
INSERT INTO `t_lianjia_data` VALUES ('607', '110000', '00000073828', '00000000000', '00000000000', '0000000000', '0000000000', '18668', '17151', '21', '2018-07-08');
INSERT INTO `t_lianjia_data` VALUES ('610', '110000', '00000073799', '00000000000', '00000000000', '0000000000', '0000000000', '18690', '17149', '21', '2018-07-09');
INSERT INTO `t_lianjia_data` VALUES ('613', '110000', '00000073621', '00000000000', '00000000000', '0000000000', '0000000000', '18416', '17114', '22', '2018-07-10');
INSERT INTO `t_lianjia_data` VALUES ('616', '110000', '00000073744', '00000000000', '00000000000', '0000000000', '0000000000', '18455', '17092', '23', '2018-07-11');
INSERT INTO `t_lianjia_data` VALUES ('619', '110000', '00000073705', '00000000000', '00000000000', '0000000000', '0000000000', '18513', '17039', '25', '2018-07-12');
INSERT INTO `t_lianjia_data` VALUES ('622', '110000', '00000073547', '00000000000', '00000000000', '0000000000', '0000000000', '18371', '17295', '26', '2018-07-13');
INSERT INTO `t_lianjia_data` VALUES ('625', '110000', '00000073689', '00000000000', '00000000000', '0000000000', '0000000000', '18332', '17308', '26', '2018-07-14');
INSERT INTO `t_lianjia_data` VALUES ('627', '110000', '00000073675', '00000000000', '00000000000', '0000000000', '0000000000', '18209', '17303', '26', '2018-07-15');
INSERT INTO `t_lianjia_data` VALUES ('630', '110000', '00000073363', '00000000000', '00000000000', '0000000000', '0000000000', '18120', '17297', '26', '2018-07-16');
INSERT INTO `t_lianjia_data` VALUES ('632', '110000', '00000073270', '00000000000', '00000000000', '0000000000', '0000000000', '17998', '17216', '30', '2018-07-17');
INSERT INTO `t_lianjia_data` VALUES ('635', '110000', '00000073220', '00000000000', '00000000000', '0000000000', '0000000000', '17975', '17216', '33', '2018-07-18');
INSERT INTO `t_lianjia_data` VALUES ('639', '110000', '00000073124', '00000000000', '00000000000', '0000000000', '0000000000', '18091', '17117', '35', '2018-07-19');
INSERT INTO `t_lianjia_data` VALUES ('642', '110000', '00000072924', '00000000000', '00000000000', '0000000000', '0000000000', '18146', '17277', '36', '2018-07-20');
INSERT INTO `t_lianjia_data` VALUES ('645', '110000', '00000072912', '00000000000', '00000000000', '0000000000', '0000000000', '18199', '17308', '37', '2018-07-21');
INSERT INTO `t_lianjia_data` VALUES ('648', '110000', '00000073006', '00000000000', '00000000000', '0000000000', '0000000000', '18217', '17292', '37', '2018-07-22');
INSERT INTO `t_lianjia_data` VALUES ('651', '110000', '00000072906', '00000000000', '00000000000', '0000000000', '0000000000', '18060', '17288', '37', '2018-07-23');
INSERT INTO `t_lianjia_data` VALUES ('654', '110000', '00000072818', '00000000000', '00000000000', '0000000000', '0000000000', '18013', '17277', '32', '2018-07-24');
INSERT INTO `t_lianjia_data` VALUES ('657', '110000', '00000073022', '00000000000', '00000000000', '0000000000', '0000000000', '18118', '17258', '33', '2018-07-25');
INSERT INTO `t_lianjia_data` VALUES ('660', '110000', '00000072814', '00000000000', '00000000000', '0000000000', '0000000000', '18259', '17193', '32', '2018-07-26');
INSERT INTO `t_lianjia_data` VALUES ('663', '110000', '00000072456', '00000000000', '00000000000', '0000000000', '0000000000', '18412', '17289', '31', '2018-07-27');
INSERT INTO `t_lianjia_data` VALUES ('666', '110000', '00000072482', '00000000000', '00000000000', '0000000000', '0000000000', '18378', '17295', '31', '2018-07-28');
INSERT INTO `t_lianjia_data` VALUES ('670', '110000', '00000072640', '00000000000', '00000000000', '0000000000', '0000000000', '18416', '17279', '31', '2018-07-29');
INSERT INTO `t_lianjia_data` VALUES ('673', '110000', '00000072414', '00000000000', '00000000000', '0000000000', '0000000000', '18385', '17264', '31', '2018-07-30');
INSERT INTO `t_lianjia_data` VALUES ('676', '110000', '00000072274', '00000000000', '00000000000', '0000000000', '0000000000', '18215', '17238', '20', '2018-07-31');
INSERT INTO `t_lianjia_data` VALUES ('678', '110000', '00000072441', '00000000000', '00000000000', '0000000000', '0000000000', '21170', '17096', '27', '2018-08-01');
INSERT INTO `t_lianjia_data` VALUES ('680', '110000', '00000072447', '00000000000', '00000000000', '0000000000', '0000000000', '21489', '16859', '28', '2018-08-02');
INSERT INTO `t_lianjia_data` VALUES ('683', '110000', '00000072527', '00000000000', '00000000000', '0000000000', '0000000000', '21821', '17087', '29', '2018-08-03');
INSERT INTO `t_lianjia_data` VALUES ('685', '110000', '00000072739', '00000000000', '00000000000', '0000000000', '0000000000', '21891', '17059', '29', '2018-08-04');
INSERT INTO `t_lianjia_data` VALUES ('691', '110000', '00000073066', '00000000000', '00000000000', '0000000000', '0000000000', '21873', '17032', '29', '2018-08-05');
INSERT INTO `t_lianjia_data` VALUES ('696', '110000', '00000072944', '00000000000', '00000000000', '0000000000', '0000000000', '21875', '17011', '29', '2018-08-06');
INSERT INTO `t_lianjia_data` VALUES ('699', '110000', '00000072749', '00000000000', '00000000000', '0000000000', '0000000000', '21931', '16959', '29', '2018-08-07');
INSERT INTO `t_lianjia_data` VALUES ('702', '110000', '00000072714', '00000000000', '00000000000', '0000000000', '0000000000', '22103', '16770', '30', '2018-08-08');
INSERT INTO `t_lianjia_data` VALUES ('706', '110000', '00000072685', '00000000000', '00000000000', '0000000000', '0000000000', '22256', '16879', '32', '2018-08-09');
INSERT INTO `t_lianjia_data` VALUES ('709', '110000', '00000072826', '00000000000', '00000000000', '0000000000', '0000000000', '22162', '16929', '32', '2018-08-10');
INSERT INTO `t_lianjia_data` VALUES ('710', '110000', '00000072907', '00000000000', '00000000000', '0000000000', '0000000000', '22172', '16922', '32', '2018-08-11');
INSERT INTO `t_lianjia_data` VALUES ('713', '110000', '00000072932', '00000000000', '00000000000', '0000000000', '0000000000', '22235', '16921', '32', '2018-08-12');
INSERT INTO `t_lianjia_data` VALUES ('716', '110000', '00000072675', '00000000000', '00000000000', '0000000000', '0000000000', '22246', '16897', '33', '2018-08-13');
INSERT INTO `t_lianjia_data` VALUES ('720', '110000', '00000072312', '00000000000', '00000000000', '0000000000', '0000000000', '22314', '16827', '34', '2018-08-14');
INSERT INTO `t_lianjia_data` VALUES ('723', '110000', '00000072337', '00000000000', '00000000000', '0000000000', '0000000000', '22631', '16822', '34', '2018-08-15');
INSERT INTO `t_lianjia_data` VALUES ('726', '110000', '00000072524', '00000000000', '00000000000', '0000000000', '0000000000', '22715', '16685', '35', '2018-08-16');
INSERT INTO `t_lianjia_data` VALUES ('730', '110000', '00000072463', '00000000000', '00000000000', '0000000000', '0000000000', '22784', '16691', '36', '2018-08-17');
INSERT INTO `t_lianjia_data` VALUES ('734', '110000', '00000072623', '00000000000', '00000000000', '0000000000', '0000000000', '22654', '16624', '36', '2018-08-18');
INSERT INTO `t_lianjia_data` VALUES ('736', '110000', '00000072804', '00000000000', '00000000000', '0000000000', '0000000000', '22498', '16615', '36', '2018-08-19');
INSERT INTO `t_lianjia_data` VALUES ('742', '110000', '00000072605', '00000000000', '00000000000', '0000000000', '0000000000', '22507', '16568', '37', '2018-08-20');
INSERT INTO `t_lianjia_data` VALUES ('745', '110000', '00000072657', '00000000000', '00000000000', '0000000000', '0000000000', '22589', '16539', '40', '2018-08-21');
INSERT INTO `t_lianjia_data` VALUES ('748', '110000', '00000072823', '00000000000', '00000000000', '0000000000', '0000000000', '22776', '16403', '40', '2018-08-22');
INSERT INTO `t_lianjia_data` VALUES ('753', '110000', '00000072646', '00000007032', '00000004244', '0000001095', '0000001914', '22899', '16373', '42', '2018-08-23');
INSERT INTO `t_lianjia_data` VALUES ('754', '110000', '00000072773', '00000007005', '00000004979', '0000000999', '0000002070', '23018', '16360', '41', '2018-08-24');
INSERT INTO `t_lianjia_data` VALUES ('757', '110000', '00000073031', '00000006964', '00000005369', '0000000984', '0000002155', '22906', '16345', '41', '2018-08-25');
INSERT INTO `t_lianjia_data` VALUES ('761', '110000', '00000073223', '00000006875', '00000015321', '0000001046', '0000003050', '22862', '16320', '41', '2018-08-26');
INSERT INTO `t_lianjia_data` VALUES ('764', '110000', '00000073149', '00000006809', '00000016554', '0000001169', '0000003410', '22876', '16305', '41', '2018-08-27');
INSERT INTO `t_lianjia_data` VALUES ('767', '110000', '00000073011', '00000006780', '00000002637', '0000000710', '0000001320', '22866', '16288', '41', '2018-08-28');
INSERT INTO `t_lianjia_data` VALUES ('770', '110000', '00000073015', '00000006780', '00000002637', '0000000710', '0000001320', '22595', '16257', '41', '2018-08-29');
INSERT INTO `t_lianjia_data` VALUES ('773', '110000', '00000073079', '00000000000', '00000000000', '0000000000', '0000000000', '22272', '16196', '42', '2018-08-30');
INSERT INTO `t_lianjia_data` VALUES ('774', '110000', '00000072990', '00000000000', '00000000000', '0000000000', '0000000000', '20546', '16189', '42', '2018-08-31');
INSERT INTO `t_lianjia_data` VALUES ('775', '110000', '00000073041', '00000000000', '00000000000', '0000000000', '0000000000', '20472', '16089', '36', '2018-09-01');
INSERT INTO `t_lianjia_data` VALUES ('776', '110000', '00000073096', '00000000000', '00000000000', '0000000000', '0000000000', '20577', '16075', '36', '2018-09-02');
INSERT INTO `t_lianjia_data` VALUES ('778', '110000', '00000073195', '00000000000', '00000000000', '0000000000', '0000000000', '20632', '16035', '36', '2018-09-03');
INSERT INTO `t_lianjia_data` VALUES ('780', '110000', '00000073257', '00000000000', '00000000000', '0000000000', '0000000000', '20580', '15999', '35', '2018-09-04');
INSERT INTO `t_lianjia_data` VALUES ('782', '110000', '00000073436', '00000000000', '00000000000', '0000000000', '0000000000', '20644', '15945', '35', '2018-09-05');
INSERT INTO `t_lianjia_data` VALUES ('784', '110000', '00000073587', '00000000000', '00000000000', '0000000000', '0000000000', '20612', '15890', '35', '2018-09-06');
INSERT INTO `t_lianjia_data` VALUES ('786', '110000', '00000073624', '00000000000', '00000000000', '0000000000', '0000000000', '20749', '15866', '36', '2018-09-07');
INSERT INTO `t_lianjia_data` VALUES ('787', '110000', '00000073786', '00000000000', '00000000000', '0000000000', '0000000000', '20804', '15837', '36', '2018-09-08');
INSERT INTO `t_lianjia_data` VALUES ('788', '110000', '00000073893', '00000000000', '00000000000', '0000000000', '0000000000', '20810', '15832', '36', '2018-09-09');
INSERT INTO `t_lianjia_data` VALUES ('790', '110000', '00000073900', '00000000000', '00000000000', '0000000000', '0000000000', '20825', '15823', '39', '2018-09-10');
INSERT INTO `t_lianjia_data` VALUES ('794', '110000', '00000073947', '00000000000', '00000000000', '0000000000', '0000000000', '20841', '15746', '39', '2018-09-11');
INSERT INTO `t_lianjia_data` VALUES ('797', '110000', '00000073688', '00000000000', '00000000000', '0000000000', '0000000000', '21009', '15746', '39', '2018-09-12');
INSERT INTO `t_lianjia_data` VALUES ('801', '110000', '00000073211', '00000000000', '00000000000', '0000000000', '0000000000', '21109', '15666', '39', '2018-09-13');
INSERT INTO `t_lianjia_data` VALUES ('803', '110000', '00000073138', '00000000000', '00000000000', '0000000000', '0000000000', '21095', '15631', '39', '2018-09-14');
INSERT INTO `t_lianjia_data` VALUES ('804', '110000', '00000073268', '00000000000', '00000000000', '0000000000', '0000000000', '21121', '15603', '40', '2018-09-15');
INSERT INTO `t_lianjia_data` VALUES ('806', '110000', '00000073366', '00000000000', '00000000000', '0000000000', '0000000000', '21171', '15595', '40', '2018-09-16');
INSERT INTO `t_lianjia_data` VALUES ('809', '110000', '00000073302', '00000000000', '00000000000', '0000000000', '0000000000', '21136', '15589', '40', '2018-09-17');
INSERT INTO `t_lianjia_data` VALUES ('811', '110000', '00000073121', '00000000000', '00000000000', '0000000000', '0000000000', '21123', '15547', '41', '2018-09-18');
INSERT INTO `t_lianjia_data` VALUES ('813', '110000', '00000072763', '00000000000', '00000000000', '0000000000', '0000000000', '21236', '15535', '42', '2018-09-19');
INSERT INTO `t_lianjia_data` VALUES ('815', '110000', '00000071973', '00000000000', '00000000000', '0000000000', '0000000000', '21313', '15483', '42', '2018-09-20');
INSERT INTO `t_lianjia_data` VALUES ('816', '110000', '00000071672', '00000000000', '00000000000', '0000000000', '0000000000', '21320', '15484', '42', '2018-09-21');
INSERT INTO `t_lianjia_data` VALUES ('817', '110000', '00000071344', '00000000000', '00000000000', '0000000000', '0000000000', '21428', '15468', '44', '2018-09-22');
INSERT INTO `t_lianjia_data` VALUES ('818', '110000', '00000071300', '00000000000', '00000000000', '0000000000', '0000000000', '21412', '15462', '44', '2018-09-23');
INSERT INTO `t_lianjia_data` VALUES ('820', '110000', '00000071068', '00000000000', '00000000000', '0000000000', '0000000000', '21413', '15452', '44', '2018-09-25');
INSERT INTO `t_lianjia_data` VALUES ('821', '110000', '00000070856', '00000000000', '00000000000', '0000000000', '0000000000', '21398', '15404', '45', '2018-09-26');
INSERT INTO `t_lianjia_data` VALUES ('823', '110000', '00000070620', '00000000000', '00000000000', '0000000000', '0000000000', '21545', '15359', '46', '2018-09-27');
INSERT INTO `t_lianjia_data` VALUES ('825', '110000', '00000069585', '00000000000', '00000000000', '0000000000', '0000000000', '21773', '15291', '46', '2018-09-28');
INSERT INTO `t_lianjia_data` VALUES ('827', '110000', '00000069087', '00000000000', '00000000000', '0000000000', '0000000000', '21821', '15219', '47', '2018-09-29');
INSERT INTO `t_lianjia_data` VALUES ('829', '110000', '00000068804', '00000000000', '00000000000', '0000000000', '0000000000', '21802', '15205', '48', '2018-09-30');
INSERT INTO `t_lianjia_data` VALUES ('830', '110000', '00000068604', '00000000000', '00000000000', '0000000000', '0000000000', '21860', '15049', '46', '2018-10-02');
INSERT INTO `t_lianjia_data` VALUES ('831', '110000', '00000068401', '00000000000', '00000000000', '0000000000', '0000000000', '21903', '15035', '46', '2018-10-03');
INSERT INTO `t_lianjia_data` VALUES ('833', '110000', '00000068607', '00000000000', '00000000000', '0000000000', '0000000000', '22185', '15035', '46', '2018-10-04');
INSERT INTO `t_lianjia_data` VALUES ('835', '110000', '00000068891', '00000000000', '00000000000', '0000000000', '0000000000', '22531', '15023', '46', '2018-10-05');
INSERT INTO `t_lianjia_data` VALUES ('839', '110000', '00000069015', '00000000000', '00000000000', '0000000000', '0000000000', '22558', '15024', '46', '2018-10-06');
INSERT INTO `t_lianjia_data` VALUES ('840', '110000', '00000069029', '00000000000', '00000000000', '0000000000', '0000000000', '23005', '15023', '46', '2018-10-07');
INSERT INTO `t_lianjia_data` VALUES ('841', '110000', '00000069224', '00000000000', '00000000000', '0000000000', '0000000000', '23133', '15019', '46', '2018-10-08');
INSERT INTO `t_lianjia_data` VALUES ('842', '110000', '00000069052', '00000000000', '00000000000', '0000000000', '0000000000', '23046', '15023', '46', '2018-10-09');
INSERT INTO `t_lianjia_data` VALUES ('844', '110000', '00000069170', '00000000000', '00000000000', '0000000000', '0000000000', '23275', '14891', '48', '2018-10-10');
INSERT INTO `t_lianjia_data` VALUES ('846', '110000', '00000069070', '00000000000', '00000000000', '0000000000', '0000000000', '23496', '14799', '49', '2018-10-11');
INSERT INTO `t_lianjia_data` VALUES ('848', '110000', '00000068976', '00000000000', '00000000000', '0000000000', '0000000000', '23751', '14819', '51', '2018-10-12');
INSERT INTO `t_lianjia_data` VALUES ('849', '110000', '00000068881', '00000000000', '00000000000', '0000000000', '0000000000', '23709', '14746', '53', '2018-10-13');
INSERT INTO `t_lianjia_data` VALUES ('850', '110000', '00000069196', '00000000000', '00000000000', '0000000000', '0000000000', '23956', '14765', '53', '2018-10-14');
INSERT INTO `t_lianjia_data` VALUES ('851', '110000', '00000069090', '00000000000', '00000000000', '0000000000', '0000000000', '23821', '14756', '53', '2018-10-15');
INSERT INTO `t_lianjia_data` VALUES ('852', '110000', '00000068774', '00000000000', '00000000000', '0000000000', '0000000000', '23871', '14728', '53', '2018-10-16');
INSERT INTO `t_lianjia_data` VALUES ('853', '110000', '00000068708', '00000000000', '00000000000', '0000000000', '0000000000', '26049', '14675', '54', '2018-10-17');
INSERT INTO `t_lianjia_data` VALUES ('855', '110000', '00000067934', '00000000000', '00000000000', '0000000000', '0000000000', '26469', '14435', '55', '2018-10-18');
INSERT INTO `t_lianjia_data` VALUES ('856', '110000', '00000067400', '00000000000', '00000000000', '0000000000', '0000000000', '26560', '13246', '55', '2018-10-19');
INSERT INTO `t_lianjia_data` VALUES ('857', '110000', '00000067129', '00000000000', '00000000000', '0000000000', '0000000000', '26675', '13226', '55', '2018-10-20');
INSERT INTO `t_lianjia_data` VALUES ('858', '110000', '00000067088', '00000000000', '00000000000', '0000000000', '0000000000', '26723', '13225', '55', '2018-10-21');
INSERT INTO `t_lianjia_data` VALUES ('860', '110000', '00000066860', '00000000000', '00000000000', '0000000000', '0000000000', '26778', '13221', '55', '2018-10-22');
INSERT INTO `t_lianjia_data` VALUES ('862', '110000', '00000066562', '00000000000', '00000000000', '0000000000', '0000000000', '26815', '13172', '55', '2018-10-23');
INSERT INTO `t_lianjia_data` VALUES ('865', '110000', '00000066429', '00000000000', '00000000000', '0000000000', '0000000000', '25340', '13150', '55', '2018-10-24');
INSERT INTO `t_lianjia_data` VALUES ('866', '110000', '00000066248', '00000000000', '00000000000', '0000000000', '0000000000', '25534', '13121', '55', '2018-10-25');
INSERT INTO `t_lianjia_data` VALUES ('867', '110000', '00000066066', '00000000000', '00000000000', '0000000000', '0000000000', '25811', '13092', '55', '2018-10-26');
INSERT INTO `t_lianjia_data` VALUES ('870', '110000', '00000064776', '00000000000', '00000000000', '0000000000', '0000000000', '25719', '13042', '59', '2018-10-30');
INSERT INTO `t_lianjia_data` VALUES ('871', '110000', '00000064613', '00000000000', '00000000000', '0000000000', '0000000000', '25701', '13019', '59', '2018-10-31');
INSERT INTO `t_lianjia_data` VALUES ('873', '110000', '00000063184', '00000000000', '00000000000', '0000000000', '0000000000', '25639', '12863', '50', '2018-11-01');
INSERT INTO `t_lianjia_data` VALUES ('875', '110000', '00000062935', '00000000000', '00000000000', '0000000000', '0000000000', '25995', '12876', '51', '2018-11-03');
INSERT INTO `t_lianjia_data` VALUES ('876', '110000', '00000062841', '00000000000', '00000000000', '0000000000', '0000000000', '25786', '12872', '51', '2018-11-04');
INSERT INTO `t_lianjia_data` VALUES ('877', '110000', '00000062524', '00000000000', '00000000000', '0000000000', '0000000000', '25780', '12866', '51', '2018-11-05');
INSERT INTO `t_lianjia_data` VALUES ('878', '110000', '00000061643', '00000000000', '00000000000', '0000000000', '0000000000', '25795', '12825', '50', '2018-11-06');
INSERT INTO `t_lianjia_data` VALUES ('879', '110000', '00000061553', '00000000000', '00000000000', '0000000000', '0000000000', '26336', '12797', '51', '2018-11-07');
INSERT INTO `t_lianjia_data` VALUES ('880', '110000', '00000061114', '00000000000', '00000000000', '0000000000', '0000000000', '26285', '12788', '52', '2018-11-08');
INSERT INTO `t_lianjia_data` VALUES ('881', '110000', '00000060201', '00000000000', '00000000000', '0000000000', '0000000000', '26072', '12807', '52', '2018-11-09');
INSERT INTO `t_lianjia_data` VALUES ('882', '110000', '00000059120', '00000000000', '00000000000', '0000000000', '0000000000', '26166', '12803', '53', '2018-11-12');
INSERT INTO `t_lianjia_data` VALUES ('885', '110000', '00000058532', '00000000000', '00000000000', '0000000000', '0000000000', '26138', '12761', '55', '2018-11-13');
INSERT INTO `t_lianjia_data` VALUES ('886', '110000', '00000058397', '00000000000', '00000000000', '0000000000', '0000000000', '26123', '12730', '57', '2018-11-14');
INSERT INTO `t_lianjia_data` VALUES ('887', '110000', '00000057956', '00000000000', '00000000000', '0000000000', '0000000000', '26019', '12685', '57', '2018-11-15');
INSERT INTO `t_lianjia_data` VALUES ('889', '110000', '00000057912', '00000000000', '00000000000', '0000000000', '0000000000', '25979', '12669', '59', '2018-11-16');
INSERT INTO `t_lianjia_data` VALUES ('891', '110000', '00000057721', '00000000000', '00000000000', '0000000000', '0000000000', '25872', '12657', '59', '2018-11-17');
INSERT INTO `t_lianjia_data` VALUES ('892', '110000', '00000057666', '00000000000', '00000000000', '0000000000', '0000000000', '25809', '12650', '59', '2018-11-18');
INSERT INTO `t_lianjia_data` VALUES ('893', '110000', '00000057643', '00000000000', '00000000000', '0000000000', '0000000000', '25733', '12643', '60', '2018-11-19');
INSERT INTO `t_lianjia_data` VALUES ('894', '110000', '00000057345', '00000000000', '00000000000', '0000000000', '0000000000', '25725', '12591', '59', '2018-11-20');
INSERT INTO `t_lianjia_data` VALUES ('895', '110000', '00000057129', '00000000000', '00000000000', '0000000000', '0000000000', '25596', '12587', '59', '2018-11-21');
INSERT INTO `t_lianjia_data` VALUES ('896', '110000', '00000056733', '00000000000', '00000000000', '0000000000', '0000000000', '25585', '12544', '59', '2018-11-22');
INSERT INTO `t_lianjia_data` VALUES ('897', '110000', '00000056524', '00000000000', '00000000000', '0000000000', '0000000000', '25687', '12671', '59', '2018-11-23');
INSERT INTO `t_lianjia_data` VALUES ('898', '110000', '00000056228', '00000000000', '00000000000', '0000000000', '0000000000', '25674', '12652', '59', '2018-11-25');
INSERT INTO `t_lianjia_data` VALUES ('899', '110000', '00000056000', '00000000000', '00000000000', '0000000000', '0000000000', '25618', '12642', '59', '2018-11-26');
INSERT INTO `t_lianjia_data` VALUES ('900', '110000', '00000055225', '00000000000', '00000000000', '0000000000', '0000000000', '25488', '12585', '61', '2018-11-27');
INSERT INTO `t_lianjia_data` VALUES ('901', '110000', '00000055180', '00000000000', '00000000000', '0000000000', '0000000000', '25319', '12484', '62', '2018-11-28');
INSERT INTO `t_lianjia_data` VALUES ('902', '110000', '00000054958', '00000000000', '00000000000', '0000000000', '0000000000', '25278', '12434', '62', '2018-11-29');
INSERT INTO `t_lianjia_data` VALUES ('903', '110000', '00000054751', '00000000000', '00000000000', '0000000000', '0000000000', '25298', '12471', '62', '2018-11-30');
INSERT INTO `t_lianjia_data` VALUES ('904', '110000', '00000054645', '00000000000', '00000000000', '0000000000', '0000000000', '25138', '12372', '53', '2018-12-01');
INSERT INTO `t_lianjia_data` VALUES ('905', '110000', '00000054521', '00000000000', '00000000000', '0000000000', '0000000000', '25360', '12343', '56', '2018-12-02');
INSERT INTO `t_lianjia_data` VALUES ('907', '110000', '00000054212', '00000000000', '00000000000', '0000000000', '0000000000', '25426', '12344', '61', '2018-12-03');
INSERT INTO `t_lianjia_data` VALUES ('908', '110000', '00000053872', '00000000000', '00000000000', '0000000000', '0000000000', '25335', '12319', '66', '2018-12-04');
INSERT INTO `t_lianjia_data` VALUES ('911', '110000', '00000053910', '00000000000', '00000000000', '0000000000', '0000000000', '25472', '12314', '69', '2018-12-05');
INSERT INTO `t_lianjia_data` VALUES ('913', '110000', '00000054218', '00000000000', '00000000000', '0000000000', '0000000000', '25670', '12309', '72', '2018-12-06');
INSERT INTO `t_lianjia_data` VALUES ('915', '110000', '00000054226', '00000000000', '00000000000', '0000000000', '0000000000', '25671', '12337', '71', '2018-12-07');
INSERT INTO `t_lianjia_data` VALUES ('916', '110000', '00000054275', '00000000000', '00000000000', '0000000000', '0000000000', '25622', '12337', '71', '2018-12-08');
INSERT INTO `t_lianjia_data` VALUES ('918', '110000', '00000054280', '00000000000', '00000000000', '0000000000', '0000000000', '25584', '12332', '71', '2018-12-09');
INSERT INTO `t_lianjia_data` VALUES ('919', '110000', '00000054207', '00000000000', '00000000000', '0000000000', '0000000000', '25585', '12327', '71', '2018-12-10');
INSERT INTO `t_lianjia_data` VALUES ('920', '110000', '00000053792', '00000000000', '00000000000', '0000000000', '0000000000', '25615', '12294', '88', '2018-12-11');
INSERT INTO `t_lianjia_data` VALUES ('921', '110000', '00000053782', '00000000000', '00000000000', '0000000000', '0000000000', '25699', '12275', '49', '2018-12-12');
INSERT INTO `t_lianjia_data` VALUES ('922', '110000', '00000053662', '00000000000', '00000000000', '0000000000', '0000000000', '25666', '12260', '49', '2018-12-13');
INSERT INTO `t_lianjia_data` VALUES ('923', '110000', '00000053455', '00000000000', '00000000000', '0000000000', '0000000000', '25658', '12321', '50', '2018-12-14');
INSERT INTO `t_lianjia_data` VALUES ('924', '110000', '00000053592', '00000000000', '00000000000', '0000000000', '0000000000', '25861', '12315', '51', '2018-12-15');
INSERT INTO `t_lianjia_data` VALUES ('926', '110000', '00000053544', '00000000000', '00000000000', '0000000000', '0000000000', '26069', '12304', '51', '2018-12-16');
INSERT INTO `t_lianjia_data` VALUES ('927', '110000', '00000053385', '00000000000', '00000000000', '0000000000', '0000000000', '26089', '12304', '51', '2018-12-17');
INSERT INTO `t_lianjia_data` VALUES ('928', '110000', '00000052676', '00000000000', '00000000000', '0000000000', '0000000000', '26000', '12251', '56', '2018-12-18');
INSERT INTO `t_lianjia_data` VALUES ('929', '110000', '00000052696', '00000000000', '00000000000', '0000000000', '0000000000', '26079', '12232', '56', '2018-12-19');
INSERT INTO `t_lianjia_data` VALUES ('931', '110000', '00000052553', '00000000000', '00000000000', '0000000000', '0000000000', '26190', '12217', '56', '2018-12-20');
INSERT INTO `t_lianjia_data` VALUES ('932', '110000', '00000052445', '00000000000', '00000000000', '0000000000', '0000000000', '26322', '12265', '56', '2018-12-21');
INSERT INTO `t_lianjia_data` VALUES ('933', '110000', '00000052444', '00000000000', '00000000000', '0000000000', '0000000000', '26463', '12286', '59', '2018-12-22');
INSERT INTO `t_lianjia_data` VALUES ('934', '110000', '00000052342', '00000000000', '00000000000', '0000000000', '0000000000', '26303', '12286', '59', '2018-12-23');
INSERT INTO `t_lianjia_data` VALUES ('935', '110000', '00000052153', '00000000000', '00000000000', '0000000000', '0000000000', '26161', '12278', '60', '2018-12-24');
INSERT INTO `t_lianjia_data` VALUES ('936', '110000', '00000051932', '00000000000', '00000000000', '0000000000', '0000000000', '26059', '12264', '59', '2018-12-25');
INSERT INTO `t_lianjia_data` VALUES ('937', '110000', '00000051920', '00000000000', '00000000000', '0000000000', '0000000000', '26153', '12253', '60', '2018-12-26');
INSERT INTO `t_lianjia_data` VALUES ('938', '110000', '00000051612', '00000000000', '00000000000', '0000000000', '0000000000', '26134', '12245', '61', '2018-12-27');
INSERT INTO `t_lianjia_data` VALUES ('940', '110000', '00000050968', '00000000000', '00000000000', '0000000000', '0000000000', '26155', '12336', '63', '2018-12-28');
INSERT INTO `t_lianjia_data` VALUES ('941', '110000', '00000050821', '00000000000', '00000000000', '0000000000', '0000000000', '26122', '12374', '63', '2018-12-29');
INSERT INTO `t_lianjia_data` VALUES ('942', '110000', '00000050963', '00000000000', '00000000000', '0000000000', '0000000000', '26090', '12377', '63', '2018-12-30');
INSERT INTO `t_lianjia_data` VALUES ('943', '110000', '00000050758', '00000000000', '00000000000', '0000000000', '0000000000', '25988', '12390', '51', '2018-12-31');
INSERT INTO `t_lianjia_data` VALUES ('944', '110000', '00000050607', '00000000000', '00000000000', '0000000000', '0000000000', '25936', '12352', '51', '2019-01-01');
INSERT INTO `t_lianjia_data` VALUES ('945', '110000', '00000050536', '00000000000', '00000000000', '0000000000', '0000000000', '26029', '12322', '51', '2019-01-02');
INSERT INTO `t_lianjia_data` VALUES ('946', '110000', '00000050595', '00000000000', '00000000000', '0000000000', '0000000000', '26136', '12322', '51', '2019-01-03');
INSERT INTO `t_lianjia_data` VALUES ('947', '110000', '00000050543', '00000000000', '00000000000', '0000000000', '0000000000', '26275', '12324', '51', '2019-01-04');
INSERT INTO `t_lianjia_data` VALUES ('948', '110000', '00000050443', '00000000000', '00000000000', '0000000000', '0000000000', '26411', '12316', '51', '2019-01-05');
INSERT INTO `t_lianjia_data` VALUES ('949', '110000', '00000050553', '00000000000', '00000000000', '0000000000', '0000000000', '26577', '12343', '51', '2019-01-06');
INSERT INTO `t_lianjia_data` VALUES ('951', '110000', '00000050374', '00000000000', '00000000000', '0000000000', '0000000000', '26512', '12336', '49', '2019-01-07');
INSERT INTO `t_lianjia_data` VALUES ('953', '110000', '00000050113', '00000000000', '00000000000', '0000000000', '0000000000', '26293', '12297', '47', '2019-01-08');
INSERT INTO `t_lianjia_data` VALUES ('955', '110000', '00000049962', '00000000000', '00000000000', '0000000000', '0000000000', '26376', '12276', '45', '2019-01-09');
INSERT INTO `t_lianjia_data` VALUES ('956', '110000', '00000049991', '00000000000', '00000000000', '0000000000', '0000000000', '26377', '12247', '45', '2019-01-10');
INSERT INTO `t_lianjia_data` VALUES ('957', '110000', '00000050312', '00000000000', '00000000000', '0000000000', '0000000000', '26550', '12259', '45', '2019-01-11');
INSERT INTO `t_lianjia_data` VALUES ('958', '110000', '00000050409', '00000000000', '00000000000', '0000000000', '0000000000', '26537', '12237', '45', '2019-01-12');
INSERT INTO `t_lianjia_data` VALUES ('959', '110000', '00000050118', '00000000000', '00000000000', '0000000000', '0000000000', '26339', '12184', '45', '2019-01-14');
INSERT INTO `t_lianjia_data` VALUES ('961', '110000', '00000049939', '00000000000', '00000000000', '0000000000', '0000000000', '26216', '12180', '48', '2019-01-15');
INSERT INTO `t_lianjia_data` VALUES ('962', '110000', '00000049817', '00000000000', '00000000000', '0000000000', '0000000000', '26201', '12162', '48', '2019-01-16');
INSERT INTO `t_lianjia_data` VALUES ('964', '110000', '00000049894', '00000000000', '00000000000', '0000000000', '0000000000', '26311', '12151', '48', '2019-01-17');
INSERT INTO `t_lianjia_data` VALUES ('970', '110000', '00000049870', '00000000000', '00000000000', '0000000000', '0000000000', '26263', '12202', '48', '2019-01-18');
INSERT INTO `t_lianjia_data` VALUES ('971', '110000', '00000049764', '00000000000', '00000000000', '0000000000', '0000000000', '26230', '12231', '48', '2019-01-20');
INSERT INTO `t_lianjia_data` VALUES ('973', '110000', '00000049549', '00000000000', '00000000000', '0000000000', '0000000000', '26059', '12216', '50', '2019-01-21');
INSERT INTO `t_lianjia_data` VALUES ('974', '110000', '00000049245', '00000000000', '00000000000', '0000000000', '0000000000', '26690', '12142', '52', '2019-01-23');
INSERT INTO `t_lianjia_data` VALUES ('976', '110000', '00000049213', '00000000000', '00000000000', '0000000000', '0000000000', '26616', '12118', '52', '2019-01-24');
INSERT INTO `t_lianjia_data` VALUES ('978', '110000', '00000049106', '00000000000', '00000000000', '0000000000', '0000000000', '26591', '12152', '53', '2019-01-25');
INSERT INTO `t_lianjia_data` VALUES ('980', '110000', '00000049101', '00000000000', '00000000000', '0000000000', '0000000000', '26581', '12172', '53', '2019-01-26');
INSERT INTO `t_lianjia_data` VALUES ('981', '110000', '00000049074', '00000000000', '00000000000', '0000000000', '0000000000', '26419', '12168', '53', '2019-01-27');
INSERT INTO `t_lianjia_data` VALUES ('982', '110000', '00000049056', '00000000000', '00000000000', '0000000000', '0000000000', '26310', '12166', '53', '2019-01-28');
INSERT INTO `t_lianjia_data` VALUES ('984', '110000', '00000049204', '00000000000', '00000000000', '0000000000', '0000000000', '26242', '12130', '54', '2019-01-29');
INSERT INTO `t_lianjia_data` VALUES ('987', '110000', '00000049174', '00000000000', '00000000000', '0000000000', '0000000000', '26197', '12130', '54', '2019-01-30');
INSERT INTO `t_lianjia_data` VALUES ('988', '110000', '00000048991', '00000000000', '00000000000', '0000000000', '0000000000', '25954', '12085', '43', '2019-02-01');
INSERT INTO `t_lianjia_data` VALUES ('989', '110000', '00000046157', '00000000000', '00000000000', '0000000000', '0000000000', '23765', '12060', '43', '2019-02-10');
INSERT INTO `t_lianjia_data` VALUES ('991', '110000', '00000048522', '00000000000', '00000000000', '0000000000', '0000000000', '25656', '12027', '46', '2019-02-12');
INSERT INTO `t_lianjia_data` VALUES ('992', '110000', '00000049097', '00000000000', '00000000000', '0000000000', '0000000000', '26253', '12030', '46', '2019-02-13');
INSERT INTO `t_lianjia_data` VALUES ('993', '110000', '00000049268', '00000000000', '00000000000', '0000000000', '0000000000', '26481', '11988', '46', '2019-02-14');
INSERT INTO `t_lianjia_data` VALUES ('995', '110000', '00000049920', '00000000000', '00000000000', '0000000000', '0000000000', '26938', '11916', '47', '2019-02-15');
INSERT INTO `t_lianjia_data` VALUES ('996', '110000', '00000050308', '00000000000', '00000000000', '0000000000', '0000000000', '27219', '11904', '47', '2019-02-16');
INSERT INTO `t_lianjia_data` VALUES ('998', '110000', '00000050545', '00000000000', '00000000000', '0000000000', '0000000000', '27345', '11889', '47', '2019-02-17');
INSERT INTO `t_lianjia_data` VALUES ('999', '110000', '00000050513', '00000000000', '00000000000', '0000000000', '0000000000', '27327', '11870', '47', '2019-02-18');
INSERT INTO `t_lianjia_data` VALUES ('1000', '110000', '00000050653', '00000000000', '00000000000', '0000000000', '0000000000', '27317', '11791', '47', '2019-02-19');
INSERT INTO `t_lianjia_data` VALUES ('1001', '110000', '00000050701', '00000000000', '00000000000', '0000000000', '0000000000', '27358', '11752', '47', '2019-02-20');
INSERT INTO `t_lianjia_data` VALUES ('1002', '110000', '00000050684', '00000000000', '00000000000', '0000000000', '0000000000', '27476', '11721', '48', '2019-02-21');
INSERT INTO `t_lianjia_data` VALUES ('1003', '110000', '00000051895', '00000000000', '00000000000', '0000000000', '0000000000', '27512', '11831', '49', '2019-02-22');
INSERT INTO `t_lianjia_data` VALUES ('1005', '110000', '00000051792', '00000000000', '00000000000', '0000000000', '0000000000', '27451', '11845', '49', '2019-02-23');
INSERT INTO `t_lianjia_data` VALUES ('1007', '110000', '00000052145', '00000000000', '00000000000', '0000000000', '0000000000', '27474', '11865', '49', '2019-02-24');
INSERT INTO `t_lianjia_data` VALUES ('1008', '110000', '00000052049', '00000000000', '00000000000', '0000000000', '0000000000', '27318', '11850', '50', '2019-02-26');
INSERT INTO `t_lianjia_data` VALUES ('1009', '110000', '00000051975', '00000000000', '00000000000', '0000000000', '0000000000', '27267', '11843', '50', '2019-02-27');
INSERT INTO `t_lianjia_data` VALUES ('1010', '110000', '00000052228', '00000000000', '00000000000', '0000000000', '0000000000', '26941', '11820', '52', '2019-02-28');
INSERT INTO `t_lianjia_data` VALUES ('1013', '110000', '00000052730', '00000000000', '00000000000', '0000000000', '0000000000', '26969', '12296', '39', '2019-03-01');
INSERT INTO `t_lianjia_data` VALUES ('1015', '110000', '00000053202', '00000000000', '00000000000', '0000000000', '0000000000', '27225', '12282', '40', '2019-03-02');
INSERT INTO `t_lianjia_data` VALUES ('1016', '110000', '00000053459', '00000000000', '00000000000', '0000000000', '0000000000', '27113', '12281', '40', '2019-03-03');
INSERT INTO `t_lianjia_data` VALUES ('1017', '110000', '00000053426', '00000000000', '00000000000', '0000000000', '0000000000', '27114', '12280', '41', '2019-03-04');
INSERT INTO `t_lianjia_data` VALUES ('1018', '110000', '00000053113', '00000000000', '00000000000', '0000000000', '0000000000', '26934', '12223', '40', '2019-03-05');
INSERT INTO `t_lianjia_data` VALUES ('1020', '110000', '00000052999', '00000000000', '00000000000', '0000000000', '0000000000', '26939', '12211', '40', '2019-03-06');
INSERT INTO `t_lianjia_data` VALUES ('1021', '110000', '00000053229', '00000000000', '00000000000', '0000000000', '0000000000', '26901', '12164', '40', '2019-03-07');
INSERT INTO `t_lianjia_data` VALUES ('1023', '110000', '00000053388', '00000000000', '00000000000', '0000000000', '0000000000', '26767', '12270', '44', '2019-03-08');
INSERT INTO `t_lianjia_data` VALUES ('1024', '110000', '00000053513', '00000000000', '00000000000', '0000000000', '0000000000', '26765', '12391', '44', '2019-03-09');
INSERT INTO `t_lianjia_data` VALUES ('1025', '110000', '00000053145', '00000000000', '00000000000', '0000000000', '0000000000', '26635', '12400', '44', '2019-03-10');
INSERT INTO `t_lianjia_data` VALUES ('1026', '110000', '00000053080', '00000000000', '00000000000', '0000000000', '0000000000', '26642', '12397', '44', '2019-03-11');
INSERT INTO `t_lianjia_data` VALUES ('1028', '110000', '00000051592', '00000000000', '00000000000', '0000000000', '0000000000', '26527', '12433', '45', '2019-03-12');
INSERT INTO `t_lianjia_data` VALUES ('1030', '110000', '00000051367', '00000000000', '00000000000', '0000000000', '0000000000', '26429', '12486', '46', '2019-03-13');
INSERT INTO `t_lianjia_data` VALUES ('1031', '110000', '00000051777', '00000000000', '00000000000', '0000000000', '0000000000', '26398', '12487', '46', '2019-03-14');
INSERT INTO `t_lianjia_data` VALUES ('1032', '110000', '00000051629', '00000000000', '00000000000', '0000000000', '0000000000', '26313', '12619', '47', '2019-03-15');
INSERT INTO `t_lianjia_data` VALUES ('1034', '110000', '00000052006', '00000000000', '00000000000', '0000000000', '0000000000', '26296', '12603', '47', '2019-03-16');
INSERT INTO `t_lianjia_data` VALUES ('1035', '110000', '00000051986', '00000000000', '00000000000', '0000000000', '0000000000', '26161', '12648', '47', '2019-03-17');
INSERT INTO `t_lianjia_data` VALUES ('1036', '110000', '00000052158', '00000000000', '00000000000', '0000000000', '0000000000', '25966', '12645', '48', '2019-03-18');
INSERT INTO `t_lianjia_data` VALUES ('1039', '110000', '00000052027', '00000000000', '00000000000', '0000000000', '0000000000', '25864', '12645', '48', '2019-03-19');
INSERT INTO `t_lianjia_data` VALUES ('1040', '110000', '00000051900', '00000000000', '00000000000', '0000000000', '0000000000', '25763', '12687', '49', '2019-03-20');
INSERT INTO `t_lianjia_data` VALUES ('1042', '110000', '00000052052', '00000000000', '00000000000', '0000000000', '0000000000', '25669', '12679', '52', '2019-03-21');
INSERT INTO `t_lianjia_data` VALUES ('1043', '110000', '00000052867', '00000000000', '00000000000', '0000000000', '0000000000', '25549', '12708', '53', '2019-03-22');
INSERT INTO `t_lianjia_data` VALUES ('1045', '110000', '00000052888', '00000000000', '00000000000', '0000000000', '0000000000', '25525', '12767', '53', '2019-03-23');
INSERT INTO `t_lianjia_data` VALUES ('1046', '110000', '00000053137', '00000000000', '00000000000', '0000000000', '0000000000', '25392', '12785', '53', '2019-03-24');
INSERT INTO `t_lianjia_data` VALUES ('1048', '110000', '00000053397', '00000000000', '00000000000', '0000000000', '0000000000', '25106', '12778', '52', '2019-03-25');
INSERT INTO `t_lianjia_data` VALUES ('1049', '110000', '00000053421', '00000000000', '00000000000', '0000000000', '0000000000', '25037', '12993', '52', '2019-03-26');
INSERT INTO `t_lianjia_data` VALUES ('1052', '110000', '00000053567', '00000000000', '00000000000', '0000000000', '0000000000', '24892', '13093', '52', '2019-03-27');
INSERT INTO `t_lianjia_data` VALUES ('1054', '110000', '00000054088', '00000000000', '00000000000', '0000000000', '0000000000', '24487', '13014', '53', '2019-03-30');
INSERT INTO `t_lianjia_data` VALUES ('1056', '110000', '00000053948', '00000000000', '00000000000', '0000000000', '0000000000', '24444', '13227', '35', '2019-04-01');
INSERT INTO `t_lianjia_data` VALUES ('1059', '110000', '00000054101', '00000000000', '00000000000', '0000000000', '0000000000', '24550', '13166', '35', '2019-04-03');
INSERT INTO `t_lianjia_data` VALUES ('1060', '110000', '00000053248', '00000000000', '00000000000', '0000000000', '0000000000', '24292', '13083', '35', '2019-04-04');
INSERT INTO `t_lianjia_data` VALUES ('1061', '110000', '00000053778', '00000000000', '00000000000', '0000000000', '0000000000', '24215', '13082', '36', '2019-04-10');
INSERT INTO `t_lianjia_data` VALUES ('1062', '110000', '00000054007', '00000000000', '00000000000', '0000000000', '0000000000', '24166', '13061', '36', '2019-04-11');
INSERT INTO `t_lianjia_data` VALUES ('1064', '110000', '00000054239', '00000000000', '00000000000', '0000000000', '0000000000', '24064', '13039', '40', '2019-04-12');
INSERT INTO `t_lianjia_data` VALUES ('1065', '110000', '00000054553', '00000000000', '00000000000', '0000000000', '0000000000', '24036', '13175', '41', '2019-04-13');
INSERT INTO `t_lianjia_data` VALUES ('1067', '110000', '00000054541', '00000000000', '00000000000', '0000000000', '0000000000', '23774', '13160', '41', '2019-04-15');
INSERT INTO `t_lianjia_data` VALUES ('1068', '110000', '00000054484', '00000000000', '00000000000', '0000000000', '0000000000', '23742', '13152', '41', '2019-04-16');
INSERT INTO `t_lianjia_data` VALUES ('1069', '110000', '00000054402', '00000000000', '00000000000', '0000000000', '0000000000', '23683', '13138', '44', '2019-04-17');
INSERT INTO `t_lianjia_data` VALUES ('1072', '110000', '00000056093', '00000000000', '00000000000', '0000000000', '0000000000', '26047', '13123', '45', '2019-04-18');
INSERT INTO `t_lianjia_data` VALUES ('1074', '110000', '00000059412', '00000000000', '00000000000', '0000000000', '0000000000', '25953', '13258', '45', '2019-04-19');
INSERT INTO `t_lianjia_data` VALUES ('1077', '110000', '00000060255', '00000000000', '00000000000', '0000000000', '0000000000', '25735', '13250', '45', '2019-04-20');
INSERT INTO `t_lianjia_data` VALUES ('1079', '110000', '00000060742', '00000000000', '00000000000', '0000000000', '0000000000', '25571', '13241', '45', '2019-04-21');
INSERT INTO `t_lianjia_data` VALUES ('1084', '110000', '00000062415', '00000000000', '00000000000', '0000000000', '0000000000', '25218', '13227', '50', '2019-04-22');
INSERT INTO `t_lianjia_data` VALUES ('1087', '110000', '00000062838', '00000000000', '00000000000', '0000000000', '0000000000', '25168', '13265', '51', '2019-04-23');
INSERT INTO `t_lianjia_data` VALUES ('1088', '110000', '00000062558', '00000000000', '00000000000', '0000000000', '0000000000', '25106', '13250', '52', '2019-04-24');
INSERT INTO `t_lianjia_data` VALUES ('1090', '110000', '00000064902', '00000000000', '00000000000', '0000000000', '0000000000', '25023', '13235', '53', '2019-04-25');
INSERT INTO `t_lianjia_data` VALUES ('1091', '110000', '00000069884', '00000000000', '00000000000', '0000000000', '0000000000', '24617', '13301', '52', '2019-04-27');
INSERT INTO `t_lianjia_data` VALUES ('1093', '110000', '00000070315', '00000000000', '00000000000', '0000000000', '0000000000', '24452', '13294', '53', '2019-04-28');
INSERT INTO `t_lianjia_data` VALUES ('1095', '110000', '00000072982', '00000000000', '00000000000', '0000000000', '0000000000', '24299', '13278', '53', '2019-04-29');
INSERT INTO `t_lianjia_data` VALUES ('1096', '110000', '00000076185', '00000000000', '00000000000', '0000000000', '0000000000', '24116', '13295', '49', '2019-05-05');
INSERT INTO `t_lianjia_data` VALUES ('1099', '110000', '00000076352', '00000000000', '00000000000', '0000000000', '0000000000', '24170', '13277', '49', '2019-05-06');
INSERT INTO `t_lianjia_data` VALUES ('1101', '110000', '00000076205', '00000000000', '00000000000', '0000000000', '0000000000', '24190', '13263', '49', '2019-05-07');
INSERT INTO `t_lianjia_data` VALUES ('1102', '110000', '00000076301', '00000000000', '00000000000', '0000000000', '0000000000', '24261', '13247', '49', '2019-05-09');
INSERT INTO `t_lianjia_data` VALUES ('1103', '110000', '00000076121', '00000000000', '00000000000', '0000000000', '0000000000', '24123', '13368', '49', '2019-05-10');
INSERT INTO `t_lianjia_data` VALUES ('1105', '110000', '00000076288', '00000000000', '00000000000', '0000000000', '0000000000', '23797', '13331', '49', '2019-05-11');
INSERT INTO `t_lianjia_data` VALUES ('1106', '110000', '00000076123', '00000000000', '00000000000', '0000000000', '0000000000', '23765', '13327', '49', '2019-05-12');
INSERT INTO `t_lianjia_data` VALUES ('1108', '110000', '00000076132', '00000000000', '00000000000', '0000000000', '0000000000', '23521', '13321', '49', '2019-05-13');
INSERT INTO `t_lianjia_data` VALUES ('1109', '110000', '00000075936', '00000000000', '00000000000', '0000000000', '0000000000', '23337', '13305', '52', '2019-05-15');
INSERT INTO `t_lianjia_data` VALUES ('1112', '110000', '00000075975', '00000000000', '00000000000', '0000000000', '0000000000', '23076', '13416', '52', '2019-05-16');
INSERT INTO `t_lianjia_data` VALUES ('1113', '110000', '00000075750', '00000000000', '00000000000', '0000000000', '0000000000', '22783', '13392', '51', '2019-05-18');
INSERT INTO `t_lianjia_data` VALUES ('1114', '110000', '00000075729', '00000000000', '00000000000', '0000000000', '0000000000', '22328', '13381', '53', '2019-05-20');
INSERT INTO `t_lianjia_data` VALUES ('1115', '110000', '00000075494', '00000000000', '00000000000', '0000000000', '0000000000', '22334', '13368', '53', '2019-05-21');
INSERT INTO `t_lianjia_data` VALUES ('1118', '110000', '00000075700', '00000000000', '00000000000', '0000000000', '0000000000', '22240', '13404', '55', '2019-05-22');
INSERT INTO `t_lianjia_data` VALUES ('1119', '110000', '00000075519', '00000000000', '00000000000', '0000000000', '0000000000', '22171', '13402', '56', '2019-05-23');
INSERT INTO `t_lianjia_data` VALUES ('1120', '110000', '00000075550', '00000000000', '00000000000', '0000000000', '0000000000', '22022', '13629', '56', '2019-05-24');
INSERT INTO `t_lianjia_data` VALUES ('1122', '110000', '00000075762', '00000000000', '00000000000', '0000000000', '0000000000', '21728', '13708', '56', '2019-05-25');
INSERT INTO `t_lianjia_data` VALUES ('1123', '110000', '00000075721', '00000000000', '00000000000', '0000000000', '0000000000', '21159', '13801', '56', '2019-05-27');
INSERT INTO `t_lianjia_data` VALUES ('1124', '110000', '00000075917', '00000000000', '00000000000', '0000000000', '0000000000', '20931', '13925', '53', '2019-05-30');
INSERT INTO `t_lianjia_data` VALUES ('1125', '110000', '00000075783', '00000000000', '00000000000', '0000000000', '0000000000', '20759', '14037', '53', '2019-05-31');
INSERT INTO `t_lianjia_data` VALUES ('1126', '110000', '00000075870', '00000000000', '00000000000', '0000000000', '0000000000', '21120', '13965', '53', '2019-06-01');

-- ----------------------------
-- Table structure for `t_lianjia_housingestate`
-- ----------------------------
DROP TABLE IF EXISTS `t_lianjia_housingestate`;
CREATE TABLE `t_lianjia_housingestate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `solding` varchar(50) DEFAULT NULL,
  `buy_90` varchar(50) DEFAULT NULL,
  `look_30` varchar(50) DEFAULT NULL,
  `day` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1057 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lianjia_housingestate
-- ----------------------------
INSERT INTO `t_lianjia_housingestate` VALUES ('1', '润渡佳苑', '2637416248', ' 16 ', '2', '48', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('2', '花木苑', '79757334154', ' 33 ', '4', '154', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('3', '中远两湾城', '71989123171182', ' 122 ', '17', '1182', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('4', '浦发绿城', '51665743270', ' 74 ', '3', '270', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('5', '明天华城', '5178023390', ' 23 ', '3', '90', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('6', '金地自在城4', '37397313111', ' 31 ', '3', '111', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('7', '上海康城', '3795511516760', ' 115 ', '16', '760', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('8', '富友嘉园', '391593310256', ' 33 ', '10', '256', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('9', '金色西郊城', '4093231363', ' 31 ', '3', '63', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('10', '朗庭上郡苑(公寓)', '4292821143', ' 21 ', '1', '43', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('11', '华沁家园', '61313254111', ' 25 ', '4', '111', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('12', '世茂滨江花园', '961371018588', ' 101 ', '8', '588', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('13', '名都城(公寓)', '65093364261', ' 36 ', '4', '261', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('14', '玉兰香苑', '51134304212', ' 30 ', '4', '212', '2017-12-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('15', '润渡佳苑', '2637416248', ' 16 ', '2', '48', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('16', '花木苑', '79757334158', ' 33 ', '4', '158', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('17', '中远两湾城', '71991122171213', ' 122 ', '17', '1213', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('18', '浦发绿城', '51657744280', ' 74 ', '4', '280', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('19', '明天华城', '5178023399', ' 23 ', '3', '99', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('20', '金地自在城4', '37281313116', ' 31 ', '3', '116', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('21', '上海康城', '3794411517817', ' 115 ', '17', '817', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('22', '富友嘉园', '391273310260', ' 33 ', '10', '260', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('23', '金色西郊城', '4093231370', ' 31 ', '3', '70', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('24', '朗庭上郡苑(公寓)', '4292821149', ' 21 ', '1', '49', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('25', '华沁家园', '61449254114', ' 25 ', '4', '114', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('26', '世茂滨江花园', '961671018607', ' 101 ', '8', '607', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('27', '名都城(公寓)', '65093364272', ' 36 ', '4', '272', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('28', '玉兰香苑', '51134304230', ' 30 ', '4', '230', '2017-12-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('57', '润渡佳苑', '2596615246', ' 15 ', '2', '46', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('58', '花木苑', '79757334149', ' 33 ', '4', '149', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('59', '中远两湾城', '72082121181134', ' 121 ', '18', '1134', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('60', '浦发绿城', '51707754249', ' 75 ', '4', '249', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('61', '明天华城', '5191523392', ' 23 ', '3', '92', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('62', '金地自在城4', '37279313110', ' 31 ', '3', '110', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('63', '上海康城', '3790811517789', ' 115 ', '17', '789', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('64', '富友嘉园', '391473411244', ' 34 ', '11', '244', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('65', '金色西郊城', '4083030367', ' 30 ', '3', '67', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('66', '朗庭上郡苑(公寓)', '4292821144', ' 21 ', '1', '44', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('67', '华沁家园', '61449254109', ' 25 ', '4', '109', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('68', '世茂滨江花园', '964071009546', ' 99 ', '9', '546', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('69', '名都城(公寓)', '65093364272', ' 36 ', '4', '272', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('70', '玉兰香苑', '51134304218', ' 30 ', '4', '218', '2017-12-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('71', '润渡佳苑', '2596615241', ' 15 ', '2', '41', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('72', '花木苑', '79757334126', ' 32 ', '4', '126', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('73', '中远两湾城', '72096122181049', ' 122 ', '18', '1049', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('74', '浦发绿城', '51707754227', ' 75 ', '4', '227', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('75', '明天华城', '5191523384', ' 23 ', '3', '84', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('76', '金地自在城4', '3727931394', ' 31 ', '3', '94', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('77', '上海康城', '3787811617764', ' 116 ', '17', '764', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('78', '富友嘉园', '391473411234', ' 34 ', '11', '234', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('79', '金色西郊城', '4083030364', ' 30 ', '3', '64', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('80', '朗庭上郡苑(公寓)', '4292821144', ' 21 ', '1', '44', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('81', '华沁家园', '61449254102', ' 25 ', '4', '102', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('82', '世茂滨江花园', '96597999511', ' 99 ', '9', '511', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('83', '名都城(公寓)', '65093364263', ' 36 ', '4', '263', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('84', '玉兰香苑', '51131314207', ' 30 ', '4', '207', '2017-12-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('85', '润渡佳苑', '2596615240', ' 15 ', '2', '40', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('86', '花木苑', '79363324126', ' 32 ', '4', '126', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('87', '中远两湾城', '72121121181053', ' 121 ', '18', '1053', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('88', '浦发绿城', '51746764225', ' 77 ', '4', '225', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('89', '明天华城', '5206722385', ' 22 ', '3', '85', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('90', '金地自在城4', '3747327397', ' 28 ', '3', '97', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('91', '上海康城', '3805212616762', ' 125 ', '16', '762', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('92', '富友嘉园', '390643311237', ' 33 ', '11', '237', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('93', '金色西郊城', '4074529359', ' 29 ', '3', '59', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('94', '朗庭上郡苑(公寓)', '4292821144', ' 21 ', '1', '44', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('95', '华沁家园', '61484294103', ' 29 ', '4', '103', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('96', '世茂滨江花园', '96621989523', ' 97 ', '9', '523', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('97', '名都城(公寓)', '65402323271', ' 32 ', '3', '271', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('98', '玉兰香苑', '50916294207', ' 29 ', '4', '207', '2017-12-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('99', '润渡佳苑', '2596615235', ' 15 ', '2', '35', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('100', '花木苑', '79349324126', ' 32 ', '4', '126', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('101', '中远两湾城', '72120121181057', ' 121 ', '18', '1057', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('102', '浦发绿城', '51750774230', ' 77 ', '4', '230', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('103', '明天华城', '5206423386', ' 23 ', '3', '86', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('104', '金地自在城4', '37305332103', ' 33 ', '2', '103', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('105', '上海康城', '3808712717776', ' 126 ', '17', '776', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('106', '富友嘉园', '390343311237', ' 33 ', '11', '237', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('107', '金色西郊城', '4065429455', ' 29 ', '4', '55', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('108', '朗庭上郡苑(公寓)', '4287921144', ' 21 ', '1', '44', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('109', '华沁家园', '61433284104', ' 28 ', '4', '104', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('110', '世茂滨江花园', '96843989508', ' 98 ', '9', '508', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('111', '名都城(公寓)', '64766303282', ' 30 ', '3', '282', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('112', '玉兰香苑', '50916294204', ' 29 ', '4', '204', '2017-12-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('113', '润渡佳苑', '2596615237', ' 15 ', '2', '37', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('114', '花木苑', '79223324129', ' 32 ', '4', '129', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('115', '中远两湾城', '72118121171051', ' 121 ', '17', '1051', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('116', '浦发绿城', '51734774235', ' 77 ', '4', '235', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('117', '明天华城', '5201623390', ' 23 ', '3', '90', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('118', '金地自在城4', '37312332110', ' 33 ', '2', '110', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('119', '上海康城', '3773312717794', ' 127 ', '17', '794', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('120', '富友嘉园', '389753311237', ' 33 ', '11', '237', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('121', '金色西郊城', '4071728456', ' 28 ', '4', '56', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('122', '朗庭上郡苑(公寓)', '4287921144', ' 21 ', '1', '44', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('123', '华沁家园', '61580274106', ' 27 ', '4', '106', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('124', '世茂滨江花园', '96843989512', ' 98 ', '9', '512', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('125', '名都城(公寓)', '64711282280', ' 28 ', '2', '280', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('126', '玉兰香苑', '50916294198', ' 29 ', '4', '198', '2017-12-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('141', '润渡佳苑', '2596615237', ' 15 ', '2', '37', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('142', '花木苑', '79179324134', ' 32 ', '4', '134', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('143', '中远两湾城', '72082122191083', ' 121 ', '19', '1083', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('144', '浦发绿城', '51714784246', ' 78 ', '4', '246', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('145', '明天华城', '51952233107', ' 23 ', '3', '107', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('146', '金地自在城4', '37263322128', ' 32 ', '2', '128', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('147', '上海康城', '3750212617817', ' 127 ', '17', '817', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('148', '富友嘉园', '389933411245', ' 34 ', '11', '245', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('149', '金色西郊城', '4078428483', ' 28 ', '4', '83', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('150', '朗庭上郡苑(公寓)', '4279722146', ' 22 ', '1', '46', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('151', '华沁家园', '62105244120', ' 24 ', '4', '120', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('152', '世茂滨江花园', '968431019513', ' 101 ', '9', '513', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('153', '名都城(公寓)', '64438262275', ' 26 ', '2', '275', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('154', '玉兰香苑', '50916294201', ' 29 ', '4', '201', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('155', '海洲桃花园', '38817232126', ' 23 ', '2', '126', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('156', '浦江宝邸', '3616717580', ' 17 ', '5', '80', '2017-12-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('157', '润渡佳苑', '2596615234', ' 15 ', '2', '34', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('158', '花木苑', '79179324147', ' 32 ', '4', '147', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('159', '中远两湾城', '72101119191095', ' 119 ', '19', '1095', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('160', '浦发绿城', '51730784253', ' 78 ', '4', '253', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('161', '明天华城', '51952233115', ' 23 ', '3', '115', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('162', '金地自在城4', '37312332143', ' 33 ', '2', '143', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('163', '上海康城', '3738812918849', ' 129 ', '18', '849', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('164', '富友嘉园', '389933412251', ' 34 ', '12', '251', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('165', '金色西郊城', '4072328490', ' 28 ', '4', '90', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('166', '朗庭上郡苑(公寓)', '4288724148', ' 24 ', '1', '48', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('167', '华沁家园', '62105244119', ' 24 ', '4', '119', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('168', '世茂滨江花园', '967281029504', ' 102 ', '9', '504', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('169', '名都城(公寓)', '64296252264', ' 25 ', '2', '264', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('170', '玉兰香苑', '50971284193', ' 28 ', '4', '193', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('171', '海洲桃花园', '38789243138', ' 24 ', '3', '138', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('172', '浦江宝邸', '3616717587', ' 17 ', '5', '87', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('173', '润渡佳苑', '2596614234', ' 14 ', '2', '34', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('174', '花木苑', '79179324147', ' 32 ', '4', '147', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('175', '中远两湾城', '72101119191095', ' 119 ', '19', '1095', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('176', '浦发绿城', '51730784253', ' 78 ', '4', '253', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('177', '明天华城', '51952233115', ' 23 ', '3', '115', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('178', '金地自在城4', '37312322143', ' 32 ', '2', '143', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('179', '上海康城', '3738813018849', ' 130 ', '18', '849', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('180', '富友嘉园', '389933412251', ' 34 ', '12', '251', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('181', '金色西郊城', '4072328490', ' 28 ', '4', '90', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('182', '朗庭上郡苑(公寓)', '4288724148', ' 24 ', '1', '48', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('183', '华沁家园', '62105244119', ' 24 ', '4', '119', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('184', '世茂滨江花园', '967281029504', ' 102 ', '9', '504', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('185', '名都城(公寓)', '64296252264', ' 25 ', '2', '264', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('186', '玉兰香苑', '50971284193', ' 28 ', '4', '193', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('187', '海洲桃花园', '38789243138', ' 24 ', '3', '138', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('188', '浦江宝邸', '3616717587', ' 17 ', '5', '87', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('189', '绿川新苑', '51445504133', ' 50 ', '4', '133', '2018-01-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('190', '润渡佳苑', '2600114233', ' 14 ', '2', '33', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('191', '花木苑', '79179324140', ' 32 ', '4', '140', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('192', '中远两湾城', '72127118191037', ' 118 ', '19', '1037', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('193', '浦发绿城', '51730784249', ' 78 ', '4', '249', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('194', '明天华城', '51905233111', ' 23 ', '3', '111', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('195', '金地自在城4', '37234322135', ' 32 ', '2', '135', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('196', '上海康城', '3740313018832', ' 130 ', '18', '832', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('197', '富友嘉园', '389933412242', ' 34 ', '12', '242', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('198', '金色西郊城', '4072328496', ' 28 ', '4', '96', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('199', '朗庭上郡苑(公寓)', '4288724146', ' 24 ', '1', '46', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('200', '华沁家园', '62105244109', ' 24 ', '4', '109', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('201', '世茂滨江花园', '967281029452', ' 102 ', '9', '452', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('202', '名都城(公寓)', '64296252228', ' 25 ', '2', '228', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('203', '玉兰香苑', '50971284157', ' 28 ', '4', '157', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('204', '海洲桃花园', '38789243136', ' 24 ', '3', '136', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('205', '浦江宝邸', '3616717580', ' 17 ', '5', '80', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('206', '绿川新苑', '51445504124', ' 50 ', '4', '124', '2018-01-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('207', '润渡佳苑', '2600114232', ' 14 ', '2', '32', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('208', '花木苑', '79179324128', ' 32 ', '4', '128', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('209', '中远两湾城', '7222911719981', ' 117 ', '19', '981', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('210', '浦发绿城', '51730794221', ' 79 ', '4', '221', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('211', '明天华城', '51905253109', ' 25 ', '3', '109', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('212', '金地自在城4', '37217322131', ' 32 ', '2', '131', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('213', '上海康城', '3740813018778', ' 135 ', '18', '778', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('214', '富友嘉园', '389513312234', ' 33 ', '12', '234', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('215', '金色西郊城', '4072328492', ' 28 ', '4', '92', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('216', '朗庭上郡苑(公寓)', '4288724141', ' 24 ', '1', '41', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('217', '华沁家园', '6210524498', ' 24 ', '4', '98', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('218', '世茂滨江花园', '967281029419', ' 102 ', '9', '419', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('219', '名都城(公寓)', '64125232206', ' 23 ', '2', '206', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('220', '玉兰香苑', '50971304149', ' 30 ', '4', '149', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('221', '海洲桃花园', '38789243120', ' 24 ', '3', '120', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('222', '浦江宝邸', '3613117568', ' 17 ', '5', '68', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('223', '绿川新苑', '51445504115', ' 50 ', '4', '115', '2018-01-03');
INSERT INTO `t_lianjia_housingestate` VALUES ('224', '润渡佳苑', '2600114232', ' 14 ', '2', '32', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('225', '花木苑', '79142334126', ' 33 ', '4', '126', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('226', '中远两湾城', '7228411719988', ' 117 ', '19', '988', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('227', '浦发绿城', '51757794216', ' 79 ', '4', '216', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('228', '明天华城', '51869253109', ' 25 ', '3', '109', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('229', '金地自在城4', '37193322140', ' 32 ', '2', '140', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('230', '上海康城', '3755813718760', ' 137 ', '18', '760', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('231', '富友嘉园', '389323312229', ' 33 ', '12', '229', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('232', '金色西郊城', '4072328494', ' 28 ', '4', '94', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('233', '朗庭上郡苑(公寓)', '4288724141', ' 24 ', '1', '41', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('234', '华沁家园', '6210524497', ' 24 ', '4', '97', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('235', '世茂滨江花园', '967281029428', ' 102 ', '9', '428', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('236', '名都城(公寓)', '64125232203', ' 23 ', '2', '203', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('237', '玉兰香苑', '51071304149', ' 30 ', '4', '149', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('238', '海洲桃花园', '38789243117', ' 24 ', '3', '117', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('239', '浦江宝邸', '3613117563', ' 17 ', '5', '63', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('240', '绿川新苑', '51564494111', ' 49 ', '4', '111', '2018-01-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('241', '润渡佳苑', '2600114227', ' 14 ', '2', '27', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('242', '花木苑', '79142334126', ' 33 ', '4', '126', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('243', '中远两湾城', '7218211819991', ' 118 ', '19', '991', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('244', '浦发绿城', '51741794222', ' 79 ', '4', '222', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('245', '明天华城', '51847253111', ' 25 ', '3', '111', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('246', '金地自在城4', '37286332136', ' 33 ', '2', '136', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('247', '上海康城', '3755213818753', ' 138 ', '18', '753', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('248', '富友嘉园', '388693312229', ' 33 ', '12', '229', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('249', '金色西郊城', '4072328493', ' 28 ', '4', '93', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('250', '朗庭上郡苑(公寓)', '4288724141', ' 24 ', '1', '41', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('251', '华沁家园', '6211525494', ' 25 ', '4', '94', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('252', '世茂滨江花园', '967191029429', ' 102 ', '9', '429', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('253', '名都城(公寓)', '64125232196', ' 23 ', '2', '196', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('254', '玉兰香苑', '51071304148', ' 30 ', '4', '148', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('255', '海洲桃花园', '38736243116', ' 24 ', '3', '116', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('256', '浦江宝邸', '3606017564', ' 17 ', '5', '64', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('257', '绿川新苑', '51491494109', ' 49 ', '4', '109', '2018-01-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('258', '润渡佳苑', '2600114227', ' 14 ', '2', '27', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('259', '花木苑', '79142334126', ' 33 ', '4', '126', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('260', '中远两湾城', '7212411819984', ' 119 ', '19', '984', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('261', '浦发绿城', '51769804220', ' 80 ', '4', '220', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('262', '明天华城', '51847253111', ' 26 ', '3', '111', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('263', '金地自在城4', '37321333122', ' 33 ', '3', '122', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('264', '上海康城', '3754913818751', ' 138 ', '18', '751', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('265', '富友嘉园', '389053212227', ' 32 ', '12', '227', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('266', '金色西郊城', '4072328489', ' 28 ', '4', '89', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('267', '朗庭上郡苑(公寓)', '4288724141', ' 24 ', '1', '41', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('268', '华沁家园', '6211525494', ' 25 ', '4', '94', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('269', '世茂滨江花园', '967191029418', ' 102 ', '9', '418', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('270', '名都城(公寓)', '64125232197', ' 23 ', '2', '197', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('271', '玉兰香苑', '51071304149', ' 30 ', '4', '149', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('272', '海洲桃花园', '38749253116', ' 25 ', '3', '116', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('273', '浦江宝邸', '3606017560', ' 17 ', '5', '60', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('274', '绿川新苑', '51491494109', ' 49 ', '4', '109', '2018-01-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('275', '润渡佳苑', '2600114229', ' 14 ', '2', '29', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('276', '花木苑', '79142334135', ' 33 ', '4', '135', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('277', '中远两湾城', '7217211919988', ' 119 ', '19', '988', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('278', '浦发绿城', '51769804246', ' 80 ', '4', '246', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('279', '明天华城', '51780263131', ' 26 ', '3', '131', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('280', '金地自在城4', '37235353119', ' 35 ', '3', '119', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('281', '上海康城', '3753414018791', ' 140 ', '18', '791', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('282', '富友嘉园', '389053212236', ' 32 ', '12', '236', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('283', '金色西郊城', '4058828492', ' 28 ', '4', '92', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('284', '朗庭上郡苑(公寓)', '4288724143', ' 24 ', '1', '43', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('285', '华沁家园', '6206825496', ' 25 ', '4', '96', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('286', '世茂滨江花园', '966181049449', ' 104 ', '9', '449', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('287', '名都城(公寓)', '64045243228', ' 24 ', '3', '228', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('288', '玉兰香苑', '50992304154', ' 30 ', '4', '154', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('289', '海洲桃花园', '38749254124', ' 25 ', '4', '124', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('290', '浦江宝邸', '3606018561', ' 18 ', '5', '61', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('291', '绿川新苑', '51488494112', ' 49 ', '4', '112', '2018-01-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('292', '润渡佳苑', '2600114231', ' 14 ', '2', '31', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('293', '花木苑', '79107334146', ' 33 ', '4', '146', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('294', '中远两湾城', '72143119201019', ' 119 ', '20', '1019', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('295', '浦发绿城', '51769805263', ' 80 ', '5', '263', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('296', '明天华城', '51758263143', ' 26 ', '3', '143', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('297', '金地自在城4', '37294353121', ' 35 ', '3', '121', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('298', '上海康城', '3754213918812', ' 141 ', '18', '812', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('299', '富友嘉园', '388843212252', ' 32 ', '12', '252', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('300', '金色西郊城', '40584284104', ' 28 ', '4', '104', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('301', '朗庭上郡苑(公寓)', '4288724145', ' 24 ', '1', '45', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('302', '华沁家园', '6206825496', ' 25 ', '4', '96', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('303', '世茂滨江花园', '9658510510490', ' 105 ', '10', '490', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('304', '名都城(公寓)', '64045243233', ' 24 ', '3', '233', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('305', '玉兰香苑', '51048293166', ' 29 ', '3', '166', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('306', '海洲桃花园', '38745244127', ' 24 ', '4', '127', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('307', '浦江宝邸', '3619318564', ' 18 ', '5', '64', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('308', '绿川新苑', '51488494120', ' 49 ', '4', '120', '2018-01-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('309', '润渡佳苑', '2600114231', ' 14 ', '2', '31', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('310', '花木苑', '79107334146', ' 33 ', '4', '146', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('311', '中远两湾城', '72143118201019', ' 118 ', '20', '1019', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('312', '浦发绿城', '51769805263', ' 80 ', '5', '263', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('313', '明天华城', '51758263143', ' 26 ', '3', '143', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('314', '金地自在城4', '37294353121', ' 35 ', '3', '121', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('315', '上海康城', '3754214118812', ' 141 ', '18', '812', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('316', '富友嘉园', '388843212252', ' 32 ', '12', '252', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('317', '金色西郊城', '40584284104', ' 28 ', '4', '104', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('318', '朗庭上郡苑(公寓)', '4288724145', ' 24 ', '1', '45', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('319', '华沁家园', '6206825496', ' 25 ', '4', '96', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('320', '世茂滨江花园', '9658510510490', ' 105 ', '10', '490', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('321', '名都城(公寓)', '64045243233', ' 24 ', '3', '233', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('322', '玉兰香苑', '51048293166', ' 29 ', '3', '166', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('323', '海洲桃花园', '38745244127', ' 24 ', '4', '127', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('324', '浦江宝邸', '3619320564', ' 20 ', '5', '64', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('325', '绿川新苑', '51488494120', ' 49 ', '4', '120', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('326', '润渡佳苑', '2600114231', ' 14 ', '2', '31', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('327', '花木苑', '79107334146', ' 33 ', '4', '146', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('328', '中远两湾城', '72143118201019', ' 118 ', '20', '1019', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('329', '浦发绿城', '51769805263', ' 80 ', '5', '263', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('330', '明天华城', '51758263143', ' 26 ', '3', '143', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('331', '金地自在城4', '37294353121', ' 35 ', '3', '121', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('332', '上海康城', '3754214118812', ' 141 ', '18', '812', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('333', '富友嘉园', '388843212252', ' 32 ', '12', '252', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('334', '金色西郊城', '40584284104', ' 28 ', '4', '104', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('335', '朗庭上郡苑(公寓)', '4288724145', ' 24 ', '1', '45', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('336', '华沁家园', '6206825496', ' 24 ', '4', '96', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('337', '世茂滨江花园', '9658510510490', ' 105 ', '10', '490', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('338', '名都城(公寓)', '64045243233', ' 24 ', '3', '233', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('339', '玉兰香苑', '51048293166', ' 29 ', '3', '166', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('340', '海洲桃花园', '38745244127', ' 24 ', '4', '127', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('341', '浦江宝邸', '3619320564', ' 20 ', '5', '64', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('342', '绿川新苑', '51488494120', ' 49 ', '4', '120', '2018-01-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('343', '润渡佳苑', '2600114228', ' 14 ', '2', '28', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('344', '花木苑', '79107334118', ' 33 ', '4', '118', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('345', '中远两湾城', '7214311719860', ' 117 ', '19', '860', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('346', '浦发绿城', '51769805215', ' 80 ', '5', '215', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('347', '明天华城', '51758263126', ' 26 ', '3', '126', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('348', '金地自在城4', '37294353127', ' 35 ', '3', '127', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('349', '上海康城', '3749814118704', ' 141 ', '18', '704', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('350', '富友嘉园', '388843212200', ' 32 ', '12', '200', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('351', '金色西郊城', '40551284106', ' 28 ', '4', '106', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('352', '朗庭上郡苑(公寓)', '4288724133', ' 24 ', '1', '33', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('353', '华沁家园', '6196424485', ' 24 ', '4', '85', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('354', '世茂滨江花园', '9673510411467', ' 103 ', '11', '467', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('355', '名都城(公寓)', '64045243209', ' 24 ', '3', '209', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('356', '玉兰香苑', '51107283140', ' 28 ', '3', '140', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('357', '海洲桃花园', '38745244106', ' 24 ', '4', '106', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('358', '浦江宝邸', '3629120557', ' 20 ', '5', '57', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('359', '绿川新苑', '51559494111', ' 49 ', '4', '111', '2018-01-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('360', '润渡佳苑', '2598615228', ' 15 ', '2', '28', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('361', '花木苑', '78624344121', ' 34 ', '4', '121', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('362', '中远两湾城', '7232511718893', ' 118 ', '18', '893', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('363', '浦发绿城', '51769805214', ' 80 ', '5', '214', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('364', '明天华城', '51750253137', ' 25 ', '3', '137', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('365', '金地自在城4', '37294353137', ' 35 ', '3', '137', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('366', '上海康城', '3746113918732', ' 139 ', '18', '732', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('367', '富友嘉园', '388413212201', ' 32 ', '12', '201', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('368', '金色西郊城', '40551284106', ' 28 ', '4', '106', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('369', '朗庭上郡苑(公寓)', '4281523136', ' 23 ', '1', '36', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('370', '华沁家园', '6196424477', ' 24 ', '4', '77', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('371', '世茂滨江花园', '9550310311463', ' 103 ', '11', '463', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('372', '名都城(公寓)', '64194253215', ' 25 ', '3', '215', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('373', '玉兰香苑', '51107283140', ' 28 ', '3', '140', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('374', '海洲桃花园', '38745244104', ' 24 ', '4', '104', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('375', '浦江宝邸', '3630220558', ' 20 ', '5', '58', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('376', '绿川新苑', '51544514112', ' 51 ', '4', '112', '2018-01-11');
INSERT INTO `t_lianjia_housingestate` VALUES ('377', '润渡佳苑', '2577314228', ' 14 ', '2', '28', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('378', '花木苑', '78831334122', ' 33 ', '4', '122', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('379', '中远两湾城', '7229411918905', ' 119 ', '18', '905', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('380', '浦发绿城', '51646815216', ' 81 ', '5', '216', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('381', '明天华城', '51750233138', ' 23 ', '3', '138', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('382', '金地自在城4', '37294353137', ' 35 ', '3', '137', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('383', '上海康城', '3743313820723', ' 138 ', '20', '723', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('384', '富友嘉园', '388413211200', ' 32 ', '11', '200', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('385', '金色西郊城', '40551284109', ' 28 ', '4', '109', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('386', '朗庭上郡苑(公寓)', '4281523136', ' 23 ', '1', '36', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('387', '华沁家园', '6171722478', ' 22 ', '4', '78', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('388', '世茂滨江花园', '9550310310473', ' 103 ', '10', '473', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('389', '名都城(公寓)', '64297243219', ' 24 ', '3', '219', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('390', '玉兰香苑', '51107283140', ' 28 ', '3', '140', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('391', '海洲桃花园', '38868234105', ' 23 ', '4', '105', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('392', '浦江宝邸', '3644719554', ' 19 ', '5', '54', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('393', '绿川新苑', '51559524113', ' 52 ', '4', '113', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('394', '润渡佳苑', '2577314228', ' 14 ', '2', '28', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('395', '花木苑', '78831334122', ' 33 ', '4', '122', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('396', '中远两湾城', '7229411918905', ' 119 ', '18', '905', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('397', '浦发绿城', '51646815216', ' 81 ', '5', '216', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('398', '明天华城', '51750233138', ' 23 ', '3', '138', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('399', '金地自在城4', '37294353137', ' 35 ', '3', '137', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('400', '上海康城', '3743313820723', ' 138 ', '20', '723', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('401', '富友嘉园', '388413211200', ' 32 ', '11', '200', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('402', '金色西郊城', '40551284109', ' 28 ', '4', '109', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('403', '朗庭上郡苑(公寓)', '4281523136', ' 23 ', '1', '36', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('404', '华沁家园', '6171722478', ' 22 ', '4', '78', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('405', '世茂滨江花园', '9550310310473', ' 103 ', '10', '473', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('406', '名都城(公寓)', '64297243219', ' 24 ', '3', '219', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('407', '玉兰香苑', '51107283140', ' 28 ', '3', '140', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('408', '海洲桃花园', '38868234105', ' 23 ', '4', '105', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('409', '浦江宝邸', '3644719554', ' 19 ', '5', '54', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('410', '绿川新苑', '51559524113', ' 52 ', '4', '113', '2018-01-12');
INSERT INTO `t_lianjia_housingestate` VALUES ('411', '润渡佳苑', '2577314138', ' 14 ', '1', '38', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('412', '花木苑', '78831324138', ' 32 ', '4', '138', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('413', '中远两湾城', '72572124181098', ' 124 ', '18', '1098', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('414', '浦发绿城', '51616826259', ' 82 ', '6', '259', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('415', '明天华城', '52025234172', ' 23 ', '4', '172', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('416', '金地自在城4', '37198343148', ' 34 ', '3', '148', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('417', '上海康城', '3739213921812', ' 139 ', '21', '812', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('418', '富友嘉园', '388413311219', ' 33 ', '11', '219', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('419', '金色西郊城', '40466274126', ' 27 ', '4', '126', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('420', '朗庭上郡苑(公寓)', '4307522138', ' 22 ', '1', '38', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('421', '华沁家园', '6128323488', ' 23 ', '4', '88', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('422', '世茂滨江花园', '9550310211503', ' 102 ', '11', '503', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('423', '名都城(公寓)', '64941253262', ' 25 ', '3', '262', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('424', '玉兰香苑', '51107282168', ' 28 ', '2', '168', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('425', '海洲桃花园', '38738224135', ' 23 ', '4', '135', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('426', '浦江宝邸', '3627818558', ' 18 ', '5', '58', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('427', '绿川新苑', '51559524132', ' 51 ', '4', '132', '2018-01-15');
INSERT INTO `t_lianjia_housingestate` VALUES ('428', '润渡佳苑', '2577314132', ' 14 ', '1', '32', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('429', '花木苑', '79322314110', ' 31 ', '4', '110', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('430', '中远两湾城', '7252012418992', ' 124 ', '18', '992', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('431', '浦发绿城', '51621826233', ' 82 ', '6', '233', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('432', '明天华城', '52376235175', ' 23 ', '5', '175', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('433', '金地自在城4', '37191343158', ' 34 ', '3', '158', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('434', '上海康城', '3761413821742', ' 137 ', '21', '742', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('435', '富友嘉园', '387053311163', ' 33 ', '11', '163', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('436', '金色西郊城', '40573264116', ' 26 ', '4', '116', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('437', '朗庭上郡苑(公寓)', '4307522129', ' 22 ', '1', '29', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('438', '华沁家园', '6120823477', ' 23 ', '4', '77', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('439', '世茂滨江花园', '956341039446', ' 103 ', '9', '446', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('440', '名都城(公寓)', '64941252249', ' 25 ', '2', '249', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('441', '玉兰香苑', '51107282112', ' 28 ', '2', '112', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('442', '海洲桃花园', '38752234119', ' 23 ', '4', '119', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('443', '浦江宝邸', '3635414552', ' 14 ', '5', '52', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('444', '绿川新苑', '51492524107', ' 52 ', '4', '107', '2018-01-17');
INSERT INTO `t_lianjia_housingestate` VALUES ('445', '润渡佳苑', '2577314134', ' 14 ', '1', '34', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('446', '花木苑', '79233314110', ' 31 ', '4', '110', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('447', '中远两湾城', '72505124181026', ' 124 ', '18', '1026', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('448', '浦发绿城', '51546826239', ' 82 ', '6', '239', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('449', '明天华城', '52376235179', ' 23 ', '5', '179', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('450', '金地自在城4', '37236343160', ' 34 ', '3', '160', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('451', '上海康城', '3763913621738', ' 136 ', '21', '738', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('452', '富友嘉园', '386963311168', ' 33 ', '11', '168', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('453', '金色西郊城', '40465254114', ' 25 ', '4', '114', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('454', '朗庭上郡苑(公寓)', '4307522127', ' 22 ', '1', '27', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('455', '华沁家园', '6120823478', ' 23 ', '4', '78', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('456', '世茂滨江花园', '962071029456', ' 102 ', '9', '456', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('457', '名都城(公寓)', '64759262249', ' 26 ', '2', '249', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('458', '玉兰香苑', '51070292112', ' 29 ', '2', '112', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('459', '海洲桃花园', '38752234115', ' 23 ', '4', '115', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('460', '浦江宝邸', '3636615548', ' 15 ', '5', '48', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('461', '绿川新苑', '51492524107', ' 52 ', '4', '107', '2018-01-18');
INSERT INTO `t_lianjia_housingestate` VALUES ('462', '润渡佳苑', '2577314132', ' 14 ', '1', '32', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('463', '花木苑', '79233314112', ' 31 ', '4', '112', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('464', '中远两湾城', '72448125181036', ' 125 ', '18', '1036', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('465', '浦发绿城', '51513826240', ' 82 ', '6', '240', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('466', '明天华城', '52376235179', ' 23 ', '5', '179', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('467', '金地自在城4', '37307353165', ' 35 ', '3', '165', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('468', '上海康城', '3760813521739', ' 135 ', '21', '739', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('469', '富友嘉园', '386963311157', ' 33 ', '11', '157', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('470', '金色西郊城', '40424274116', ' 27 ', '4', '116', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('471', '朗庭上郡苑(公寓)', '4307522128', ' 22 ', '1', '28', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('472', '华沁家园', '6120823477', ' 23 ', '4', '77', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('473', '世茂滨江花园', '960291039458', ' 103 ', '9', '458', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('474', '名都城(公寓)', '65032272263', ' 27 ', '2', '263', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('475', '玉兰香苑', '51070292109', ' 29 ', '2', '109', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('476', '海洲桃花园', '38769234115', ' 23 ', '4', '115', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('477', '浦江宝邸', '3613116548', ' 16 ', '5', '48', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('478', '绿川新苑', '51492524108', ' 52 ', '4', '108', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('479', '润渡佳苑', '2577314132', ' 14 ', '1', '32', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('480', '花木苑', '79233314112', ' 31 ', '4', '112', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('481', '中远两湾城', '72448123181036', ' 124 ', '18', '1036', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('482', '浦发绿城', '51513826240', ' 82 ', '6', '240', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('483', '明天华城', '52376245179', ' 24 ', '5', '179', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('484', '金地自在城4', '37307333165', ' 33 ', '3', '165', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('485', '上海康城', '3760813421739', ' 134 ', '21', '739', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('486', '富友嘉园', '386963311157', ' 33 ', '11', '157', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('487', '金色西郊城', '40424274116', ' 27 ', '4', '116', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('488', '朗庭上郡苑(公寓)', '4307523128', ' 23 ', '1', '28', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('489', '华沁家园', '6120823477', ' 23 ', '4', '77', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('490', '世茂滨江花园', '960291029458', ' 102 ', '9', '458', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('491', '名都城(公寓)', '65032262263', ' 26 ', '2', '263', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('492', '玉兰香苑', '51070292109', ' 29 ', '2', '109', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('493', '海洲桃花园', '38769234115', ' 23 ', '4', '115', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('494', '浦江宝邸', '3613116548', ' 16 ', '5', '48', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('495', '绿川新苑', '51492524108', ' 52 ', '4', '108', '2018-01-19');
INSERT INTO `t_lianjia_housingestate` VALUES ('496', '润渡佳苑', '2577314129', ' 14 ', '1', '29', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('497', '花木苑', '79233314112', ' 31 ', '4', '112', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('498', '中远两湾城', '72454124181037', ' 124 ', '18', '1037', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('499', '浦发绿城', '51513825241', ' 82 ', '5', '241', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('500', '明天华城', '52071245185', ' 24 ', '5', '185', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('501', '金地自在城4', '37567333165', ' 33 ', '3', '165', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('502', '上海康城', '3764513321730', ' 132 ', '21', '730', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('503', '富友嘉园', '387293311157', ' 33 ', '11', '157', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('504', '金色西郊城', '40424275118', ' 27 ', '5', '118', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('505', '朗庭上郡苑(公寓)', '4301522130', ' 22 ', '1', '30', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('506', '华沁家园', '6120823476', ' 23 ', '4', '76', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('507', '世茂滨江花园', '960161029457', ' 103 ', '9', '457', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('508', '名都城(公寓)', '64847262274', ' 26 ', '2', '274', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('509', '玉兰香苑', '51070292110', ' 29 ', '2', '110', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('510', '海洲桃花园', '38769234114', ' 23 ', '4', '114', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('511', '浦江宝邸', '3605016548', ' 16 ', '5', '48', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('512', '绿川新苑', '51492524111', ' 52 ', '4', '111', '2018-01-20');
INSERT INTO `t_lianjia_housingestate` VALUES ('513', '润渡佳苑', '2579312133', ' 12 ', '1', '33', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('514', '花木苑', '79233314116', ' 31 ', '4', '116', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('515', '中远两湾城', '72559121181138', ' 121 ', '18', '1138', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('516', '浦发绿城', '51513825273', ' 82 ', '5', '273', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('517', '明天华城', '51939255192', ' 25 ', '5', '192', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('518', '金地自在城4', '37567333195', ' 33 ', '3', '195', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('519', '上海康城', '3766213223760', ' 132 ', '23', '760', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('520', '富友嘉园', '387293311166', ' 33 ', '11', '166', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('521', '金色西郊城', '40424275127', ' 27 ', '5', '127', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('522', '朗庭上郡苑(公寓)', '4302822130', ' 22 ', '1', '30', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('523', '华沁家园', '6120823489', ' 23 ', '4', '89', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('524', '世茂滨江花园', '960291038476', ' 103 ', '8', '476', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('525', '名都城(公寓)', '64833252295', ' 25 ', '2', '295', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('526', '玉兰香苑', '51070302112', ' 30 ', '2', '112', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('527', '海洲桃花园', '38769234121', ' 23 ', '4', '121', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('528', '浦江宝邸', '3592214858', ' 14 ', '8', '58', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('529', '绿川新苑', '51492524125', ' 52 ', '4', '125', '2018-01-21');
INSERT INTO `t_lianjia_housingestate` VALUES ('530', '润渡佳苑', '2579312131', ' 12 ', '1', '31', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('531', '花木苑', '79159314127', ' 31 ', '4', '127', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('532', '中远两湾城', '72668123181181', ' 123 ', '18', '1181', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('533', '浦发绿城', '51495825284', ' 82 ', '5', '284', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('534', '明天华城', '51939255199', ' 25 ', '5', '199', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('535', '金地自在城4', '37535333194', ' 33 ', '3', '194', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('536', '上海康城', '3768213424811', ' 135 ', '24', '811', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('537', '富友嘉园', '387293311179', ' 33 ', '11', '179', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('538', '金色西郊城', '40467285128', ' 28 ', '5', '128', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('539', '朗庭上郡苑(公寓)', '4283723132', ' 23 ', '1', '32', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('540', '华沁家园', '6120823497', ' 23 ', '4', '97', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('541', '世茂滨江花园', '961391048487', ' 104 ', '8', '487', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('542', '名都城(公寓)', '64833252309', ' 25 ', '2', '309', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('543', '玉兰香苑', '51149292122', ' 29 ', '2', '122', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('544', '海洲桃花园', '38769234114', ' 23 ', '4', '114', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('545', '浦江宝邸', '3623613764', ' 13 ', '7', '64', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('546', '绿川新苑', '51742514141', ' 51 ', '4', '141', '2018-01-22');
INSERT INTO `t_lianjia_housingestate` VALUES ('547', '润渡佳苑', '2579312128', ' 12 ', '1', '28', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('548', '花木苑', '79159314109', ' 31 ', '4', '109', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('549', '中远两湾城', '72646121181130', ' 121 ', '18', '1130', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('550', '浦发绿城', '51539825267', ' 82 ', '5', '267', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('551', '明天华城', '51974275183', ' 27 ', '5', '183', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('552', '金地自在城4', '37555333194', ' 33 ', '3', '194', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('553', '上海康城', '3772113224787', ' 132 ', '24', '787', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('554', '富友嘉园', '387293311160', ' 33 ', '11', '160', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('555', '金色西郊城', '40566285127', ' 28 ', '5', '127', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('556', '朗庭上郡苑(公寓)', '4283723129', ' 23 ', '1', '29', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('557', '华沁家园', '6124824484', ' 24 ', '4', '84', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('558', '世茂滨江花园', '961391048467', ' 104 ', '8', '467', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('559', '名都城(公寓)', '64953262294', ' 26 ', '2', '294', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('560', '玉兰香苑', '51149292119', ' 29 ', '2', '119', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('561', '海洲桃花园', '38719234103', ' 23 ', '4', '103', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('562', '浦江宝邸', '3623613763', ' 13 ', '7', '63', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('563', '绿川新苑', '51720504132', ' 50 ', '4', '132', '2018-01-23');
INSERT INTO `t_lianjia_housingestate` VALUES ('564', '润渡佳苑', '2579312128', ' 12 ', '1', '28', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('565', '花木苑', '79159304103', ' 30 ', '4', '103', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('566', '中远两湾城', '72628123181099', ' 123 ', '18', '1099', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('567', '浦发绿城', '51539825251', ' 82 ', '5', '251', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('568', '明天华城', '51974275174', ' 27 ', '5', '174', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('569', '金地自在城4', '37555333191', ' 33 ', '3', '191', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('570', '上海康城', '3770913226739', ' 132 ', '26', '739', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('571', '富友嘉园', '387293311154', ' 33 ', '11', '154', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('572', '金色西郊城', '40566285123', ' 28 ', '5', '123', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('573', '朗庭上郡苑(公寓)', '4283723127', ' 23 ', '1', '27', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('574', '华沁家园', '6124824480', ' 24 ', '4', '80', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('575', '世茂滨江花园', '961391048432', ' 104 ', '8', '432', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('576', '名都城(公寓)', '64899253279', ' 25 ', '3', '279', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('577', '玉兰香苑', '51190292100', ' 29 ', '2', '100', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('578', '海洲桃花园', '3871923497', ' 23 ', '4', '97', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('579', '浦江宝邸', '3623613761', ' 13 ', '7', '61', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('580', '绿川新苑', '51720504125', ' 50 ', '4', '125', '2018-01-24');
INSERT INTO `t_lianjia_housingestate` VALUES ('581', '润渡佳苑', '2579312128', ' 12 ', '1', '28', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('582', '花木苑', '78883304103', ' 30 ', '4', '103', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('583', '中远两湾城', '72565121191108', ' 121 ', '19', '1108', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('584', '浦发绿城', '51539825249', ' 82 ', '5', '249', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('585', '明天华城', '51974275178', ' 27 ', '5', '178', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('586', '金地自在城4', '37633343190', ' 34 ', '3', '190', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('587', '上海康城', '3771613325739', ' 133 ', '25', '739', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('588', '富友嘉园', '387293311157', ' 33 ', '11', '157', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('589', '金色西郊城', '40566285121', ' 28 ', '5', '121', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('590', '朗庭上郡苑(公寓)', '4283124131', ' 24 ', '1', '31', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('591', '华沁家园', '6138127483', ' 27 ', '4', '83', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('592', '世茂滨江花园', '961391058415', ' 105 ', '8', '415', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('593', '名都城(公寓)', '64899253269', ' 25 ', '3', '269', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('594', '玉兰香苑', '51236282105', ' 28 ', '2', '105', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('595', '海洲桃花园', '3871923496', ' 23 ', '4', '96', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('596', '浦江宝邸', '3623314763', ' 14 ', '7', '63', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('597', '绿川新苑', '51777514127', ' 51 ', '4', '127', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('598', '润渡佳苑', '2579312128', ' 12 ', '1', '28', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('599', '花木苑', '78883304103', ' 30 ', '4', '103', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('600', '中远两湾城', '72565121191108', ' 121 ', '19', '1108', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('601', '浦发绿城', '51539825249', ' 82 ', '5', '249', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('602', '明天华城', '51974275178', ' 27 ', '5', '178', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('603', '金地自在城4', '37633343190', ' 34 ', '3', '190', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('604', '上海康城', '3771613325739', ' 133 ', '25', '739', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('605', '富友嘉园', '387293311157', ' 33 ', '11', '157', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('606', '金色西郊城', '40566285121', ' 28 ', '5', '121', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('607', '朗庭上郡苑(公寓)', '4283125131', ' 25 ', '1', '31', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('608', '华沁家园', '6138127483', ' 27 ', '4', '83', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('609', '世茂滨江花园', '961391058415', ' 105 ', '8', '415', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('610', '名都城(公寓)', '64899253269', ' 25 ', '3', '269', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('611', '玉兰香苑', '51236282105', ' 28 ', '2', '105', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('612', '海洲桃花园', '3871923496', ' 23 ', '4', '96', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('613', '浦江宝邸', '3623314763', ' 14 ', '7', '63', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('614', '绿川新苑', '51777514127', ' 51 ', '4', '127', '2018-01-25');
INSERT INTO `t_lianjia_housingestate` VALUES ('615', '润渡佳苑', '2579312128', ' 12 ', '1', '28', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('616', '花木苑', '78883294104', ' 29 ', '4', '104', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('617', '中远两湾城', '72706122201103', ' 122 ', '20', '1103', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('618', '浦发绿城', '51539835247', ' 83 ', '5', '247', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('619', '明天华城', '51974275177', ' 27 ', '5', '177', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('620', '金地自在城4', '37633343190', ' 34 ', '3', '190', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('621', '上海康城', '3771613026734', ' 130 ', '26', '734', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('622', '富友嘉园', '387293411157', ' 34 ', '11', '157', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('623', '金色西郊城', '40566275121', ' 27 ', '5', '121', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('624', '朗庭上郡苑(公寓)', '4274325131', ' 25 ', '1', '31', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('625', '华沁家园', '6157227483', ' 27 ', '4', '83', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('626', '世茂滨江花园', '962011068413', ' 106 ', '8', '413', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('627', '名都城(公寓)', '64899253272', ' 25 ', '3', '272', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('628', '玉兰香苑', '51205282105', ' 28 ', '2', '105', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('629', '海洲桃花园', '3871924495', ' 24 ', '4', '95', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('630', '浦江宝邸', '3623314760', ' 14 ', '7', '60', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('631', '绿川新苑', '51777514126', ' 51 ', '4', '126', '2018-01-26');
INSERT INTO `t_lianjia_housingestate` VALUES ('632', '润渡佳苑', '2579312128', ' 12 ', '1', '28', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('633', '花木苑', '78794294104', ' 29 ', '4', '104', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('634', '中远两湾城', '72660122191090', ' 122 ', '19', '1090', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('635', '浦发绿城', '51566835246', ' 83 ', '5', '246', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('636', '明天华城', '51874275182', ' 27 ', '5', '182', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('637', '金地自在城4', '37633343184', ' 33 ', '3', '184', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('638', '上海康城', '3768113028736', ' 131 ', '28', '736', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('639', '富友嘉园', '387573411155', ' 34 ', '11', '155', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('640', '金色西郊城', '40580275122', ' 27 ', '5', '122', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('641', '朗庭上郡苑(公寓)', '4274325131', ' 25 ', '1', '31', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('642', '华沁家园', '6164827480', ' 27 ', '4', '80', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('643', '世茂滨江花园', '960631068406', ' 106 ', '8', '406', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('644', '名都城(公寓)', '64899253280', ' 25 ', '3', '280', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('645', '玉兰香苑', '51205282105', ' 28 ', '2', '105', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('646', '海洲桃花园', '3856724486', ' 24 ', '4', '86', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('647', '浦江宝邸', '3623314759', ' 14 ', '7', '59', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('648', '绿川新苑', '51777514126', ' 51 ', '4', '126', '2018-01-27');
INSERT INTO `t_lianjia_housingestate` VALUES ('649', '润渡佳苑', '2579312128', ' 12 ', '1', '28', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('650', '花木苑', '78794294109', ' 29 ', '4', '109', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('651', '中远两湾城', '72667122201116', ' 122 ', '20', '1116', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('652', '浦发绿城', '51683845259', ' 84 ', '5', '259', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('653', '明天华城', '51805264196', ' 26 ', '4', '196', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('654', '金地自在城4', '37844352179', ' 35 ', '2', '179', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('655', '上海康城', '3770413227769', ' 132 ', '27', '769', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('656', '富友嘉园', '388463410155', ' 34 ', '10', '155', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('657', '金色西郊城', '40443275122', ' 27 ', '5', '122', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('658', '朗庭上郡苑(公寓)', '4274325137', ' 25 ', '1', '37', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('659', '华沁家园', '6164827483', ' 27 ', '4', '83', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('660', '世茂滨江花园', '959711068427', ' 106 ', '8', '427', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('661', '名都城(公寓)', '64899253277', ' 25 ', '3', '277', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('662', '玉兰香苑', '51221263113', ' 26 ', '3', '113', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('663', '海洲桃花园', '3856724595', ' 24 ', '5', '95', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('664', '浦江宝邸', '3623314861', ' 14 ', '8', '61', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('665', '绿川新苑', '51777514129', ' 51 ', '4', '129', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('666', '润渡佳苑', '2579312128', ' 12 ', '1', '28', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('667', '花木苑', '78794294109', ' 29 ', '4', '109', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('668', '中远两湾城', '72667123201116', ' 123 ', '20', '1116', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('669', '浦发绿城', '51683845259', ' 84 ', '5', '259', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('670', '明天华城', '51805264196', ' 26 ', '4', '196', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('671', '金地自在城4', '37844352179', ' 35 ', '2', '179', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('672', '上海康城', '3770413127769', ' 132 ', '27', '769', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('673', '富友嘉园', '388463410155', ' 34 ', '10', '155', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('674', '金色西郊城', '40443285122', ' 28 ', '5', '122', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('675', '朗庭上郡苑(公寓)', '4274325137', ' 25 ', '1', '37', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('676', '华沁家园', '6164827483', ' 27 ', '4', '83', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('677', '世茂滨江花园', '959711068427', ' 106 ', '8', '427', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('678', '名都城(公寓)', '64899253277', ' 25 ', '3', '277', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('679', '玉兰香苑', '51221263113', ' 26 ', '3', '113', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('680', '海洲桃花园', '3856724595', ' 24 ', '5', '95', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('681', '浦江宝邸', '3623314861', ' 14 ', '8', '61', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('682', '绿川新苑', '51777514129', ' 51 ', '4', '129', '2018-01-28');
INSERT INTO `t_lianjia_housingestate` VALUES ('683', '润渡佳苑', '2579312126', ' 12 ', '1', '26', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('684', '花木苑', '78751294115', ' 29 ', '4', '115', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('685', '中远两湾城', '72663123211137', ' 123 ', '21', '1137', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('686', '浦发绿城', '51683845269', ' 84 ', '5', '269', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('687', '明天华城', '51825264207', ' 26 ', '4', '207', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('688', '金地自在城4', '37873352176', ' 35 ', '2', '176', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('689', '上海康城', '3772113227754', ' 132 ', '27', '754', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('690', '富友嘉园', '387573410167', ' 34 ', '10', '167', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('691', '金色西郊城', '40431284127', ' 28 ', '4', '127', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('692', '朗庭上郡苑(公寓)', '4274325142', ' 25 ', '1', '42', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('693', '华沁家园', '6164827484', ' 27 ', '4', '84', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('694', '世茂滨江花园', '959711068447', ' 106 ', '8', '447', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('695', '名都城(公寓)', '64899253276', ' 25 ', '3', '276', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('696', '玉兰香苑', '51221263117', ' 26 ', '3', '117', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('697', '海洲桃花园', '38567245106', ' 24 ', '5', '106', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('698', '浦江宝邸', '3623314860', ' 14 ', '8', '60', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('699', '绿川新苑', '51777515135', ' 51 ', '5', '135', '2018-01-29');
INSERT INTO `t_lianjia_housingestate` VALUES ('700', '润渡佳苑', '2579312126', ' 12 ', '1', '26', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('701', '花木苑', '78751294112', ' 29 ', '4', '112', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('702', '中远两湾城', '72663123211079', ' 123 ', '21', '1079', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('703', '浦发绿城', '51715865263', ' 86 ', '5', '263', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('704', '明天华城', '51865274192', ' 27 ', '4', '192', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('705', '金地自在城4', '37873352155', ' 35 ', '2', '155', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('706', '上海康城', '3768412927735', ' 129 ', '27', '735', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('707', '富友嘉园', '387573410160', ' 34 ', '10', '160', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('708', '金色西郊城', '40431284100', ' 28 ', '4', '100', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('709', '朗庭上郡苑(公寓)', '4274325140', ' 25 ', '1', '40', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('710', '华沁家园', '6171227475', ' 27 ', '4', '75', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('711', '世茂滨江花园', '959711068426', ' 106 ', '8', '426', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('712', '名都城(公寓)', '64899253265', ' 25 ', '3', '265', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('713', '玉兰香苑', '51221263109', ' 26 ', '3', '109', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('714', '海洲桃花园', '38567245102', ' 24 ', '5', '102', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('715', '浦江宝邸', '3623314959', ' 14 ', '9', '59', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('716', '绿川新苑', '51777515124', ' 51 ', '5', '124', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('717', '润渡佳苑', '2579312126', ' 12 ', '1', '26', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('718', '花木苑', '78751294112', ' 29 ', '4', '112', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('719', '中远两湾城', '72663122211079', ' 122 ', '21', '1079', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('720', '浦发绿城', '51715865263', ' 86 ', '5', '263', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('721', '明天华城', '51865274192', ' 27 ', '4', '192', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('722', '金地自在城4', '37873352155', ' 35 ', '2', '155', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('723', '上海康城', '3768412927735', ' 129 ', '27', '735', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('724', '富友嘉园', '387573410160', ' 34 ', '10', '160', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('725', '金色西郊城', '40431284100', ' 28 ', '4', '100', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('726', '朗庭上郡苑(公寓)', '4274325140', ' 25 ', '1', '40', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('727', '华沁家园', '6171226475', ' 26 ', '4', '75', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('728', '世茂滨江花园', '959711068426', ' 106 ', '8', '426', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('729', '名都城(公寓)', '64899253265', ' 25 ', '3', '265', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('730', '玉兰香苑', '51221263109', ' 26 ', '3', '109', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('731', '海洲桃花园', '38567235102', ' 23 ', '5', '102', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('732', '浦江宝邸', '3623314959', ' 14 ', '9', '59', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('733', '绿川新苑', '51777515124', ' 51 ', '5', '124', '2018-01-30');
INSERT INTO `t_lianjia_housingestate` VALUES ('734', '润渡佳苑', '2579312124', ' 12 ', '1', '24', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('735', '花木苑', '7875129497', ' 29 ', '4', '97', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('736', '中远两湾城', '72551121221064', ' 120 ', '22', '1064', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('737', '浦发绿城', '51715865260', ' 86 ', '5', '260', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('738', '明天华城', '51865263187', ' 26 ', '3', '187', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('739', '金地自在城4', '37919352140', ' 34 ', '2', '140', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('740', '上海康城', '3766012627686', ' 126 ', '27', '686', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('741', '富友嘉园', '387293310148', ' 33 ', '10', '148', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('742', '金色西郊城', '4043128491', ' 28 ', '4', '91', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('743', '朗庭上郡苑(公寓)', '4274325135', ' 25 ', '1', '35', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('744', '华沁家园', '6177325474', ' 26 ', '4', '74', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('745', '世茂滨江花园', '959211059409', ' 105 ', '9', '409', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('746', '名都城(公寓)', '64899253257', ' 25 ', '3', '257', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('747', '玉兰香苑', '51221263102', ' 26 ', '3', '102', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('748', '海洲桃花园', '38728225104', ' 22 ', '5', '104', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('749', '浦江宝邸', '3623315952', ' 15 ', '9', '52', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('750', '绿川新苑', '51777515120', ' 51 ', '5', '120', '2018-01-31');
INSERT INTO `t_lianjia_housingestate` VALUES ('751', '润渡佳苑', '2579312124', ' 12 ', '1', '24', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('752', '花木苑', '7875129495', ' 29 ', '4', '95', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('753', '中远两湾城', '72555119211082', ' 119 ', '21', '1082', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('754', '浦发绿城', '51747856256', ' 85 ', '6', '256', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('755', '明天华城', '51731263181', ' 26 ', '3', '181', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('756', '金地自在城4', '37594342130', ' 34 ', '2', '130', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('757', '上海康城', '3761712626642', ' 126 ', '26', '642', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('758', '富友嘉园', '387683410142', ' 34 ', '10', '142', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('759', '金色西郊城', '4043128485', ' 28 ', '4', '85', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('760', '朗庭上郡苑(公寓)', '4274325135', ' 25 ', '1', '35', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('761', '华沁家园', '6183526477', ' 26 ', '4', '77', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('762', '世茂滨江花园', '959211059412', ' 105 ', '9', '412', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('763', '名都城(公寓)', '65093243247', ' 24 ', '3', '247', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('764', '玉兰香苑', '51154253100', ' 25 ', '3', '100', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('765', '海洲桃花园', '38728225104', ' 22 ', '5', '104', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('766', '浦江宝邸', '3621915951', ' 15 ', '9', '51', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('767', '绿川新苑', '51777515121', ' 51 ', '5', '121', '2018-02-01');
INSERT INTO `t_lianjia_housingestate` VALUES ('768', '润渡佳苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('769', '花木苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('770', '中远两湾城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('771', '浦发绿城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('772', '明天华城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('773', '金地自在城4', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('774', '上海康城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('775', '富友嘉园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('776', '金色西郊城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('777', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('778', '华沁家园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('779', '世茂滨江花园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('780', '名都城(公寓)', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('781', '玉兰香苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('782', '海洲桃花园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('783', '浦江宝邸', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('784', '绿川新苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('785', '润渡佳苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('786', '花木苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('787', '中远两湾城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('788', '浦发绿城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('789', '明天华城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('790', '金地自在城4', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('791', '上海康城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('792', '富友嘉园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('793', '金色西郊城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('794', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('795', '华沁家园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('796', '世茂滨江花园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('797', '名都城(公寓)', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('798', '玉兰香苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('799', '海洲桃花园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('800', '浦江宝邸', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('801', '绿川新苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('802', '润渡佳苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('803', '花木苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('804', '中远两湾城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('805', '浦发绿城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('806', '明天华城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('807', '金地自在城4', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('808', '上海康城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('809', '富友嘉园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('810', '金色西郊城', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('811', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('812', '华沁家园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('813', '世茂滨江花园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('814', '名都城(公寓)', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('815', '玉兰香苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('816', '海洲桃花园', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('817', '浦江宝邸', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('818', '绿川新苑', '', '', '', '', '2018-02-02');
INSERT INTO `t_lianjia_housingestate` VALUES ('819', '润渡佳苑', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('820', '花木苑', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('821', '中远两湾城', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('822', '浦发绿城', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('823', '明天华城', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('824', '金地自在城4', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('825', '上海康城', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('826', '富友嘉园', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('827', '金色西郊城', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('828', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('829', '华沁家园', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('830', '世茂滨江花园', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('831', '名都城(公寓)', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('832', '玉兰香苑', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('833', '海洲桃花园', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('834', '浦江宝邸', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('835', '绿川新苑', '', '', '', '', '2018-02-04');
INSERT INTO `t_lianjia_housingestate` VALUES ('836', '润渡佳苑', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('837', '花木苑', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('838', '中远两湾城', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('839', '浦发绿城', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('840', '明天华城', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('841', '金地自在城4', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('842', '上海康城', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('843', '富友嘉园', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('844', '金色西郊城', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('845', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('846', '华沁家园', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('847', '世茂滨江花园', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('848', '名都城(公寓)', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('849', '玉兰香苑', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('850', '海洲桃花园', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('851', '浦江宝邸', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('852', '绿川新苑', '', '', '', '', '2018-02-05');
INSERT INTO `t_lianjia_housingestate` VALUES ('853', '润渡佳苑', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('854', '花木苑', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('855', '中远两湾城', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('856', '浦发绿城', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('857', '明天华城', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('858', '金地自在城4', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('859', '上海康城', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('860', '富友嘉园', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('861', '金色西郊城', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('862', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('863', '华沁家园', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('864', '世茂滨江花园', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('865', '名都城(公寓)', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('866', '玉兰香苑', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('867', '海洲桃花园', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('868', '浦江宝邸', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('869', '绿川新苑', '', '', '', '', '2018-02-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('870', '润渡佳苑', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('871', '花木苑', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('872', '中远两湾城', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('873', '浦发绿城', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('874', '明天华城', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('875', '金地自在城4', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('876', '上海康城', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('877', '富友嘉园', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('878', '金色西郊城', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('879', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('880', '华沁家园', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('881', '世茂滨江花园', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('882', '名都城(公寓)', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('883', '玉兰香苑', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('884', '海洲桃花园', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('885', '浦江宝邸', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('886', '绿川新苑', '', '', '', '', '2018-02-07');
INSERT INTO `t_lianjia_housingestate` VALUES ('887', '润渡佳苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('888', '花木苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('889', '中远两湾城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('890', '浦发绿城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('891', '明天华城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('892', '金地自在城4', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('893', '上海康城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('894', '富友嘉园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('895', '金色西郊城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('896', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('897', '华沁家园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('898', '世茂滨江花园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('899', '名都城(公寓)', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('900', '玉兰香苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('901', '海洲桃花园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('902', '浦江宝邸', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('903', '绿川新苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('904', '润渡佳苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('905', '花木苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('906', '中远两湾城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('907', '浦发绿城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('908', '明天华城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('909', '金地自在城4', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('910', '上海康城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('911', '富友嘉园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('912', '金色西郊城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('913', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('914', '华沁家园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('915', '世茂滨江花园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('916', '名都城(公寓)', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('917', '玉兰香苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('918', '海洲桃花园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('919', '浦江宝邸', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('920', '绿川新苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('921', '润渡佳苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('922', '花木苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('923', '中远两湾城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('924', '浦发绿城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('925', '明天华城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('926', '金地自在城4', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('927', '上海康城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('928', '富友嘉园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('929', '金色西郊城', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('930', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('931', '华沁家园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('932', '世茂滨江花园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('933', '名都城(公寓)', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('934', '玉兰香苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('935', '海洲桃花园', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('936', '浦江宝邸', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('937', '绿川新苑', '', '', '', '', '2018-02-08');
INSERT INTO `t_lianjia_housingestate` VALUES ('938', '润渡佳苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('939', '花木苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('940', '中远两湾城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('941', '浦发绿城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('942', '明天华城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('943', '金地自在城4', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('944', '上海康城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('945', '富友嘉园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('946', '金色西郊城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('947', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('948', '华沁家园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('949', '世茂滨江花园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('950', '名都城(公寓)', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('951', '玉兰香苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('952', '海洲桃花园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('953', '浦江宝邸', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('954', '绿川新苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('955', '润渡佳苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('956', '花木苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('957', '中远两湾城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('958', '浦发绿城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('959', '明天华城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('960', '金地自在城4', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('961', '上海康城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('962', '富友嘉园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('963', '金色西郊城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('964', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('965', '华沁家园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('966', '世茂滨江花园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('967', '名都城(公寓)', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('968', '玉兰香苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('969', '海洲桃花园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('970', '浦江宝邸', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('971', '绿川新苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('972', '润渡佳苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('973', '花木苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('974', '中远两湾城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('975', '浦发绿城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('976', '明天华城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('977', '金地自在城4', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('978', '上海康城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('979', '富友嘉园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('980', '金色西郊城', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('981', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('982', '华沁家园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('983', '世茂滨江花园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('984', '名都城(公寓)', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('985', '玉兰香苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('986', '海洲桃花园', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('987', '浦江宝邸', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('988', '绿川新苑', '', '', '', '', '2018-02-09');
INSERT INTO `t_lianjia_housingestate` VALUES ('989', '润渡佳苑', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('990', '花木苑', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('991', '中远两湾城', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('992', '浦发绿城', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('993', '明天华城', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('994', '金地自在城4', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('995', '上海康城', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('996', '富友嘉园', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('997', '金色西郊城', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('998', '朗庭上郡苑(公寓)', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('999', '华沁家园', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('1000', '世茂滨江花园', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('1001', '名都城(公寓)', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('1002', '玉兰香苑', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('1003', '海洲桃花园', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('1004', '浦江宝邸', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('1005', '绿川新苑', '', '', '', '', '2018-02-10');
INSERT INTO `t_lianjia_housingestate` VALUES ('1006', '润渡佳苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1007', '花木苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1008', '中远两湾城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1009', '浦发绿城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1010', '明天华城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1011', '金地自在城4', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1012', '上海康城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1013', '富友嘉园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1014', '金色西郊城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1015', '朗庭上郡苑(公寓)', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1016', '华沁家园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1017', '世茂滨江花园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1018', '名都城(公寓)', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1019', '玉兰香苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1020', '海洲桃花园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1021', '浦江宝邸', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1022', '绿川新苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1023', '润渡佳苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1024', '花木苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1025', '中远两湾城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1026', '浦发绿城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1027', '明天华城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1028', '金地自在城4', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1029', '上海康城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1030', '富友嘉园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1031', '金色西郊城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1032', '朗庭上郡苑(公寓)', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1033', '华沁家园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1034', '世茂滨江花园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1035', '名都城(公寓)', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1036', '玉兰香苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1037', '海洲桃花园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1038', '浦江宝邸', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1039', '绿川新苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1040', '润渡佳苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1041', '花木苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1042', '中远两湾城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1043', '浦发绿城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1044', '明天华城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1045', '金地自在城4', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1046', '上海康城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1047', '富友嘉园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1048', '金色西郊城', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1049', '朗庭上郡苑(公寓)', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1050', '华沁家园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1051', '世茂滨江花园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1052', '名都城(公寓)', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1053', '玉兰香苑', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1054', '海洲桃花园', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1055', '浦江宝邸', '', '', '', '', '2018-07-06');
INSERT INTO `t_lianjia_housingestate` VALUES ('1056', '绿川新苑', '', '', '', '', '2018-07-06');

-- ----------------------------
-- Table structure for `t_taobao_auction`
-- ----------------------------
DROP TABLE IF EXISTS `t_taobao_auction`;
CREATE TABLE `t_taobao_auction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantonid` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `jingdong_num` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_taobao_auction
-- ----------------------------
INSERT INTO `t_taobao_auction` VALUES ('6', '110000', '96', '0000000000', '2017-07-28');
INSERT INTO `t_taobao_auction` VALUES ('7', '110000', '99', '0000000000', '2017-07-29');
INSERT INTO `t_taobao_auction` VALUES ('8', '110000', '98', '0000000000', '2017-07-30');
INSERT INTO `t_taobao_auction` VALUES ('9', '110000', '94', '0000000000', '2017-07-31');
INSERT INTO `t_taobao_auction` VALUES ('11', '110000', '95', '0000000000', '2017-08-01');
INSERT INTO `t_taobao_auction` VALUES ('13', '110000', '99', '0000000000', '2017-08-02');
INSERT INTO `t_taobao_auction` VALUES ('15', '110000', '99', '0000000000', '2017-08-03');
INSERT INTO `t_taobao_auction` VALUES ('18', '110000', '103', '0000000000', '2017-08-04');
INSERT INTO `t_taobao_auction` VALUES ('19', '110000', '102', '0000000000', '2017-08-05');
INSERT INTO `t_taobao_auction` VALUES ('21', '110000', '101', '0000000000', '2017-08-07');
INSERT INTO `t_taobao_auction` VALUES ('23', '110000', '104', '0000000000', '2017-08-08');
INSERT INTO `t_taobao_auction` VALUES ('25', '110000', '108', '0000000000', '2017-08-09');
INSERT INTO `t_taobao_auction` VALUES ('30', '110000', '100', '0000000000', '2017-08-10');
INSERT INTO `t_taobao_auction` VALUES ('31', '110000', '100', '0000000000', '2017-08-11');
INSERT INTO `t_taobao_auction` VALUES ('33', '110000', '99', '0000000000', '2017-08-12');
INSERT INTO `t_taobao_auction` VALUES ('34', '110000', '98', '0000000000', '2017-08-13');
INSERT INTO `t_taobao_auction` VALUES ('35', '110000', '88', '0000000000', '2017-08-14');
INSERT INTO `t_taobao_auction` VALUES ('38', '110000', '90', '0000000000', '2017-08-15');
INSERT INTO `t_taobao_auction` VALUES ('41', '110000', '94', '0000000000', '2017-08-16');
INSERT INTO `t_taobao_auction` VALUES ('42', '110000', '94', '0000000000', '2017-08-17');
INSERT INTO `t_taobao_auction` VALUES ('43', '110000', '97', '0000000000', '2017-08-18');
INSERT INTO `t_taobao_auction` VALUES ('45', '110000', '103', '0000000000', '2017-08-19');
INSERT INTO `t_taobao_auction` VALUES ('46', '110000', '103', '0000000000', '2017-08-20');
INSERT INTO `t_taobao_auction` VALUES ('47', '110000', '102', '0000000000', '2017-08-21');
INSERT INTO `t_taobao_auction` VALUES ('48', '110000', '94', '0000000000', '2017-08-22');
INSERT INTO `t_taobao_auction` VALUES ('50', '110000', '106', '0000000000', '2017-08-23');
INSERT INTO `t_taobao_auction` VALUES ('52', '110000', '104', '0000000000', '2017-08-24');
INSERT INTO `t_taobao_auction` VALUES ('54', '110000', '126', '0000000000', '2017-08-25');
INSERT INTO `t_taobao_auction` VALUES ('55', '110000', '133', '0000000000', '2017-08-26');
INSERT INTO `t_taobao_auction` VALUES ('57', '110000', '132', '0000000000', '2017-08-27');
INSERT INTO `t_taobao_auction` VALUES ('59', '110000', '125', '0000000000', '2017-08-28');
INSERT INTO `t_taobao_auction` VALUES ('65', '110000', '128', '0000000000', '2017-08-29');
INSERT INTO `t_taobao_auction` VALUES ('66', '110000', '129', '0000000000', '2017-08-30');
INSERT INTO `t_taobao_auction` VALUES ('67', '110000', '129', '0000000000', '2017-08-31');
INSERT INTO `t_taobao_auction` VALUES ('68', '110000', '133', '0000000000', '2017-09-01');
INSERT INTO `t_taobao_auction` VALUES ('69', '110000', '131', '0000000000', '2017-09-02');
INSERT INTO `t_taobao_auction` VALUES ('71', '110000', '130', '0000000000', '2017-09-03');
INSERT INTO `t_taobao_auction` VALUES ('72', '110000', '131', '0000000000', '2017-09-04');
INSERT INTO `t_taobao_auction` VALUES ('73', '110000', '128', '0000000000', '2017-09-05');
INSERT INTO `t_taobao_auction` VALUES ('75', '110000', '130', '0000000000', '2017-09-06');
INSERT INTO `t_taobao_auction` VALUES ('76', '110000', '134', '0000000000', '2017-09-07');
INSERT INTO `t_taobao_auction` VALUES ('77', '110000', '133', '0000000000', '2017-09-08');
INSERT INTO `t_taobao_auction` VALUES ('78', '110000', '130', '0000000000', '2017-09-09');
INSERT INTO `t_taobao_auction` VALUES ('79', '110000', '129', '0000000000', '2017-09-10');
INSERT INTO `t_taobao_auction` VALUES ('80', '110000', '129', '0000000000', '2017-09-11');
INSERT INTO `t_taobao_auction` VALUES ('81', '110000', '120', '0000000000', '2017-09-12');
INSERT INTO `t_taobao_auction` VALUES ('82', '110000', '122', '0000000000', '2017-09-13');
INSERT INTO `t_taobao_auction` VALUES ('83', '110000', '126', '0000000000', '2017-09-14');
INSERT INTO `t_taobao_auction` VALUES ('84', '110000', '127', '0000000000', '2017-09-15');
INSERT INTO `t_taobao_auction` VALUES ('85', '110000', '131', '0000000000', '2017-09-16');
INSERT INTO `t_taobao_auction` VALUES ('86', '110000', '131', '0000000000', '2017-09-17');
INSERT INTO `t_taobao_auction` VALUES ('87', '110000', '125', '0000000000', '2017-09-18');
INSERT INTO `t_taobao_auction` VALUES ('88', '110000', '131', '0000000000', '2017-09-19');
INSERT INTO `t_taobao_auction` VALUES ('89', '110000', '136', '0000000000', '2017-09-20');
INSERT INTO `t_taobao_auction` VALUES ('90', '110000', '140', '0000000000', '2017-09-21');
INSERT INTO `t_taobao_auction` VALUES ('91', '110000', '138', '0000000000', '2017-09-22');
INSERT INTO `t_taobao_auction` VALUES ('92', '110000', '131', '0000000000', '2017-09-23');
INSERT INTO `t_taobao_auction` VALUES ('93', '110000', '131', '0000000000', '2017-09-25');
INSERT INTO `t_taobao_auction` VALUES ('94', '110000', '124', '0000000000', '2017-09-26');
INSERT INTO `t_taobao_auction` VALUES ('95', '110000', '108', '0000000000', '2017-09-27');
INSERT INTO `t_taobao_auction` VALUES ('100', '110000', '95', '0000000000', '2017-09-29');
INSERT INTO `t_taobao_auction` VALUES ('101', '110000', '106', '0000000000', '2017-09-30');
INSERT INTO `t_taobao_auction` VALUES ('102', '110000', '110', '0000000000', '2017-10-01');
INSERT INTO `t_taobao_auction` VALUES ('103', '110000', '111', '0000000000', '2017-10-02');
INSERT INTO `t_taobao_auction` VALUES ('104', '110000', '108', '0000000000', '2017-10-03');
INSERT INTO `t_taobao_auction` VALUES ('105', '110000', '108', '0000000000', '2017-10-04');
INSERT INTO `t_taobao_auction` VALUES ('106', '110000', '108', '0000000000', '2017-10-05');
INSERT INTO `t_taobao_auction` VALUES ('107', '110000', '106', '0000000000', '2017-10-06');
INSERT INTO `t_taobao_auction` VALUES ('108', '110000', '105', '0000000000', '2017-10-07');
INSERT INTO `t_taobao_auction` VALUES ('110', '110000', '102', '0000000000', '2017-10-08');
INSERT INTO `t_taobao_auction` VALUES ('111', '110000', '102', '0000000000', '2017-10-09');
INSERT INTO `t_taobao_auction` VALUES ('113', '110000', '85', '0000000000', '2017-10-10');
INSERT INTO `t_taobao_auction` VALUES ('114', '110000', '87', '0000000000', '2017-10-11');
INSERT INTO `t_taobao_auction` VALUES ('115', '110000', '91', '0000000000', '2017-10-12');
INSERT INTO `t_taobao_auction` VALUES ('116', '110000', '90', '0000000000', '2017-10-13');
INSERT INTO `t_taobao_auction` VALUES ('117', '110000', '91', '0000000000', '2017-10-14');
INSERT INTO `t_taobao_auction` VALUES ('118', '110000', '86', '0000000000', '2017-10-15');
INSERT INTO `t_taobao_auction` VALUES ('119', '110000', '72', '0000000000', '2017-10-16');
INSERT INTO `t_taobao_auction` VALUES ('120', '110000', '77', '0000000000', '2017-10-17');
INSERT INTO `t_taobao_auction` VALUES ('122', '110000', '83', '0000000000', '2017-10-18');
INSERT INTO `t_taobao_auction` VALUES ('123', '110000', '79', '0000000000', '2017-10-19');
INSERT INTO `t_taobao_auction` VALUES ('124', '110000', '81', '0000000000', '2017-10-20');
INSERT INTO `t_taobao_auction` VALUES ('125', '110000', '85', '0000000000', '2017-10-21');
INSERT INTO `t_taobao_auction` VALUES ('126', '110000', '86', '0000000000', '2017-10-22');
INSERT INTO `t_taobao_auction` VALUES ('127', '110000', '87', '0000000000', '2017-10-23');
INSERT INTO `t_taobao_auction` VALUES ('128', '110000', '83', '0000000000', '2017-10-24');
INSERT INTO `t_taobao_auction` VALUES ('129', '110000', '82', '0000000000', '2017-10-25');
INSERT INTO `t_taobao_auction` VALUES ('130', '110000', '88', '0000000000', '2017-10-26');
INSERT INTO `t_taobao_auction` VALUES ('131', '110000', '91', '0000000000', '2017-10-27');
INSERT INTO `t_taobao_auction` VALUES ('132', '110000', '90', '0000000000', '2017-10-29');
INSERT INTO `t_taobao_auction` VALUES ('133', '110000', '87', '0000000000', '2017-10-30');
INSERT INTO `t_taobao_auction` VALUES ('134', '110000', '86', '0000000000', '2017-10-31');
INSERT INTO `t_taobao_auction` VALUES ('135', '110000', '87', '0000000000', '2017-11-01');
INSERT INTO `t_taobao_auction` VALUES ('136', '110000', '83', '0000000000', '2017-11-02');
INSERT INTO `t_taobao_auction` VALUES ('137', '110000', '86', '0000000000', '2017-11-03');
INSERT INTO `t_taobao_auction` VALUES ('138', '110000', '88', '0000000000', '2017-11-04');
INSERT INTO `t_taobao_auction` VALUES ('140', '110000', '83', '0000000000', '2017-11-05');
INSERT INTO `t_taobao_auction` VALUES ('141', '110000', '83', '0000000000', '2017-11-06');
INSERT INTO `t_taobao_auction` VALUES ('143', '110000', '89', '0000000000', '2017-11-07');
INSERT INTO `t_taobao_auction` VALUES ('144', '110000', '90', '0000000000', '2017-11-08');
INSERT INTO `t_taobao_auction` VALUES ('146', '110000', '92', '0000000000', '2017-11-09');
INSERT INTO `t_taobao_auction` VALUES ('148', '110000', '94', '0000000000', '2017-11-10');
INSERT INTO `t_taobao_auction` VALUES ('149', '110000', '103', '0000000000', '2017-11-11');
INSERT INTO `t_taobao_auction` VALUES ('150', '110000', '102', '0000000000', '2017-11-12');
INSERT INTO `t_taobao_auction` VALUES ('152', '110000', '96', '0000000000', '2017-11-13');
INSERT INTO `t_taobao_auction` VALUES ('153', '110000', '98', '0000000000', '2017-11-14');
INSERT INTO `t_taobao_auction` VALUES ('154', '110000', '102', '0000000000', '2017-11-15');
INSERT INTO `t_taobao_auction` VALUES ('156', '110000', '110', '0000000000', '2017-11-16');
INSERT INTO `t_taobao_auction` VALUES ('159', '110000', '118', '0000000000', '2017-11-17');
INSERT INTO `t_taobao_auction` VALUES ('160', '110000', '117', '0000000000', '2017-11-18');
INSERT INTO `t_taobao_auction` VALUES ('161', '110000', '116', '0000000000', '2017-11-19');
INSERT INTO `t_taobao_auction` VALUES ('162', '110000', '109', '0000000000', '2017-11-20');
INSERT INTO `t_taobao_auction` VALUES ('164', '110000', '106', '0000000000', '2017-11-21');
INSERT INTO `t_taobao_auction` VALUES ('165', '110000', '110', '0000000000', '2017-11-22');
INSERT INTO `t_taobao_auction` VALUES ('166', '110000', '109', '0000000000', '2017-11-23');
INSERT INTO `t_taobao_auction` VALUES ('167', '110000', '108', '0000000000', '2017-11-24');
INSERT INTO `t_taobao_auction` VALUES ('168', '110000', '108', '0000000000', '2017-11-25');
INSERT INTO `t_taobao_auction` VALUES ('170', '110000', '107', '0000000000', '2017-11-26');
INSERT INTO `t_taobao_auction` VALUES ('171', '110000', '93', '0000000000', '2017-11-27');
INSERT INTO `t_taobao_auction` VALUES ('172', '110000', '97', '0000000000', '2017-11-28');
INSERT INTO `t_taobao_auction` VALUES ('174', '110000', '94', '0000000000', '2017-11-29');
INSERT INTO `t_taobao_auction` VALUES ('176', '110000', '113', '0000000000', '2017-11-30');
INSERT INTO `t_taobao_auction` VALUES ('178', '110000', '113', '0000000000', '2017-12-01');
INSERT INTO `t_taobao_auction` VALUES ('180', '110000', '125', '0000000000', '2017-12-02');
INSERT INTO `t_taobao_auction` VALUES ('181', '110000', '124', '0000000000', '2017-12-03');
INSERT INTO `t_taobao_auction` VALUES ('182', '110000', '121', '0000000000', '2017-12-04');
INSERT INTO `t_taobao_auction` VALUES ('184', '110000', '123', '0000000000', '2017-12-05');
INSERT INTO `t_taobao_auction` VALUES ('185', '110000', '122', '0000000000', '2017-12-06');
INSERT INTO `t_taobao_auction` VALUES ('186', '110000', '119', '0000000000', '2017-12-07');
INSERT INTO `t_taobao_auction` VALUES ('187', '110000', '116', '0000000000', '2017-12-08');
INSERT INTO `t_taobao_auction` VALUES ('188', '110000', '118', '0000000000', '2017-12-09');
INSERT INTO `t_taobao_auction` VALUES ('191', '110000', '117', '0000000000', '2017-12-10');
INSERT INTO `t_taobao_auction` VALUES ('192', '110000', '109', '0000000000', '2017-12-11');
INSERT INTO `t_taobao_auction` VALUES ('194', '110000', '111', '0000000000', '2017-12-12');
INSERT INTO `t_taobao_auction` VALUES ('196', '110000', '110', '0000000000', '2017-12-13');
INSERT INTO `t_taobao_auction` VALUES ('198', '110000', '111', '0000000000', '2017-12-14');
INSERT INTO `t_taobao_auction` VALUES ('199', '110000', '108', '0000000000', '2017-12-15');
INSERT INTO `t_taobao_auction` VALUES ('201', '110000', '112', '0000000000', '2017-12-16');
INSERT INTO `t_taobao_auction` VALUES ('206', '110000', '110', '0000000000', '2017-12-17');
INSERT INTO `t_taobao_auction` VALUES ('207', '110000', '100', '0000000000', '2017-12-18');
INSERT INTO `t_taobao_auction` VALUES ('208', '110000', '101', '0000000000', '2017-12-19');
INSERT INTO `t_taobao_auction` VALUES ('211', '110000', '102', '0000000000', '2017-12-20');
INSERT INTO `t_taobao_auction` VALUES ('214', '110000', '106', '0000000000', '2017-12-21');
INSERT INTO `t_taobao_auction` VALUES ('215', '110000', '110', '0000000000', '2017-12-22');
INSERT INTO `t_taobao_auction` VALUES ('217', '110000', '111', '0000000000', '2017-12-23');
INSERT INTO `t_taobao_auction` VALUES ('218', '110000', '110', '0000000000', '2017-12-24');
INSERT INTO `t_taobao_auction` VALUES ('221', '110000', '102', '0000000000', '2017-12-25');
INSERT INTO `t_taobao_auction` VALUES ('223', '110000', '107', '0000000000', '2017-12-26');
INSERT INTO `t_taobao_auction` VALUES ('224', '110000', '107', '0000000000', '2017-12-27');
INSERT INTO `t_taobao_auction` VALUES ('225', '110000', '115', '0000000000', '2017-12-28');
INSERT INTO `t_taobao_auction` VALUES ('226', '110000', '108', '0000000000', '2017-12-29');
INSERT INTO `t_taobao_auction` VALUES ('227', '110000', '113', '0000000000', '2017-12-30');
INSERT INTO `t_taobao_auction` VALUES ('229', '110000', '110', '0000000000', '2017-12-31');
INSERT INTO `t_taobao_auction` VALUES ('231', '110000', '108', '0000000000', '2018-01-01');
INSERT INTO `t_taobao_auction` VALUES ('232', '110000', '108', '0000000000', '2018-01-02');
INSERT INTO `t_taobao_auction` VALUES ('233', '110000', '104', '0000000000', '2018-01-03');
INSERT INTO `t_taobao_auction` VALUES ('234', '110000', '102', '0000000000', '2018-01-04');
INSERT INTO `t_taobao_auction` VALUES ('235', '110000', '103', '0000000000', '2018-01-05');
INSERT INTO `t_taobao_auction` VALUES ('236', '110000', '106', '0000000000', '2018-01-06');
INSERT INTO `t_taobao_auction` VALUES ('237', '110000', '106', '0000000000', '2018-01-07');
INSERT INTO `t_taobao_auction` VALUES ('238', '110000', '101', '0000000000', '2018-01-08');
INSERT INTO `t_taobao_auction` VALUES ('240', '110000', '102', '0000000000', '2018-01-09');
INSERT INTO `t_taobao_auction` VALUES ('241', '110000', '102', '0000000000', '2018-01-10');
INSERT INTO `t_taobao_auction` VALUES ('242', '110000', '112', '0000000000', '2018-01-11');
INSERT INTO `t_taobao_auction` VALUES ('244', '110000', '119', '0000000000', '2018-01-12');
INSERT INTO `t_taobao_auction` VALUES ('245', '110000', '114', '0000000000', '2018-01-15');
INSERT INTO `t_taobao_auction` VALUES ('246', '110000', '119', '0000000000', '2018-01-17');
INSERT INTO `t_taobao_auction` VALUES ('247', '110000', '122', '0000000000', '2018-01-18');
INSERT INTO `t_taobao_auction` VALUES ('249', '110000', '125', '0000000000', '2018-01-19');
INSERT INTO `t_taobao_auction` VALUES ('250', '110000', '124', '0000000000', '2018-01-20');
INSERT INTO `t_taobao_auction` VALUES ('251', '110000', '121', '0000000000', '2018-01-21');
INSERT INTO `t_taobao_auction` VALUES ('252', '110000', '116', '0000000000', '2018-01-22');
INSERT INTO `t_taobao_auction` VALUES ('253', '110000', '111', '0000000000', '2018-01-23');
INSERT INTO `t_taobao_auction` VALUES ('254', '110000', '109', '0000000000', '2018-01-24');
INSERT INTO `t_taobao_auction` VALUES ('256', '110000', '115', '0000000000', '2018-01-25');
INSERT INTO `t_taobao_auction` VALUES ('257', '110000', '123', '0000000000', '2018-01-26');
INSERT INTO `t_taobao_auction` VALUES ('258', '110000', '121', '0000000000', '2018-01-27');
INSERT INTO `t_taobao_auction` VALUES ('260', '110000', '118', '0000000000', '2018-01-28');
INSERT INTO `t_taobao_auction` VALUES ('261', '110000', '118', '0000000000', '2018-01-29');
INSERT INTO `t_taobao_auction` VALUES ('263', '110000', '111', '0000000000', '2018-01-30');
INSERT INTO `t_taobao_auction` VALUES ('264', '110000', '117', '0000000000', '2018-01-31');
INSERT INTO `t_taobao_auction` VALUES ('265', '110000', '113', '0000000000', '2018-02-01');
INSERT INTO `t_taobao_auction` VALUES ('269', '110000', '122', '0000000000', '2018-02-02');
INSERT INTO `t_taobao_auction` VALUES ('270', '110000', '118', '0000000000', '2018-02-04');
INSERT INTO `t_taobao_auction` VALUES ('271', '110000', '112', '0000000000', '2018-02-05');
INSERT INTO `t_taobao_auction` VALUES ('273', '110000', '110', '0000000000', '2018-02-06');
INSERT INTO `t_taobao_auction` VALUES ('274', '110000', '111', '0000000000', '2018-02-07');
INSERT INTO `t_taobao_auction` VALUES ('277', '110000', '115', '0000000000', '2018-02-08');
INSERT INTO `t_taobao_auction` VALUES ('280', '110000', '119', '0000000000', '2018-02-09');
INSERT INTO `t_taobao_auction` VALUES ('286', '110000', '118', '0000000000', '2018-02-10');
INSERT INTO `t_taobao_auction` VALUES ('287', '110000', '125', '0000000000', '2018-02-11');
INSERT INTO `t_taobao_auction` VALUES ('288', '110000', '125', '0000000000', '2018-02-12');
INSERT INTO `t_taobao_auction` VALUES ('289', '110000', '129', '0000000000', '2018-02-13');
INSERT INTO `t_taobao_auction` VALUES ('290', '110000', '131', '0000000000', '2018-02-14');
INSERT INTO `t_taobao_auction` VALUES ('291', '110000', '125', '0000000000', '2018-02-20');
INSERT INTO `t_taobao_auction` VALUES ('292', '110000', '117', '0000000000', '2018-02-22');
INSERT INTO `t_taobao_auction` VALUES ('297', '110000', '123', '0000000000', '2018-02-23');
INSERT INTO `t_taobao_auction` VALUES ('301', '110000', '121', '0000000000', '2018-02-24');
INSERT INTO `t_taobao_auction` VALUES ('303', '110000', '119', '0000000000', '2018-02-25');
INSERT INTO `t_taobao_auction` VALUES ('305', '110000', '108', '0000000000', '2018-02-26');
INSERT INTO `t_taobao_auction` VALUES ('307', '110000', '108', '0000000000', '2018-02-27');
INSERT INTO `t_taobao_auction` VALUES ('309', '110000', '113', '0000000000', '2018-02-28');
INSERT INTO `t_taobao_auction` VALUES ('312', '110000', '111', '0000000000', '2018-03-01');
INSERT INTO `t_taobao_auction` VALUES ('315', '110000', '119', '0000000000', '2018-03-02');
INSERT INTO `t_taobao_auction` VALUES ('316', '110000', '121', '0000000000', '2018-03-03');
INSERT INTO `t_taobao_auction` VALUES ('318', '110000', '120', '0000000000', '2018-03-04');
INSERT INTO `t_taobao_auction` VALUES ('320', '110000', '126', '0000000000', '2018-03-05');
INSERT INTO `t_taobao_auction` VALUES ('322', '110000', '120', '0000000000', '2018-03-06');
INSERT INTO `t_taobao_auction` VALUES ('326', '110000', '117', '0000000000', '2018-03-07');
INSERT INTO `t_taobao_auction` VALUES ('328', '110000', '116', '0000000000', '2018-03-08');
INSERT INTO `t_taobao_auction` VALUES ('330', '110000', '116', '0000000000', '2018-03-09');
INSERT INTO `t_taobao_auction` VALUES ('331', '110000', '116', '0000000000', '2018-03-10');
INSERT INTO `t_taobao_auction` VALUES ('332', '110000', '115', '0000000000', '2018-03-11');
INSERT INTO `t_taobao_auction` VALUES ('334', '110000', '112', '0000000000', '2018-03-12');
INSERT INTO `t_taobao_auction` VALUES ('338', '110000', '116', '0000000000', '2018-03-13');
INSERT INTO `t_taobao_auction` VALUES ('340', '110000', '122', '0000000000', '2018-03-14');
INSERT INTO `t_taobao_auction` VALUES ('342', '110000', '116', '0000000000', '2018-03-15');
INSERT INTO `t_taobao_auction` VALUES ('344', '110000', '123', '0000000000', '2018-03-16');
INSERT INTO `t_taobao_auction` VALUES ('345', '110000', '124', '0000000000', '2018-03-17');
INSERT INTO `t_taobao_auction` VALUES ('346', '110000', '123', '0000000000', '2018-03-18');
INSERT INTO `t_taobao_auction` VALUES ('349', '110000', '139', '0000000000', '2018-03-19');
INSERT INTO `t_taobao_auction` VALUES ('351', '110000', '141', '0000000000', '2018-03-20');
INSERT INTO `t_taobao_auction` VALUES ('354', '110000', '142', '0000000000', '2018-03-21');
INSERT INTO `t_taobao_auction` VALUES ('356', '110000', '150', '0000000000', '2018-03-22');
INSERT INTO `t_taobao_auction` VALUES ('358', '110000', '151', '0000000000', '2018-03-23');
INSERT INTO `t_taobao_auction` VALUES ('359', '110000', '151', '0000000000', '2018-03-24');
INSERT INTO `t_taobao_auction` VALUES ('361', '110000', '153', '0000000000', '2018-03-25');
INSERT INTO `t_taobao_auction` VALUES ('363', '110000', '152', '0000000000', '2018-03-26');
INSERT INTO `t_taobao_auction` VALUES ('365', '110000', '150', '0000000000', '2018-03-27');
INSERT INTO `t_taobao_auction` VALUES ('368', '110000', '151', '0000000000', '2018-03-28');
INSERT INTO `t_taobao_auction` VALUES ('371', '110000', '144', '0000000000', '2018-03-29');
INSERT INTO `t_taobao_auction` VALUES ('373', '110000', '141', '0000000000', '2018-03-30');
INSERT INTO `t_taobao_auction` VALUES ('374', '110000', '136', '0000000000', '2018-03-31');
INSERT INTO `t_taobao_auction` VALUES ('375', '110000', '135', '0000000000', '2018-04-01');
INSERT INTO `t_taobao_auction` VALUES ('376', '110000', '125', '0000000000', '2018-04-02');
INSERT INTO `t_taobao_auction` VALUES ('377', '110000', '126', '0000000000', '2018-04-03');
INSERT INTO `t_taobao_auction` VALUES ('378', '110000', '130', '0000000000', '2018-04-05');
INSERT INTO `t_taobao_auction` VALUES ('379', '110000', '129', '0000000000', '2018-04-06');
INSERT INTO `t_taobao_auction` VALUES ('380', '110000', '125', '0000000000', '2018-04-07');
INSERT INTO `t_taobao_auction` VALUES ('381', '110000', '119', '0000000000', '2018-04-08');
INSERT INTO `t_taobao_auction` VALUES ('382', '110000', '115', '0000000000', '2018-04-09');
INSERT INTO `t_taobao_auction` VALUES ('384', '110000', '114', '0000000000', '2018-04-10');
INSERT INTO `t_taobao_auction` VALUES ('385', '110000', '113', '0000000000', '2018-04-11');
INSERT INTO `t_taobao_auction` VALUES ('387', '110000', '120', '0000000000', '2018-04-12');
INSERT INTO `t_taobao_auction` VALUES ('388', '110000', '120', '0000000000', '2018-04-13');
INSERT INTO `t_taobao_auction` VALUES ('389', '110000', '121', '0000000000', '2018-04-14');
INSERT INTO `t_taobao_auction` VALUES ('390', '110000', '118', '0000000000', '2018-04-15');
INSERT INTO `t_taobao_auction` VALUES ('392', '110000', '121', '0000000000', '2018-04-16');
INSERT INTO `t_taobao_auction` VALUES ('393', '110000', '119', '0000000000', '2018-04-17');
INSERT INTO `t_taobao_auction` VALUES ('395', '110000', '140', '0000000000', '2018-04-18');
INSERT INTO `t_taobao_auction` VALUES ('396', '110000', '135', '0000000000', '2018-04-19');
INSERT INTO `t_taobao_auction` VALUES ('398', '110000', '141', '0000000000', '2018-04-20');
INSERT INTO `t_taobao_auction` VALUES ('399', '110000', '146', '0000000000', '2018-04-21');
INSERT INTO `t_taobao_auction` VALUES ('401', '110000', '143', '0000000000', '2018-04-22');
INSERT INTO `t_taobao_auction` VALUES ('402', '110000', '135', '0000000000', '2018-04-23');
INSERT INTO `t_taobao_auction` VALUES ('403', '110000', '134', '0000000000', '2018-04-24');
INSERT INTO `t_taobao_auction` VALUES ('406', '110000', '136', '0000000000', '2018-04-25');
INSERT INTO `t_taobao_auction` VALUES ('408', '110000', '140', '0000000000', '2018-04-26');
INSERT INTO `t_taobao_auction` VALUES ('409', '110000', '142', '0000000000', '2018-04-28');
INSERT INTO `t_taobao_auction` VALUES ('410', '110000', '141', '0000000000', '2018-04-29');
INSERT INTO `t_taobao_auction` VALUES ('411', '110000', '141', '0000000000', '2018-04-30');
INSERT INTO `t_taobao_auction` VALUES ('412', '110000', '139', '0000000000', '2018-05-01');
INSERT INTO `t_taobao_auction` VALUES ('413', '110000', '132', '0000000000', '2018-05-03');
INSERT INTO `t_taobao_auction` VALUES ('414', '110000', '138', '0000000000', '2018-05-04');
INSERT INTO `t_taobao_auction` VALUES ('415', '110000', '140', '0000000000', '2018-05-05');
INSERT INTO `t_taobao_auction` VALUES ('416', '110000', '134', '0000000000', '2018-05-06');
INSERT INTO `t_taobao_auction` VALUES ('418', '110000', '126', '0000000000', '2018-05-07');
INSERT INTO `t_taobao_auction` VALUES ('420', '110000', '125', '0000000000', '2018-05-08');
INSERT INTO `t_taobao_auction` VALUES ('421', '110000', '131', '0000000000', '2018-05-09');
INSERT INTO `t_taobao_auction` VALUES ('423', '110000', '141', '0000000000', '2018-05-10');
INSERT INTO `t_taobao_auction` VALUES ('425', '110000', '138', '0000000000', '2018-05-11');
INSERT INTO `t_taobao_auction` VALUES ('426', '110000', '139', '0000000000', '2018-05-12');
INSERT INTO `t_taobao_auction` VALUES ('427', '110000', '139', '0000000000', '2018-05-13');
INSERT INTO `t_taobao_auction` VALUES ('429', '110000', '137', '0000000000', '2018-05-14');
INSERT INTO `t_taobao_auction` VALUES ('430', '110000', '133', '0000000000', '2018-05-15');
INSERT INTO `t_taobao_auction` VALUES ('433', '110000', '141', '0000000000', '2018-05-16');
INSERT INTO `t_taobao_auction` VALUES ('435', '110000', '139', '0000000000', '2018-05-17');
INSERT INTO `t_taobao_auction` VALUES ('437', '110000', '140', '0000000000', '2018-05-18');
INSERT INTO `t_taobao_auction` VALUES ('438', '110000', '130', '0000000000', '2018-05-19');
INSERT INTO `t_taobao_auction` VALUES ('439', '110000', '128', '0000000000', '2018-05-20');
INSERT INTO `t_taobao_auction` VALUES ('442', '110000', '128', '0000000000', '2018-05-21');
INSERT INTO `t_taobao_auction` VALUES ('444', '110000', '134', '0000000000', '2018-05-22');
INSERT INTO `t_taobao_auction` VALUES ('447', '110000', '135', '0000000000', '2018-05-23');
INSERT INTO `t_taobao_auction` VALUES ('451', '110000', '135', '0000000000', '2018-05-24');
INSERT INTO `t_taobao_auction` VALUES ('455', '110000', '141', '0000000000', '2018-05-25');
INSERT INTO `t_taobao_auction` VALUES ('456', '110000', '139', '0000000000', '2018-05-26');
INSERT INTO `t_taobao_auction` VALUES ('457', '110000', '139', '0000000000', '2018-05-27');
INSERT INTO `t_taobao_auction` VALUES ('461', '110000', '135', '0000000000', '2018-05-28');
INSERT INTO `t_taobao_auction` VALUES ('462', '110000', '137', '0000000000', '2018-05-29');
INSERT INTO `t_taobao_auction` VALUES ('465', '110000', '152', '0000000000', '2018-05-30');
INSERT INTO `t_taobao_auction` VALUES ('467', '110000', '164', '0000000000', '2018-05-31');
INSERT INTO `t_taobao_auction` VALUES ('469', '110000', '165', '0000000000', '2018-06-01');
INSERT INTO `t_taobao_auction` VALUES ('471', '110000', '165', '0000000000', '2018-06-02');
INSERT INTO `t_taobao_auction` VALUES ('472', '110000', '164', '0000000000', '2018-06-03');
INSERT INTO `t_taobao_auction` VALUES ('473', '110000', '160', '0000000000', '2018-06-04');
INSERT INTO `t_taobao_auction` VALUES ('474', '110000', '160', '0000000000', '2018-06-05');
INSERT INTO `t_taobao_auction` VALUES ('476', '110000', '162', '0000000000', '2018-06-06');
INSERT INTO `t_taobao_auction` VALUES ('478', '110000', '157', '0000000000', '2018-06-07');
INSERT INTO `t_taobao_auction` VALUES ('481', '110000', '163', '0000000000', '2018-06-08');
INSERT INTO `t_taobao_auction` VALUES ('482', '110000', '165', '0000000000', '2018-06-09');
INSERT INTO `t_taobao_auction` VALUES ('483', '110000', '161', '0000000000', '2018-06-10');
INSERT INTO `t_taobao_auction` VALUES ('486', '110000', '162', '0000000000', '2018-06-11');
INSERT INTO `t_taobao_auction` VALUES ('489', '110000', '175', '0000000000', '2018-06-12');
INSERT INTO `t_taobao_auction` VALUES ('491', '110000', '184', '0000000000', '2018-06-13');
INSERT INTO `t_taobao_auction` VALUES ('492', '110000', '189', '0000000000', '2018-06-14');
INSERT INTO `t_taobao_auction` VALUES ('493', '110000', '185', '0000000000', '2018-06-15');
INSERT INTO `t_taobao_auction` VALUES ('497', '110000', '173', '0000000000', '2018-06-16');
INSERT INTO `t_taobao_auction` VALUES ('498', '110000', '172', '0000000000', '2018-06-17');
INSERT INTO `t_taobao_auction` VALUES ('499', '110000', '166', '0000000000', '2018-06-18');
INSERT INTO `t_taobao_auction` VALUES ('500', '110000', '163', '0000000000', '2018-06-19');
INSERT INTO `t_taobao_auction` VALUES ('503', '110000', '164', '0000000000', '2018-06-20');
INSERT INTO `t_taobao_auction` VALUES ('504', '110000', '165', '0000000000', '2018-06-21');
INSERT INTO `t_taobao_auction` VALUES ('507', '110000', '163', '0000000000', '2018-06-22');
INSERT INTO `t_taobao_auction` VALUES ('508', '110000', '160', '0000000000', '2018-06-23');
INSERT INTO `t_taobao_auction` VALUES ('509', '110000', '159', '0000000000', '2018-06-24');
INSERT INTO `t_taobao_auction` VALUES ('511', '110000', '158', '0000000000', '2018-06-25');
INSERT INTO `t_taobao_auction` VALUES ('512', '110000', '158', '0000000000', '2018-06-26');
INSERT INTO `t_taobao_auction` VALUES ('514', '110000', '173', '0000000000', '2018-06-27');
INSERT INTO `t_taobao_auction` VALUES ('518', '110000', '177', '0000000000', '2018-06-28');
INSERT INTO `t_taobao_auction` VALUES ('520', '110000', '182', '0000000000', '2018-06-29');
INSERT INTO `t_taobao_auction` VALUES ('523', '110000', '192', '0000000000', '2018-06-30');
INSERT INTO `t_taobao_auction` VALUES ('524', '110000', '192', '0000000000', '2018-07-01');
INSERT INTO `t_taobao_auction` VALUES ('528', '110000', '178', '0000000000', '2018-07-02');
INSERT INTO `t_taobao_auction` VALUES ('531', '110000', '179', '0000000000', '2018-07-03');
INSERT INTO `t_taobao_auction` VALUES ('534', '110000', '182', '0000000000', '2018-07-04');
INSERT INTO `t_taobao_auction` VALUES ('538', '110000', '184', '0000000000', '2018-07-05');
INSERT INTO `t_taobao_auction` VALUES ('546', '110000', '190', '0000000033', '2018-07-06');
INSERT INTO `t_taobao_auction` VALUES ('552', '110000', '188', '0000000032', '2018-07-07');
INSERT INTO `t_taobao_auction` VALUES ('554', '110000', '188', '0000000032', '2018-07-08');
INSERT INTO `t_taobao_auction` VALUES ('557', '110000', '195', '0000000031', '2018-07-09');
INSERT INTO `t_taobao_auction` VALUES ('560', '110000', '199', '0000000032', '2018-07-10');
INSERT INTO `t_taobao_auction` VALUES ('563', '110000', '204', '0000000036', '2018-07-11');
INSERT INTO `t_taobao_auction` VALUES ('566', '110000', '206', '0000000037', '2018-07-12');
INSERT INTO `t_taobao_auction` VALUES ('570', '110000', '208', '0000000037', '2018-07-13');
INSERT INTO `t_taobao_auction` VALUES ('573', '110000', '202', '0000000037', '2018-07-14');
INSERT INTO `t_taobao_auction` VALUES ('575', '110000', '201', '0000000034', '2018-07-15');
INSERT INTO `t_taobao_auction` VALUES ('578', '110000', '202', '0000000034', '2018-07-16');
INSERT INTO `t_taobao_auction` VALUES ('580', '110000', '205', '0000000034', '2018-07-17');
INSERT INTO `t_taobao_auction` VALUES ('584', '110000', '218', '0000000039', '2018-07-18');
INSERT INTO `t_taobao_auction` VALUES ('588', '110000', '216', '0000000040', '2018-07-19');
INSERT INTO `t_taobao_auction` VALUES ('591', '110000', '224', '0000000039', '2018-07-20');
INSERT INTO `t_taobao_auction` VALUES ('594', '110000', '225', '0000000039', '2018-07-21');
INSERT INTO `t_taobao_auction` VALUES ('597', '110000', '222', '0000000039', '2018-07-22');
INSERT INTO `t_taobao_auction` VALUES ('600', '110000', '215', '0000000040', '2018-07-23');
INSERT INTO `t_taobao_auction` VALUES ('603', '110000', '211', '0000000039', '2018-07-24');
INSERT INTO `t_taobao_auction` VALUES ('606', '110000', '211', '0000000039', '2018-07-25');
INSERT INTO `t_taobao_auction` VALUES ('609', '110000', '209', '0000000040', '2018-07-26');
INSERT INTO `t_taobao_auction` VALUES ('612', '110000', '209', '0000000039', '2018-07-27');
INSERT INTO `t_taobao_auction` VALUES ('615', '110000', '206', '0000000038', '2018-07-28');
INSERT INTO `t_taobao_auction` VALUES ('619', '110000', '203', '0000000038', '2018-07-29');
INSERT INTO `t_taobao_auction` VALUES ('622', '110000', '185', '0000000038', '2018-07-30');
INSERT INTO `t_taobao_auction` VALUES ('625', '110000', '198', '0000000039', '2018-07-31');
INSERT INTO `t_taobao_auction` VALUES ('627', '110000', '198', '0000000039', '2018-08-01');
INSERT INTO `t_taobao_auction` VALUES ('629', '110000', '197', '0000000040', '2018-08-02');
INSERT INTO `t_taobao_auction` VALUES ('632', '110000', '200', '0000000040', '2018-08-03');
INSERT INTO `t_taobao_auction` VALUES ('634', '110000', '197', '0000000040', '2018-08-04');
INSERT INTO `t_taobao_auction` VALUES ('640', '110000', '185', '0000000037', '2018-08-05');
INSERT INTO `t_taobao_auction` VALUES ('645', '110000', '183', '0000000038', '2018-08-06');
INSERT INTO `t_taobao_auction` VALUES ('648', '110000', '188', '0000000041', '2018-08-07');
INSERT INTO `t_taobao_auction` VALUES ('651', '110000', '189', '0000000041', '2018-08-08');
INSERT INTO `t_taobao_auction` VALUES ('655', '110000', '192', '0000000045', '2018-08-09');
INSERT INTO `t_taobao_auction` VALUES ('658', '110000', '199', '0000000046', '2018-08-10');
INSERT INTO `t_taobao_auction` VALUES ('660', '110000', '197', '0000000046', '2018-08-11');
INSERT INTO `t_taobao_auction` VALUES ('663', '110000', '194', '0000000045', '2018-08-12');
INSERT INTO `t_taobao_auction` VALUES ('666', '110000', '180', '0000000044', '2018-08-13');
INSERT INTO `t_taobao_auction` VALUES ('670', '110000', '180', '0000000047', '2018-08-14');
INSERT INTO `t_taobao_auction` VALUES ('673', '110000', '183', '0000000047', '2018-08-15');
INSERT INTO `t_taobao_auction` VALUES ('676', '110000', '180', '0000000047', '2018-08-16');
INSERT INTO `t_taobao_auction` VALUES ('680', '110000', '176', '0000000047', '2018-08-17');
INSERT INTO `t_taobao_auction` VALUES ('683', '110000', '179', '0000000047', '2018-08-18');
INSERT INTO `t_taobao_auction` VALUES ('685', '110000', '171', '0000000043', '2018-08-19');
INSERT INTO `t_taobao_auction` VALUES ('689', '110000', '168', '0000000046', '2018-08-20');
INSERT INTO `t_taobao_auction` VALUES ('692', '110000', '182', '0000000044', '2018-08-21');
INSERT INTO `t_taobao_auction` VALUES ('695', '110000', '183', '0000000046', '2018-08-22');
INSERT INTO `t_taobao_auction` VALUES ('698', '110000', '182', '0000000049', '2018-08-23');
INSERT INTO `t_taobao_auction` VALUES ('699', '110000', '179', '0000000048', '2018-08-24');
INSERT INTO `t_taobao_auction` VALUES ('702', '110000', '176', '0000000047', '2018-08-25');
INSERT INTO `t_taobao_auction` VALUES ('706', '110000', '177', '0000000046', '2018-08-26');
INSERT INTO `t_taobao_auction` VALUES ('709', '110000', '174', '0000000044', '2018-08-27');
INSERT INTO `t_taobao_auction` VALUES ('712', '110000', '180', '0000000044', '2018-08-28');
INSERT INTO `t_taobao_auction` VALUES ('715', '110000', '188', '0000000045', '2018-08-29');
INSERT INTO `t_taobao_auction` VALUES ('718', '110000', '198', '0000000049', '2018-08-30');
INSERT INTO `t_taobao_auction` VALUES ('719', '110000', '190', '0000000050', '2018-08-31');
INSERT INTO `t_taobao_auction` VALUES ('720', '110000', '193', '0000000050', '2018-09-01');
INSERT INTO `t_taobao_auction` VALUES ('721', '110000', '193', '0000000050', '2018-09-02');
INSERT INTO `t_taobao_auction` VALUES ('723', '110000', '187', '0000000050', '2018-09-03');
INSERT INTO `t_taobao_auction` VALUES ('725', '110000', '210', '0000000049', '2018-09-04');
INSERT INTO `t_taobao_auction` VALUES ('727', '110000', '228', '0000000048', '2018-09-05');
INSERT INTO `t_taobao_auction` VALUES ('729', '110000', '212', '0000000048', '2018-09-06');
INSERT INTO `t_taobao_auction` VALUES ('731', '110000', '212', '0000000050', '2018-09-07');
INSERT INTO `t_taobao_auction` VALUES ('732', '110000', '210', '0000000050', '2018-09-08');
INSERT INTO `t_taobao_auction` VALUES ('733', '110000', '211', '0000000050', '2018-09-09');
INSERT INTO `t_taobao_auction` VALUES ('735', '110000', '199', '0000000049', '2018-09-10');
INSERT INTO `t_taobao_auction` VALUES ('739', '110000', '195', '0000000054', '2018-09-11');
INSERT INTO `t_taobao_auction` VALUES ('742', '110000', '195', '0000000055', '2018-09-12');
INSERT INTO `t_taobao_auction` VALUES ('746', '110000', '194', '0000000056', '2018-09-13');
INSERT INTO `t_taobao_auction` VALUES ('748', '110000', '191', '0000000056', '2018-09-14');
INSERT INTO `t_taobao_auction` VALUES ('749', '110000', '184', '0000000055', '2018-09-15');
INSERT INTO `t_taobao_auction` VALUES ('751', '110000', '178', '0000000054', '2018-09-16');
INSERT INTO `t_taobao_auction` VALUES ('754', '110000', '167', '0000000056', '2018-09-17');
INSERT INTO `t_taobao_auction` VALUES ('756', '110000', '162', '0000000057', '2018-09-18');
INSERT INTO `t_taobao_auction` VALUES ('758', '110000', '170', '0000000060', '2018-09-19');
INSERT INTO `t_taobao_auction` VALUES ('760', '110000', '169', '0000000059', '2018-09-20');
INSERT INTO `t_taobao_auction` VALUES ('761', '110000', '156', '0000000058', '2018-09-21');
INSERT INTO `t_taobao_auction` VALUES ('762', '110000', '151', '0000000057', '2018-09-22');
INSERT INTO `t_taobao_auction` VALUES ('763', '110000', '148', '0000000056', '2018-09-23');
INSERT INTO `t_taobao_auction` VALUES ('765', '110000', '148', '0000000054', '2018-09-25');
INSERT INTO `t_taobao_auction` VALUES ('766', '110000', '147', '0000000054', '2018-09-26');
INSERT INTO `t_taobao_auction` VALUES ('768', '110000', '157', '0000000055', '2018-09-27');
INSERT INTO `t_taobao_auction` VALUES ('770', '110000', '153', '0000000056', '2018-09-28');
INSERT INTO `t_taobao_auction` VALUES ('772', '110000', '153', '0000000057', '2018-09-29');
INSERT INTO `t_taobao_auction` VALUES ('775', '110000', '159', '0000000059', '2018-09-30');
INSERT INTO `t_taobao_auction` VALUES ('776', '110000', '179', '0000000060', '2018-10-02');
INSERT INTO `t_taobao_auction` VALUES ('777', '110000', '178', '0000000060', '2018-10-03');
INSERT INTO `t_taobao_auction` VALUES ('779', '110000', '177', '0000000060', '2018-10-04');
INSERT INTO `t_taobao_auction` VALUES ('781', '110000', '177', '0000000059', '2018-10-05');
INSERT INTO `t_taobao_auction` VALUES ('785', '110000', '173', '0000000058', '2018-10-06');
INSERT INTO `t_taobao_auction` VALUES ('786', '110000', '173', '0000000058', '2018-10-07');
INSERT INTO `t_taobao_auction` VALUES ('787', '110000', '156', '0000000055', '2018-10-08');
INSERT INTO `t_taobao_auction` VALUES ('788', '110000', '156', '0000000055', '2018-10-09');
INSERT INTO `t_taobao_auction` VALUES ('790', '110000', '146', '0000000052', '2018-10-10');
INSERT INTO `t_taobao_auction` VALUES ('792', '110000', '146', '0000000050', '2018-10-11');
INSERT INTO `t_taobao_auction` VALUES ('794', '110000', '148', '0000000051', '2018-10-12');
INSERT INTO `t_taobao_auction` VALUES ('795', '110000', '151', '0000000051', '2018-10-13');
INSERT INTO `t_taobao_auction` VALUES ('796', '110000', '149', '0000000051', '2018-10-14');
INSERT INTO `t_taobao_auction` VALUES ('797', '110000', '138', '0000000048', '2018-10-15');
INSERT INTO `t_taobao_auction` VALUES ('798', '110000', '139', '0000000049', '2018-10-16');
INSERT INTO `t_taobao_auction` VALUES ('799', '110000', '165', '0000000050', '2018-10-17');
INSERT INTO `t_taobao_auction` VALUES ('801', '110000', '178', '0000000053', '2018-10-18');
INSERT INTO `t_taobao_auction` VALUES ('802', '110000', '183', '0000000055', '2018-10-19');
INSERT INTO `t_taobao_auction` VALUES ('803', '110000', '180', '0000000055', '2018-10-20');
INSERT INTO `t_taobao_auction` VALUES ('804', '110000', '179', '0000000055', '2018-10-21');
INSERT INTO `t_taobao_auction` VALUES ('806', '110000', '175', '0000000056', '2018-10-22');
INSERT INTO `t_taobao_auction` VALUES ('808', '110000', '184', '0000000049', '2018-10-23');
INSERT INTO `t_taobao_auction` VALUES ('811', '110000', '192', '0000000048', '2018-10-24');
INSERT INTO `t_taobao_auction` VALUES ('812', '110000', '192', '0000000048', '2018-10-25');
INSERT INTO `t_taobao_auction` VALUES ('813', '110000', '203', '0000000042', '2018-10-26');
INSERT INTO `t_taobao_auction` VALUES ('816', '110000', '193', '0000000044', '2018-10-30');
INSERT INTO `t_taobao_auction` VALUES ('817', '110000', '205', '0000000046', '2018-10-31');
INSERT INTO `t_taobao_auction` VALUES ('819', '110000', '200', '0000000044', '2018-11-01');
INSERT INTO `t_taobao_auction` VALUES ('821', '110000', '211', '0000000044', '2018-11-03');
INSERT INTO `t_taobao_auction` VALUES ('822', '110000', '211', '0000000044', '2018-11-04');
INSERT INTO `t_taobao_auction` VALUES ('823', '110000', '209', '0000000041', '2018-11-05');
INSERT INTO `t_taobao_auction` VALUES ('824', '110000', '219', '0000000037', '2018-11-06');
INSERT INTO `t_taobao_auction` VALUES ('825', '110000', '222', '0000000037', '2018-11-07');
INSERT INTO `t_taobao_auction` VALUES ('826', '110000', '227', '0000000040', '2018-11-08');
INSERT INTO `t_taobao_auction` VALUES ('827', '110000', '245', '0000000041', '2018-11-09');
INSERT INTO `t_taobao_auction` VALUES ('828', '110000', '235', '0000000042', '2018-11-12');
INSERT INTO `t_taobao_auction` VALUES ('831', '110000', '245', '0000000044', '2018-11-13');
INSERT INTO `t_taobao_auction` VALUES ('832', '110000', '246', '0000000046', '2018-11-14');
INSERT INTO `t_taobao_auction` VALUES ('833', '110000', '248', '0000000048', '2018-11-15');
INSERT INTO `t_taobao_auction` VALUES ('835', '110000', '261', '0000000054', '2018-11-16');
INSERT INTO `t_taobao_auction` VALUES ('837', '110000', '260', '0000000054', '2018-11-17');
INSERT INTO `t_taobao_auction` VALUES ('838', '110000', '257', '0000000054', '2018-11-18');
INSERT INTO `t_taobao_auction` VALUES ('839', '110000', '254', '0000000052', '2018-11-19');
INSERT INTO `t_taobao_auction` VALUES ('840', '110000', '264', '0000000048', '2018-11-20');
INSERT INTO `t_taobao_auction` VALUES ('841', '110000', '269', '0000000048', '2018-11-21');
INSERT INTO `t_taobao_auction` VALUES ('842', '110000', '273', '0000000050', '2018-11-22');
INSERT INTO `t_taobao_auction` VALUES ('843', '110000', '151', '0000000052', '2018-11-23');
INSERT INTO `t_taobao_auction` VALUES ('844', '110000', '153', '0000000049', '2018-11-25');
INSERT INTO `t_taobao_auction` VALUES ('845', '110000', '149', '0000000045', '2018-11-26');
INSERT INTO `t_taobao_auction` VALUES ('846', '110000', '154', '0000000047', '2018-11-27');
INSERT INTO `t_taobao_auction` VALUES ('847', '110000', '158', '0000000047', '2018-11-28');
INSERT INTO `t_taobao_auction` VALUES ('848', '110000', '155', '0000000047', '2018-11-29');
INSERT INTO `t_taobao_auction` VALUES ('849', '110000', '157', '0000000047', '2018-11-30');
INSERT INTO `t_taobao_auction` VALUES ('850', '110000', '156', '0000000050', '2018-12-01');
INSERT INTO `t_taobao_auction` VALUES ('851', '110000', '152', '0000000049', '2018-12-02');
INSERT INTO `t_taobao_auction` VALUES ('853', '110000', '145', '0000000050', '2018-12-03');
INSERT INTO `t_taobao_auction` VALUES ('854', '110000', '141', '0000000046', '2018-12-04');
INSERT INTO `t_taobao_auction` VALUES ('857', '110000', '157', '0000000048', '2018-12-05');
INSERT INTO `t_taobao_auction` VALUES ('859', '110000', '150', '0000000054', '2018-12-06');
INSERT INTO `t_taobao_auction` VALUES ('861', '110000', '158', '0000000053', '2018-12-07');
INSERT INTO `t_taobao_auction` VALUES ('862', '110000', '155', '0000000053', '2018-12-08');
INSERT INTO `t_taobao_auction` VALUES ('864', '110000', '155', '0000000051', '2018-12-09');
INSERT INTO `t_taobao_auction` VALUES ('865', '110000', '150', '0000000046', '2018-12-10');
INSERT INTO `t_taobao_auction` VALUES ('866', '110000', '152', '0000000043', '2018-12-11');
INSERT INTO `t_taobao_auction` VALUES ('867', '110000', '142', '0000000046', '2018-12-12');
INSERT INTO `t_taobao_auction` VALUES ('868', '110000', '144', '0000000047', '2018-12-13');
INSERT INTO `t_taobao_auction` VALUES ('869', '110000', '147', '0000000047', '2018-12-14');
INSERT INTO `t_taobao_auction` VALUES ('870', '110000', '155', '0000000048', '2018-12-15');
INSERT INTO `t_taobao_auction` VALUES ('872', '110000', '154', '0000000048', '2018-12-16');
INSERT INTO `t_taobao_auction` VALUES ('873', '110000', '152', '0000000049', '2018-12-17');
INSERT INTO `t_taobao_auction` VALUES ('874', '110000', '148', '0000000045', '2018-12-18');
INSERT INTO `t_taobao_auction` VALUES ('875', '110000', '148', '0000000046', '2018-12-19');
INSERT INTO `t_taobao_auction` VALUES ('877', '110000', '140', '0000000048', '2018-12-20');
INSERT INTO `t_taobao_auction` VALUES ('878', '110000', '143', '0000000048', '2018-12-21');
INSERT INTO `t_taobao_auction` VALUES ('879', '110000', '146', '0000000049', '2018-12-22');
INSERT INTO `t_taobao_auction` VALUES ('880', '110000', '144', '0000000049', '2018-12-23');
INSERT INTO `t_taobao_auction` VALUES ('881', '110000', '136', '0000000048', '2018-12-24');
INSERT INTO `t_taobao_auction` VALUES ('882', '110000', '135', '0000000047', '2018-12-25');
INSERT INTO `t_taobao_auction` VALUES ('883', '110000', '147', '0000000051', '2018-12-26');
INSERT INTO `t_taobao_auction` VALUES ('884', '110000', '135', '0000000054', '2018-12-27');
INSERT INTO `t_taobao_auction` VALUES ('886', '110000', '141', '0000000059', '2018-12-28');
INSERT INTO `t_taobao_auction` VALUES ('887', '110000', '144', '0000000061', '2018-12-29');
INSERT INTO `t_taobao_auction` VALUES ('888', '110000', '140', '0000000062', '2018-12-30');
INSERT INTO `t_taobao_auction` VALUES ('889', '110000', '139', '0000000062', '2018-12-31');
INSERT INTO `t_taobao_auction` VALUES ('890', '110000', '139', '0000000061', '2019-01-01');
INSERT INTO `t_taobao_auction` VALUES ('891', '110000', '137', '0000000061', '2019-01-02');
INSERT INTO `t_taobao_auction` VALUES ('892', '110000', '142', '0000000059', '2019-01-03');
INSERT INTO `t_taobao_auction` VALUES ('893', '110000', '152', '0000000062', '2019-01-04');
INSERT INTO `t_taobao_auction` VALUES ('894', '110000', '169', '0000000062', '2019-01-05');
INSERT INTO `t_taobao_auction` VALUES ('895', '110000', '167', '0000000062', '2019-01-06');
INSERT INTO `t_taobao_auction` VALUES ('897', '110000', '157', '0000000057', '2019-01-07');
INSERT INTO `t_taobao_auction` VALUES ('899', '110000', '149', '0000000056', '2019-01-08');
INSERT INTO `t_taobao_auction` VALUES ('901', '110000', '150', '0000000057', '2019-01-09');
INSERT INTO `t_taobao_auction` VALUES ('902', '110000', '148', '0000000057', '2019-01-10');
INSERT INTO `t_taobao_auction` VALUES ('903', '110000', '155', '0000000059', '2019-01-11');
INSERT INTO `t_taobao_auction` VALUES ('904', '110000', '154', '0000000059', '2019-01-12');
INSERT INTO `t_taobao_auction` VALUES ('905', '110000', '143', '0000000056', '2019-01-14');
INSERT INTO `t_taobao_auction` VALUES ('907', '110000', '154', '0000000055', '2019-01-15');
INSERT INTO `t_taobao_auction` VALUES ('908', '110000', '153', '0000000054', '2019-01-16');
INSERT INTO `t_taobao_auction` VALUES ('910', '110000', '154', '0000000062', '2019-01-17');
INSERT INTO `t_taobao_auction` VALUES ('916', '110000', '164', '0000000063', '2019-01-18');
INSERT INTO `t_taobao_auction` VALUES ('917', '110000', '158', '0000000061', '2019-01-20');
INSERT INTO `t_taobao_auction` VALUES ('919', '110000', '157', '0000000061', '2019-01-21');
INSERT INTO `t_taobao_auction` VALUES ('920', '110000', '161', '0000000060', '2019-01-23');
INSERT INTO `t_taobao_auction` VALUES ('922', '110000', '165', '0000000056', '2019-01-24');
INSERT INTO `t_taobao_auction` VALUES ('924', '110000', '167', '0000000060', '2019-01-25');
INSERT INTO `t_taobao_auction` VALUES ('926', '110000', '167', '0000000060', '2019-01-26');
INSERT INTO `t_taobao_auction` VALUES ('927', '110000', '167', '0000000058', '2019-01-27');
INSERT INTO `t_taobao_auction` VALUES ('928', '110000', '157', '0000000053', '2019-01-28');
INSERT INTO `t_taobao_auction` VALUES ('930', '110000', '160', '0000000054', '2019-01-29');
INSERT INTO `t_taobao_auction` VALUES ('933', '110000', '160', '0000000056', '2019-01-30');
INSERT INTO `t_taobao_auction` VALUES ('934', '110000', '168', '0000000056', '2019-02-01');
INSERT INTO `t_taobao_auction` VALUES ('935', '110000', '151', '0000000055', '2019-02-10');
INSERT INTO `t_taobao_auction` VALUES ('937', '110000', '153', '0000000050', '2019-02-12');
INSERT INTO `t_taobao_auction` VALUES ('938', '110000', '152', '0000000049', '2019-02-13');
INSERT INTO `t_taobao_auction` VALUES ('939', '110000', '151', '0000000049', '2019-02-14');
INSERT INTO `t_taobao_auction` VALUES ('941', '110000', '150', '0000000052', '2019-02-15');
INSERT INTO `t_taobao_auction` VALUES ('942', '110000', '148', '0000000052', '2019-02-16');
INSERT INTO `t_taobao_auction` VALUES ('944', '110000', '146', '0000000050', '2019-02-17');
INSERT INTO `t_taobao_auction` VALUES ('945', '110000', '140', '0000000045', '2019-02-18');
INSERT INTO `t_taobao_auction` VALUES ('946', '110000', '135', '0000000042', '2019-02-19');
INSERT INTO `t_taobao_auction` VALUES ('947', '110000', '131', '0000000043', '2019-02-20');
INSERT INTO `t_taobao_auction` VALUES ('948', '110000', '129', '0000000041', '2019-02-21');
INSERT INTO `t_taobao_auction` VALUES ('949', '110000', '125', '0000000036', '2019-02-22');
INSERT INTO `t_taobao_auction` VALUES ('951', '110000', '124', '0000000036', '2019-02-23');
INSERT INTO `t_taobao_auction` VALUES ('953', '110000', '122', '0000000036', '2019-02-24');
INSERT INTO `t_taobao_auction` VALUES ('954', '110000', '117', '0000000035', '2019-02-26');
INSERT INTO `t_taobao_auction` VALUES ('955', '110000', '116', '0000000036', '2019-02-27');
INSERT INTO `t_taobao_auction` VALUES ('956', '110000', '110', '0000000038', '2019-02-28');
INSERT INTO `t_taobao_auction` VALUES ('959', '110000', '112', '0000000040', '2019-03-01');
INSERT INTO `t_taobao_auction` VALUES ('961', '110000', '110', '0000000040', '2019-03-02');
INSERT INTO `t_taobao_auction` VALUES ('962', '110000', '110', '0000000040', '2019-03-03');
INSERT INTO `t_taobao_auction` VALUES ('963', '110000', '102', '0000000042', '2019-03-04');
INSERT INTO `t_taobao_auction` VALUES ('964', '110000', '101', '0000000041', '2019-03-05');
INSERT INTO `t_taobao_auction` VALUES ('966', '110000', '107', '0000000041', '2019-03-06');
INSERT INTO `t_taobao_auction` VALUES ('967', '110000', '114', '0000000043', '2019-03-07');
INSERT INTO `t_taobao_auction` VALUES ('969', '110000', '106', '0000000042', '2019-03-08');
INSERT INTO `t_taobao_auction` VALUES ('970', '110000', '105', '0000000042', '2019-03-09');
INSERT INTO `t_taobao_auction` VALUES ('971', '110000', '103', '0000000040', '2019-03-10');
INSERT INTO `t_taobao_auction` VALUES ('972', '110000', '97', '0000000037', '2019-03-11');
INSERT INTO `t_taobao_auction` VALUES ('974', '110000', '110', '0000000038', '2019-03-12');
INSERT INTO `t_taobao_auction` VALUES ('976', '110000', '111', '0000000038', '2019-03-13');
INSERT INTO `t_taobao_auction` VALUES ('977', '110000', '111', '0000000038', '2019-03-14');
INSERT INTO `t_taobao_auction` VALUES ('978', '110000', '116', '0000000041', '2019-03-15');
INSERT INTO `t_taobao_auction` VALUES ('980', '110000', '116', '0000000041', '2019-03-16');
INSERT INTO `t_taobao_auction` VALUES ('981', '110000', '115', '0000000040', '2019-03-17');
INSERT INTO `t_taobao_auction` VALUES ('982', '110000', '109', '0000000042', '2019-03-18');
INSERT INTO `t_taobao_auction` VALUES ('985', '110000', '105', '0000000042', '2019-03-19');
INSERT INTO `t_taobao_auction` VALUES ('986', '110000', '105', '0000000043', '2019-03-20');
INSERT INTO `t_taobao_auction` VALUES ('988', '110000', '109', '0000000044', '2019-03-21');
INSERT INTO `t_taobao_auction` VALUES ('989', '110000', '111', '0000000048', '2019-03-22');
INSERT INTO `t_taobao_auction` VALUES ('991', '110000', '109', '0000000046', '2019-03-23');
INSERT INTO `t_taobao_auction` VALUES ('992', '110000', '108', '0000000044', '2019-03-24');
INSERT INTO `t_taobao_auction` VALUES ('994', '110000', '104', '0000000044', '2019-03-25');
INSERT INTO `t_taobao_auction` VALUES ('995', '110000', '101', '0000000045', '2019-03-26');
INSERT INTO `t_taobao_auction` VALUES ('998', '110000', '106', '0000000049', '2019-03-27');
INSERT INTO `t_taobao_auction` VALUES ('1000', '110000', '113', '0000000050', '2019-03-30');
INSERT INTO `t_taobao_auction` VALUES ('1001', '110000', '112', '0000000050', '2019-03-31');
INSERT INTO `t_taobao_auction` VALUES ('1002', '110000', '106', '0000000047', '2019-04-01');
INSERT INTO `t_taobao_auction` VALUES ('1005', '110000', '111', '0000000047', '2019-04-03');
INSERT INTO `t_taobao_auction` VALUES ('1006', '110000', '114', '0000000048', '2019-04-04');
INSERT INTO `t_taobao_auction` VALUES ('1007', '110000', '111', '0000000042', '2019-04-10');
INSERT INTO `t_taobao_auction` VALUES ('1008', '110000', '107', '0000000044', '2019-04-11');
INSERT INTO `t_taobao_auction` VALUES ('1010', '110000', '110', '0000000043', '2019-04-12');
INSERT INTO `t_taobao_auction` VALUES ('1011', '110000', '108', '0000000043', '2019-04-13');
INSERT INTO `t_taobao_auction` VALUES ('1013', '110000', '108', '0000000043', '2019-04-14');
INSERT INTO `t_taobao_auction` VALUES ('1014', '110000', '99', '0000000039', '2019-04-15');
INSERT INTO `t_taobao_auction` VALUES ('1015', '110000', '100', '0000000039', '2019-04-16');
INSERT INTO `t_taobao_auction` VALUES ('1016', '110000', '101', '0000000039', '2019-04-17');
INSERT INTO `t_taobao_auction` VALUES ('1019', '110000', '106', '0000000045', '2019-04-18');
INSERT INTO `t_taobao_auction` VALUES ('1021', '110000', '105', '0000000046', '2019-04-19');
INSERT INTO `t_taobao_auction` VALUES ('1024', '110000', '105', '0000000045', '2019-04-20');
INSERT INTO `t_taobao_auction` VALUES ('1026', '110000', '104', '0000000043', '2019-04-21');
INSERT INTO `t_taobao_auction` VALUES ('1031', '110000', '97', '0000000045', '2019-04-22');
INSERT INTO `t_taobao_auction` VALUES ('1034', '110000', '96', '0000000049', '2019-04-23');
INSERT INTO `t_taobao_auction` VALUES ('1035', '110000', '95', '0000000052', '2019-04-24');
INSERT INTO `t_taobao_auction` VALUES ('1037', '110000', '92', '0000000058', '2019-04-25');
INSERT INTO `t_taobao_auction` VALUES ('1038', '110000', '91', '0000000057', '2019-04-27');
INSERT INTO `t_taobao_auction` VALUES ('1040', '110000', '90', '0000000057', '2019-04-28');
INSERT INTO `t_taobao_auction` VALUES ('1042', '110000', '86', '0000000057', '2019-04-29');
INSERT INTO `t_taobao_auction` VALUES ('1043', '110000', '81', '0000000058', '2019-05-05');
INSERT INTO `t_taobao_auction` VALUES ('1046', '110000', '82', '0000000062', '2019-05-06');
INSERT INTO `t_taobao_auction` VALUES ('1048', '110000', '82', '0000000057', '2019-05-07');
INSERT INTO `t_taobao_auction` VALUES ('1049', '110000', '78', '0000000057', '2019-05-09');
INSERT INTO `t_taobao_auction` VALUES ('1050', '110000', '81', '0000000058', '2019-05-10');
INSERT INTO `t_taobao_auction` VALUES ('1052', '110000', '86', '0000000058', '2019-05-11');
INSERT INTO `t_taobao_auction` VALUES ('1053', '110000', '86', '0000000058', '2019-05-12');
INSERT INTO `t_taobao_auction` VALUES ('1055', '110000', '79', '0000000052', '2019-05-13');
INSERT INTO `t_taobao_auction` VALUES ('1056', '110000', '79', '0000000059', '2019-05-15');
INSERT INTO `t_taobao_auction` VALUES ('1059', '110000', '91', '0000000066', '2019-05-16');
INSERT INTO `t_taobao_auction` VALUES ('1060', '110000', '92', '0000000066', '2019-05-18');
INSERT INTO `t_taobao_auction` VALUES ('1061', '110000', '85', '0000000063', '2019-05-20');
INSERT INTO `t_taobao_auction` VALUES ('1062', '110000', '85', '0000000061', '2019-05-21');
INSERT INTO `t_taobao_auction` VALUES ('1065', '110000', '94', '0000000063', '2019-05-22');
INSERT INTO `t_taobao_auction` VALUES ('1066', '110000', '92', '0000000064', '2019-05-23');
INSERT INTO `t_taobao_auction` VALUES ('1067', '110000', '95', '0000000065', '2019-05-24');
INSERT INTO `t_taobao_auction` VALUES ('1069', '110000', '92', '0000000065', '2019-05-25');
INSERT INTO `t_taobao_auction` VALUES ('1070', '110000', '81', '0000000064', '2019-05-27');
INSERT INTO `t_taobao_auction` VALUES ('1071', '110000', '88', '0000000062', '2019-05-30');
INSERT INTO `t_taobao_auction` VALUES ('1072', '110000', '90', '0000000062', '2019-05-31');
INSERT INTO `t_taobao_auction` VALUES ('1073', '110000', '88', '0000000062', '2019-06-01');

-- ----------------------------
-- Table structure for `t_woaiwojia_mouth_market_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_woaiwojia_mouth_market_data`;
CREATE TABLE `t_woaiwojia_mouth_market_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` smallint(5) unsigned zerofill DEFAULT NULL,
  `month` smallint(6) unsigned DEFAULT NULL COMMENT '月份',
  `price_deal` int(10) unsigned DEFAULT NULL COMMENT '成交价',
  `price_sale` int(10) unsigned zerofill DEFAULT NULL COMMENT '挂牌价',
  `house_deal` int(10) unsigned zerofill DEFAULT NULL COMMENT '成交的房屋数量',
  `house_sale` int(11) unsigned zerofill DEFAULT NULL COMMENT '当前在售的房屋数量',
  `new_customer` int(11) unsigned zerofill DEFAULT NULL COMMENT '新增客户',
  `look_num` int(11) unsigned zerofill DEFAULT NULL COMMENT '总带看量',
  `near_7_day_look_num` int(11) unsigned zerofill DEFAULT NULL COMMENT '近7天带看',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_woaiwojia_mouth_market_data
-- ----------------------------
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('1', '02017', '7', '58932', null, '0000000380', null, '00000016263', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('2', '02017', '8', '56402', null, '0000000459', null, '00000024577', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('3', '02017', '9', '54574', null, '0000000577', null, '00000025882', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('4', '02017', '10', '57761', null, '0000000459', null, '00000020656', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('5', '02017', '11', '57092', null, '0000000529', null, '00000020356', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('6', '02017', '12', '55375', null, '0000000484', null, '00000017833', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('7', '02018', '1', '55471', null, '0000000515', null, '00000012860', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('8', '02018', '2', '57976', null, '0000000194', null, '00000005239', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('9', '02018', '3', '57913', null, '0000000761', null, '00000015928', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('10', '02018', '4', '57327', null, '0000000502', null, '00000014410', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('11', '02018', '5', '58325', null, '0000000570', null, '00000019310', null, null, null);
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('12', '02018', '6', '55554', '0000058866', '0000000590', '00000062728', '00000016789', '00000062270', '00000010136', '2018-07-04');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('15', '02018', '7', '54732', '0000058232', '0000000507', '00000066154', '00000014311', '00000053756', '00000011120', '2018-08-10');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('16', '02018', '8', '56205', '0000057478', '0000000439', '00000069615', '00000015236', '00000049337', '00000010733', '2018-09-05');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('17', '02018', '9', '51665', '0000056875', '0000000446', '00000073135', '00000016105', '00000055813', '00000010105', '2018-10-03');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('18', '02018', '10', '51223', '0000055417', '0000000428', '00000075448', '00000016428', '00000055453', '00000008242', '2018-11-05');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('19', '02018', '11', '47185', '0000054485', '0000000525', '00000075398', '00000016856', '00000056421', '00000011525', '2018-12-07');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('20', '02018', '12', '46729', '0000055238', '0000000658', '00000074101', '00000018534', '00000060527', '00000011173', '2019-01-05');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('21', '02019', '1', '48514', '0000055057', '0000000750', '00000072024', '00000013669', '00000044132', '00000000325', '2019-02-13');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('22', '02019', '2', '48085', '0000054963', '0000000443', '00000070836', '00000009890', '00000027985', '00000014406', '2019-03-02');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('23', '02019', '3', '49883', '0000054809', '0000001286', '00000068182', '00000022132', '00000079790', '00000014429', '2019-04-13');
INSERT INTO `t_woaiwojia_mouth_market_data` VALUES ('24', '02019', '4', '49628', '0000054819', '0000001127', '00000067619', '00000020585', '00000069268', '00000012861', '2019-05-12');
