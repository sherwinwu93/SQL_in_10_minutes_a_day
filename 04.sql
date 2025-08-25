# 4.1 使用where
select prod_name, prod_price from Products
where prod_price = 3.49;

# 4.2 where子句操作符
# =, <>, !=
# <, <=, !<, >, >=, !>, between, is null
# 4.2.1
select prod_name, prod_price from Products
where prod_price < 10;
select prod_name, prod_price from Products
where prod_price <= 10;
# 4.2.2
select vend_id, prod_name
from Products
where vend_id <> 'DLL01';
select vend_id, prod_name
from Products
where vend_id != 'DLL01';
# 4.2.3 范围值检查, between 是包含边界的
select prod_name, prod_price
from Products
where prod_price between 5 and 10;
# 4.2.4 空值检查, 空值与null和''不同
select prod_name from Products
where prod_price is null;
select cust_name from Customers
where cust_email is null;
# 4.4
# 4.4.1
select prod_id, prod_name from Products
where prod_price = 9.49;
# 4.4.2
select prod_id, prod_name from Products
where prod_price >= 9;
# 4.4.3
select distinct order_num from OrderItems
where quantity >= 100;
# 4.4.4
select prod_name, prod_price from Products
where prod_price between 3 and 6
order by prod_price;
