/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:11:57                           */
/*==============================================================*/


drop table if exists schedule_goods_allocation_stock;

drop table if exists schedule_warehouse_goods_stock;

/*==============================================================*/
/* Table: schedule_goods_allocation_stock                       */
/*==============================================================*/
create table schedule_goods_allocation_stock
(
   id                   bigint not null auto_increment comment '主键',
   goods_allocation_id  bigint not null comment '货位ID',
   goods_sku_id         bigint not null comment '商品sku ID',
   available_stock_quantity bigint not null comment '可用库存数量',
   locked_stock_quantity bigint not null comment '锁定库存数量',
   deliveried_stock_quantity bigint not null comment '已出库库存数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table schedule_goods_allocation_stock comment '调度中心的货位库存';

/*==============================================================*/
/* Table: schedule_warehouse_goods_stock                        */
/*==============================================================*/
create table schedule_warehouse_goods_stock
(
   id                   bigint not null auto_increment comment '主键',
   goods_sku_id         bigint not null comment '商品sku ID',
   available_stock_quantity bigint not null comment '可用库存数量',
   locked_stock_quantity bigint not null comment '锁定库存数量',
   deliveried_stock_quantity bigint not null comment '已出库库存数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table schedule_warehouse_goods_stock comment '调度中心的商品库存';

