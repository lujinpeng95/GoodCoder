/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 9:54:09                            */
/*==============================================================*/


drop table if exists purchase_order;

drop table if exists purchase_order_item;

drop table if exists purchase_supplier;

/*==============================================================*/
/* Table: purchase_order                                        */
/*==============================================================*/
create table purchase_order
(
   id                   bigint not null auto_increment comment '主键',
   supplier_id          bigint not null comment '供应商ID',
   expect_arrival_time  datetime not null comment '预计到货时间',
   contactor            varchar(1024) not null comment '联系人',
   contact_phone_number varchar(1024) not null comment '联系电话',
   contact_email        varchar(1024) not null comment '联系邮箱',
   purchase_order_comment varchar(1024) not null comment '说明备注',
   purchaser            varchar(1024) not null comment '采购员',
   purchase_order_status tinyint not null comment '采购单状态，1：编辑中，2：待审核，3：已审核，4：待入库，5：待结算，6：已完成',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table purchase_order comment '采购中心的采购单';

/*==============================================================*/
/* Table: purchase_order_item                                   */
/*==============================================================*/
create table purchase_order_item
(
   id                   bigint not null auto_increment comment '主键',
   purchase_order_id    bigint not null comment '采购单ID',
   goods_sku_id         bigint not null comment '商品SKU ID',
   purchase_count       bigint not null comment '采购数量',
   purchase_price       bigint not null comment '采购价格',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table purchase_order_item comment '采购单中的商品条目';

/*==============================================================*/
/* Table: purchase_supplier                                     */
/*==============================================================*/
create table purchase_supplier
(
   id                   bigint not null auto_increment comment '主键',
   supplier_name        varchar(1024) not null comment '供应商名称',
   company_name         varchar(1024) not null comment '公司名称',
   company_address      varchar(1024) not null comment '公司地址',
   contactor            varchar(1024) not null comment '联系人',
   contact_phone_number varchar(1024) not null comment '联系电话',
   account_period       tinyint not null comment '账期，1：周结算，2：月结算，3：季度结算',
   bank_name            varchar(1024) not null comment '银行名称',
   bank_account         varchar(1024) not null comment '银行账户',
   account_holder       varchar(1024) not null comment '开户人',
   invoice_title        varchar(1024) not null comment '发票抬头',
   taxpayer_id          varchar(1024) not null comment '纳税人识别号',
   business_scope       varchar(1024) not null comment '经营范围',
   supplier_comment     varchar(1024) comment '说明备注',
   enterprise_qualification varchar(1024) not null comment '企业资质',
   cooperate_contract   longblob not null comment '合作合同',
   price_contract       longblob not null comment '协议价合同',
   purchase_contract    longblob not null comment '采购合同',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table purchase_supplier comment '采购中心的供应商表';
