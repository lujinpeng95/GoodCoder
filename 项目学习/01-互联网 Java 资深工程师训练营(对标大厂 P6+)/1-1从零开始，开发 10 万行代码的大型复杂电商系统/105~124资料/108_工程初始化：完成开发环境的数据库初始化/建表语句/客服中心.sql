/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:08:45                           */
/*==============================================================*/


drop table if exists customer_return_goods_worksheet;

/*==============================================================*/
/* Table: customer_return_goods_worksheet                       */
/*==============================================================*/
create table customer_return_goods_worksheet
(
   id                   bigint not null auto_increment comment '主键',
   order_id             bigint not null comment '订单ID',
   order_no             varchar(1024) not null comment '订单编号',
   return_goods_worksheet_status tinyint not null comment '退货工单状态，1：待审核，2：审核不通过，3：待寄送退货商品，4：退货商品待收货，5：退货待入库，6：退货已入库，7：完成退款',
   return_goods_reason  tinyint not null comment '退货原因，1：质量不好，2：商品不满意，3：买错了，4：无理由退货',
   return_goods_comment varchar(1024) not null comment '退货备注',
   return_goods_courier_number varchar(1024) not null comment '退货快递单号',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table customer_return_goods_worksheet comment '客服中心的退货工单';

