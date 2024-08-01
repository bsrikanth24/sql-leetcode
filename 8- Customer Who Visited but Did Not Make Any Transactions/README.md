## 8- Customer Who Visited but Did Not Make Any Transactions

Table: Visits

| Column Name | Type    |
|-------------|---------|
| visit_id    | int     |
| customer_id | int     |

visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.
 

Table: Transactions


| Column Name    | Type    |
|----------------|---------|
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |

transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.
 

Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Return the result table sorted in any order.

The result format is in the following example.

Example 1:

Input: 
Visits

| visit_id | customer_id |
|----------|-------------|
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |

Transactions

| transaction_id | visit_id | amount |
|----------------|----------|--------|
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |

Output: 

| customer_id | count_no_trans |
|-------------|----------------|
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |

Explanation: 
Customer with id = 23 visited the mall once and made one transaction during the visit with id = 12.
Customer with id = 9 visited the mall once and made one transaction during the visit with id = 13.
Customer with id = 30 visited the mall once and did not make any transactions.
Customer with id = 54 visited the mall three times. During 2 visits they did not make any transactions, and during one visit they made 3 transactions.
Customer with id = 96 visited the mall once and did not make any transactions.
As we can see, users with IDs 30 and 96 visited the mall one time without making any transactions. Also, user 54 visited the mall twice and did not make any transactions.

### Discussion
This could have been attempting with a NOT IN subquery rather than a LEFT JOIN/ IS NULL. The choice can vary depending on the database engine and whether or not you need to consider how to handle NULLs in the right table (as opposed to the left one in the join).
🍿 Null is not equal to anything—not even to another null . According to the three-valued logic of SQL, the result of null = null is not true but unknown.
This results in the NOT IN issue, which is a simple consequence of three-valued logic, but it's not immediately intuitive. It's a well-known trap.
🍿Therefore, in a scenario explained in the following [link](https://explainextended.com/2009/09/15/not-in-vs-not-exists-vs-left-join-is-null-sql-server/)
we can compare NOT IN vs NOT EXISTS vs LEFT JOIN / IS NULL.
🍿NOT IN cannot handle nullable columns on either side of the subquery, and the other two methods are more reliable. Unless you have non-nullable columns on boths sides, in which case you're okay to use any three methods.