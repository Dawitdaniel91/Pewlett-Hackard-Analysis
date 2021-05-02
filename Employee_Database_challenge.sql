--Part I
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
---Part II
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

Select e.emp_no,
		e.first_name,
		e.last_name,
		titles.title,
		dept_emp.from_date,
		dept_emp.to_date
into mentor_program
from employees as e
inner join dept_emp
	on(e.emp_no = dept_emp.emp_no)
inner join titles
	on(e.emp_no = titles.emp_no)
where(birth_date between '1965-01-01' and '1965-12-31')
	---ritiring by title 	
-- Number of Retiring Employees by Title
SELECT COUNT(ut.emp_no),ut.title
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

--Deliverable part 2

-- Mentorship Eligibility
SELECT e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tt.title
INTO mentorship_info
FROM employees as e
	INNER JOIN dept_emp as de
		on(e.emp_no = de.emp_no)
	INNER JOIN titles as tt
		on(de.emp_no = tt.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

select * from mentorship_info;