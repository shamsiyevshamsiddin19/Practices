create table players(
id integer generated always as  identity primary key,
name text,
phone varchar(20)
);


INSERT INTO players (name, phone) VALUES
('Ali Karimov', '+998901112233'),
('Vali Aliyev', '+998912223344'),
('Hasan Toshmatov', '+998933334455'),
('Husan Toshmatov', '+998944445566'),
('Sardor Rustamov', '+998975556677'),
('Javohir Qodirov', '+998996667788'),
('Aziz Bekov', '+998987778899');

create table bookings(
id integer generated  always as identity primary key,
player_id integer  references players(id),
court_type text default 'indoor',
price numeric(12,2)
);

INSERT INTO bookings (player_id, court_type, price) VALUES
(1, 'indoor', 150000.00),
(2, 'outdoor', 120000.00),
(3, 'indoor', 150000.00),
(4, 'clay', 200000.00),
(5, 'indoor', 150000.50),
(6, 'outdoor', 120000.00),
(7, 'grass', 250000.00);

--1 
select 
	players.name as "o'yinchilar",
	players.phone as "telefon raqami",
	bookings.court_type as "kort",
	bookings.price as "summa"
from players
inner join bookings
 on players.id = bookings.player_id;


--2 

select 
	players.name as "mijoz",
	bookings.court_type as "kort",
	bookings.price as "summa"
from players
inner join bookings
on players.id = bookings, player_id;



--3

select 
	players.name as "mijoz",
	bookings.court_type as "kort",
	bookings.price as "summa"
from players
inner join bookings
on players.id = bookings, player_id
where court_type = 'indoor';




