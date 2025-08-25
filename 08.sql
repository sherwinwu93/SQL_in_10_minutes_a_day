# 8.2.1 文本处理函数
select vend_name, UPPER(vend_name) as vend_name_upcase
from Vendors
order by vend_name;
select LEFT('Wusd', 1);
select length('Wusd');
select lower('Wusd');
select ltrim('   Wusd');
select right('Wusd', 2);
select rtrim('Wusd   ');
select substr('Wusd', 4, 2);
# soundex听起来像: smith和Smyth相同
select soundex('Wusd');
select upper('Wusd');
select cust_name, cust_contact from Customers
where soundex(cust_contact) = soundex('Michael Green');
# 8.2.2 日期和时间函数
# APP不使用日期时间格式,各个数据库处理又不相同导致移植性很差
select order_num from Orders
where YEAR(order_date) = '2020';

# 8.2.3 数值处理函数
# 绝对值
select abs('-1');
# 余铉
select cos(2);
# 指数值
select exp(2);
# PI
select pi();
# 正炫值
select sin(1);
# 平方根
select sqrt(9);
# 正切
select tan(2);

# 8.4
## 8.4.1
select cust_id, cust_name, upper(concat(left(cust_name, 2), left(cust_city, 3))) user_login
from Customers;
## 8.4.2
select order_num, order_date from Orders
where year(order_date) = '2020' and month(order_date) = '01'
order by order_date;
