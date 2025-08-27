# 19.3 执行存储过程
call AddNewProduct('JTS01', 'Stuffed Eiffel Tower',
    6.49, 'Plush stuffed toy with the text La Tour Eiffel in red white and blue');
# 19.4 创建存储过程
drop procedure if exists AddNewProduct;
create procedure AddNewProduct(
    inNewProdID char(10),
    inNewProdName char(50),
    inNewProdPrice decimal(10,2),
    inNewProdDesc varchar(1000)
)
begin
    insert into Products values (inNewProdID, 'BRE02', inNewProdName, inNewProdPrice, inNewProdDesc);
end;

drop procedure if exists NewOrder;
create procedure NewOrder (
IN p_cust_id char(10),
OUT p_order_num int
)
begin
    declare v_max_order_num int;

    select coalesce(max(order_num), 0) INTO v_max_order_num from Orders;

    set p_order_num = v_max_order_num + 1;

    insert into Orders(order_num, order_date, cust_id) values (p_order_num, now(), p_cust_id);
end;

call NewOrder('1000000003', @order_num);
select @order_num as '新订单号';