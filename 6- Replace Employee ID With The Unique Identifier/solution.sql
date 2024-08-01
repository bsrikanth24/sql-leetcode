/* Write your T-SQL query statement below */
SELECT
    eu.unique_id, e.name
FROM
    Employees AS e LEFT JOIN EmployeeUni AS eu
ON
    e.id = eu.id;