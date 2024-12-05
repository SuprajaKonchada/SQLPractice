-- Using subquery
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT C.CustomerID, C.FirstName, C.LastName, C.Email
FROM Customers C
WHERE C.CustomerID IN (
    SELECT O.CustomerID
    FROM Orders O
    JOIN OrderDetails OD ON O.OrderID = OD.OrderID
    GROUP BY O.CustomerID
    HAVING SUM(OD.Quantity * OD.UnitPrice) > 60000
);

-- Using join
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName, C.Email
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.FirstName, C.LastName, C.Email
HAVING SUM(OD.Quantity * OD.UnitPrice) > 60000;
