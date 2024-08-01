/* Write your T-SQL query statement below */
SELECT
    query_name, 
    ROUND(AVG(CAST(rating AS DECIMAL(10,2))/position), 2) quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)*100/CAST(COUNT(rating) AS DECIMAL(10,2)), 2) poor_query_percentage
FROM
    Queries q
WHERE query_name IS NOT NULL
GROUP BY 
    query_name;