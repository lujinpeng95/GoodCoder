/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:03:50                           */
/*==============================================================*/


drop table if exists order_item;

drop table if exists order_operation;

drop table if exists order_return_goods;

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table IF NOT EXISTS `order`
(
   id                   bigint not null auto_increment comment '����',
   user_account_id      bigint comment '�û��˺�ID',
   order_no             varchar(1024) not null comment '������ţ�������ɵ�UUID',
   order_status         tinyint not null comment '����״̬��1�������2����ȡ����3����������4�����ջ���5������ɣ�6���ۺ��У��˻��������ˣ���7�����׹رգ��˻���˲�ͨ������8�������У��������˻���Ʒ����9���ۺ��У��˻���Ʒ���ջ�����10���ۺ��У��˻�����⣩��11����1���ۺ��У��˻�����⣩��12�����׹رգ�����˿',
   consignee            varchar(1024) not null comment '�ջ���',
   delivery_address     varchar(1024) not null comment '�ջ���ַ',
   consignee_cell_phone_number varchar(1024) not null comment '�ջ��˵绰����',
   freight              decimal(8,2) not null comment '�˷�',
   pay_type             tinyint not null comment '֧����ʽ��1��֧������2��΢��',
   total_amount         decimal(8,2) not null comment '�����ܽ��',
   discount_amount      decimal(8,2) not null comment '������ۿ۽��',
   coupon_amount        decimal(8,2) not null comment '�Ż�ȯ�ֿ۽��',
   payable_amount       decimal(8,2) not null comment 'Ӧ���������ܽ�� - ������ۿ۽�� - �Ż�ȯ�ֿ۽�� + �˷�',
   invoice_title        varchar(1024) not null comment '��Ʊ̧ͷ',
   taxpayer_id          varchar(1024) not null comment '��˰��ʶ���',
   order_comment        varchar(1024) not null comment '������ע',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table `order` comment '������';

/*==============================================================*/
/* Table: order_item                                            */
/*==============================================================*/
create table order_item
(
   id                   bigint not null auto_increment comment '����',
   order_id             bigint not null comment '����ID',
   goods_sku_id         bigint not null comment '��Ʒsku ID',
   goods_sku_code       varchar(1024) not null comment '��Ʒsku���',
   goods_name           varchar(1024) not null comment '��Ʒ����',
   sale_properties      varchar(1024) not null comment '�������ԣ�������ɫ:��ɫ,�ڴ�����:256G',
   goods_gross_weight   decimal(8,2) not null comment '��Ʒë��',
   purchase_quantity    bigint not null comment '��������',
   purchase_price       decimal(8,2) not null comment '��Ʒ����۸�',
   promotion_activity_id bigint comment '�����ID',
   goods_length         decimal(8,2) not null comment '��Ʒ����',
   goods_width          decimal(8,2) not null comment '��Ʒ���',
   goods_height         decimal(8,2) not null comment '��Ʒ�߶�',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table order_item comment '������Ʒ��Ŀ';

/*==============================================================*/
/* Table: order_operation                                       */
/*==============================================================*/
create table order_operation
(
   id                   bigint not null auto_increment comment '����',
   order_id             bigint not null comment '����ID',
   operation_type       tinyint not null comment '�������ͣ�1������������2���ֶ�ȡ��������3���Զ�ȡ��������4��֧��������5���ֶ�ȷ���ջ���6���Զ�ȷ���ջ���7����Ʒ������8�������˻���9���˻���˲�ͨ����10���˻����ͨ����11�������˻���Ʒ��12��ȷ���յ��˻���13���˻�����⣬14������˿�',
   operation_content    varchar(1024) not null comment '��������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table order_operation comment '����������¼��';

/*==============================================================*/
/* Table: order_return_goods                                    */
/*==============================================================*/
create table order_return_goods
(
   id                   bigint not null auto_increment comment '����',
   order_id             bigint not null comment '����ID',
   return_goods_reason  tinyint not null comment '�˻�ԭ��1���������ã�2����Ʒ�����⣬3������ˣ�4���������˻�',
   return_goods_comment varchar(1024) not null comment '�˻���ע',
   return_goods_status  tinyint not null comment '�˻���¼״̬��1������ˣ�2����˲�ͨ����3���������˻���Ʒ��4���˻���Ʒ���ջ���5���˻�����⣬6���˻�����⣬7������˿�',
   return_goods_consignee varchar(1024) not null comment '�˻��ջ���',
   return_goods_delivery_address varchar(1024) not null comment '�˻��ջ���ַ',
   return_goods_consignee_cell_phone_number varchar(1024) not null comment '�˻��ջ��˵���ϵ�绰',
   courier_number       varchar(1024) not null comment '�˻���ݵ���',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table order_return_goods comment '�����˻���';

