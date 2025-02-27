---Retail sales database---
create database sql_project_p2;
drop table if exists retail_sales;
--creating table--
create table retail_sales(
			transactions_id int,
			sale_date date,
			sale_time time,
			customer_id	int,
			gender	varchar(15),
			age	int,
			category varchar(15),
			quantiy int,
			price_per_unit float,
			cogs	float,
			total_sale float

);
--checking if the data of the tables are imported--
select * from  retail_sales
LIMIT 10;

--COUNTING THE NUMBER OF DATA WE HAVE--
select count(*) from retail_sales;
--checking null values in each columns ---
select * from retail_sales
where transactions_id is Null;

select * from retail_sales
where sale_date is Null;

select * from retail_sales
where sale_time is Null;

select * from retail_sales
where customer_id is Null;

select * from retail_sales
where gender is Null;

select * from retail_sales
where age
is Null;
-- Null values detected in age column now counting the number of null values in age column
select count(*) from retail_sales
where age is null;
-- continuing the same process of finding null values --

select * from retail_sales
where category is Null;

select * from retail_sales
where Quantiy is Null;
-- Null values detected in  quantiy column now counting the number of null values in that column--
select count(*) from retail_sales
where quantiy is null;

select * from retail_sales
where price_per_unit is Null;

select * from retail_sales
where cogs is Null;

select * from retail_sales
where total_sale is Null;


--- instead of going one by one checking all the null values in each column we can do it at once by using :--
select * from retail_sales
where transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or 
price_per_unit is null
or
cogs is null
or
total_sale is null;
-- now deleting null values---
delete  from retail_sales 
where transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or 
price_per_unit is null
or
cogs is null
or
total_sale is null;

--checing if they are deleted--
select count(* )from retail_sales;