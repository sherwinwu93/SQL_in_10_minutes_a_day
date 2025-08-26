# 13.1 表别名
select cust_name, cust_contact
from Customers as C,
     Orders as O,
     OrderItems as OI
where C.cust_id = O.cust_id
  and OI.order_num = O.order_num
  and prod_id = 'RGAN01';
# 13.2 不同连接
## 13.2.1 自连接
select cust_id, cust_name, cust_contact
from Customers
where cust_name = (select cust_name from Customers where cust_contact = 'Jim Jones');
select c1.cust_id, c1.cust_name, c1.cust_contact
from Customers as c1,
     Customers as c2
where c1.cust_name = c2.cust_name
  and c2.cust_contact = 'Jim Jones';
## 13.2.2 自然连接
select C.*, O.order_num, O.order_date, OI.prod_id, OI.quantity, OI.item_price
from Customers as C,
     Orders as O,
     OrderItems as OI
where C.cust_id = O.cust_id
  and OI.order_num = O.order_num
  and prod_id = 'RGAN01';
## 13.2.3 外联结
# 所有顾客及其订单
select Customers.cust_id, Orders.order_num
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id;
select Customers.cust_id, Orders.order_num
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id;
select Customers.cust_id, Orders.order_num
from Customers
         right join Orders on Customers.cust_id = Orders.cust_id;
# mysql不支持
# select Customers.cust_id, Orders.order_num
# from Customers
#          full outer join Orders on Customers.cust_id = Orders.cust_id;
# 13.3 带聚合的连表
select Customers.cust_id, count(Orders.order_num) as num_ord
from Customers
inner join Orders on Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;
select Customers.cust_id, count(Orders.order_num) as num_ord
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;
# 13.6
## 13.6.1
select Customers.cust_id, Orders.order_num
from Customers
inner join Orders on Customers.cust_id = Orders.cust_id
order by Customers.cust_id, Orders.order_num;
## 13.6.2
select Customers.cust_id, Orders.order_num
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id
order by Customers.cust_id, Orders.order_num;
## 13.6.3
select prod_name, order_num
from Products
    left join OrderItems on Products.prod_id = OrderItems.prod_id
order by prod_name, order_num;
## 13.6.4
select prod_name, count(order_num) as num_ord
from Products
         left join OrderItems on Products.prod_id = OrderItems.prod_id
group by prod_name
order by prod_name;
## 13.6.5
select Vendors.vend_id, count(Products.prod_id) as num_prods
from Vendors
left join Products on Vendors.vend_id = Products.vend_id
group by Vendors.vend_id;
