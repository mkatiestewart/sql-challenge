--1)List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no = s.emp_no;

--2)List the first name, last name and hire date of employees hired in 1986.

SELECT * FROM employees
WHERE hire_date >= '01-01-1986'
AND hire_date <= '12-31-1986';

--3)List the manager of each department with their department number, department name, employee number
--first and last name.

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments AS d
INNER JOIN dept_manager AS m ON
m.dept_no = d.dept_no
JOIN employees AS e ON
e.emp_no = m.emp_no;

--4)List the department number of each employee along with the employee number, first and last name

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no;

--5)List first name, last name, and sex of each employee whose first name is Hercules whose
--last name begins with a 'B'.

SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6)List all employees in the sales department, including their employee number, first and last name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name = 'Sales';

--7)List all employees in the SAels and Development departments, include their employee number, first name,
--last name and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name = 'Development'
OR dp.dept_name = 'Sales';

--8)In descending order, list the frequency count of all of the employee last names.
--(How many employees share a last name)

SELECT e.last_name,
COUNT(last_name) AS "frequency" 
FROM employees AS e
GROUP BY e.last_name
ORDER BY COUNT(last_name) DESC;