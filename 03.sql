# 3.1 排序. 如果没有加排序语句,那么数据的顺序
select prod_name from Products
order by prod_name;

# 3.2 按多个列排序
select prod_id, prod_price, prod_name from Products
order by prod_price, prod_name;