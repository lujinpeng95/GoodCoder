/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:05:53                           */
/*==============================================================*/


drop table if exists comment_aggregate;

drop table if exists comment_info;

drop table if exists comment_picture;

/*==============================================================*/
/* Table: comment_aggregate                                     */
/*==============================================================*/
create table comment_aggregate
(
   id                   bigint not null auto_increment comment '主键',
   goods_id             bigint not null comment '商品ID',
   total_comment_count  bigint not null comment '评论总数量',
   good_comment_count   bigint not null comment '好评数量',
   good_comment_rate    decimal(8,2) not null comment '好评率',
   show_pictures_comment_count bigint not null comment '晒图评论数量',
   medium_comment_count bigint not null comment '中评数量',
   bad_comment_count    bigint not null comment '差评数量',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table comment_aggregate comment '评论聚合汇总表';

/*==============================================================*/
/* Table: comment_info                                          */
/*==============================================================*/
create table comment_info
(
   id                   bigint not null auto_increment comment '主键',
   user_account_id      bigint not null comment '发表评论的用户账号的ID',
   username             varchar(1024) not null comment '用户名',
   order_id             bigint not null comment '订单ID',
   goods_id             bigint not null comment '商品ID',
   goods_sku_id         bigint not null comment '商品sku ID',
   goods_sku_sale_properties varchar(1024) not null comment '商品sku的销售属性',
   total_score          tinyint not null comment '总评分，1~5',
   goods_score          tinyint not null comment '商品评分，1~5',
   customer_service_score tinyint not null comment '客服评分，1~5',
   logistics_score      tinyint not null comment '物流评分，1~5',
   comment_content      varchar(1024) not null comment '评论内容',
   is_show_pictures     tinyint not null comment '是否晒图，1：晒图，0：未晒图',
   is_default_comment   tinyint not null comment '是否系统自动给的默认评论，1：是默认评论，0：不是默认评论',
   comment_status       tinyint not null comment '评论状态，1：待审核，2：已审核，3：审核不通过，4：已删除',
   comment_type         tinyint not null comment '评论类型，1：好评，总分是4分以上；2：中评，3分；3：差评，1~2分',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table comment_info comment '评论信息表';

/*==============================================================*/
/* Table: comment_picture                                       */
/*==============================================================*/
create table comment_picture
(
   id                   bigint not null auto_increment comment '主键',
   comment_info_id      bigint not null comment '评论ID',
   sequence             tinyint not null comment '图片顺序',
   comment_picture      longblob not null comment '晒图图片',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table comment_picture comment '评论的晒图';
