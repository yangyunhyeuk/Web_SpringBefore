create table message(
	mnum int primary key,
	writer varchar(15) not null,
	title varchar(15) not null,
	content varchar(100) not null,
	wdate date default sysdate
);
select * from all_tables;
select * from message;
insert into message values(1,'one','����','����',sysdate);
insert into message values(2,'two','����2','����2',sysdate);
/* ���õ����� : �Ϲ������� ���� �ɶ����� ���õ����� ��! */
drop table PRODUCT;
drop table message;
drop table MEMBER;



delete from MESSAGE where mnum = '8';

