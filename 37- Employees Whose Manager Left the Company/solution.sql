/* Write your T-SQL query statement below */
SELECT 
    employee_id
FROM
    Employees E1
WHERE
    E1.manager_id IS NOT NULL
    AND E1.manager_id NOT IN (SELECT employee_id FROM Employees E2)
    AND E1.salary < 30000
ORDER BY 
    employee_id;