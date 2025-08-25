# 9.1 聚合函数
# 9.1.1 avg() 平均值
select avg(prod_price) as avg_price
from Products
where vend_id = 'DLL01';
# 9.1.2 count() 行数
# 有值的全部返回
select count(*) as num_cust
from Customers;
# 只有有email的才会全部返回,null则不会计数
select count(cust_email) as num_cust
from Customers;
# 最大值
select max(prod_price) as max_price
from Products;
# 最小值
select min(prod_price) as min_price
from Products;
# 求和
select sum(quantity) as items_ordered
from OrderItems
where order_num = 20005;
select sum(item_price * quantity) as total_price
from OrderItems
where order_num = 20005;
# 9.2 聚合不同值
select avg(distinct prod_price) as avg_price
from Products
where vend_id = 'DLL01';
select avg(prod_price) as avg_price
from Products
where vend_id = 'DLL01';
# 9.3 组合聚合函数
select count(*) as num_items,
       min(prod_price) as price_min,
       max(prod_price) as price_max,
       avg(prod_price) as price_avg
from Products;
# 9.5
# 9.5.1
select sum(quantity) as quantity_sold from OrderItems;
# 9.5.2
select sum(quantity) as quantity_sold from OrderItems
where prod_id = 'BR01';
# 9.5.3
select max(prod_price) as max_price from Products
where prod_price <= 10;
