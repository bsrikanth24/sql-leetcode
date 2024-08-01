/* Write your T-SQL query statement below */
SELECT
    s.user_id, 
    ROUND(CASE WHEN COUNT(c.user_id) = 0 THEN 0.00 ELSE (SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END))/CAST((COUNT(c.user_id)) AS DECIMAL(10,2)) END, 2) confirmation_rate
FROM
    Signups s LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;