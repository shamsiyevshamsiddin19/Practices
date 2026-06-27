
--1

create table dev_tasks(
id integer generated always as identity primary key,
project_name text not null,
task_deck text not null,
status text default 'kutulmoqda',
github_commits  integer,
hours_spent numberic(12,2) check(hours_spent>=0)
);

--2

insert into dev_tasks (project_name,task_deck,github_commits,hours_spent)
values
	('Telegram Bot','SQLite bazasini ulash',12,4.5),
	('Portfolio', 'HTML va CSS da responsiv dizayn yigish', 8,  6.0),
	('Telegram Bot','Admin panel yaratish',  0, 0.0);

--3
select *from dev_tasks
where project_name in('Telegram Bot','Portfolio') and hours_spent > 0

--4

select
	project_name,
		count(task_desk) as "vazifalar soni",
		sum(hours_spent) as "jami vaqt",
		sum(github_commits) as "jami commitlar"
from dev_tasks
group by project_name;

--5

select
	project_name,
		count(tack_deck) as "vazifalar soni",
		sum(hour_spent) as "jami vaqt",
		sum(github_commits) as "jami commitlar"
from dev_tasks
group by project_name
having  sum(github_commits) >=10
order by "jami vaqt" desc;

--6

alter table dev_tasks 
	add column deadline date,
	add is_urgent boolean default false;
	


