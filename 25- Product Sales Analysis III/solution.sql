/* Write your T-SQL query statement below */
WITH first_sale AS 
(SELECT
    product_id, 
    MIN(year) first_year
FROM 
    Sales
GROUP BY 
    product_id)
SELECT
    s.product_id, fs.first_year, s.quantity, s.price
FROM
    Sales s INNER JOIN first_sale fs
    ON s.product_id = fs.product_id
    AND s.year = fs.first_year;