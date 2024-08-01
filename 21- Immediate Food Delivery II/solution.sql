/* Write your T-SQL query statement below */
WITH cleaned AS (
    SELECT
        d.customer_id,
        CASE 
            WHEN order_date = customer_pref_delivery_date THEN 'immediate' 
            ELSE 'scheduled' END delivery_time,
        CASE 
            WHEN order_date = t_first_order.first_order_date THEN 'first_order_date' 
            ELSE 'subsequent' END delivery_date
    FROM
        Delivery d LEFT JOIN (SELECT customer_id, MIN(order_date) first_order_date FROM Delivery GROUP BY customer_id) t_first_order
        ON d.customer_id = t_first_order.customer_id
        )
SELECT 
    ROUND(COUNT(CASE WHEN delivery_time = 'immediate' THEN delivery_time ELSE NULL END)*100/CAST(COUNT(*) AS DECIMAL(10,2)), 2) immediate_percentage
FROM 
    cleaned
WHERE
    delivery_date = 'first_order_date'