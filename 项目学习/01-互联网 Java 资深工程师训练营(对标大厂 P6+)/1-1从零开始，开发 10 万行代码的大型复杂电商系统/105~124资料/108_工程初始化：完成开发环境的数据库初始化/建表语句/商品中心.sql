/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 9:50:10                            */
/*==============================================================*/


drop table if exists commodity_brand;

drop table if exists commodity_category;

drop table if exists commodity_category_property_relationship;

drop table if exists commodity_goods;

drop table if exists commodity_goods_desc;

drop table if exists commodity_goods_desc_picture;

drop table if exists commodity_goods_picture;

drop table if exists commodity_goods_proprety_group_value;

drop table if exists commodity_goods_proprety_value;

drop table if exists commodity_goods_sku;

drop table if exists commodity_goods_sku_property_value;

drop table if exists commodity_property;

drop table if exists commodity_property_group;

drop table if exists commodity_property_group_relationship;

/*==============================================================*/
/* Table: commodity_brand                                       */
/*==============================================================*/
create table commodity_brand
(
   id                   bigint not null auto_increment comment '主键',
   brand_chinese_name   varchar(1024) not null comment '品牌中文名',
   brand_english_name   varchar(1024) not null comment '品牌英文名',
   brand_alias_name     varchar(1024) not null comment '品牌别名',
   logo                 longblob not null comment 'logo图片',
   brand_intro          varchar(1024) not null comment '品牌介绍',
   brand_authorization_voucher longblob not null comment '品牌授权凭证',
   location             varchar(1024) not null comment '品牌所在地',
   brand_comment        varchar(1024) comment '品牌说明备注',
   is_enabled           tinyint not null comment '是否启用，1：启用，0：未启用',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_brand comment '商品中心的品牌表';

/*==============================================================*/
/* Table: commodity_category                                    */
/*==============================================================*/
create table commodity_category
(
   id                   bigint not null auto_increment comment '主键',
   category_name        varchar(1024) not null comment '类目名称',
   category_desc        varchar(1024) comment '类目描述',
   is_leaf              tinyint not null default 0 comment '是否为叶子类目，1：是叶子类目，0：不是叶子类目',
   parent_id            bigint not null comment '父类目的主键',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_category comment '商品中心的类目表';

/*==============================================================*/
/* Table: commodity_category_property_relationship              */
/*==============================================================*/
create table commodity_category_property_relationship
(
   id                   bigint not null auto_increment comment '主键',
   category_id          bigint not null comment '类目ID',
   property_id          bigint not null comment '属性ID',
   is_required          tinyint not null comment '属性是否必填，1：是必填，0：非必填',
   property_type        tinyint not null comment '属性类型，1：关键属性，2：销售属性，3：非关键属性，4：导购属性，这里可以有多个值拼接在一起，比如1,2，2,4',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_category_property_relationship comment '商品中心的类目和属性的关联关系表';

/*==============================================================*/
/* Table: commodity_goods                                       */
/*==============================================================*/
create table commodity_goods
(
   id                   bigint not null auto_increment comment '主键',
   category_id          bigint not null comment '类目ID',
   brand_id             bigint not null comment '品牌ID',
   spu_code             varchar(1024) not null comment 'SPU编号',
   goods_name           varchar(1024) not null comment '商品名称',
   goods_sub_name       varchar(1024) not null comment '商品副名称',
   gross_weight         decimal(8,2) not null comment '商品毛重，单位是g',
   goods_length         decimal(8,2) not null comment '外包装长度，单位是cm',
   goods_width          decimal(8,2) not null comment '外包装宽，单位是cm',
   goods_height         decimal(8,2) not null comment '外包装高，单位是cm',
   goods_status         tinyint not null comment '商品状态，1：待审核，2：待上架，3：审核未通过，4：已上架',
   service_guarantees   varchar(1024) not null comment '服务保证',
   package_list         varchar(1024) not null comment '包装清单',
   freight_template_id  bigint not null comment '运费模板ID',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_goods comment '商品中心的商品信息基础表';

/*==============================================================*/
/* Table: commodity_goods_desc                                  */
/*==============================================================*/
create table commodity_goods_desc
(
   id                   bigint not null auto_increment comment '主键',
   goods_id             bigint not null comment '商品ID',
   goods_desc           longtext not null comment '商品详情内容',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_goods_desc comment '商品详情数据';

/*==============================================================*/
/* Table: commodity_goods_desc_picture                          */
/*==============================================================*/
create table commodity_goods_desc_picture
(
   id                   bigint not null auto_increment comment '主键',
   goods_desc_id        bigint not null comment '商品详情内容ID',
   goods_desc_picture   longblob not null comment '商品详情内容中的一张图片',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_goods_desc_picture comment '商品详情内容中的图片';

/*==============================================================*/
/* Table: commodity_goods_picture                               */
/*==============================================================*/
create table commodity_goods_picture
(
   id                   bigint not null auto_increment comment '主键',
   goods_id             bigint not null comment '商品ID',
   sequence             tinyint not null comment '图片的排序',
   goods_picture        longblob not null comment '图片内容',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_goods_picture comment '商品附加的图片表';

/*==============================================================*/
/* Table: commodity_goods_proprety_group_value                  */
/*==============================================================*/
create table commodity_goods_proprety_group_value
(
   id                   bigint not null auto_increment comment '主键',
   goods_id             bigint not null comment '商品ID',
   property_group_relationship_id bigint not null comment '属性分组与属性关联关系的ID',
   property_value       varchar(1024) not null comment '如果是可选的，那么直可能就是：黑色,白色，多个值串起来的；如果是输入的，那么就是直接输入的一个值',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_goods_proprety_group_value comment '商品对属性分组中的属性输入的值';

/*==============================================================*/
/* Table: commodity_goods_proprety_value                        */
/*==============================================================*/
create table commodity_goods_proprety_value
(
   id                   bigint not null auto_increment comment '主键',
   goods_id             bigint not null comment '商品ID',
   category_property_relationship_id bigint not null comment '品类与属性关联关系的ID',
   property_value       varchar(1024) not null comment '如果是可选的，那么直可能就是：黑色,白色，多个值串起来的；如果是输入的，那么就是直接输入的一个值',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_goods_proprety_value comment '商品属性值';

/*==============================================================*/
/* Table: commodity_goods_sku                                   */
/*==============================================================*/
create table commodity_goods_sku
(
   id                   bigint not null auto_increment comment '主键',
   goods_id             bigint not null comment '商品ID',
   goods_sku_code       varchar(1024) not null comment 'sku编号',
   purchase_price       decimal(8,2) not null comment '采购价格',
   sale_price           decimal(8,2) not null comment '销售价格',
   discount_price       decimal(8,2) not null comment '促销价格',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_goods_sku comment '商品sku信息';

/*==============================================================*/
/* Table: commodity_goods_sku_property_value                    */
/*==============================================================*/
create table commodity_goods_sku_property_value
(
   id                   bigint not null auto_increment comment '主键',
   goods_sku_id         bigint not null comment 'sku ID',
   category_property_relationship_id bigint not null comment '类目与属性关联关系的ID',
   property_value       varchar(1024) not null comment 'sku对应的某个销售属性的实际值',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_goods_sku_property_value comment 'sku商品对每个销售属性的一个实际值';

/*==============================================================*/
/* Table: commodity_property                                    */
/*==============================================================*/
create table commodity_property
(
   id                   bigint not null auto_increment comment '主键',
   property_name        national varchar(255) not null comment '属性名称',
   property_desc        varchar(1024) comment '属性描述',
   input_type           tinyint not null comment '输入方式，1：多选，2：输入',
   input_values         varchar(1024) not null comment '可选值范围，如果输入方式是可选，那么需要提供一些供选择的值范围',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_property comment '商品中心的属性表';

/*==============================================================*/
/* Table: commodity_property_group                              */
/*==============================================================*/
create table commodity_property_group
(
   id                   bigint not null auto_increment comment '主键',
   property_group_name  varchar(1024) not null comment '属性分组名称',
   category_id          bigint not null comment '所属的类目ID',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_property_group comment '商品中心的属性分组表';

/*==============================================================*/
/* Table: commodity_property_group_relationship                 */
/*==============================================================*/
create table commodity_property_group_relationship
(
   id                   bigint not null auto_increment comment '主键',
   property_group_id    bigint not null comment '属性分组ID',
   property_id          bigint not null comment '属性ID',
   is_required          tinyint not null comment '属性是否必填，1：是必填，0：非必填',
   property_type        tinyint not null comment '属性类型，1：关键属性，2：销售属性，3：非关键属性，4：导购属性，这里可以有多个值拼接在一起，比如1,2，2,4',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table commodity_property_group_relationship comment '商品中心的属性分组和属性的关联关系表';
