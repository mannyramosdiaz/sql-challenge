DROP TABLE IF Exists departments;
CREATE TABLE departments(
dept_no VARCHAR(30) NOT NULL,
dept_name VARCHAR(30) NOT NULL,
Primary key (dept_no)
);
SELECT * FROM departments
DROP TABLE IF Exists dept_emp;
CREATE TABLE dept_emp(
emp_no INT,
dept_no VARCHAR(30) NOT NULL,
foreign key (emp_no) references employees (emp_no)
);
SELECT * FROM dept_emp
DROP TABLE IF Exists dept_manager;
CREATE TABLE dept_manager(
dept_no VARCHAR(30) NOT NULL,
emp_no INT,
foreign key (dept_no) references departments (dept_no),
foreign key (emp_no) references employess (emp_no)
);
SELECT * FROM dept_manager
DROP TABLE IF Exists employees;
CREATE TABLE employees(
emp_no INT NOT NULL,
emp_title_id VARCHAR(30) NOT NULL,
birth_date DATE,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex VARCHAR(30) NOT NULL,
hire_date DATE,
primary key (emp_no)
);
SELECT * FROM employees
DROP TABLE IF Exists salaries;
CREATE TABLE salaries(
emp_no INT,
salary INT,
foreign key (emp_no) references employees(emp_no)
);
SELECT * FROM salaries
DROP TABLE titles;
CREATE TABLE titles(
title_id VARCHAR(30) NOT NULL,
title VARCHAR(30) NOT NULL
);
SELECT * FROM titles;

9:12
so first new code to make tables
9:12
this is second part OPEN NEW QUERY AND SAVE AS DATAANALYSIS
9:12
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
    Left join salaries as s
    on (e.emp_no = s.emp_no)
order by e.emp_no
;
--2. List first name, last name, and hire date for employees who were hired in 1986.
select emp_no, first_name, last_name
from employees
where hire_date >= ‘1986-01-01’ and hire_date < ‘1987-01-01’;
-- 3.List the manager of each department with the following information: department number, department name, the manager’s employee number, last name, first name.
select dm.dept_no, de.dept_name, emp.emp_no, emp.last_name, emp.first_name
from dept_manager as dm
inner join departments as de
on dm.dept_no = de.dept_no
inner join employees as emp
on dm.emp_no = emp.emp_no;
select * from departments;
-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select  emp.emp_no, emp.last_name, emp.first_name, de.dept_name
from employees as emp
inner join dept_emp as dept
on emp.emp_no = dept.emp_no
inner join departments as de
on de.dept_no = dept.dept_no;
--5.List first name, last name, and sex for employees whose first name is “Hercules” and last names begin with “B.”
select first_name, last_name, sex
from employees
where first_name = ‘Hercules’ and last_name like ‘B%’;
--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select  emp.emp_no, emp.last_name, emp.first_name, de.dept_name
from employees as emp
inner join dept_emp as dept
on emp.emp_no = dept.emp_no
inner join departments as de
on de.dept_no = dept.dept_no
where de.dept_name = ‘Sales’;
--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select  emp.emp_no, emp.last_name, emp.first_name, de.dept_name
from employees as emp
inner join dept_emp as dept
on emp.emp_no = dept.emp_no
inner join departments as de
on de.dept_no = dept.dept_no
where de.dept_name = ‘Sales’ or de.dept_name = ‘Development’;
--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as “Frequency”
from employees
group by last_name
order by count(last_name) DESC;