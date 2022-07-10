# 选择每月月末的时间
select last_day(now());
# 选择月初的时间
select date_sub(now(), interval dayofmonth(now()) - 1 day);

# 找出本月发布的文章
select *
from article_time
where publish_time >= date_sub(now(), interval dayofmonth(now()) - 1 day)
  and publish_time <= last_day(now());
# 找出三个月内发布的文章
select *
from article_time
where publish_time >= date_sub(now(), interval 3 month);
# 找出三个月内发布的文章(到三个月前的1号)
select *
from article_time
where publish_time >= date_format(date_sub(now(), interval 3 month), '%Y-%m-01');

# 选择周一
select date(date_add(now(), interval 0 - weekday(now()) day));


# 排序
select *
from stu
order by sex asc;
select *
from stu
where sex = 2
order by id desc
limit 1;
# 二次排序
select *
from stu
order by sex desc, age asc;

alter table stu
    add birthyear smallint;
update stu
set birthyear = year(date_sub(now(), interval age year));

# 随机排序
select *
from stu
order by rand();

select name, class_id, birthyear
from stu
where class_id is not null
order by birthyear desc;

select name, class_id, birthyear
from stu
where birthyear = (select birthyear from stu where birthyear >= 1990 order by birthyear asc limit 1);