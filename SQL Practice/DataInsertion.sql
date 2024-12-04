-- Insert data into Customers
INSERT INTO Customers (FirstName, LastName, Email) VALUES 
('Supraja', 'Konchada', 'suprajakonchada2001@gmail.com'),
('Amisha', 'Gupta', 'amishagupta@gmail.com'),
('Sanjay', 'Kumar', 'sanjaykumarkonchada2005@gmail.com');

-- Insert data into Products
INSERT INTO Products (ProductName, Price, Stock) VALUES 
('Laptop', 76000.00, 12),
('Smartphone', 52000.00, 80),
('Tablet', 36000, 15);

-- Insert data into Orders and OrderDetails
INSERT INTO Orders (CustomerID) VALUES (1), (2), (3);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 76000.00),
(2, 2, 1, 52000.00),
(3, 3, 3, 36000.00);

INSERT INTO Customers (FirstName, LastName, Email) VALUES 
('Sujatha', 'Konchada', 'sujathakonchada1980@gmail.com');

INSERT INTO Employees (FullName, ManagerID, Position)
VALUES
    ('Supraja Konchada', NULL, 'CEO'),           -- Top-level manager (no manager)
    ('Sanjay Konchada', 1, 'CTO'),                  -- Reports to Supraja Konchada
    ('Sujatha Konchada', 1, 'CFO'),              -- Reports to Supraja Konchada
    ('Satish Konchada', 2, 'Software Engineer'), -- Reports to Sanjay Konchada
    ('Sruthi Ganta', 2, 'System Analyst'),       -- Reports to Sanjay Konchada
    ('Keerthana Maddi', 3, 'Accountant');         -- Reports to Sujatha Konchada

-- Insert data into Customers_RegionA
INSERT INTO Customers_RegionA (CustomerID, FullName, Email)
VALUES 
(1, 'Supraja Konchada', 'suprajakonchada2001@gmail.com'),
(2, 'Sanjay Konchada', 'sanjaykonchada@gmail.com'),
(3, 'Sujatha Konchada', 'sujathakonchada@gmail.com');

-- Insert data into Customers_RegionB
INSERT INTO Customers_RegionB (CustomerID, FullName, Email)
VALUES 
(3, 'Sujatha Konchada', 'sujathakonchada@gmail.com'),
(4, 'Keerthana Maddi', 'keerthana@gmail.com'),
(5, 'Sruthi Ganta', 'sruthiganta@gmail.com');

-- Insert data into All_Customers
INSERT INTO All_Customers (CustomerID, FullName, Email)
VALUES 
(1, 'Supraja Konchada', 'suprajakonchada2001@gmail.com'),
(2, 'Sanjay Konchada', 'sanjaykonchada@gmail.com'),
(3, 'Sujatha Konchada', 'sujathakonchada@gmail.com'),
(4, 'Keerthana Maddi', 'keerthana@gmail.com'),
(5, 'Sruthi Ganta', 'sruthiganta@gmail.com'),
(6, 'Amisha Gupta', 'amishagupta@gmail.com');

INSERT INTO ProductInfo (ProductID, ProductSpecificationsJSON, SupplierDetailsXML)
VALUES 
(1, '{"Dimensions": {"Height": "15 inches", "Width": "10 inches", "Depth": "1 inch"}, "Weight": "2 kg"}', 
    '<Supplier><Name>ABC Supplies</Name><Location>New York</Location><Contact>123-456-7890</Contact></Supplier>'),
(2, '{"Dimensions": {"Height": "6 inches", "Width": "3 inches", "Depth": "0.5 inch"}, "Weight": "200 grams"}', 
    '<Supplier><Name>XYZ Distributors</Name><Location>San Francisco</Location><Contact>987-654-3210</Contact></Supplier>'),
(3, '{"Dimensions": {"Height": "8 inches", "Width": "5 inches", "Depth": "0.4 inch"}, "Weight": "500 grams"}', 
    '<Supplier><Name>Global Traders</Name><Location>Chicago</Location><Contact>456-789-0123</Contact></Supplier>');