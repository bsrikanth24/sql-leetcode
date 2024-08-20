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

NAME	  ID
Abbot	   1
Doris	   2
Emerson	 3
Green	   4
Jeames	 5
