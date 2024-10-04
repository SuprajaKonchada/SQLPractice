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