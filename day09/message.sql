create table message(
	mnum int primary key,
	writer varchar(15) not null,
	title varchar(15) not null,
	content varchar(50) not null
);


create table member(
	memnum int primary key,
	mid varchar(15) not null,
	mpw varchar(15) not null
);


select * from all_tables;
select * from message;
select * from member;


insert into message values(1,'one','����1','����1');
insert into message values(2,'two','����2','����2');
insert into message values(3,'three','����3','����3');
insert into message values(4,'four','����4','����4');

select * from message where title like '��%' order by mnum desc;
select * from message where title like '"+content+"%' order by mnum desc;

insert into member values(1,'yang','1111');
insert into member values(2,'kim','2222');
insert into member values(3,'hong','3333');
insert into member values(4,'arm','4444');


drop table PRODUCT;
drop table message;
drop table MEMBER;



delete from MESSAGE where mnum = '8';

