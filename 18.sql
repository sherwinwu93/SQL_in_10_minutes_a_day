# 18 视图
# 18.2 创建视图
drop view if exists ProductCustomers;
create view ProductCustomers as
select cust_name, cust_contact, prod_id
from Customers,
     Orders,
     OrderItems
where Customers.cust_id = Orders.cust_id
  and OrderItems.order_num = Orders.order_num;
# 18.2.1 利用视图简化复杂的连表
select cust_name, cust_contact
from ProductCustomers
where prod_id = 'RGAN01';
# 18.2.2 用视图格式化数据
select CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')') as vend_title
from Vendors
order by vend_name;
create view VendorLocations as
select CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')') as vend_title
from Vendors;
select *
from VendorLocations
order by vend_title;
# 18.2.3 用视图过滤不想要的数据
create view CustomerEmailList as
select cust_id, cust_name, cust_email
from Customers
where cust_email is not null;
select * from CustomerEmailList
where cust_id = 1001;
# 18.2.4 使用视图与计算字段
select prod_id,
       quantity,
       item_price,
       quantity * item_price as expanded_price
from OrderItems
where order_num = 20008;
create view OrderItemsExpanded as
select order_num,
       order_item,
       prod_id,
       quantity,
       item_price,
       quantity * item_price as expanded_price
from OrderItems;
select * from OrderItemsExpanded
where order_num = 20008;

# 18.4.1
create view CustomersWithOrders as
select Customers.*
from Customers
inner join Orders on Customers.cust_id = Orders.cust_id;

select * from CustomersWithOrders;

# 18.4.2
drop view if exists OrderItemsExpanded;
create view OrderItemsExpanded as
    select order_num,
           prod_id,
           quantity,
           item_price,
           quantity * item_price as expanded_price
from OrderItems
order by order_num;
