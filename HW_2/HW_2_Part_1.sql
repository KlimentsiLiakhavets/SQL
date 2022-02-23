--������� employees.

--1. 	������� ������� employees.
-- 		id. serial,  primary key,
--		employee_name. Varchar(50), not null.

create table employees (
	id serial primary key,
	employee_name varchar (50) not null
	);
	
--2. 	��������� ������� employee 70 ��������.

insert into employees (employee_name)
	values ('���������'), ('������'), ('��������'), ('�����'), ('�������'), ('������'), ('�������'), ('�����'), 
			('�������'), ('�������'), ('����'), ('����'), ('�������'), ('�����'), ('�����'), ('������'), ('��������'), 
			('���������'), ('�������'), ('������'), ('���������'), ('����'), ('����'), ('���������'), ('������'), 
			('�������'), ('�������'), ('�����'), ('��������'), ('����'), ('�������'), ('������'), ('�����'), ('������'), 
			('����������'), ('����'), ('�������'), ('�������'), ('��������'), ('������'), ('�����'), ('������'), ('�����'), 
			('�����'), ('����������'), ('��������'), ('����'), ('�������'), ('����'), ('�����'), ('����'), ('������'), 
			('���������'), ('�����'), ('������'), ('�����'), ('�������'), ('������'), ('��������'), ('��������'), ('������'), 
			('�����'), ('������'), ('������'), ('�����'), ('��������'), ('���������'), ('������'), ('�����'), ('�������');
			
select * from employees;

-- ������� salary.

--3.		������� ������� salary.
--			id. Serial  primary key,
-- 			monthly_salary. Int, not null.

create table salary (
	id serial primary key,
	monthly_salary int not null
	);

--4.		��������� ������� salary 15 ��������.

insert into salary (monthly_salary) 
	values (1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), (1800), 
			(1900), (2000), (2100), (2200), (2300), (2400), (2500);

select * from salary;

--������� employee_salary.

--5.		������� ������� employee_salary.
-- 			id. Serial  primary key,
-- 			employee_id. Int, not null, unique.
-- 			salary_id. Int, not null.

create table employee_salary (
	id serial primary key, 
	employee_id int not null unique, 
	salary_id int not null
	);

--6.		��������� ������� employee_salary 40 ��������:
-- 			� 10 ����� �� 40 �������� �������������� employee_id.

insert into employee_salary (id, employee_id, salary_id) 
	values (default,1,5), (default,11,20), (default,51,22), (default,23,29), (default,5,31), (default,25,4), (default,7,8), 
			(default,21,9), (default,27,15), (default,10,18), (default,2,32), (default,12,15), (default,50,3), (default,20,9), 
			(default,62,31), (default,17,11), (default,75,29), (default,56,35), (default,19,2), (default,14,6), (default,8,13), 
			(default,45,14), (default,4,18), (default,24,24), (default,6,26), (default,26,28), (default,9,27), (default,28,30), 
			(default,29,20), (default,30,10), (default,13,22), (default,55,11), (default,15,33), (default,22,19), (default,49,29), 
			(default,18,13), (default,47,26), (default,60,3), (default,16,12), (default,3,24);

select * from employee_salary;

--�������  roles.

--7			������� ������� roles.
-- 			id. Serial  primary key,
-- 			role_name. int, not null, unique.

create table  roles (
	id serial primary key,
	role_name int not null unique
	);

select * from roles;

--8			�������� ��� ������ role_name � int �� varchar(30).

alter table roles 
alter column role_name type varchar (30) using role_name::varchar (30);

select * from roles;

--9			��������� ������� roles 20 ��������.

insert into roles (role_name)
	values  ('Junior Python developer'), 
			('Middle Python developer'),
			('Senior Python developer'), 
			('Junior Java developer'), 
			('Middle Java developer'), 
			('Senior Java developer'), 
			('Junior JavaScript developer'), 
			('Middle JavaScript developer'), 
			('Senior JavaScript developer'), 
			('Junior Manual QA engineer'), 
			('Middle Manual QA engineer'), 
			('Senior Manual QA engineer'), 
			('Project Manager'), 
			('Designer'), 
			('HR'), 
			('CEO'), 
			('Sales manager'), 
			('Junior Automation QA engineer'), 
			('Middle Automation QA engineer'), 
			('Senior Automation QA engineer');

select * from roles;

--������� roles_employee.

--10			������� ������� roles_employee.
-- 				id. Serial  primary key,
-- 				employee_id. Int, not null, unique (������� ���� ��� ������� employees, ���� id).
-- 				role_id. Int, not null (������� ���� ��� ������� roles, ���� id).

create table roles_employee (
		id serial primary key,
		employee_id int not null unique,
		role_id int not null,
	foreign key (employee_id) 
	references employees (id),
	foreign key (role_id) 
	references roles (id)
	);

select * from roles_employee;

--11			��������� ������� roles_employee 40 ��������

insert into roles_employee (id, employee_id, role_id) 
	values (default,1,5), (default,32,20), (default,3,1), (default,12,9), (default,28,6), (default,15,4), (default,9,8), (default,33,19), 
		   (default,16,15), (default,24,18), (default,38,2), (default,4,5), (default,30,3), (default,14,11), (default,6,7), 
		   (default,37,13), (default,17,4), (default,25,8), (default,19,19), (default,39,6), (default,21,13), (default,35,16), 
		   (default,23,10), (default,10,2), (default,18,7), (default,26,14), (default,27,9), (default,5,12), (default,29,20), 
		   (default,13,10), (default,20,17), (default,2,3), (default,8,15), (default,34,11), (default,22,14), (default,36,18), 
		   (default,7,1), (default,11,16), (default,31,12), (default,40,17);
		  

select * from roles_employee;





	