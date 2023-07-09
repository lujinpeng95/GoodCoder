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
   id                   bigint not null auto_increment comment '主键',
   user_account_id      bigint comment '用户账号ID',
   order_no             varchar(1024) not null comment '订单编号，随机生成的UUID',
   order_status         tinyint not null comment '订单状态，1：待付款，2：已取消，3：待发货，4：待收货，5：已完成，6：售后中（退货申请待审核），7：交易关闭（退货审核不通过），8：交易中（待寄送退货商品），9：售后中（退货商品待收货），10：售后中（退货待入库），11：（1）售后中（退货已入库），12：交易关闭（完成退款）',
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
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table `order` comment '订单表';

/*==============================================================*/
/* Table: order_item                                            */
/*==============================================================*/
create table order_item
(
   id                   bigint not null auto_increment comment '主键',
   order_id             bigint not null comment '订单ID',
   goods_sku_id         bigint not null comment '商品sku ID',
   goods_sku_code       varchar(1024) not null comment '商品sku编号',
   goods_name           varchar(1024) not null comment '商品名称',
   sale_properties      varchar(1024) not null comment '销售属性，机身颜色:白色,内存容量:256G',
   goods_gross_weight   decimal(8,2) not null comment '商品毛重',
   purchase_quantity    bigint not null comment '购买数量',
   purchase_price       decimal(8,2) not null comment '商品购买价格',
   promotion_activity_id bigint comment '促销活动ID',
   goods_length         decimal(8,2) not null comment '商品长度',
   goods_width          decimal(8,2) not null comment '商品宽度',
   goods_height         decimal(8,2) not null comment '商品高度',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table order_item comment '订单商品条目';

/*==============================================================*/
/* Table: order_operation                                       */
/*==============================================================*/
create table order_operation
(
   id                   bigint not null auto_increment comment '主键',
   order_id             bigint not null comment '订单ID',
   operation_type       tinyint not null comment '操作类型，1：创建订单，2：手动取消订单，3：自动取消订单，4：支付订单，5：手动确认收货，6：自动确认收货，7：商品发货，8：申请退货，9：退货审核不通过，10：退货审核通过，11：寄送退货商品，12：确认收到退货，13：退货已入库，14：完成退款',
   operation_content    varchar(1024) not null comment '操作内容',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table order_operation comment '订单操作记录表';

/*==============================================================*/
/* Table: order_return_goods                                    */
/*==============================================================*/
create table order_return_goods
(
   id                   bigint not null auto_increment comment '主键',
   order_id             bigint not null comment '订单ID',
   return_goods_reason  tinyint not null comment '退货原因，1：质量不好，2：商品不满意，3：买错了，4：无理由退货',
   return_goods_comment varchar(1024) not null comment '退货备注',
   return_goods_status  tinyint not null comment '退货记录状态，1：待审核，2：审核不通过，3：待寄送退货商品，4：退货商品待收货，5：退货待入库，6：退货已入库，7：完成退款',
   return_goods_consignee varchar(1024) not null comment '退货收货人',
   return_goods_delivery_address varchar(1024) not null comment '退货收货地址',
   return_goods_consignee_cell_phone_number varchar(1024) not null comment '退货收货人的联系电话',
   courier_number       varchar(1024) not null comment '退货快递单号',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table order_return_goods comment '订单退货表';

