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
   id                   bigint not null auto_increment comment '����',
   order_id             bigint not null comment '����ID',
   order_no             varchar(1024) not null comment '�������',
   total_settlement_amount decimal(8,2) not null comment '������',
   bank_account         varchar(1024) not null comment '�����˺�',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table finance_logistics_settlement_detail comment '�������ģ���������˾�Ľ�����ˮ��ϸ';

/*==============================================================*/
/* Table: finance_purchase_settlement_order                     */
/*==============================================================*/
create table finance_purchase_settlement_order
(
   id                   bigint not null auto_increment comment '����',
   supplier_id          bigint not null comment '��Ӧ��ID',
   expect_arrival_time  datetime not null comment 'Ԥ�Ƶ���ʱ��',
   arrival_time         datetime not null comment 'ʵ�ʵ���ʱ��',
   purchase_contactor   varchar(1024) not null comment '�ɹ���ϵ��',
   purchase_contact_phone_number varchar(1024) not null comment '�ɹ���ϵ�绰',
   purchase_contact_email varchar(1024) not null comment '�ɹ���ϵ����',
   purchase_warehouse_entry_order_comment varchar(1024) not null comment '�ɹ���ⵥ��˵����ע',
   purchaser            varchar(1024) not null comment '�ɹ�Ա',
   purchase_settlement_order_status tinyint not null comment '�ɹ���ⵥ״̬��1���༭�У�2������ˣ�3�������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   total_settlement_amount decimal(8,2) not null comment '�ܽ����ÿ���ɹ���Ʒ�ļ۸� * ʵ�ʵ�������',
   primary key (id)
);

alter table finance_purchase_settlement_order comment '�������ĵĲɹ����㵥';

/*==============================================================*/
/* Table: finance_purchase_settlement_order_item                */
/*==============================================================*/
create table finance_purchase_settlement_order_item
(
   id                   bigint not null auto_increment comment '����',
   purchase_settlement_order_id bigint not null comment '�ɹ����㵥ID',
   goods_sku_id         bigint not null comment '��ƷSKU ID',
   purchase_count       bigint not null comment '�ɹ�����',
   purchase_price       bigint not null comment '�ɹ��۸�',
   qualified_count      bigint not null comment '�ϸ���Ʒ������',
   arrival_count        bigint not null comment '��������Ʒ����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table finance_purchase_settlement_order_item comment '�������ĵĲɹ����㵥';

/*==============================================================*/
/* Table: finance_return_goods_refund_detail                    */
/*==============================================================*/
create table finance_return_goods_refund_detail
(
   id                   bigint not null auto_increment comment '����',
   order_id             bigint not null comment '����ID',
   order_no             varchar(1024) not null comment '�������',
   return_goods_worksheet_id bigint not null comment '�˻�����ID',
   return_goods_warehouse_entry_order_id bigint not null comment '�˻���ⵥID',
   user_account_id      bigint not null comment '�û��˺�ID',
   refundl_amount       decimal(8,2) not null comment '�˿���',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table finance_return_goods_refund_detail comment '�������ģ��˻������ˮ��ϸ';

/*==============================================================*/
/* Table: finance_supplier_settlement_detail                    */
/*==============================================================*/
create table finance_supplier_settlement_detail
(
   id                   bigint not null auto_increment comment '����',
   supplier_id          bigint not null comment '��Ӧ��ID',
   settlement_period    tinyint not null comment '�������ڣ�1���ܣ�2���£�3������',
   purcahse_settlement_order_ids varchar(1024) not null comment '���ν�������Ĳɹ����㵥��ids',
   total_settlement_amount decimal(8,2) not null comment '���ν����ܽ��',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table finance_supplier_settlement_detail comment '�������ĵĹ�Ӧ�̽�����ϸ��';

