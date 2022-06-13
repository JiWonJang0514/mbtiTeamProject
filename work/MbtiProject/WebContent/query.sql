drop table users;
drop table mbti_match;

create table users(
	id varchar(50) primary key,
	pw varchar(50),
	name varchar(50),
	mbti varchar(50)
);

--궁합 검색시, mbti_1이 사용자 엠비티아이 같은것으로 셀렉트할 것
create table mbti_match(
	mbti_1 varchar(50),
	mbti_2 varchar(50)
);

select * from users;
select * from mbti_match;

--엠비티아이가 매칭에 있는 users 회원들만 셀렉트
select a.* from users a inner join (select * from mbti_match where mbti_1='INFP') b on a.mbti=b.mbti_2; 

--궁합보기 셀렉트
select * from mbti_match where mbti_1='INFP';





--users 데이터
insert into users values('seungyeon', '1234', '오승연', 'ENTP');
insert into users values('seonghan', '1234', '정성한', 'ENTP');
insert into users values('jiwon01', '1234', '장지원', 'ISTJ');
insert into users values('inyeong', '1234', '배인영', 'INFJ');
insert into users values('yeongeun', '1234', '김영은', 'ENFP');
insert into users values('ayeong', '1234', '정아영', 'INFP');
insert into users values('gain', '1234', '김가인', 'ESTP');
insert into users values('jeonghyeon', '1234', '송정현', 'ISFJ');
insert into users values('seoyoon', '1234', '최서윤', 'ENTP');
insert into users values('yoochan', '1234', '신유찬', 'ISFP');
insert into users values('yerin', '1234', '정예린', 'INFP');
insert into users values('jiwon02', '1234', '이지원', 'ESTJ');
insert into users values('hayeong', '1234', '박하영', 'ENTJ');
insert into users values('hayeon', '1234', '강하연', 'INFP');
insert into users values('yeongjin', '1234', '최영진', 'ISTJ');
insert into users values('uenbin', '1234', '고은빈', 'ESFP');
insert into users values('seoyeon', '1234', '최서연', 'ESTP');
insert into users values('jinho', '1234', '조진호', 'ESFP');
insert into users values('chanbi', '1234', '임찬비', 'ENFP');
insert into users values('hwan', '1234', '김환', 'INFP');


--mbti_match 구축용 데이터(실행전에 디비 생성 새로 한다면 반드시 이 쿼리 해주기)
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
