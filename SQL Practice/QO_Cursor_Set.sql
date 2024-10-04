-- Declare a variable to hold each ProductID
DECLARE @ProductID INT;
DECLARE @CurrentStock INT;

-- Declare a cursor to fetch ProductIDs and their Stock
DECLARE cur CURSOR FOR 
SELECT ProductID, Stock 
FROM Products 
WHERE Stock < 40;  -- Example condition to find products with low stock

-- Open the cursor
OPEN cur;

-- Fetch the first row
FETCH NEXT FROM cur INTO @ProductID, @CurrentStock;

-- Loop through each product
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print the ProductID and Current Stock for demonstration
    PRINT 'Processing Product ID: ' + CAST(@ProductID AS NVARCHAR(10)) + 
          ', Current Stock: ' + CAST(@CurrentStock AS NVARCHAR(10));

    -- Update the Stock (just as an example, let's say we add 20 to low stock products)
    UPDATE Products 
    SET Stock = Stock + 20
    WHERE ProductID = @ProductID;

    -- Fetch the next row
    FETCH NEXT FROM cur INTO @ProductID, @CurrentStock;
END;

-- Close and clean up the cursor
CLOSE cur;
DEALLOCATE cur;



-- Update the stock of all products with low stock in a single operation: Instead of using a cursor to update low stock products one by one, use a set-based operation to update all qualifying products in a single query
UPDATE Products
SET Stock = Stock + 20  -- Adding 20 to the current stock
WHERE Stock < 40;  -- Example condition to find products with low stock
