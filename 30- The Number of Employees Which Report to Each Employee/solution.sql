/* Write your T-SQL query statement below */
SELECT
    manager.employee_id, 
    manager.name, 
    COUNT(reports.employee_id) reports_count, 
    ROUND(AVG(CAST(reports.age AS DECIMAL(10, 2))), 0) average_age
FROM
    Employees manager INNER JOIN (SELECT * FROM Employees WHERE reports_to IS NOT NULL) reports
    ON manager.employee_id = reports.reports_to
GROUP BY
    manager.employee_id, 
    manager.name
ORDER BY manager.employee_id;