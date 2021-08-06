--Create a Mentorship Eligibilty table
SELECT DISTINCT ON (emp_no) e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO updated_mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1962-01-01' AND '1966-12-31')
ORDER BY emp_no;

SELECT COUNT(ume.title),
		ume.title
INTO updated_eligible_mentor_titles
FROM updated_mentorship_eligibilty as ume
GROUP BY (ume.title)
ORDER BY COUNT(ume.title) DESC;

SELECT * FROM updated_eligible_mentor_titles;