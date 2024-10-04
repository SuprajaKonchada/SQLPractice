-- CROSS APPLY: Excludes customers who have no matching records in the Orders table
SELECT C.CustomerID, C.FirstName, C.LastName, O.OrderID, O.OrderDate
FROM Customers C
CROSS APPLY (
    SELECT TOP 1 OrderID, OrderDate
    FROM Orders O
    WHERE O.CustomerID = C.CustomerID
    ORDER BY O.OrderDate DESC
) O;

SELECT C.CustomerID, C.FirstName, C.LastName, O.OrderID, O.OrderDate
FROM Customers C
INNER JOIN (
    SELECT OrderID, CustomerID, OrderDate, 
           ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS RowNum
    FROM Orders
) O
ON C.CustomerID = O.CustomerID AND O.RowNum = 1;

-- Includes all customers, even those without matching records, and fills in NULL values for the missing data.
SELECT C.CustomerID, C.FirstName, C.LastName, O.OrderID, O.OrderDate
FROM Customers C
OUTER APPLY (
    SELECT TOP 1 OrderID, OrderDate
    FROM Orders O
    WHERE O.CustomerID = C.CustomerID
    ORDER BY O.OrderDate DESC
) O;

SELECT C.CustomerID, C.FirstName, C.LastName, O.OrderID, O.OrderDate
FROM Customers C
LEFT JOIN (
    SELECT OrderID, CustomerID, OrderDate, 
           ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS RowNum
    FROM Orders
) O
ON C.CustomerID = O.CustomerID AND O.RowNum = 1;


