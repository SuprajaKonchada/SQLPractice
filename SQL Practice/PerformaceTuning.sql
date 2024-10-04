-- Turn on performance statistics
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * 
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID;

-- Turn off statistics
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;


-- Enable the execution plan
-- SET SHOWPLAN_TEXT ON;

-- Query to analyze
SELECT C.FirstName, C.LastName, P.ProductName, OD.Quantity, 
       (OD.Quantity * OD.UnitPrice) AS TotalAmount, O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID;

-- Disable SHOWPLAN_TEXT after analysis
-- SET SHOWPLAN_TEXT OFF;