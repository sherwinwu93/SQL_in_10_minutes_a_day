# 7.1 拼接
# mysql不支持+
# select vend_name + '(' + vend_country + ')'
# mysql不支持||
# select vend_name || '(' || vend_country || ')'
select concat(vend_name, '(', vend_country, ')')
# select
#     vend_name
from Vendors
order by vend_name;
# 7.2 去除右空格
select concat(rtrim(vend_name), '(', rtrim(vend_country), ')') as vend_title
from Vendors
order by vend_name;

# 7.3 算术计算
select prod_id, quantity, item_price
from OrderItems
where order_num = 20008;
select prod_id, quantity, item_price, quantity * item_price as expanded_price
from OrderItems
where order_num = 20008;
# 测试语句,可以校验语句
select Trim(' abc ');
select curdate();

# 7.5
## 7.5.1
select vend_id, vend_name as vname, vend_address as vaddress, vend_city
from Vendors
order by vname;
## 7.5.2
select prod_id, prod_price, prod_price * 0.9 as sale_price
from Products;
