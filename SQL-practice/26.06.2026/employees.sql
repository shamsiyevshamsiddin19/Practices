--1
select name, salary 
	from  employees
	where salary > 15000000 and salary is not null
	order by salary desc;
--2
select name , city
	from employees
	where city in('Toshkent','Samarqand');

--3
select *from employees e
where e.salary is  null;

--4

select  city,
		count(id) as "xodimlar soni"
	from employees
group by city;

--5

select department_id,
		sum(salary) as "jami maosh"
	from employees
group by department_id;

--6

select department_id,
		avg(salary) as "o'rtacha maosh"
	from employees
group by department_id
having avg(salary)>15000000;

--7

select d.name , e.name
	from departments d
	join employees e
	on d.id = e.department_id;


--8

select e.name ,d.name
	 from employees e
	 left join departments d
	 on e.department_id = d.id;

--9



select
	e.name as "xodimlar",
	p.name as "loyha nomi",
	ep.hours as "Sarflangan soat"
from employees e
full outer join employee_projects ep
	on e.id = ep.employee_id
full outer join projects p
on ep.project_id = p.id;


--10 
select e.name as "Xodimlar",
	   m.name as "Rahbarlar"
	   from employees e
	   join employees m
	   on  e.manager_id = m.id;


-- -- 1. Bo'limlar
-- create table departments (
--     id integer generated always as identity primary key,
--     name varchar(50) not null,
--     location varchar(50)
-- );

-- -- 2. Xodimlar (o'ziga va bo'limga bog'langan)
-- create table employees (
--     id integer generated always as identity primary key,
--     name varchar(100) not null,
--     department_id integer references departments(id),
--     manager_id integer references employees(id),
--     salary numeric(12,2),
--     city varchar(50)
-- );

-- -- 3. Loyihalar
-- create table projects (
--     id integer generated always as identity primary key,
--     name varchar(100) not null,
--     budget numeric(14,2)
-- );

-- -- 4. Xodimlar va Loyihalar (M:N ko'prik jadval)
-- create table employee_projects (
--     employee_id integer references employees(id),
--     project_id integer references projects(id),
--     hours integer,
--     primary key (employee_id, project_id)
-- );

-- -- ==========================================
-- -- MA'LUMOTLARNI KIRITISH
-- -- ==========================================

-- insert into departments (name, location) values
-- ('Engineering', 'Toshkent'),
-- ('Marketing', 'Samarqand'),
-- ('HR', 'Buxoro');

-- -- E'tibor bering: 1-ID bu Direktor. Uning bo'limi va menejeri yo'q.
-- insert into employees (name, department_id, manager_id, salary, city) values
-- ('Direktor Ali', null, null, 30000000, 'Toshkent'),
-- ('Mohira', 1, 1, 20000000, 'Toshkent'),
-- ('Shavkat', 1, 2, 15000000, 'Andijon'),
-- ('Zarina', 2, 1, 18000000, 'Samarqand'),
-- ('Doston', 2, 4, 12000000, 'Toshkent'),
-- ('Jasur', 3, 1, 14000000, 'Buxoro'),
-- ('Bekorchi Vali', null, null, null, 'Nukus'); -- Loyihasi, bo'limi va maoshi yo'q

-- insert into projects (name, budget) values
-- ('Veb Sayt', 100000000),
-- ('Mobil Ilova', 200000000),
-- ('Reklama 2026', 50000000);

-- insert into employee_projects (employee_id, project_id, hours) values
-- (2, 1, 120),
-- (2, 2, 80),
-- (3, 1, 150),
-- (4, 3, 200),
-- (5, 3, 100);
