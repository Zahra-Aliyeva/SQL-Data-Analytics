-- 1. Which employees processed the most orders?

select e.FirstName || ' ' || e.LastName AS Employee,
COUNT(DISTINCT o.OrderID) AS TotalOrders
from Employees e
inner join Orders o on e.EmployeeID = o.EmployeeID
group by e.EmployeeID, e.FirstName, e.LastName
order by TotalOrders DESC;

-- The query shows how many unique orders each employee handled, helping evaluate employee workload.


-- 2. Which customers placed more than 15 orders?

select c.CompanyName,
count(o.OrderID) AS TotalOrders
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CompanyName
having count(o.OrderID) > 15
order by TotalOrders DESC;

-- The query identifies customers with a high number of orders, highlighting loyal and frequent buyers.

-- 3. Which months had the highest number of orders?

select strftime('%Y-%m', OrderDate) AS OrderMonth,
count(OrderID) AS TotalOrders
from Orders
group by OrderMonth
order by TotalOrders DESC;

-- The query summarizes monthly order activity, helping identify seasonal sales trends.

-- 4. Which shipping companies have the highest number of shipped and pending orders?

select s.CompanyName, COUNT(*) AS TotalOrders, COUNT(o.ShippedDate) AS ShippedOrders,
    COUNT(*) - COUNT(o.ShippedDate) AS PendingOrders
from Shippers s
inner join Orders o on s.ShipperID = o.ShipVia
group by s.ShipperID, s.CompanyName
order by PendingOrders DESC;

-- The query compares the total, shipped, and pending orders for each shipping company. Since COUNT(ShippedDate) ignores NULL values, it accurately identifies pending deliveries and helps evaluate shipping performance.


--5. Which suppliers provide more than four products?

select s.CompanyName,
    COUNT(p.ProductID) AS TotalProducts
from Suppliers s
inner join Products p on s.SupplierID = p.SupplierID
group by s.SupplierID, s.CompanyName
having COUNT(p.ProductID) > 4
order by TotalProducts DESC;

-- The query identifies suppliers with a broad product portfolio, helping evaluate supplier capacity and diversity.
