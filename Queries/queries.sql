-- Joining tables
DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
Select d.dept_name, 
	dm.emp_no,
	dm.from_date,
	dm.to_date
From departments as d
Inner Join dept_manager as dm
On d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
Select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
From retirement_info as ri
Left Join dept_emp as de
On ri.emp_no = de.emp_no;

Select ri.emp_no,
	ri.first_name,
	ri.last_name,
de.to_date
Into current_emp
From retirement_info as ri
Left Join  dept_emp as de 
On ri.emp_no = de.emp_no
Where de.to_date = ('9999-01-01');

-- Employee count by department number
Select Count(ce.emp_no), de.dept_no
From current_emp as ce
Left Join dept_emp as de
On ce.emp_no = de.emp_no
Group By de.dept_no
Order By de.dept_no;

Select * From salaries
Order By to_date Desc; 

Select emp_no, first_name, last_name
Into retirement_info
From employees
Where (birth_date Between '1952-01-01' AND '1955-12-31')
AND (hire_date Between '1985-01-01' AND '1988-12-31');

Select e.emp_no,
	e.first_name,
e.last_name,
	e.gender,
	e.salary,
	de.to_date
Into emp_info
From employees as e
Inner Join salaries as s
On (e.emp_no = s.emp_no)
Inner Join dept_emp as de
On (e.emp_no = de.emp_no)
Where (e.birth_date Between '1952-01-01' AND '1955-12-31')
	AND (e.hire_date Between '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
	
--List of managers per department
Select dm.dept_no,
	d.dept_name, 
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
Into manager_info
From dept_manager as dm
	Inner Join departments as d
		On (dm.dept_no = d.dept_no)
	Inner Join current_emp as ce
		On (dm.emp_no = ce.emp_no);
	
Select ce.emp_no,
ce.first_name, 
ce.last_name,
d.dept_name
Into dept_info
From current_emp as ce
Inner Join dept_emp as de
On (ce.emp_no = de.emp_no)
Inner Join departments as d
On (de.dept_no = d.dept_no); 