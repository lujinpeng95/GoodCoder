/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/23 10:08:45                           */
/*==============================================================*/


drop table if exists customer_return_goods_worksheet;

/*==============================================================*/
/* Table: customer_return_goods_worksheet                       */
/*==============================================================*/
create table customer_return_goods_worksheet
(
   id                   bigint not null auto_increment comment '����',
   order_id             bigint not null comment '����ID',
   order_no             varchar(1024) not null comment '�������',
   return_goods_worksheet_status tinyint not null comment '�˻�����״̬��1������ˣ�2����˲�ͨ����3���������˻���Ʒ��4���˻���Ʒ���ջ���5���˻�����⣬6���˻�����⣬7������˿�',
   return_goods_reason  tinyint not null comment '�˻�ԭ��1���������ã�2����Ʒ�����⣬3������ˣ�4���������˻�',
   return_goods_comment varchar(1024) not null comment '�˻���ע',
   return_goods_courier_number varchar(1024) not null comment '�˻���ݵ���',
   gmt_create           datetime not null comment '����ʱ��',
   gmt_modified         datetime not null comment '����ʱ��',
   primary key (id)
);

alter table customer_return_goods_worksheet comment '�ͷ����ĵ��˻�����';

