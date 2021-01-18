CREATE TABLE member(
	id VARCHAR(20) NOT NULL, 
	passwd VARCHAR(20),
	name VARCHAR(30),
	PRIMARY KEY (id)
);

select * from member order by ID;
INSERT into MEMBER values('1','1234','관리자');
DROP TABLE member purge;