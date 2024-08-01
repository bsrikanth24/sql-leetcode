/* Write your T-SQL query statement below */
WITH tbl_avg AS 
(   SELECT 
        visited_on,
        SUM(amount) OVER(ORDER BY visited_on rows between 6 preceding and current row) amount,
        ROUND(AVG(CAST(amount AS DECIMAL(10, 2))) OVER(ORDER BY visited_on rows between 6 preceding and current row), 2) average_amount
    FROM
        (SELECT visited_on, SUM(amount) amount FROM Customer GROUP BY visited_on) A
)
SELECT
    visited_on, amount, average_amount
FROM
    tbl_avg
WHERE DATEADD(Day, -6, visited_on) IN (SELECT visited_on FROM Customer)
ORDER BY visited_on;