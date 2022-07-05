alter table stu_date
    add sex tinyint not null;

# 一些查询技巧
# 找出所有的90后
select *
from stu_date
where birthday between '1990-1-1' and '1999-12-31';

# 找出年龄最小的学生(考虑同龄情况,使用子查询)
select *
from stu_date
where birthday = (select birthday from stu_date order by birthday desc limit 1);

# 找出1班2班所有的90后
select *
from stu_date
where class_id in (1, 2)
  and birthday between '1990-1-1' and '1999-12-31';

# 找出拥有 90后学生 最多 的 班级
select count(id) as total, class_id
from stu_date
where birthday between '1990-01-1' and '1999-12-31'
GROUP by class_id
order by total desc
limit 1;

# 大于20岁 的 女生 最多的 班级
# select timestampdiff(year ,birthday,now()),class_id from stu_date where sex = 2;
select count(id) as total, class_id
from stu_date
where timestampdiff(year, birthday, now()) > 20
  and sex = 2
group by class_id
order by total desc
limit 1;

# 增加时间
select addtime(now(),'3:00:00');

# 增加日期
select date_add(now(),interval 10 second );
select date_add(now(),interval "10 2" day_hour );
select date_add(now(),interval "8:12" hour_minute );