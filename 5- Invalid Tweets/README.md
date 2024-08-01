## 5- Invalid Tweets

Table: Tweets

| Column Name    | Type    |
|----------------|---------|
| tweet_id       | int     |
| content        | varchar |

tweet_id is the primary key (column with unique values) for this table.
This table contains all the tweets in a social media app.
 

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Tweets table:

| tweet_id | content                          |
|----------|----------------------------------|
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |

Output: 

| tweet_id |
|----------|
| 2        |

Explanation: 
Tweet 1 has length = 14. It is a valid tweet.
Tweet 2 has length = 32. It is an invalid tweet.

### Discussion
It is important to note that we are lucky to be working with T-SQL in this case. Therefore, LEN() works fine, as we wanted length of tweet in characters. However, in MySQL LENGTH() returns length of tweet in bytes not characters. Now this works with characters that are held in a single byte. However, if some characters require more than a byte, then the difference between LENGTH() AND CHAR_LENGTH() becomes prominent.