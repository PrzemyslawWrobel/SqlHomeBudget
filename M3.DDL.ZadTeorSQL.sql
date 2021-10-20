create schema training

alter schema training rename to training_zs


create table training_zs.products (
id int,
production_qty numeric (50, 2), 
product_name varchar (100),
product_code varchar (10),
description text,
manufacturing_date date
)

alter table training_zs.products add primary key (id)

drop table if exists products

create table training_zs.sales (
id int primary key,
sales_date timestamp not null,
sales_amount numeric (38, 2), 
sales_qty numeric (10, 2),
product_id int,
added_by text default ('admin'),
constraint sales_over_1k check (sales_amount > 1000)
)

alter table training_zs.sales add foreign key (product_id) references training_zs.products(id) on delete cascade

drop schema training_zs cascade