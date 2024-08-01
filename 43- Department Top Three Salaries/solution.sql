/* Write your T-SQL query statement below */
WITH tbl AS (
    SELECT
        d.name AS Department, 
        e.name AS Employee, 
        Salary,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY Salary  DESC) rn
    FROM
        Employee e INNER JOIN Department d
        ON e.departmentId = d.id)
SELECT
    Department, Employee, Salary--, rn
FROM
    tbl
WHERE
    rn <= 3;