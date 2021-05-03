SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
	FROM employees as e
	JOIN titles AS ti
	ON e.emp_no = ti.emp_no
	WHERE
	e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
	ORDER BY e.emp_no;

SELECT * FROM retirement_titles

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
   rt.first_name,
   rt.last_name,
   rt.title
INTO unique_titles
   FROM retirement_titles AS rt
   ORDER BY emp_no ASC, to_date DESC;

	SELECT * FROM unique_titles

SELECT COUNT (title), 
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count desc;
SELECT * FROM retiring_titles