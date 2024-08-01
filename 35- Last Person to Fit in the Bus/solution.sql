/* Write your T-SQL query statement below */
WITH t_accumulative_weight AS (
    SELECT 
        *,
        SUM(weight) OVER(ORDER BY turn) accumulative_weight
    FROM 
         Queue),
t_max_turn AS (
    SELECT 
        MAX(turn) max_turn
    FROM 
        t_accumulative_weight
    WHERE accumulative_weight <= 1000
)
SELECT 
    person_name
FROM
    Queue
WHERE turn IN (SELECT max_turn FROM t_max_turn)