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

--Data CLEANING----
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

--checking if they are deleted--
select count(* )from retail_sales;


---Data Exploration----
--nUMBER of sales we have ---
select count(*) as total_sale from retail_sales;
--Number of unique customers--
select count(Distinct customer_id) as total_unique_customers from retail_sales;
--Number of unique categories--
select count(distinct category) as total_unique_category from retail_sales;
--unique categories--
select distinct(category) as unique_category from retail_sales;


---DATA ANALYSIS--- 
--SQL Query to retrieve all columns for sales made on '2022-11-05'.
select * from retail_sales where sale_date ='2022-11-05';

--sql query to retrieve all transaction where the category is 'clothing' and the quantity sold is more than 4 in the month of NOV-20.
select * from retail_sales where category ='clothing' and quantiy >10
--Alternative method--
select * from retail_sales where category = 'Clothing' and TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'  AND quantiy >=4;

--- SQL QUERY to calculate the total sles for each category --
select category, sum(total_sale) from retail_sales group by category;

-- SQL QUERY TO FIND THE AVERAGE AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM THE BEAUTY CATEGORY--
select round(avg(age)), category from retail_sales where category = 'Beauty'
group by category;

