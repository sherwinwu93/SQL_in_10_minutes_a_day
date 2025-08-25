# 6.1 通配符
# 6.1.1 %
### !!! like '%'搜索不出null值
select prod_id, prod_name
from Products
where prod_name like 'Fish%';
select prod_id, prod_name
from Products
where prod_name like '%bean bag%';
select prod_name
from Products
where prod_name like 'F%y';
# 6.1.2 _只有单个字符
select prod_id, prod_name from Products
where prod_name like '__ inch teddy bear';

# 6.1.3 方括号通配符,类似于正则. 并不行,mysql不支持
select cust_contact from Customers
where cust_contact LIKE '[^JM]%'
order by cust_contact;

# 通配符注意
# 1. 尽量不用
# 2. 不要放在开始处
# 3. 小心使用

# 6.4
# 6.4.1
select prod_name, prod_desc from Products
where prod_name like '%toy%';
# 6.4.2
select prod_name, prod_desc from Products
where not prod_desc like '%toy%';
# 6.4.3
select prod_name, prod_desc from Products
where prod_desc like '%toy%' or prod_desc like '%carrots%';
# 6.4.4
select prod_name, prod_desc from Products
where prod_desc like '%toy%carrots%';