# 17 创建和操作表
# 新建表
#    not null不允许为null
#    primary key 主键
#    default 1 默认值,经常用current_date()
drop table if exists ProductsNew;
create table ProductsNew (
    prod_id char(10) not null primary key,
    vend_id char(10) not null,
    prod_name char(254) not null,
    prod_price decimal(8,2) not null,
    prod_desc varchar(1000) null default 'No description'
);

create table OrderItemsNew (
    order_num integer not null,
    order_item integer not null,
    prod_id char(10) not null,
    quantity integer not null default 1,
    item_price decimal(8,2) not null
);