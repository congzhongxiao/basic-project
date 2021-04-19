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

insert  into `person`(`id`,`name`,`age`,`birthday`,`gender`,`address`,`summary`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1258666571995344897','张三15',24,'2020-01-16',2,'山东临沂15','我厉害了15','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571982761985','张三14',23,'2020-01-14',1,'山东临沂14','我厉害了14','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571970179073','张三13',22,'2020-01-13',0,'山东临沂13','我厉害了13','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571961790466','张三12',21,'2020-01-12',2,'山东临沂12','我厉害了12','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571949207553','张三11',20,'2020-01-11',0,'山东临沂11','我厉害了11','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571940818945','张三10',19,'2020-01-10',1,'山东临沂10','我厉害了10','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571924041730','张三9',18,'2020-01-09',2,'山东临沂9','我厉害了9','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571915653122','张三8',17,'2020-01-08',0,'山东临沂8','我厉害了8','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571907264514','张三7',16,'2020-01-07',1,'山东临沂7','我厉害了7','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571894681602','张三6',15,'2020-01-06',0,'山东临沂6','我厉害了6','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571886292994','张三5',14,'2020-01-05',1,'山东临沂5','我厉害了5','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571873710081','张三4',13,'2020-01-04',0,'山东临沂4','我厉害了4','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571852738561','张三3',12,'2020-01-03',2,'山东临沂3','我厉害了3','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571844349953','张三2',11,'2020-01-02',1,'山东临沂2','我厉害了2','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571831767042','张三1',10,'2020-01-01',1,'山东临沂1','我厉害了1','admin','2020-05-08 15:54:30',NULL,NULL),('1258670326111272962','张三1',10,'2020-01-01',1,'山东临沂1','我厉害了1','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326161604610','张三2',11,'2020-01-02',1,'山东临沂2','我厉害了2','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326182576129','张三3',12,'2020-01-03',2,'山东临沂3','我厉害了3','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326207741953','张三4',13,'2020-01-04',0,'山东临沂4','我厉害了4','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326224519170','张三5',14,'2020-01-05',1,'山东临沂5','我厉害了5','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326245490690','张三6',15,'2020-01-06',0,'山东临沂6','我厉害了6','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326279045121','张三7',16,'2020-01-07',1,'山东临沂7','我厉害了7','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326304210945','张三8',17,'2020-01-08',0,'山东临沂8','我厉害了8','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326329376770','张三9',18,'2020-01-09',2,'山东临沂9','我厉害了9','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326354542593','张三10',19,'2020-01-10',1,'山东临沂10','我厉害了10','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326362931202','张三11',20,'2020-01-11',0,'山东临沂11','我厉害了11','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326388097026','张三12',21,'2020-01-12',2,'山东临沂12','我厉害了12','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326421651458','张三13',22,'2020-01-13',0,'山东临沂13','我厉害了13','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326434234369','张三14',23,'2020-01-14',1,'山东临沂14','我厉害了14','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326455205889','张三15',24,'2020-01-15',2,'山东临沂15','我厉害了15','admin','2020-05-08 16:09:25',NULL,NULL),('1377193036516208642','111',111,'2021-03-09',0,'11','111','admin','2021-03-31 17:36:22','admin','2021-03-31 17:36:22');

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
  `content` longtext COMMENT '详情',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`author`,`detail`,`cut_id`,`cut_url`,`short_id`,`short_image`,`create_by`,`create_time`,`update_by`,`update_time`,`content`) values ('1272789700896145410','作品上传1','小飞侠1','擦擦擦',NULL,NULL,'1290094929626853377','http://localhost:8888/profile/upload/2020/08/03/c2824031c5befb0c2f670101a1285995.jpg','admin','2020-06-16 15:14:47','admin','2020-10-10 09:15:40',NULL),('1272792876982517762','测试2','ccc','',NULL,NULL,'1272792846808694786','http://localhost:8888/profile/upload/2020/06/16/8c6f54ec3a1ab95efbf5beb3703b0c55.png','admin','2020-06-16 15:27:24',NULL,NULL,NULL),('1272794581895790594','测试会议2','ccc ','ccc',NULL,NULL,'1272794467160604673','http://localhost:8888/profile/upload/2020/06/16/29d1e0688174d09412be291c7645a5a7.jpg','admin','2020-06-16 15:34:10',NULL,NULL,NULL),('1277881221693644801','SEO标题','ccc','','1277881088704847874','http://localhost:8888/profile/upload/2020/06/30/bbb5a86856bba563f17522534a660339.png','1277881181377994754','http://localhost:8888/profile/upload/2020/06/30/5fee250b9156f4254437c05fe28bc1fc.jpg','admin','2020-06-30 16:26:40',NULL,NULL,NULL),('1282512922944278530','设计分类','oo','','1282512820741672961','http://localhost:8888/profile/upload/2020/07/13/6c398c202f9c8d366bda3ab2017f8e75.jpg','1344105529587322881','http://localhost:8888/profile/upload/2020/12/30/01d5c97ec87c502058d91e1b263c37c2.jpg','admin','2020-07-13 11:11:23','admin','2020-12-30 10:18:30',NULL),('1383951652699037697','&lt;script&gt;alert(&#39;drj&#39;)&lt;/script&gt;','汽车之家',NULL,'1383951492837335042','/profile/upload/images/2021/04/19/efc461435a2d6f39afffdc65f1ee37df.jpg','1383951520393912322','/profile/upload/images/2021/04/19/073dddbf798e8ec53b00c8750000e26d.jpg','admin','2021-04-19 09:12:41','admin','2021-04-19 09:18:22','&lt;p class=&quot;contentFont&quot; style=&quot;padding: 0px 17px; margin: 0.24rem auto 0px; text-size-adjust: 100%; text-align: justify; font-size: 0.19rem; line-height: 0.3rem; width: 740px; box-sizing: border-box; font-family: -apple-system-font, &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;4月13日，局面突然缓和下来。拜登致电普京，提议在未来几个月内在第三国举行面对面会谈。两位总统同意研究举行峰会的可能性，&lt;/p&gt;&lt;p class=&quot;contentFont&quot; style=&quot;padding: 0px 17px; margin: 0.24rem auto 0px; text-size-adjust: 100%; text-align: justify; font-size: 0.19rem; line-height: 0.3rem; width: 740px; box-sizing: border-box; font-family: -apple-system-font, &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;contentFont&quot; style=&quot;padding: 0px 17px; margin: 0.24rem auto 0px; text-size-adjust: 100%; text-align: justify; font-size: 0.19rem; line-height: 0.3rem; width: 740px; box-sizing: border-box; font-family: -apple-system-font, &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;并表示愿意继续接触。&lt;/p&gt;&lt;p style=&quot;padding: 0px; margin-top: 0px; margin-bottom: 0px; width: 740px; box-sizing: border-box; font-family: -apple-system-font, &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img border=&quot;0&quot; src=&quot;/profile/upload/ueditor/2021/04/19/8d9f85145b3f6b1d60f13916a2bb6a1d.jpg&quot; data-width=&quot;600.0&quot; data-height=&quot;421.0&quot; data-index=&quot;0&quot; style=&quot;padding: 0px; margin: 0.24rem auto 0px; max-width: 100%; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 0px; margin-top: 0px; margin-bottom: 0px; width: 740px; box-sizing: border-box; font-family: -apple-system-font, &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;contentFont&quot; style=&quot;padding: 0px 17px; margin: 0.24rem auto 0px; text-size-adjust: 100%; text-align: justify; font-size: 0.19rem; line-height: 0.3rem; width: 740px; box-sizing: border-box; font-family: -apple-system-font, &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;▲资料图：普京（新华社）&lt;/p&gt;&lt;p class=&quot;contentFont&quot; style=&quot;padding: 0px 17px; margin: 0.24rem auto 0px; text-size-adjust: 100%; text-align: justify; font-size: 0.19rem; line-height: 0.3rem; width: 740px; box-sizing: border-box; font-family: -apple-system-font, &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;contentFont&quot; style=&quot;padding: 0px 17px; margin: 0.24rem auto 0px; text-size-adjust: 100%; text-align: justify; font-size: 0.19rem; line-height: 0.3rem; width: 740px; box-sizing: border-box; font-family: -apple-system-font, &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;4月15日获悉，美国人决定不向黑海派遣两艘驱逐舰。然而，这一“释压”举措立即被一揽子新的大规模反俄制裁抵消。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');

/*Table structure for table `product_file` */

DROP TABLE IF EXISTS `product_file`;

CREATE TABLE `product_file` (
  `product_id` varchar(100) DEFAULT NULL COMMENT '作品id',
  `file_id` varchar(100) DEFAULT NULL COMMENT '文件id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_file` */

insert  into `product_file`(`product_id`,`file_id`) values ('1272789700896145410','1272789679136096257'),('1272789700896145410','1272805193614954497'),('1272789700896145410','1272805193552039937'),('1272789700896145410','1272805193682063362'),('1272789700896145410','1272805193900167170'),('1272792876982517762','1272792870988857346'),('1272794581895790594','1272794557858234369'),('1272794581895790594','1272794557950509058'),('1272794581895790594','1272794557635936258'),('1272794581895790594','1272794557598187522'),('1277881221693644801','1277881219198033921'),('1282512922944278530','1344105469491335169'),('1383951652699037697','1383951588463271937');

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `product_id` varchar(100) DEFAULT NULL COMMENT '作品主键',
  `image_id` varchar(100) DEFAULT NULL COMMENT '图片主键'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_image` */

insert  into `product_image`(`product_id`,`image_id`) values ('1272789700896145410','1272789655337615361'),('1272792876982517762','1272792860880584705'),('1272794581895790594','1272794515005030402'),('1272794581895790594','1272794503621689345'),('1272794581895790594','1272794503500054529'),('1272794581895790594','1272794485779120129'),('1272794581895790594','1272794485527461890'),('1272789700896145410','1272805132478779393'),('1272789700896145410','1272805207099641857'),('1272789700896145410','1272805081949999105'),('1277881221693644801','1277881197886775297'),('1277881221693644801','1277881197559619586'),('1277881221693644801','1277881197526065153'),('1282512922944278530','1344105447584485378'),('1282512922944278530','1344105438696755202'),('1383951652699037697','1383951553713463297'),('1383951652699037697','1383951553503748098'),('1383951652699037697','1383951553340170242'),('1383951652699037697','1383951553084317698'),('1383951652699037697','1383951552841048066');

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

insert  into `sys_area`(`id`,`pid`,`ancestors`,`code`,`name`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1333620410082713601','0','0','100','北京市',0,'admin','2020-12-01 11:54:18','admin','2020-12-16 14:04:38'),('1333620468643586050','1333620410082713601','0,1333620410082713601','10010','北京市',0,'admin','2020-12-01 11:54:32',NULL,NULL),('1333620561811660801','1333620514982256641','0,1333620514982256641','2001','济南市',0,'admin','2020-12-01 11:54:54',NULL,NULL),('1333620606518747138','1333620514982256641','0,1333620514982256641','2002','临沂市',0,'admin','2020-12-01 11:55:05',NULL,NULL),('1333620671056502785','1333620606518747138','0,1333620514982256641,1333620606518747138','200201','兰山区',0,'admin','2020-12-01 11:55:20',NULL,NULL),('1333620714450771970','1333620606518747138','0,1333620514982256641,1333620606518747138','200202','河东区',0,'admin','2020-12-01 11:55:30','admin','2020-12-16 11:42:22'),('1334039974843060226','1333620714450771970','0,1333620514982256641,1333620606518747138,1333620714450771970','371312','芝麻墩街道',0,'admin','2020-12-02 15:41:30',NULL,NULL),('1334040060784349185','1333620714450771970','0,1333620514982256641,1333620606518747138,1333620714450771970','371311','经济技术开发区',0,'admin','2020-12-02 15:41:50','admin','2020-12-16 11:42:13'),('1339053251536883714','1333620714450771970','0,1333620514982256641,1333620606518747138,1333620714450771970','sys_11','11111222',11,'admin','2020-12-16 11:42:28','admin','2020-12-16 11:42:55'),('1372090971511087106','1333620410082713601','0,1333620410082713601','0101','测试',0,'admin','2021-03-17 15:42:34','admin','2021-03-17 16:21:19');

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

insert  into `sys_operate_log`(`id`,`name`,`type`,`method`,`request_type`,`oper_type`,`oper_user_id`,`oper_user_name`,`oper_user_account`,`oper_time`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`result_param`,`state`,`error_msg`) values ('1341193832446947330','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-22 09:28:22','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1341196119563051009','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-22 09:37:27','/login','127.0.0.1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1341555262434111490','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-23 09:24:34','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1344105343498637313','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2020-12-30 10:17:40','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1346635762035146754','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-01-06 09:52:39','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372031372628094978','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 11:45:45','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372033461664190466','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 11:54:03','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372396164442329090','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-18 11:55:18','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372076669144223746','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 14:45:44','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372086228890005506','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 15:23:44','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372087514385461250','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 15:28:50','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372090877827112962','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 15:42:12','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372092089318264834','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 15:47:01','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372094658618871809','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 15:57:14','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372097653033160706','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 16:09:07','/login','127.0.0.1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372097993895882753','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 16:10:29','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372099465207447553','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 16:16:19','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372101040650944513','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 16:22:35','/login','127.0.0.1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372104743881588737','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 16:37:18','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372109877458100226','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 16:57:42','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1372110796463579138','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-17 17:01:21','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1374553560165924865','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-24 10:48:01','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1374554280621633537','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-24 10:50:53','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1374555330439024642','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-24 10:55:03','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1374906756369530881','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-25 10:11:30','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1377192961962455041','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-03-31 17:36:03','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1383944711188828162','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-04-19 08:45:06','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL),('1383950238677524482','系统登录',0,'com.basic.controller.LoginController.doLogin()','POST',1,'1242327057416970241','超级管理员','admin','2021-04-19 09:07:04','/login','0:0:0:0:0:0:0:1','内网IP','{\r\n  \"username\" : [ \"admin\" ],\r\n  \"password\" : [ \"admin\" ]\r\n}','{\r\n  \"success\" : true,\r\n  \"message\" : \"登录成功\",\r\n  \"code\" : 1000\r\n}',0,NULL);

/*Table structure for table `sys_organization` */

DROP TABLE IF EXISTS `sys_organization`;

CREATE TABLE `sys_organization` (
  `id` varchar(100) NOT NULL COMMENT '组织id',
  `pid` varchar(100) DEFAULT '0' COMMENT '父级组织id',
  `ancestors` varchar(300) DEFAULT '' COMMENT '祖级列表',
  `name` varchar(30) DEFAULT '' COMMENT '组织名称',
  `sort` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` int(2) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `isdel` int(2) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `org_type` varchar(10) DEFAULT '0' COMMENT '组织类型：0公司 1部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织架构表';

/*Data for the table `sys_organization` */

insert  into `sys_organization`(`id`,`pid`,`ancestors`,`name`,`sort`,`leader`,`phone`,`email`,`status`,`isdel`,`create_by`,`create_time`,`update_by`,`update_time`,`org_type`) values ('1372095692485447681','0','0','临沂云达有限公司',0,'王xxx','18989898899',NULL,0,0,'admin','2021-03-17 16:01:20','admin','2021-03-17 16:01:20','0'),('1372096169965015041','1372095692485447681','0,1372095692485447681','实施部',0,'王佳佳','',NULL,0,0,'admin','2021-03-17 16:03:14','admin','2021-03-17 16:03:14','0'),('1372096215171223553','1372095692485447681','0,1372095692485447681','研发部',0,'赵佳佳','',NULL,0,0,'admin','2021-03-17 16:03:25','admin','2021-03-17 16:21:02','0'),('1372096260675227650','1372096215171223553','0,1372095692485447681,1372096215171223553','研发一组',0,'真佳佳','',NULL,0,0,'admin','2021-03-17 16:03:36','admin','2021-03-17 16:24:56','0'),('1372096293256581121','1372096215171223553','0,1372095692485447681,1372096215171223553','研发二组',0,'','',NULL,0,0,'admin','2021-03-17 16:03:43','admin','2021-03-17 16:22:49','0');

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

insert  into `sys_user`(`id`,`username`,`password`,`salt`,`nickname`,`email`,`mobile`,`icon`,`status`,`create_time`,`create_by`,`update_time`,`update_by`,`remark`) values ('1242327057416970241','admin','7b28802579cb4aa35d7a30c32e0479a8','cf4agc8a0w','超级管理员','admin2@qq.com','18858868888',NULL,1,'2020-03-24 13:47:06',NULL,'2020-03-24 14:01:52',NULL,NULL);

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

insert  into `upload_files`(`id`,`storage`,`url`,`name`,`size`,`type`,`extension`,`create_time`,`create_by`) values ('1344105438696755202',NULL,'http://localhost:8888/profile/upload/2020/12/30/4b6cb44a3d88af747afc24b7bf4418cb.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47403,'image','jpg','2020-12-30 10:18:04','admin'),('1344105447584485378',NULL,'http://localhost:8888/profile/upload/2020/12/30/1a644d2b53dcd42c183dccd24e4ed4c1.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174552,'image','jpg','2020-12-30 10:18:06','admin'),('1344105469491335169',NULL,'http://localhost:8888/profile/upload/2020/12/30/8d0ebe1c3b6bc6daceaf74b7d422aa9b.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47403,'file','jpg','2020-12-30 10:18:11','admin'),('1344105529587322881',NULL,'http://localhost:8888/profile/upload/2020/12/30/01d5c97ec87c502058d91e1b263c37c2.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174552,'image','jpg','2020-12-30 10:18:25','admin'),('1372031689063165953',NULL,'http://localhost:8888/profile/upload/2021/03/17/f2a8cfc96c51ca1d92571ac118dc2ce3.jpg','1-20102GG1380-L.jpg',22071,'file','jpg','2021-03-17 11:47:00','admin'),('1372031701100818433',NULL,'http://localhost:8888/profile/upload/2021/03/17/5bef13491bbfe02a3aa44499a801dc49.jpg','1-20102G625400-L.jpg',30210,'image','jpg','2021-03-17 11:47:03','admin'),('1372031754410422273',NULL,'http://localhost:8888/profile/upload/2021/03/17/e32f6ce48c846a3641a37bda196563b4.jpg','1615952836000.jpg',65265,'image','jpg','2021-03-17 11:47:16','admin'),('1383951492837335042',NULL,'/profile/upload/images/2021/04/19/efc461435a2d6f39afffdc65f1ee37df.jpg','1618794723000.jpg',340205,'image/jpeg','jpg','2021-04-19 09:12:03','admin'),('1383951520393912322',NULL,'/profile/upload/images/2021/04/19/073dddbf798e8ec53b00c8750000e26d.jpg','160041F02RV0-1O193.jpg',65419,'image/jpeg','jpg','2021-04-19 09:12:10','admin'),('1383951552841048066',NULL,'/profile/upload/images/2021/04/19/a7f2a872ae34946f17b536d2418d7d56.jpg','160041F4H3310-191516-1.jpg',166652,'image/jpeg','jpg','2021-04-19 09:12:17','admin'),('1383951553084317698',NULL,'/profile/upload/images/2021/04/19/6857bff728db4fedb9494e3690647ba6.jpg','160041F21Y130-Q546.jpg',43171,'image/jpeg','jpg','2021-04-19 09:12:17','admin'),('1383951553340170242',NULL,'/profile/upload/images/2021/04/19/97cd50799cbfb325d6f5a3cc33ef78d3.jpg','160041F21Y130-Q546-1.jpg',43171,'image/jpeg','jpg','2021-04-19 09:12:18','admin'),('1383951553503748098',NULL,'/profile/upload/images/2021/04/19/8e5fdb65de8271a3115f5f25a47c5e52.jpg','160041F23A160-91594.jpg',59107,'image/jpeg','jpg','2021-04-19 09:12:18','admin'),('1383951553713463297',NULL,'/profile/upload/images/2021/04/19/83ba294c0b7627ebea1207ff1b381412.jpg','160041F23A160-91594-1.jpg',59107,'image/jpeg','jpg','2021-04-19 09:12:18','admin'),('1383951588463271937',NULL,'/profile/upload/images/2021/04/19/2f9eb9ded69b7c5cf19929200c49483d.jpg','160041G45X0-20S64.jpg',33214,'file','jpg','2021-04-19 09:12:26','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
