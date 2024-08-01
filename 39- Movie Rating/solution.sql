/* Write your T-SQL query statement below */
WITH rating_count AS (
    SELECT u.user_id, u.name, COUNT(rating) count
    FROM MovieRating mr INNER JOIN Users u on mr.user_id = u.user_id 
    GROUP BY u.user_id, u.name),
rating_avg AS (
    SELECT m.movie_id, m.title, avg(CAST(rating AS DECIMAL(10,2))) average
    FROM MovieRating mr INNER JOIN Movies m on mr.movie_id = m.movie_id
    WHERE YEAR(mr.created_at) = '2020' AND MONTH(mr.created_at) = 2
    GROUP BY m.movie_id, m.title)
SELECT name AS results FROM Users
WHERE
    user_id IN (SELECT TOP 1 user_id FROM rating_count ORDER BY count DESC, name)
UNION ALL
SELECT title AS results FROM Movies
WHERE
    movie_id IN (SELECT TOP 1 movie_id FROM rating_avg ORDER BY average DESC, title)