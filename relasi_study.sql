show databases;

create database relasi_study;

use relasi_study;
show tables;

create table pelanggan(
	id_pelanggan INT PRIMARY KEY,
	name_pelanggan VARCHAR(100),
	email VARCHAR(100)
);

create table pesanan(
	id_pesanan INT PRIMARY KEY,
	id_pelanggan INT,
	tanggal_pesanan DATE,
	total_harga decimal(10,2),
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);


insert into pelanggan(id_pelanggan, name_pelanggan, email)
values 	(1, 'Ismail Nur A', 'ismail@ismail.com'),
		(2, 'Jhon Doe', 'jhon@ismail.com');

select * from pelanggan;

insert into pesanan(id_pesanan, id_pelanggan, tanggal_pesanan, total_harga)
values 	(1, 1, '2023-06-13', 100.00),
		(2, 1, '2023-06-13', 150.00),
		(3, 2, '2023-06-14', 200.00),
		(4, 2, '2023-06-14', 250.00);
		
select * from pesanan p ;

-- Gunakan perintah berikut untuk menggabungkan tabel "Pelanggan" dan "Pesanan" menggunakan JOIN:

select pelanggan.name_pelanggan, pesanan.tanggal_pesanan, pesanan.total_harga from pelanggan join pesanan on pelanggan.id_pelanggan = pesanan.id_pelanggan ;

-- Belajar One to Many

create table category(
	category_id INT PRIMARY KEY,
	category_name VARCHAR(225)
);

create table product(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(255),
	price DECIMAL(10,2),
	category_id INT,
	FOREIGN KEY (category_id) REFERENCES category(category_id)
);

insert into category
values (2, 'Bawahan');

select * from category;

insert into product
values 	(1, "Baju Merah Lengan Panjang", 150000, 1),
		(2, "Baju Biru Lengan Panjang", 145000, 1),
		(3, "Celana Merah Lengan Panjang", 100000, 2),
		(4, "Celana Biru Lengan Panjang", 95000, 2);
	
select * from product;

select product_id, product_name from product 
inner join category on product.category_id = category.category_id 
where product.price >= 150000;


-- Belajar Many to One

create table brand(
	brand_id INT PRIMARY KEY,
	brand_name VARCHAR(225)
);

insert into brand 
values 	(1, 'imaco'),
		(2, 'powertech');
	
alter table product 
add brand_id INT after price;

alter table product 
add constraint brand_id foreign key (brand_id) references brand(brand_id);

desc product;

update product 
set brand_id = 2
where product.product_name like '% Biru %';

select * from product;

