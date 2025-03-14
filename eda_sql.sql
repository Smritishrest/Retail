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

-- Profitabaility analysis--
----Gross profit margin by category---

select * from retail_sales;
--For gross profit--
select sum(total_sale) as total_revenue, sum(cogs) as total_cost, (sum(total_sale) - sum(cogs)) as total_gross_profit
From retail_sales
group by category;


---Most profitable transactions---

select transactions_id,
sum(total_sale) as total_revenue,
sum(cogs) as total_cost,
(sum(total_sale)- sum(cogs)) as gross_profit
from retail_sales
group by transactions_id
order by 3 desc
limit 5;


   --Revenue contribution by category---
   select sum(total_sale) as total_revenue, category
   from retail_sales
   group by category;


   ---customer Insights--
   ---Top 10 highest spending custoemrs---
   select * from retail_sales;
   select customer_id, sum(total_sale) from retail_sales
   group by customer_id
   order by 2 desc limit 10;

   --Most frequent customers ---
   select customer_id, count (*) as purchase_count, sum(total_sale) 
   from retail_sales
   group by customer_id
   order by 2 desc limit 10;


   --Customr purchase patterns--
   select customer_id, category,count(*) ,sum(total_sale) from retail_sales
   group by category, customer_id
   order by 2;
   