BEGIN TRY
    BEGIN TRANSACTION;  -- Start the transaction

    -- Savepoint for a partial rollback
    SAVE TRANSACTION SavePoint1;

    -- Step 1: Updates Product 1's stock
    UPDATE Products
    SET Stock = Stock - 10
    WHERE ProductID = 1;

    -- Savepoint after Product 1 update
    SAVE TRANSACTION SavePoint2;

    -- Step 2: Inserts an order for Product 1
    DECLARE @NewOrderID INT;
    INSERT INTO Orders (CustomerID) VALUES (1);  -- Assuming CustomerID = 1
    SET @NewOrderID = SCOPE_IDENTITY();  -- Capture the new OrderID

    -- Insert into OrderDetails
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
    VALUES (@NewOrderID, 1, 10, 76000.00);  -- 10 units of Product 1 at $1000/unit

    -- Step 3: Simultaneously, Update Product 1's stock
    -- This could cause a deadlock if both transactions attempt to lock the same resource
    UPDATE Products
    SET Stock = Stock - 5
    WHERE ProductID = 2;

    -- Commit the transaction if all steps succeed
    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    -- Check if the error is a deadlock (SQL Server error code 1205)
    IF ERROR_NUMBER() = 1205
    BEGIN
        PRINT 'Deadlock detected, rolling back to the last savepoint...';
        
        -- Rollback to the previous savepoint to avoid losing all progress
        ROLLBACK TRANSACTION SavePoint2;

        -- Retry the operation or take another course of action
        -- Optionally include retry logic here
    END
    ELSE
    BEGIN
        -- Rollback the entire transaction if another error occurs
        PRINT 'Error: ' + ERROR_MESSAGE();
        ROLLBACK TRANSACTION;
    END
END CATCH;

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
