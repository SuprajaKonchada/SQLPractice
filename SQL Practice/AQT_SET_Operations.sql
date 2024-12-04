-- Combine Customers from Both Regions (Distinct)
SELECT CustomerID, FullName, Email
FROM Customers_RegionA

UNION

SELECT CustomerID, FullName, Email
FROM Customers_RegionB;



-- Combine Customers from Both Regions (With Duplicates)
SELECT CustomerID, FullName, Email
FROM Customers_RegionA

UNION ALL

SELECT CustomerID, FullName, Email
FROM Customers_RegionB;


-- Find Customers Common to Both Regions
SELECT CustomerID, FullName, Email
FROM Customers_RegionA

INTERSECT

SELECT CustomerID, FullName, Email
FROM Customers_RegionB;


-- Customers in Region A but Not in Region B
SELECT CustomerID, FullName, Email
FROM Customers_RegionA

EXCEPT

SELECT CustomerID, FullName, Email
FROM Customers_RegionB;


--  Find Missing Customers in the Master List
SELECT CustomerID, FullName, Email
FROM All_Customers

EXCEPT

(
    SELECT CustomerID, FullName, Email
    FROM Customers_RegionA
    
    UNION
    
    SELECT CustomerID, FullName, Email
    FROM Customers_RegionB
);

-- Verify Data
SELECT * FROM Customers_RegionA;
SELECT * FROM Customers_RegionB;
SELECT * FROM All_Customers;

