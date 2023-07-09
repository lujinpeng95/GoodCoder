/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:01:58                           */
/*==============================================================*/


drop table if exists pay_transaction;

/*==============================================================*/
/* Table: pay_transaction                                       */
/*==============================================================*/
create table pay_transaction
(
   id                   bigint not null auto_increment comment '����',
   transaction_number   varchar(1024) not null comment '������ˮ�ţ�������֧��ƽ̨����',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   order_id             bigint not null comment '����ID',
   total_order_amount   decimal(8,2) not null comment '�����ܽ��',
   discount_order_amount decimal(8,2) not null comment '�����Żݽ��',
   payable_order_amount decimal(8,2) not null comment '����Ӧ�����',
   transaction_channel  tinyint not null comment '����������1��֧������2��΢��',
   transaction_channel_account varchar(1024) not null comment '���������˻�',
   transaction_channel_pay_time datetime not null comment '������ƽ̨���֧����ʱ��',
   transaction_channel_order_no varchar(1024) not null comment '�����������ص�֧��������',
   transaction_channel_status varchar(1024) not null comment '�����������ص�״̬��',
   user_account_id      bigint not null comment '�û��˺�ID',
   user_pay_account     varchar(1024) not null comment '�û�֧���˺�',
   transaction_status   varchar(1024) not null comment '֧��״̬',
   primary key (id)
);

alter table pay_transaction comment '֧��������ˮ';

