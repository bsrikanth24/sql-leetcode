/* Write your T-SQL query statement below */
WITH tbl_category AS (
    SELECT
    SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END)'Low Salary',
    SUM(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END)'Average Salary',
    SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END)'High Salary'
    FROM
        Accounts)
SELECT
    category, accounts_count
FROM 
    (SELECT [Low Salary], [Average Salary], [High Salary] FROM tbl_category) AS SourceTable
UNPIVOT
( accounts_count for category IN ([Low Salary], [Average Salary], [High Salary])
) AS PivotTable;