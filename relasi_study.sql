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

select product_id, product_name, brand_name, price from product
inner join brand on product.brand_id = brand.brand_id
where brand.brand_name = 'imaco'
order by product.price > 100000;

-- Belajar Many to Many

create table mahasiswa(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	student_name VARCHAR(255)
);

create table mata_kuliah(
	course_id INT AUTO_INCREMENT PRIMARY KEY,
	course_name VARCHAR(225)
);

create table mahasiswa_mata_kuliah(
	enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
	student_id INT,
	course_id INT,
	FOREIGN KEY (student_id) REFERENCES mahasiswa(student_id),
	FOREIGN KEY (course_id) REFERENCES mata_kuliah(course_id)
);


desc mahasiswa_mata_kuliah;

select * from mahasiswa;

select * from mata_kuliah;

select * from mahasiswa_mata_kuliah;

insert into mahasiswa (student_name)
values 	("Raditya Cahyadi"),
		("Dika Raditya");
		
insert into mata_kuliah (course_name)
values 	("Sistem Informasi"),
		("Kalkulus 1"),
		("Pengantar Matematika");
		
insert into mahasiswa_mata_kuliah (student_id, course_id)
values	(1, 2),
		(3, 1),
		(2, 3),
		(1, 1),
		(1, 3);
		
-- Contoh SQL: Menampilkan daftar mahasiswa dan mata kuliah yang mereka ambil.
select student_name, course_name from mahasiswa
inner join mahasiswa_mata_kuliah on mahasiswa.student_id = mahasiswa_mata_kuliah.student_id
inner join mata_kuliah on mahasiswa_mata_kuliah.course_id = mata_kuliah.course_id;

-- Contoh SQL: Menampilkan mahasiswa dan jumlah mata kuliah yang mereka ambil.
select mahasiswa.student_name, COUNT(mahasiswa_mata_kuliah.enrollment_id) from mahasiswa
left join mahasiswa_mata_kuliah on mahasiswa.student_id = mahasiswa_mata_kuliah.student_id
group by mahasiswa.student_name;