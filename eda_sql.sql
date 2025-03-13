select * from retail_sales;


--Exploratory DATA ANALYSIS---
---Total sales over time--
select 
extract(month from sale_date) as month,
extract(year from sale_date) as year,
sum(total_sale) as Total_sale

from retail_sales
group by 2,1;

--Peak sale hour----
select
extract (hour from sale_time) as hour,
sum(total_sale) as Total_sale
from retail_sales
group by 1
order by 2;

--Sales Distribution by gender--
select * from retail_sales;
select sum(total_sale),
gender,
count(*) as total_customer
from retail_sales group by 2;


-- Age group Analysis---
select 
case 
when age between 18 and 25 then '18-25'
when age between 26 and 35 then '26-35'
when age between 36 and 45 then '36-45'
when age between 46 and 55 then '46-55'
else '56+'
end as age_group,
count(*) as total_customers,
sum(total_sale) as Total_revenue
from retail_sales
group by age_group
order by 3 desc;

--Best selling product categories---
select 
category,
sum(total_sale) as Total_revenue,
sum(quantiy) as total_units_sold
from retail_sales
group by category;
select * from retail_sales;



