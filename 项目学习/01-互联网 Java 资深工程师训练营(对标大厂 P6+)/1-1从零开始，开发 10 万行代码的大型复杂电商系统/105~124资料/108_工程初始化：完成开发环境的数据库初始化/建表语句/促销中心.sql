/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:07:29                           */
/*==============================================================*/


drop table if exists promotion_activity;

drop table if exists promotion_activity_goods_sku_relationship;

drop table if exists promotion_coupon;

drop table if exists promotion_coupon_achieve;

/*==============================================================*/
/* Table: promotion_activity                                    */
/*==============================================================*/
create table promotion_activity
(
   id                   bigint not null auto_increment comment '����',
   promotion_activity_name varchar(1024) not null comment '���������',
   promotion_activity_start_time datetime not null comment '�������ʼʱ��',
   promotion_activity_end_time datetime not null comment '���������ʱ��',
   promotion_activity_comment varchar(1024) not null comment '�����˵����ע',
   promotion_activity_status tinyint not null comment '�������״̬��1�����ã�2��ͣ��',
   promotion_activity_rule varchar(1024) not null comment '������Ĺ���',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table promotion_activity comment '�������';

/*==============================================================*/
/* Table: promotion_activity_goods_sku_relationship             */
/*==============================================================*/
create table promotion_activity_goods_sku_relationship
(
   id                   bigint not null auto_increment comment '����',
   promotion_activity_id bigint not null comment '�����ID',
   goods_id             bigint not null comment '������ĳ����Ʒsku��ID�����������ֶε�ֵ����Ϊ-1����ô�������ȫ����Ʒ',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table promotion_activity_goods_sku_relationship comment '���������Ʒsku�Ĺ�����ϵ';

/*==============================================================*/
/* Table: promotion_coupon                                      */
/*==============================================================*/
create table promotion_coupon
(
   id                   bigint not null auto_increment comment '����',
   coupon_name          varchar(1024) not null comment '�Ż�ȯ����',
   coupon_type          tinyint not null comment '�Ż�ȯ���ͣ�1���ֽ�ȯ��2������ȯ',
   coupon_rule          varchar(1024) not null comment '�Ż�ȯ����',
   valid_start_time     datetime not null comment '��Ч�ڿ�ʼʱ��',
   valid_end_time       datetime not null comment '��Ч�ڽ���ʱ��',
   coupon_count         bigint not null comment '�Ż�ȯ��������',
   coupon_received_count bigint not null comment '�Ż�ȯ�Ѿ���ȡ������',
   coupon_receive_type  tinyint not null comment '�Ż�ȯ���ŷ�ʽ��1���ɷ��ſ���ȡ��2�����ɷ��ţ�3��������ȡ',
   coupon_status        tinyint not null comment '�Ż�ȯ״̬��1�������У�2���ѷ��꣬3������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table promotion_coupon comment '�Ż�ȯ��';

/*==============================================================*/
/* Table: promotion_coupon_achieve                              */
/*==============================================================*/
create table promotion_coupon_achieve
(
   id                   bigint not null auto_increment comment '����',
   coupon_id            bigint not null comment '�Ż�ȯID',
   user_account_id      bigint not null comment '�û��˺�ID',
   is_used              tinyint not null comment '�Ƿ�ʹ�ù�����Ż�ȯ��1��ʹ���ˣ�0��δʹ��',
   used_time            datetime,
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table promotion_coupon_achieve comment '�Ż�ȯ��ȡ��¼��';
