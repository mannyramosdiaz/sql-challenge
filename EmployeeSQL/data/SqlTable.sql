DROP TABLE departments;

CREATE TABLE departments(
dept_no VARCHAR(30) NOT NULL,
dept_name VARCHAR(30) NOT NULL
);

SELECT * FROM departments;

CREATE TABLE dept_emp(
emp_no INT,
dept_no VARCHAR(30) NOT NULL
);
SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
dept_no VARCHAR(30) NOT NULL,
emp_no INT
);
SELECT * FROM dept_manager
DROP TABLE dept_employees;
CREATE TABLE dept_employees(
emp_no INT,
emp_title_id VARCHAR(30) NOT NULL,
birth_date DATE,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex VARCHAR(30) NOT NULL,
hire_date DATE
);
SELECT * FROM dept_employees;

CREATE TABLE salaries(
emp_no INT,
salary INT
);
SELECT * FROM salaries;
DROP TABLE titles;
CREATE TABLE titles(
title_id VARCHAR(30) NOT NULL,
title VARCHAR(30) NOT NULL
);
SELECT * FROM titles;