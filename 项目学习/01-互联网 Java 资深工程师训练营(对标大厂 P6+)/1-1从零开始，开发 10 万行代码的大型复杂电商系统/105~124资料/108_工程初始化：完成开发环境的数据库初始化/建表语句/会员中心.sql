/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 9:58:47                            */
/*==============================================================*/


drop table if exists membership_delivery_address;

drop table if exists membership_member_level;

drop table if exists membership_member_level_detail;

drop table if exists membership_member_point;

drop table if exists membership_member_point_detail;

drop table if exists membership_user_account;

drop table if exists membership_user_detail;

/*==============================================================*/
/* Table: membership_delivery_address                           */
/*==============================================================*/
create table membership_delivery_address
(
   id                   bigint not null auto_increment comment '主键',
   user_account_id      bigint not null comment '属于哪个用户账号',
   province             varchar(1024) not null comment '省',
   city                 varchar(1024) not null comment '市',
   district             varchar(1024) not null comment '区',
   consignee            varchar(1024) not null comment '收货人',
   address              varchar(1024) not null comment '收货地址',
   cell_phone_number    varchar(1024) not null comment '收货人电话号码',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table membership_delivery_address comment '会员中心的收货地址表';

/*==============================================================*/
/* Table: membership_member_level                               */
/*==============================================================*/
create table membership_member_level
(
   id                   bigint not null auto_increment comment '主键',
   user_account_id      bigint not null comment '属于哪个会员账号',
   growth_value         bigint not null comment '成长值',
   member_level         tinyint not null comment '会员等级，从1开始，1级，2级，3级，4级',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table membership_member_level comment '会员中心的会员等级表';

/*==============================================================*/
/* Table: membership_member_level_detail                        */
/*==============================================================*/
create table membership_member_level_detail
(
   id                   bigint not null auto_increment comment '主键',
   member_level_id      bigint not null comment '会员等级信息ID',
   old_growth_value     bigint not null comment '本次变动之前的成长值',
   updated_growth_value bigint not null comment '本次变动了多少成长值',
   new_growth_value     bigint not null comment '本次变动之后的成长值',
   old_member_level     tinyint not null comment '本次变动之前的会员等级',
   new_member_level     tinyint not null comment '本次变动后的会员级别',
   update_reason        varchar(1024) not null comment '变动原因',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table membership_member_level_detail comment '会员等级变更的明细表';

/*==============================================================*/
/* Table: membership_member_point                               */
/*==============================================================*/
create table membership_member_point
(
   id                   bigint not null auto_increment comment '主键',
   user_account_id      bigint not null comment '会员账号ID',
   member_point         bigint not null comment '会员积分',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table membership_member_point comment '会员中心的会员积分表';

/*==============================================================*/
/* Table: membership_member_point_detail                        */
/*==============================================================*/
create table membership_member_point_detail
(
   id                   bigint not null auto_increment comment '主键',
   member_point_id      bigint not null comment '会员积分ID',
   old_member_point     longtext not null comment '本次变动之前的会员积分',
   updated_member_point bigint not null comment '本次变动的会员积分',
   new_member_point     bigint not null comment '本次变动之后的会员积分',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   update_reason        varchar(1024) not null comment '本次积分变动的原因',
   primary key (id)
);

alter table membership_member_point_detail comment '会员积分变动的明细表';

/*==============================================================*/
/* Table: membership_user_account                               */
/*==============================================================*/
create table membership_user_account
(
   id                   bigint not null auto_increment comment '主键',
   username             varchar(1024) not null comment '用户名',
   password             varchar(1024) not null comment '密码',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table membership_user_account comment '会员中心的用户账号信息';

/*==============================================================*/
/* Table: membership_user_detail                                */
/*==============================================================*/
create table membership_user_detail
(
   id                   bigint not null auto_increment comment '主键',
   register_time        datetime not null comment '注册时间',
   cell_phone_number    varchar(1024) comment '手机号',
   gender               tinyint comment '性别，1：男，2：女',
   birthday             datetime comment '生日',
   email                varchar(1024) comment '邮箱',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);
