/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:10:56                           */
/*==============================================================*/


drop table if exists inventory_goods_stock;

/*==============================================================*/
/* Table: inventory_goods_stock                                 */
/*==============================================================*/
create table inventory_goods_stock
(
   id                   bigint not null auto_increment comment '主键',
   goods_sku_id         bigint not null comment '商品sku ID',
   sale_stock_quantity  bigint not null comment '销售库存',
   locked_stock_quantity bigint not null comment '锁定库存',
   saled_stock_quantity bigint not null comment '已销售库存',
   stock_status         tinyint not null comment '库存状态，0：无库存，1：有库存',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table inventory_goods_stock comment '库存中心的商品库存表';

