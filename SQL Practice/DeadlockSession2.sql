BEGIN TRY
    BEGIN TRANSACTION;  -- Start the transaction
	-- SET DEADLOCK_PRIORITY NORMAL;  -- Set deadlock priority (NORMAL, LOW, HIGH, or a specific number)

    -- Lock Product 2
    UPDATE Products
    SET Stock = Stock - 5
    WHERE ProductID = 2;

    WAITFOR DELAY '00:00:05';  -- Delay to simulate timing of deadlock

    -- Try to lock Product 1
    UPDATE Products
    SET Stock = Stock - 10
    WHERE ProductID = 1;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    PRINT 'Session 2 Error: ' + ERROR_MESSAGE();
    ROLLBACK TRANSACTION;
END CATCH;
