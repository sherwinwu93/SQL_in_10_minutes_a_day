# 3.1 排序. 如果没有加排序语句,那么数据的顺序
select prod_name from Products
order by prod_name;

# 3.2 按多个列排序
select prod_id, prod_price, prod_name from Products
order by prod_price, prod_name;

# 3.3 按列位置排序
select prod_id, prod_price, prod_name
from Products
order by 2, 3;

# 3.4 指定排序方向
select prod_id, prod_price, prod_name from Products
order by prod_price desc, prod_name;

# 3.6
# 3.6.1
select cust_name from Customers
order by cust_name desc;

# 3.6.2
select cust_id, order_num from Orders
order by cust_id, order_num desc;

# 3.6.3
select order_num, item_price from OrderItems
order by order_num desc, item_price desc;

# 3.6.4
select vend_name from Vendors
order by vend_name desc;
