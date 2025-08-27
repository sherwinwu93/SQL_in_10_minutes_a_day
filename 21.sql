# 21.2.1 创建游标
DECLARE CustCursor cursor for select * from Customers
where cust_email is null;