/* Write your T-SQL query statement below */
WITH first_date AS (
    SELECT player_id,
    MIN(event_date) first_login
    FROM Activity
    GROUP BY player_id
)
SELECT
 ROUND(CAST(COUNT(aToday.player_id) AS DECIMAL(10,2))/(SELECT COUNT(DISTINCT player_id) FROM Activity), 2) fraction
FROM
    first_date aYesterday INNER JOIN Activity aToday
    ON aYesterday.player_id = aToday.player_id
    AND aYesterday.first_login = DATEADD(DAY, -1, aToday.event_date)