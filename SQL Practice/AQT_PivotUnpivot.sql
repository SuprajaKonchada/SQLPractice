-- Assume we want to sum the quantity of each product sold in 2023 and 2024.
-- PIVOT: Used to summarize and view data, such as total quantities sold by product for specific years.
SELECT ProductName, [2023], [2024]
FROM (
    SELECT 
        p.ProductName,
        YEAR(o.OrderDate) AS OrderYear,
        od.Quantity
    FROM OrderDetails od
    JOIN Orders o ON od.OrderID = o.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
) AS SourceTable
PIVOT (
    SUM(Quantity) FOR OrderYear IN ([2023], [2024])
) AS PivotTable;

-- This assumes a simplified version where we have quantity columns for each product.
-- UNPIVOT: Used to transform the summarized data back into a more detailed format, allowing you to analyze the quantities by year.
SELECT 
    ProductName,
    Year,
    Quantity
FROM (
    SELECT ProductName, [2023], [2024]
    FROM (
        SELECT 
            p.ProductName,
            YEAR(o.OrderDate) AS OrderYear,
            SUM(od.Quantity) AS Quantity
        FROM OrderDetails od
        JOIN Orders o ON od.OrderID = o.OrderID
        JOIN Products p ON od.ProductID = p.ProductID
        GROUP BY p.ProductName, YEAR(o.OrderDate)
    ) AS SourceTable
    PIVOT (
        SUM(Quantity) FOR OrderYear IN ([2023], [2024])
    ) AS PivotTable
) AS PivotSource
UNPIVOT (
    Quantity FOR Year IN ([2023], [2024])
) AS UnpivotTable;
