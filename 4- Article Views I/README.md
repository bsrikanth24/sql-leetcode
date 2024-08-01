## 4- Article Views I
/* Write your T-SQL query statement below */
SELECT
    author_id AS id
FROM
    Views
WHERE
    author_id = viewer_id
GROUP BY author_id
ORDER BY author_id;

Table: Views

| Column Name   | Type    |
|---------------|---------|
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |

There is no primary key (column with unique values) for this table, the table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.
 

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The result format is in the following example.

Example 1:

Input: 
Views table:

| article_id | author_id | viewer_id | view_date  |
|------------|-----------|-----------|------------|
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |

Output: 

| id   |
|------|
| 4    |
| 7    |

### Discussion
This question required the authors listed. A unique list. For this purpose DISTINCT keyword is specifically provided to remove duplicates. GROUP BY keyword is used to provide the anchor for aggregtations like AVG, COUNT, SUM etc. However, if it is used without aggregations, it will act similar to DISTINCT, providing unique set of rows for the columns mentnioned in the GROUP BY clause.
This [link](https://stackoverflow.com/questions/164319/is-there-any-difference-between-group-by-and-distinct) has been instructive in this discussion.