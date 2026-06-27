
create table employees(
id serial primary key,
name         TEXT,
department   TEXT,
salary       INTEGER   default null,
city         TEXT,   
hire_date    DATE,    
email        TEXT
);


insert into employees(name,department,salary,city,hire_date,email)
values
    ('Jasur Karimov',   'IT',      8500000,  'Toshkent',   '2021-03-15', 'jasur@mail.com'),
    ('Malika Yusupova', 'Sales',   6200000,  'Samarqand',  '2020-07-01', 'malika@mail.com'),
    ('Sardor Aliyev',   'HR',      7000000,  'Buxoro',     '2019-11-20', 'sardor@mail.com'),
    ('Nilufar Rahimova','Support', 5800000,  'Toshkent',   '2022-01-10', 'nilufar@mail.com'),
    ('Bobur Toshmatov', 'IT',      9200000,  'Toshkent',   '2018-06-05', 'bobur@mail.com'),
    ('Zulfiya Hasanova','Sales',    null,    'Samarqand',  '2023-04-18', 'zulfiya@mail.com'),
    ('Otabek Nazarov',  'HR',      7500000,  'Buxoro',     '2017-09-30', 'otabek@mail.com'),
    ('Kamola Ergasheva','Support', 6100000,  'Toshkent',   '2022-08-22', 'kamola@mail.com');

--1


select
	name as "xodim", 
	department as "Bo'lim",
	salary as "Maosh"
from  employees 

where salary <8000000 and salary is  not null

order by salary asc;


--2

select
	name as "xodimlar ismi", 
	department as "Bo'lim",
	city as "shahar"
from  employees 

 where department = 'IT' 
 and city in('Toshkent','Samarqand')


--3
select *from employees
where department not in ('Sales', 'HR', 'Support')

  and salary not between 7000000 and 15000000
  and email like '%@gmail.com'
  
order by name asc;

--4
select
    department   as "Bo'lim",
    count(*)     as "Xodimlar_soni",
    round(avg(salary), 0)    as "Ortacha_maosh",
    max(salary)  as "Eng_yuqori",
    min(salary)  as "Eng_past",
    sum(salary)  as "Umumiy_fond"
from employees

where salary is not null

group by department
order by sum(salary) desc;


-- 5
select
    department            as "Bo'lim",
    round(avg(salary), 0) as "Ortacha_maosh"
from employees

where salary is not null
group by department

having avg(salary) > 10000000
order by avg(salary) desc;

-- 6
select
    city        as "Shahar",
    count(*)    as "Xodimlar_soni",
    round(avg(salary), 0) as "Ortacha_maosh",
    sum(salary) as "Umumiy_fond"
from employees

group by city

having count(*) >= 3
order by avg(salary) desc;







