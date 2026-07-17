--1. Which customers placed orders, and which shipping company delivered them?

SELECT o.OrderID, c.CompanyName, o.OrderDate, s.CompanyName AS Shipper
from Orders o
inner join Customers c on o.CustomerID = c.CustomerID
inner join Shippers s on o.ShipVia = s.ShipperID
order by o.OrderDate DESC
limit 10;

-- This query combines order, customer, and delivery data into a single view. This helps to track recent orders and identify which delivery companies are making deliveries.

--2. Which customers placed orders and which employee handled them?

SELECT o.OrderID, c.CompanyName, e.FirstName || ' ' || e.LastName AS Employee, o.OrderDate
from Orders o
inner join Customers c on o.CustomerID = c.CustomerID
inner join Employees e on o.EmployeeID = e.EmployeeID
order by o.OrderDate DESC
limit 10;

-- This query links customers, employees, and orders to provide a complete view of order processing.

--3. List all orders with the shipping company.

SELECT o.OrderID, s.CompanyName, o.ShipCountry
from Orders o
left join Shippers s on o.ShipVia = s.ShipperID
order by o.OrderID;

-- The query displays each order with the shipping company and destination country. It helps analyze shipping methods for customer orders.

-- 4. Which orders have not been shipped yet?

SELECT o.OrderID, c.CompanyName, o.OrderDate, o.ShippedDate
from Orders o
left join Customers c on o.CustomerID = c.CustomerID
where o.ShippedDate IS NULL;

-- The query identifies orders that have not yet been shipped, helping track pending deliveries.

--5. Which employees report to another employee?

SELECT e.FirstName || ' ' || e.LastName AS Employee, m.FirstName || ' ' || m.LastName AS Manager
from Employees e
inner join Employees m on e.ReportsTo = m.EmployeeID;

-- The query identifies reporting relationships between employees and their managers, making it easier to understand the company's organizational structure and chain of command.

--6. Generate every possible combination of product categories and shippers.

SELECT c.CategoryName, s.CompanyName
from Categories c
cross join Shippers s; 

-- The query creates all possible category–shipper combinations. It helps analyze potential shipping assignments and logistics planning.
