/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 8.0.26 : Database - basic-project-group
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE
DATABASE /*!32312 IF NOT EXISTS*/`basic-project-group` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE
`basic-project-group`;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`
(
    `id`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
    `age`         int NULL DEFAULT 0 COMMENT '年龄',
    `birthday`    date NULL DEFAULT NULL COMMENT '出生日期',
    `gender`      int NULL DEFAULT 0 COMMENT '性别',
    `address`     varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
    `summary`     text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person`
VALUES ('1258666571831767042', '张三1', 10, '2020-01-01', 1, '山东临沂1', '我厉害了1', 'admin', '2020-05-08 15:54:30', 'ceshi',
        '2021-11-01 17:09:02');
INSERT INTO `person`
VALUES ('1258666571844349953', '张三2', 11, '2020-01-02', 1, '山东临沂2', '我厉害了2', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571852738561', '张三3', 12, '2020-01-03', 2, '山东临沂3', '我厉害了3', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571873710081', '张三4', 13, '2020-01-04', 0, '山东临沂4', '我厉害了4', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571886292994', '张三5', 14, '2020-01-05', 1, '山东临沂5', '我厉害了5', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571894681602', '张三6', 15, '2020-01-06', 0, '山东临沂6', '我厉害了6', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571907264514', '张三7', 16, '2020-01-07', 1, '山东临沂7', '我厉害了7', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571915653122', '张三8', 17, '2020-01-08', 0, '山东临沂8', '我厉害了8', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571924041730', '张三9', 18, '2020-01-09', 2, '山东临沂9', '我厉害了9', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571949207553', '张三11', 20, '2020-01-11', 0, '山东临沂11', '我厉害了11', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571961790466', '张三12', 21, '2020-01-12', 2, '山东临沂12', '我厉害了12', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571970179073', '张三13', 22, '2020-01-13', 0, '山东临沂13', '我厉害了13', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571982761985', '张三14', 23, '2020-01-14', 1, '山东临沂14', '我厉害了14', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258666571995344897', '张三15', 24, '2020-01-16', 2, '山东临沂15', '我厉害了15', 'admin', '2020-05-08 15:54:30', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326111272962', '张三1', 10, '2020-01-01', 1, '山东临沂1', '我厉害了1', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326161604610', '张三2', 11, '2020-01-02', 1, '山东临沂2', '我厉害了2', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326182576129', '张三3', 12, '2020-01-03', 2, '山东临沂3', '我厉害了3', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326207741953', '张三4', 13, '2020-01-04', 0, '山东临沂4', '我厉害了4', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326224519170', '张三5', 14, '2020-01-05', 1, '山东临沂5', '我厉害了5', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326245490690', '张三6', 15, '2020-01-06', 0, '山东临沂6', '我厉害了6', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326279045121', '张三7', 16, '2020-01-07', 1, '山东临沂7', '我厉害了7', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326304210945', '张三8', 17, '2020-01-08', 0, '山东临沂8', '我厉害了8', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326329376770', '张三9', 18, '2020-01-09', 2, '山东临沂9', '我厉害了9', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326354542593', '张三10', 19, '2020-01-10', 1, '山东临沂10', '我厉害了10', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326362931202', '张三11', 20, '2020-01-11', 0, '山东临沂11', '我厉害了11', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326388097026', '张三12', 21, '2020-01-12', 2, '山东临沂12', '我厉害了12', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326421651458', '张三13', 22, '2020-01-13', 0, '山东临沂13', '我厉害了13', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326434234369', '张三14', 23, '2020-01-14', 1, '山东临沂14', '我厉害了14', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1258670326455205889', '张三15', 24, '2020-01-15', 2, '山东临沂15', '我厉害了15', 'admin', '2020-05-08 16:09:25', NULL,
        NULL);
INSERT INTO `person`
VALUES ('1377193036516208642', '111', 111, '2021-03-09', 0, '11', '111', 'admin', '2021-03-31 17:36:22', 'admin',
        '2021-03-31 17:36:22');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`
(
    `id`             varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `name`           varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
    `author`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
    `detail`         text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
    `cut_id`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '裁切图id',
    `cut_url`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '裁切图url',
    `short_image_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图id',
    `short_image`    varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
    `create_by`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
    `update_time`    datetime NULL DEFAULT NULL COMMENT '修改时间',
    `content`        longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product`
VALUES ('1455337103508328449', '测试作品一', '111', NULL, '', '', '1455337044876152833',
        '/profile/upload/images/20211102/2adaf8dc2f9740c560648c75bdb9cafa.png', 'admin', '2021-11-02 08:52:59', 'admin',
        '2021-11-09 14:01:48',
        '&lt;p&gt;&lt;strong&gt;啊啊啊啊啊啊啊啊啊啊啊啊啊a的&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;阿达&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;img src=&quot;/profile/upload/ueditor/20211109/3721adb7f7357bd970f502e123411eb7.jpg&quot; title=&quot;255e79ab044144ef647327bab8a72cd0.jpg&quot; alt=&quot;255e79ab044144ef647327bab8a72cd0.jpg&quot; width=&quot;758&quot; height=&quot;149&quot; style=&quot;width: 758px; height: 149px;&quot;/&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;adadaad&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;阿斯大大阿达&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;ada的&lt;/strong&gt;&lt;/p&gt;');
INSERT INTO `product`
VALUES ('1455337377887113218', '测试作品二', '王二小', NULL, '', '', '1455337278314336258',
        '/profile/upload/images/20211102/1823d85a051072fd37c82333a79d1790.jpg', 'admin', '2021-11-02 08:54:04', 'admin',
        '2021-11-02 09:02:21', '121212');
INSERT INTO `product`
VALUES ('1457980885806546945', '测试', '测试', NULL, NULL, NULL, NULL,
        '/profile/upload/images/20211109/f1db8818fcee5d179e331e64662bafef.jpg', 'admin', '2021-11-09 15:58:26', 'admin',
        '2021-11-09 15:58:26',
        '&lt;p&gt;sys_upload_filessys_upload_filessys_upload_filessys_upload_filessys_upload_filessys_upload_filessys_upload_filessys_upload_filessys_upload_filessys_upload_filessys_upload_filessys_upload_files&lt;img src=&quot;/profile/upload/ueditor/20211109/b7c1eb60ead6144c2ab6a1fb8296bee3.jpg&quot; title=&quot;60a2ccb7130264f22cbd601e807aecb3.jpg&quot; alt=&quot;60a2ccb7130264f22cbd601e807aecb3.jpg&quot;/&gt;&lt;/p&gt;');
INSERT INTO `product`
VALUES ('1457987163693973505', '测试', '测试', NULL, NULL, NULL, NULL,
        '/profile/upload/images/20211109/118742c881822c1b96d788bbfd2a8df6.jpg', 'admin', '2021-11-09 16:23:23', 'admin',
        '2021-11-09 16:23:23',
        '&lt;p&gt;啊啊啊啊啊啊啊啊啊啊啊啊&lt;img src=&quot;/profile/upload/ueditor/20211109/94c3990c5112ef992db4522d131a58f0.jpg&quot; title=&quot;255e79ab044144ef647327bab8a72cd0.jpg&quot; alt=&quot;255e79ab044144ef647327bab8a72cd0.jpg&quot;/&gt;&lt;/p&gt;');
INSERT INTO `product`
VALUES ('1457992010027696130', '长春市', '11', NULL, NULL, NULL, NULL,
        '/profile/upload/images/20211109/983ba1776713204277ad602b1a944d91.jpg', 'admin', '2021-11-09 16:42:38', 'admin',
        '2021-11-09 16:42:38', '');
INSERT INTO `product`
VALUES ('1457992300776849410', '3333', '11', NULL, NULL, NULL, NULL,
        '/profile/upload/images/20211109/73189361df155645951a9c241a7147b3.jpg', 'admin', '2021-11-09 16:43:47', 'admin',
        '2021-11-09 16:43:47', '');
INSERT INTO `product`
VALUES ('1457994742532915201', '测试', '111', NULL, NULL, NULL, '1457998044867837954',
        '/profile/upload/images/20211109/5d209e5edcc5af968c5b311c4f5a81f1.jpg', 'admin', '2021-11-09 16:53:30', 'admin',
        '2021-11-09 17:06:48',
        '&lt;p&gt;11111&lt;img src=&quot;/profile/upload/ueditor/20211109/6f06634ac29f4105590178f0824d26b7.jpg&quot; title=&quot;0da808035300f67ac2dace81e2165ca5 (1).jpg&quot; alt=&quot;0da808035300f67ac2dace81e2165ca5 (1).jpg&quot;/&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for product_file
-- ----------------------------
DROP TABLE IF EXISTS `product_file`;
CREATE TABLE `product_file`
(
    `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作品id',
    `file_id`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_file
-- ----------------------------
INSERT INTO `product_file`
VALUES ('1457987163693973505', '1457987139983572993');
INSERT INTO `product_file`
VALUES ('1457987163693973505', '1457987128608620545');
INSERT INTO `product_file`
VALUES ('1457992010027696130', '1457992003568467970');
INSERT INTO `product_file`
VALUES ('1457992300776849410', '1457987116969426945');
INSERT INTO `product_file`
VALUES ('1457994742532915201', '1457992003568467970');
INSERT INTO `product_file`
VALUES ('1457994742532915201', '1457993510808387585');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`
(
    `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作品主键',
    `image_id`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片主键'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image`
VALUES ('1457987163693973505', '1457987116969426945');
INSERT INTO `product_image`
VALUES ('1457987163693973505', '1457987105179238401');
INSERT INTO `product_image`
VALUES ('1457992010027696130', '1457991973814075393');
INSERT INTO `product_image`
VALUES ('1457992300776849410', '1457992272591126530');
INSERT INTO `product_image`
VALUES ('1457994742532915201', '1457997369412927489');
INSERT INTO `product_image`
VALUES ('1457994742532915201', '1457997350089768961');
INSERT INTO `product_image`
VALUES ('1457994742532915201', '1457994663830994946');
INSERT INTO `product_image`
VALUES ('1457994742532915201', '1457994647997497345');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`
(
    `id`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区id',
    `pid`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级id',
    `ancestors`   varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '祖级列表',
    `code`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区划编码',
    `name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称',
    `sort`        int NULL DEFAULT NULL COMMENT '显示顺序',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area`
VALUES ('1333620410082713601', '0', '0', '100', '北京市', 0, 'admin', '2020-12-01 11:54:18', 'admin',
        '2020-12-16 14:04:38');
INSERT INTO `sys_area`
VALUES ('1333620468643586050', '1333620410082713601', '0,1333620410082713601', '10010', '北京市', 0, 'admin',
        '2020-12-01 11:54:32', NULL, NULL);
INSERT INTO `sys_area`
VALUES ('1333620561811660801', '1333620514982256641', '0,1333620514982256641', '2001', '济南市', 0, 'admin',
        '2020-12-01 11:54:54', NULL, NULL);
INSERT INTO `sys_area`
VALUES ('1333620606518747138', '1333620514982256641', '0,1333620514982256641', '2002', '临沂市', 0, 'admin',
        '2020-12-01 11:55:05', NULL, NULL);
INSERT INTO `sys_area`
VALUES ('1333620671056502785', '1333620606518747138', '0,1333620514982256641,1333620606518747138', '200201', '兰山区', 0,
        'admin', '2020-12-01 11:55:20', NULL, NULL);
INSERT INTO `sys_area`
VALUES ('1333620714450771970', '1333620606518747138', '0,1333620514982256641,1333620606518747138', '200202', '河东区', 0,
        'admin', '2020-12-01 11:55:30', 'admin', '2020-12-16 11:42:22');
INSERT INTO `sys_area`
VALUES ('1334039974843060226', '1333620714450771970', '0,1333620514982256641,1333620606518747138,1333620714450771970',
        '371312', '芝麻墩街道', 0, 'admin', '2020-12-02 15:41:30', NULL, NULL);
INSERT INTO `sys_area`
VALUES ('1334040060784349185', '1333620714450771970', '0,1333620514982256641,1333620606518747138,1333620714450771970',
        '371311', '经济技术开发区', 0, 'admin', '2020-12-02 15:41:50', 'admin', '2020-12-16 11:42:13');
INSERT INTO `sys_area`
VALUES ('1339053251536883714', '1333620714450771970', '0,1333620514982256641,1333620606518747138,1333620714450771970',
        'sys_11', '11111222', 11, 'admin', '2020-12-16 11:42:28', 'admin', '2020-12-16 11:42:55');
INSERT INTO `sys_area`
VALUES ('1372090971511087106', '1333620410082713601', '0,1333620410082713601', '0101', '测试', 0, 'admin',
        '2021-03-17 15:42:34', 'admin', '2021-03-17 16:21:19');
INSERT INTO `sys_area`
VALUES ('1455426161764958210', '1333620468643586050', '0,1333620410082713601,1333620468643586050', '11', '111', 1111,
        'ceshi', '2021-11-02 14:46:52', 'ceshi', '2021-11-02 14:46:52');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `id`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `code`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项编码',
    `value`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置项值',
    `model`       varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置模块编码',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES ('1437246617392857089', 'sys_name', '后台管理系统', 'basic', 'admin', '2021-09-13 10:47:51', 'admin',
        '2021-09-13 10:51:36');
INSERT INTO `sys_config`
VALUES ('1437246617455771649', 'sys_title', '测试后台管理', 'basic', 'admin', '2021-09-13 10:47:51', 'admin',
        '2021-09-13 10:51:36');
INSERT INTO `sys_config`
VALUES ('1437246617455771650', 'login_content', '', 'basic', 'admin', '2021-09-13 10:47:51', 'admin',
        '2021-09-13 10:51:36');
INSERT INTO `sys_config`
VALUES ('1437246617455771651', 'login_title', '', 'basic', 'admin', '2021-09-13 10:47:51', 'admin',
        '2021-09-13 10:51:36');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`
(
    `id`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键id',
    `name`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
    `value`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典值',
    `type`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典项分类',
    `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
    `status` int NULL DEFAULT 0 COMMENT '状态 0正常 1禁用',
    `sort`   int NULL DEFAULT NULL COMMENT '排序',
    INDEX    `UNI_SYS_DICT_TYPENAME`(`name`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary`
VALUES ('1339120812945375233', '男', '1', 'system_sex', '性别', 1, 1);
INSERT INTO `sys_dictionary`
VALUES ('1339120887616569346', '女', '2', 'system_sex', '性别', 1, 1);
INSERT INTO `sys_dictionary`
VALUES ('1339120971255185410', '保密', '0', 'system_sex', '性别', 1, 0);
INSERT INTO `sys_dictionary`
VALUES ('1490485828770107393', '仅管理个人数据', '0', 'duty_limit', '职务管理权限：此权限仅允许管理个人数据', 1, 0);
INSERT INTO `sys_dictionary`
VALUES ('1490485943643705346', '管理本部门数据', '1', 'duty_limit', '职务管理权限：此权限允许管理本部门数据', 1, 0);
INSERT INTO `sys_dictionary`
VALUES ('1490486101408256001', '管理本部门及以下数据', '2', 'duty_limit', '职务管理权限：此权限允许管理本部门及以下数据', 1, 0);
INSERT INTO `sys_dictionary`
VALUES ('1490486191308967938', '管理本公司数据', '3', 'duty_limit', '职务管理权限：此权限允许管理本公司数据', 1, 0);
INSERT INTO `sys_dictionary`
VALUES ('1490486291238260737', '管理本公司及以下数据', '4', 'duty_limit', '职务管理权限：此权限允许管理本公司及以下数据', 1, 0);
INSERT INTO `sys_dictionary`
VALUES ('1490486401619759106', '管理所有数据', '5', 'duty_limit', '职务管理权限：此权限允许管理所有数据', 1, 0);

-- ----------------------------
-- Table structure for sys_duty
-- ----------------------------
DROP TABLE IF EXISTS `sys_duty`;
CREATE TABLE `sys_duty`
(
    `id`               varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `duty_name`        varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务名称',
    `duty_description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务简介',
    `duty_limit`       int NULL DEFAULT NULL COMMENT '浏览权限：0只能浏览个人信息1可以浏览所属部门信息2可以浏览部门及下属信息3可以浏览本公司数据4可以浏览本公司及以下数据5可以浏览所有信息',
    `code`             varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务编码',
    `create_id`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者id',
    `create_name`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者名称',
    `create_time`      datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
    `update_name`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
    `update_time`      datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_duty
-- ----------------------------
INSERT INTO `sys_duty`
VALUES ('1490492435520389121', '员工', '员工仅能管理个人数据', 0, 'employee', '1242327057416970241', '超级管理员', '2022-02-07 09:07:43',
        NULL, NULL, '2022-02-07 09:07:43');
INSERT INTO `sys_duty`
VALUES ('1490501680026415105', '部门经理', '部门经理允许管理本部门的数据', 1, 'department_manager', '1242327057416970241', '超级管理员',
        '2022-02-07 09:44:27', NULL, NULL, '2022-02-07 09:44:27');
INSERT INTO `sys_duty`
VALUES ('1490501816798474242', '部门总经理', '部门总经理允许管理本部门及下属部门的数据', 2, 'department_grand_manager', '1242327057416970241',
        '超级管理员', '2022-02-07 09:45:00', NULL, NULL, '2022-02-07 09:45:00');
INSERT INTO `sys_duty`
VALUES ('1490502202401812481', '观察员', '观察员可以查看所有的数据', 5, 'viewer', '1242327057416970241', '超级管理员',
        '2022-02-07 09:46:32', NULL, NULL, '2022-02-07 09:46:32');
INSERT INTO `sys_duty`
VALUES ('1490502434246160386', '企业总负责人', '企业总负责人可以管理本上级公司及下属公司数据', 4, 'qyzfzr', '1242327057416970241', '超级管理员',
        '2022-02-07 09:47:27', '1242327057416970241', '超级管理员', '2022-02-07 09:47:59');
INSERT INTO `sys_duty`
VALUES ('1490502692845973505', '公司总负责人', '公司总负责人可以管理本公司数据', 3, 'gszfzr', '1242327057416970241', '超级管理员',
        '2022-02-07 09:48:29', NULL, NULL, '2022-02-07 09:48:29');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`
(
    `id`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `username`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
    `login_ip`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录IP',
    `browser`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
    `os`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
    `status`     int NULL DEFAULT 0 COMMENT '登录状态 1成功0失败',
    `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
    `msg`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录信息',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log`
VALUES ('1435493358709841921', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-08 14:41:02', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1435497445769637890', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-09-08 14:57:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1436208227536896002', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-10 14:01:39', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1436221468430327810', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-10 14:54:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1436240144458080258', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-10 16:08:29',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1436240347848269825', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-10 16:09:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1437246548778237953', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-13 10:47:34', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1437247288766627842', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-13 10:50:31', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1437247983213465601', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-13 10:53:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1441230904387461122', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-24 10:39:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1442055780404891650', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-26 17:17:44', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1442055795303059458', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:17:48',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1442055804866072577', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:17:51',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1442055811501461505', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:17:52',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1442055817293795329', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:17:54',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1442055823404896258', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:17:55',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1442055830581350401', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:17:57',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1442055841964691458', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:17:59',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1442055846901387265', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:18:01',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1442055855289995265', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:18:03',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1442055872151097345', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:18:07',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1442055879365300225', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:18:08',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1442055902094233602', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:18:14',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1442055914710700033', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-09-26 17:18:17',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1442058264007479297', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-26 17:27:37', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1442059780839772161', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-26 17:33:39', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1442294485560393729', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-27 09:06:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1442380000821313538', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-27 14:46:05', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1443097741433864194', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-09-29 14:18:07', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447845426552385538', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:44',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447845431900123138', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:45',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447845436392222721', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:46',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447845440548777986', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:47',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447845444508200961', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:48',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447845449130323969', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:49',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845454540976129', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:51',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845460475916290', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:52',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845465563607041', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:53',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845471209140226', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:55',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845475906760705', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:56',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845481309024258', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:57',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845485411053569', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:58',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845489525665793', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:43:59',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845493430562818', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:44:00',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845498451144705', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:44:01',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845502804832257', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:44:02',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845507284348930', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:44:03',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845539500797954', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:44:11',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447845567703298050', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 16:44:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447845588741926914', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 16:44:23',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447858579214454786', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:35:59',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447859291608674306', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:38:49',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447859353101365249', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:39:04',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447859726713188353', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:40:33',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447859804567859202', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:40:52',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447860053956980737', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:41:51',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447860134554726402', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:11',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447860147007614977', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:14',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447860158994935810', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:17',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860233263476738', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:34',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860269611315202', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:43',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860285356732418', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:47',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860292445106177', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:48',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860296815570946', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:49',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860301118926849', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:50',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860305359368193', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:51',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860309734027265', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:42:52',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1447860588881735681', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 17:43:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447860674017718274', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 17:44:19', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447860834114301954', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:44:57',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447861848464781313', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:48:59',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447863361304096770', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:55:00',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447863410708803585', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:55:12',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447863690204631041', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:56:18',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447863706411421698', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 17:56:22',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447863932673150977', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 17:57:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447867645634629634', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:12:01', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447867731596890114', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:12:22', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447867896705667073', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:13:01', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447875273555210241', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:42:20',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447875471316643841', '<scirpt>alert(111)</script>', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0,
        '2021-10-12 18:43:07', '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1447875594364940289', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:43:37', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447875846283227137', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:44:37', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447876041922342914', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:45:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447876309732847618', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:46:27', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447876368155308034', '1admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:46:41',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1447876393090445314', '1111', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:46:47', '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1447876617435377665', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:47:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447876647508537345', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:47:48',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447877196186415105', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:49:58',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447877432241844226', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:50:55',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447877790276022273', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:52:20',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447878058774392834', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:53:24', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447878103808634881', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:53:35',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447878124046151682', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:53:40',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447878146393403393', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:53:45',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447878716894244866', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:56:01',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447878814843826178', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:56:24',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447878847437762561', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:56:32',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447879206952529921', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:57:58',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447879244457996289', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:58:07',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447879264892645378', 'admin11', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:58:12',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1447879339299598337', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-12 18:58:29',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1447879364515753986', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:58:35', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447879383599837186', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:58:40', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447879406035169282', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:58:45', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447879558883995649', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 18:59:22', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447880334448599042', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 19:02:26', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447887262096650242', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 19:29:58', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1447889822899572737', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-12 19:40:09', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448083879575715841', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:31:15',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448083905467154434', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:31:22', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448084287262064641', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:32:53', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448084411073724417', 'admin111111111111111111111111111111111111', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10',
        0, '2021-10-13 08:33:22', '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1448084470381182977', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:33:37',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448084491361091585', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:33:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448086373995413506', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:41:10', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448086678740959233', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:42:23',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448086725662638082', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:42:34',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448086764082462722', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:42:43',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448087131704819714', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:44:11', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448089179980595201', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:52:19', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448089520339976194', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:53:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448089765689982978', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:54:39',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448089800624340993', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:54:47',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448090224878190594', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:56:28', '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448090247879753730', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:56:34', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448090271812452354', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:56:40', '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448090283694915585', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 08:56:43', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448090311280852994', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:56:49', '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448090322680971265', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:56:52', '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448090335838502914', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:56:55', '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448090347288952834', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:56:58', '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448090359448240130', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:57:01', '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448090372626743297', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:57:04',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1448090421272281090', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:57:15',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1448090467149578242', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 08:57:26',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1448095764450758657', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:18:29', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448095823418478594', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:18:43',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448096191800004610', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:20:11',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448096221218852866', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 09:20:18',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448096355520466946', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:20:50',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448098292143869953', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:28:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448098663402688513', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 09:30:00',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448098710135623681', 'admin002', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:30:12',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448099031469641729', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:31:28', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448099225653334018', 'admin001', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 09:32:14',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448099238240440321', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:32:17', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448099468797136898', 'admin003', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:33:12',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448099525793533954', 'admin003', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 09:33:26',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448099558580408321', 'admin003', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 09:33:34',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448099592285835266', 'admin003', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 09:33:42',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448111045910843393', 'admin003', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 10:19:13',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448111079876317185', 'admin003', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 10:19:21',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448116745823092738', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 10:41:51', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448116767155322882', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 10:41:57',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448130473603973122', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 11:36:24', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448130494680350722', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 11:36:30',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448132058472071169', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 11:42:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448133392554348546', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 11:48:00', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448134355197456386', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 11:51:50',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448134575700406273', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 11:52:43',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448166601870643202', 'something else', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 13:59:58',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1448166663937953794', 'something else', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 14:00:13',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1448167506523295745', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 14:03:34', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448167536227356673', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 14:03:41',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448167575918055425', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 14:03:50',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448167589906059265', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 14:03:54',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448167611624165377', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 14:03:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448167701680066561', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 14:04:20',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448167741844721665', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 14:04:30', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448170704084520961', 'ceshi', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 14:16:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448174665797586945', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 14:32:01', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448178382076760065', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 14:46:47', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448178956830625794', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 14:49:03', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448179237987405825', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 14:50:11', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448184852130373634', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:12:28',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448189080882126849', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:29:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448189236163649538', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:29:55', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448189406213316610', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:30:35', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448190324908498945', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:34:14', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448191347907633154', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:38:18',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448191364546437122', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:38:22',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448191372364619777', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:38:24',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448191376470843393', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:38:25',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448191380891639809', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:38:26',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448191388701433858', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:38:28',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1448191401863159809', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:38:31',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1448191420410372097', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:38:35',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1448192978783051778', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:44:47', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448195159565279233', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:53:27', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448195571374628865', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 15:55:05',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448195758163763202', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:55:50', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448196518456860673', 'ceshi', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:58:51', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448196734799138818', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 15:59:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448197953433194497', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 16:04:33',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448197981669249025', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:04:40', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448198562152501250', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 16:06:57',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448198583769944066', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:07:03', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448198777269964801', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 16:07:49',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448198813735243778', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:07:58', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448198851324596225', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:08:07', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448199126361886721', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 16:09:13',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448199148025466881', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:09:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448206157454036993', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:37:09', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448206182133321730', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-13 16:37:15',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1448206195521540097', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:37:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448206230590115842', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:37:26', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448206666311192578', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:39:10', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448207220080955393', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:41:22', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448207355552780290', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:41:55', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448210109042053121', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:52:51', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448210197265043457', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:53:12', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448210379138453506', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:53:55', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448210618687737857', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-13 16:54:53', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448533760589238274', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-14 14:18:55', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1448533877987807233', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-14 14:19:24', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1449903301000982529', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-18 09:00:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1449903330583408642', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-18 09:01:07', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450039504538664962', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-18 18:02:13', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450040027350237186', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-18 18:04:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450258730058731522', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 08:33:20', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450353327107686401', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 14:49:14', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450356908716081153', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 15:03:28', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450359592294772737', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 15:14:08', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450359949284581377', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 15:15:33', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450360309088739329', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 15:16:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450364503770222594', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 15:33:39', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450365698479972353', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 15:38:24', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450367931430940673', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-19 15:47:16',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1450367937483321345', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-19 15:47:17',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1450367941396606977', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-19 15:47:18',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1450367947369295874', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-19 15:47:20',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1450367951030923266', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-19 15:47:21',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1450367955841789954', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-19 15:47:22',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1450367966214303746', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-19 15:47:24',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1450367971620761601', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-19 15:47:26',
        '用户连续登录失败超过规定次数，账号临时锁定');
INSERT INTO `sys_login_log`
VALUES ('1450369623539003394', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-19 15:53:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450632433619664898', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 09:18:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450636133339725825', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 09:33:00', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450638954726359042', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 09:44:13', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450639190504968194', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 09:45:09', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450639480197181442', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 09:46:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450640492710555649', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 09:50:20', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450644816803098626', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:07:31', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450645089919397889', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:08:36', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450649061946236930', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:24:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450649440251490306', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:25:53', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450650150129078274', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:28:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450651580265066497', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:34:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450653627337129985', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:42:31', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450654688638648322', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:46:44', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450655384238792705', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:49:30', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450655929577971714', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:51:40', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450656767310499841', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:55:00', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450657605760196609', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 10:58:20', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450658643401740289', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 11:02:27', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450659822311497730', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 11:07:08', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450660353218138113', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 11:09:15', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450660521229398018', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 11:09:55', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450663053079056386', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 11:19:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450663429509451778', 'admin004', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 11:21:28',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450663571927044098', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 11:22:02', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450730366314717185', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 15:47:27', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450761668262760450', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-20 17:51:50', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1450993714285502465', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 09:13:54', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451003498451636225', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 09:52:47', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451003963931320322', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 09:54:38', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451022298391732225', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:07:29', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451027863604027393', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:29:36', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451028575456985089', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:32:26', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451029843520913410', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:37:28', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451030074069221377', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:38:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451030103014113282', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:38:30', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451031263057936386', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:43:07', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451031275871535106', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:43:10', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451031331961962497', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:43:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451031340279267330', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:43:25', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451031570965987330', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:44:20', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451031579178434561', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:44:22', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451032458577182721', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:47:52', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451033624694358017', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:52:30', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451034013497950209', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:54:02', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451034189348347905', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:54:44', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451034197091033089', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:54:46', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451034258403368961', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 11:55:01', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451083069381328898', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-21 15:08:58', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451372549807935489', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-22 10:19:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1451437810212802562', 'admin111', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-22 14:38:35',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1451439565411659778', 'admin1', '127.0.0.1', 'Chrome 9', 'Windows 10', 0, '2021-10-22 14:45:33', '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1451440083903164417', 'admin11', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-22 14:47:37',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1451440120062259201', 'admin11', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-22 14:47:46',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1451440135195308034', 'admin11', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-10-22 14:47:49',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1451440268167327746', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-22 14:48:21', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1452452856124633089', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-25 09:52:01', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1452581194428301313', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-25 18:21:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1452583091772043266', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-25 18:29:31', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453645816958763010', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-28 16:52:25', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453656458742677505', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-28 17:34:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453656762427064321', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-28 17:35:25', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453657806871601154', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-28 17:40:03', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453658469672394754', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-28 17:42:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453658920245501954', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-28 17:44:29', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453660616967307266', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-28 17:51:13', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453660849604378626', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-28 17:52:09', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453883358673088514', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 08:36:19', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453885051984920578', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 08:43:03', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453886220538937345', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 08:47:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453893545370816513', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:16:48', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453894464854478849', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:20:27', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453895629981835266', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:25:05', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453896339163086850', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:27:54', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453896592616521730', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:28:54', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453897051653795842', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:30:44', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453897219144933378', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:31:24', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453899991848288257', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:42:25', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453900503188385794', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:44:27', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453902262464098305', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:51:26', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453902328289505282', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:51:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453902618388549634', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:52:51', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453902761972158466', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:53:25', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453903533791117313', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 09:56:29', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453907656490033154', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 10:12:52', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453909161507016705', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 10:18:51', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453911867814543361', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 10:29:36', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453912317624233986', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 10:31:24', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453914418387562498', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 10:39:44', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453918400627589121', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 10:55:34', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453922472751513602', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 11:11:45', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453932306561441793', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 11:50:49', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453932727283712002', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 11:52:30', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453969246279155714', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:17:36', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453971239013859330', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:25:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453971398036701186', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:26:09', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453972360503738369', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:29:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453973986543091714', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:36:27', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453974928730611714', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:40:11', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453977805427544065', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:51:37', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453978098617790466', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:52:47', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453978353925083137', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 14:53:48', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453980607876931586', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 15:02:45', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453982499092799490', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 15:10:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453991083738349570', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 15:44:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453991409077944322', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 15:45:40', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453991613063737345', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 15:46:29', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453992169228431362', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 15:48:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453997265932734466', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 16:08:57', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453997324694933506', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 16:09:11', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453997461982892033', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 16:09:44', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453997713083289601', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 16:10:43', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453997826853785601', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 16:11:11', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1453998039689547778', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-10-29 16:12:01', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455070291197628417', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 15:12:46', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455070335690805250', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 15:12:57', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455072104319750145', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 15:19:58', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455073545650376705', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 15:25:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455073814173913090', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 15:26:46', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455083251504701442', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:04:16', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455085732943073282', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:14:06', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455085816451665922', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:14:27', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455085922534002689', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:14:53', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455085934970114050', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:14:56', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455086100951306241', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:15:35', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455086156978819073', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:15:49', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455086296011608066', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:16:22', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455086363489570817', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:16:38', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455086408511229953', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:16:49', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455086413468897282', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:16:50', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455086919343902721', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:18:50', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455086953942716417', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:18:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455087848923303938', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:22:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455087882821668865', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:22:40', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455088002493550594', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:22:48', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455088678242045954', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:25:50', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455094235250249730', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:47:55', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455095964993835010', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:54:47', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455096097508675586', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:55:19', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455096602247024642', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:57:19', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455097010130505730', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:58:56', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455097169774104578', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 16:59:34', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455097393225650178', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 17:00:28', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455101527479799809', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 17:16:53', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455102830742327298', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 17:22:04', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455108186096783362', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 17:43:21', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455108344364650497', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 17:43:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455108369962487809', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 17:44:05', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455108911505854465', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 17:46:14', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455114127571664898', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:06:57', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455114286246379521', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:07:35', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455114294433660930', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:07:37', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455114654447546369', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:09:03', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455114691231592450', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:09:12', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455114731564019714', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:09:21', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455115565093875714', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:12:40', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455116006233993217', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:14:25', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455120422534115329', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-01 18:31:58', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455332712474693634', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 08:35:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455332735220404226', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 08:35:38', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455339369535561729', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 09:01:59', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455351534518751234', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 09:50:20', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455352547082469377', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-11-02 09:54:21',
        '用户名密码不正确');
INSERT INTO `sys_login_log`
VALUES ('1455352677617598465', 'eadasaf', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 0, '2021-11-02 09:54:52',
        '用户不存在');
INSERT INTO `sys_login_log`
VALUES ('1455353343098441730', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 09:57:31', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455354145938558977', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:00:42', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455358280859602946', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:17:08', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455362062154645505', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:32:10', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455364494116990977', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:41:49', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455364541206441985', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:42:01', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455365162546442242', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:44:29', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455366448893341698', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:49:35', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455367215867965441', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:52:38', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455367369920557058', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:53:15', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455367495774842882', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:53:45', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455367513915207681', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:53:49', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455367862671515649', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:55:13', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455367896372748290', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:55:21', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455368196345176066', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:56:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455368284291342337', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 10:56:53', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455369299405185026', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 11:00:55', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455425950107795457', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 14:46:02', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1455427112747855873', 'ceshi', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-02 14:50:39', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457889363400568833', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 09:54:45', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457931186470879233', 'admin', '127.0.0.1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 12:40:57', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457979267581149186', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 15:52:00', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457979904070975490', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 15:54:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457980733574283265', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 15:57:50', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457991733266546690', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 16:41:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457992197710217217', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 16:43:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457993431271800834', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 16:48:17', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457993795110895617', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 16:49:44', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457994554116390913', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 16:52:45', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1457997960621047810', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2021-11-09 17:06:17', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1484396616362848257', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-01-21 13:25:07', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1484425877287112706', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-01-21 15:21:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1484431517762056193', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-01-21 15:43:48', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1484432680272113666', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-01-21 15:48:25', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1484440840550604801', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-01-21 16:20:51', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490483137239068673', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 08:30:46', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490484397832945666', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 08:35:47', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490485284840181762', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 08:39:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490487596728025090', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 08:48:30', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490489468511649794', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 08:55:56', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490492328536276993', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 09:07:18', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490493815475761153', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 09:13:12', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490495618594381825', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 09:20:22', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490496956673830914', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 09:25:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490498095578439682', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 09:30:13', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490498636467531777', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 09:32:22', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490501486404759553', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 09:43:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490507518615027714', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 10:07:39', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490509488771874817', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 10:15:29', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490511911649337346', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 10:25:07', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490512231196626946', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 10:26:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490513993487994881', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 10:33:23', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490516819068870658', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 10:44:37', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490518155663544322', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 10:49:55', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490520219345031170', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 10:58:07', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490521171439452162', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 11:01:54', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490523306948321282', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 11:10:24', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490523630660587522', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 11:11:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490524347945189378', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 11:14:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490525504218451970', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 11:19:07', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490526225999396865', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 11:22:00', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490527107839279106', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 11:25:30', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490529923408416769', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 11:36:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490557603411456001', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 13:26:41', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490559077466042369', 'admin', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 13:32:32', '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490559374544400386', 'ssbmanager', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 13:33:43',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490563360269815810', 'ssbmanager', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 13:49:33',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490563917604798466', 'ssbmanager', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 13:51:46',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490563999033016322', 'employee2', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 13:52:05',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490565541177950209', 'employee2', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 13:58:13',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490566108423974913', 'employee2', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 14:00:28',
        '登录成功');
INSERT INTO `sys_login_log`
VALUES ('1490566483516334081', 'employee2', '0:0:0:0:0:0:0:1', 'Chrome 9', 'Windows 10', 1, '2022-02-07 14:01:58',
        '登录成功');

-- ----------------------------
-- Table structure for sys_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operate_log`;
CREATE TABLE `sys_operate_log`
(
    `id`                varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `name`              varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
    `type`              int NULL DEFAULT 0 COMMENT '业务类型0其他1新增2修改3删除',
    `method`            varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名称',
    `request_type`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求类型',
    `oper_type`         int NULL DEFAULT 0 COMMENT '操作类型0其他1后台2移动端',
    `oper_user_id`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户id',
    `oper_user_name`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户名称',
    `oper_user_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户账号',
    `oper_time`         datetime NULL DEFAULT NULL COMMENT '操作时间',
    `oper_url`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求url',
    `oper_ip`           varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip',
    `oper_location`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
    `oper_param`        varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
    `result_param`      varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回参数',
    `state`             int NULL DEFAULT 0 COMMENT '操作状态0正常1异常',
    `error_msg`         varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误消息',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_operate_log
-- ----------------------------
INSERT INTO `sys_operate_log`
VALUES ('1435493401227501570', '用户信息修改', 2, 'com.basic.controller.system.user.UserController.doUpdate()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-09-08 14:41:12', '/user/update', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"id\" : [ \"1435083582674939906\" ],\r\n  \"nickname\" : [ \"测试\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"信息修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1435508224937979906', '用户信息修改', 2, 'com.basic.controller.system.user.UserController.doUpdate()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-09-08 15:40:06', '/user/update', '127.0.0.1', '内网IP',
        '{\r\n  \"id\" : [ \"1435083582674939906\" ],\r\n  \"nickname\" : [ \"测试\" ],\r\n  \"mobile\" : [ \"18989898899\" ],\r\n  \"email\" : [ \"189@163.com\" ],\r\n  \"remark\" : [ \"测试用户\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"信息修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1447867594409594881', '用户重置密码', 2, 'com.basic.controller.system.user.UserController.resetPassword()', 'POST',
        1, '1242327057416970241', '超级管理员', 'admin', '2021-10-12 18:11:49', '/user/resetPassword', '0:0:0:0:0:0:0:1',
        '内网IP', '{\r\n  \"oldPassword\" : [ \"admin\" ],\r\n  \"newPassword\" : [ \"用户姓名\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"新密码长度不能少于5位\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1447867615288840194', '用户重置密码', 2, 'com.basic.controller.system.user.UserController.resetPassword()', 'POST',
        1, '1242327057416970241', '超级管理员', 'admin', '2021-10-12 18:11:54', '/user/resetPassword', '0:0:0:0:0:0:0:1',
        '内网IP', '{\r\n  \"oldPassword\" : [ \"admin\" ],\r\n  \"newPassword\" : [ \"用户姓名123\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"密码重置成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1447867717462085634', '用户重置密码', 2, 'com.basic.controller.system.user.UserController.resetPassword()', 'POST',
        1, '1242327057416970241', '超级管理员', 'admin', '2021-10-12 18:12:19', '/user/resetPassword', '0:0:0:0:0:0:0:1',
        '内网IP', '{\r\n  \"oldPassword\" : [ \"用户姓名123\" ],\r\n  \"newPassword\" : [ \"admin\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"密码重置成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1447887393395142658', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-12 19:30:30', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"adminadmin\" ],\r\n  \"password\" : [ \"adminadmin\" ],\r\n  \"confirmPassword\" : [ \"adminadmin\" ],\r\n  \"nickname\" : [ \"我是大帅哥\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要6-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448084715362091009', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:34:35', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"李00001\" ],\r\n  \"password\" : [ \"administrator\" ],\r\n  \"confirmPassword\" : [ \"administrator\" ],\r\n  \"nickname\" : [ \"我是大帅哥\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要6-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448084773771968514', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:34:49', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"李00001\" ],\r\n  \"password\" : [ \"administrator123\" ],\r\n  \"confirmPassword\" : [ \"administrator123\" ],\r\n  \"nickname\" : [ \"我是大帅哥\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"操作成功！\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448085022091542530', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:35:48', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"李00002\" ],\r\n  \"password\" : [ \"aaaaaa123\" ],\r\n  \"confirmPassword\" : [ \"aaaaaa123\" ],\r\n  \"nickname\" : [ \"我是大帅哥00002\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"操作成功！\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448086536021377025', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:41:49', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"admin001\" ],\r\n  \"password\" : [ \"admin001\" ],\r\n  \"confirmPassword\" : [ \"admin001\" ],\r\n  \"nickname\" : [ \"测试管理员001\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要6-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448086638379171841', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:42:13', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"admin001\" ],\r\n  \"password\" : [ \"Admin001\" ],\r\n  \"confirmPassword\" : [ \"Admin001\" ],\r\n  \"nickname\" : [ \"测试管理员001\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"操作成功！\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448087340065259522', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:45:01', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"admin002\" ],\r\n  \"password\" : [ \"admin002\" ],\r\n  \"confirmPassword\" : [ \"admin002\" ],\r\n  \"nickname\" : [ \"测试管理员002\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要6-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448087476531134466', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:45:33', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"admin002\" ],\r\n  \"password\" : [ \"Admin002@\" ],\r\n  \"confirmPassword\" : [ \"Admin002@\" ],\r\n  \"nickname\" : [ \"测试管理员002\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要6-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448087501856342018', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:45:39', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"admin002\" ],\r\n  \"password\" : [ \"Admin002\" ],\r\n  \"confirmPassword\" : [ \"Admin002\" ],\r\n  \"nickname\" : [ \"测试管理员002\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"操作成功！\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448089232661053442', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.resetPassword()', 'POST',
        1, '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:52:32', '/user/resetPassword', '0:0:0:0:0:0:0:1',
        '内网IP', '{\r\n  \"oldPassword\" : [ \"admin\" ],\r\n  \"newPassword\" : [ \"admin001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"用户账号需要6-20位\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448089591873830913', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.resetPassword()', 'POST',
        1, '1242327057416970241', '超级管理员', 'admin', '2021-10-13 08:53:58', '/user/resetPassword', '0:0:0:0:0:0:0:1',
        '内网IP', '{\r\n  \"oldPassword\" : [ \"admin\" ],\r\n  \"newPassword\" : [ \"admin001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要2-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448089862557433858', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.resetPassword()', 'POST',
        1, '1448086638249148417', '测试管理员001', 'admin001', '2021-10-13 08:55:02', '/user/resetPassword',
        '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"admin001\" ],\r\n  \"newPassword\" : [ \"admin001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448089894132154369', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.resetPassword()', 'POST',
        1, '1448086638249148417', '测试管理员001', 'admin001', '2021-10-13 08:55:10', '/user/resetPassword',
        '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"Admin001\" ],\r\n  \"newPassword\" : [ \"admin001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要2-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448089935504769026', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.resetPassword()', 'POST',
        1, '1448086638249148417', '测试管理员001', 'admin001', '2021-10-13 08:55:19', '/user/resetPassword',
        '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"Admin001\" ],\r\n  \"newPassword\" : [ \"Admin001\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"密码修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448096099743420417', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1448086638249148417', '测试管理员001', 'admin001', '2021-10-13 09:19:49', '/user/changePassword',
        '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"admin001\" ],\r\n  \"newPassword\" : [ \"ADMIN001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448096125437726721', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1448086638249148417', '测试管理员001', 'admin001', '2021-10-13 09:19:55', '/user/changePassword',
        '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"Admin001\" ],\r\n  \"newPassword\" : [ \"ADMIN001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要2-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448096151257862146', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1448086638249148417', '测试管理员001', 'admin001', '2021-10-13 09:20:01', '/user/changePassword',
        '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"Admin001\" ],\r\n  \"newPassword\" : [ \"Admin001\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"密码修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448099374827950082', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 09:32:50', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"admin003\" ],\r\n  \"password\" : [ \"admin003\" ],\r\n  \"confirmPassword\" : [ \"admin003\" ],\r\n  \"nickname\" : [ \"测试管理员3\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要2-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448099431883067394', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-13 09:33:04', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"admin003\" ],\r\n  \"password\" : [ \"Admin003\" ],\r\n  \"confirmPassword\" : [ \"Admin003\" ],\r\n  \"nickname\" : [ \"测试管理员3\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"操作成功！\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448174474281472001', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 14:31:15', '/user/changePassword', '127.0.0.1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"admin\" ],\r\n  \"newPassword\" : [ \"adminadmi\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要2-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448174537523187713', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 14:31:30', '/user/changePassword', '127.0.0.1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"12345678\" ],\r\n  \"newPassword\" : [ \"12345678\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448174587548651522', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 14:31:42', '/user/changePassword', '127.0.0.1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"Admin001\" ],\r\n  \"newPassword\" : [ \"Admin001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448174642770857985', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 14:31:55', '/user/changePassword', '127.0.0.1', '内网IP',
        '{\r\n  \"oldPassword\" : [ \"admin\" ],\r\n  \"newPassword\" : [ \"Admin001\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"密码修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448179211672342530', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 14:50:05', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"Admin001\" ],\r\n  \"newPassword\" : [ \"Admin0012\" ],\r\n  \"confirmPassword\" : [ \"Admin0012\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"密码修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448195429372272642', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 15:54:31', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"aMIN001\" ],\r\n  \"newPassword\" : [ \"aDMIN001\" ],\r\n  \"confirmPassword\" : [ \"aDMIN001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448195474851110913', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 15:54:42', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"aDMIN001\" ],\r\n  \"newPassword\" : [ \"aDMIN001\" ],\r\n  \"confirmPassword\" : [ \"aDMIN001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448195486767128577', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 15:54:45', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"aDMIN0012\" ],\r\n  \"newPassword\" : [ \"aDMIN001\" ],\r\n  \"confirmPassword\" : [ \"aDMIN001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448195501623353346', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 15:54:48', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"aDMIN00123\" ],\r\n  \"newPassword\" : [ \"aDMIN001\" ],\r\n  \"confirmPassword\" : [ \"aDMIN001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448195882826866690', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 15:56:19', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"Admin0012\" ],\r\n  \"newPassword\" : [ \"Admin0012\" ],\r\n  \"confirmPassword\" : [ \"Admin0012\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"密码修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448198142793437186', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-13 16:05:18', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"12345678\" ],\r\n  \"newPassword\" : [ \"111111111\" ],\r\n  \"confirmPassword\" : [ \"111111111\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"密码必须由大写字母、小写字母和数字组成，且位数需要2-20位\",\r\n  \"code\" : 1001\r\n}',
        0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448533827295449089', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-14 14:19:12', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"Admin001\" ],\r\n  \"newPassword\" : [ \"Admin001\" ],\r\n  \"confirmPassword\" : [ \"Admin001\" ]\r\n}',
        '{\r\n  \"success\" : false,\r\n  \"message\" : \"原密码不正确\",\r\n  \"code\" : 1001\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1448533850733219842', '用户修改密码', 2, 'com.basic.controller.system.user.UserController.changePassword()', 'POST',
        1, '1435083582674939906', '测试', 'ceshi', '2021-10-14 14:19:17', '/user/changePassword', '0:0:0:0:0:0:0:1',
        '内网IP',
        '{\r\n  \"oldPassword\" : [ \"12345678\" ],\r\n  \"newPassword\" : [ \"Admin001\" ],\r\n  \"confirmPassword\" : [ \"Admin001\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"密码修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1450039663246934017', '新增用户', 1, 'com.basic.controller.system.user.UserController.doAdd()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-18 18:02:51', '/user/add', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"username\" : [ \"admin004\" ],\r\n  \"password\" : [ \"Admin004\" ],\r\n  \"confirmPassword\" : [ \"Admin004\" ],\r\n  \"nickname\" : [ \"超级用户004\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"操作成功！\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1450366203268653057', '用户授权', 6, 'com.basic.controller.system.user.UserController.doEmpower()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-19 15:40:24', '/user/empower', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"id\" : [ \"1450039663116910594\" ],\r\n  \"role_id\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"操作成功!\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1450366215729930241', '用户信息修改', 2, 'com.basic.controller.system.user.UserController.doUpdate()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-19 15:40:27', '/user/update', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"id\" : [ \"1450039663116910594\" ],\r\n  \"nickname\" : [ \"超级用户004\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"信息修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1453993400642531329', '用户授权', 6, 'com.basic.controller.system.user.UserController.doEmpower()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-29 15:53:35', '/user/empower', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"id\" : [ \"1450039663116910594\" ],\r\n  \"role_id\" : [ \"1339100639353901058\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"操作成功!\",\r\n  \"code\" : 1000\r\n}', 0, NULL);
INSERT INTO `sys_operate_log`
VALUES ('1453993410289430530', '用户信息修改', 2, 'com.basic.controller.system.user.UserController.doUpdate()', 'POST', 1,
        '1242327057416970241', '超级管理员', 'admin', '2021-10-29 15:53:38', '/user/update', '0:0:0:0:0:0:0:1', '内网IP',
        '{\r\n  \"id\" : [ \"1450039663116910594\" ],\r\n  \"nickname\" : [ \"超级用户004\" ],\r\n  \"mobile\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',
        '{\r\n  \"success\" : true,\r\n  \"message\" : \"信息修改成功\",\r\n  \"code\" : 1000\r\n}', 0, NULL);

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`
(
    `id`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织id',
    `pid`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父级组织id',
    `ancestors`   varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
    `name`        varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织名称',
    `sort`        int NULL DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `status`      int NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
    `isdel`       int NULL DEFAULT 0 COMMENT '删除标志（0代表存在 1代表删除）',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `org_type`    varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '组织类型：0公司 1部门',
    `code`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织架构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization`
VALUES ('1372095692485447681', '0', '0', '临沂云达有限公司', 0, '王xxx', '18989898899', NULL, 0, 0, 'admin',
        '2021-03-17 16:01:20', 'admin', '2021-03-17 16:01:20', '0', 'lyyd');
INSERT INTO `sys_organization`
VALUES ('1372096169965015041', '1372095692485447681', '0,1372095692485447681', '实施部', 0, '王佳佳', '', NULL, 0, 0, 'admin',
        '2021-03-17 16:03:14', 'admin', '2021-03-17 16:03:14', '1', 'lyyd_ssb');
INSERT INTO `sys_organization`
VALUES ('1372096215171223553', '1372095692485447681', '0,1372095692485447681', '研发部', 0, '赵佳佳', '', NULL, 0, 0, 'admin',
        '2021-03-17 16:03:25', 'admin', '2021-03-17 16:21:02', '1', 'lyyd_yfb');
INSERT INTO `sys_organization`
VALUES ('1372096260675227650', '1372096215171223553', '0,1372095692485447681,1372096215171223553', '研发一组', 0, '真佳佳', '',
        NULL, 0, 0, 'admin', '2021-03-17 16:03:36', 'admin', '2021-03-17 16:24:56', '1', 'lyyd_yfb_1');
INSERT INTO `sys_organization`
VALUES ('1372096293256581121', '1372096215171223553', '0,1372095692485447681,1372096215171223553', '研发二组', 0, '', '',
        NULL, 0, 0, 'admin', '2021-03-17 16:03:43', 'admin', '2021-03-17 16:22:49', '1', 'lyyd_yfb_2');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`
(
    `id`      varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `name`    varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名',
    `type`    int NULL DEFAULT NULL COMMENT '权限类型',
    `code`    varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编码',
    `pid`     varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父权限id',
    `value`   varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
    `comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission`
VALUES ('1339083926403026946', '系统管理', NULL, 'system', '0', NULL, '系统管理权限');
INSERT INTO `sys_permission`
VALUES ('1339084191558537217', '文章管理', NULL, 'article', '0', NULL, '文章管理权限');
INSERT INTO `sys_permission`
VALUES ('1339086319375093761', '文章查看', NULL, 'article:view', '1339084191558537217', NULL, '');
INSERT INTO `sys_permission`
VALUES ('1339086393941430274', '文章编辑', NULL, 'article:edit', '1339086319375093761', NULL, '111');
INSERT INTO `sys_permission`
VALUES ('1339086455106965506', '文章详情', NULL, 'article:detail', '1339086319375093761', NULL, '222');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`      varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `name`    varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
    `code`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
    `comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES ('1339098556764524545', '系统管理员', 'xitong', '角色111');
INSERT INTO `sys_role`
VALUES ('1339100639353901058', '服务器管理员', 'fuwuqi1', '');
INSERT INTO `sys_role`
VALUES ('1455353512388939778', '&lt;alert&gt;', '111', '111');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`
(
    `role_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
    `perm_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限管理id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission`
VALUES ('1339098556764524545', '1339083926403026946');
INSERT INTO `sys_role_permission`
VALUES ('1339100639353901058', '1339083926403026946');
INSERT INTO `sys_role_permission`
VALUES ('1339100639353901058', '1339084191558537217');
INSERT INTO `sys_role_permission`
VALUES ('1339100639353901058', '1339086319375093761');
INSERT INTO `sys_role_permission`
VALUES ('1339100639353901058', '1339086393941430274');
INSERT INTO `sys_role_permission`
VALUES ('1339100639353901058', '1339086455106965506');

-- ----------------------------
-- Table structure for sys_upload_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_upload_files`;
CREATE TABLE `sys_upload_files`
(
    `id`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `storage`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传类型',
    `url`         varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络地址',
    `name`        varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
    `size`        int NULL DEFAULT 0 COMMENT '文件大小',
    `type`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
    `extension`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀名',
    `md5data`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件md5值',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_upload_files
-- ----------------------------
INSERT INTO `sys_upload_files`
VALUES ('1457987091853934593', 'local', '/profile/upload/images/20211109/118742c881822c1b96d788bbfd2a8df6.jpg',
        '5be60ad316824cade4812d3f1b345539.jpg', 200637, 'image/jpeg', 'jpg', 'c36c16bfb225feec1b7e0361360f7a4b',
        '2021-11-09 16:23:05', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457987105179238401', 'local', '/profile/upload/images/20211109/76aa8cb594564e3d5536faa5ec0b42cc.jpg',
        '0da808035300f67ac2dace81e2165ca5 (1).jpg', 114437, 'image/jpeg', 'jpg', 'f39656d4e338a93efd53ee8b74306441',
        '2021-11-09 16:23:09', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457987116969426945', 'local', '/profile/upload/images/20211109/935575293e4b0c66a1671c0a6afced7d.jpg',
        '5be60ad316824cade4812d3f1b345539.jpg', 200637, 'image/jpeg', 'jpg', 'c36c16bfb225feec1b7e0361360f7a4b',
        '2021-11-09 16:23:11', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457987128608620545', 'local', '/profile/upload/documents/20211109/9f499b1edd65bc419a9f93341fb0ff45.xlsx',
        '1635493965914人员信息 (1).xlsx', 3693, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'xlsx',
        '2c1fbbdf6d9eaff6eabe6e60af77455c', '2021-11-09 16:23:14', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457987139983572993', 'local', '/profile/upload/documents/20211109/b664339d3af8eecd1f61263239123f36.xls',
        '新建XLS 工作表.xls', 6656, 'application/vnd.ms-excel', 'xls', 'c528b5ef33e4c3adfb0d1d3cbcbd04ea',
        '2021-11-09 16:23:17', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457991964242673666', 'local', '/profile/upload/images/20211109/983ba1776713204277ad602b1a944d91.jpg',
        '60a2ccb7130264f22cbd601e807aecb3.jpg', 50815, 'image/jpeg', 'jpg', '3dcd98d6feb04db5dc98412e77c3ef28',
        '2021-11-09 16:42:27', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457991973814075393', 'local', '/profile/upload/images/20211109/a691895e126faa24e6efc24f5bd25ef7.jpg',
        'test (4).jpg', 13187, 'image/jpeg', 'jpg', '162b4db46da8ef67f494302b219c967b', '2021-11-09 16:42:29', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457992003568467970', 'local', '/profile/upload/documents/20211109/2e87ce3ed9cb333c79de9c39436e384e.pdf',
        '就是兼职 (5) (1) (1) (4).pdf', 34261, 'application/pdf', 'pdf', '740305c314af0beb1e9418b34baa6315',
        '2021-11-09 16:42:37', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457992260561862657', 'local', '/profile/upload/images/20211109/73189361df155645951a9c241a7147b3.jpg',
        '0da808035300f67ac2dace81e2165ca5 (1).jpg', 114437, 'image/jpeg', 'jpg', 'f39656d4e338a93efd53ee8b74306441',
        '2021-11-09 16:43:38', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457992272591126530', 'local', '/profile/upload/images/20211109/3327b9b28ddaff82df70d04c0d6c598f.jpg',
        '60a2ccb7130264f22cbd601e807aecb3.jpg', 50815, 'image/jpeg', 'jpg', '3dcd98d6feb04db5dc98412e77c3ef28',
        '2021-11-09 16:43:41', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457992641241088001', 'local', '/profile/upload/images/20211109/0e90b56f6840bb8ef3cafca0c0d2d637.jpg',
        'test (4).jpg', 13187, 'image/jpeg', 'jpg', '162b4db46da8ef67f494302b219c967b', '2021-11-09 16:45:09', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457993474859008002', 'local', '/profile/upload/images/20211109/e602432a60b65aada8746f7dcc16f16a.jpg',
        'test (4).jpg', 13187, 'image/jpeg', 'jpg', '162b4db46da8ef67f494302b219c967b', '2021-11-09 16:48:27', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457993483839012866', 'local', '/profile/upload/images/20211109/7845d8ecb95a49213e8fa62bf03db7ca.png',
        'test6 (4).png', 28442, 'image/png', 'png', '373a042cac20b1be9ef4c2f36e7744b9', '2021-11-09 16:48:29', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457993510808387585', 'local', '/profile/upload/documents/20211109/638bcc11067fb2c1af880a85952c0af4.xlsx',
        '1634700328049个人信息数据.xlsx', 4843, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'xlsx',
        'ec88767de5c93619e4dd8b8e6a0acb56', '2021-11-09 16:48:36', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457993531398225922', 'local', '/profile/upload/images/20211109/5d084c1ae5f445c372f19cc64fd24d84.jpg',
        '5be60ad316824cade4812d3f1b345539.jpg', 200637, 'image/jpeg', 'jpg', 'c36c16bfb225feec1b7e0361360f7a4b',
        '2021-11-09 16:48:41', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457994611435749377', 'local', '/profile/upload/images/20211109/6cec082b8795e3c9697b5e1836a57042.jpg',
        '5be60ad316824cade4812d3f1b345539.jpg', 200637, 'image/jpeg', 'jpg', 'c36c16bfb225feec1b7e0361360f7a4b',
        '2021-11-09 16:52:58', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457994647997497345', 'local', '/profile/upload/images/20211109/d5c1f5fd574c2e9fea1ec076647d8d35.jpg',
        '0da808035300f67ac2dace81e2165ca5 (1).jpg', 114437, 'image/jpeg', 'jpg', 'f39656d4e338a93efd53ee8b74306441',
        '2021-11-09 16:53:07', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457994663830994946', 'local', '/profile/upload/images/20211109/4d3de8a72a64bf4ead6d1709876ef017.jpg',
        '60a2ccb7130264f22cbd601e807aecb3.jpg', 50815, 'image/jpeg', 'jpg', '3dcd98d6feb04db5dc98412e77c3ef28',
        '2021-11-09 16:53:11', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457997350089768961', 'local', '/profile/upload/images/20211109/67bbb8196c813dce9f1bb0243781b7eb.jpg',
        '60a2ccb7130264f22cbd601e807aecb3.jpg', 50815, 'image/jpeg', 'jpg', '3dcd98d6feb04db5dc98412e77c3ef28',
        '2021-11-09 17:03:51', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457997369412927489', 'local', '/profile/upload/images/20211109/60b318371c258ce8cbcc9fecbf6d0251.png',
        '%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20210722143509.png', 72790, 'image/png', 'png',
        '26118dfc5934c5d6b53788fb8555f36d', '2021-11-09 17:03:56', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457997521838129153', 'local', '/profile/upload/images/20211109/ad7817c2d0cc49aa1ea02d9882ab964d.jpg',
        '5be60ad316824cade4812d3f1b345539.jpg', 200637, 'image/jpeg', 'jpg', 'c36c16bfb225feec1b7e0361360f7a4b',
        '2021-11-09 17:04:32', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457997652352286722', 'local', '/profile/upload/images/20211109/b3133d17974cb7b03db2405cd69d7f94.jpg',
        '5be60ad316824cade4812d3f1b345539.jpg', 200637, 'image/jpeg', 'jpg', 'c36c16bfb225feec1b7e0361360f7a4b',
        '2021-11-09 17:05:03', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457997995484102658', 'local', '/profile/upload/images/20211109/ff0b6ce92c075ff5d66ff8a55097750d.jpg',
        '0da808035300f67ac2dace81e2165ca5 (1).jpg', 114437, 'image/jpeg', 'jpg', 'f39656d4e338a93efd53ee8b74306441',
        '2021-11-09 17:06:25', 'admin');
INSERT INTO `sys_upload_files`
VALUES ('1457998044867837954', 'local', '/profile/upload/images/20211109/5d209e5edcc5af968c5b311c4f5a81f1.jpg',
        'test (2).jpg', 13187, 'image/jpeg', 'jpg', '162b4db46da8ef67f494302b219c967b', '2021-11-09 17:06:37', 'admin');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`              varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `username`        varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
    `password`        varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
    `password_level`  int NULL DEFAULT 0 COMMENT '密码强度0初始 1很弱 2弱 3安全 4很安全',
    `password_time`   datetime NULL DEFAULT NULL COMMENT '密码重置时间',
    `password_status` int NULL DEFAULT 0 COMMENT '密码重置状态0正常，1重置',
    `salt`            varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码种子',
    `nickname`        varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
    `email`           varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
    `mobile`          varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
    `icon`            varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
    `status`          int NULL DEFAULT 1 COMMENT '用户状态，0禁用，1启用',
    `fail_num`        int NULL DEFAULT 0 COMMENT '连续登录失败次数',
    `last_fail_time`  datetime NULL DEFAULT NULL COMMENT '最近登录失败时间',
    `last_login_time` datetime NULL DEFAULT NULL COMMENT '最近登录时间',
    `last_login_ip`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近登录ip',
    `create_time`     datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_by`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者账号',
    `update_time`     datetime NULL DEFAULT NULL COMMENT '更新时间',
    `update_by`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者账号',
    `remark`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `company_id`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司id',
    `company_name`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司名称',
    `company_code`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司编码',
    `dept_id`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门id',
    `dept_name`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门名称',
    `dept_code`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门编码',
    `duty_id`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要职务id',
    `duty_name`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要职务名称',
    `user_duty_id`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要职务关系表id',
    `sort`            int NULL DEFAULT NULL COMMENT '显示顺序，同一部门下不允许重复',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES ('1242327057416970241', 'admin', '48ee931d7d244e15686233e76033e212', 0, NULL, 0, '1qm4busfrb', '超级管理员',
        'admin2@qq.com', '18858868888', NULL, 1, 0, '2021-11-02 09:54:21', '2022-02-07 13:32:32', '0:0:0:0:0:0:0:1',
        '2020-03-24 13:47:06', NULL, '2022-02-07 13:32:32', 'admin', '', '1372095692485447681', '临沂云达有限公司', 'lyyd',
        '1372096215171223553', '研发部', 'lyyd_yfb', '1490502202401812481', '观察员', '123213213132131231', 0);
INSERT INTO `sys_user`
VALUES ('1435083582674939906', 'ceshi', '956f224af3d853a07585f423bd5027e1', 0, '2021-10-14 14:19:17', 0, 'hze97ha6mc',
        '测试', '189@163.com', '18989898899', NULL, 1, 0, '2021-10-13 16:37:15', '2021-11-02 14:50:39', '0:0:0:0:0:0:0:1',
        '2021-09-07 11:32:43', 'admin', '2021-11-02 14:50:39', 'admin', '测试用户', NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES ('1448084773579030529', '李00001', 'e3d7c9827fcb08008c22e869f4fc564a', 0, NULL, 0, 'ah7amz0920', '我是大帅哥', '', '',
        NULL, 1, 0, NULL, NULL, NULL, '2021-10-13 08:34:49', 'admin', '2021-10-13 08:34:49', 'admin', '', NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES ('1448085022024433665', '李00002', '6509da25c2b67ac7601b918d8ee8bf38', 0, NULL, 0, 'iu7l1h2kc3', '我是大帅哥00002', '',
        '', NULL, 1, 0, NULL, NULL, NULL, '2021-10-13 08:35:48', 'admin', '2021-10-13 08:35:48', 'admin', '', NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES ('1448086638249148417', 'admin001', '79f3ce1ad244e0c5f289d62928c53719', 0, '2021-10-13 09:31:38', 1,
        '8zduubkbxq', '测试管理员001', '', '', NULL, 1, 1, NULL, '2021-10-13 09:20:50', '0:0:0:0:0:0:0:1',
        '2021-10-13 08:42:13', 'admin', '2021-10-13 09:32:14', 'admin', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES ('1448087501730512898', 'admin002', '67ee2a324257e6d31104160298a838ef', 0, '2021-10-13 09:31:35', 1,
        'mho17fyeqx', '测试管理员002', '', '', NULL, 1, 0, NULL, '2021-10-13 09:30:12', '0:0:0:0:0:0:0:1',
        '2021-10-13 08:45:39', 'admin', '2021-10-13 09:31:35', 'admin', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES ('1448099431748849666', 'admin003', 'dc79be9b89bb80658ce7eba8f43ecfc9', 0, '2021-10-13 09:33:18', 1,
        'aem0qphvlg', '测试管理员3', '', '', NULL, 1, 0, NULL, '2021-10-13 09:33:42', '0:0:0:0:0:0:0:1',
        '2021-10-13 09:33:04', 'admin', '2021-10-13 10:19:33', 'admin003', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES ('1450039663116910594', 'admin004', 'f06b4a78b5c13fe51dbf6e5a4f9ae7d0', 0, '2021-10-29 15:56:35', 1,
        'shml824gj1', '超级用户004', '', '', NULL, 1, 0, NULL, '2021-10-20 11:21:28', '0:0:0:0:0:0:0:1',
        '2021-10-18 18:02:51', 'admin', '2021-10-29 15:56:35', 'admin', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `sys_user`
VALUES ('1490558461457002497', 'employee', 'fcddfc45c225aa0f1299aeb76034fdd8', 0, NULL, 0, '6t8c3b1sb1', '员工一号', '', '',
        NULL, 1, 0, NULL, NULL, NULL, '2022-02-07 13:30:05', 'admin', '2022-02-07 13:30:13', 'admin', '',
        '1372095692485447681', '临沂云达有限公司', 'lyyd', '1372096215171223553', '研发部', 'lyyd_yfb', '1490492435520389121',
        '员工', '1490558461511528449', 1);
INSERT INTO `sys_user`
VALUES ('1490558644680978434', 'yfbmanager', 'dccd39ddf9ac6811d8aaf93e32f04525', 0, NULL, 0, 'nyp62gy4gb', '研发部部门经理',
        '', '', NULL, 1, 0, NULL, NULL, NULL, '2022-02-07 13:30:49', 'admin', '2022-02-07 13:30:49', 'admin', '',
        '1372095692485447681', '临沂云达有限公司', 'lyyd', '1372096215171223553', '研发部', 'lyyd_yfb', '1490501680026415105',
        '部门经理', '1490558644706144257', 2);
INSERT INTO `sys_user`
VALUES ('1490558788193284098', 'ssbmanager', '08d91edfd101232a0d839d83955d8dcd', 0, NULL, 0, '2opui0ytyi', '实施部部门经理',
        '', '', NULL, 1, 0, NULL, '2022-02-07 13:51:46', '0:0:0:0:0:0:0:1', '2022-02-07 13:31:23', 'admin',
        '2022-02-07 13:51:46', 'admin', '', '1372095692485447681', '临沂云达有限公司', 'lyyd', '1372096169965015041', '实施部',
        'lyyd_ssb', '1490501680026415105', '部门经理', '1490558788235227137', 0);
INSERT INTO `sys_user`
VALUES ('1490558927930716162', 'yfbgeneralmanager', '6bdafcc65c8fa183b6af4c89c3eee891', 0, NULL, 0, 'doolarhgyu',
        '研发部总经理', '', '', NULL, 1, 0, NULL, NULL, NULL, '2022-02-07 13:31:56', 'admin', '2022-02-07 13:31:56', 'admin',
        '', '1372095692485447681', '临沂云达有限公司', 'lyyd', '1372096215171223553', '研发部', 'lyyd_yfb', '1490501816798474242',
        '部门总经理', '1490558927964270594', 3);
INSERT INTO `sys_user`
VALUES ('1490559033690091521', 'employee2', '46f23818f44de0a10d002fc7eb0f271c', 0, NULL, 0, '9dilqpgdqp', '员工2', '', '',
        NULL, 1, 0, NULL, '2022-02-07 14:01:58', '0:0:0:0:0:0:0:1', '2022-02-07 13:32:22', 'admin',
        '2022-02-07 14:01:58', 'admin', '', '1372095692485447681', '临沂云达有限公司', 'lyyd', '1372096260675227650', '研发一组',
        'lyyd_yfb_1', '1490492435520389121', '员工', '1490559033736228866', 1);
INSERT INTO `sys_user`
VALUES ('1490559291228745730', 'companymanager', '582a6f269624a29b792ef4518e45b95e', 0, NULL, 0, '4ilcc829mw',
        '云达公司总负责人', '', '', NULL, 1, 0, NULL, NULL, NULL, '2022-02-07 13:33:23', 'admin', '2022-02-07 13:33:23',
        'admin', '', '1372095692485447681', '临沂云达有限公司', 'lyyd', '1372096215171223553', '研发部', 'lyyd_yfb',
        '1490502692845973505', '公司总负责人', '1490559291249717250', 6);

-- ----------------------------
-- Table structure for sys_user_duty
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_duty`;
CREATE TABLE `sys_user_duty`
(
    `id`           varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `user_id`      varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
    `dept_id`      varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
    `dept_code`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
    `company_id`   varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
    `company_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司编码',
    `duty_id`      varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兼职id',
    `dept_name`    varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
    `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
    `duty_name`    varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兼职名称',
    `code`         varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兼职编码',
    `is_main`      int NULL DEFAULT NULL COMMENT '是否为主要职务0主要职务1兼职',
    `create_id`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者id',
    `create_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者名称',
    `create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
    `update_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
    `update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_duty
-- ----------------------------
INSERT INTO `sys_user_duty`
VALUES ('123213213132131231', '1242327057416970241', '1372096215171223553', 'lyyd_yfb', '1372095692485447681', 'lyyd',
        '1490502202401812481', '研发部', '临沂云达有限公司', '观察员', 'viewer', 0, NULL, NULL, NULL, '1242327057416970241', '超级管理员',
        '2022-02-07 11:22:09');
INSERT INTO `sys_user_duty`
VALUES ('1490526336196345857', '1242327057416970241', '1372096260675227650', 'lyyd_yfb_1', '1372095692485447681',
        'lyyd', '1490492435520389121', '研发一组', '临沂云达有限公司', '员工', 'employee', 1, '1242327057416970241', '超级管理员',
        '2022-02-07 11:22:26', NULL, NULL, '2022-02-07 11:22:26');
INSERT INTO `sys_user_duty`
VALUES ('1490558461511528449', '1490558461457002497', '1372096215171223553', 'lyyd_yfb', '1372095692485447681', 'lyyd',
        '1490492435520389121', '研发部', '临沂云达有限公司', '员工', 'employee', 0, '1490558461457002497', '员工一号',
        '2022-02-07 13:30:05', '1490558461457002497', '员工一号', '2022-02-07 13:30:13');
INSERT INTO `sys_user_duty`
VALUES ('1490558644706144257', '1490558644680978434', '1372096215171223553', 'lyyd_yfb', '1372095692485447681', 'lyyd',
        '1490501680026415105', '研发部', '临沂云达有限公司', '部门经理', 'department_manager', 0, '1490558644680978434', '研发部部门经理',
        '2022-02-07 13:30:49', NULL, NULL, '2022-02-07 13:30:49');
INSERT INTO `sys_user_duty`
VALUES ('1490558788235227137', '1490558788193284098', '1372096169965015041', 'lyyd_ssb', '1372095692485447681', 'lyyd',
        '1490501680026415105', '实施部', '临沂云达有限公司', '部门经理', 'department_manager', 0, '1490558788193284098', '实施部部门经理',
        '2022-02-07 13:31:23', NULL, NULL, '2022-02-07 13:31:23');
INSERT INTO `sys_user_duty`
VALUES ('1490558927964270594', '1490558927930716162', '1372096215171223553', 'lyyd_yfb', '1372095692485447681', 'lyyd',
        '1490501816798474242', '研发部', '临沂云达有限公司', '部门总经理', 'department_grand_manager', 0, '1490558927930716162',
        '研发部总经理', '2022-02-07 13:31:56', NULL, NULL, '2022-02-07 13:31:56');
INSERT INTO `sys_user_duty`
VALUES ('1490559033736228866', '1490559033690091521', '1372096260675227650', 'lyyd_yfb_1', '1372095692485447681',
        'lyyd', '1490492435520389121', '研发一组', '临沂云达有限公司', '员工', 'employee', 0, '1490559033690091521', '员工2',
        '2022-02-07 13:32:22', NULL, NULL, '2022-02-07 13:32:22');
INSERT INTO `sys_user_duty`
VALUES ('1490559291249717250', '1490559291228745730', '1372096215171223553', 'lyyd_yfb', '1372095692485447681', 'lyyd',
        '1490502692845973505', '研发部', '临沂云达有限公司', '公司总负责人', 'gszfzr', 0, '1490559291228745730', '云达公司总负责人',
        '2022-02-07 13:33:23', NULL, NULL, '2022-02-07 13:33:23');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
    `role_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES ('1339051163721404418', '1339100639353901058');
INSERT INTO `sys_user_role`
VALUES ('1242327057416970241', '1339098556764524545');
INSERT INTO `sys_user_role`
VALUES ('1435083582674939906', '1339100639353901058');
INSERT INTO `sys_user_role`
VALUES ('1435083582674939906', '1339098556764524545');
INSERT INTO `sys_user_role`
VALUES ('1450039663116910594', '1339100639353901058');

-- ----------------------------
-- Table structure for upload_files
-- ----------------------------
DROP TABLE IF EXISTS `upload_files`;
CREATE TABLE `upload_files`
(
    `id`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
    `storage`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传类型',
    `url`         varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
    `name`        varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
    `size`        int NULL DEFAULT 0 COMMENT '文件大小',
    `type`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
    `extension`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀名',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload_files
-- ----------------------------

SET
FOREIGN_KEY_CHECKS = 1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
