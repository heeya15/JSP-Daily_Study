create table member ( 
    id varchar(10) not null,  		-- 회원 아이디
    password varchar(10) not null,  -- 비밀번호
    name varchar(10) not null,  	-- 이름
    gender varchar(4),				-- 성별
    birth  varchar(10),				-- 생일
    mail  varchar(30),				-- 이메밀
    phone varchar(20),				-- 전화번호
    address varchar(90),			-- 주소
    regist_day varchar(50),    		-- 가입 일자
    primary key(id) 				-- 회원 아이디를 [ 기본키 ] 설정.
) ;

select * from member;
drop table member;
