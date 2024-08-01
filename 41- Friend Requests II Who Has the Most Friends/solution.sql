/* Write your T-SQL query statement below */
WITH tbl_req AS (
    SELECT
        requester_id id, COUNT(distinct accepter_id) num
    FROM
        RequestAccepted
    GROUP BY requester_id),
tbl_acc AS (
    SELECT
        accepter_id id, COUNT(distinct requester_id) num
    FROM
        RequestAccepted
    GROUP BY accepter_id),
all_relationships AS (
    SELECT id, num
    FROM tbl_req
    UNION ALL
    SELECT id, num
    FROM tbl_acc
)
SELECT TOP 1 id, SUM(num) num
FROM all_relationships
GROUP BY id
ORDER BY SUM(num) DESC;