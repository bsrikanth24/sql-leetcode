/* Write your T-SQL query statement below */
SELECT
    FORMAT(trans_date, 'yyyy-MM') month, 
    country, 
    COUNT(id) trans_count,
    COUNT(CASE WHEN state = 'approved' THEN id ELSE NULL END) approved_count,
    SUM(amount) trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) approved_total_amount
FROM 
    Transactions
GROUP BY
    FORMAT(trans_date, 'yyyy-MM'), 
    country;