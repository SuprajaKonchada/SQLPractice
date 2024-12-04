-- Simple Dynamic SQL with EXEC
DECLARE @TableName NVARCHAR(50) = 'Customers';
DECLARE @SQL NVARCHAR(MAX);

-- Constructing dynamic SQL
SET @SQL = 'SELECT * FROM ' + QUOTENAME(@TableName);

-- Execute the query
EXEC sp_executesql @SQL;

-- Dynamic SQL with WHERE Clause Based on Conditions
DECLARE @TableName NVARCHAR(50) = 'Customers';
DECLARE @FilterColumn NVARCHAR(50) = 'FirstName';
DECLARE @FilterValue NVARCHAR(50) = 'Supraja';
DECLARE @SQL NVARCHAR(MAX);

-- Construct dynamic SQL with WHERE clause
SET @SQL = 'SELECT * FROM ' + QUOTENAME(@TableName) +
           ' WHERE ' + QUOTENAME(@FilterColumn) + ' = @Value';

-- Execute the query with parameterized value
EXEC sp_executesql @SQL, N'@Value NVARCHAR(50)', @Value = @FilterValue;

-- Dynamic SQL for Table or Column Selection Based on Input
DECLARE @TableName NVARCHAR(50) = 'Products';
DECLARE @ColumnName NVARCHAR(50) = 'Price';
DECLARE @MinValue DECIMAL(10,2) = 37000 ;
DECLARE @SQL NVARCHAR(MAX);

-- Construct dynamic SQL to select from the specified column with a condition
SET @SQL = 'SELECT ProductName, ' + QUOTENAME(@ColumnName) + ' FROM ' + QUOTENAME(@TableName) + 
           ' WHERE ' + QUOTENAME(@ColumnName) + ' > @MinValue';

-- Execute the dynamic SQL query with parameterized value
EXEC sp_executesql @SQL, N'@MinValue DECIMAL(10,2)', @MinValue = @MinValue;

-- Dynamical SQL to insert data into table
DECLARE @TableName NVARCHAR(50) = 'Customers';
DECLARE @Columns NVARCHAR(100) = 'FirstName, LastName, Email';
DECLARE @Values NVARCHAR(100) = '''Sruthi'', ''Ganta'', ''sruthi.ganta@gmail.com''';
DECLARE @SQL NVARCHAR(MAX);

-- Construct dynamic SQL for Insert
SET @SQL = 'INSERT INTO ' + QUOTENAME(@TableName) + ' (' + @Columns + ') VALUES (' + @Values + ')';

-- Execute the dynamic SQL to insert data
EXEC sp_executesql @SQL;

-- Dynamic SQL for Conditional Updates
DECLARE @TableName NVARCHAR(50) = 'Customers';
DECLARE @ColumnName NVARCHAR(50) = 'Email';
DECLARE @OldValue NVARCHAR(100) = 'amishagupta@gmail.com';
DECLARE @NewValue NVARCHAR(100) = 'amisha.gupta@gmail.com';
DECLARE @SQL NVARCHAR(MAX);

-- Construct dynamic SQL to update the table
SET @SQL = 'UPDATE ' + QUOTENAME(@TableName) + 
           ' SET ' + QUOTENAME(@ColumnName) + ' = @NewValue ' +
           ' WHERE ' + QUOTENAME(@ColumnName) + ' = @OldValue';

-- Execute the dynamic SQL with parameters
EXEC sp_executesql @SQL, N'@OldValue NVARCHAR(100), @NewValue NVARCHAR(100)', @OldValue = @OldValue, @NewValue = @NewValue;
