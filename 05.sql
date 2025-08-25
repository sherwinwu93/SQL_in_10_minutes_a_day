# 5.1 组合where子句
# 5.1.1 AND
select prod_id, prod_price, prod_name from Products
where vend_id = 'DLL01' and prod_price <= 4
order by prod_id;
# 5.1.2 OR
select prod_id, prod_price, prod_name from Products
where vend_id = 'DLL01' or vend_id = 'BRS01';

# 5.1.3 求值顺序 and优先级>OR
select prod_name, prod_price from Products
where vend_id = 'DLL01' or vend_id = 'BRS01' and prod_price >= 10;
select prod_name, prod_price from Products
where (vend_id = 'DLL01' or vend_id = 'BRS01') and prod_price >= 10;
# 5.2 IN
select prod_name, prod_price from Products
where vend_id in ('DLL01', 'BRS01')
order by prod_name;
# IN 实际和 OR相似,比OR性能更好
#  最大优点,可以包含其他SELECT语句
select prod_name, prod_price from Products
where vend_id = 'DLL01' or vend_id = 'BRS01';

# 5.3 NOT
select prod_name from Products
where not vend_id = 'DLL01'
order by prod_name;
select prod_name from Products
where vend_id <> 'DLL01'
order by prod_name;

# 5.5
# 5.5.1
select vend_name from Vendors
where vend_country = 'USA' and vend_state = 'CA';
# 5.5.2
select order_num, prod_id, quantity from OrderItems
where quantity >= 100 and prod_id in ('BR01', 'BR02', 'BR03');
# 5.5.3
select prod_name, prod_price from Products
where prod_price between 3 and 6
order by prod_price;
# 5.5.4
select vend_name from Vendors
where vend_country = 'USA' and vend_state = 'CA'
order by vend_name;
