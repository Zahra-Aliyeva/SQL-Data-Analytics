--1. Which customers have placed at least one order?
-- Correlated Subquery

select CompanyName
from Customers c
where exists (
    select 1
    from Orders o
    where o.CustomerID = c.CustomerID
);

-- Optimized JOIN

select DISTINCT c.CompanyName
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID;

-- The JOIN avoids executing a subquery for every customer and is generally more efficient.

--2. Find all orders for a specific customer.

select *
from Orders
where CustomerID='SUPRD';

-- Creating an index on CustomerID allows the database to locate matching orders without scanning the entire table.

--3. Show the newest products.

SELECT *
FROM Products
ORDER BY ProductID DESC;

SELECT *
FROM Products
ORDER BY ProductID DESC
LIMIT 10;

-- Using LIMIT reduces the number of returned rows and improves response time.

--4. Which products have been ordered?
-- Correlated Subquery

select ProductName
from Products p
where exists (
    select 1
    from [Order Details] od
    where od.ProductID = p.ProductID
);

-- Optimized JOIN

select DISTINCT p.ProductName
from Products p
inner join [Order Details] od
on p.ProductID = od.ProductID;

-- Using a JOIN is generally more efficient because the database processes the relationship in one query rather than evaluating a subquery for every product.


--5. Show each order with its customer name.

-- less efficient
select OrderID,
    (select CompanyName
        from Customers c
        where c.CustomerID = o.CustomerID
    ) AS Customer
from Orders o;

-- better
select o.OrderID, c.CompanyName
from Orders o
inner join Customers c
on o.CustomerID = c.CustomerID;


-- The JOIN retrieves customer information in a single operation instead of executing a subquery for every order.
