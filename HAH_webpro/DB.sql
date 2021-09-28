------------------------------------------------------------------------------------------
select * from all_tables;
------------------------------------------------------------------------------------------
select * from MEMBER
select * from MEMBER where snum = 1;
------------------------------------------------------------------------------------------
insert into MEMBER values('a123','a456', '일', 'a@naver.com','user');
insert into MEMBER values('b123','b456', '이', 'b@naver.com','admin');
insert into MEMBER values('c123','c456', '삼', 'c@naver.com','user');
insert into MEMBER values('d123','d456', '사', 'd@naver.com','admin');
insert into MEMBER values('e123','e456', '오', 'e@naver.com','user');

INSERT INTO MEMBER VALUES ('f123','f456', '육', 'f@naver.com','admin');

INSERT INTO MEMBER VALUES ('hana','11','하나','hana11@naver.com','user');
INSERT INTO MEMBER VALUES ('admin','1004','관리자','admin@helper.com','admin');
------------------------------------------------------------------------------------------
drop table MEMBER;
drop table studyboard;
drop table FREECOMMENT;
------------------------------------------------------------------------------------------
UPDATE MEMBER SET  MPW='11', MNAME ='11', MEMAIL='11@naver.com', ROLE='admin' where MID='Z123';
DELETE FROM MEMBER WHERE MID='f123';
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--------------------------------윤혁-------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------


insert into student values(st_seq.nextval,'홍길동','89','010-111-1111','hong@naver.com',sysdate);
----------------------------------------------------------------------------------------------
-- 유저 테이블
CREATE TABLE MEMBER(
   MID VARCHAR(50) PRIMARY KEY,       -- 회원 아이디
   MPW VARCHAR(50) NOT NULL,         -- 회원 비밀번호
   MNAME VARCHAR(50) NOT NULL,         -- 회원 닉네임
   MEMAIL VARCHAR(50) NOT NULL,      -- 회원 이메일   
   ROLE VARCHAR(20) NOT NULL         -- 사용자/관리자
);
----------------------------------------------------------------------------------------------
-- 댓글테이블 
CREATE TABLE FREECOMMENT(			-- 자유게시판
   CNUM INT PRIMARY KEY,         -- 댓글 고유 번호   
   COMM VARCHAR(200) NOT NULL,      -- 댓글 내용 
   CDATE DATE DEFAULT SYSDATE NOT NULL,-- 댓글 작성 일자
   PNUM INT NOT NULL,               -- 게시글 번호  
   MNAME VARCHAR(50) NOT NULL,         -- 회원 닉네임
   MID VARCHAR(50) NOT NULL          -- 회원 아이디 
   
);

drop table FREECOMMENT;
select * from FREECOMMENT;
select * from FREECOMMENT where snum = 1;
insert into FREECOMMENT values(1,'댓글 내용',SYSDATE,10,'YANG','YANG12');
insert into FREECOMMENT values(2,'댓글 내용',SYSDATE,11,'park','YANG34');
insert into FREECOMMENT values(3,'댓글 내용',SYSDATE,12,'kim','YANG56');
insert into FREECOMMENT values(4,'댓글 내용',SYSDATE,13,'shin','YANG78');
insert into FREECOMMENT values(5,'댓글 내용',SYSDATE,14,'yong','YANG90');
----------------------------------------------------------------------------------------------
CREATE TABLE STUDYCOMMENT(			-- 스터디게시판
   CNUM INT PRIMARY KEY,             -- 댓글 고유 번호 
   COMM VARCHAR(200) NOT NULL,       -- 댓글 내용 
   CDATE DATE DEFAULT SYSDATE NOT NULL, -- 댓글 작성 일자
   PNUM INT NOT NULL,                -- 게시글 번호  
   MNAME VARCHAR(50) NOT NULL,        -- 회원 닉네임
   MID VARCHAR(50) NOT NULL          -- 회원 아이디 
);
----------------------------------------------------------------------------------------------
CREATE TABLE NOTICECOMMENT(			-- 공지게시판
   CNUM INT PRIMARY KEY,             -- 댓글 고유 번호 
   COMM VARCHAR(200) NOT NULL,       -- 댓글 내용 
   CDATE DATE DEFAULT SYSDATE NOT NULL, -- 댓글 작성 일자
   PNUM INT NOT NULL,                 -- 게시글 번호  
   MNAME VARCHAR(50) NOT NULL,        -- 회원 닉네임
   MID VARCHAR(50) NOT NULL          -- 회원 아이디 
);
----------------------------------------------------------------------------------------------










----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--------------------------------여경-----------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
-- 게시글 테이블 
CREATE TABLE FREEBOARD(
   PNUM INT PRIMARY KEY,              -- 게시글 고유 번호
   PTITLE VARCHAR(50) NOT NULL,       -- 게시글 제목 
   PCONTENT VARCHAR(1000) NOT NULL,    -- 게시글 내용
   PDATE DATE DEFAULT SYSDATE NOT NULL, -- 게시글 작성일자 
   MNAME VARCHAR(50) NOT NULL,          -- 회원 닉네임
   MID VARCHAR(50) NOT NULL,          -- 회원 아이디
   CNT INT NOT NULL,                 -- 조회수
   CATEGORY VARCHAR(50) NOT NULL        -- 카테고리 
);



select * from all_tables;

-- 게시글 리스트 보기
SELECT * FROM FREEBOARD ORDER BY PNUM DESC; --최신글 
SELECT * FROM FREEBOARD WHERE PTITLE='LIKE %H%' ORDER BY PNUM DESC; 
-- 게시글 상세 보기
SELECT * FROM FREEBOARD WHERE PNUM = 1 ;
----------------------------------------------------------------------------------------------
CREATE TABLE STUDYBOARD(
   PNUM INT PRIMARY KEY,              -- 게시글 고유 번호
   PTITLE VARCHAR(50) NOT NULL,       -- 게시글 제목 
   PCONTENT VARCHAR(1000) NOT NULL,    -- 게시글 내용
   PDATE DATE DEFAULT SYSDATE NOT NULL, -- 게시글 작성일자 
   MNAME VARCHAR(50) NOT NULL,          -- 회원 닉네임
   MID VARCHAR(50) NOT NULL,          -- 회원 아이디
   CNT INT NOT NULL,                 -- 조회수
   CATEGORY VARCHAR(50) NOT NULL        -- 카테고리 
);

select * from STUDYBOARD;

insert into STUDYBOARD values(1,'title1','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(2,'title2','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(3,'title3','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(4,'title4','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(5,'title5','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(6,'title6','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(7,'title7','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(8,'title8','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(9,'title9','content',sysdate,'nickname','garen',0,'study');
insert into STUDYBOARD values(10,'title10','content',sysdate,'nickname','garen',0,'study');

insert into STUDYBOARD values(11,'title11','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(12,'title12','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(13,'title13','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(14,'title14','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(15,'title15','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(16,'title16','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(17,'title17','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(18,'title18','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(19,'title19','content',sysdate,'nickname','timo',0,'study');
insert into STUDYBOARD values(20,'title20','content',sysdate,'nickname','timo',0,'study');

insert into STUDYBOARD values(21,'title21','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(22,'title22','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(23,'title23','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(24,'title24','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(25,'title25','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(26,'title26','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(27,'title27','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(28,'title28','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(29,'title29','content',sysdate,'nickname','ari',0,'study');
insert into STUDYBOARD values(30,'title30','content',sysdate,'nickname','ari',0,'study');

select count(*) from STUDYBOARD
SELECT * FROM ALL_TABLES;
SELECT * FROM STUDYBOARD;

select count(*) from STUDYBOARD

select * from (select rownum as pnum, ptitle, pcontent, pdate, mname, mid, cnt, category from STUDYBOARD order by pnum) where pnum between 1 and 5



select * from (select rownum as pnum, ptitle, pcontent, pdate, mname, mid, cnt, category from STUDYBOARD order by pnum) where pnum between 1 and 10;

----------------------------------------------------------------------------------------------
CREATE TABLE NOTICEBOARD(
   PNUM INT PRIMARY KEY,              -- 게시글 고유 번호
   PTITLE VARCHAR(50) NOT NULL,       -- 게시글 제목 
   PCONTENT VARCHAR(1000) NOT NULL,    -- 게시글 내용
   PDATE DATE DEFAULT SYSDATE NOT NULL, -- 게시글 작성일자 
   MNAME VARCHAR(50) NOT NULL,          -- 회원 닉네임
   MID VARCHAR(50) NOT NULL,          -- 회원 아이디
   CNT INT NOT NULL,                 -- 조회수
   CATEGORY VARCHAR(50) NOT NULL        -- 카테고리 
);
----------------------------------------------------------------------------------------------
-- 관심글 게시글 테이블 
CREATE TABLE CONCERM(
   FAVNUM INT PRIMARY KEY,             -- 관심 게시글 고유 번호  
   MID VARCHAR(50) NOT NULL,          -- 회원 아이디
   PNUM INT NOT NULL,                 -- 게시글 번호
   CATEGORY VARCHAR(50) NOT NULL       -- 카테고리

);
----------------------------------------------------------------------------------------------