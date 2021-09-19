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
insert into mem values('yg','약국','1234',sysdate);
insert into mem values('jenny','제니','1234',sysdate);
insert into mem values('rose','로제','1234',sysdate);
insert into mem values('lisa','리사','1234',sysdate);
insert into mem values('jisoo','지수','1234',sysdate);

insert into message values(1,'yg','글작성1',0,0,sysdate);
insert into message values(2,'jenny','hello',0,0,sysdate);
insert into message values(3,'rose','확인',0,0,sysdate);
insert into message values(4,'lisa','확인',0,0,sysdate);
insert into message values(5,'jisoo','확인',0,0,sysdate);
insert into message values(6,'jenny','확인',0,0,sysdate);
insert into message values(7,'rose','확인',0,0,sysdate);
insert into message values(8,'lisa','확인',0,0,sysdate);
insert into message values(9,'jisoo','확인',0,0,sysdate);
insert into message values(10,'yg','확인',0,0,sysdate);

insert into reply values(1,1,'jenny',sysdate,'댓글1');
insert into reply values(2,1,'lisa',sysdate,'댓글2');
insert into reply values(3,2,'yg',sysdate,'댓글1');
insert into reply values(4,2,'jisoo',sysdate,'댓글2');
insert into reply values(5,2,'rose',sysdate,'댓글3');

---------------------------------------------------------------------------------------
select * from message where rownum <= ? order by udate desc
select * from message order by udate desc;
select * from message order by udate asc;
select * from message where memid='timo' order by udate desc;


select * from mem;
select * from message;
select * from reply;
select * from all_tables;

drop table message;
drop table reply;
drop table mem;


update message set replycount=replycount-1 where mid=36

update message set replycount=replycount+1 where mid=3;


select * from mem where rownum <= 3 order by udate desc
select * from mem;


select count(*) from reply where mid=3;


select * from message order by udate asc;

select * from message order by udate asc;

select count(*) from message where mid = 3


---------------------------------------------------------------------------------------
--select rownum as mid, uuid, msg, favcount, replycount, udate
--
--from (
--
--    select rownum as mid, uuid, msg, favcount, replycount, udate
--
--        from message
--
--        order by mid
--)
--where rownum >= 2
--and rownum <= 5

select * from (
select rownum as mid, uuid, msg, favcount, replycount, udate
from message
order by mid)
where mid between ${page} * ${offset} + 1 and (${page} + 1) * ${offset}


---------------------------------------------------------------------------------------

where rownum = 2 


---------------------------------------------------------------------------------------
select rownum as mid, uuid, msg, favcount, replycount, udate

from message

where 

order by mid
---------------------------------------------------------------------------------------

select * 

from message

order by mid
---------------------------------------------------------------------------------------


create table message(
   mid int primary key,
    uuid varchar(15),
    msg varchar(100),
    favcount int default 0,
    replycount int default 0,
    udate date
);
---------------------------------------------------------------------------------------

select * from 
	(select rownum 
	as mid, uuid, msg, favcount, replycount, udate
	from message
	order by mid)
	
where mid 
between 3 and 5

select * from message

---------------------------------------------------------------------------------------

select * from (select rownum as mid, uuid, msg, favcount, replycount, udate from message order by mid) where mid between 3 and 5

---------------------------------------------------------------------------------------




select * from (select rownum as mid, uuid, msg, favcount, replycount, udate from message order by mid) where mid between ? and ?




pstmt.setInt(1, (page*offset)+1);
pstmt.setInt(2, (page+1)*offset);

int offset = 5;
page--; // 초기 페이지 값을 0으로 두고 처리


