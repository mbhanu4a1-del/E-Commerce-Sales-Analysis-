CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
CREATE TABLE ecommerce_sales (
    Order_ID INT,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    Product_Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Quantity INT,
    Price INT,
    Discount DECIMAL(4,2),
    Payment_Method VARCHAR(50),
    Order_Status VARCHAR(50)
);
select * from ecommerce_sales;

-- total revenue
select sum(Quantity*price*(1-Discount)) as total_revenue
from ecommerce_sales;

-- total orders
select count(order_id) as total_orders
from ecommerce_sales;

-- revenue by prodct category
select Product_Category,sum(quantity*price*(1-discount)) as revenue
from ecommerce_sales
group by product_category
order by revenue;

-- top 5 selling
select product_name,sum(quantity) as total_sales
from ecommerce_sales
group by product_name
order by total_sales desc
limit 5;

-- top cities by sales
select city,sum(quantity*price*(1-discount)) as revenue
from ecommerce_sales
group by city
order by revenue;

-- payment method usage
select payment_method,count(*) as total_orders
from ecommerce_sales
group by payment_method;

-- monthly sales end 
select date_format(order_date,'%Y-%m') as months,sum(quantity*price*(1-discount)) as revenue 
from ecommerce_sales
group by months
order by months;

-- total discount given
select sum(quantity*price*(1-discount))
from ecommerce_sales;

-- most valuable customers
select customer_name,sum(quantity*price*(1-discount)) as revenue
from ecommerce_sales
group by customer_name
order by revenue desc
limit 10;

-- average order value
select avg(quantity*price*(1-discount)) as average_order_value
from ecommerce_sales;

-- order by status
select order_status,count(*) as total_orders
from ecommerce_sales
group by order_status;