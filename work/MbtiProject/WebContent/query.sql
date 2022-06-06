create table users(
	id varchar(50),
	pw varchar(50),
	name varchar(50),
	age int,
	gender varchar(10),
	mbti varchar(50)
);

create table mbti(
	mbti_1 varchar(50),
	mbti_2 varchar(50),
	match varchar(50),
	explain varchar(1000)
);

insert into users values('wendy05', '1234', '장장장', 18, 'f', 'INFJ');

select * from users;
select * from mbti;
select * from explains;