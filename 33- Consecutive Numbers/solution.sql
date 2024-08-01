/* Write your T-SQL query statement below */
SELECT
    DISTINCT first.num ConsecutiveNums
FROM
    Logs first INNER JOIN Logs second
    ON first.id = (second.id - 1) AND first.num = second.num
    INNER JOIN Logs third
    ON second.id = (third.id - 1) AND second.num = third.num;