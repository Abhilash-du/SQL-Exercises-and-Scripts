/*
PROBLEM:-

Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
In SQL, id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.


Find the nth highest salary from the Employee table. If there is no nth highest salary, return null.

The result format is in the following example.



Example 1:

Input:
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output:
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
Example 2:

Input:
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
Output:
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| null                   |
+------------------------+
*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1; -- Subtract 1 from N to get the correct offset value
  RETURN (
      SELECT(SELECT DISTINCT salary
      FROM Employee ORDER BY salary DESC
      LIMIT 1
      OFFSET N)

  );
END

/*
Explanation:

We declare a variable offset_value to store the value of N - 1.
The variable offset_value is then used in the OFFSET clause of the subquery to correctly skip the first N-1 rows.
The function should now work correctly, and when you call getNthHighestSalary(2), it will return the value 200, which is the 2nd highest salary in the "Employee" table.
Remember to set the DELIMITER before creating the function to handle the semicolon inside the function body.
/*