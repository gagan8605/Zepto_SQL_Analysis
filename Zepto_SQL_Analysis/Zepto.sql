drop table if exists zepto ;

create table zepto (
sku_id SERIAL PRIMARY KEY ,
category  VARCHAR(120) ,
name VARCHAR(150) NOT NULL ,
mrp NUMERIC(8,2) , 
discountPercent NUMERIC(5,2),
availableQuantity INTEGER ,
discountedSellPrice NUMERIC(8,2),
weightINGms INTEGER , 
outOfStock BOOLEAN , 
quantity INTEGER
);

-- Data Exploration ------------

-- count of rows 

SELECT COUNT(*) FROM ZEPTO

----sample Data
SELECT * FROM Zepto LIMIT 10;

--- Null Values 
SELECT * FROM Zepto where name is null
OR 
category IS NULL
OR 
mrp IS NULL
OR 
 discountpercent IS NULL
OR 
availablequantity IS NULL
OR 
discountedsellprice IS NULL
OR 
weightINGms  IS NULL
OR 
outofstock IS NULL
OR 
quantity IS NULL

--diffrent catgories 

SELECT DISTINCT category 
from zepto order by category ; 

--product in stock vs out of stock 

SELECT 	 OUTOFSTOCK , COUNT(SKU_id) FROM ZEPTO GROUP BY  OUTOFSTOCK ;

-- PRODUCT NAMES PRESENT MULTIPLE TIMES 
SELECT name , count(sku_id) as "Number of Sku_id"
FROM ZEPTO 
group by name
having count(sku_id) > 1 ORDER BY COUNT(sku_id) DESC;

---data cleaning 

---product price = 0 

SELECT * FROM Zepto where mrp = 0 or discountedsellprice = 0;

DELETE FROM zepto where mrp = 0;

-- convert paise to rupees 
UPDATE zepto SET  mrp = mrp/100.0 ,
discountedsellprice=discountedsellprice/100.0;

SELECT mrp , discountedsellprice FROM zepto ;

------------Business Analysis 

---- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT * From Zepto ORDER BY  discountpercent DESC LIMIT 10 ;

--Q2.What are the Products with High MRP but Out of Stock

SELECT  DISTINCT * FROM zepto where outofstock = True and mrp > 300 ORDER by mrp desc ;

--Q3.Calculate Estimated Revenue for each category
SELECT category ,SUM(discountedsellprice* availableQuantity) as total_revenue from zepto group by category order by total_revenue ;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

SELECT DISTINCT * FROM zepto where mrp > 500 and discountpercent < 10 ORDER by mrp DESC , discountpercent DESC ;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT category , ROUND(avg(discountpercent),2) as avg_discount from Zepto GROUP  by category  order by avg_discount desc limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightInGms, discountedSellPrice,
ROUND(discountedsellPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;


--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;









