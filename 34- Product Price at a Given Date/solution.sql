/* Write your T-SQL query statement below */
WITH cte_1 AS (
    SELECT product_id, MAX(change_date) max_change_date
    FROM Products
    WHERE change_date <= CAST('2019-08-16' AS DATE)
    GROUP BY product_id
),
cte_2 AS (SELECT 
    t.product_id, COALESCE(MAX(max_change_date), MAX(change_date)) change_date
FROM 
    Products t LEFT JOIN cte_1
    ON t.product_id = cte_1.product_id
    AND t.change_date = cte_1.max_change_date
GROUP BY t.product_id)
SELECT p.product_id, 
        CASE WHEN cte_2.change_date <= CAST('2019-08-16' AS DATE) THEN p.new_price ELSE 10 END price
FROM
    Products p INNER JOIN cte_2
    ON p.product_id = cte_2.product_id
    AND p.change_date = cte_2.change_date;