/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:07:29                           */
/*==============================================================*/


drop table if exists promotion_activity;

drop table if exists promotion_activity_goods_sku_relationship;

drop table if exists promotion_coupon;

drop table if exists promotion_coupon_achieve;

/*==============================================================*/
/* Table: promotion_activity                                    */
/*==============================================================*/
create table promotion_activity
(
   id                   bigint not null auto_increment comment '主键',
   promotion_activity_name varchar(1024) not null comment '促销活动名称',
   promotion_activity_start_time datetime not null comment '促销活动开始时间',
   promotion_activity_end_time datetime not null comment '促销活动结束时间',
   promotion_activity_comment varchar(1024) not null comment '促销活动说明备注',
   promotion_activity_status tinyint not null comment '促销活动的状态，1：启用，2：停用',
   promotion_activity_rule varchar(1024) not null comment '促销活动的规则',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table promotion_activity comment '促销活动表';

/*==============================================================*/
/* Table: promotion_activity_goods_sku_relationship             */
/*==============================================================*/
create table promotion_activity_goods_sku_relationship
(
   id                   bigint not null auto_increment comment '主键',
   promotion_activity_id bigint not null comment '促销活动ID',
   goods_id             bigint not null comment '关联的某个商品sku的ID，如果将这个字段的值设置为-1，那么代表针对全部商品',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table promotion_activity_goods_sku_relationship comment '促销活动跟商品sku的关联关系';

/*==============================================================*/
/* Table: promotion_coupon                                      */
/*==============================================================*/
create table promotion_coupon
(
   id                   bigint not null auto_increment comment '主键',
   coupon_name          varchar(1024) not null comment '优惠券名称',
   coupon_type          tinyint not null comment '优惠券类型，1：现金券，2：满减券',
   coupon_rule          varchar(1024) not null comment '优惠券规则',
   valid_start_time     datetime not null comment '有效期开始时间',
   valid_end_time       datetime not null comment '有效期结束时间',
   coupon_count         bigint not null comment '优惠券发行数量',
   coupon_received_count bigint not null comment '优惠券已经领取的数量',
   coupon_receive_type  tinyint not null comment '优惠券发放方式，1：可发放可领取，2：仅可发放，3：仅可领取',
   coupon_status        tinyint not null comment '优惠券状态，1：发放中，2：已发完，3：过期',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table promotion_coupon comment '优惠券表';

/*==============================================================*/
/* Table: promotion_coupon_achieve                              */
/*==============================================================*/
create table promotion_coupon_achieve
(
   id                   bigint not null auto_increment comment '主键',
   coupon_id            bigint not null comment '优惠券ID',
   user_account_id      bigint not null comment '用户账号ID',
   is_used              tinyint not null comment '是否使用过这个优惠券，1：使用了，0：未使用',
   used_time            datetime,
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table promotion_coupon_achieve comment '优惠券领取记录表';
