/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 9:55:34                            */
/*==============================================================*/


drop table if exists wms_goods_allocation;

drop table if exists wms_goods_allocation_stock;

drop table if exists wms_purchase_input_order;

drop table if exists wms_purchase_input_order_item;

drop table if exists wms_purchase_input_put_on_item;

drop table if exists wms_return_goods_input_order;

drop table if exists wms_return_goods_input_order_item;

drop table if exists wms_return_goods_input_put_on_item;

drop table if exists wms_sale_delivery_order;

drop table if exists wms_sale_delivery_order_item;

drop table if exists wms_sale_delivery_picking_item;

drop table if exists wms_warehouse_goods_stock;

/*==============================================================*/
/* Table: wms_goods_allocation                                  */
/*==============================================================*/
create table wms_goods_allocation
(
   id                   bigint not null auto_increment comment '����',
   goods_allocation_code varchar(1024) not null comment '��λ���',
   goods_allocation_comment varchar(1024) comment '˵����ע',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_goods_allocation comment 'WMS���ĵĻ�λ��';

/*==============================================================*/
/* Table: wms_goods_allocation_stock                            */
/*==============================================================*/
create table wms_goods_allocation_stock
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

alter table wms_goods_allocation_stock comment '�ֿ��еĻ�λ���';

/*==============================================================*/
/* Table: wms_purchase_input_order                              */
/*==============================================================*/
create table wms_purchase_input_order
(
   id                   bigint not null auto_increment comment '����',
   supplier_id          bigint not null comment '��Ӧ��ID',
   expect_arrival_time  datetime not null comment 'Ԥ�Ƶ���ʱ��',
   arrival_time         datetime not null comment 'ʵ�ʵ���ʱ��',
   purchase_contactor   varchar(1024) not null comment '�ɹ���ϵ��',
   purchase_contact_phone_number varchar(1024) not null comment '�ɹ���ϵ�绰',
   purchase_contact_email varchar(1024) not null comment '�ɹ���ϵ����',
   purchase_input_order_comment varchar(1024) not null comment '�ɹ���ⵥ��˵����ע',
   purchaser            varchar(1024) not null comment '�ɹ�Ա',
   purchase_input_order_status tinyint not null comment '�ɹ���ⵥ״̬��1���༭�У�2������ˣ�3������⣬4�������㣬5�������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_purchase_input_order comment 'wms���ĵĲɹ���ⵥ';

/*==============================================================*/
/* Table: wms_purchase_input_order_item                         */
/*==============================================================*/
create table wms_purchase_input_order_item
(
   id                   bigint not null auto_increment comment '����',
   purchase_input_order_id bigint not null comment '�ɹ���ⵥID',
   goods_sku_id         bigint not null comment '��ƷSKU ID',
   purchase_count       bigint not null comment '�ɹ�����',
   purchase_price       bigint not null comment '�ɹ��۸�',
   qualified_count      bigint not null comment '�ϸ���Ʒ������',
   arrival_count        bigint not null comment '��������Ʒ����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_purchase_input_order_item comment 'wms���ĵĲɹ���ⵥ��Ŀ��';

/*==============================================================*/
/* Table: wms_purchase_input_put_on_item                        */
/*==============================================================*/
create table wms_purchase_input_put_on_item
(
   id                   bigint not null auto_increment comment '����',
   purchase_input_order_item_id bigint not null comment '�ɹ���ⵥ��ĿID',
   goods_allocation_id  bigint not null comment '��λID',
   put_on_shelves_count bigint not null comment '�ϼ�����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_purchase_input_put_on_item comment '�ɹ���ⵥ��Ŀ�������ϼ���Ŀ';

/*==============================================================*/
/* Table: wms_return_goods_input_order                          */
/*==============================================================*/
create table wms_return_goods_input_order
(
   id                   bigint not null auto_increment comment '����',
   user_account_id      char(10) comment '�û��˺�ID',
   order_id             bigint not null comment '����ID',
   order_no             varchar(1024) not null comment '������ţ�������ɵ�UUID',
   return_goods_input_order_status tinyint not null comment '�˻���ⵥ״̬��1���༭�У�2������ˣ�3�������',
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
   return_goods_reason  tinyint not null comment '�˻�ԭ��1���������ã�2����Ʒ�����⣬3������ˣ�4���������˻�',
   return_goods_comment varchar(1024) not null comment '�˻���ע',
   arrival_time         datetime not null comment '����ʱ��',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_return_goods_input_order comment 'wms���ĵ��˻���ⵥ';

/*==============================================================*/
/* Table: wms_return_goods_input_order_item                     */
/*==============================================================*/
create table wms_return_goods_input_order_item
(
   id                   bigint not null auto_increment comment '����',
   return_goods_input_order_id bigint not null comment '�˻���ⵥID',
   goods_sku_id         bigint not null comment '��Ʒsku ID',
   goods_sku_code       varchar(1024) not null comment '��Ʒsku���',
   goods_name           varchar(1024) not null comment '��Ʒ����',
   sale_properties      varchar(1024) not null comment '�������ԣ�������ɫ:��ɫ,�ڴ�����:256G',
   goods_gross_weight   decimal(8,2) not null comment '��Ʒë��',
   purchase_quantity    bigint not null comment '��������',
   purchase_price       decimal(8,2) not null comment '��Ʒ����۸�',
   promotion_activity_id bigint not null comment '�����ID',
   goods_length         decimal(8,2) not null comment '��Ʒ����',
   goods_width          decimal(8,2) not null comment '��Ʒ���',
   goods_height         decimal(8,2) not null comment '��Ʒ�߶�',
   qualified_count      bigint not null comment '�ϸ���Ʒ����',
   arrival_count        bigint not null comment '��Ʒ��������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_return_goods_input_order_item comment '�˻���ⵥ��Ŀ';

/*==============================================================*/
/* Table: wms_return_goods_input_put_on_item                    */
/*==============================================================*/
create table wms_return_goods_input_put_on_item
(
   id                   bigint not null auto_increment comment '����',
   return_goods_input_order_item_id bigint not null comment '�˻���ⵥ��ĿID',
   goods_allocation_id  bigint not null comment '��λID',
   put_on_shelves_count bigint not null comment '�ϼ�����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_return_goods_input_put_on_item comment '�˻���ⵥ��Ŀ�������ϼ���Ŀ';

/*==============================================================*/
/* Table: wms_sale_delivery_order                               */
/*==============================================================*/
create table wms_sale_delivery_order
(
   id                   bigint not null auto_increment comment '����',
   order_id             bigint not null comment '����ID',
   order_no             varchar(1024) not null comment '������ţ�������ɵ�UUID',
   user_account_id      char(10) comment '�û��˺�ID',
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
   sale_delivery_order_status tinyint not null comment '���۳��ⵥ��״̬��1���༭�У�2������ˣ�3�������',
   delivery_time        datetime not null comment '����ʱ��',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_sale_delivery_order comment 'wms���ĵ����۳��ⵥ';

/*==============================================================*/
/* Table: wms_sale_delivery_order_item                          */
/*==============================================================*/
create table wms_sale_delivery_order_item
(
   id                   bigint not null auto_increment comment '����',
   sale_delivery_order_id bigint not null comment '���۳��ⵥID',
   goods_sku_id         bigint not null comment '��Ʒsku ID',
   goods_sku_code       varchar(1024) not null comment '��Ʒsku���',
   goods_name           varchar(1024) not null comment '��Ʒ����',
   sale_properties      varchar(1024) not null comment '�������ԣ�������ɫ:��ɫ,�ڴ�����:256G',
   goods_gross_weight   decimal(8,2) not null comment '��Ʒë��',
   purchase_quantity    bigint not null comment '��������',
   purchase_price       decimal(8,2) not null comment '��Ʒ����۸�',
   promotion_activity_id bigint not null comment '�����ID',
   goods_length         decimal(8,2) not null comment '��Ʒ����',
   goods_width          decimal(8,2) not null comment '��Ʒ���',
   goods_height         decimal(8,2) not null comment '��Ʒ�߶�',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_sale_delivery_order_item comment 'wms���ĵ����۳��ⵥ��Ŀ';

/*==============================================================*/
/* Table: wms_sale_delivery_picking_item                        */
/*==============================================================*/
create table wms_sale_delivery_picking_item
(
   id                   bigint not null auto_increment comment '����',
   sale_delivery_order_item_id bigint not null comment '���۳��ⵥ��ĿID',
   goods_allocation_id  bigint not null comment '��λID',
   picking_count        bigint not null comment '�����ټ���Ʒ',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_sale_delivery_picking_item comment '���۳��ⵥ�ļ����Ŀ';

/*==============================================================*/
/* Table: wms_warehouse_goods_stock                             */
/*==============================================================*/
create table wms_warehouse_goods_stock
(
   id                   bigint not null auto_increments comment '����',
   goods_sku_id         bigint not null comment '��Ʒsku ID',
   available_stock_quantity bigint not null comment '���ÿ������',
   locked_stock_quantity bigint not null comment '�����������',
   deliveried_stock_quantity bigint not null comment '�ѳ���������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table wms_warehouse_goods_stock comment '�ֿ��е���Ʒ���';
