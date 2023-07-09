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
   id                   bigint not null auto_increment comment '������������',
   username             varchar(1024) not null comment '�û�����Ӣ��',
   password             tinyint not null comment '�˺ŵ�����',
   employe_name         varchar(1024) not null comment '����������',
   account_comment      varchar(1024) comment '�˺ŵ�˵����ע',
   is_enabled           tinyint not null default 1 comment '�˺��Ƿ����ã�1�����ã�0��δ����',
   gmt_create           datetime not null comment '�˺ŵĴ���ʱ��',
   gmt_modified         datetime not null comment '�˺ŵĸ���ʱ��',
   primary key (id)
);

alter table auth_account comment '�˺ű����̹�˾��һ��Ա���Ͷ�Ӧ��һ���˺ţ�ÿ���˺Ÿ���������ɫ��ͬʱ����˺�Ҳ���Ը�������Ȩ��';

/*==============================================================*/
/* Table: auth_account_priority_relationship                    */
/*==============================================================*/
create table auth_account_priority_relationship
(
   id                   bigint not null auto_increment comment '������������',
   account_id           bigint not null comment '�˺ŵ�����',
   priority_id          bigint not null comment 'Ȩ�޵�����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table auth_account_priority_relationship comment '�˺���Ȩ�޵Ĺ�ϵ��һ���˺ſ��Զ�Ӧ���Ȩ�ޣ�һ��Ȩ��Ҳ�������ڶ���˺�';

/*==============================================================*/
/* Table: auth_account_role_relationship                        */
/*==============================================================*/
create table auth_account_role_relationship
(
   id                   bigint not null auto_increment comment '������������',
   account_id           bigint not null comment '�˺ŵ�����',
   role_id              bigint not null comment '��ɫ������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table auth_account_role_relationship comment '�˺źͽ�ɫ�Ĺ�ϵ��һ���˺ſ��Զ�Ӧ�����ɫ��һ����ɫҲ���Զ�Ӧ����˺�';

/*==============================================================*/
/* Table: auth_priority                                         */
/*==============================================================*/
create table auth_priority
(
   id                   bigint not null auto_increment comment '������������',
   code                 varchar(1024) not null comment 'Ȩ�ޱ��',
   url                  varchar(1024) not null comment 'Ȩ�޶�Ӧ������URL',
   priority_comment     varchar(1024) comment 'Ȩ�޵�˵����ע',
   priority_type        tinyint not null default 1 comment 'Ȩ�����ͣ�1���˵���2������',
   parent_id            bigint comment '��Ȩ�޵�����',
   gmt_create           datetime not null comment 'Ȩ�޵Ĵ���ʱ��',
   gmt_modified         datetime not null comment 'Ȩ�޵��޸�ʱ��',
   primary key (id)
);

alter table auth_priority comment 'Ȩ�ޱ�ÿ��Ȩ�޴�����ϵͳ�е�һ���˵�����ť��URL����';

/*==============================================================*/
/* Table: auth_role                                             */
/*==============================================================*/
create table auth_role
(
   id                   bigint not null auto_increment comment '������������',
   code                 varchar(1024) not null comment '��ɫ���',
   role_name            varchar(1024) not null comment '��ɫ����',
   role_comment         varchar(1024) comment '��ɫ��˵����ע',
   is_enabled           tinyint not null default 1 comment '��ɫ�Ƿ����ã�1�����ã�0��δ����',
   gmt_create           datetime not null comment '��ɫ�Ĵ���ʱ��',
   gmt_modified         datetime not null comment '��ɫ���޸�ʱ��',
   primary key (id)
);

alter table auth_role comment '��ɫ����ϵͳ���ж����ɫ��ÿ����ɫ���Է���һЩȨ��';

/*==============================================================*/
/* Table: auth_role_priority_relationship                       */
/*==============================================================*/
create table auth_role_priority_relationship
(
   id                   bigint not null auto_increment comment '������������',
   priority_id          bigint not null comment 'Ȩ�޵�����',
   role_id              bigint not null comment '��ɫ������',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table auth_role_priority_relationship comment '��ɫ��Ȩ�޵Ĺ�ϵ����ɫ��Ȩ���Ƕ�Զ�Ĺ�ϵ��һ����ɫ���Զ�Ӧ���Ȩ�ޣ�һ��Ȩ�޿������ڶ����ɫ';
