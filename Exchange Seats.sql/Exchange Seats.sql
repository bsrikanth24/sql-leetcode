create table exchange_seats (
id int,
name varchar(20)
);

insert into exchange_seats(id,name) values(1, 'Doris'),(2, 'Abbot'),(3,'Green'),(4,'Emerson'),(5,'Jeames');

select * from exchange_seats

ID	NAME
1	  Doris
2	  Abbot
3	  Green
4	  Emerson
5	  Jeames


SELECT 
    name,
    CASE 
        WHEN MOD(id, 2) = 0 THEN id - 1 
        ELSE id + 1 
    END AS id
FROM 
    exchange_seats
ORDER BY 
    id;

NAME	   ID
Abbot	   1
Doris	   2
Emerson	   3
Green	   4
Jeames	   5


/* SELECT 
    name,
    CASE 
        WHEN MOD(id, 2) = 0 THEN id - 1 
        when MOD(id, 2)!= 0 and id < count(*) over() then id + 1 else id end as id
  from exchange_seats

NAME	ID
A	    2
B	    1
C	    4
D	    3
E	    5  */

select case when mod(id,2) = 0 then lag(name,1,name) over w else lead(name,1,name)
over w end as name, id from test
window w as (order by id) order by name;

NAME	ID
A	    2
B	    1
C	    4
D	    3
E	    5
