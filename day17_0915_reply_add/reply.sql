------유저 테이블--------------------------------------------------------------------------------
create table mem(
   uuid varchar(15) primary key,
    name varchar(15),
    passwd varchar(10),
    udate date 
);
------댓글 테이블---------------------------------------------------------------------------------
create table message(
   mid int primary key,
    uuid varchar(15),
    msg varchar(100),
    favcount int default 0,
    replycount int default 0,
    udate date
);
-----대댓글 테이블----------------------------------------------------------------------------------
create table reply(
   rid int primary key,
    mid int,
    uuid varchar(15),
    udate date,
    rmsg varchar(50),
    constraint msgrp foreign key (mid) references message (mid) on delete cascade
);
---------------------------------------------------------------------------------------
insert into mem values('timo','티모','1234',sysdate);

insert into message values(1,'timo','글작성1',1,2,sysdate);
insert into message values(2,'timo','hello',2,3,sysdate);
insert into message values(3,'timo','확인',2,0,sysdate);

insert into reply values(1,1,'timo',sysdate,'댓글1');
insert into reply values(2,1,'timo',sysdate,'댓글2');
insert into reply values(3,2,'timo',sysdate,'댓글1');
insert into reply values(4,2,'timo',sysdate,'댓글2');
insert into reply values(5,2,'timo',sysdate,'댓글3');
insert into reply values(6,2,'imnottimo',sysdate,'댓글3');

insert into message values(4,'new1','확인',2,0,sysdate);
insert into message values(5,'new2','확인',2,0,sysdate);
insert into message values(6,'new3','확인',2,0,sysdate);
insert into message values(7,'new4','확인',2,0,sysdate);
insert into message values(8,'new5','확인',2,0,sysdate);
insert into message values(9,'imnottimo','확인',2,0,sysdate);
insert into message values(10,'imnottimo','확인',2,0,sysdate);
insert into message values(11,'imnottimo','확인',2,0,sysdate);
insert into message values(12,'imnottimo','확인',2,0,sysdate);
insert into message values(13,'imnottimo','확인',2,0,sysdate);
---------------------------------------------------------------------------------------
select * from message where rownum <= ? order by udate desc
select * from message order by udate desc;
select * from message order by udate asc;
select * from message where memid='timo' order by udate desc;


select * from mem;
select * from message;
select * from reply;
select * from all_tables;
---------------------------------------------------------------------------------------