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
   id                   bigint not null auto_increment comment '����',
   user_account_id      bigint not null comment '�����ĸ��û��˺�',
   province             varchar(1024) not null comment 'ʡ',
   city                 varchar(1024) not null comment '��',
   district             varchar(1024) not null comment '��',
   consignee            varchar(1024) not null comment '�ջ���',
   address              varchar(1024) not null comment '�ջ���ַ',
   cell_phone_number    varchar(1024) not null comment '�ջ��˵绰����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table membership_delivery_address comment '��Ա���ĵ��ջ���ַ��';

/*==============================================================*/
/* Table: membership_member_level                               */
/*==============================================================*/
create table membership_member_level
(
   id                   bigint not null auto_increment comment '����',
   user_account_id      bigint not null comment '�����ĸ���Ա�˺�',
   growth_value         bigint not null comment '�ɳ�ֵ',
   member_level         tinyint not null comment '��Ա�ȼ�����1��ʼ��1����2����3����4��',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table membership_member_level comment '��Ա���ĵĻ�Ա�ȼ���';

/*==============================================================*/
/* Table: membership_member_level_detail                        */
/*==============================================================*/
create table membership_member_level_detail
(
   id                   bigint not null auto_increment comment '����',
   member_level_id      bigint not null comment '��Ա�ȼ���ϢID',
   old_growth_value     bigint not null comment '���α䶯֮ǰ�ĳɳ�ֵ',
   updated_growth_value bigint not null comment '���α䶯�˶��ٳɳ�ֵ',
   new_growth_value     bigint not null comment '���α䶯֮��ĳɳ�ֵ',
   old_member_level     tinyint not null comment '���α䶯֮ǰ�Ļ�Ա�ȼ�',
   new_member_level     tinyint not null comment '���α䶯��Ļ�Ա����',
   update_reason        varchar(1024) not null comment '�䶯ԭ��',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table membership_member_level_detail comment '��Ա�ȼ��������ϸ��';

/*==============================================================*/
/* Table: membership_member_point                               */
/*==============================================================*/
create table membership_member_point
(
   id                   bigint not null auto_increment comment '����',
   user_account_id      bigint not null comment '��Ա�˺�ID',
   member_point         bigint not null comment '��Ա����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table membership_member_point comment '��Ա���ĵĻ�Ա���ֱ�';

/*==============================================================*/
/* Table: membership_member_point_detail                        */
/*==============================================================*/
create table membership_member_point_detail
(
   id                   bigint not null auto_increment comment '����',
   member_point_id      bigint not null comment '��Ա����ID',
   old_member_point     longtext not null comment '���α䶯֮ǰ�Ļ�Ա����',
   updated_member_point bigint not null comment '���α䶯�Ļ�Ա����',
   new_member_point     bigint not null comment '���α䶯֮��Ļ�Ա����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   update_reason        varchar(1024) not null comment '���λ��ֱ䶯��ԭ��',
   primary key (id)
);

alter table membership_member_point_detail comment '��Ա���ֱ䶯����ϸ��';

/*==============================================================*/
/* Table: membership_user_account                               */
/*==============================================================*/
create table membership_user_account
(
   id                   bigint not null auto_increment comment '����',
   username             varchar(1024) not null comment '�û���',
   password             varchar(1024) not null comment '����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table membership_user_account comment '��Ա���ĵ��û��˺���Ϣ';

/*==============================================================*/
/* Table: membership_user_detail                                */
/*==============================================================*/
create table membership_user_detail
(
   id                   bigint not null auto_increment comment '����',
   register_time        datetime not null comment 'ע��ʱ��',
   cell_phone_number    varchar(1024) comment '�ֻ���',
   gender               tinyint comment '�Ա�1���У�2��Ů',
   birthday             datetime comment '����',
   email                varchar(1024) comment '����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);
