create database data_digger;

use data_digger;

create table Customers(
	customer_id int primary key,
    customer_name varchar(50),
    customer_email varchar(50),
    customer_address varchar(100)
);

insert into Customers(customer_id, customer_name, customer_email, customer_address)
values (1,"Alice","alice@example.com","kids park,4"),
(2,"Bob","bob@example.com","city bank,1"),
(3,"John","john@example.com","city hospital,5"),
(4,"Alice","alice1@example.com","kids school,2"),
(5,"Jack","jack@example.com","city museum,3");

insert into Customers(customer_id, customer_name, customer_email, customer_address)
values(6,"Mark","mark@example.com","city office,6");

select* from Customers;

update Customers
set customer_address = "town hall,5"
where customer_id = 3;

delete from customers
where customer_id = 6;

select customer_name from Customers
where customer_name = "Alice";

create table Orders(
	order_id int auto_increment primary key,
	customer_id int,
    order_date date,
    total_amount decimal(10,2)
);

alter table Orders
add constraint customer_id1
foreign key (customer_id) references Customers(customer_id);

insert into Orders(customer_id,order_date,total_amount)
values(1,"2025-09-18",2500),
(2,"2025-08-15",1500),
(1,"2025-08-25",1200),
(3,"2025-09-05",1000),
(4,"2025-08-23",3000),
(2,"2025-09-15",500),
(1,"2025-08-10",500);

select * from Orders
where customer_id = 1;

update Orders
set total_amount = total_amount + (total_amount*10 )/100;

delete from Orders
where customer_id = 1;

select * from Orders
where order_date > "2025-08-29";

select max(total_amount) as Highest, min(total_amount) as Lowest, avg(total_amount) as Average
from Orders;

create table Products(
	product_id int auto_increment primary key,
	product_name varchar(100),
    price decimal(10,2),
    stock int
);

insert into Products(product_name,price,stock)
values("Smart TV",45000,5),
("Smart phone",25000,10),
("Smart watch",2000,12),
("Washing machine",35000,20),
("Micro wave",10000,0),
("Head phone",2500,15);

select * from Products
order by product_name desc;

update Products
set price = 2000
where product_name = "Head phone";

delete from Products
where stock = 0;

select product_name from Products
where price > 500 and price < 2000;

select  max(price) as expensive, min(price) as cheapest
from Products;



create table OrderDetails(
	orderdetail_id int auto_increment primary key,
    orderid int,
    productid int,
    quantity int,
    sub_total decimal(10,2),
    foreign key (orderid) references Orders(order_id),
    foreign key (productid) references Products(product_id)
);

insert into OrderDetails(orderid, productid, quantity, sub_total)
values(2, 1, 1, 45000),
(4, 2, 2, 50000),
(2, 3, 1, 2000),
(5,2,5,50000),
(6,1,3,25000);

select *  from orderdetails
where orderid = 2;

select sum(sub_total) as total_revenue
from orderdetails;

select orderid, sum(quantity) as total_ordered
from OrderDetails
group by orderid
order by total_ordered desc limit 3;

select productid, count(productid) as total_sold
from orderdetails
group by productid;
