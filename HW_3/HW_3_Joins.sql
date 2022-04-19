--	1. Output the all employees whose salaries are in the database, together with their salaries.

select employees.employee_name, salary.monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
order by employee_name ;

--	2. Output the all employees whose salary is less than 2000.

select employees.employee_name, salary.monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id
where monthly_salary < 2000
order by monthly_salary;

-- 3. Output the all positions with a salary, but the employee is not assigned to them. (There is a salary, but it is not clear who receives it).

select salary.monthly_salary from employee_salary 
left join employees on employees.id = employee_salary.employee_id
right join salary on salary.id = employee_salary.salary_id 
where employee_name is null
order by monthly_salary;

--	4. Output the all positions with a salary of less than 2000, but the employee is not assigned to them. (There is a salary, but it is not clear who receives it).

select salary.monthly_salary from employee_salary 
left join employees on employees.id = employee_salary.employee_id
right join salary on salary.id = employee_salary.salary_id 
where employee_name is null and monthly_salary < 2000 
order by monthly_salary;


--	5. Find all employees who have not received a salary.

select employees.employee_name from employee_salary
right join employees on employees.id = employee_salary.employee_id
left join salary on salary.id = employee_salary.salary_id
where monthly_salary is null 
order by employee_name ;

--	6. Output the of all employees with their positions.

select employees.employee_name, roles.role_name from roles_employee 
join employees on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id  
order by employee_name ;

--	7. Output the names and titles of Java developers only.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%Java %'
order by employee_name ;

--	8. Output the names and titles of Python developers only.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%Python%'
order by employee_name ;

--	9. Output the names and positions of all QA engineers.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%QA%'
order by employee_name ;

--	10. Output the names and position of manual QA engineers.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%Manual QA%'
order by employee_name ;

--	11. Output the names and position of QA automators.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%Automation QA%'
order by employee_name ;

--	12. Output the names and salaries of Junior specialists.

select employees.employee_name, salary.monthly_salary from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id
left join salary on salary.id = employee_salary.salary_id
where role_name like 'Junior%'
order by monthly_salary ;

-- 13. Output the names and salaries of Middle specialists.

select employees.employee_name, salary.monthly_salary from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id
left join salary on salary.id = employee_salary.salary_id
where role_name like 'Middle%'
order by monthly_salary ;

--	14. Output the the names and salaries of Senior specialists.

select employees.employee_name, salary.monthly_salary from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id
left join salary on salary.id = employee_salary.salary_id
where role_name like 'Senior%'
order by monthly_salary ;

--	15. Output the salaries of Java developers.

select salary.monthly_salary from roles_employee
join roles on roles.id = roles_employee.role_id
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id
left join salary on salary.id = employee_salary.salary_id
where role_name like '%Java %'
order by monthly_salary ;

--	16. Output the salaries of Python developers.

select salary.monthly_salary from roles_employee
join roles on roles.id = roles_employee.role_id
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id
left join salary on salary.id = employee_salary.salary_id
where role_name like '%Python%'
order by monthly_salary ;

--	17. Output the names and salaries of Junior Python developers.

select employees.employee_name, salary.monthly_salary from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
join employee_salary on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id
where role_name like 'Junior Python%' 
order by monthly_salary ;

--	18. Output the names and salaries of Middle JS developers.

select employees.employee_name, salary.monthly_salary from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
join employee_salary on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id
where role_name like 'Middle JavaScript%'
order by monthly_salary ;

--	19. Output the names and salaries of Senior Java developers.

select employees.employee_name, salary.monthly_salary from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id
left join salary on salary.id = employee_salary.salary_id
where role_name like 'Senior Java %'
order by monthly_salary ;

--	20. Output the salaries of Junior QA engineers.

select salary.monthly_salary from roles_employee
join roles on roles.id = roles_employee.role_id
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id
left join salary on salary.id = employee_salary.salary_id
where role_name like 'Junior %QA%'
order by monthly_salary ;


--	21. Output the average salary of all Junior specialists.

select avg(salary.monthly_salary) as avg_salary_Junion
from roles_employee
join roles on roles.id = roles_employee.role_id
join employee_salary on employee_salary.employee_id = roles_employee.employee_id
join salary on salary.id = employee_salary.salary_id
where role_name like 'Junior%' ;

--	22. Output the amount of salaries of JS developers.

select sum(salary.monthly_salary) as sum_salary_JS
from roles_employee
join roles on roles.id = roles_employee.role_id
join employee_salary on employee_salary.employee_id = roles_employee.employee_id
join salary on salary.id = employee_salary.salary_id
where role_name like '%JavaScript%' ;

--	23. Output the minimum salary of QA engineers.

select min(salary.monthly_salary) as min_salary_qa
from roles_employee
join roles on roles.id = roles_employee.role_id
join employee_salary on employee_salary.employee_id = roles_employee.employee_id
join salary on salary.id = employee_salary.salary_id
where role_name like '%QA%' ;

--	24. Output the maximum salary of QA engineers.

select max(salary.monthly_salary) as max_salary_qa
from roles_employee
join roles on roles.id = roles_employee.role_id
join employee_salary on employee_salary.employee_id = roles_employee.employee_id
join salary on salary.id = employee_salary.salary_id
where role_name like '%QA%' ;

--	25. Output the count of QA engineers.

select count(roles.role_name) as count_qa
from roles_employee
join roles on roles.id = roles_employee.role_id
join employees on employees.id = roles_employee.employee_id
where role_name like '%QA%' ;

--	26. Output the count of Middle specialists.

select count(roles.role_name) as count_Middle
from roles_employee
join roles on roles.id = roles_employee.role_id
join employees on employees.id = roles_employee.employee_id
where role_name like '%Middle%' ;

--	27. Output the count of developers.

select count(roles.role_name) as count_developer
from roles_employee
join roles on roles.id = roles_employee.role_id
join employees on employees.id = roles_employee.employee_id
where role_name like '%developer%' ;

--	28. Output the amount of developers' salaries.

select sum(salary.monthly_salary) as sum_salary_developer
from roles_employee
join roles on roles.id = roles_employee.role_id
join employee_salary on employee_salary.employee_id = roles_employee.employee_id
join salary on salary.id = employee_salary.salary_id
where role_name like '%developer%' ;

--	29. Output the names, positions and salaries of all specialists in ascending order.

select employees.employee_name, roles.role_name, salary.monthly_salary from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id
left join salary on salary.id = employee_salary.salary_id
order by monthly_salary ;

--	30. Output the names, positions and salaries of all specialists in ascending order who have a salary from 1700 to 2300.

select employees.employee_name, roles.role_name, salary.monthly_salary from roles_employee
left join employees on employees.id = roles_employee.employee_id
left join roles on roles.id = roles_employee.role_id
right join employee_salary on employee_salary.employee_id = roles_employee.employee_id
right join salary on salary.id = employee_salary.salary_id
where monthly_salary >= 1700 and monthly_salary <= 2300
order by monthly_salary ;

--		Or like this

select employees.employee_name, roles.role_name, salary.monthly_salary from roles_employee
left join employees on employees.id = roles_employee.employee_id
left join roles on roles.id = roles_employee.role_id
right join employee_salary on employee_salary.employee_id = roles_employee.employee_id
right join salary on salary.id = employee_salary.salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary ;

--	31. Output the names, positions and salaries of all specialists in ascending order whose salary is less than 2300.

select employees.employee_name, roles.role_name, salary.monthly_salary from roles_employee
left join employees on employees.id = roles_employee.employee_id
left join roles on roles.id = roles_employee.role_id
right join employee_salary on employee_salary.employee_id = roles_employee.employee_id
right join salary on salary.id = employee_salary.salary_id
where monthly_salary < 2300
order by monthly_salary ;

--	32. Output the names, positions, and salaries of all specialists, in ascending order, whose salary is 1100, 1500, 2000.

select employees.employee_name, roles.role_name, salary.monthly_salary from roles_employee
left join employees on employees.id = roles_employee.employee_id
left join roles on roles.id = roles_employee.role_id
right join employee_salary on employee_salary.employee_id = roles_employee.employee_id
right join salary on salary.id = employee_salary.salary_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary ;

