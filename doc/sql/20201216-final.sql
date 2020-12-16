/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.7.24 : Database - basic-project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`basic-project` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `basic-project`;

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `age` int(10) DEFAULT '0' COMMENT '年龄',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `gender` int(10) DEFAULT '0' COMMENT '性别',
  `address` varchar(300) DEFAULT NULL COMMENT '地址',
  `summary` text COMMENT '简介',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新用户',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`id`,`name`,`age`,`birthday`,`gender`,`address`,`summary`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1258666571995344897','张三15',24,'2020-01-16',2,'山东临沂15','我厉害了15','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571982761985','张三14',23,'2020-01-14',1,'山东临沂14','我厉害了14','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571970179073','张三13',22,'2020-01-13',0,'山东临沂13','我厉害了13','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571961790466','张三12',21,'2020-01-12',2,'山东临沂12','我厉害了12','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571949207553','张三11',20,'2020-01-11',0,'山东临沂11','我厉害了11','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571940818945','张三10',19,'2020-01-10',1,'山东临沂10','我厉害了10','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571924041730','张三9',18,'2020-01-09',2,'山东临沂9','我厉害了9','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571915653122','张三8',17,'2020-01-08',0,'山东临沂8','我厉害了8','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571907264514','张三7',16,'2020-01-07',1,'山东临沂7','我厉害了7','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571894681602','张三6',15,'2020-01-06',0,'山东临沂6','我厉害了6','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571886292994','张三5',14,'2020-01-05',1,'山东临沂5','我厉害了5','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571873710081','张三4',13,'2020-01-04',0,'山东临沂4','我厉害了4','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571852738561','张三3',12,'2020-01-03',2,'山东临沂3','我厉害了3','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571844349953','张三2',11,'2020-01-02',1,'山东临沂2','我厉害了2','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571831767042','张三1',10,'2020-01-01',1,'山东临沂1','我厉害了1','admin','2020-05-08 15:54:30',NULL,NULL),('1258670326111272962','张三1',10,'2020-01-01',1,'山东临沂1','我厉害了1','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326161604610','张三2',11,'2020-01-02',1,'山东临沂2','我厉害了2','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326182576129','张三3',12,'2020-01-03',2,'山东临沂3','我厉害了3','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326207741953','张三4',13,'2020-01-04',0,'山东临沂4','我厉害了4','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326224519170','张三5',14,'2020-01-05',1,'山东临沂5','我厉害了5','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326245490690','张三6',15,'2020-01-06',0,'山东临沂6','我厉害了6','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326279045121','张三7',16,'2020-01-07',1,'山东临沂7','我厉害了7','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326304210945','张三8',17,'2020-01-08',0,'山东临沂8','我厉害了8','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326329376770','张三9',18,'2020-01-09',2,'山东临沂9','我厉害了9','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326354542593','张三10',19,'2020-01-10',1,'山东临沂10','我厉害了10','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326362931202','张三11',20,'2020-01-11',0,'山东临沂11','我厉害了11','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326388097026','张三12',21,'2020-01-12',2,'山东临沂12','我厉害了12','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326421651458','张三13',22,'2020-01-13',0,'山东临沂13','我厉害了13','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326434234369','张三14',23,'2020-01-14',1,'山东临沂14','我厉害了14','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326455205889','张三15',24,'2020-01-15',2,'山东临沂15','我厉害了15','admin','2020-05-08 16:09:25',NULL,NULL);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `name` varchar(300) DEFAULT NULL COMMENT '名称',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `detail` text COMMENT '描述',
  `cut_id` varchar(100) DEFAULT NULL COMMENT '裁切图id',
  `cut_url` varchar(200) DEFAULT NULL COMMENT '裁切图url',
  `short_id` varchar(100) DEFAULT NULL COMMENT '缩略图id',
  `short_image` varchar(300) DEFAULT NULL COMMENT '缩略图',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`author`,`detail`,`cut_id`,`cut_url`,`short_id`,`short_image`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1272789700896145410','作品上传1','小飞侠1','擦擦擦',NULL,NULL,'1290094929626853377','http://localhost:8888/profile/upload/2020/08/03/c2824031c5befb0c2f670101a1285995.jpg','admin','2020-06-16 15:14:47','admin','2020-10-10 09:15:40'),('1272792876982517762','测试2','ccc','',NULL,NULL,'1272792846808694786','http://localhost:8888/profile/upload/2020/06/16/8c6f54ec3a1ab95efbf5beb3703b0c55.png','admin','2020-06-16 15:27:24',NULL,NULL),('1272794581895790594','测试会议2','ccc ','ccc',NULL,NULL,'1272794467160604673','http://localhost:8888/profile/upload/2020/06/16/29d1e0688174d09412be291c7645a5a7.jpg','admin','2020-06-16 15:34:10',NULL,NULL),('1277881221693644801','SEO标题','ccc','','1277881088704847874','http://localhost:8888/profile/upload/2020/06/30/bbb5a86856bba563f17522534a660339.png','1277881181377994754','http://localhost:8888/profile/upload/2020/06/30/5fee250b9156f4254437c05fe28bc1fc.jpg','admin','2020-06-30 16:26:40',NULL,NULL),('1282512922944278530','设计分类','oo','','1282512820741672961','http://localhost:8888/profile/upload/2020/07/13/6c398c202f9c8d366bda3ab2017f8e75.jpg','1282512836776497154','http://localhost:8888/profile/upload/2020/07/13/a9861ef3045815b301f1c617bcb4dc71.jpg','admin','2020-07-13 11:11:23',NULL,NULL);

/*Table structure for table `product_file` */

DROP TABLE IF EXISTS `product_file`;

CREATE TABLE `product_file` (
  `product_id` varchar(100) DEFAULT NULL COMMENT '作品id',
  `file_id` varchar(100) DEFAULT NULL COMMENT '文件id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_file` */

insert  into `product_file`(`product_id`,`file_id`) values ('1272789700896145410','1272789679136096257'),('1272789700896145410','1272805193614954497'),('1272789700896145410','1272805193552039937'),('1272789700896145410','1272805193682063362'),('1272789700896145410','1272805193900167170'),('1272792876982517762','1272792870988857346'),('1272794581895790594','1272794557858234369'),('1272794581895790594','1272794557950509058'),('1272794581895790594','1272794557635936258'),('1272794581895790594','1272794557598187522'),('1277881221693644801','1277881219198033921'),('1282512922944278530','1282512918582202370');

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `product_id` varchar(100) DEFAULT NULL COMMENT '作品主键',
  `image_id` varchar(100) DEFAULT NULL COMMENT '图片主键'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_image` */

insert  into `product_image`(`product_id`,`image_id`) values ('1272789700896145410','1272789655337615361'),('1272792876982517762','1272792860880584705'),('1272794581895790594','1272794515005030402'),('1272794581895790594','1272794503621689345'),('1272794581895790594','1272794503500054529'),('1272794581895790594','1272794485779120129'),('1272794581895790594','1272794485527461890'),('1272789700896145410','1272805132478779393'),('1272789700896145410','1272805207099641857'),('1272789700896145410','1272805081949999105'),('1277881221693644801','1277881197886775297'),('1277881221693644801','1277881197559619586'),('1277881221693644801','1277881197526065153'),('1282512922944278530','1282512849220997122');

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(100) NOT NULL COMMENT '地区id',
  `pid` varchar(100) DEFAULT NULL COMMENT '父级id',
  `ancestors` varchar(300) DEFAULT NULL COMMENT '祖级列表',
  `code` varchar(200) DEFAULT NULL COMMENT '区划编码',
  `name` varchar(100) DEFAULT NULL COMMENT '地区名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`pid`,`ancestors`,`code`,`name`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1333620410082713601','0','0','100','北京市',0,'admin','2020-12-01 11:54:18','admin','2020-12-16 14:04:38'),('1333620468643586050','1333620410082713601','0,1333620410082713601','10010','北京市',0,'admin','2020-12-01 11:54:32',NULL,NULL),('1333620561811660801','1333620514982256641','0,1333620514982256641','2001','济南市',0,'admin','2020-12-01 11:54:54',NULL,NULL),('1333620606518747138','1333620514982256641','0,1333620514982256641','2002','临沂市',0,'admin','2020-12-01 11:55:05',NULL,NULL),('1333620671056502785','1333620606518747138','0,1333620514982256641,1333620606518747138','200201','兰山区',0,'admin','2020-12-01 11:55:20',NULL,NULL),('1333620714450771970','1333620606518747138','0,1333620514982256641,1333620606518747138','200202','河东区',0,'admin','2020-12-01 11:55:30','admin','2020-12-16 11:42:22'),('1334039974843060226','1333620714450771970','0,1333620514982256641,1333620606518747138,1333620714450771970','371312','芝麻墩街道',0,'admin','2020-12-02 15:41:30',NULL,NULL),('1334040060784349185','1333620714450771970','0,1333620514982256641,1333620606518747138,1333620714450771970','371311','经济技术开发区',0,'admin','2020-12-02 15:41:50','admin','2020-12-16 11:42:13'),('1339053251536883714','1333620714450771970','0,1333620514982256641,1333620606518747138,1333620714450771970','sys_11','11111222',11,'admin','2020-12-16 11:42:28','admin','2020-12-16 11:42:55');

/*Table structure for table `sys_dictionary` */

DROP TABLE IF EXISTS `sys_dictionary`;

CREATE TABLE `sys_dictionary` (
  `id` varchar(100) DEFAULT NULL COMMENT '主键id',
  `name` varchar(200) DEFAULT NULL COMMENT '字典名称',
  `value` varchar(200) DEFAULT NULL COMMENT '字典值',
  `type` varchar(200) DEFAULT NULL COMMENT '字典项分类',
  `remark` varchar(300) DEFAULT NULL COMMENT '说明',
  `status` int(2) DEFAULT '0' COMMENT '状态 0正常 1禁用',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  KEY `UNI_SYS_DICT_TYPENAME` (`name`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dictionary` */

insert  into `sys_dictionary`(`id`,`name`,`value`,`type`,`remark`,`status`,`sort`) values ('1339120812945375233','男','1','system_sex','性别',1,1),('1339120887616569346','女','2','system_sex','性别',1,1),('1339120971255185410','保密','0','system_sex','性别',1,0);

/*Table structure for table `sys_operate_log` */

DROP TABLE IF EXISTS `sys_operate_log`;

CREATE TABLE `sys_operate_log` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '模块名称',
  `type` int(2) DEFAULT '0' COMMENT '业务类型0其他1新增2修改3删除',
  `method` varchar(100) DEFAULT NULL COMMENT '方法名称',
  `request_type` varchar(100) DEFAULT NULL COMMENT '请求类型',
  `oper_type` int(2) DEFAULT '0' COMMENT '操作类型0其他1后台2移动端',
  `oper_user_id` varchar(100) DEFAULT NULL COMMENT '操作用户id',
  `oper_user_name` varchar(100) DEFAULT NULL COMMENT '操作用户名称',
  `oper_user_account` varchar(100) DEFAULT NULL COMMENT '操作用户账号',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `oper_url` varchar(255) DEFAULT NULL COMMENT '请求url',
  `oper_ip` varchar(50) DEFAULT NULL COMMENT '操作ip',
  `oper_location` varchar(255) DEFAULT NULL COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT NULL COMMENT '请求参数',
  `result_param` varchar(2000) DEFAULT NULL COMMENT '返回参数',
  `state` int(2) DEFAULT '0' COMMENT '操作状态0正常1异常',
  `error_msg` varchar(2000) DEFAULT NULL COMMENT '错误消息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_operate_log` */

insert  into `sys_operate_log`(`id`,`name`,`type`,`method`,`request_type`,`oper_type`,`oper_user_id`,`oper_user_name`,`oper_user_account`,`oper_time`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`result_param`,`state`,`error_msg`) values ('1339085680288993281','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 13:51:20','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339086240476041218','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 13:53:33','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339088587621142529','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:02:53','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339090416077639681','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:10:09','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339091523818491906','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:14:33','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339092166075486210','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:17:06','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339092296849690625','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:17:37','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339092366957481985','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:17:54','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339098027514662914','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:40:24','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339099516471611394','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:46:19','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339099577645535233','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:46:33','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339100446604660738','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:50:00','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339102184246108162','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 14:56:54','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339119685889753090','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 16:06:27','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1339122435516071938','系统登录',10,'com.leesoft.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-16 16:17:23','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(40) DEFAULT NULL COMMENT '权限名',
  `type` int(11) DEFAULT NULL COMMENT '权限类型',
  `code` varchar(40) DEFAULT NULL COMMENT '权限编码',
  `pid` varchar(40) DEFAULT NULL COMMENT '父权限id',
  `value` varchar(40) DEFAULT NULL COMMENT '权限值',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`type`,`code`,`pid`,`value`,`comment`) values ('1339083926403026946','系统管理',NULL,'system','0',NULL,'系统管理权限'),('1339084191558537217','文章管理',NULL,'article','0',NULL,'文章管理权限'),('1339086319375093761','文章查看',NULL,'article:view','1339084191558537217',NULL,''),('1339086393941430274','文章编辑',NULL,'article:edit','1339086319375093761',NULL,'111'),('1339086455106965506','文章详情',NULL,'article:detail','1339086319375093761',NULL,'222');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `code` varchar(100) DEFAULT NULL COMMENT '角色编码',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`code`,`comment`) values ('1339100639353901058','服务器管理员','fuwuqi',''),('1339098556764524545','系统管理员','xitong','角色111');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色id',
  `perm_id` varchar(40) DEFAULT NULL COMMENT '权限管理id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`role_id`,`perm_id`) values ('1339100639353901058','1339083926403026946'),('1339100639353901058','1339084191558537217'),('1339100639353901058','1339086319375093761'),('1339100639353901058','1339086393941430274'),('1339100639353901058','1339086455106965506'),('1339098556764524545','1339083926403026946');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `username` varchar(40) DEFAULT NULL COMMENT '登录帐号',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) DEFAULT NULL COMMENT '密码种子',
  `nickname` varchar(40) DEFAULT NULL COMMENT '用户名称',
  `email` varchar(40) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(40) DEFAULT NULL COMMENT '手机号码',
  `icon` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `status` int(11) DEFAULT '1' COMMENT '用户状态，0禁用，1启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者账号',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者账号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`salt`,`nickname`,`email`,`mobile`,`icon`,`status`,`create_time`,`create_by`,`update_time`,`update_by`,`remark`) values ('1242327057416970241','admin','7b28802579cb4aa35d7a30c32e0479a8','cf4agc8a0w','超级管理员','admin2@qq.com','18858868888',NULL,1,'2020-03-24 13:47:06',NULL,'2020-03-24 14:01:52',NULL,NULL),('1339049069878767618','admin1','b5e1ec32d90f3f9c4e5dbb077fe7b9e1','srs44bm1iw','guanli1','admin2@qq.com','13793146910',NULL,1,'2020-12-16 11:25:51',NULL,'2020-12-16 11:33:40','admin','cc'),('1339051163721404418','admin2','7e8623ac3899e5feae4ae89938cfafbe','n93w5ho9g7','管理员2','admin2@qq.com','18639460112',NULL,1,'2020-12-16 11:34:10','admin',NULL,NULL,'测试');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1339051163721404418','1339100639353901058'),('1242327057416970241','1339098556764524545');

/*Table structure for table `upload_files` */

DROP TABLE IF EXISTS `upload_files`;

CREATE TABLE `upload_files` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `storage` varchar(100) DEFAULT NULL COMMENT '上传类型',
  `url` varchar(300) DEFAULT NULL COMMENT '地址',
  `name` varchar(300) DEFAULT NULL COMMENT '文件名称',
  `size` int(11) DEFAULT '0' COMMENT '文件大小',
  `type` varchar(100) DEFAULT NULL COMMENT '文件类型',
  `extension` varchar(100) DEFAULT NULL COMMENT '文件后缀名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `upload_files` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
