select * from message where rownum between 10 and 15 order by udate asc

select * from (select rownum as mid, uuid, msg, favcount, replycount, udate from message order by mid) where mid between 10 and 15

select * from message where rownum between startRow and endRow order by udate asc

select * from message where rownum <= ? order by udate desc


select * from 
	(select rownum 
	as mid, uuid, msg, favcount, replycount, udate
	from message
	order by mid)
	
where mid 
between 3 and 5

-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------



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

insert into message values(1,'yg','1_1',0,0,sysdate);
insert into message values(2,'jenny','1_2',0,0,sysdate);
insert into message values(3,'rose','1_3',0,0,sysdate);
insert into message values(4,'lisa','1_4',0,0,sysdate);
insert into message values(5,'jisoo','1_5',0,0,sysdate);
insert into message values(6,'jenny','1_6',0,0,sysdate);
insert into message values(7,'rose','1_7',0,0,sysdate);
insert into message values(8,'lisa','1_8',0,0,sysdate);
insert into message values(9,'jisoo','1_9',0,0,sysdate);
insert into message values(10,'yg','1_10',0,0,sysdate);

insert into message values(11,'yg','2_1',0,0,sysdate);
insert into message values(12,'jenny','2_2',0,0,sysdate);
insert into message values(13,'rose','2_3',0,0,sysdate);
insert into message values(14,'lisa','2_4',0,0,sysdate);
insert into message values(15,'jisoo','2_5',0,0,sysdate);
insert into message values(16,'jenny','2_6',0,0,sysdate);
insert into message values(17,'rose','2_7',0,0,sysdate);
insert into message values(18,'lisa','2_8',0,0,sysdate);
insert into message values(19,'jisoo','2_9',0,0,sysdate);
insert into message values(20,'yg','2_10',0,0,sysdate);

insert into message values(21,'yg','3_1',0,0,sysdate);
insert into message values(22,'jenny','3_2',0,0,sysdate);
insert into message values(23,'rose','3_3',0,0,sysdate);
insert into message values(24,'lisa','3_4',0,0,sysdate);
insert into message values(25,'jisoo','3_5',0,0,sysdate);
insert into message values(26,'jenny','3_6',0,0,sysdate);
insert into message values(27,'rose','3_7',0,0,sysdate);
insert into message values(28,'lisa','3_8',0,0,sysdate);
insert into message values(29,'jisoo','3_9',0,0,sysdate);
insert into message values(30,'yg','3_10',0,0,sysdate);

insert into message values(31,'yg','4_1',0,0,sysdate);


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





select * from (select * from mem ORDER BY udate desc) where rownum <= 3
select * from mem where rownum <= 3 order by udate desc




update message set replycount=replycount-1 where mid=36

update message set replycount=replycount+1 where mid=3;


select * from mem where rownum <= 3 order by udate desc

select * from mem where rownum < 4 order by udate asc

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


