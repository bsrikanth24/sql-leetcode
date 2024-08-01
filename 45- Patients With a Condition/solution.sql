/* Write your T-SQL query statement below */
SELECT 
    patient_id, patient_name, conditions 
FROM 
    Patients
    CROSS APPLY STRING_SPLIT(conditions, ' ')
WHERE
    value  LIKE 'DIAB1%';