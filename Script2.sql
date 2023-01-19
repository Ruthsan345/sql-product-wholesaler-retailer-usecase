-----Product table----

create table product(
id int not null primary key,
product_id varchar(20) not null,
product_name varchar(30) not null,
product_stock int not null,
product_gst_percentage int not null,
product_price int not null,
product_current_hold varchar(11) not null,
product_bought_from_id int null,
product_current_hold_id int null,
foreign key (product_current_hold_id) references wholesaler(id),
foreign key (product_current_hold_id) references retailer(id)
)

create table wholesaler(
id int not null primary key,
wholesaler_id varchar(20) not null,
wholesaler_name varchar(30) not null
)

create table retailer(
id int not null primary key,
retailer_id varchar(20) not null,
retailer_name varchar(20) not null
)

create table discount(
id int not null primary key,
discount_id varchar(20) not null,
discount_product_id int not null,
discount_for varchar(11) not null,
discount_quantity_from int not null,
discount_quantity_to int not null,
discount_percentage	int not null,
foreign key (discount_product_id) references product(id)
)

insert into wholesaler values(1,'whole_111','wholesaler A');
insert into wholesaler values(2,'whole_112','wholesaler B');
insert into wholesaler values(3,'whole_113','wholesaler C');

insert into retailer values(1,'retailer_10101','retailer A');
insert into retailer values(2,'retailer_10202','retailer B');
insert into retailer values(3,'retailer_10303','retailer c');

insert into product values(1,'product_101','iphone 12 max', 200, 18, 90000, 'WHOLESALER',null,1);
insert into product values(2,'product_102','Apple mac m2', 400, 18, 190000, 'WAREHOUSE',null,null);
insert into product values(3,'product_103','Samsung fold z', 100, 18, 40000, 'RETAILER',1,1);

insert into discount values(1,'discount_10303',1,'WHOLESALER',10,30,5);
insert into discount values(2,'discount_10303',2,'RETAILER',30,50,5);
insert into discount values(3,'discount_10303',1,'WHOLESALER',50,100,20);


select * from product;
select * from wholesaler;
select * from retailer;

update product set product_name ='samsung galaxy fold z' where id =3;

select product_name, count(1) from product group by 1 ;


select p.product_name, p.product_stock, p.product_price, w.wholesaler_name, r.retailer_name 
from product p, retailer r, wholesaler w 
where p.product_current_hold= 'RETAILER' and p.product_bought_from_id=w.id and r.id = p.product_current_hold_id;


drop table discount;






