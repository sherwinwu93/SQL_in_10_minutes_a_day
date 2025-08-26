# 15.1.1 插入完整行, 如果没有则null填充
delete from Customers where cust_id = 1000000006;
insert into Customers
values (1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA', null, null);
# 总是使用这个,因为即便表结构发生了变化,依然能正确执行
insert into Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
values (1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA', null, null);
# 15.1.2 拆入部分行
insert into Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
values (1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA');
# 15.1.3 插入查询出的数据
insert into Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
select cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country
from CustNew;
# 15.2 从一个表复制到另一个表(完全), 也可以使用where子句
create table CustCopy as select * from Customers;
# 15.4.1
insert into Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
values (1000000007, 'Sherwin Wu', '123 Any Street', 'California', 'CA', '11111', 'USA', null, null);

# 15.4.2
create table OrdersCopy as select * from Orders;
create table OrderItemsCopy as select * from OrderItems;
