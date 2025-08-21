# 2.2 单个列
# 未排序; 分号结束; 大小写不敏感;无视空格
select prod_name from Products;

# 2.3 多个列
select prod_id, prod_name, prod_price from Products;

# 2.4 所有
# 除非有需要,否则不用*查所有
select * from Products;

# 2.5 检索不同的值
select vend_id from Products;
select distinct vend_id from Products;
# distinct作用于所有列,不能只用于某一列
select distinct vend_id, prod_price from Products;
select vend_id, prod_price from Products;

# 2.6 限制结果,只返回前5行的值
select prod_name from Products limit 5;
# 从索引5开始,只返回5行. 第一个数是返回的行数, 第二个数是从哪行开始
select prod_name from Products limit 5 offset 5;

# 2.7 注释 /**/ # --

# 2.9 习题
# 2.9.1
select cust_id from Customers;
# 2.9.2
select distinct prod_id from OrderItems;
# 2.9.3
select * from Customers;
select cust_id from Customers;

