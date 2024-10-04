BEGIN TRY
    BEGIN TRANSACTION;  -- Start the transaction
	-- SET DEADLOCK_PRIORITY -5;  -- Set deadlock priority (NORMAL, LOW, HIGH, or a specific number)

    -- Lock Product 1
    UPDATE Products
    SET Stock = Stock - 10
    WHERE ProductID = 1;

    WAITFOR DELAY '00:00:05';  -- Delay to simulate timing of deadlock

    -- Try to lock Product 2
    UPDATE Products
    SET Stock = Stock - 5
    WHERE ProductID = 2;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    PRINT 'Session 1 Error: ' + ERROR_MESSAGE();
    ROLLBACK TRANSACTION;
END CATCH;



execute sp_readerrorlog