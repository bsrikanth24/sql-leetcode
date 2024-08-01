/* Write your T-SQL query statement below */
WITH tbl_aux AS (
    SELECT
        id, salary, DENSE_RANK() OVER(ORDER BY salary DESC) r
    FROM
        Employee),
tbl_aux1 AS (
    SELECT
        salary 
    FROM 
        tbl_aux
    WHERE r = 2)
SELECT 
    MAX(salary) AS SecondHighestSalary
FROM 
    tbl_aux1 