-- 显示支持的字符集
show CHARACTER SET;
-- 排序规则  _ci 不区分大小写
-- _bin 区分大小写
select * from stu order by name asc;

-- 常用字符串函数 left(name,2):表示对name字段从左边开始取两个字符; right,
-- mid(name,2,1) 表示对name字段从中间开始取第二位数字代表开始选取位置(开始为1)，第三位数字代表结束位置
select left(name,2) from stu;
select mid(name,1,3) from stu;

-- 拼接函数concat()
update stu set name = concat("https://",mid(name,1)) where id > 15; 
select concat("编号为",id) as id,concat("年龄为",age) from stu;

-- 截取字符函数substring()
select substring(name,2,4) from stu; -- 从第二个开始，截取四个

-- char_length(name)字符串字符长度函数
select char_length(name) from stu; 

-- if(条件，成立则执行，不成立则执行)
-- 超过8个字符的以...显示
select if(char_length(name)>8,concat(left(name,8),'...'),name) from stu;

-- 正则表达式匹配regexp;
select * from stu where name regexp "^.朱"; -- 匹配第二个字符为“朱”的
-- like匹配 %表示匹配任意字符
select * from stu where name like "%明%";
-- replace替换；
update stu set name = replace (name,name,concat("网址为:",name))
where name regexp '\.com$';

