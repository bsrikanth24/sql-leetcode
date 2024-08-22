CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(50),
 manager_id INT,
 salary INT,
 FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_id, employee_name, manager_id, salary) VALUES
(1, 'Alice', NULL, 150000),
(2, 'Bob', 1, 120000),
(3, 'Charlie', 1, 110000),
(4, 'David', 2, 105000),
(5, 'Eve', 2, 100000),
(6, 'Frank', 3, 95000),
(7, 'Grace', 3, 98000),
(8, 'Helen', 5, 90000);

SELECT 
  employee_id AS subordinate_id,
  employee_name AS subordinate_name,
  LEVEL - 1 AS hierarchy_level,
  salary - (SELECT salary FROM employees WHERE employee_id = 1) AS salary_difference
FROM employees
WHERE employee_id <> 1
CONNECT BY PRIOR employee_id = manager_id
START WITH manager_id IS NULL
ORDER BY hierarchy_level;

SUBORDINATE_ID	SUBORDINATE_NAME	HIERARCHY_LEVEL		SALARY_DIFFERENCE
2				          Bob						           1				-30000
3			         	Charlie					         1				-40000
4				         David					           2				-45000
5				         Eve						            2				-50000
7				         Grace					           2				-52000
6				         Frank					           2				-55000
8				         Helen				           	3				-60000
