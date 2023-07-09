/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:01:58                           */
/*==============================================================*/


drop table if exists pay_transaction;

/*==============================================================*/
/* Table: pay_transaction                                       */
/*==============================================================*/
create table pay_transaction
(
   id                   bigint not null auto_increment comment '主键',
   transaction_number   varchar(1024) not null comment '交易流水号，第三方支付平台生成',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   order_id             bigint not null comment '订单ID',
   total_order_amount   decimal(8,2) not null comment '订单总金额',
   discount_order_amount decimal(8,2) not null comment '订单优惠金额',
   payable_order_amount decimal(8,2) not null comment '订单应付金额',
   transaction_channel  tinyint not null comment '交易渠道，1：支付宝，2：微信',
   transaction_channel_account varchar(1024) not null comment '交易渠道账户',
   transaction_channel_pay_time datetime not null comment '第三方平台完成支付的时间',
   transaction_channel_order_no varchar(1024) not null comment '交易渠道返回的支付订单号',
   transaction_channel_status varchar(1024) not null comment '交易渠道返回的状态码',
   user_account_id      bigint not null comment '用户账号ID',
   user_pay_account     varchar(1024) not null comment '用户支付账号',
   transaction_status   varchar(1024) not null comment '支付状态',
   primary key (id)
);

alter table pay_transaction comment '支付交易流水';

