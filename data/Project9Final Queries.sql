--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
--List the first name, last name, and hire date for the employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date
from employees 
where (RIGHT(hire_date,4)='1986')
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT "Departments".dept_no, "Departments".dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM "Departments"
JOIN dept_manager
ON "Departments".dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, "Departments".dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments"
ON dept_emp.dept_no = "Departments".dept_no;
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select e.last_name, e.first_name
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT "Departments".dept_name, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments"
ON dept_emp.dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales';
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "Departments".dept_name, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments"
ON dept_emp.dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales' 
OR "Departments".dept_name = 'Development';
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by count(last_name) desc;
