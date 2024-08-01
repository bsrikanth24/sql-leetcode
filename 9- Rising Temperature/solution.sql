/* Write your T-SQL query statement below */
SELECT wtoday.id
FROM
    Weather wtoday INNER JOIN Weather wyesterday
    ON wtoday.recordDate = DATEADD(DAY, 1, CAST(wyesterday.recordDate AS DATE))
WHERE wtoday.temperature > wyesterday.temperature;