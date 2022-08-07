-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Create new table from our query
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

--Joining departments and dept_manger tables
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

SELECT * FROM retirement_info;

--Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

--Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO count_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM count_by_dept;

SELECT * FROM salaries;

SELECT * FROM salaries
ORDER BY to_date DESC;

--Create an updated employee info list
SELECT emp_no,
	first_name,
	last_name,
	gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

DROP TABLE emp_info;

--Fixing table to include To Date and Salary columns to emp info
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '999-01-01');
	
SELECT * FROM emp_info;

SELECT * FROM salaries;

DROP TABLE emp_info;

--Fixing table to include To Date and Salary columns to emp info
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_data	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '999-01-01');

SELECT * FROM emp_data;

DROP TABLE emp_data;

--Fixing table to include To Date and Salary columns to emp info
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '999-01-01');
	
SELECT * FROM emp_info;

SELECT * FROM employees;

SELECT * FROM dept_emp;

DROP TABLE dept_emp;

CREATE TABLE dept_emp ( 
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no)
);

SELECT * FROM dept_emp;

DROP TABLE dept_emp;

CREATE TABLE dept_emp ( 
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no)
);

SELECT * FROM dept_emp;

DROP TABLE dept_emp;

CREATE TABLE dept_emp ( 
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no)
);

CREATE TABLE IF NOT EXISTS public.dept_emp (
    emp_no integer NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT pk_emp_no PRIMARY KEY (emp_no, from_date, to_date),
    CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

SELECT * FROM dept_emp;

--Fixed dept_emp table as composite updated to include To Date and Salary columns to emp info
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '999-01-01');
	
SELECT * FROM emp_info;

DROP TABLE emp_info;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '999-01-01');
	
SELECT * FROM emp_info;

SELECT * FROM emp_info;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM dept_emp;

SELECT E.EMP_NO,
	E.FIRST_NAME,
	E.LAST_NAME,
	E.GENDER,
	S.SALARY,
	DE.TO_DATE
FROM EMPLOYEES AS E
INNER JOIN SALARIES AS S ON (E.EMP_NO = S.EMP_NO)
INNER JOIN DEPT_EMP AS DE ON (E.EMP_NO = DE.EMP_NO)
WHERE (E.BIRTH_DATE BETWEEN '1952-01-01' AND '1955-12-31')
	AND (E.HIRE_DATE BETWEEN '1985-01-01' AND '1988-12-31')
	AND (DE.TO_DATE = '999-01-01');
	
SELECT * FROM dept_emp;

SELECT * FROM retirement_info;

DROP TABLE emp_info;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '999-01-01');
	
SELECT * FROM emp_info;

DROP TABLE emp_info;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '999-01-01');
	
SELECT * FROM emp_info;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary
INTO new_table
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM new_table;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	de.to_date
INTO newest_table	
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '999-01-01');
	
SELECT * FROM newest_table;

DROP TABLE newest_table;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	de.to_date
INTO newest_table	
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
SELECT * FROM newest_table;

--Fixed dept_emp table as composite updated to include To Date and Salary columns to emp info
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '1999-01-01');

DROP TABLE emp_info;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '1999-01-01');
	
SELECT * FROM emp_info;

DROP TABLE new_table;

DROP TABLE newest_table;

SELECT * FROM emp_info;

SELECT * FROM emp_info;

DROP TABLE emp_info;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info	
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
	
SELECT * FROM emp_info;

SELECT * FROM emp_info;

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
SELECT * FROM manager_info;		

SELECT * FROM current_emp;

SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT * FROM retirement_info;

SELECT * FROM current_emp;

SELECT * FROM dept_emp;

SELECT * FROM retirement_info;

-Create Sales dept retirement list
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name, 
	d.dept_name
INTO sales_retiring
FROM retirement_info as ri
	INNER JOIN dept_emp AS de
	ON (ri.emp_no = de.emp_no)
	INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no);
	
SELECT * FROM sales_retiring;

SELECT COUNT(emp_no)
FROM sales_retiring;

DROP TABLE sales_retiring;

-Create Sales dept retirement list
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name, 
	d.dept_name
INTO sales_retiring
FROM retirement_info as ri
	INNER JOIN dept_emp AS de
	ON (ri.emp_no = de.emp_no)
	INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales';

SELECT COUNT(emp_no)
FROM sales_retiring;

--Sales and Development teams retiring
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name, 
	d.dept_name
INTO sales_develop_retiring
FROM retirement_info as ri
	INNER JOIN dept_emp AS de
	ON (ri.emp_no = de.emp_no)
	INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales', 'Development');

SELECT COUNT(emp_no)
FROM sales_develop_retiring;