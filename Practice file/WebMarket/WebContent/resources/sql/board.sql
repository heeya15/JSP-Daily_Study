CREATE SEQUENCE board_seq 
START WITH 1 
INCREMENT BY 1 MAXVALUE 100000 CYCLE NOCACHE;
DROP SEQUENCE board_seq;
CREATE TABLE board (
       num INTEGER not null, 		    -- 게시글 [순번]
       id varchar(10) not null,         -- 회원 [아이디]
       name varchar(10) not null,       -- 회원 [이름]
       subject varchar(100) not null,   -- 게시글 [제목]
       content CLOB not null,           -- 게시글 내용
       regist_day varchar(30),          -- 게시글 등록 일자
       hit INTEGER,                         -- 게시글 조회 수
       ip varchar(20),                  -- 게시글 등록 시 IP
       PRIMARY KEY (num)                -- 게시글 순번을 고유 키로 설정.
);

select * from board;
desc board;
drop table board;