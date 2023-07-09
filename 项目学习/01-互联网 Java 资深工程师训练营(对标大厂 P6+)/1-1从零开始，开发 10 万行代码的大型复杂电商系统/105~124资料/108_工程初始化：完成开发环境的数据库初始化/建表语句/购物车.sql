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
   id                   bigint not null auto_increment comment '主键',
   user_account_id      bigint not null comment '会员账号ID',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table shopping_cart comment '购物车';

/*==============================================================*/
/* Table: shopping_cart_item                                    */
/*==============================================================*/
create table shopping_cart_item
(
   id                   bigint not null auto_increment comment '主键',
   shopping_cart_id     bigint not null comment '购物车ID',
   goods_sku_id         bigint not null comment '商品sku ID',
   purchase_quantity    bigint not null comment '购买数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table shopping_cart_item comment '购物车的商品条目';
