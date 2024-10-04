-- Assign a unique row number to each order by OrderDate
SELECT 
    OrderID,
    CustomerID,
    OrderDate,
    ROW_NUMBER() OVER (ORDER BY OrderDate) AS RowNum
FROM Orders;

-- Rank orders based on the OrderDate
SELECT 
    OrderID,
    CustomerID,
    OrderDate,
    RANK() OVER (ORDER BY OrderDate) AS OrderRank
FROM Orders;

-- Rank orders based on total sales amount
WITH OrderSales AS (
    SELECT 
        o.OrderID,
        SUM(od.Quantity * od.UnitPrice) AS TotalSalesAmount
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    GROUP BY o.OrderID
)
SELECT 
    OrderID,
    TotalSalesAmount,
    DENSE_RANK() OVER (ORDER BY TotalSalesAmount DESC) AS SalesRank
FROM OrderSales;

-- Calculate total sales amount for each order
SELECT 
    o.OrderID,
    SUM(od.Quantity * od.UnitPrice) OVER (PARTITION BY o.OrderID) AS TotalSalesAmount
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID;

-- Calculate average unit price for each product
SELECT 
    od.ProductID,
    od.UnitPrice,
    AVG(od.UnitPrice) OVER (PARTITION BY od.ProductID) AS AveragePrice
FROM OrderDetails od;






