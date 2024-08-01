/* Write your T-SQL query statement below */
WITH tbl_distinct AS (
    SELECT DISTINCT sell_date, product FROM Activities
)
SELECT
    sell_date, 
    COUNT(product) num_sold, 
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) products
FROM
    tbl_distinct 
GROUP BY sell_date