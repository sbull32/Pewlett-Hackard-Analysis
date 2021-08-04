--Create retirement by title Table
SELECT e.emp_no,
    e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) rbt.emp_no,
    rbt.first_name,
	rbt.last_name,
	rbt.title
INTO unique_titles
FROM retirement_titles as rbt
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

--Retrieve employees about to retire from unique titles table
SELECT COUNT(rbut.title),
		rbut.title
INTO retiring_titles
FROM retirement_by_unique_title as rbut
GROUP BY (rbut.title)
ORDER BY COUNT(rbut.title) DESC;

SELECT * FROM retiring_titles;