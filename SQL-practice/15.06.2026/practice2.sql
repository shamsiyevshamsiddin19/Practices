
create table dev_tasks(
    id integer generated always as identity primary key,
    project_name text not null,
    task_desc text not null,
    status text default 'kutilmoqda',
    github_commits integer,
    hours_spent numeric(12,2) check(hours_spent >= 0)
);



insert into dev_tasks (project_name, task_desc, github_commits, hours_spent)
values
    ('telegram bot', 'sqlite bazasini ulash', 12, 4.5),
    ('portfolio', 'html va css da responsiv dizayn yigish', 8, 6.0),
    ('telegram bot', 'admin panel yaratish', 0, 0.0);



select * from dev_tasks
where project_name in ('telegram bot', 'portfolio') and hours_spent > 0;



select
    project_name,
    count(task_desc) as "vazifalar soni",
    sum(hours_spent) as "jami vaqt",
    sum(github_commits) as "jami commitlar"
from dev_tasks
group by project_name;



select
    project_name,
    count(task_desc) as "vazifalar soni",
    sum(hours_spent) as "jami vaqt",
    sum(github_commits) as "jami commitlar"
from dev_tasks
group by project_name
having sum(github_commits) >= 10
order by "jami vaqt" desc;



alter table dev_tasks 
    add column deadline date,
    add column is_urgent boolean default false;


    
