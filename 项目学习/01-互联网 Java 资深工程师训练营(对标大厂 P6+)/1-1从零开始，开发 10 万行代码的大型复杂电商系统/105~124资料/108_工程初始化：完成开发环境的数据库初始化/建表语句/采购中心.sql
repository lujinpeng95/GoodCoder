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
   id                   bigint not null auto_increment comment '����',
   supplier_id          bigint not null comment '��Ӧ��ID',
   expect_arrival_time  datetime not null comment 'Ԥ�Ƶ���ʱ��',
   contactor            varchar(1024) not null comment '��ϵ��',
   contact_phone_number varchar(1024) not null comment '��ϵ�绰',
   contact_email        varchar(1024) not null comment '��ϵ����',
   purchase_order_comment varchar(1024) not null comment '˵����ע',
   purchaser            varchar(1024) not null comment '�ɹ�Ա',
   purchase_order_status tinyint not null comment '�ɹ���״̬��1���༭�У�2������ˣ�3������ˣ�4������⣬5�������㣬6�������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table purchase_order comment '�ɹ����ĵĲɹ���';

/*==============================================================*/
/* Table: purchase_order_item                                   */
/*==============================================================*/
create table purchase_order_item
(
   id                   bigint not null auto_increment comment '����',
   purchase_order_id    bigint not null comment '�ɹ���ID',
   goods_sku_id         bigint not null comment '��ƷSKU ID',
   purchase_count       bigint not null comment '�ɹ�����',
   purchase_price       bigint not null comment '�ɹ��۸�',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table purchase_order_item comment '�ɹ����е���Ʒ��Ŀ';

/*==============================================================*/
/* Table: purchase_supplier                                     */
/*==============================================================*/
create table purchase_supplier
(
   id                   bigint not null auto_increment comment '����',
   supplier_name        varchar(1024) not null comment '��Ӧ������',
   company_name         varchar(1024) not null comment '��˾����',
   company_address      varchar(1024) not null comment '��˾��ַ',
   contactor            varchar(1024) not null comment '��ϵ��',
   contact_phone_number varchar(1024) not null comment '��ϵ�绰',
   account_period       tinyint not null comment '���ڣ�1���ܽ��㣬2���½��㣬3�����Ƚ���',
   bank_name            varchar(1024) not null comment '��������',
   bank_account         varchar(1024) not null comment '�����˻�',
   account_holder       varchar(1024) not null comment '������',
   invoice_title        varchar(1024) not null comment '��Ʊ̧ͷ',
   taxpayer_id          varchar(1024) not null comment '��˰��ʶ���',
   business_scope       varchar(1024) not null comment '��Ӫ��Χ',
   supplier_comment     varchar(1024) comment '˵����ע',
   enterprise_qualification varchar(1024) not null comment '��ҵ����',
   cooperate_contract   longblob not null comment '������ͬ',
   price_contract       longblob not null comment 'Э��ۺ�ͬ',
   purchase_contract    longblob not null comment '�ɹ���ͬ',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table purchase_supplier comment '�ɹ����ĵĹ�Ӧ�̱�';
