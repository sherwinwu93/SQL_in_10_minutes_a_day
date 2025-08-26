# 12
# 12.1
# 12.2 where等值联结 简单格式
select vend_name, prod_name, prod_price
from Vendors,
     Products
where Vendors.vend_id = Products.vend_id;
# 12.2.1
# 没用where语句,表1和表2的每一行都相互配对,笛卡尔积
# 12.2.2 内连接 标准格式
select vend_name, prod_name, prod_price
from Vendors
         inner join Products on Vendors.vend_id = Products.vend_id;
# 12.2.3 联结多个表
# 性能: 联的表越多,性能越差
#
select prod_name, vend_name, prod_price, quantity
from OrderItems,
     Products,
     Vendors
where Products.vend_id = Vendors.vend_id
  and OrderItems.prod_id = Products.prod_id
  and order_num = 20007;
# 子查询 转 连表查
# 谁的性能更好,不确定,多做实验
select cust_name, cust_contact
from Customers
where cust_id in
      (select cust_id
       from Orders
       where order_num in
             (select order_num from OrderItems where prod_id = 'RGAN01'));
select cust_name, cust_contact
from Customers,
     Orders,
     OrderItems
where Customers.cust_id = Orders.cust_id
  and Orders.order_num = OrderItems.order_num
  and OrderItems.prod_id = 'RGAN01';
# 12.4
# 12.4.1
select cust_name, order_num
from Customers,
     Orders
where Customers.cust_id = Orders.cust_id
order by order_num;
select cust_name, order_num
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
order by order_num;
# 12.4.2
select cust_name, Orders.order_num, sum(item_price * quantity) order_total
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
         inner join OrderItems on Orders.order_num = OrderItems.order_num
group by cust_name, Orders.order_num
order by order_num;
select cust_name,
       order_num,
       (select sum(item_price * quantity)
        from OrderItems
        where Orders.order_num = OrderItems.order_num) order_total
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
order by order_num;
# 12.4.3
select cust_id, order_date
from OrderItems
         inner join Orders on OrderItems.order_num = Orders.order_num
where prod_id = 'BR01'
order by order_date;
# 12.4.4 因为买这个产品的客户只有一次,所以不需要去重
select cust_email
from Customers
where cust_id in (select cust_id
                  from Orders
                  where order_num in (select order_num
                                      from OrderItems
                                      where prod_id = 'BR01'));
select cust_email
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
         inner join OrderItems on Orders.order_num = OrderItems.order_num
where prod_id = 'BR01';
# 12.4.5
select cust_name, Orders.order_num, sum(item_price * quantity) order_total
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
         inner join OrderItems on Orders.order_num = OrderItems.order_num
group by cust_name, Orders.order_num
having sum(item_price * quantity) > 1000
order by cust_name;
