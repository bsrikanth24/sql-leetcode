/* Write your T-SQL query statement below */
SELECT
    activity_date day, 
    COUNT(DISTINCT user_id) active_users
FROM 
    Activity
WHERE 
    activity_date <= CAST('2019-07-27' AS DATE)
    AND activity_date > DATEADD(DAY, -30, CAST('2019-07-27' AS DATE))
GROUP BY activity_date;