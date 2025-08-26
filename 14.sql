# 14 组合查询
## 14.1 组合查询 1.从不同表查数据 2.一个表多个查询,按一个查询返回数据
## 14.2.1 使用union
select cust_name, cust_contact, cust_email
from Customers
where cust_state in ('IL', 'IN', 'MI');
select cust_name, cust_contact, cust_email
from Customers
where cust_name = 'Fun4All';
# union 和union all的区别在于会不会去除重复的
select cust_name, cust_contact, cust_email
from Customers
where cust_state in ('IL', 'IN', 'MI')
union
select cust_name, cust_contact, cust_email
from Customers
where cust_name = 'Fun4All';
## 14.2.4 排序
select cust_name, cust_contact, cust_email
from Customers
where cust_state in ('IL', 'IN', 'MI')
union
select cust_name, cust_contact, cust_email
from Customers
where cust_name = 'Fun4All'
order by cust_name, cust_contact;

# 14.4.1
select prod_id, quantity from OrderItems
         where quantity = 100
union
select prod_id, quantity from OrderItems
    where prod_id like 'BNBG%'
order by prod_id;
# 14.4.2
select prod_id, quantity from OrderItems
where quantity = 100 or prod_id like 'BNBG%'
order by prod_id;
# 14.4.3
select prod_name from Products
union
select cust_name from Customers
order by prod_name;
# 14.4.4
select *
from Customers
union
select *
from Customers

