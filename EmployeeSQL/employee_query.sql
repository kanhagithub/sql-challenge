-- Drop table if exists
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;


-- Create a new table
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);

SELECT * FROM titles;

-- Create a new table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;

-- Create a new table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

-- Create a new table
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;


-- Create a new table
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;
select * from employees;
select * from salaries;

--List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM 
		employees e
			inner join salaries s
				on e.emp_no = s.emp_no
;

select * from employees;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT e.first_name,e.last_name,e.hire_date
FROM
     employees e
WHERE
     date_part('year',hire_date )= 1986 ;

select * from employees;
select * from departments;
SELECT * FROM dept_manager;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name,e.last_name
 FROM departments d
  inner join dept_manager m
    on d.dept_no = m.dept_no
	inner join employees e
	on m.emp_no= e.emp_no
;

SELECT * FROM dept_emp;
select * from departments;
--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name,e.last_name
 FROM departments d
  inner join dept_emp m
    on d.dept_no = m.dept_no
	inner join employees e
	on m.emp_no= e.emp_no

select * from employees;	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 	
SELECT first_name, last_name, sex
   FROM employees e
    WHERE first_name = 'Hercules'
    AND last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name,e.last_name
 FROM departments d
  inner join dept_emp m
    on d.dept_no = m.dept_no
	inner join employees e
	on m.emp_no= e.emp_no
where
	d.dept_name = 'Sales'
;

--List each employee in the Sales and Development departments, including their employee number, last name, 
--first name, and department name 
SELECT  m.emp_no, e.first_name,e.last_name, d.dept_name
 FROM departments d
  inner join dept_emp m
    on d.dept_no = m.dept_no
	inner join employees e
	on m.emp_no= e.emp_no
where
	d.dept_name in ('Sales','Development')

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name
select * from employees;
SELECT last_name, count(emp_no)
FROM employees
group by last_name
ORDER BY count(emp_no) DESC;