/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.20-log : Database - eshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `auth_account` */

DROP TABLE IF EXISTS `auth_account`;

CREATE TABLE `auth_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `username` varchar(1024) NOT NULL COMMENT '用户名，英文，默认是姓名的小写拼音',
  `password` char(8) NOT NULL COMMENT '账号的密码',
  `name` varchar(1024) NOT NULL COMMENT '员工姓名，中文',
  `remark` varchar(1024) DEFAULT NULL COMMENT '账号的说明备注',
  `gmt_create` datetime NOT NULL COMMENT '账号的创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '账号的更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COMMENT='账号表，电商公司里一个员工就对应着一个账号，每个账号给分配多个角色，同时这个账号也可以给分配多个权限';

/*Table structure for table `auth_account_priority_relationship` */

DROP TABLE IF EXISTS `auth_account_priority_relationship`;

CREATE TABLE `auth_account_priority_relationship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `account_id` bigint(20) NOT NULL COMMENT '账号的主键',
  `priority_id` bigint(20) NOT NULL COMMENT '权限的主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_account_id_priority_id` (`account_id`,`priority_id`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_priority_id` (`priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COMMENT='账号与权限的关系表，一个账号可以对应多个权限，一个权限也可以属于多个账号';

/*Table structure for table `auth_account_role_relationship` */

DROP TABLE IF EXISTS `auth_account_role_relationship`;

CREATE TABLE `auth_account_role_relationship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `account_id` bigint(20) NOT NULL COMMENT '账号的主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色的主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_account_id_role_id` (`account_id`,`role_id`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='账号和角色的关系表，一个账号可以对应多个角色，一个角色也可以对应多个账号';

/*Table structure for table `auth_priority` */

DROP TABLE IF EXISTS `auth_priority`;

CREATE TABLE `auth_priority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `code` varchar(1024) NOT NULL COMMENT '权限编号',
  `url` varchar(1024) DEFAULT NULL COMMENT '权限对应的请求URL',
  `priority_comment` varchar(1024) DEFAULT NULL COMMENT '权限的说明备注',
  `priority_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '权限类型，1：菜单，2：其他',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父权限的主键',
  `gmt_create` datetime NOT NULL COMMENT '权限的创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '权限的修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COMMENT='权限表，每个权限代表了系统中的一个菜单、按钮、URL请求';

/*Table structure for table `auth_role` */

DROP TABLE IF EXISTS `auth_role`;

CREATE TABLE `auth_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `code` varchar(1024) NOT NULL COMMENT '角色编号',
  `name` varchar(1024) NOT NULL COMMENT '角色名称',
  `remark` varchar(1024) DEFAULT NULL COMMENT '角色的说明备注',
  `gmt_create` datetime NOT NULL COMMENT '角色的创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '角色的修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='角色表，在系统中有多个角色，每个角色可以分配一些权限';

/*Table structure for table `auth_role_priority_relationship` */

DROP TABLE IF EXISTS `auth_role_priority_relationship`;

CREATE TABLE `auth_role_priority_relationship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `priority_id` bigint(20) NOT NULL COMMENT '权限的主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色的主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_priority_id_role_id` (`priority_id`,`role_id`),
  KEY `idx_priority_id` (`priority_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='角色和权限的关系表，角色和权限是多对多的关系，一个角色可以对应多个权限，一个权限可以属于多个角色';

/*Table structure for table `comment_aggregate` */

DROP TABLE IF EXISTS `comment_aggregate`;

CREATE TABLE `comment_aggregate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `total_comment_count` bigint(20) NOT NULL COMMENT '评论总数量',
  `good_comment_count` bigint(20) NOT NULL COMMENT '好评数量',
  `good_comment_rate` decimal(8,2) NOT NULL COMMENT '好评率',
  `show_pictures_comment_count` bigint(20) NOT NULL COMMENT '晒图评论数量',
  `medium_comment_count` bigint(20) NOT NULL COMMENT '中评数量',
  `bad_comment_count` bigint(20) NOT NULL COMMENT '差评数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='评论聚合汇总表';

/*Table structure for table `comment_info` */

DROP TABLE IF EXISTS `comment_info`;

CREATE TABLE `comment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '发表评论的用户账号的ID',
  `username` varchar(1024) NOT NULL COMMENT '用户名',
  `order_info_id` bigint(20) NOT NULL COMMENT '订单信息ID',
  `order_item_id` bigint(20) NOT NULL COMMENT '订单条目id',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `goods_sku_sale_properties` varchar(1024) NOT NULL COMMENT '商品sku的销售属性',
  `total_score` tinyint(4) NOT NULL COMMENT '总评分，1~5',
  `goods_score` tinyint(4) NOT NULL COMMENT '商品评分，1~5',
  `customer_service_score` tinyint(4) NOT NULL COMMENT '客服评分，1~5',
  `logistics_score` tinyint(4) NOT NULL COMMENT '物流评分，1~5',
  `comment_content` varchar(1024) NOT NULL COMMENT '评论内容',
  `is_show_pictures` tinyint(4) NOT NULL COMMENT '是否晒图，1：晒图，0：未晒图',
  `is_default_comment` tinyint(4) NOT NULL COMMENT '是否系统自动给的默认评论，1：是默认评论，0：不是默认评论',
  `comment_status` tinyint(4) NOT NULL COMMENT '评论状态，1：待审核，2：已审核，3：审核不通过',
  `comment_type` tinyint(4) NOT NULL COMMENT '评论类型，1：好评，总分是4分以上；2：中评，3分；3：差评，1~2分',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='评论信息表';

/*Table structure for table `comment_picture` */

DROP TABLE IF EXISTS `comment_picture`;

CREATE TABLE `comment_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_info_id` bigint(20) NOT NULL COMMENT '评论ID',
  `comment_picture_path` varchar(1024) NOT NULL COMMENT '评论晒图的图片路径',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='评论的晒图';

/*Table structure for table `commodity_brand` */

DROP TABLE IF EXISTS `commodity_brand`;

CREATE TABLE `commodity_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chinese_name` varchar(1024) NOT NULL COMMENT '品牌中文名',
  `english_name` varchar(1024) NOT NULL COMMENT '品牌英文名',
  `alias_name` varchar(1024) NOT NULL COMMENT '品牌别名',
  `logo_path` varchar(1024) NOT NULL COMMENT 'logo的图片路径',
  `introduction` varchar(1024) NOT NULL COMMENT '品牌介绍',
  `auth_voucher_path` varchar(1024) NOT NULL COMMENT '品牌授权凭证的图片路径',
  `location` varchar(1024) NOT NULL COMMENT '品牌所在地',
  `remark` varchar(1024) DEFAULT NULL COMMENT '品牌说明备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='商品中心的品牌表';

/*Table structure for table `commodity_category` */

DROP TABLE IF EXISTS `commodity_category`;

CREATE TABLE `commodity_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1024) NOT NULL COMMENT '类目名称',
  `description` varchar(1024) DEFAULT NULL COMMENT '类目描述',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目的主键',
  `is_leaf` tinyint(4) DEFAULT NULL COMMENT '是否为叶子类目，1：是，0：否',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='商品中心的类目表';

/*Table structure for table `commodity_category_property_relationship` */

DROP TABLE IF EXISTS `commodity_category_property_relationship`;

CREATE TABLE `commodity_category_property_relationship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '类目ID',
  `property_id` bigint(20) NOT NULL COMMENT '属性ID',
  `is_required` tinyint(4) NOT NULL COMMENT '属性是否必填，1：是必填，0：非必填',
  `property_types` varchar(1024) NOT NULL COMMENT '属性类型，1：关键属性，2：销售属性，3：非关键属性，4：导购属性，这里可以有多个值拼接在一起，比如1,2，2,4',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='商品中心的类目和属性的关联关系表';

/*Table structure for table `commodity_goods` */

DROP TABLE IF EXISTS `commodity_goods`;

CREATE TABLE `commodity_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '类目ID',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID',
  `code` varchar(1024) NOT NULL COMMENT 'SPU编号',
  `name` varchar(1024) NOT NULL COMMENT '商品名称',
  `sub_name` varchar(1024) NOT NULL COMMENT '商品副名称',
  `gross_weight` decimal(8,2) NOT NULL COMMENT '商品毛重，单位是g',
  `length` decimal(8,2) NOT NULL COMMENT '外包装长度，单位是cm',
  `width` decimal(8,2) NOT NULL COMMENT '外包装宽，单位是cm',
  `height` decimal(8,2) NOT NULL COMMENT '外包装高，单位是cm',
  `status` tinyint(4) NOT NULL COMMENT '商品状态，1：待审核，2：待上架，3：审核未通过，4：已上架',
  `service_guarantees` varchar(1024) NOT NULL COMMENT '服务保证',
  `package_list` varchar(1024) NOT NULL COMMENT '包装清单',
  `freight_template_id` bigint(20) NOT NULL COMMENT '运费模板ID',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8 COMMENT='商品中心的商品信息基础表';

/*Table structure for table `commodity_goods_detail` */

DROP TABLE IF EXISTS `commodity_goods_detail`;

CREATE TABLE `commodity_goods_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `detail_content` longtext COMMENT '商品详情内容',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='商品详情数据';

/*Table structure for table `commodity_goods_detail_picture` */

DROP TABLE IF EXISTS `commodity_goods_detail_picture`;

CREATE TABLE `commodity_goods_detail_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_detail_id` bigint(20) NOT NULL COMMENT '商品详情id',
  `picture_path` varchar(1024) NOT NULL COMMENT '商品详情内容中的一张图片的路径',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='商品详情内容中的图片';

/*Table structure for table `commodity_goods_picture` */

DROP TABLE IF EXISTS `commodity_goods_picture`;

CREATE TABLE `commodity_goods_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `picture_path` varchar(1024) NOT NULL COMMENT '图片路径',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='商品附加的图片表';

/*Table structure for table `commodity_goods_property_value` */

DROP TABLE IF EXISTS `commodity_goods_property_value`;

CREATE TABLE `commodity_goods_property_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(4) NOT NULL COMMENT '属性值的类型，1：类目直接关联的属性的值；2：类目的属性组关联的属性的值',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `relation_id` bigint(20) NOT NULL COMMENT '如果type是1，那么这里是类目与属性关联关系的ID；如果type是2，那么这里是类目的属性组与属性的关联关系的id',
  `property_value` varchar(1024) NOT NULL COMMENT '如果是可选的，那么直可能就是：黑色,白色，多个值串起来的；如果是输入的，那么就是直接输入的一个值',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='商品属性值';

/*Table structure for table `commodity_goods_sku` */

DROP TABLE IF EXISTS `commodity_goods_sku`;

CREATE TABLE `commodity_goods_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `sku_code` varchar(1024) NOT NULL COMMENT 'sku编号',
  `purchase_price` decimal(8,2) NOT NULL COMMENT '采购价格',
  `sale_price` decimal(8,2) NOT NULL COMMENT '销售价格',
  `discount_price` decimal(8,2) NOT NULL COMMENT '促销价格',
  `sale_properties` varchar(1024) NOT NULL COMMENT '销售属性',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='商品sku信息';

/*Table structure for table `commodity_goods_sku_sale_property_value` */

DROP TABLE IF EXISTS `commodity_goods_sku_sale_property_value`;

CREATE TABLE `commodity_goods_sku_sale_property_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_sku_id` bigint(20) NOT NULL COMMENT 'sku ID',
  `relation_id` bigint(20) NOT NULL COMMENT '类目与属性关联关系的ID',
  `property_value` varchar(1024) NOT NULL COMMENT 'sku对应的某个销售属性的实际值',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_sku_id` (`goods_sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='sku商品对每个销售属性的一个实际值';

/*Table structure for table `commodity_property` */

DROP TABLE IF EXISTS `commodity_property`;

CREATE TABLE `commodity_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `property_name` varchar(255) NOT NULL COMMENT '属性名称',
  `property_desc` varchar(1024) DEFAULT NULL COMMENT '属性描述',
  `input_type` tinyint(4) NOT NULL COMMENT '输入方式，1：多选，2：输入',
  `input_values` varchar(1024) DEFAULT NULL COMMENT '可选值范围，如果输入方式是可选，那么需要提供一些供选择的值范围',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='商品中心的属性表';

/*Table structure for table `commodity_property_group` */

DROP TABLE IF EXISTS `commodity_property_group`;

CREATE TABLE `commodity_property_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1024) NOT NULL COMMENT '属性分组名称',
  `category_id` bigint(20) NOT NULL COMMENT '所属的类目ID',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='商品中心的属性分组表';

/*Table structure for table `commodity_property_group_relationship` */

DROP TABLE IF EXISTS `commodity_property_group_relationship`;

CREATE TABLE `commodity_property_group_relationship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `property_group_id` bigint(20) NOT NULL COMMENT '属性分组ID',
  `property_id` bigint(20) NOT NULL COMMENT '属性ID',
  `is_required` tinyint(4) NOT NULL COMMENT '属性是否必填，1：是必填，0：非必填',
  `property_types` varchar(1024) NOT NULL COMMENT '属性类型，1：关键属性，2：销售属性，3：非关键属性，4：导购属性，这里可以有多个值拼接在一起，比如1,2，2,4',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_property_group_id` (`property_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='商品中心的属性分组和属性的关联关系表';

/*Table structure for table `customer_return_goods_worksheet` */

DROP TABLE IF EXISTS `customer_return_goods_worksheet`;

CREATE TABLE `customer_return_goods_worksheet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_info_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_no` varchar(1024) NOT NULL COMMENT '订单编号',
  `status` tinyint(4) NOT NULL COMMENT '退货工单状态，1：待审核，2：审核不通过，3：待寄送退货商品，4：退货商品待收货，5：退货待入库，6：退货已入库，7：完成退款',
  `return_goods_reason` tinyint(4) NOT NULL COMMENT '退货原因，1：质量不好，2：商品不满意，3：买错了，4：无理由退货',
  `return_goods_remark` varchar(1024) NOT NULL COMMENT '退货备注',
  `return_goods_logistics_code` varchar(1024) DEFAULT NULL COMMENT '退货快递单号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_info_id` (`order_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='客服中心的退货工单';

/*Table structure for table `finance_logistics_settlement_detail` */

DROP TABLE IF EXISTS `finance_logistics_settlement_detail`;

CREATE TABLE `finance_logistics_settlement_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_no` varchar(1024) NOT NULL COMMENT '订单编号',
  `total_settlement_amount` decimal(8,2) NOT NULL COMMENT '结算金额',
  `bank_account` varchar(1024) NOT NULL COMMENT '银行账号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务中心：跟物流公司的结算流水明细';

/*Table structure for table `finance_purchase_settlement_order` */

DROP TABLE IF EXISTS `finance_purchase_settlement_order`;

CREATE TABLE `finance_purchase_settlement_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `purchase_order_id` bigint(20) NOT NULL COMMENT '采购单id',
  `purchase_input_order_id` bigint(20) DEFAULT NULL COMMENT '采购入库单id',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商ID',
  `expect_arrival_time` datetime NOT NULL COMMENT '预计到货时间',
  `actual_arrival_time` datetime NOT NULL COMMENT '实际到货时间',
  `purchase_contactor` varchar(1024) NOT NULL COMMENT '采购联系人',
  `purchase_contactor_phone_number` varchar(1024) NOT NULL COMMENT '采购联系电话',
  `purchase_contactor_email` varchar(1024) NOT NULL COMMENT '采购联系邮箱',
  `purchase_order_remark` varchar(1024) NOT NULL COMMENT '采购单备注说明',
  `purchaser` varchar(1024) NOT NULL COMMENT '采购员',
  `status` tinyint(4) NOT NULL COMMENT '采购入库单状态，1：编辑中，2：待审核，3：已完成',
  `total_settlement_amount` decimal(8,2) NOT NULL COMMENT '总结算金额',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_supplier_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='财务中心的采购结算单';

/*Table structure for table `finance_purchase_settlement_order_item` */

DROP TABLE IF EXISTS `finance_purchase_settlement_order_item`;

CREATE TABLE `finance_purchase_settlement_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `purchase_settlement_order_id` bigint(20) NOT NULL COMMENT '采购结算单ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品SKU ID',
  `purchase_count` bigint(20) NOT NULL COMMENT '采购数量',
  `purchase_price` decimal(8,2) NOT NULL COMMENT '采购价格',
  `qualified_count` bigint(20) NOT NULL COMMENT '合格商品的数量',
  `arrival_count` bigint(20) NOT NULL COMMENT '到货的商品数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='财务中心的采购结算单';

/*Table structure for table `finance_return_goods_refund_detail` */

DROP TABLE IF EXISTS `finance_return_goods_refund_detail`;

CREATE TABLE `finance_return_goods_refund_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_no` varchar(1024) NOT NULL COMMENT '订单编号',
  `return_goods_worksheet_id` bigint(20) NOT NULL COMMENT '退货工单ID',
  `return_goods_warehouse_entry_order_id` bigint(20) NOT NULL COMMENT '退货入库单ID',
  `user_account_id` bigint(20) NOT NULL COMMENT '用户账号ID',
  `refundl_amount` decimal(8,2) NOT NULL COMMENT '退款金额',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务中心：退货打款流水明细';

/*Table structure for table `inventory_goods_stock` */

DROP TABLE IF EXISTS `inventory_goods_stock`;

CREATE TABLE `inventory_goods_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `sale_stock_quantity` bigint(20) NOT NULL COMMENT '销售库存',
  `locked_stock_quantity` bigint(20) NOT NULL COMMENT '锁定库存',
  `saled_stock_quantity` bigint(20) NOT NULL COMMENT '已销售库存',
  `stock_status` tinyint(4) NOT NULL COMMENT '库存状态，0：无库存，1：有库存',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_goods_sku_id` (`goods_sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='库存中心的商品库存表';

/*Table structure for table `inventory_offline_stock_update_message` */

DROP TABLE IF EXISTS `inventory_offline_stock_update_message`;

CREATE TABLE `inventory_offline_stock_update_message` (
  `id` binary(20) NOT NULL COMMENT '主键',
  `message_id` varchar(1024) NOT NULL COMMENT '库存更新消息id',
  `operation` bit(1) DEFAULT NULL COMMENT '库存更新操作类型',
  `parameter` longtext COMMENT '参数，json格式',
  `parameter_clazz` varchar(1024) DEFAULT NULL COMMENT '参数类型',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `logistics_freight_template` */

DROP TABLE IF EXISTS `logistics_freight_template`;

CREATE TABLE `logistics_freight_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1024) NOT NULL COMMENT '运费模板名称',
  `type` tinyint(4) NOT NULL COMMENT '运费模板类型，1：固定运费，2：满X元包邮，3：自定义规则',
  `rule` varchar(1024) NOT NULL COMMENT '运费模板的规则',
  `remark` varchar(1024) NOT NULL COMMENT '运费模板的说明备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='物流中心的运费模板表';

/*Table structure for table `membership_delivery_address` */

DROP TABLE IF EXISTS `membership_delivery_address`;

CREATE TABLE `membership_delivery_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '属于哪个用户账号',
  `province` varchar(1024) NOT NULL COMMENT '省',
  `city` varchar(1024) NOT NULL COMMENT '市',
  `district` varchar(1024) NOT NULL COMMENT '区',
  `consignee` varchar(1024) NOT NULL COMMENT '收货人',
  `address` varchar(1024) NOT NULL COMMENT '收货地址',
  `phone_number` varchar(1024) NOT NULL COMMENT '收货人电话号码',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_account_id` (`user_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='会员中心的收货地址表';

/*Table structure for table `membership_member_level` */

DROP TABLE IF EXISTS `membership_member_level`;

CREATE TABLE `membership_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '属于哪个会员账号',
  `growth_value` bigint(20) NOT NULL COMMENT '成长值',
  `level` tinyint(4) NOT NULL COMMENT '会员等级，从1开始，1级，2级，3级，4级',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_account_id` (`user_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='会员中心的会员等级表';

/*Table structure for table `membership_member_level_detail` */

DROP TABLE IF EXISTS `membership_member_level_detail`;

CREATE TABLE `membership_member_level_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '用户账号id',
  `old_growth_value` bigint(20) NOT NULL COMMENT '本次变动之前的成长值',
  `updated_growth_value` bigint(20) NOT NULL COMMENT '本次变动了多少成长值',
  `new_growth_value` bigint(20) NOT NULL COMMENT '本次变动之后的成长值',
  `old_member_level` tinyint(4) NOT NULL COMMENT '本次变动之前的会员等级',
  `new_member_level` tinyint(4) NOT NULL COMMENT '本次变动后的会员级别',
  `update_reason` varchar(1024) NOT NULL COMMENT '变动原因',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员等级变更的明细表';

/*Table structure for table `membership_member_point` */

DROP TABLE IF EXISTS `membership_member_point`;

CREATE TABLE `membership_member_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '会员账号ID',
  `point` bigint(20) NOT NULL COMMENT '会员积分',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_account_id` (`user_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='会员中心的会员积分表';

/*Table structure for table `membership_member_point_detail` */

DROP TABLE IF EXISTS `membership_member_point_detail`;

CREATE TABLE `membership_member_point_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '用户账号id',
  `old_member_point` bigint(20) NOT NULL COMMENT '本次变动之前的会员积分',
  `updated_member_point` bigint(20) NOT NULL COMMENT '本次变动的会员积分',
  `new_member_point` bigint(20) NOT NULL COMMENT '本次变动之后的会员积分',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  `update_reason` varchar(1024) NOT NULL COMMENT '本次积分变动的原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员积分变动的明细表';

/*Table structure for table `membership_user_account` */

DROP TABLE IF EXISTS `membership_user_account`;

CREATE TABLE `membership_user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(1024) NOT NULL COMMENT '用户名',
  `password` varchar(1024) NOT NULL COMMENT '密码',
  `email` varchar(1024) NOT NULL COMMENT '邮箱',
  `cell_phone_number` varchar(1024) NOT NULL COMMENT '手机号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='会员中心的用户账号信息';

/*Table structure for table `membership_user_detail` */

DROP TABLE IF EXISTS `membership_user_detail`;

CREATE TABLE `membership_user_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '用户账号id',
  `name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别，1：男，2：女',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `id_number` varchar(1024) DEFAULT NULL COMMENT '身份证号',
  `address` varchar(1024) DEFAULT NULL COMMENT '家庭住址',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_account_id` (`user_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Table structure for table `order_info` */

DROP TABLE IF EXISTS `order_info`;

CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号ID',
  `username` varchar(1024) NOT NULL COMMENT '用户名',
  `order_no` varchar(1024) NOT NULL COMMENT '订单编号，随机生成的UUID',
  `order_status` tinyint(4) NOT NULL COMMENT '订单状态，1：待付款，2：已取消，3：待发货，4：待收货，5：已完成，6：售后中（退货申请待审核），7：交易关闭（退货审核不通过），8：交易中（待寄送退货商品），9：售后中（退货商品待收货），10：售后中（退货待入库），11：（1）售后中（退货已入库），12：交易关闭（完成退款）',
  `consignee` varchar(1024) NOT NULL COMMENT '收货人',
  `delivery_address` varchar(1024) NOT NULL COMMENT '收货地址',
  `consignee_cell_phone_number` varchar(1024) NOT NULL COMMENT '收货人电话号码',
  `freight` decimal(8,2) NOT NULL COMMENT '运费',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式，1：支付宝，2：微信',
  `total_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `discount_amount` decimal(8,2) NOT NULL COMMENT '促销活动折扣金额',
  `coupon_amount` decimal(8,2) NOT NULL COMMENT '优惠券抵扣金额',
  `payable_amount` decimal(8,2) NOT NULL COMMENT '应付金额，订单总金额 - 促销活动折扣金额 - 优惠券抵扣金额 + 运费',
  `invoice_title` varchar(1024) NOT NULL COMMENT '发票抬头',
  `taxpayer_id` varchar(1024) NOT NULL COMMENT '纳税人识别号',
  `order_comment` varchar(1024) NOT NULL COMMENT '订单备注',
  `is_published_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否发表评论，1：发表，0：未发表',
  `confirm_receipt_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_account_id` (`user_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='订单信息表';

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_info_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `goods_sku_code` varchar(1024) NOT NULL COMMENT '商品sku编号',
  `goods_name` varchar(1024) NOT NULL COMMENT '商品名称',
  `sale_properties` varchar(1024) NOT NULL COMMENT '销售属性，机身颜色:白色,内存容量:256G',
  `goods_gross_weight` decimal(8,2) NOT NULL COMMENT '商品毛重',
  `purchase_quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `purchase_price` decimal(8,2) NOT NULL COMMENT '商品购买价格',
  `promotion_activity_id` bigint(20) DEFAULT NULL COMMENT '促销活动ID',
  `goods_length` decimal(8,2) NOT NULL COMMENT '商品长度',
  `goods_width` decimal(8,2) NOT NULL COMMENT '商品宽度',
  `goods_height` decimal(8,2) NOT NULL COMMENT '商品高度',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='订单商品条目';

/*Table structure for table `order_operate_log` */

DROP TABLE IF EXISTS `order_operate_log`;

CREATE TABLE `order_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_info_id` bigint(20) NOT NULL COMMENT '订单ID',
  `operate_type` tinyint(4) NOT NULL COMMENT '操作类型，1：创建订单，2：手动取消订单，3：自动取消订单，4：支付订单，5：手动确认收货，6：自动确认收货，7：商品发货，8：申请退货，9：退货审核不通过，10：退货审核通过，11：寄送退货商品，12：确认收到退货，13：退货已入库，14：完成退款',
  `operate_content` varchar(1024) NOT NULL COMMENT '操作内容',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_info_id` (`order_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='订单操作记录表';

/*Table structure for table `order_return_goods_apply` */

DROP TABLE IF EXISTS `order_return_goods_apply`;

CREATE TABLE `order_return_goods_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_info_id` bigint(20) NOT NULL COMMENT '订单ID',
  `return_goods_reason` tinyint(4) NOT NULL COMMENT '退货原因，1：质量不好，2：商品不满意，3：买错了，4：无理由退货',
  `return_goods_comment` varchar(1024) NOT NULL COMMENT '退货备注',
  `return_goods_apply_status` tinyint(4) NOT NULL COMMENT '退货记录状态，1：待审核，2：审核不通过，3：审核通过',
  `return_goods_logistic_code` varchar(1024) DEFAULT NULL COMMENT '退货快递单号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_info_id` (`order_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单退货表';

/*Table structure for table `pay_transaction` */

DROP TABLE IF EXISTS `pay_transaction`;

CREATE TABLE `pay_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_info_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_no` varchar(1024) NOT NULL COMMENT '订单编号',
  `payable_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `user_account_id` bigint(20) NOT NULL COMMENT '用户账号ID',
  `user_pay_account` varchar(1024) DEFAULT NULL COMMENT '用户支付账号',
  `transaction_channel` tinyint(4) NOT NULL COMMENT '交易渠道，1：支付宝，2：微信',
  `transaction_number` varchar(1024) DEFAULT NULL COMMENT '交易流水号，第三方支付平台生成',
  `finish_pay_time` datetime DEFAULT NULL COMMENT '第三方平台完成支付的时间',
  `response_code` varchar(1024) DEFAULT NULL COMMENT '交易渠道返回的状态码',
  `status` varchar(1024) NOT NULL COMMENT '支付状态，1：待支付，2：支付成功，3：支付失败，4：交易关闭；5：退款',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='支付交易流水';

/*Table structure for table `promotion_activity` */

DROP TABLE IF EXISTS `promotion_activity`;

CREATE TABLE `promotion_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1024) NOT NULL COMMENT '促销活动名称',
  `start_time` datetime NOT NULL COMMENT '促销活动开始时间',
  `end_time` datetime NOT NULL COMMENT '促销活动结束时间',
  `remark` varchar(1024) DEFAULT NULL COMMENT '促销活动说明备注',
  `status` tinyint(4) NOT NULL COMMENT '促销活动的状态，1：启用，2：停用',
  `rule` varchar(1024) NOT NULL COMMENT '促销活动的规则',
  `type` tinyint(4) NOT NULL COMMENT '促销活动的类型，1：满减；2：多买优惠；3：单品促销；4：满赠促销；5：赠品促销',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8 COMMENT='促销活动表';

/*Table structure for table `promotion_activity_goods_relation` */

DROP TABLE IF EXISTS `promotion_activity_goods_relation`;

CREATE TABLE `promotion_activity_goods_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `promotion_activity_id` bigint(20) NOT NULL COMMENT '促销活动ID',
  `goods_id` bigint(20) NOT NULL COMMENT '关联的某个商品sku的ID，如果将这个字段的值设置为-1，那么代表针对全部商品',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='促销活动跟商品sku的关联关系';

/*Table structure for table `promotion_coupon` */

DROP TABLE IF EXISTS `promotion_coupon`;

CREATE TABLE `promotion_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1024) NOT NULL COMMENT '优惠券名称',
  `type` tinyint(4) NOT NULL COMMENT '优惠券类型，1：现金券，2：满减券',
  `rule` varchar(1024) NOT NULL COMMENT '优惠券规则',
  `valid_start_time` datetime NOT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime NOT NULL COMMENT '有效期结束时间',
  `give_out_count` bigint(20) NOT NULL COMMENT '优惠券发行数量',
  `received_count` bigint(20) NOT NULL COMMENT '优惠券已经领取的数量',
  `give_out_type` tinyint(4) NOT NULL COMMENT '优惠券发放方式，1：可发放可领取，2：仅可发放，3：仅可领取',
  `status` tinyint(4) NOT NULL COMMENT '优惠券状态，1：未开始；2：发放中，3：已发完；4：已过期',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='优惠券表';

/*Table structure for table `promotion_coupon_achieve` */

DROP TABLE IF EXISTS `promotion_coupon_achieve`;

CREATE TABLE `promotion_coupon_achieve` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `coupon_id` bigint(20) NOT NULL COMMENT '优惠券ID',
  `user_account_id` bigint(20) NOT NULL COMMENT '用户账号ID',
  `is_used` tinyint(4) NOT NULL COMMENT '是否使用过这个优惠券，1：使用了，0：未使用',
  `used_time` datetime DEFAULT NULL COMMENT '使用优惠券的时间',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_coupon_id_user_account_id` (`coupon_id`,`user_account_id`),
  KEY `idx_user_account_id` (`user_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='优惠券领取记录表';

/*Table structure for table `purchase_order` */

DROP TABLE IF EXISTS `purchase_order`;

CREATE TABLE `purchase_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商ID',
  `expect_arrival_time` datetime NOT NULL COMMENT '预计到货时间',
  `contactor` varchar(1024) NOT NULL COMMENT '联系人',
  `contactor_phone_number` varchar(1024) NOT NULL COMMENT '联系电话',
  `contactor_email` varchar(1024) NOT NULL COMMENT '联系邮箱',
  `remark` varchar(1024) NOT NULL COMMENT '说明备注',
  `purchaser` varchar(1024) NOT NULL COMMENT '采购员',
  `status` tinyint(4) NOT NULL COMMENT '采购单状态，1：编辑中，2：待审核，3：已审核，4：待入库，5：待结算，6：已完成',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='采购中心的采购单';

/*Table structure for table `purchase_order_item` */

DROP TABLE IF EXISTS `purchase_order_item`;

CREATE TABLE `purchase_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `purchase_order_id` bigint(20) NOT NULL COMMENT '采购单ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品SKU ID',
  `purchase_count` bigint(20) NOT NULL COMMENT '采购数量',
  `purchase_price` decimal(8,2) NOT NULL COMMENT '采购价格',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_purchase_order_id` (`purchase_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='采购单中的商品条目';

/*Table structure for table `purchase_supplier` */

DROP TABLE IF EXISTS `purchase_supplier`;

CREATE TABLE `purchase_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1024) NOT NULL COMMENT '供应商名称',
  `company_name` varchar(1024) NOT NULL COMMENT '公司名称',
  `company_address` varchar(1024) NOT NULL COMMENT '公司地址',
  `contactor` varchar(1024) NOT NULL COMMENT '联系人',
  `contactor_phone_number` varchar(1024) NOT NULL COMMENT '联系电话',
  `settlement_period` tinyint(4) NOT NULL COMMENT '账期，1：周结算，2：月结算，3：季度结算',
  `bank_name` varchar(1024) NOT NULL COMMENT '银行名称',
  `bank_account` varchar(1024) NOT NULL COMMENT '银行账户',
  `bank_account_holder` varchar(1024) NOT NULL COMMENT '开户人',
  `invoice_title` varchar(1024) NOT NULL COMMENT '发票抬头',
  `taxpayer_id` varchar(1024) NOT NULL COMMENT '纳税人识别号',
  `business_scope` varchar(1024) NOT NULL COMMENT '经营范围',
  `remark` varchar(1024) NOT NULL COMMENT '说明备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_settlement_period` (`settlement_period`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='采购中心的供应商表';

/*Table structure for table `schedule_goods_allocation_stock` */

DROP TABLE IF EXISTS `schedule_goods_allocation_stock`;

CREATE TABLE `schedule_goods_allocation_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_allocation_id` bigint(20) NOT NULL COMMENT '货位ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `available_stock_quantity` bigint(20) NOT NULL COMMENT '可用库存数量',
  `locked_stock_quantity` bigint(20) NOT NULL COMMENT '锁定库存数量',
  `output_stock_quantity` bigint(20) NOT NULL COMMENT '已出库库存数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_goods_allocation_id_goods_sku_id` (`goods_allocation_id`,`goods_sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='调度中心的货位库存';

/*Table structure for table `schedule_goods_allocation_stock_detail` */

DROP TABLE IF EXISTS `schedule_goods_allocation_stock_detail`;

CREATE TABLE `schedule_goods_allocation_stock_detail` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku id',
  `goods_allocation_id` bigint(20) NOT NULL COMMENT '货位id',
  `put_on_time` datetime NOT NULL COMMENT '上架时间',
  `put_on_quantity` bigint(20) NOT NULL COMMENT '上架多少件商品',
  `current_stock_quantity` bigint(20) NOT NULL COMMENT '当前这一批上架的商品还有多少件库存',
  `locked_stock_quantity` bigint(20) NOT NULL COMMENT '当前这一批商品被锁定的库存',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `schedule_goods_stock` */

DROP TABLE IF EXISTS `schedule_goods_stock`;

CREATE TABLE `schedule_goods_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `available_stock_quantity` bigint(20) NOT NULL COMMENT '可用库存数量',
  `locked_stock_quantity` bigint(20) NOT NULL COMMENT '锁定库存数量',
  `output_stock_quantity` bigint(20) NOT NULL COMMENT '已出库库存数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_goods_sku_id` (`goods_sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='调度中心的商品库存';

/*Table structure for table `schedule_order_picking_item` */

DROP TABLE IF EXISTS `schedule_order_picking_item`;

CREATE TABLE `schedule_order_picking_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_info_id` bigint(20) NOT NULL COMMENT '定案id',
  `order_item_id` bigint(20) NOT NULL COMMENT '订单条目ID',
  `goods_allocation_id` bigint(20) NOT NULL COMMENT '货位ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku id',
  `picking_count` bigint(20) NOT NULL COMMENT '拣货数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_info_id_order_item_id` (`order_info_id`,`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='调度后的订单条目对应的拣货条目';

/*Table structure for table `schedule_order_send_out_detail` */

DROP TABLE IF EXISTS `schedule_order_send_out_detail`;

CREATE TABLE `schedule_order_send_out_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_info_id` bigint(20) NOT NULL COMMENT '订单id',
  `order_item_id` bigint(20) NOT NULL COMMENT '订单条目id',
  `goods_allocation_stock_detail_id` bigint(20) NOT NULL COMMENT '货位库存明细id',
  `send_out_count` bigint(20) NOT NULL COMMENT '发货数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `shopping_cart` */

DROP TABLE IF EXISTS `shopping_cart`;

CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '会员账号ID',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_account_id` (`user_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='购物车';

/*Table structure for table `shopping_cart_item` */

DROP TABLE IF EXISTS `shopping_cart_item`;

CREATE TABLE `shopping_cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopping_cart_id` bigint(20) NOT NULL COMMENT '购物车ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `purchase_quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shopping_cart_id_goods_sku_id` (`shopping_cart_id`,`goods_sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='购物车的商品条目';

/*Table structure for table `wms_goods_allocation` */

DROP TABLE IF EXISTS `wms_goods_allocation`;

CREATE TABLE `wms_goods_allocation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(1024) NOT NULL COMMENT '货位编号',
  `remark` varchar(1024) DEFAULT NULL COMMENT '说明备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='WMS中心的货位表';

/*Table structure for table `wms_goods_allocation_stock` */

DROP TABLE IF EXISTS `wms_goods_allocation_stock`;

CREATE TABLE `wms_goods_allocation_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_allocation_id` bigint(20) NOT NULL COMMENT '货位ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `available_stock_quantity` bigint(20) NOT NULL COMMENT '可用库存数量',
  `locked_stock_quantity` bigint(20) NOT NULL COMMENT '锁定库存数量',
  `output_stock_quantity` bigint(20) NOT NULL COMMENT '已出库库存数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库中的货位库存';

/*Table structure for table `wms_goods_allocation_stock_detail` */

DROP TABLE IF EXISTS `wms_goods_allocation_stock_detail`;

CREATE TABLE `wms_goods_allocation_stock_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku id',
  `goods_allocation_id` bigint(20) NOT NULL COMMENT '货位id',
  `put_on_time` datetime NOT NULL COMMENT '上架时间',
  `put_on_quantity` bigint(20) NOT NULL COMMENT '上架多少件商品',
  `current_stock_quantity` bigint(20) NOT NULL COMMENT '当前这一批上架的商品还有多少件库存',
  `locked_stock_quantity` bigint(20) NOT NULL COMMENT '当前这一批商品被锁定的库存',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `wms_goods_stock` */

DROP TABLE IF EXISTS `wms_goods_stock`;

CREATE TABLE `wms_goods_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `available_stock_quantity` bigint(20) NOT NULL COMMENT '可用库存数量',
  `locked_stock_quantity` bigint(20) NOT NULL COMMENT '锁定库存数量',
  `output_stock_quantity` bigint(20) NOT NULL COMMENT '已出库库存数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_goods_sku_id` (`goods_sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度中心的商品库存';

/*Table structure for table `wms_logistic_order` */

DROP TABLE IF EXISTS `wms_logistic_order`;

CREATE TABLE `wms_logistic_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sale_delivery_order_id` bigint(20) NOT NULL COMMENT '销售出库单id',
  `logistic_code` varchar(1024) NOT NULL COMMENT '物流单号',
  `content` varchar(1024) NOT NULL COMMENT '物流单内容',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sale_delivery_order_id` (`sale_delivery_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `wms_purchase_input_order` */

DROP TABLE IF EXISTS `wms_purchase_input_order`;

CREATE TABLE `wms_purchase_input_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `purchase_order_id` bigint(20) NOT NULL COMMENT '采购单id',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商ID',
  `expect_arrival_time` datetime NOT NULL COMMENT '预计到货时间',
  `actual_arrival_time` datetime DEFAULT NULL COMMENT '实际到货时间',
  `purchase_contactor` varchar(1024) NOT NULL COMMENT '采购联系人',
  `purchase_contactor_phone_number` varchar(1024) NOT NULL COMMENT '采购联系电话',
  `purchase_contactor_email` varchar(1024) NOT NULL COMMENT '采购联系邮箱',
  `purchase_order_remark` varchar(1024) NOT NULL COMMENT '采购单的说明备注',
  `purchaser` varchar(1024) NOT NULL COMMENT '采购员',
  `status` tinyint(4) NOT NULL COMMENT '采购入库单状态，1：编辑中，2：待审核，3：已入库，4：待结算，5：已完成',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='wms中心的采购入库单';

/*Table structure for table `wms_purchase_input_order_item` */

DROP TABLE IF EXISTS `wms_purchase_input_order_item`;

CREATE TABLE `wms_purchase_input_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `purchase_input_order_id` bigint(20) NOT NULL COMMENT '采购入库单ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品SKU ID',
  `purchase_count` bigint(20) NOT NULL COMMENT '采购数量',
  `purchase_price` bigint(20) NOT NULL COMMENT '采购价格',
  `qualified_count` bigint(20) DEFAULT NULL COMMENT '合格商品的数量',
  `arrival_count` bigint(20) DEFAULT NULL COMMENT '到货的商品数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='wms中心的采购入库单条目表';

/*Table structure for table `wms_purchase_input_order_put_on_item` */

DROP TABLE IF EXISTS `wms_purchase_input_order_put_on_item`;

CREATE TABLE `wms_purchase_input_order_put_on_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `purchase_input_order_item_id` bigint(20) NOT NULL COMMENT '采购入库单条目ID',
  `goods_allocation_id` bigint(20) NOT NULL COMMENT '货位ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku id',
  `put_on_shelves_count` bigint(20) NOT NULL COMMENT '上架数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='采购入库单条目关联的上架条目';

/*Table structure for table `wms_return_goods_input_order` */

DROP TABLE IF EXISTS `wms_return_goods_input_order`;

CREATE TABLE `wms_return_goods_input_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `return_goods_worksheet_id` bigint(20) NOT NULL COMMENT '退货工单id',
  `user_account_id` char(10) NOT NULL COMMENT '用户账号ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_no` varchar(1024) NOT NULL COMMENT '订单编号，随机生成的UUID',
  `status` tinyint(4) NOT NULL COMMENT '退货入库单状态，1：编辑中，2：待审核：3：已完成',
  `consignee` varchar(1024) NOT NULL COMMENT '收货人',
  `delivery_address` varchar(1024) NOT NULL COMMENT '收货地址',
  `consignee_cell_phone_number` varchar(1024) NOT NULL COMMENT '收货人电话号码',
  `freight` decimal(8,2) NOT NULL COMMENT '运费',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式，1：支付宝，2：微信',
  `total_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `discount_amount` decimal(8,2) NOT NULL COMMENT '促销活动折扣金额',
  `coupon_amount` decimal(8,2) NOT NULL COMMENT '优惠券抵扣金额',
  `payable_amount` decimal(8,2) NOT NULL COMMENT '应付金额，订单总金额 - 促销活动折扣金额 - 优惠券抵扣金额 + 运费',
  `invoice_title` varchar(1024) NOT NULL COMMENT '发票抬头',
  `taxpayer_id` varchar(1024) NOT NULL COMMENT '纳税人识别号',
  `order_comment` varchar(1024) NOT NULL COMMENT '订单备注',
  `return_goods_reason` tinyint(4) NOT NULL COMMENT '退货原因，1：质量不好，2：商品不满意，3：买错了，4：无理由退货',
  `return_goods_remark` varchar(1024) NOT NULL COMMENT '退货备注',
  `arrival_time` datetime DEFAULT NULL COMMENT '到货时间',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='wms中心的退货入库单';

/*Table structure for table `wms_return_goods_input_order_item` */

DROP TABLE IF EXISTS `wms_return_goods_input_order_item`;

CREATE TABLE `wms_return_goods_input_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `return_goods_input_order_id` bigint(20) NOT NULL COMMENT '退货入库单ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `goods_sku_code` varchar(1024) NOT NULL COMMENT '商品sku编号',
  `goods_name` varchar(1024) NOT NULL COMMENT '商品名称',
  `sale_properties` varchar(1024) NOT NULL COMMENT '销售属性，机身颜色:白色,内存容量:256G',
  `goods_gross_weight` decimal(8,2) NOT NULL COMMENT '商品毛重',
  `purchase_quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `purchase_price` decimal(8,2) NOT NULL COMMENT '商品购买价格',
  `promotion_activity_id` bigint(20) DEFAULT NULL COMMENT '促销活动ID',
  `goods_length` decimal(8,2) NOT NULL COMMENT '商品长度',
  `goods_width` decimal(8,2) NOT NULL COMMENT '商品宽度',
  `goods_height` decimal(8,2) NOT NULL COMMENT '商品高度',
  `qualified_count` bigint(20) DEFAULT NULL COMMENT '合格商品数量',
  `arrival_count` bigint(20) DEFAULT NULL COMMENT '商品到货数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='退货入库单条目';

/*Table structure for table `wms_return_goods_input_order_put_on_item` */

DROP TABLE IF EXISTS `wms_return_goods_input_order_put_on_item`;

CREATE TABLE `wms_return_goods_input_order_put_on_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `return_goods_input_order_item_id` bigint(20) NOT NULL COMMENT '退货入库单条目ID',
  `goods_allocation_id` bigint(20) NOT NULL COMMENT '货位ID',
  `goods_sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku id',
  `put_on_shelves_count` bigint(20) NOT NULL COMMENT '上架数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='退货入库单条目关联的上架条目';

/*Table structure for table `wms_sale_delivery_order` */

DROP TABLE IF EXISTS `wms_sale_delivery_order`;

CREATE TABLE `wms_sale_delivery_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_no` varchar(1024) NOT NULL COMMENT '订单编号，随机生成的UUID',
  `user_account_id` char(10) DEFAULT NULL COMMENT '用户账号ID',
  `consignee` varchar(1024) NOT NULL COMMENT '收货人',
  `delivery_address` varchar(1024) NOT NULL COMMENT '收货地址',
  `consignee_cell_phone_number` varchar(1024) NOT NULL COMMENT '收货人电话号码',
  `freight` decimal(8,2) NOT NULL COMMENT '运费',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式，1：支付宝，2：微信',
  `total_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `discount_amount` decimal(8,2) NOT NULL COMMENT '促销活动折扣金额',
  `coupon_amount` decimal(8,2) NOT NULL COMMENT '优惠券抵扣金额',
  `payable_amount` decimal(8,2) NOT NULL COMMENT '应付金额，订单总金额 - 促销活动折扣金额 - 优惠券抵扣金额 + 运费',
  `invoice_title` varchar(1024) NOT NULL COMMENT '发票抬头',
  `taxpayer_id` varchar(1024) NOT NULL COMMENT '纳税人识别号',
  `order_comment` varchar(1024) NOT NULL COMMENT '订单备注',
  `status` tinyint(4) NOT NULL COMMENT '销售出库单的状态，1：编辑中，2：待审核，3：已完成',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='wms中心的销售出库单';

/*Table structure for table `wms_sale_delivery_order_item` */

DROP TABLE IF EXISTS `wms_sale_delivery_order_item`;

CREATE TABLE `wms_sale_delivery_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sale_delivery_order_id` bigint(20) NOT NULL COMMENT '销售出库单ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `goods_sku_code` varchar(1024) NOT NULL COMMENT '商品sku编号',
  `goods_name` varchar(1024) NOT NULL COMMENT '商品名称',
  `sale_properties` varchar(1024) NOT NULL COMMENT '销售属性，机身颜色:白色,内存容量:256G',
  `goods_gross_weight` decimal(8,2) NOT NULL COMMENT '商品毛重',
  `purchase_quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `purchase_price` decimal(8,2) NOT NULL COMMENT '商品购买价格',
  `promotion_activity_id` bigint(20) DEFAULT NULL COMMENT '促销活动ID',
  `goods_length` decimal(8,2) NOT NULL COMMENT '商品长度',
  `goods_width` decimal(8,2) NOT NULL COMMENT '商品宽度',
  `goods_height` decimal(8,2) NOT NULL COMMENT '商品高度',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sale_delivery_order_id` (`sale_delivery_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='wms中心的销售出库单条目';

/*Table structure for table `wms_sale_delivery_order_picking_item` */

DROP TABLE IF EXISTS `wms_sale_delivery_order_picking_item`;

CREATE TABLE `wms_sale_delivery_order_picking_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sale_delivery_order_item_id` bigint(20) NOT NULL COMMENT '销售出库单条目ID',
  `goods_allocation_id` bigint(20) NOT NULL COMMENT '货位ID',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku id',
  `picking_count` bigint(20) NOT NULL COMMENT '发多少件商品',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sale_delivery_order_item_id` (`sale_delivery_order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='销售出库单的拣货条目';

/*Table structure for table `wms_sale_delivery_order_send_out_detail` */

DROP TABLE IF EXISTS `wms_sale_delivery_order_send_out_detail`;

CREATE TABLE `wms_sale_delivery_order_send_out_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sale_delivery_order_item_id` bigint(20) NOT NULL COMMENT '销售出库单条目id',
  `goods_allocation_stock_detail_id` bigint(20) NOT NULL COMMENT '货位库存明细id',
  `send_out_count` bigint(20) NOT NULL COMMENT '发货数量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_sale_delivery_order_item_id` (`sale_delivery_order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Table structure for table `wms_send_out_order` */

DROP TABLE IF EXISTS `wms_send_out_order`;

CREATE TABLE `wms_send_out_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sale_delivery_order_id` bigint(20) NOT NULL COMMENT '销售出库单id',
  `user_account_id` bigint(20) NOT NULL COMMENT '用户账号ID',
  `username` varchar(1024) NOT NULL COMMENT '用户名',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `order_no` varchar(1024) NOT NULL COMMENT '订单编号，随机生成的UUID',
  `consignee` varchar(1024) NOT NULL COMMENT '收货人',
  `delivery_address` varchar(1024) NOT NULL COMMENT '收货地址',
  `consignee_cell_phone_number` varchar(1024) NOT NULL COMMENT '收货人电话号码',
  `freight` decimal(8,2) NOT NULL COMMENT '运费',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式，1：支付宝，2：微信',
  `total_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `discount_amount` decimal(8,2) NOT NULL COMMENT '促销活动折扣金额',
  `coupon_amount` decimal(8,2) NOT NULL COMMENT '优惠券抵扣金额',
  `payable_amount` decimal(8,2) NOT NULL COMMENT '应付金额，订单总金额 - 促销活动折扣金额 - 优惠券抵扣金额 + 运费',
  `invoice_title` varchar(1024) NOT NULL COMMENT '发票抬头',
  `taxpayer_id` varchar(1024) NOT NULL COMMENT '纳税人识别号',
  `order_comment` varchar(1024) NOT NULL COMMENT '订单备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sale_delivery_order_id` (`sale_delivery_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单信息表';

/*Table structure for table `wms_send_out_order_item` */

DROP TABLE IF EXISTS `wms_send_out_order_item`;

CREATE TABLE `wms_send_out_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `send_out_order_id` bigint(20) NOT NULL COMMENT '发货单id',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `goods_sku_code` varchar(1024) NOT NULL COMMENT '商品sku编号',
  `goods_name` varchar(1024) NOT NULL COMMENT '商品名称',
  `sale_properties` varchar(1024) NOT NULL COMMENT '销售属性，机身颜色:白色,内存容量:256G',
  `goods_gross_weight` decimal(8,2) NOT NULL COMMENT '商品毛重',
  `purchase_quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `purchase_price` decimal(8,2) NOT NULL COMMENT '商品购买价格',
  `goods_length` decimal(8,2) NOT NULL COMMENT '商品长度',
  `goods_width` decimal(8,2) NOT NULL COMMENT '商品宽度',
  `goods_height` decimal(8,2) NOT NULL COMMENT '商品高度',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_send_out_order_id` (`send_out_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='订单商品条目';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
