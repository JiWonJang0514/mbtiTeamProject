drop table users;
drop table mbti_match;

select * from users;
select * from mbti_match;

-- 젠더는 f 여자, m 남자
create table users(
	id varchar(50),
	pw varchar(50),
	name varchar(50),
	age int,
	gender varchar(10),
	mbti varchar(50)
);

--궁합 검색시, mbti_1이 사용자 엠비티아이 같은것으로 셀렉트할 것
create table mbti_match(
	mbti_1 varchar(50),
	mbti_2 varchar(50)
);

insert into users values('candy05', '1234', '홍길동', 18, 'm', 'INFJ');

insert into mbti_match values('INFP', 'ENFJ');
insert into mbti_match values('INFP', 'ENTJ');

insert into mbti_match values('ENFP', 'INFJ');
insert into mbti_match values('ENFP', 'INTJ');

insert into mbti_match values('INTJ', 'ENFP');
insert into mbti_match values('INTJ', 'ENTP');

insert into mbti_match values('ENFJ', 'INFP');
insert into mbti_match values('ENFJ', 'ISFP');

insert into mbti_match values('INTJ', 'ENFP');
insert into mbti_match values('INTJ', 'ENTP');

insert into mbti_match values('ENTJ', 'INFP');
insert into mbti_match values('ENTJ', 'INTP');

insert into mbti_match values('INTP', 'ENTJ');
insert into mbti_match values('INTP', 'ESTJ');

insert into mbti_match values('ENTP', 'INFJ');
insert into mbti_match values('ENTP', 'INTJ');

insert into mbti_match values('ISFP', 'ENFJ');
insert into mbti_match values('ISFP', 'ESFJ');

insert into mbti_match values('ESFP', 'ISFJ');
insert into mbti_match values('ESFP', 'ISTJ');

insert into mbti_match values('ISTP', 'ESFJ');
insert into mbti_match values('ISTP', 'ESTJ');

insert into mbti_match values('ESTP', 'ISFJ');
insert into mbti_match values('ESTP', 'ISTJ');

insert into mbti_match values('ISFJ', 'ESFP');
insert into mbti_match values('ISFJ', 'ESTP');

insert into mbti_match values('ESFJ', 'ISFP');
insert into mbti_match values('ESFJ', 'ISTP');

insert into mbti_match values('ISTJ', 'ESFP');
insert into mbti_match values('ISTJ', 'ESTP');

insert into mbti_match values('ESTJ', 'ISFP');
insert into mbti_match values('ESTJ', 'ISTP');