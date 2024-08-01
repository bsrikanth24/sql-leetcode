/* Write your T-SQL query statement below */
WITH t_count AS (
    SELECT 
        employee_id, 
        COUNT(DISTINCT department_id) dept_cnt
    FROM
        Employee
    GROUP BY 
        employee_id
)
SELECT
    e.employee_id, e.department_id
FROM
    Employee e INNER JOIN t_count
    ON e.employee_id = t_count.employee_id
WHERE 
    (e.primary_flag = 'Y' AND dept_cnt > 1)
    OR (dept_cnt = 1);