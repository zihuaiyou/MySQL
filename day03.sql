create table stu select * from student;

-- 修改字段 alert
-- 修改字段类型 modify
alter table stu modify sname varchar(50) not null;
-- 修改字段名 change
alter table stu change  sname name varchar(30) not null; 
-- 增加字段名 add
alter table stu add sex smallint default null;
-- 在指定位置增加字段名 
alter table stu add QQ varchar(30) default null after id;
-- 在开始位置增加字段名
alter table stu add weixin varchar(30) default null first;
-- 删除字段 drop;
alter table stu drop weixin;

-- 增加主键和自增；
alter table stu modify id int not null auto_increment,add primary key(id);
-- 删除主键之前要先删除自增；
alter table stu modify id int not null;
alter table stu drop primary key;
