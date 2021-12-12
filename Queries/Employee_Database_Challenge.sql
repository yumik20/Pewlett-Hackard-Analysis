-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER By emp_no

-- Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT emp_no, title, from_date, to_date
FROM titles

-- Deliverable step 1-7, join table, creat a new table 
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date,ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no =ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no

SELECT * FROM retirement_titles

SELECT COUNT (emp_no)
FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO retirement_unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT COUNT(1) AS count, title 
INTO retiring_titles
FROM retirement_unique_titles 
GROUP BY (title) 
ORDER BY count DESC;
