-- SQL Homework Arthur Adjamoglian

drop table if exists departments,
drop table if exists dept_emp,
drop table if exists dept_manager,
drop table if exists employees,
drop table if exists salaries,
drop table if exists titles;

create table employees (
	emp_no INT primary key,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR(1),
	hire_date DATE);
	
create table titles (
	emp_no INT references employees (emp_no),
	title VARCHAR,
	from_date DATE,
	to_date DATE);
	
create table salaries (
	emp_no INT references employees (emp_no),
	salary INT,
	from_date DATE,
	to_date DATE);
	
create table departments (
	dept_no VARCHAR primary key,
	dept_name VARCHAR);
	
create table dept_emp (
	emp_no INT references employees (emp_no),
	dept_no VARCHAR references departments (dept_no),
	from_date DATE,
	to_date DATE);
	
create table dept_manager (
	dept_no VARCHAR references departments (dept_no),
	emp_no INT references employees (emp_no),
	from_date DATE,
	to_date DATE);
	
	
--------------------------------------------

-- #1

select employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.gender,
	salaries.salary
from employees
inner join salaries on
salaries.emp_no = employees.emp_no

-- #2 

select * from employees
where EXTRACT(year FROM "hire_date") = 1986

-- #3

select 	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name,
	dept_manager.from_date,
	dept_manager.to_date
from dept_manager
join departments on
dept_manager.dept_no = departments.dept_no
join employees on
employees.emp_no = dept_manager.emp_no

-- #4

select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on 
dept_emp.emp_no = employees.emp_no
join departments on
departments.dept_no = dept_emp.dept_no

-- #5

select * from employees
where first_name = 'Hercules'
and last_name like 'B%'

-- #6

select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on
dept_emp.emp_no = employees.emp_no
join departments on
departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales'

-- #7

select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on
dept_emp.emp_no = employees.emp_no
join departments on
departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales' or
dept_name = 'Developement'

-- #8

SELECT last_name, COUNT(*) 
	FROM employees 
	GROUP BY last_name 
	ORDER BY 2 DESC;