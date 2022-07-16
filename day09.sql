# field自定义排序 找出第一个参数,第一次出现的位置
select field("a", "b", "a", "d");

select name, right(name, 1) as s
from stu
order by field(s, "明", "朱") desc;

# count汇总(包含null),
select count(*)
from stu;
select count(*)
from stu
where sex = "女";
# count中包含明确的字段的时候,不包含null
select count(class_id)
from stu;

# min和max函数
select min(age)
from stu;
select *
from stu
where age = (select max(age) from stu);

# avg函数
select round(avg(timestampdiff(year, birthday, now()))) as age
from stu_date;

# distinct函数
select distinct class_id
from stu
where class_id is not null;
select distinct class_id, name
from stu
where class_id is not null;

# 修改运行模式,ONLY_FULL_GROUP_BY设置为空
# ONLY_FULL_GROUP_BY select中的字段需要在 GROUP BY 中出现
SET sql_mode = (select replace(@@sql_mode, "ONLY_FULL_GROUP_BY", ""));

# group by 分组
select name, class_id
from stu
where sex = '女'
  and class_id is not null
group by class_id;
# 找出每个班年纪最大的学生
select name, class_id
from stu_date
where birthday in (select min(birthday) from stu_date where class_id is not null group by class_id);

select count(*) as "数量", class_id, sex
from stu
where class_id is not null
group by class_id, sex;

# having 对组进行筛选
select class_id, count(*) as number
from stu
where class_id is not null
group by class_id
having number >= 2
order by class_id;