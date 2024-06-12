select * from [dbo].[pizza_sales]
-- KPI's 
--Total Orders  
Select SUM(total_price) AS Total_Revenue
from [pizza_sales]

-- Average Order Value 
Select Sum(total_price)/count(Distinct order_id) as Avg_Order_Value 
from pizza_sales

-- Total Pizzas Sold 
Select Sum(quantity) As Total_PizzaSales
from pizza_sales

-- Total Orders placed 
Select count(distinct order_id) As Total_Orders
From pizza_sales

-- Average Pizza Per Order 

Select CAST(SUM(quantity) AS Decimal(10,2))/
CAST(count(distinct order_id) AS decimal(10,2)) AS Average_Pizza_Per_Order
From pizza_sales

