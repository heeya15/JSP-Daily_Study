CREATE TABLE product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(30),
	p_unitprice INTEGER, -- 상품가격
	p_description CLOB, --설명 (문자형 대용량 데이터타입으로 설정)
	p_manufacturer VARCHAR(20), --제조사
	p_category VARCHAR(20), -- 분류
	p_unitsinstock INTEGER, --재고수
	p_condition VARCHAR(20),
	p_filename VARCHAR(20),
	PRIMARY KEY (p_id)
);
drop table product purge;
DESC product;
-- 3개의 데이터를 삽입
insert into PRODUCT values('P1234', 'iPhone 6s', 800000,'4.7-inch, 1334X750 Renina HD display,8-megapixel iSight Camera',
'Apple', 'Smart Phone', '1000', 'New','P1234.png');
insert into PRODUCT values('P1235', 'LG PC gram', 1500000,'13.3-inch, IPS LED display,5-rd Generation Intel Core processors',
'LG', 'Notebook', '1000', 'Refurbished','P1235.png');
insert into PRODUCT values('P1236', 'Galaxy Tab S', 900000, '212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor',
'Samsung', 'Tablet', '1000', 'Old','P1236.png');

delete product where p_id = 'P1237';
-- 상품 테이블 조회
SELECT * FROM PRODUCT; 
	
	
		