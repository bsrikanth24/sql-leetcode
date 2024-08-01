## 43- Department Top Three Salaries

Table: Employee

| Column Name  | Type    |
|--------------|---------|
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |

id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference column) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of a department and its name.
 

A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:

| id | name  | salary | departmentId |
|----|-------|--------|--------------|
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |

Department table:

| id | name  |
|----|-------|
| 1  | IT    |
| 2  | Sales |

Output: 

| Department | Employee | Salary |
|------------|----------|--------|
| IT         | Max      | 90000  |
| IT         | Joe      | 85000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |

Explanation: 
In the IT department:
- Max earns the highest unique salary
- Both Randy and Joe earn the second-highest unique salary
- Will earns the third-highest unique salary

In the Sales department:
- Henry earns the highest salary
- Sam earns the second-highest salary
- There is no third-highest salary as there are only two employees

### Discussion

|SALARY | ROW_NUMBER | RANK | DENSE_RANK |
|-------|------------|------|------------|
|1000   | 1          | 1    | 1          |          
|1500   | 2          | 2    | 2          |
|1500   | 3          | 2    | 2          |
|2000   | 4          | 4    | 3          |
|2200   | 5          | 5    | 4          |
|2500   | 6          | 6    | 5          |
|2500   | 7          | 6    | 5          |
|2500   | 8          | 6    | 5          |
|3000   | 9          | 9    | 6          |

Hopefully you can see above that when a tie of two or more records appears, both RANK and DENSE_RANK assign the same rank to all records with the same value. However, where they differ is that RANK continues the rank count in line with the ROW_NUMBER series, while DENSE_RANK does not, and instead continues the rank count with the next value after the duplicate rank.

Now getting to your question, whether you choose RANK or DENSE_RANK depends on your requirements. For example, if you were reporting winners, and always needed to report a first, second, and third place, regardless of ties for each place, you would use DENSE_RANK. Otherwise, you would use RANK, which might mean that there is no second or third place. If you were certain that there could never be duplicates, then you could just use ROW_NUMBER.
source: https://stackoverflow.com/questions/64420584/when-to-choose-rank-over-dense-rank-or-row-number