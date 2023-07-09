/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:09:34                           */
/*==============================================================*/


drop table if exists finance_logistics_settlement_detail;

drop table if exists finance_purchase_settlement_order;

drop table if exists finance_purchase_settlement_order_item;

drop table if exists finance_return_goods_refund_detail;

drop table if exists finance_supplier_settlement_detail;

/*==============================================================*/
/* Table: finance_logistics_settlement_detail                   */
/*==============================================================*/
create table finance_logistics_settlement_detail
(
   id                   bigint not null auto_increment comment '主键',
   order_id             bigint not null comment '订单ID',
   order_no             varchar(1024) not null comment '订单编号',
   total_settlement_amount decimal(8,2) not null comment '结算金额',
   bank_account         varchar(1024) not null comment '银行账号',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table finance_logistics_settlement_detail comment '财务中心：跟物流公司的结算流水明细';

/*==============================================================*/
/* Table: finance_purchase_settlement_order                     */
/*==============================================================*/
create table finance_purchase_settlement_order
(
   id                   bigint not null auto_increment comment '主键',
   supplier_id          bigint not null comment '供应商ID',
   expect_arrival_time  datetime not null comment '预计到货时间',
   arrival_time         datetime not null comment '实际到货时间',
   purchase_contactor   varchar(1024) not null comment '采购联系人',
   purchase_contact_phone_number varchar(1024) not null comment '采购联系电话',
   purchase_contact_email varchar(1024) not null comment '采购联系邮箱',
   purchase_warehouse_entry_order_comment varchar(1024) not null comment '采购入库单的说明备注',
   purchaser            varchar(1024) not null comment '采购员',
   purchase_settlement_order_status tinyint not null comment '采购入库单状态，1：编辑中，2：待审核，3：已完成',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   total_settlement_amount decimal(8,2) not null comment '总结算金额，每个采购商品的价格 * 实际到货数量',
   primary key (id)
);

alter table finance_purchase_settlement_order comment '财务中心的采购结算单';

/*==============================================================*/
/* Table: finance_purchase_settlement_order_item                */
/*==============================================================*/
create table finance_purchase_settlement_order_item
(
   id                   bigint not null auto_increment comment '主键',
   purchase_settlement_order_id bigint not null comment '采购结算单ID',
   goods_sku_id         bigint not null comment '商品SKU ID',
   purchase_count       bigint not null comment '采购数量',
   purchase_price       bigint not null comment '采购价格',
   qualified_count      bigint not null comment '合格商品的数量',
   arrival_count        bigint not null comment '到货的商品数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table finance_purchase_settlement_order_item comment '财务中心的采购结算单';

/*==============================================================*/
/* Table: finance_return_goods_refund_detail                    */
/*==============================================================*/
create table finance_return_goods_refund_detail
(
   id                   bigint not null auto_increment comment '主键',
   order_id             bigint not null comment '订单ID',
   order_no             varchar(1024) not null comment '订单编号',
   return_goods_worksheet_id bigint not null comment '退货工单ID',
   return_goods_warehouse_entry_order_id bigint not null comment '退货入库单ID',
   user_account_id      bigint not null comment '用户账号ID',
   refundl_amount       decimal(8,2) not null comment '退款金额',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table finance_return_goods_refund_detail comment '财务中心：退货打款流水明细';

/*==============================================================*/
/* Table: finance_supplier_settlement_detail                    */
/*==============================================================*/
create table finance_supplier_settlement_detail
(
   id                   bigint not null auto_increment comment '主键',
   supplier_id          bigint not null comment '供应商ID',
   settlement_period    tinyint not null comment '结算周期，1：周，2：月，3：季度',
   purcahse_settlement_order_ids varchar(1024) not null comment '本次结算关联的采购结算单的ids',
   total_settlement_amount decimal(8,2) not null comment '本次结算总金额',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table finance_supplier_settlement_detail comment '财务中心的供应商结算明细表';

