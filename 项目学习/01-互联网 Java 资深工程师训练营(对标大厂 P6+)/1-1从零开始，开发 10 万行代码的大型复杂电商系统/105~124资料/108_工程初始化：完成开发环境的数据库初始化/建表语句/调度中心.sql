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
   id                   bigint not null auto_increment comment '����',
   goods_allocation_id  bigint not null comment '��λID',
   goods_sku_id         bigint not null comment '��Ʒsku ID',
   available_stock_quantity bigint not null comment '���ÿ������',
   locked_stock_quantity bigint not null comment '�����������',
   deliveried_stock_quantity bigint not null comment '�ѳ���������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table schedule_goods_allocation_stock comment '�������ĵĻ�λ���';

/*==============================================================*/
/* Table: schedule_warehouse_goods_stock                        */
/*==============================================================*/
create table schedule_warehouse_goods_stock
(
   id                   bigint not null auto_increment comment '����',
   goods_sku_id         bigint not null comment '��Ʒsku ID',
   available_stock_quantity bigint not null comment '���ÿ������',
   locked_stock_quantity bigint not null comment '�����������',
   deliveried_stock_quantity bigint not null comment '�ѳ���������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table schedule_warehouse_goods_stock comment '�������ĵ���Ʒ���';

