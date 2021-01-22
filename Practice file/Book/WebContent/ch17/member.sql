CREATE TABLE member(
	id VARCHAR(20) NOT NULL, 
	passwd VARCHAR(20),
	name VARCHAR(30),
	PRIMARY KEY (id)
);
INSERT into MEMBER values('1','1234','홍길순');
INSERT into MEMBER values('2','1235','홍길동');
select * from member order by ID;

DROP TABLE member purge;