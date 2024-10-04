-- Inefficient query
SELECT * FROM Orders;

-- Optimized query: Specify only the columns you need to minimize the data fetched.
SELECT OrderID, OrderDate FROM Orders;

-- Inefficient query using IN
SELECT * FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM Orders);

-- Optimized query using EXISTS: EXISTS is generally faster for subqueries, especially when dealing with large datasets.
SELECT * FROM Customers WHERE EXISTS (SELECT 1 FROM Orders WHERE Orders.CustomerID = Customers.CustomerID);

-- Inefficient query with a wide range, potentially causing an index scan
SELECT ProductID, ProductName FROM Products WHERE Price > 0;

-- Optimized query with a specific condition causing an index seek
SELECT ProductID, ProductName FROM Products WHERE ProductName = 'Laptop';

-- Querying Products without NOLOCK may cause blocking if the table is locked
SELECT * FROM Products WHERE Stock < 20;  

-- Using NOLOCK to avoid locking issues, allowing for faster reads
SELECT * FROM Products WITH (NOLOCK) WHERE Stock < 20;  
 
-- Create a temporary table to hold products with price greater than 50
SELECT ProductID, Price INTO #TempProducts 
FROM Products 
WHERE Price > 50;

-- Now you can perform further operations on the temp table if needed
SELECT * FROM #TempProducts;

-- Clean up the temp table
DROP TABLE #TempProducts;

-- Inefficient query
SELECT * FROM Orders 
WHERE YEAR(OrderDate) = 2024;

-- Optimized query
SELECT * FROM Orders 
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-12-31';

