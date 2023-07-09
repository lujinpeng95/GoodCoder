/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:00:39                           */
/*==============================================================*/


drop table if exists shopping_cart;

drop table if exists shopping_cart_item;

/*==============================================================*/
/* Table: shopping_cart                                         */
/*==============================================================*/
create table shopping_cart
(
   id                   bigint not null auto_increment comment '����',
   user_account_id      bigint not null comment '��Ա�˺�ID',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table shopping_cart comment '���ﳵ';

/*==============================================================*/
/* Table: shopping_cart_item                                    */
/*==============================================================*/
create table shopping_cart_item
(
   id                   bigint not null auto_increment comment '����',
   shopping_cart_id     bigint not null comment '���ﳵID',
   goods_sku_id         bigint not null comment '��Ʒsku ID',
   purchase_quantity    bigint not null comment '��������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table shopping_cart_item comment '���ﳵ����Ʒ��Ŀ';
