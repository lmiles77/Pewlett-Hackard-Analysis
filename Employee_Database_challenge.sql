# Create columns with the folowing data
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
# create retirement titles table based on birthday year
INTO retirement_titles
	FROM employees as e
	JOIN titles AS ti
	ON e.emp_no = ti.emp_no
	WHERE
	e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
	ORDER BY e.emp_no;

SELECT * FROM retirement_titles

# Get list of unique titles of employees
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
 	rt.last_name,
	rt.title
INTO unique_titles
   FROM retirement_titles AS rt
   ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles

# Get count of retiring titles
SELECT COUNT (title), 
	title
	INTO retiring_titles
	FROM unique_titles
	GROUP BY title
	ORDER BY count desc;
SELECT * FROM retiring_titles

# Employees Eligible to participate in Mentorship Program
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
	INTO mentor_eligibility
	FROM employees AS e
	INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
	ORDER BY emp_no;

SELECT * FROM mentor_eligibility



