-- CTE for Total Order Value per Customer
WITH CustomerOrderValue AS (
    SELECT 
        o.CustomerID,
        SUM(od.Quantity * od.UnitPrice) AS TotalOrderValue
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    GROUP BY o.CustomerID
)
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    cov.TotalOrderValue
FROM Customers c
JOIN CustomerOrderValue cov ON c.CustomerID = cov.CustomerID;

-- CTE for Products with Low Stock
WITH LowStockProducts AS (
    SELECT 
        p.ProductID,
        p.ProductName,
        p.Stock
    FROM Products p
    WHERE p.Stock < 10
)
SELECT 
    lsp.ProductID,
    lsp.ProductName,
    lsp.Stock
FROM LowStockProducts lsp;

