create table attendance
(
    id         int primary key auto_increment,
    stu_id     smallint not null,
    created_at datetime not null
);

# 查询本周迟到两次以上的同学
SET sql_mode = (select replace(@@sql_mode, "ONLY_FULL_GROUP_BY", ""));

select count(*) as number, stu_id, created_at
from attendance
where date(created_at) >= date(date_add(now(), interval 0 - weekday(now()) day))
  and time(created_at) > '09:30:00'
group by stu_id
having number >= 2;

# 本周哪位同学准时到校次数最多
select count(*) as number, stu_id, created_at
from attendance
where date(created_at) >= date(date_add(now(), interval 0 - weekday(now()) day))
  and time(created_at) <= '09:30:00'
group by stu_id
order by number desc
limit 1;
