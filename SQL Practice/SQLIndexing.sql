-- By default, the primary key is the clustered index
-- This was already created when the Orders table was defined

SELECT * FROM Orders WHERE OrderID = 4;

-- Create a non-clustered index on the LastName column
CREATE NONCLUSTERED INDEX IX_Customers_LastName ON Customers (LastName);

-- Query using the non-clustered index
SELECT * FROM Customers WHERE LastName = 'Konchada';

-- Create a composite non-clustered index on CustomerID and OrderDate
CREATE NONCLUSTERED INDEX IX_Orders_CustomerID_OrderDate ON Orders (CustomerID, OrderDate);

-- Query using the composite index
SELECT * FROM Orders WHERE CustomerID = 1 AND OrderDate >= '2023-01-01';

-- Create a unique non-clustered index on Email
CREATE UNIQUE NONCLUSTERED INDEX IX_Customers_Email ON Customers (Email);

-- Query to find a customer by email
SELECT * FROM Customers WHERE Email = 'suprajakonchada2001@gmail.com';

-- Create a non-clustered index on the LastName column with a covering index
CREATE NONCLUSTERED INDEX IX_Customers_LastName_Covering 
ON Customers (LastName)
INCLUDE (FirstName, Email);

-- Query using the non-clustered index
SELECT * FROM Customers WHERE LastName = 'Konchada';

Sp_Help 'Orders'
Sp_HelpIndex 'Orders'


