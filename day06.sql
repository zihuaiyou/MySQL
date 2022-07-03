create table stu_date(id int primary key auto_increment,name varchar(30) not null,class_id smallint default null);

-- date类型 YYYY-MM-DD
alter table stu_date add birthday date default null;
update stu_date set birthday = '1987-11-9' where id = 5; 

-- 格式化输出日期,Date_format
select name ,date_format(birthday,"%Y年%m月%d日") from stu_date;

-- 时间戳 time_stamp 当前时间current_timestamp
alter table stu_date add update_at timestamp default current_timestamp;
-- 更新时间 时间戳 范围从 1970-01-01 08:00:01 到 2038-01-19 03:14:07为止
update stu_date set update_at = "1976-9-24" where id = 1;
-- 默认情况下,更改字段,时间戳不会改变
update stu_date set name = '赵四' where id = 2;
alter table stu_date drop update_at;

-- 设置为 只要更新字段,时间戳就会变化 on update current_timestamp
alter table stu_date add update_at timestamp default current_timestamp on update current_timestamp;

-- 一些时间处理函数 year (birthday) , month(birthday),day(birthday
select year (birthday) , month(birthday),day(birthday)from stu_date;
--  now(),current_date(),current_time()
select now(),current_date(),current_time();
-- 显示一周的某一天
select weekday(now()); -- 范围0~6 分别是星期一到星期天
select dayofweek(now()); -- 范围1~7 分别是星期天到星期六

-- 创建示例表
create table article_time (id int primary key auto_increment ,
title varchar(100) not null,publish_time datetime default null ,status smallint default 1);
-- 
insert into article_time (title,publish_time) values("MySQL 是一款强大的数据库",now());
insert into article_time (title,publish_time,status) values("JavaScript天下第一","2022-6-22 19:23:11",0);
select * from article_time where status = 0 and publish_time < now();
update article_time set status = 1 where status = 0 and publish_time < now();

-- 设置变量@time
set @time = time(now());
select @time;
-- 转化成秒,time_to_sec 或者 反函数 sec_to_time
select time_to_sec(@time) ;
-- 从公元元年到现在有多少天to_days,反函数 from_days
select to_days(now()); 
-- 时间差函数 timediff,daydiff
select datediff(now(),birthday) from stu_date; 
select timediff(time(now()),time(publish_time)) from article_time;
-- timestampdiff 时间差函数
select timestampdiff(day,birthday,now())from stu_date;