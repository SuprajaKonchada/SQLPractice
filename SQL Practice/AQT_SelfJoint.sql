-- Self-join to find employees with the same manager (ManagerID = 1)
SELECT 
    e1.FullName AS EmployeeName
FROM Employees e1
INNER JOIN Employees e2 
    ON e1.ManagerID = e2.ManagerID
WHERE e2.ManagerID = 1  -- Only consider employees with ManagerID = 1
    AND e1.EmployeeID <> e2.EmployeeID  -- Avoid self-comparison
order by e1.EmployeeID;