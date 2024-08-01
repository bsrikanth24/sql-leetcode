## 41- Friend Requests II: Who Has the Most Friends
Table: RequestAccepted

| Column Name    | Type    |
|----------------|---------|
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |

(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.
The result format is in the following example.

Example 1:

Input: 
RequestAccepted table:

| requester_id | accepter_id | accept_date |
|--------------|-------------|-------------|
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |

Output: 

| id | num |
|----|-----|
| 3  | 3   |

Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.
 
### Discussion
Friends are a result of some user:
sending a request + accepting a request.
1- We need to count the number distinct accepter_id corresponding to a requester_id.(first cte)
2- We need to count the number distinct requester_id corresponding to an acceptor_id (second cte)
3- Both counts datasets can be concatenate with a UNION all (third cte)
4- Lastly, we can find sum of the counts, therefore finding the total number of friends for each id.