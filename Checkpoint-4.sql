-- 1. Which employees handled more orders than the average employee?

WITH EmployeeOrders AS (
    select e.EmployeeID, e.FirstName || ' ' || e.LastName AS Employee,
        COUNT(DISTINCT o.OrderID) AS TotalOrders
    from Employees e
    inner join Orders o
    on e.EmployeeID = o.EmployeeID
    group by e.EmployeeID, e.FirstName, e.LastName
)

select *
from EmployeeOrders
where TotalOrders > (
    select AVG(TotalOrders)
    from EmployeeOrders
)
order by TotalOrders DESC;

-- The query finds employees who handled more unique orders than the company average. COUNT(DISTINCT) prevents duplicate order counts.


--2. Which products are more expensive than the average product price?

select ProductName, UnitPrice 
from Products
where UnitPrice > (
	select avg(unitprice)
	from products)
order by UnitPrice desc

-- The query lists products priced above the average product price.


-- 3. Which shipping companies still have pending orders?

WITH ShippingStatus AS (
    select s.CompanyName,
        COUNT(*) AS TotalOrders,
        COUNT(o.ShippedDate) AS ShippedOrders
    from Shippers s
    inner join Orders o on s.ShipperID = o.ShipVia
    group by s.ShipperID, s.CompanyName
)

select CompanyName, TotalOrders,
    TotalOrders - ShippedOrders AS PendingOrders
from ShippingStatus
where TotalOrders > ShippedOrders
order by PendingOrders DESC;

--The query identifies shipping companies that still have pending deliveries by using the difference between COUNT(*) and COUNT(ShippedDate).

--4. Which categories have no expensive products?

SELECT CategoryName
from Categories
where CategoryID NOT IN (
    select DISTINCT CategoryID
    from Products
    where UnitPrice > 50
);

-- The query identifies categories that do not contain any high-priced products.

--5. Which suppliers provide products in more than one category?

WITH SupplierCategories AS (
select s.CompanyName,
    COUNT(DISTINCT p.CategoryID) AS Categories
from Suppliers s
inner join Products p on s.SupplierID = p.SupplierID
group by s.SupplierID, s.CompanyName
)

select *
from SupplierCategories
where Categories > 1
order by Categories DESC;

-- The query identifies suppliers whose products belong to multiple product categories.
