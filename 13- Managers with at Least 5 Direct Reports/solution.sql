/* Write your T-SQL query statement below */
/*SELECT name
FROM
(SELECT
    dinosaur.id, dinosaur.name, COUNT(koalaBear.managerId) AS direct_reports
FROM
    Employee AS koalaBear RIGHT JOIN Employee dinosaur
    ON koalaBear.managerId = dinosaur.id
GROUP BY dinosaur.id, dinosaur.name) A
WHERE direct_reports >= 5;*/

WITH CTE AS (SELECT
    dinosaur.id, dinosaur.name, COUNT(koalaBear.managerId) AS direct_reports
FROM
    Employee AS koalaBear RIGHT JOIN Employee dinosaur
    ON koalaBear.managerId = dinosaur.id
GROUP BY dinosaur.id, dinosaur.name)
SELECT
    NAME
FROM
    CTE
WHERE 
    direct_reports >= 5;