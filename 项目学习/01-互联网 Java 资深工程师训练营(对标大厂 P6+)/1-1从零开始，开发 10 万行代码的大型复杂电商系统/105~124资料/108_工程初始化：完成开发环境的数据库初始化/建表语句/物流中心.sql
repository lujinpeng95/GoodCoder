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
   id                   bigint not null auto_increment comment '����',
   freight_template_name varchar(1024) not null comment '�˷�ģ������',
   freight_template_type tinyint not null comment '�˷�ģ�����ͣ�1���̶��˷ѣ�2����XԪ���ʣ�3���Զ������',
   freight_template_rule varchar(1024) not null comment '�˷�ģ��Ĺ���',
   freight_template_comment varchar(1024) not null comment '�˷�ģ���˵����ע',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table logistics_freight_template comment '�������ĵ��˷�ģ���';

