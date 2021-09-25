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