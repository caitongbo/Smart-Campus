#创建数据库：smartcampus
create database smartcampus character set utf8;

#创建商家表：shop_info
create table shop_info(
  uuid varchar(32) primary key comment '自动生成UUID',
  shop_name varchar(16) not null comment '商家名',
  show_addr varchar(50) not null comment '商家地址',
  state char(1) not null comment '是否可用 0不可用 1可用'
) default charset = utf8;

#创建商品表：goods
create table goods(
  id int primary key auto_increment,
  g_name varchar(100) not null comment '商品名',
  g_price varchar(100) not null comment '商品价格',
  g_ly varchar(100) not null comment '商品来源',
  g_vid varchar(100) not null comment '条形码',
  g_img varchar(100) comment '商品图片',
  g_simg varchar(100) comment '商品缩略图',
  g_label varchar(200) comment ' 商品描述',
  g_details varchar(500) comment '商品详情',
  g_state char(1) not null comment '商品状态 1上架 0下架 -1缺货',
  s_i_uuid varchar(32) not null comment '商家表ID'
) default charset = utf8;

#创建一卡通表：card
create table card(
  id int primary key auto_increment comment '一卡通编号',
  card_vid varchar(32) not null,	
  card_balance varchar(100) not null comment '一卡通余额',
  sq_id varchar(10) not null comment '申请ID',
  auth_id int not null comment '一卡通权限',
  state char(1) not null comment '0不可用1可用'
) default charset = utf8;

#创建用户表：user
create table user(
  uuid varchar(32) primary key comment '自动生成UUID',
  id varchar(32) not null comment '学号/教师账号 系统生成',
  password varchar(50) comment '密码，手机登录无需密码',
  state char(1) not null comment '是否可用，0不可用，1可用',
  type char(1) not null comment '0邮箱，1手机，2帐号',
  auth_id int not null comment '用户权限',
  shop_type char(1) not null comment '0普通用户 1商家'
) default charset = utf8;

#创建权限表：authority
create table authority(
  id int primary key auto_increment,
  au_name varchar(50) comment '权限名，比如老师、学生、商户',
  au_details varchar(200) comment '权限职能描述'
) default charset = utf8;

#创建订单表：orders
create table orders(
  user_uuid varchar(32) primary key comment '用户ID',
  g_id int not null comment '商品ID'
) default charset = utf8;
