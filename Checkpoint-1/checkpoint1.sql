-- 1. What are the 10 most recent orders shipped to the USA?

select OrderID, CustomerID, OrderDate, ShipCountry 
from Orders
where ShipCountry= 'USA'
order by OrderDate DESC
LIMIT 10  

-- This is a snapshot of recent sales activity in the US market, which can help us monitor market activity, identify current demand patterns, and support operational reporting.


-- 2. Which products have fewer than 5 units in stock?

select ProductID, ProductName, UnitsInStock 
from Products
where UnitsInStock < 5
ORDER BY UnitsInStock ASC


-- This query selects products with less than 5 units left in stock and displays them in ascending order of stock quantity. This result helps identify products at risk of stock shortages and manage inventory more effectively.

--3. Which 5 expensive products still have at least 30 units available in stock? 

SELECT ProductName, UnitPrice, UnitsInStock 
from Products
where UnitPrice > 50 and UnitsInStock >= 30
order by UnitPrice DESC
limit 5

-- This query identifies high-value products that remain well in stock to support inventory planning and promotional decisions.

-- 4. Which 10 customers are located in London?

select CustomerID, CompanyName, ContactName, city 
from Customers
where city= 'London'
order by CompanyName ASC
limit 10

-- This query provides a list of customers based in London, supporting regional customer analysis and market segmentation.

-- 5. Which discontinued products still have inventory available?

SELECT ProductName, UnitsInStock, Discontinued
from Products
where Discontinued = 1 and UnitsInStock > 0
order by UnitsInStock DESC
limit 10;

-- This query identifies discontinued products that are still in stock, which helps businesses plan inventory cleanup or warehouse optimization.
