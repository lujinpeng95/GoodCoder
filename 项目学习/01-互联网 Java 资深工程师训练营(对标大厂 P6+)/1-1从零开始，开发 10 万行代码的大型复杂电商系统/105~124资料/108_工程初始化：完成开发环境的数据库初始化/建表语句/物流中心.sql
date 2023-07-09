/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:04:59                           */
/*==============================================================*/


drop table if exists logistics_freight_template;

/*==============================================================*/
/* Table: logistics_freight_template                            */
/*==============================================================*/
create table logistics_freight_template
(
   id                   bigint not null auto_increment comment '主键',
   freight_template_name varchar(1024) not null comment '运费模板名称',
   freight_template_type tinyint not null comment '运费模板类型，1：固定运费，2：满X元包邮，3：自定义规则',
   freight_template_rule varchar(1024) not null comment '运费模板的规则',
   freight_template_comment varchar(1024) not null comment '运费模板的说明备注',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table logistics_freight_template comment '物流中心的运费模板表';

