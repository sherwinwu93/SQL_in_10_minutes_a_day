# 11.2 利用子查询进行过滤
select order_num
from OrderItems
where prod_id = 'RGAN01';
select cust_id
from Orders
where order_num in (20007, 20008);
select cust_name, cust_contact
from Customers
where cust_id in (1000000004, 1000000005);
# 子查询从内到外处理
select cust_id
from Orders
where order_num in (select order_num
                    from OrderItems
                    where prod_id = 'RGAN01');
select cust_name, cust_contact
from Customers
where cust_id in (select cust_id
                  from Orders
                  where order_num in (select order_num
                                      from OrderItems
                                      where prod_id = 'RGAN01'));
# 11.3 作为计算字段使用子查询
select cust_name,
       cust_state,
       (select count(*) from Orders where Orders.cust_id = Customers.cust_id) as orders
from Customers
order by cust_name;
# 错误示例
select cust_name,
       cust_state,
       (select count(*) from Orders /*这里会总为全部*/ where cust_id = cust_id) as orders
from Customers
order by cust_name;

# 11.5
## 11.5.1
select cust_id
from Orders
where order_num in (select order_num
                    from OrderItems
                    where item_price >= 10);
## 11.5.2
select cust_id, order_date
from Orders
where order_num in (select order_num
                    from OrderItems
                    where prod_id = 'BR01')
order by order_date;
## 11.5.3
select cust_email
from Customers
where cust_id in (select cust_id
                  from Orders
                  where order_num in (select order_num
                                      from OrderItems
                                      where prod_id = 'BR01'));
## 11.5.4
select cust_id,
       ifnull((select sum(quantity * item_price)
               from OrderItems
               where order_num in (select order_num from Orders where cust_id = Customers.cust_id)), 0) total_ordered
from Customers
order by total_ordered;

## 11.5.5
select prod_name,
       ifnull((select sum(quantity) from OrderItems where prod_id = Products.prod_id),0) quant_sold
from Products;
