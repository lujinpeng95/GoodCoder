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
   id                   bigint not null auto_increment comment '主键',
   goods_allocation_code varchar(1024) not null comment '货位编号',
   goods_allocation_comment varchar(1024) comment '说明备注',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_goods_allocation comment 'WMS中心的货位表';

/*==============================================================*/
/* Table: wms_goods_allocation_stock                            */
/*==============================================================*/
create table wms_goods_allocation_stock
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

alter table wms_goods_allocation_stock comment '仓库中的货位库存';

/*==============================================================*/
/* Table: wms_purchase_input_order                              */
/*==============================================================*/
create table wms_purchase_input_order
(
   id                   bigint not null auto_increment comment '主键',
   supplier_id          bigint not null comment '供应商ID',
   expect_arrival_time  datetime not null comment '预计到货时间',
   arrival_time         datetime not null comment '实际到货时间',
   purchase_contactor   varchar(1024) not null comment '采购联系人',
   purchase_contact_phone_number varchar(1024) not null comment '采购联系电话',
   purchase_contact_email varchar(1024) not null comment '采购联系邮箱',
   purchase_input_order_comment varchar(1024) not null comment '采购入库单的说明备注',
   purchaser            varchar(1024) not null comment '采购员',
   purchase_input_order_status tinyint not null comment '采购入库单状态，1：编辑中，2：待审核，3：已入库，4：待结算，5：已完成',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_purchase_input_order comment 'wms中心的采购入库单';

/*==============================================================*/
/* Table: wms_purchase_input_order_item                         */
/*==============================================================*/
create table wms_purchase_input_order_item
(
   id                   bigint not null auto_increment comment '主键',
   purchase_input_order_id bigint not null comment '采购入库单ID',
   goods_sku_id         bigint not null comment '商品SKU ID',
   purchase_count       bigint not null comment '采购数量',
   purchase_price       bigint not null comment '采购价格',
   qualified_count      bigint not null comment '合格商品的数量',
   arrival_count        bigint not null comment '到货的商品数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_purchase_input_order_item comment 'wms中心的采购入库单条目表';

/*==============================================================*/
/* Table: wms_purchase_input_put_on_item                        */
/*==============================================================*/
create table wms_purchase_input_put_on_item
(
   id                   bigint not null auto_increment comment '主键',
   purchase_input_order_item_id bigint not null comment '采购入库单条目ID',
   goods_allocation_id  bigint not null comment '货位ID',
   put_on_shelves_count bigint not null comment '上架数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_purchase_input_put_on_item comment '采购入库单条目关联的上架条目';

/*==============================================================*/
/* Table: wms_return_goods_input_order                          */
/*==============================================================*/
create table wms_return_goods_input_order
(
   id                   bigint not null auto_increment comment '主键',
   user_account_id      char(10) comment '用户账号ID',
   order_id             bigint not null comment '订单ID',
   order_no             varchar(1024) not null comment '订单编号，随机生成的UUID',
   return_goods_input_order_status tinyint not null comment '退货入库单状态，1：编辑中，2：待审核：3：已完成',
   consignee            varchar(1024) not null comment '收货人',
   delivery_address     varchar(1024) not null comment '收货地址',
   consignee_cell_phone_number varchar(1024) not null comment '收货人电话号码',
   freight              decimal(8,2) not null comment '运费',
   pay_type             tinyint not null comment '支付方式，1：支付宝，2：微信',
   total_amount         decimal(8,2) not null comment '订单总金额',
   discount_amount      decimal(8,2) not null comment '促销活动折扣金额',
   coupon_amount        decimal(8,2) not null comment '优惠券抵扣金额',
   payable_amount       decimal(8,2) not null comment '应付金额，订单总金额 - 促销活动折扣金额 - 优惠券抵扣金额 + 运费',
   invoice_title        varchar(1024) not null comment '发票抬头',
   taxpayer_id          varchar(1024) not null comment '纳税人识别号',
   order_comment        varchar(1024) not null comment '订单备注',
   return_goods_reason  tinyint not null comment '退货原因，1：质量不好，2：商品不满意，3：买错了，4：无理由退货',
   return_goods_comment varchar(1024) not null comment '退货备注',
   arrival_time         datetime not null comment '到货时间',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_return_goods_input_order comment 'wms中心的退货入库单';

/*==============================================================*/
/* Table: wms_return_goods_input_order_item                     */
/*==============================================================*/
create table wms_return_goods_input_order_item
(
   id                   bigint not null auto_increment comment '主键',
   return_goods_input_order_id bigint not null comment '退货入库单ID',
   goods_sku_id         bigint not null comment '商品sku ID',
   goods_sku_code       varchar(1024) not null comment '商品sku编号',
   goods_name           varchar(1024) not null comment '商品名称',
   sale_properties      varchar(1024) not null comment '销售属性，机身颜色:白色,内存容量:256G',
   goods_gross_weight   decimal(8,2) not null comment '商品毛重',
   purchase_quantity    bigint not null comment '购买数量',
   purchase_price       decimal(8,2) not null comment '商品购买价格',
   promotion_activity_id bigint not null comment '促销活动ID',
   goods_length         decimal(8,2) not null comment '商品长度',
   goods_width          decimal(8,2) not null comment '商品宽度',
   goods_height         decimal(8,2) not null comment '商品高度',
   qualified_count      bigint not null comment '合格商品数量',
   arrival_count        bigint not null comment '商品到货数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_return_goods_input_order_item comment '退货入库单条目';

/*==============================================================*/
/* Table: wms_return_goods_input_put_on_item                    */
/*==============================================================*/
create table wms_return_goods_input_put_on_item
(
   id                   bigint not null auto_increment comment '主键',
   return_goods_input_order_item_id bigint not null comment '退货入库单条目ID',
   goods_allocation_id  bigint not null comment '货位ID',
   put_on_shelves_count bigint not null comment '上架数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_return_goods_input_put_on_item comment '退货入库单条目关联的上架条目';

/*==============================================================*/
/* Table: wms_sale_delivery_order                               */
/*==============================================================*/
create table wms_sale_delivery_order
(
   id                   bigint not null auto_increment comment '主键',
   order_id             bigint not null comment '订单ID',
   order_no             varchar(1024) not null comment '订单编号，随机生成的UUID',
   user_account_id      char(10) comment '用户账号ID',
   consignee            varchar(1024) not null comment '收货人',
   delivery_address     varchar(1024) not null comment '收货地址',
   consignee_cell_phone_number varchar(1024) not null comment '收货人电话号码',
   freight              decimal(8,2) not null comment '运费',
   pay_type             tinyint not null comment '支付方式，1：支付宝，2：微信',
   total_amount         decimal(8,2) not null comment '订单总金额',
   discount_amount      decimal(8,2) not null comment '促销活动折扣金额',
   coupon_amount        decimal(8,2) not null comment '优惠券抵扣金额',
   payable_amount       decimal(8,2) not null comment '应付金额，订单总金额 - 促销活动折扣金额 - 优惠券抵扣金额 + 运费',
   invoice_title        varchar(1024) not null comment '发票抬头',
   taxpayer_id          varchar(1024) not null comment '纳税人识别号',
   order_comment        varchar(1024) not null comment '订单备注',
   sale_delivery_order_status tinyint not null comment '销售出库单的状态，1：编辑中，2：待审核，3：已完成',
   delivery_time        datetime not null comment '发货时间',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_sale_delivery_order comment 'wms中心的销售出库单';

/*==============================================================*/
/* Table: wms_sale_delivery_order_item                          */
/*==============================================================*/
create table wms_sale_delivery_order_item
(
   id                   bigint not null auto_increment comment '主键',
   sale_delivery_order_id bigint not null comment '销售出库单ID',
   goods_sku_id         bigint not null comment '商品sku ID',
   goods_sku_code       varchar(1024) not null comment '商品sku编号',
   goods_name           varchar(1024) not null comment '商品名称',
   sale_properties      varchar(1024) not null comment '销售属性，机身颜色:白色,内存容量:256G',
   goods_gross_weight   decimal(8,2) not null comment '商品毛重',
   purchase_quantity    bigint not null comment '购买数量',
   purchase_price       decimal(8,2) not null comment '商品购买价格',
   promotion_activity_id bigint not null comment '促销活动ID',
   goods_length         decimal(8,2) not null comment '商品长度',
   goods_width          decimal(8,2) not null comment '商品宽度',
   goods_height         decimal(8,2) not null comment '商品高度',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_sale_delivery_order_item comment 'wms中心的销售出库单条目';

/*==============================================================*/
/* Table: wms_sale_delivery_picking_item                        */
/*==============================================================*/
create table wms_sale_delivery_picking_item
(
   id                   bigint not null auto_increment comment '主键',
   sale_delivery_order_item_id bigint not null comment '销售出库单条目ID',
   goods_allocation_id  bigint not null comment '货位ID',
   picking_count        bigint not null comment '发多少件商品',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_sale_delivery_picking_item comment '销售出库单的拣货条目';

/*==============================================================*/
/* Table: wms_warehouse_goods_stock                             */
/*==============================================================*/
create table wms_warehouse_goods_stock
(
   id                   bigint not null auto_increments comment '主键',
   goods_sku_id         bigint not null comment '商品sku ID',
   available_stock_quantity bigint not null comment '可用库存数量',
   locked_stock_quantity bigint not null comment '锁定库存数量',
   deliveried_stock_quantity bigint not null comment '已出库库存数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table wms_warehouse_goods_stock comment '仓库中的商品库存';
