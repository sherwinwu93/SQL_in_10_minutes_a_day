# 20.2 控制事务处理
# 开始事务
start transaction;
# 提交事务
commit;
# 回滚事务
rollback;
# 20.2.1 使用ROLLBACK
drop table if exists  CustCopy;
create table CustCopy as select * from Customers;
start transaction;
DELETE FROM CustCopy where 1=1;
rollback;