select * from [dbo].[pizza_data]

USE [Pizza DB]
GO

select * from pizza_data

-- Checking for null values 

Select * from pizza_data
Where pizza_id is null or order_id is null or quantity is null or order_date is null or order_time is null or unit_price is null or total_price is null or pizza_size is null or pizza_category is null or pizza_ingredients is null or pizza_name is null 


-- KPI's 
--Total Orders  
Select SUM(total_price) AS Total_Revenue
from pizza_data

-- Average Order Value 
Select Sum(total_price)/count(Distinct order_id) as Avg_Order_Value 
from pizza_data

-- Total Pizzas Sold 
Select Sum(quantity) As Total_PizzaSales
from pizza_data

-- Total Orders placed 
Select count(distinct order_id) As Total_Orders
From pizza_data

-- Average Pizza Per Order 

Select CAST(SUM(quantity) AS Decimal(10,2))/
CAST(count(distinct order_id) AS decimal(10,2)) AS Average_Pizza_Per_Order
From pizza_data

-- Percentage of Sales by Pizza Size 

Select pizza_size,
Cast(sum(total_price) AS Decimal(10,2)) AS Total_Sales, 
CAST(sum(total_price) * 100 / (Select sum(total_price) from pizza_data) AS Decimal(10,2)) AS Percentage_of_Sales
from pizza_data
group by pizza_size
Order by Percentage_of_Sales desc

-- Total Pizzas Sold by Category 

Select pizza_category, 
Cast(sum(total_price) AS Decimal(10,2)) AS Total_Sales
from pizza_data
group by pizza_category

-- Top 5 Best Sellers by Revenue, Total Quantity, Total Orders 

Select top 5 pizza_name, 
CAST(SUM(total_price) AS Decimal(10,2)) as total_revenue
From pizza_data
group by pizza_name
order by total_revenue desc 

--- Bottom 5 best sellers by Revenue, Total Quantity, Total Orders 

Select top 5 pizza_name, 
CAST(SUM(total_price) AS Decimal(10,2)) as total_revenue
From pizza_data
group by pizza_name
order by total_revenue asc 

-- Daily Trend based on weekly basis 
Select Datename(DW, order_date) AS order_day, 
Count(Distinct order_id) As total_orders 
from pizza_data
group by Datename(DW, order_date)

-- Trend based on month
Select Datename(MONTH, order_date) AS order_month, 
Count(Distinct order_id) As total_orders 
from pizza_data
group by Datename(MONTH, order_date)
