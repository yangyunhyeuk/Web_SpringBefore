create table message(
	mnum int primary key,
	writer varchar(15) not null,
	title varchar(15) not null,
	content varchar(50) not null
);


create table member(
	mnum int primary key,
	mid varchar(15) not null,
	mpw varchar(15) not null
);



select * from all_tables;
select * from message;
select * from member;


insert into message values(1,'kim','����','����');
insert into message values(2,'kim2','����2','����2');
insert into message values(3,'yang','����3','����3');
insert into message values(4,'yang1','����4','����4');
insert into message values(5,'hong','����5','����5');
insert into message values(6,'hong1','����6','����6');
insert into message values(7,'hong2','���','�׿�');


insert into member values(1,'kim','1234');
insert into member values(2,'yang','1111');
insert into member values(3,'hong','2222');
insert into member values(4,'park','3333');
insert into member values(5,'sung','4444');
insert into member values(6,'mal','5555');
insert into member values(7,'shin','6666');
insert into member values(8,'mem','7777');


drop table PRODUCT;
drop table message;
drop table MEMBER;



delete from MESSAGE where mnum = '8';

