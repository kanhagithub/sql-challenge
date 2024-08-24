# sql-challenge
## Background

This repository discusses a research project on the employee database at  Pewlett Hackard Corporation from the 1980s and 1990s. All that remains of the database of employees from that period is in six CSV files.

On this project,  a table was created that holds employees data in the CSVs, import the CSVs into a SQL database, and the data exploration was conducted to answering the research questions, and discussed in the following parts:

## 1. Data Modeling

To model the employee data a  basic data modeling technique called  Entity-Relationship Diagrams (ERD) was used. By using this technique six employee database entities or tables are identified, these entities are `employees`, `departments`, `salaries`, `titles`, `department managers`, and `department employees`. The attribute or the data type of the entities also presented. At last, the ER diagram was drawn to visualize the relationships between entities/objects (primary key or foreign keys in a database).

## 2. Data Engineering

By using the available information a table schema for each of the six CSV files was created, and the data types, primary keys, foreign keys, and constraints also developed. The order of the table is based on the primary, and foreign arrangements. 

## 3. Data Analysis

After completing the importing process a Postgresql analysiss was perfomed and you can find the full query in this file [employees_schema.sql]   

The analysis query performed, and cascaded in the following formats: 

1. The query to list the employee number, last name, first name, sex, and salary of each employee

```SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM 
		employees e
			inner join salaries s
				on e.emp_no = s.emp_no
;

   ```
   
2. The query to List the first name, last name, and hire date for the employees who were hired in 1986 


```
SELECT e.first_name,e.last_name,e.hire_date
FROM
     employees e
WHERE
     date_part('year',hire_date )= 1986 ;


 ```
 
3. The query list List the manager of each department along with their department number, department name, employee number, last name, and first name
   
```SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name,e.last_name
 FROM departments d
  inner join dept_manager m
    on d.dept_no = m.dept_no
	inner join employees e
	on m.emp_no= e.emp_no
;
 ```

4. The query to list the department number for each employee along with that employee’s employee number, last name, first name, and department name.
   
 ```SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name,e.last_name
 FROM departments d
  inner join dept_emp m
    on d.dept_no = m.dept_no
	inner join employees e
	on m.emp_no= e.emp_no 
 ```

5. The query to list first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

```SELECT first_name, last_name, sex
   FROM employees e
    WHERE first_name = 'Hercules'
    AND last_name like 'B%'

 ```

6. The query to list each employee in the Sales department, including their employee number, last name, and first name.

```SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name,e.last_name
 FROM departments d
  inner join dept_emp m
    on d.dept_no = m.dept_no
	inner join employees e
	on m.emp_no= e.emp_no
where
	d.dept_name = 'Sales'
;
 ```
7. The query to list each employee in the Sales and Development departments, including their employee number, last name, 
--first name, and department name

```SELECT  m.emp_no, e.first_name,e.last_name, d.dept_name
 FROM departments d
  inner join dept_emp m
    on d.dept_no = m.dept_no
	inner join employees e
	on m.emp_no= e.emp_no
where
	d.dept_name in ('Sales','Development')

 ```

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

```select * from employees;
SELECT last_name, count(emp_no)
FROM employees
group by last_name
ORDER BY count(emp_no) DESC;

 ```
