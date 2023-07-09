/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 9:46:47                            */
/*==============================================================*/


drop table if exists auth_account;

drop table if exists auth_account_priority_relationship;

drop table if exists auth_account_role_relationship;

drop table if exists auth_priority;

drop table if exists auth_role;

drop table if exists auth_role_priority_relationship;

/*==============================================================*/
/* Table: auth_account                                          */
/*==============================================================*/
create table auth_account
(
   id                   bigint not null auto_increment comment '主键，自增长',
   username             varchar(1024) not null comment '用户名，英文',
   password             tinyint not null comment '账号的密码',
   employe_name         varchar(1024) not null comment '姓名，中文',
   account_comment      varchar(1024) comment '账号的说明备注',
   is_enabled           tinyint not null default 1 comment '账号是否启用，1：启用，0：未启用',
   gmt_create           datetime not null comment '账号的创建时间',
   gmt_modified         datetime not null comment '账号的更新时间',
   primary key (id)
);

alter table auth_account comment '账号表，电商公司里一个员工就对应着一个账号，每个账号给分配多个角色，同时这个账号也可以给分配多个权限';

/*==============================================================*/
/* Table: auth_account_priority_relationship                    */
/*==============================================================*/
create table auth_account_priority_relationship
(
   id                   bigint not null auto_increment comment '主键，自增长',
   account_id           bigint not null comment '账号的主键',
   priority_id          bigint not null comment '权限的主键',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table auth_account_priority_relationship comment '账号与权限的关系表，一个账号可以对应多个权限，一个权限也可以属于多个账号';

/*==============================================================*/
/* Table: auth_account_role_relationship                        */
/*==============================================================*/
create table auth_account_role_relationship
(
   id                   bigint not null auto_increment comment '主键，自增长',
   account_id           bigint not null comment '账号的主键',
   role_id              bigint not null comment '角色的主键',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table auth_account_role_relationship comment '账号和角色的关系表，一个账号可以对应多个角色，一个角色也可以对应多个账号';

/*==============================================================*/
/* Table: auth_priority                                         */
/*==============================================================*/
create table auth_priority
(
   id                   bigint not null auto_increment comment '主键，自增长',
   code                 varchar(1024) not null comment '权限编号',
   url                  varchar(1024) not null comment '权限对应的请求URL',
   priority_comment     varchar(1024) comment '权限的说明备注',
   priority_type        tinyint not null default 1 comment '权限类型，1：菜单，2：其他',
   parent_id            bigint comment '父权限的主键',
   gmt_create           datetime not null comment '权限的创建时间',
   gmt_modified         datetime not null comment '权限的修改时间',
   primary key (id)
);

alter table auth_priority comment '权限表，每个权限代表了系统中的一个菜单、按钮、URL请求';

/*==============================================================*/
/* Table: auth_role                                             */
/*==============================================================*/
create table auth_role
(
   id                   bigint not null auto_increment comment '主键，自增长',
   code                 varchar(1024) not null comment '角色编号',
   role_name            varchar(1024) not null comment '角色名称',
   role_comment         varchar(1024) comment '角色的说明备注',
   is_enabled           tinyint not null default 1 comment '角色是否启用，1：启用，0：未启用',
   gmt_create           datetime not null comment '角色的创建时间',
   gmt_modified         datetime not null comment '角色的修改时间',
   primary key (id)
);

alter table auth_role comment '角色表，在系统中有多个角色，每个角色可以分配一些权限';

/*==============================================================*/
/* Table: auth_role_priority_relationship                       */
/*==============================================================*/
create table auth_role_priority_relationship
(
   id                   bigint not null auto_increment comment '主键，自增长',
   priority_id          bigint not null comment '权限的主键',
   role_id              bigint not null comment '角色的主键',
   gmt_create           datetime not null comment '创建时间',
   gmt_modified         datetime not null comment '更新时间',
   primary key (id)
);

alter table auth_role_priority_relationship comment '角色和权限的关系表，角色和权限是多对多的关系，一个角色可以对应多个权限，一个权限可以属于多个角色';
