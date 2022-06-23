-- 这种查询方式无效，null不能和任何值比较
select * from student  where class_id = null;
-- 判定null的方式  is
select * from  student where class_id is null ;
-- 查找null, ifnull
select sname , ifnull(class_id,'未分配') from student ;

-- 查询并排序， asc升序，desc降序
select sname,age from student order by age desc;
-- limit 1,只筛选一个
select * from student where class_id is not null order by class_id asc limit 1;
-- limit 0,2 第一位数代表起始位置，第二位数代表筛选数量
select * from student where class_id is not null order by class_id asc limit 0,2;
-- 子查询 
select * from student 
where age = (select age from student where age is not null order by age asc limit 1);

-- 增、删、改、
update student set class_id = 4 where class_id is null;
update student set age = age + 10 where age < 20;
delete from student where age >30; 
delete from student order by id desc limit 1;
insert into student set age=19,sname ="肖战";
insert into student (sname,class_id,age)values ("小芳",2,32),('小鹏',4,21);

-- 修改数据表名
alter table student rename stu;
rename table stu to student;

create table student_bak select * from student;
-- 删除表中所有数据；truncate效率更好
delete from student_bak ;
truncate student_bak ;
-- 直接删除表
drop table if exists student_bak;



 