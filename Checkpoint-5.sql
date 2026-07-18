--1. Which product is the most expensive in each category?

select *
from(
select c.CategoryName, p.ProductName, p.UnitPrice,
    ROW_NUMBER() OVER( PARTITION BY c.CategoryName ORDER BY p.UnitPrice DESC
    ) AS rn
from Products p
inner join Categories c on p.CategoryID=c.CategoryID
)
where rn=1;

-- The query identifies the most expensive product in each category.

--2. Rank products within each category.

select c.CategoryName, p.ProductName, p.UnitPrice,
    RANK() OVER( PARTITION BY c.CategoryName ORDER BY p.UnitPrice DESC
    ) AS PriceRank
from Products p
join Categories c on p.CategoryID=c.CategoryID;

-- Ranks products by price inside each category.

--3. Number customer orders chronologically.

select CustomerID, OrderID, OrderDate,
    ROW_NUMBER() OVER( PARTITION BY CustomerID ORDER BY OrderDate
    ) AS OrderSequence
from Orders;

-- Shows the sequence of each customer's orders.

--4. Which customer placed the first order in every country?

select *
from(
select ShipCountry, OrderID,OrderDate,
    ROW_NUMBER() OVER( PARTITION BY ShipCountry ORDER BY OrderDate
    ) AS n
from Orders
)
where n=1;

-- The query finds the first recorded order for each shipping country.

--5. Which products are above their category's average price?

select c.CategoryName, p.ProductName,p.UnitPrice,
    ROUND(AVG(p.UnitPrice) OVER(PARTITION BY c.CategoryID),2
    ) AS CategoryAverage
from Products p
inner join Categories c on p.CategoryID=c.CategoryID
where p.UnitPrice>
(
select AVG(UnitPrice)
from Products p2
where p2.CategoryID=p.CategoryID
); 

-- The query compares each product with the average price of its own category and identifies premium products.

--6. Which countries generated the highest freight costs?

select ShipCountry,
    SUM(Freight) AS TotalFreight,
    DENSE_RANK() OVER (ORDER BY SUM(Freight) DESC) AS FreightRank,
    SUM(SUM(Freight)) OVER (ORDER BY SUM(Freight) DESC
    ) AS RunningFreight
from Orders
group by ShipCountry;

-- The query ranks countries by total freight cost and shows the cumulative freight amount.
