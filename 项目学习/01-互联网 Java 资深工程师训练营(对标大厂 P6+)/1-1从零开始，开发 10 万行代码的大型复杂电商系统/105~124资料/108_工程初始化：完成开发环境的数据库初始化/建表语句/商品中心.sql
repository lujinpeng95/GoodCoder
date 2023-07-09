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
   id                   bigint not null auto_increment comment '����',
   brand_chinese_name   varchar(1024) not null comment 'Ʒ��������',
   brand_english_name   varchar(1024) not null comment 'Ʒ��Ӣ����',
   brand_alias_name     varchar(1024) not null comment 'Ʒ�Ʊ���',
   logo                 longblob not null comment 'logoͼƬ',
   brand_intro          varchar(1024) not null comment 'Ʒ�ƽ���',
   brand_authorization_voucher longblob not null comment 'Ʒ����Ȩƾ֤',
   location             varchar(1024) not null comment 'Ʒ�����ڵ�',
   brand_comment        varchar(1024) comment 'Ʒ��˵����ע',
   is_enabled           tinyint not null comment '�Ƿ����ã�1�����ã�0��δ����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_brand comment '��Ʒ���ĵ�Ʒ�Ʊ�';

/*==============================================================*/
/* Table: commodity_category                                    */
/*==============================================================*/
create table commodity_category
(
   id                   bigint not null auto_increment comment '����',
   category_name        varchar(1024) not null comment '��Ŀ����',
   category_desc        varchar(1024) comment '��Ŀ����',
   is_leaf              tinyint not null default 0 comment '�Ƿ�ΪҶ����Ŀ��1����Ҷ����Ŀ��0������Ҷ����Ŀ',
   parent_id            bigint not null comment '����Ŀ������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_category comment '��Ʒ���ĵ���Ŀ��';

/*==============================================================*/
/* Table: commodity_category_property_relationship              */
/*==============================================================*/
create table commodity_category_property_relationship
(
   id                   bigint not null auto_increment comment '����',
   category_id          bigint not null comment '��ĿID',
   property_id          bigint not null comment '����ID',
   is_required          tinyint not null comment '�����Ƿ���1���Ǳ��0���Ǳ���',
   property_type        tinyint not null comment '�������ͣ�1���ؼ����ԣ�2���������ԣ�3���ǹؼ����ԣ�4���������ԣ���������ж��ֵƴ����һ�𣬱���1,2��2,4',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_category_property_relationship comment '��Ʒ���ĵ���Ŀ�����ԵĹ�����ϵ��';

/*==============================================================*/
/* Table: commodity_goods                                       */
/*==============================================================*/
create table commodity_goods
(
   id                   bigint not null auto_increment comment '����',
   category_id          bigint not null comment '��ĿID',
   brand_id             bigint not null comment 'Ʒ��ID',
   spu_code             varchar(1024) not null comment 'SPU���',
   goods_name           varchar(1024) not null comment '��Ʒ����',
   goods_sub_name       varchar(1024) not null comment '��Ʒ������',
   gross_weight         decimal(8,2) not null comment '��Ʒë�أ���λ��g',
   goods_length         decimal(8,2) not null comment '���װ���ȣ���λ��cm',
   goods_width          decimal(8,2) not null comment '���װ����λ��cm',
   goods_height         decimal(8,2) not null comment '���װ�ߣ���λ��cm',
   goods_status         tinyint not null comment '��Ʒ״̬��1������ˣ�2�����ϼܣ�3�����δͨ����4�����ϼ�',
   service_guarantees   varchar(1024) not null comment '����֤',
   package_list         varchar(1024) not null comment '��װ�嵥',
   freight_template_id  bigint not null comment '�˷�ģ��ID',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_goods comment '��Ʒ���ĵ���Ʒ��Ϣ������';

/*==============================================================*/
/* Table: commodity_goods_desc                                  */
/*==============================================================*/
create table commodity_goods_desc
(
   id                   bigint not null auto_increment comment '����',
   goods_id             bigint not null comment '��ƷID',
   goods_desc           longtext not null comment '��Ʒ��������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_goods_desc comment '��Ʒ��������';

/*==============================================================*/
/* Table: commodity_goods_desc_picture                          */
/*==============================================================*/
create table commodity_goods_desc_picture
(
   id                   bigint not null auto_increment comment '����',
   goods_desc_id        bigint not null comment '��Ʒ��������ID',
   goods_desc_picture   longblob not null comment '��Ʒ���������е�һ��ͼƬ',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_goods_desc_picture comment '��Ʒ���������е�ͼƬ';

/*==============================================================*/
/* Table: commodity_goods_picture                               */
/*==============================================================*/
create table commodity_goods_picture
(
   id                   bigint not null auto_increment comment '����',
   goods_id             bigint not null comment '��ƷID',
   sequence             tinyint not null comment 'ͼƬ������',
   goods_picture        longblob not null comment 'ͼƬ����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_goods_picture comment '��Ʒ���ӵ�ͼƬ��';

/*==============================================================*/
/* Table: commodity_goods_proprety_group_value                  */
/*==============================================================*/
create table commodity_goods_proprety_group_value
(
   id                   bigint not null auto_increment comment '����',
   goods_id             bigint not null comment '��ƷID',
   property_group_relationship_id bigint not null comment '���Է��������Թ�����ϵ��ID',
   property_value       varchar(1024) not null comment '����ǿ�ѡ�ģ���ôֱ���ܾ��ǣ���ɫ,��ɫ�����ֵ�������ģ����������ģ���ô����ֱ�������һ��ֵ',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_goods_proprety_group_value comment '��Ʒ�����Է����е����������ֵ';

/*==============================================================*/
/* Table: commodity_goods_proprety_value                        */
/*==============================================================*/
create table commodity_goods_proprety_value
(
   id                   bigint not null auto_increment comment '����',
   goods_id             bigint not null comment '��ƷID',
   category_property_relationship_id bigint not null comment 'Ʒ�������Թ�����ϵ��ID',
   property_value       varchar(1024) not null comment '����ǿ�ѡ�ģ���ôֱ���ܾ��ǣ���ɫ,��ɫ�����ֵ�������ģ����������ģ���ô����ֱ�������һ��ֵ',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_goods_proprety_value comment '��Ʒ����ֵ';

/*==============================================================*/
/* Table: commodity_goods_sku                                   */
/*==============================================================*/
create table commodity_goods_sku
(
   id                   bigint not null auto_increment comment '����',
   goods_id             bigint not null comment '��ƷID',
   goods_sku_code       varchar(1024) not null comment 'sku���',
   purchase_price       decimal(8,2) not null comment '�ɹ��۸�',
   sale_price           decimal(8,2) not null comment '���ۼ۸�',
   discount_price       decimal(8,2) not null comment '�����۸�',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_goods_sku comment '��Ʒsku��Ϣ';

/*==============================================================*/
/* Table: commodity_goods_sku_property_value                    */
/*==============================================================*/
create table commodity_goods_sku_property_value
(
   id                   bigint not null auto_increment comment '����',
   goods_sku_id         bigint not null comment 'sku ID',
   category_property_relationship_id bigint not null comment '��Ŀ�����Թ�����ϵ��ID',
   property_value       varchar(1024) not null comment 'sku��Ӧ��ĳ���������Ե�ʵ��ֵ',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_goods_sku_property_value comment 'sku��Ʒ��ÿ���������Ե�һ��ʵ��ֵ';

/*==============================================================*/
/* Table: commodity_property                                    */
/*==============================================================*/
create table commodity_property
(
   id                   bigint not null auto_increment comment '����',
   property_name        national varchar(255) not null comment '��������',
   property_desc        varchar(1024) comment '��������',
   input_type           tinyint not null comment '���뷽ʽ��1����ѡ��2������',
   input_values         varchar(1024) not null comment '��ѡֵ��Χ��������뷽ʽ�ǿ�ѡ����ô��Ҫ�ṩһЩ��ѡ���ֵ��Χ',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_property comment '��Ʒ���ĵ����Ա�';

/*==============================================================*/
/* Table: commodity_property_group                              */
/*==============================================================*/
create table commodity_property_group
(
   id                   bigint not null auto_increment comment '����',
   property_group_name  varchar(1024) not null comment '���Է�������',
   category_id          bigint not null comment '��������ĿID',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_property_group comment '��Ʒ���ĵ����Է����';

/*==============================================================*/
/* Table: commodity_property_group_relationship                 */
/*==============================================================*/
create table commodity_property_group_relationship
(
   id                   bigint not null auto_increment comment '����',
   property_group_id    bigint not null comment '���Է���ID',
   property_id          bigint not null comment '����ID',
   is_required          tinyint not null comment '�����Ƿ���1���Ǳ��0���Ǳ���',
   property_type        tinyint not null comment '�������ͣ�1���ؼ����ԣ�2���������ԣ�3���ǹؼ����ԣ�4���������ԣ���������ж��ֵƴ����һ�𣬱���1,2��2,4',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table commodity_property_group_relationship comment '��Ʒ���ĵ����Է�������ԵĹ�����ϵ��';
