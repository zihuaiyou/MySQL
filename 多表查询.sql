# INNER JOIN
# 查询一班的所有同学
SELECT *
from stu
         inner join class on stu.class_id = class.id
where class_id = 1;

# 每个班级发表的文章数量
select class.id, count(*)
from stu
         inner join article
         inner join class
                    on stu.class_id = class.id
                        and stu.id = article.stu_id
group by class.id;

# 一班的所有女生发表的文章
select *
from stu
         inner join article
         inner join class
                    on stu.class_id = class.id
                        and stu.id = article.stu_id
where stu.sex = '女';

# 每个班级发表的文章总数
SELECT count(article.id), class_id
FROM stu
         INNER JOIN class
         INNER JOIN article
                    ON stu.class_id = class.id AND stu.id = article.stu_id
GROUP BY class.id;

# 哪个班级发表的文章超过1篇
select count(article.id) as num, class_id
from stu
         inner join class
         inner join article
                    on stu.class_id = class.id
                        and article.stu_id = stu.id
group by class_id
HAVING num > 1;

# 每个班级文章的总点击数与平均点击数
select sum(article.click), avg(article.click), class_id
from stu
         inner join class
         inner join article
                    on stu.id = article.stu_id
                        and stu.class_id = class.id
group by class_id
order by sum(article.click);

# 每个班级有多少名同学
select count(stu.id), class_id
from stu
         inner join class
                    on stu.class_id = class.id
group by class_id;

# 学生人数大于两个的班级名称
select count(stu.id), class_id
from stu
         inner join class
                    on stu.class_id = class.id
group by class_id
having count(stu.id) > 2;

# left join && right join
# 获取没有设置QQ的用户
SELECT sname, class_id
FROM stu
         LEFT JOIN stu_info
                   ON stu.id = stu_info.stu_id
WHERE stu_info.qq is null;

# 查找所有没有发表文章的同学
select sname, stu.id
from stu
         left join article
                   on stu.id = article.stu_id
where article.title is null;

# 哪个班级没有学生
select class.cname, class.id
from stu
         right join class
                    on stu.class_id = class.id
where stu.class_id is null;

# 每个班级的平均年龄
select round(avg(timestampdiff(year, birthday, now()))) as age
from stu
         inner join class
                    on stu.class_id = class.id
group by class_id;

# 查找学生所在班级，没有班级的学生显示无
select stu.sname, ifnull(class.cname, "无")
from stu
         left join class
                   on stu.class_id = class.id;


#  SELF JOIN
# 查找后盾人的同班同学
# 子查询
select stu.sname, class_id
from stu
where class_id = (select class_id from stu where stu.sname = "后盾人")
  AND stu.sname != "后盾人";
# 自连接
SELECT s1.sname, s2.sname
FROM stu as s1
         INNER JOIN stu as s2
                    ON s1.class_id = s2.class_id
WHERE s1.sname = '后盾人'
  AND s2.sname != '后盾人';

# 查找与后盾人同年出生的同学
# 子查询
select sname
from stu
where year(birthday) = (select year(birthday) from stu where sname = "后盾人")
  AND sname != "后盾人";
# 自连接
select s1.sname, s1.birthday, s2.sname, s2.birthday
from stu as s1
         inner join stu as s2 on YEAR(s1.birthday) = YEAR(s2.birthday)
where s1.sname = "后盾人"
  AND s2.sname != "后盾人";

# 查找比后盾人大的同学
# 子查询
select sname, birthday
from stu
where birthday < (select birthday from stu where sname = "后盾人");
# 自连接
select s2.sname, s2.birthday
from stu as s1
         inner join stu as s2 on s1.birthday > s2.birthday
where s1.sname = "后盾人"
  AND s2.sname != "后盾人";

# 多对多(使用中间表)
# 查找后盾人学习的课程
SELECT sname, lesson.name
FROM stu
         inner join stu_lesson
                    on stu.id = stu_lesson.stu_id
         inner join lesson
                    on stu_lesson.lesson_id = lesson.id
where sname = "后盾人";

# 哪个班级的同学最爱学习 PHP
select class.cname, count(*)
from stu
         inner join stu_lesson
                    on stu.id = stu_lesson.stu_id
         inner join lesson
                    on stu_lesson.lesson_id = lesson.id
         inner join class
                    on stu.class_id = class.id
where lesson.id = 1
GROUP BY class.cname
ORDER BY count(*) desc
limit 1;

#UNION
# UNION 用于连接多个查询结果，要保证每个查询返回的列的数量与顺序要一样。
# 查询年龄最大与最小的同学
    (SELECT sname, birthday FROM stu ORDER BY birthday DESC LIMIT 1)
    UNION
    (SELECT sname, birthday from stu ORDER BY birthday ASC LIMIT 1)
    ORDER BY birthday DESC;

#最新发表的文章和学习的课程组成动态数据
(SELECT CONCAT(stu.sname, '发表了文章：', article.title)
 from article
          INNER JOIN stu
                     ON stu.id = article.stu_id
 LIMIT 2)
UNION
(SELECT CONCAT(stu.sname, '正在学习：', lesson.name)
 FROM stu
          INNER JOIN stu_lesson
          INNER JOIN lesson
                     ON stu.id = stu_lesson.stu_id AND stu_lesson.lesson_id = lesson.id
 LIMIT 2);

#  Exists
# Exists(子查询)
# 哪些学生没有课程
select stu.sname
from stu
where not exists(select * from stu_lesson where stu.id = stu_lesson.stu_id);

# 学习的课程数量>=2个的学生
select *
from stu
where exists(select id from stu_lesson where stu.id = stu_lesson.stu_id group by stu.id HAVING count(*) >= 2);

# 性别是男生并且设置了QQ号的同学
select *
from stu
where sex = 1
  and exists(select * from stu_info where stu.id = stu_info.id AND stu_info.qq is not null );