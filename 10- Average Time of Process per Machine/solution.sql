/* Write your T-SQL query statement below */
/*SELECT  
        aStart.machine_id, 
        ROUND(SUM(aEnd.timestamp - aStart.timestamp)/COUNT(aStart.process_id), 3) as processing_time
FROM 
    (SELECT * FROM Activity 
    WHERE activity_type = 'start') aStart 
    INNER JOIN 
    (SELECT * FROM Activity 
    WHERE activity_type = 'end') aEnd
    ON 
    aStart.machine_id = aEnd.machine_id 
    AND 
    aStart.process_id = aEnd.process_id
GROUP BY aStart.machine_id
ORDER BY aStart.machine_id;*/

/* Faster because of integer comparison (timestamp) rather than scanning string*/
SELECT  
        aStart.machine_id, 
        ROUND(SUM(aEnd.timestamp - aStart.timestamp)/COUNT(aStart.process_id), 3) as processing_time
FROM 
    Activity aStart 
    INNER JOIN 
    Activity aEnd
    ON 
    aStart.machine_id = aEnd.machine_id 
    AND 
    aStart.process_id = aEnd.process_id
    AND aStart.timestamp < aEnd.timestamp
GROUP BY aStart.machine_id
ORDER BY aStart.machine_id;