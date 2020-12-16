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

insert  into `sys_area`(`id`,`pid`,`ancestors`,`code`,`name`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1333620410082713601','0','0','100','北京市',0,'admin','2020-12-01 11:54:18',NULL,NULL),('1333620468643586050','1333620410082713601','0,1333620410082713601','10010','北京市',0,'admin','2020-12-01 11:54:32',NULL,NULL),('1333620514982256641','0','0','200','山东省',0,'admin','2020-12-01 11:54:43',NULL,NULL),('1333620561811660801','1333620514982256641','0,1333620514982256641','2001','济南市',0,'admin','2020-12-01 11:54:54',NULL,NULL),('1333620606518747138','1333620514982256641','0,1333620514982256641','2002','临沂市',0,'admin','2020-12-01 11:55:05',NULL,NULL),('1333620671056502785','1333620606518747138','0,1333620514982256641,1333620606518747138','200201','兰山区',0,'admin','2020-12-01 11:55:20',NULL,NULL),('1333620714450771970','1333620606518747138','0,1333620514982256641,1333620606518747138','200202','河东区',0,'admin','2020-12-01 11:55:30',NULL,NULL),('1334039974843060226','1333620714450771970','0,1333620514982256641,1333620606518747138,1333620714450771970','371312','芝麻墩街道',0,'admin','2020-12-02 15:41:30',NULL,NULL),('1334040060784349185','1333620714450771970','0,1333620514982256641,1333620606518747138,1333620714450771970','371311','经济技术开发区',0,'admin','2020-12-02 15:41:50',NULL,NULL);

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

insert  into `sys_operate_log`(`id`,`name`,`type`,`method`,`request_type`,`oper_type`,`oper_user_id`,`oper_user_name`,`oper_user_account`,`oper_time`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`result_param`,`state`,`error_msg`) values ('1327067362195791874','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-11-13 09:54:49','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1327067521579343874','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,NULL,NULL,NULL,'2020-11-13 09:55:28','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin11\" ]\r\n}','{\r\n  \"success\" : false,\r\n  \"message\" : \"用户名密码不正确\",\r\n  \"code\" : 1001\r\n}',0,NULL),('1327068128281124866','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-11-13 09:57:52','/login','127.0.0.1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1327068345927753730','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,NULL,NULL,NULL,'2020-11-13 09:58:44','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin2\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : false,\r\n  \"message\" : \"用户名密码不正确\",\r\n  \"code\" : 1001\r\n}',0,NULL),('1327068361480232962','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1272467298744131585','图片上传编辑管理员','admin2','2020-11-13 09:58:48','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin2\" ],\r\n  \"password\" : [ \"admin2\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1327124380977750018','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-11-13 13:41:23','/login','127.0.0.1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1327140233903448066','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-11-13 14:44:23','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1329594900046479362','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-11-20 09:18:21','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1329601809029857281','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-11-20 09:45:48','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1329691732151898113','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-11-20 15:43:08','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1333598871853481985','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-01 10:28:42','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1333615538998362114','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-01 11:34:56','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1333619949556551682','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-01 11:52:28','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1333620364750675969','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-01 11:54:07','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1333676022053265410','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-01 15:35:17','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1333936249398968321','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-02 08:49:19','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1334027610315886594','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-02 14:52:22','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1334297289139785729','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-03 08:43:58','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1334373496019603457','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-03 13:46:47','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1334663545416130561','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-04 08:59:20','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1335103081346543617','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-05 14:05:54','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1335766465943515138','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-07 10:01:57','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1335774800478576642','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-07 10:35:04','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1335845121923588097','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-07 15:14:31','/login','192.168.1.24','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1335846852644413441','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-07 15:21:23','/login','192.168.1.4','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1336135487130243074','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-08 10:28:19','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1337213772421402625','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-11 09:53:02','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1337229463237177346','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-11 10:55:23','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1337231307585949698','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-11 11:02:43','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1337311142303866882','系统登录',10,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-11 16:19:57','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL);

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

insert  into `sys_permission`(`id`,`name`,`type`,`code`,`pid`,`value`,`comment`) values ('1242332436917977089','系统管理',NULL,'sys:admin','0',NULL,'系统管理权限'),('1242332722738823170','管理员管理',NULL,'sys:admin:list','1242332436917977089',NULL,''),('1258294103497568257','查看',NULL,'admin:view','1242332722738823170',NULL,''),('1258294195721924610','编辑',NULL,'admin:edit','1242332722738823170',NULL,''),('1258294246141652994','添加',NULL,'admin:add','1242332436917977089',NULL,''),('1272466615030636546','图片上传',NULL,'image','0',NULL,''),('1272466739937009666','编辑',NULL,'image:edit','1272466615030636546',NULL,''),('1272466806135709698','删除',NULL,'image:delete','1272466615030636546',NULL,'111'),('1337216598195310594','列表1',NULL,'list','1337216504746217474',NULL,''),('1326451700553281537','删除',NULL,'12121','1258294103497568257',NULL,'1212'),('1337216504746217474','查看',NULL,'chakan','1272466615030636546',NULL,''),('1337216690860068865','列表1',NULL,'list1','1337216598195310594',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`comment`) values ('1242336572984090626','超级管理员','超级管理员'),('1242338849828462593','普通管理员','管理员管理'),('1272466912813637634','图片上传管理员',''),('1272466994350907394','图片上传编辑管理员','');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色id',
  `perm_id` varchar(40) DEFAULT NULL COMMENT '权限管理id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`role_id`,`perm_id`) values ('1242336572984090626','1258294246141652994'),('1242336572984090626','1258294195721924610'),('1242336572984090626','1258294103497568257'),('1242338849828462593','1258294103497568257'),('1242338849828462593','1242332722738823170'),('1242338849828462593','1242332436917977089'),('1242336572984090626','1242332722738823170'),('1242336572984090626','1242332436917977089'),('1272466912813637634','1272466615030636546'),('1272466912813637634','1272466739937009666'),('1272466912813637634','1272466806135709698'),('1272466994350907394','1272466615030636546'),('1272466994350907394','1272466739937009666');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `username` varchar(40) DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) DEFAULT NULL COMMENT '密码种子',
  `nickname` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `state` int(11) DEFAULT '1' COMMENT '用户状态，0禁用，1启用',
  `isdel` int(11) DEFAULT '0' COMMENT '删除状态 0未删除，1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `email` varchar(40) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(40) DEFAULT NULL COMMENT '手机号码',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`salt`,`nickname`,`icon`,`state`,`isdel`,`create_time`,`update_time`,`email`,`mobile`,`delete_time`) values ('1242327057416970241','admin','339766036f819059b8419af892fdb629','k8h23cokz6','超级管理员',NULL,1,0,'2020-03-24 13:47:06','2020-03-24 14:01:52','admin2@qq.com','18858868888',NULL),('1242343616969560066','ceshi','ec36e7d4db25dfb60c0224e3be037aef','1ytgfhm3o1','admin',NULL,1,1,'2020-03-24 14:52:54',NULL,'','18858868888',NULL),('1242370555167989761','putong','ea59fd709fab88138aaefdd438d296af','jvo6a1u3yt','普通管理员',NULL,1,0,'2020-03-24 16:39:57',NULL,'','18988888888',NULL),('1272467134352580610','admin1','52b2519f718def86b6a599f227171f43','yl89e2qvli','图片上传管理员',NULL,1,0,'2020-06-15 17:53:01',NULL,'','18858868888',NULL),('1272467298744131585','admin2','39571cba259c2e7bfc6f32a55df34087','56zk0wtpws','图片上传编辑管理员',NULL,1,0,'2020-06-15 17:53:40',NULL,'','18858868888',NULL),('1323540950826369025','admin3','dfba4c4ebb52b999864b4ae35fc25b43','rpji8hxx2k','测试',NULL,1,0,'2020-11-03 16:22:07',NULL,'','18888888888',NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1242327057416970241','1242336572984090626'),('1272467134352580610','1272466912813637634'),('1272467298744131585','1272466994350907394'),('1242327057416970241','1272466912813637634');

/*Table structure for table `test_test` */

DROP TABLE IF EXISTS `test_test`;

CREATE TABLE `test_test` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(100) DEFAULT NULL COMMENT '内容',
  `test_date` date DEFAULT NULL COMMENT '日期',
  `test_time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `test_test` */

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

insert  into `upload_files`(`id`,`storage`,`url`,`name`,`size`,`type`,`extension`,`create_time`,`create_by`) values ('1272789639290208258',NULL,'http://localhost:8888/profile/upload/2020/06/16/c111d9d935a3b73586cfc4f0de373fd9.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:14:32','admin'),('1272789655333421058',NULL,'http://localhost:8888/profile/upload/2020/06/16/f568c23aebace4ee9ac29a888c7908e7.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:14:36','admin'),('1272789655337615361',NULL,'http://localhost:8888/profile/upload/2020/06/16/fa9a918d1ad8a6f966ee78f393cf3bb2.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:14:36','admin'),('1272789679136096257',NULL,'http://localhost:8888/profile/upload/2020/06/16/811d25b2e9717a240dd0150beb3e5de1.xlsx','计划实际销售额 (7).xlsx',3776,'file','xlsx','2020-06-16 15:14:41','admin'),('1272789679333228545',NULL,'http://localhost:8888/profile/upload/2020/06/16/1410c9c21452c49fccb731ebbc15562a.xlsx','计划实际销售额 (9).xlsx',3758,'file','xlsx','2020-06-16 15:14:41','admin'),('1272789679366782978',NULL,'http://localhost:8888/profile/upload/2020/06/16/132cf7af6ed4c7226d965a91faf73da5.xlsx','计划实际销售额 (8).xlsx',3777,'file','xlsx','2020-06-16 15:14:42','admin'),('1272789679601664002',NULL,'http://localhost:8888/profile/upload/2020/06/16/c5739c79cc9bb03033f23c08e5a04329.xlsx','计划实际销售额 (10).xlsx',3777,'file','xlsx','2020-06-16 15:14:42','admin'),('1272789679685550082',NULL,'http://localhost:8888/profile/upload/2020/06/16/05bd641af297e6f53a3b07918f386b29.xlsx','计划实际销售额 (11).xlsx',3660,'file','xlsx','2020-06-16 15:14:42','admin'),('1272792846808694786',NULL,'http://localhost:8888/profile/upload/2020/06/16/8c6f54ec3a1ab95efbf5beb3703b0c55.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:27:17','admin'),('1272792860880584705',NULL,'http://localhost:8888/profile/upload/2020/06/16/5cc527c0a77808c10b852d8bfacedd7b.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:27:20','admin'),('1272792870988857346',NULL,'http://localhost:8888/profile/upload/2020/06/16/8567c2b07c5d390f5167fbb7d152a971.xlsx','5aa9f95224465c92f348fad27eb2bda8.xlsx',3683,'file','xlsx','2020-06-16 15:27:22','admin'),('1272792908641124354',NULL,'http://localhost:8888/profile/upload/2020/06/16/204c677ecd4290bec2156b192f5f4826.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:27:31','admin'),('1272792944154296321',NULL,'http://localhost:8888/profile/upload/2020/06/16/955752024266edcb2d5421ab6e237a2f.xlsx','7b942ddc02a8527dd494fd4dbc607249.xlsx',3683,'file','xlsx','2020-06-16 15:27:40','admin'),('1272793016342462465',NULL,'http://localhost:8888/profile/upload/2020/06/16/64fd518f19d3d2a6a87520b9bde2498b.xlsx','1592288882945个人信息数据.xlsx',4840,'file','xlsx','2020-06-16 15:27:57','admin'),('1272793755697594370',NULL,'http://localhost:8888/profile/upload/2020/06/16/429e765c596c1d264e9814d9d9f0220b.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:30:53','admin'),('1272793794696232962',NULL,'http://localhost:8888/profile/upload/2020/06/16/04b29597d6a7cd309fa29c6e3edac20d.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:31:03','admin'),('1272793827751542785',NULL,'http://localhost:8888/profile/upload/2020/06/16/a50ec39c5c6588220919d1c69acef31d.xlsx','计划实际销售额 (3).xlsx',3683,'file','xlsx','2020-06-16 15:31:11','admin'),('1272793827780902914',NULL,'http://localhost:8888/profile/upload/2020/06/16/ebdaa3772e851161d0429543d2a0b8e1.xlsx','计划实际销售额 (5).xlsx',3682,'file','xlsx','2020-06-16 15:31:11','admin'),('1272793827789291522',NULL,'http://localhost:8888/profile/upload/2020/06/16/b542a5a0795fb7ac90a3fed9ffef378a.xlsx','计划实际销售额 (4).xlsx',3682,'file','xlsx','2020-06-16 15:31:11','admin'),('1272794467160604673',NULL,'http://localhost:8888/profile/upload/2020/06/16/29d1e0688174d09412be291c7645a5a7.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:33:43','admin'),('1272794485527461890',NULL,'http://localhost:8888/profile/upload/2020/06/16/e57136c49f22b7018660aa227acd0356.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:33:47','admin'),('1272794485779120129',NULL,'http://localhost:8888/profile/upload/2020/06/16/396f82c6514e4063ce11de0e9763d108.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:33:47','admin'),('1272794503500054529',NULL,'http://localhost:8888/profile/upload/2020/06/16/76721603f7f8bd9f02fc2a1cc300d13f.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:33:52','admin'),('1272794503621689345',NULL,'http://localhost:8888/profile/upload/2020/06/16/37c39c5e8389405b2b173e0f8167ada8.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:33:52','admin'),('1272794515005030402',NULL,'http://localhost:8888/profile/upload/2020/06/16/366a98d0fb486873527f7e98a4f4b7e9.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:33:54','admin'),('1272794557535272962',NULL,'http://localhost:8888/profile/upload/2020/06/16/128d3b30e99f143846483dd711e5770e.xlsx','4f8b59581bb70448fb0389acfbe7a5dd (2).xlsx',3811,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794557598187522',NULL,'http://localhost:8888/profile/upload/2020/06/16/8a67a7ec31eca362e13d708018fce128.xlsx','4f8b59581bb70448fb0389acfbe7a5dd (3).xlsx',3811,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794557635936258',NULL,'http://localhost:8888/profile/upload/2020/06/16/738bfcd580de4b4775d9da9b599a7a88.xlsx','4f8b59581bb70448fb0389acfbe7a5dd.xlsx',3811,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794557858234369',NULL,'http://localhost:8888/profile/upload/2020/06/16/09935af443cbace77dcbe239c120cd76.xlsx','7b942ddc02a8527dd494fd4dbc607249.xlsx',3683,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794557950509058',NULL,'http://localhost:8888/profile/upload/2020/06/16/cabdb11098acdb3c66bad60b07208af4.xlsx','5aa9f95224465c92f348fad27eb2bda8.xlsx',3683,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794699848007681',NULL,'http://localhost:8888/profile/upload/2020/06/16/375164110971963e03861cd659abb7d5.xlsx','4f8b59581bb70448fb0389acfbe7a5dd (2).xlsx',3811,'file','xlsx','2020-06-16 15:34:38','admin'),('1272795261360455681',NULL,'http://localhost:8888/profile/upload/2020/06/16/13c1c44914ce323dfaa2190f9c1e5730.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:36:52','admin'),('1272796128838991874',NULL,'http://localhost:8888/profile/upload/2020/06/16/0455f87cc531aad2dd65ab4496e5c579.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:40:19','admin'),('1272797439286362114',NULL,'http://localhost:8888/profile/upload/2020/06/16/9688930c7802016cb69ed706a9f99362.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:45:32','admin'),('1272797466939408385',NULL,'http://localhost:8888/profile/upload/2020/06/16/29763867b3582286d72e84b9175de1f2.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:45:38','admin'),('1272798693408423937',NULL,'http://localhost:8888/profile/upload/2020/06/16/26c9b7ecee435591b3ec0cdd84d6618c.xlsx','4f8b59581bb70448fb0389acfbe7a5dd (3).xlsx',3811,'file','xlsx','2020-06-16 15:50:31','admin'),('1272798725616484354',NULL,'http://localhost:8888/profile/upload/2020/06/16/98597a2fed260d474100e4e80d973ca4.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:50:38','admin'),('1272798725842976770',NULL,'http://localhost:8888/profile/upload/2020/06/16/8c72291f25e32eb6c1ec5d26ec8364bc.xlsx','1591956011384个人信息数据.xlsx',4840,'file','xlsx','2020-06-16 15:50:38','admin'),('1272798725847171074',NULL,'http://localhost:8888/profile/upload/2020/06/16/ebfd4b6af51792f4f7b5c922523d3886.xlsx','1592288882945个人信息数据.xlsx',4840,'file','xlsx','2020-06-16 15:50:38','admin'),('1272798725842976771',NULL,'http://localhost:8888/profile/upload/2020/06/16/9a145fb0c5d6b6f5f6700b0683b8d1ed.xlsx','bac2ac7c0025bbb682eaf7fd7e96a9f0.xlsx',3731,'file','xlsx','2020-06-16 15:50:38','admin'),('1272798808831475714',NULL,'http://localhost:8888/profile/upload/2020/06/16/0f0cefe556df3540704c09834f01573b.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:50:58','admin'),('1272798841945505793',NULL,'http://localhost:8888/profile/upload/2020/06/16/41c4049bac7714391996635e3f7a5b11.xlsx','bac2ac7c0025bbb682eaf7fd7e96a9f0.xlsx',3731,'file','xlsx','2020-06-16 15:51:06','admin'),('1272798988452544513',NULL,'http://localhost:8888/profile/upload/2020/06/16/07b6aa21b4f36eb1187b2c864cb82af4.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:51:41','admin'),('1272799006643240962',NULL,'http://localhost:8888/profile/upload/2020/06/16/7c0f6b63eea400d3df9113cadd62103d.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:51:45','admin'),('1272805081949999105',NULL,'http://localhost:8888/profile/upload/2020/06/16/405e2a4e8123fb49d8cd1dcf5e111123.png','wormhole-739872.png',1991762,'image','png','2020-06-16 16:15:53','admin'),('1272805132478779393',NULL,'http://localhost:8888/profile/upload/2020/06/16/d55780d3ee946577da37925089d066ce.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 16:16:06','admin'),('1272805193552039937',NULL,'http://localhost:8888/profile/upload/2020/06/16/e41ae5395e24e23be843fd07eac52bfb.xlsx','计划实际销售额 (2).xlsx',3683,'file','xlsx','2020-06-16 16:16:20','admin'),('1272805193614954497',NULL,'http://localhost:8888/profile/upload/2020/06/16/116514c0a1898b05d01f9a49c4ff7be2.xlsx','计划实际销售额 (1).xlsx',3731,'file','xlsx','2020-06-16 16:16:20','admin'),('1272805193682063362',NULL,'http://localhost:8888/profile/upload/2020/06/16/6f832e96ff886b32e35c27ff82e30517.xlsx','计划实际销售额 (3).xlsx',3683,'file','xlsx','2020-06-16 16:16:20','admin'),('1272805193900167170',NULL,'http://localhost:8888/profile/upload/2020/06/16/0190162390bd77c4c88843355a74acb9.xlsx','计划实际销售额 (4).xlsx',3682,'file','xlsx','2020-06-16 16:16:20','admin'),('1272805207099641857',NULL,'http://localhost:8888/profile/upload/2020/06/16/88451909c1633ca879fed1388c8a44b9.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 16:16:24','admin'),('1277788807863771137',NULL,'http://localhost:8888/profile/upload/2020/06/30/d7e2d7537808c797745dc8acedc7b36b.jpg','High-Quality-Fox-Wallpaper.jpg',437826,'file','jpg','2020-06-30 10:19:26','admin'),('1277850061626220546',NULL,'http://localhost:8888/profile/upload/2020/06/30/34c1c2f599ea4afeae8ffdeffc82c59a.png','1593498169000.png',508470,'image','png','2020-06-30 14:22:50','admin'),('1277850085739274242',NULL,'http://localhost:8888/profile/upload/2020/06/30/433fdadae6434f48a05a16f64e26a6a1.png','1593498176000.png',508470,'image','png','2020-06-30 14:22:56','admin'),('1277850709826543617',NULL,'http://localhost:8888/profile/upload/2020/06/30/9ad00b4c7b8da4543f645faf028c3128.png','1593498325000.png',2336052,'image','png','2020-06-30 14:25:25','admin'),('1277851724839723009',NULL,'http://localhost:8888/profile/upload/2020/06/30/dd2b46829a28536fd1eeea1b45faea5d.png','1593498567000.png',3003852,'image','png','2020-06-30 14:29:27','admin'),('1277851782565928961',NULL,'http://localhost:8888/profile/upload/2020/06/30/53d6cb5a2c303658e0d5f18b630daf99.png','1593498580000.png',3798950,'image','png','2020-06-30 14:29:41','admin'),('1277871664992952322',NULL,'http://localhost:8888/profile/upload/2020/06/30/2d2b0d0acfab571497e3e29c3ff8858b.png','1593503321000.png',648320,'image','png','2020-06-30 15:48:41','admin'),('1277871691014414338',NULL,'http://localhost:8888/profile/upload/2020/06/30/6fe54b8d7b76c9c5214a8d7b0e61496c.png','1593503327000.png',648320,'image','png','2020-06-30 15:48:48','admin'),('1277871691966521345',NULL,'http://localhost:8888/profile/upload/2020/06/30/0b9646ffe58fbef511a5a0410639c741.png','1593503327000.png',648320,'image','png','2020-06-30 15:48:48','admin'),('1277871692985737218',NULL,'http://localhost:8888/profile/upload/2020/06/30/ddba8aa81bbccfdde1d65255de8d9688.png','1593503327000.png',648320,'image','png','2020-06-30 15:48:48','admin'),('1277871693862346754',NULL,'http://localhost:8888/profile/upload/2020/06/30/689413a8bc82611e8ae66c437b03771d.png','1593503328000.png',648320,'image','png','2020-06-30 15:48:48','admin'),('1277872987016601602',NULL,'http://localhost:8888/profile/upload/2020/06/30/7a002411da0c446bae3690ff6930b682.png','1593503636000.png',648320,'image','png','2020-06-30 15:53:56','admin'),('1277873984245932034',NULL,'http://localhost:8888/profile/upload/2020/06/30/6a0493777207394779e6c0ba28415c03.png','1593503874000.png',30857,'image','png','2020-06-30 15:57:54','admin'),('1277874183576035329',NULL,'http://localhost:8888/profile/upload/2020/06/30/9243f3fba2568f6dcf78fff4411dfda9.png','1593503921000.png',30857,'image','png','2020-06-30 15:58:42','admin'),('1277874400530604033',NULL,'http://localhost:8888/profile/upload/2020/06/30/3c76285971dd1426a0583bd8f81f4913.png','1593503973000.png',30857,'image','png','2020-06-30 15:59:34','admin'),('1277874422928187394',NULL,'http://localhost:8888/profile/upload/2020/06/30/f6c804f7116de966f4b62ac5a8c23cbc.png','1593503978000.png',30857,'image','png','2020-06-30 15:59:39','admin'),('1277874441987104770',NULL,'http://localhost:8888/profile/upload/2020/06/30/3071b1c279aafdc83e1ee99e65a58f93.png','1593503983000.png',28525,'image','png','2020-06-30 15:59:43','admin'),('1277874455262076929',NULL,'http://localhost:8888/profile/upload/2020/06/30/bd7cb09c7a8c4c21592ec0fef4ca5901.png','1593503986000.png',28561,'image','png','2020-06-30 15:59:47','admin'),('1277880142973181953',NULL,'http://localhost:8888/profile/upload/2020/06/30/f65a471f883f33e25c3186a93bc3b894.png','1593505342000.png',30857,'image','png','2020-06-30 16:22:23','admin'),('1277881088704847874',NULL,'http://localhost:8888/profile/upload/2020/06/30/bbb5a86856bba563f17522534a660339.png','1593505567000.png',1499375,'image','png','2020-06-30 16:26:08','admin'),('1277881181377994754',NULL,'http://localhost:8888/profile/upload/2020/06/30/5fee250b9156f4254437c05fe28bc1fc.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-06-30 16:26:30','admin'),('1277881197526065153',NULL,'http://localhost:8888/profile/upload/2020/06/30/915813b25c1cc6ca0c253b2baf5bf7c7.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-06-30 16:26:34','admin'),('1277881197559619586',NULL,'http://localhost:8888/profile/upload/2020/06/30/068a489d4f17f3b3e7753431b87cc0af.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47418,'image','jpg','2020-06-30 16:26:34','admin'),('1277881197886775297',NULL,'http://localhost:8888/profile/upload/2020/06/30/6881df57b26ce9ef3ec7b21f7ed87da5.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-06-30 16:26:34','admin'),('1277881219198033921',NULL,'http://localhost:8888/profile/upload/2020/06/30/4cac4ff855cb75ef35dc67dbcf8cf89d.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'file','jpg','2020-06-30 16:26:39','admin'),('1277881918015217666',NULL,'http://localhost:8888/profile/upload/2020/06/30/e4c3446609e79a268f4e0f814d7d8064.png','1593505765000.png',2172120,'image','png','2020-06-30 16:29:26','admin'),('1277884286622572546',NULL,'http://localhost:8888/profile/upload/2020/06/30/075443e8d04a002b8c517cc60d237f99.png','1593506330000.png',1978266,'image','png','2020-06-30 16:38:51','admin'),('1277884375491485697',NULL,'http://localhost:8888/profile/upload/2020/06/30/e874a58f1d63397e9211aa05dd09d226.png','1593506351000.png',66092,'image','png','2020-06-30 16:39:12','admin'),('1277884858260070401',NULL,'http://localhost:8888/profile/upload/2020/06/30/1730e69aaa2e70b66047b0bc2c320a0b.jpg','1593506466000.jpg',3137,'image','jpg','2020-06-30 16:41:07','admin'),('1277885022743896066',NULL,'http://localhost:8888/profile/upload/2020/06/30/a8c8f752a4fb06ff35bd1c6d10f65d20.jpg','1593506505000.jpg',8203,'image','jpg','2020-06-30 16:41:46','admin'),('1277885184472064001',NULL,'http://localhost:8888/profile/upload/2020/06/30/377f7d1d7410374a20d3f4d6a13bd7da.jpg','1593506544000.jpg',51318,'image','jpg','2020-06-30 16:42:25','admin'),('1282512820741672961',NULL,'http://localhost:8888/profile/upload/2020/07/13/6c398c202f9c8d366bda3ab2017f8e75.jpg','1594609858000.jpg',1663682,'image','jpg','2020-07-13 11:10:59','admin'),('1282512836776497154',NULL,'http://localhost:8888/profile/upload/2020/07/13/a9861ef3045815b301f1c617bcb4dc71.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-07-13 11:11:03','admin'),('1282512849220997122',NULL,'http://localhost:8888/profile/upload/2020/07/13/0292f77e62fc2ad853d6a5f93720163d.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-07-13 11:11:06','admin'),('1282512918582202370',NULL,'http://localhost:8888/profile/upload/2020/07/13/3f94fc9761ae8d15f42452a2d8d50780.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'file','jpg','2020-07-13 11:11:22','admin'),('1282587648920154113',NULL,'http://localhost:8888/profile/upload/2020/07/13/63b3491918c03307af5bb8c25b35145f.jpg','1594627698000.jpg',1056549,'image','jpg','2020-07-13 16:08:19','admin'),('1282587689609097217',NULL,'http://localhost:8888/profile/upload/2020/07/13/c96f5150f3934f0ddc0b657abd27f41b.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'file','jpg','2020-07-13 16:08:29','admin'),('1288009542855045122',NULL,'http://localhost:8888/profile/upload/2020/07/28/999f51b159eac786dbf0e9b36ddb6c01.jpg','1595920379000.jpg',197636,'image','jpg','2020-07-28 15:12:59','admin'),('1288009954999939074',NULL,'http://localhost:8888/profile/upload/2020/07/28/ebd46694ab2575a9bf422633972c9509.jpg','1595920477000.jpg',147630,'image','jpg','2020-07-28 15:14:38','admin'),('1288010053662552066',NULL,'http://localhost:8888/profile/upload/2020/07/28/0b4e74a7810482754028a8a59605d9d5.jpg','1595920501000.jpg',783050,'image','jpg','2020-07-28 15:15:02','admin'),('1288010193911689218',NULL,'http://localhost:8888/profile/upload/2020/07/28/202c76d50107598ed955030c9865ae6a.jpg','1595920534000.jpg',783050,'image','jpg','2020-07-28 15:15:35','admin'),('1288010496014823425',NULL,'http://localhost:8888/profile/upload/2020/07/28/17a0745ba8fccfbac8d336417096450e.jpg','1595920606000.jpg',1758493,'image','jpg','2020-07-28 15:16:47','admin'),('1288019901951258626',NULL,'http://localhost:8888/profile/upload/2020/07/28/a52489eca8ceada4c0020ed8a031e833.jpg','1595922849000.jpg',1612987,'image','jpg','2020-07-28 15:54:10','admin'),('1288639088763609089',NULL,'http://localhost:8888/profile/upload/2020/07/30/96d0a5fa8b1258cfe882811feae6f1b2.jpg','1596070474000.jpg',1066940,'image','jpg','2020-07-30 08:54:35','admin'),('1290094929626853377',NULL,'http://localhost:8888/profile/upload/2020/08/03/c2824031c5befb0c2f670101a1285995.jpg','wallpaper.wiki-Free-Desktop-3D-Photos-Pictures-PIC-WPE0013433.jpg',147449,'image','jpg','2020-08-03 09:19:34','admin'),('1290095891720499201',NULL,'http://localhost:8888/profile/upload/2020/08/03/97e9cb88885f37b3ae544ebd4b7f3202.jpg','1596417804000.jpg',1187584,'image','jpg','2020-08-03 09:23:24','admin'),('1290095946401640449',NULL,'http://localhost:8888/profile/upload/2020/08/03/7b9231af5e7146743caa403f02c7dfdb.jpg','1596417817000.jpg',712483,'image','jpg','2020-08-03 09:23:37','admin'),('1290096078501244930',NULL,'http://localhost:8888/profile/upload/2020/08/03/f282940604856ac19c5b22220c39e732.jpg','1596417848000.jpg',569011,'image','jpg','2020-08-03 09:24:09','admin'),('1290096813867593729',NULL,'http://localhost:8888/profile/upload/2020/08/03/6db14bf71a6ecb2d73f6bfb28699f4cb.jpg','1596418023000.jpg',564301,'image','jpg','2020-08-03 09:27:04','admin'),('1290096870146764802',NULL,'http://localhost:8888/profile/upload/2020/08/03/2fcb906782387d8c92f0571befe4536e.jpg','1596418037000.jpg',279159,'image','jpg','2020-08-03 09:27:17','admin'),('1290096930838343682',NULL,'http://localhost:8888/profile/upload/2020/08/03/a540eb6f12f57ba1a013bc1acc154d39.jpg','Funny-Cat-Wallpapers-download-001.jpg',246392,'image','jpg','2020-08-03 09:27:32','admin'),('1290477693748391937',NULL,'http://localhost:8888/profile/upload/2020/08/04/0b9f290b60bb25b41274984d1e46517d.jpg','1596508832000.jpg',569011,'image','jpg','2020-08-04 10:40:32','admin'),('1314736180783259649',NULL,'http://localhost:8888/profile/upload/2020/10/10/9b7dc706347c743730174c03b9e430a4.jpg','1602292503000.jpg',5470255,'image','jpg','2020-10-10 09:15:05','admin'),('1314736308264935426',NULL,'http://localhost:8888/profile/upload/2020/10/10/74a840b0d8e3b86068d4b94db0007028.jpg','IMG_20150122_123703.jpg',250189,'image','jpg','2020-10-10 09:15:37','admin'),('1323467626993790977',NULL,'http://localhost:8888/profile/upload/2020/11/03/9d0d71c169b786463f7acb4226994a57.jpg','1604374245000.jpg',146069,'image','jpg','2020-11-03 11:30:45','admin'),('1329702419884412930',NULL,'http://localhost:8888/profile/upload/2020/11/20/a44fef17eef18e0e1fcca9585aa3e02d.jpg','1605860735000.jpg',1434868,'image','jpg','2020-11-20 16:25:36','admin'),('1329702432433770498',NULL,'http://localhost:8888/profile/upload/2020/11/20/6c09050c32d8f63700a62b80a4020c67.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47403,'image','jpg','2020-11-20 16:25:39','admin'),('1329702444211376130',NULL,'http://localhost:8888/profile/upload/2020/11/20/77c60b3e3866b204bb95f7475a2ff758.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174552,'image','jpg','2020-11-20 16:25:42','admin'),('1329702455229812737',NULL,'http://localhost:8888/profile/upload/2020/11/20/f6fdbef52aeef4240468d19507b8bbcb.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174552,'image','jpg','2020-11-20 16:25:45','admin'),('1329702470828429314',NULL,'http://localhost:8888/profile/upload/2020/11/20/959607626d258dbb8d40076f33db1f85.jpg','3b441a674d25deecacea70a715add339.jpg',303527,'image','jpg','2020-11-20 16:25:48','admin'),('1329702483407147009',NULL,'http://localhost:8888/profile/upload/2020/11/20/a7e31ac1375769d48d1e4dce3642fa5e.jpg','3b441a674d25deecacea70a715add339.jpg',303527,'file','jpg','2020-11-20 16:25:51','admin'),('1329702494912122881',NULL,'http://localhost:8888/profile/upload/2020/11/20/b383f545bfbcc66d163d9a2a8555f721.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174552,'file','jpg','2020-11-20 16:25:54','admin'),('1333607223023124481',NULL,'http://localhost:8888/profile/upload/2020/12/01/d359d0f75e8b80d94f3875dc65a4ee04.jpg','r1vOJLNd5B.jpg',196085,'image','jpg','2020-12-01 11:01:54','admin'),('1333607243290001410',NULL,'http://localhost:8888/profile/upload/2020/12/01/b320296c9f63cb847df7de871c8d1388.jpg','O2JhhM7JFc.jpg',227722,'file','jpg','2020-12-01 11:01:59','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
