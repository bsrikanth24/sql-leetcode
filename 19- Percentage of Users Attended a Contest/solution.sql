/* Write your T-SQL query statement below */
SELECT
    r.contest_id, 
    ROUND(CAST(COUNT(r.user_id) AS DECIMAL(10,2))*100/(SELECT COUNT(*) FROM Users), 2) percentage
FROM
    Users u INNER JOIN  Register r
    ON r.user_id = u.user_id
GROUP BY 
    r.contest_id
ORDER BY 
    percentage DESC, r.contest_id;