-- 创建表   
create table class(id int primary key auto_increment,cname varchar(30) not null,description varchar(100) null);
desc class ;
drop table if exists class;

-- 插入字段     
insert into class set cname = 'JAVA',description = 'java天下第二';
insert into class (cname,description) values ('JS',null),('MySQL',"数据库学习"),('python','快速上手');

-- 根据某一表的格式创建表
create table lesson like class;
-- 复制表
insert into lesson select * from class ;
-- 将某表的指定字段插入新表
insert into lesson (cname) select cname from class;
-- 根据某表内容创建新表 
create table a select * from class ;
-- 创建新表将某表的指定同名字段插入
create table g (id int primary key auto_increment,cname varchar(30) not null) select cname from class;
-- 创建新表将某表的指定字段插入（使用别名）
create table d(id int primary key auto_increment,name varchar(30) not null) select cname as name from class;

-- 查询某表的全部字段 * 
select * from class;
-- 查询指定字段
select cname,id from class;

-- 根据指定条件查询 where
select * from class where cname not like "%p%" and id > 3;
--  查询时，拼接字段并重命名  concat    
select concat(cname,description) as class_info from class ;

create table student(id int primary key auto_increment,sname varchar(30)not null,class_id int default null,age smallint not null);
insert into student(sname,class_id,age) values ('小明','1','13'),('小王','2','33'),('小张','1','19'),('小李','3','17'),('小郑',null,'27');

-- 查询指定字段并去重   distinct
select distinct  class_id from student;
-- 查询在指定区间的字段  between
select * from student where age between 10 and 20;
-- 查询条件 或 or
select * from student where sname like "%王%" or age > 20;
-- 查询在指定集合的字段  in
select * from  student where  class_id in (2,3);
