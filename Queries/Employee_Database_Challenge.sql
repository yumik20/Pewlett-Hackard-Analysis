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

--Deliverable 2

SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM employees AS em
INNER JOIN Dept_Emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN Titles as ti
ON (em.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND (de.to_date ='9999-01-01')
ORDER BY em.emp_no 

-- count titles by type for table mentorship_eligibilty.
SELECT COUNT(1) AS count, title 
FROM mentorship_eligibilty
GROUP BY (title) 
ORDER BY count DESC;


