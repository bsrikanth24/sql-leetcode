/* Write your T-SQL query statement below */
/*WITH lonely AS (
    SELECT CONCAT(cast(lat as varchar), cast(lon as varchar)) holder_location
    FROM Insurance
    GROUP BY CONCAT(cast(lat as varchar), cast(lon as varchar)) 
    HAVING COUNT(*) = 1
)
SELECT
    ROUND(SUM(tiv_2016*1.00), 2) tiv_2016
FROM
    Insurance I1
WHERE
    I1.tiv_2015 IN (SELECT tiv_2015 FROM Insurance I2 WHERE I2.pid <> I1.pid)
    AND
    (CONCAT(cast(lat as varchar), cast(lon as varchar))) IN (SELECT holder_location FROM lonely);*/ --700ms


WITH lonely AS (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
)
SELECT
    ROUND(SUM(tiv_2016*1.00), 2) tiv_2016
FROM
    Insurance I1
WHERE
    I1.tiv_2015 IN (SELECT tiv_2015 FROM Insurance I2 WHERE I2.pid <> I1.pid)
    AND
    pid IN (SELECT pid FROM Insurance I3 JOIN Lonely L ON I3.lat = L.lat AND I3.lon = L.lon);