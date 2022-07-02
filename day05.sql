-- 数值类型
alter table stu add status tinyint;
-- 无符号类型
alter table stu add stat tinyint unsigned;

-- int(5)代表只显示5位数,可以输入很多位数
alter table stu modify status int(5) zerofill;

-- 枚举属性 enum
alter table stu modify sex enum("男","女") default null;
insert into stu (name,class_id,sex) values("小芳",2,"女");

create table article select * from stu;
-- 设置字段为set类型
alter table article add flag set("推荐","置顶","热门","图文");
insert into article (name,flag) values("yonyou.com","置顶,图文,热门");
insert into article (name,flag) values("yonbip.com","置顶,推荐");

-- find_in_set 查找set
select * from article where find_in_set("置顶",flag); 
-- like查找
select * from article where flag like '%推荐%';
-- =查找 (精准匹配,顺序错了都不行)
select * from article where flag = '推荐,置顶';