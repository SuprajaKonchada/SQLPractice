WITH EmployeeHierarchy AS (
    -- Base case: Start with top-level managers
    SELECT 
        EmployeeID,
        FullName,
        ManagerID,
        Position,
        0 AS Level -- Root level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive case: Find employees reporting to current employees
    SELECT 
        e.EmployeeID,
        e.FullName,
        e.ManagerID,
        e.Position,
        eh.Level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT 
    EmployeeID,
    FullName,
    ManagerID,
    Position,
    Level
FROM EmployeeHierarchy
ORDER BY Level, ManagerID;
