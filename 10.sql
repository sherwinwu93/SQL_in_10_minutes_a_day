# 10.1 数据分组
select count(*) as num_prods
from Products
where vend_id = 'DLL01';
# 10.2 创建分组
# count(*)对每个vend_id进行计算
select vend_id, count(*) as num_prods
from Products
group by vend_id;

# 10.3 过滤分组
#  不能用where,因为group by没有行.所以要用having
select cust_id, count(*) as orders
from Orders
group by cust_id
having count(*) >= 2;

select vend_id, count(*) as products
from Products
where prod_price >= 4
group by vend_id
having count(*) >= 2;

# 10.4 分组和排序
# 数量大于等于3的订单号和数量
select order_num, count(*) as items
from OrderItems
group by order_num
having count(*) >= 3;
# 数量大于等于3的订单号和数量,且按数量升序,订单升序
select order_num, count(*) as items
from OrderItems
group by order_num
having count(*) >= 3
order by items, order_num;

# 10.5 select子句顺序

# 10.7
### 10.7.1
select order_num, count(*) order_lines
from OrderItems
group by order_num
order by order_lines;
### 10.7.2
select vend_id, min(prod_price) cheapest_item from Products
group by vend_id
order by cheapest_item;
### 10.7.3
select order_num, sum(quantity) quantity_ordered from OrderItems
group by order_num
having sum(quantity) >= 100;
### 10.7.4
select order_num, sum(item_price * quantity) total_price from OrderItems
group by order_num
having sum(item_price * quantity)
order by total_price, order_num;
### 10.7.5
select order_num, count(*) as items
from OrderItems
group by order_num
having count(*) >= 3
order by items, order_num;
