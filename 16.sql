# 更新
update Customers
set cust_email = 'kim@thetoystore.com',
    cust_contact = null
where cust_id = 1000000005;
update Customers
set cust_contact = 'Sam Roberts',
    cust_email = 'sam@toyland.com'
where cust_id = 1000000006;
# 删除
delete from Customers
where cust_id = 1000000006;

# 16.5.1
update Vendors
set vend_state = upper(Vendors.vend_state)
where vend_country = 'USA';
update Customers
set cust_state = upper(Customers.cust_state)
where cust_country = 'USA';
# 16.5.2
select * from Customers
# delete from Customers
where cust_id = 1000000007;
