create table message(
	mid int primary key,
    title varchar(15),
    writer varchar(15),
    content varchar(50),
    wdate date
);

create table userTable(
	unum int primary key,
    userID varchar(15),
    userPW varchar(15)
);


select * from all_tables;
select * from message;
select * from userTable;

insert into message values(1,'����1','�Ƹ�','����1',sysdate);
insert into message values(2,'����2','�Ͽ칫','����2',sysdate);
insert into message values(3,'����3','timo','����3',sysdate);
insert into message values(4,'����4','ashB','����4',sysdate);
insert into message values(5,'����5','bloo','����5',sysdate);


insert into userTable values(1,'loopy','1111');
insert into userTable values(2,'superbee','2222');
insert into userTable values(3,'chamgmo','3333');
insert into userTable values(4,'owen','4444');
insert into userTable values(5,'nafla','5555');



drop table message;
drop table userTable;







SELECT * FROM ALL_TABLES;

CREATE TABLE MESSAGE(
   MNUM INT PRIMARY KEY, 
   WRITER VARCHAR(30) NOT NULL,
   TITLE VARCHAR(30) NOT NULL,
   CONTENT VARCHAR(150) NOT NULL,
   WDATE DATE DEFAULT SYSDATE
);
SELECT *FROM MESSAGE;
INSERT INTO MESSAGE VALUES ((SELECT NVL(MAX(MNUM),0)+1 FROM MESSAGE),'SIRI','SIRI��','WELCOME',SYSDATE);

create table member(
   mnum int primary key ,
    mid varchar(15),
    mpw varchar(15)
);















