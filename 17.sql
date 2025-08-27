# 17 创建和操作表
# 17.1 新建表
#    not null不允许为null
#    primary key 主键
#    default 1 默认值,经常用current_date()
drop table if exists ProductsNew;
create table ProductsNew
(
    prod_id    char(10)      not null primary key,
    vend_id    char(10)      not null,
    prod_name  char(254)     not null,
    prod_price decimal(8, 2) not null,
    prod_desc  varchar(1000) null default 'No description'
);

create table OrderItemsNew
(
    order_num  integer       not null,
    order_item integer       not null,
    prod_id    char(10)      not null,
    quantity   integer       not null default 1,
    item_price decimal(8, 2) not null
);
# 17.2 更新表
alter table Vendors
    add vend_phone char(20);
# 17.3 删除表
# drop table CustCopy;
# 17.4 重命名表
rename table CustNew to CustNew2;
rename table CustNew2 to CustNew;
# 17.6.1
alter table Vendors
    modify vend_web char(100);
# 17.6.2
update Vendors
set vend_web = 'http://www.BRE02.com'
# select * from Vendors
where vend_id = 'BRE02';
