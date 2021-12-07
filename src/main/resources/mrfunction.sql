SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS adboard;
DROP TABLE IF EXISTS adpost;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS img;
DROP TABLE IF EXISTS itemlike;
DROP TABLE IF EXISTS survey;
DROP TABLE IF EXISTS itemreview;
DROP TABLE IF EXISTS size;
DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS brand;
DROP TABLE IF EXISTS destination;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS sale;
DROP TABLE IF EXISTS customer;




/* Create Tables */

CREATE TABLE adboard
(
	num int unsigned NOT NULL COMMENT 'num',
	content text NOT NULL COMMENT '내용',
	itemid varchar(30) COMMENT '상품번호',
	views int unsigned DEFAULT 0 NOT NULL COMMENT '조회수',
	created_at timestamp DEFAULT current_timestamp COMMENT '등록일시',
	PRIMARY KEY (num)
) COMMENT = '광고보드';


CREATE TABLE adpost
(
	num int unsigned NOT NULL AUTO_INCREMENT COMMENT 'num',
	sellerid varchar(30) NOT NULL COMMENT '사업자명 : 아이디',
	rank tinyint unsigned NOT NULL COMMENT '홍보등급',
	itemid int unsigned NOT NULL COMMENT '상품번호',
	contract text NOT NULL COMMENT '계약정보',
	PRIMARY KEY (num),
	UNIQUE (num)
) COMMENT = '광고등록';


CREATE TABLE board
(
	num int unsigned NOT NULL AUTO_INCREMENT COMMENT '글번호',
	ariticletype tinyint NOT NULL COMMENT '글타입 : FAQ
공지사항
문의하기
상품문의',
	category varchar(30) COMMENT '카테고리',
	title varchar(100) NOT NULL COMMENT '제목',
	customerid varchar(30) NOT NULL COMMENT '작성자 : 아이디',
	itemId varchar(30) COMMENT 'itemId',
	content text NOT NULL COMMENT '내용',
	ref int unsigned COMMENT '참조번호',
	qa bit(1) COMMENT 'qa : question/answer
0-기본글
1-답글',
	created_at timestamp DEFAULT current_timestamp NOT NULL COMMENT '등록일시',
	updated_at timestamp DEFAULT current_timestamp
		ON UPDATE current_timestamp
	NOT NULL COMMENT '수정일시',
	PRIMARY KEY (num),
	UNIQUE (num),
	UNIQUE (qa)
) COMMENT = '통합게시판';


CREATE TABLE brand
(
	brandcode varchar(20) NOT NULL COMMENT 'brandcode',
	brandname varchar(20) NOT NULL COMMENT '브랜드명',
	link varchar(100) COMMENT '브랜드 정보',
	PRIMARY KEY (brandcode),
	UNIQUE (brandname)
) COMMENT = '브랜드';


CREATE TABLE customer
(
	id varchar(30) NOT NULL COMMENT 'id : 아이디',
	type smallint DEFAULT 2 NOT NULL COMMENT '유저 타입 : 1-관리자
2-일반 유저
3-온라인 판매자
4-오프라인 판매자
5-일반유저(kakao)
6-온라인판매자(kakao)
7-오프라인판매자(kakao)',
	password varchar(30) NOT NULL COMMENT '비밀번호',
	auth varchar(50) COMMENT 'auth',
	name varchar(40) NOT NULL COMMENT '이름',
	nickname varchar(40) NOT NULL COMMENT '별명',
	phoneno varchar(15) NOT NULL COMMENT '전화번호',
	email varchar(40) NOT NULL COMMENT 'email',
	gender tinyint unsigned NOT NULL COMMENT '성별 : 1-남자
2-여자
3-',
	birthday date COMMENT '생일 : past
',
	companyno int unsigned COMMENT '사업자등록번호',
	personalfile varchar(200) COMMENT '주민등록',
	companyfile varchar(200) COMMENT '사업자등록증',
	location varchar(200) COMMENT '매장 위치 : 오프라인의 경우 매장 위치',
	created_at timestamp DEFAULT current_timestamp COMMENT '가입일시',
	updated_at timestamp DEFAULT current_timestamp
		ON UPDATE current_timestamp
		COMMENT '수정일시',
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (nickname),
	UNIQUE (companyno),
	UNIQUE (personalfile),
	UNIQUE (companyfile)
) COMMENT = '고객';


CREATE TABLE destination
(
	seq int unsigned NOT NULL AUTO_INCREMENT COMMENT 'seq',
	customerid varchar(30) NOT NULL COMMENT 'id : 아이디',
	address varchar(200) NOT NULL COMMENT '배송지',
	PRIMARY KEY (seq)
) COMMENT = '배송지';


CREATE TABLE img
(
	seq int unsigned NOT NULL AUTO_INCREMENT COMMENT 'seq',
	itemId varchar(30) NOT NULL COMMENT 'itemId',
	img varchar(100) NOT NULL COMMENT 'img',
	PRIMARY KEY (seq, itemId)
) COMMENT = '이미지';


CREATE TABLE item
(
	itemId varchar(30) NOT NULL COMMENT 'itemId',
	sellerid varchar(30) NOT NULL COMMENT '판매자 : 아이디',
	title varchar(100) NOT NULL COMMENT '상품명',
	img varchar(100) COMMENT '대표이미지',
	description text COMMENT '상품설명',
	price int unsigned NOT NULL COMMENT '가격',
	brandcode varchar(20) NOT NULL COMMENT 'brandcode',
	content text COMMENT '상세내용',
	color varchar(20) NOT NULL COMMENT '색상',
	fit varchar(30) NOT NULL COMMENT '핏 : 스트레이트
와이드
테이퍼드
스키니
...',
	style varchar(20) COMMENT '스타일',
	created_at timestamp DEFAULT current_timestamp NOT NULL COMMENT '등록일시 : 상품 등록 일자',
	updated_at timestamp
		DEFAULT current_timestamp
		ON UPDATE current_timestamp
		COMMENT '수정일시',
	PRIMARY KEY (itemId)
) COMMENT = '아이템';


CREATE TABLE itemlike
(
	itemId varchar(30) NOT NULL COMMENT 'itemId',
	customerid varchar(30) NOT NULL COMMENT 'customerid : 아이디',
	PRIMARY KEY (itemId, customerid),
	UNIQUE (itemId, customerid)
) COMMENT = '좋아요';


CREATE TABLE itemreview
(
	num int unsigned NOT NULL AUTO_INCREMENT COMMENT '글번호',
	itemId varchar(30) NOT NULL COMMENT 'itemId',
	customerid varchar(30) NOT NULL COMMENT 'customerid : 아이디',
	score tinyint NOT NULL COMMENT '평점 : 1~10',
	content text COMMENT '내용',
	img varchar(100) COMMENT 'img',
	created_at timestamp DEFAULT current_timestamp NOT NULL COMMENT '등록일시',
	updated_at timestamp DEFAULT current_timestamp
		ON UPDATE current_timestamp
		COMMENT '수정일시',
	PRIMARY KEY (num)
) COMMENT = '리뷰';


CREATE TABLE payment
(
	customerid varchar(30) NOT NULL COMMENT 'customerid : 아이디',
	seq int NOT NULL COMMENT 'seq',
	payment varchar(20) NOT NULL COMMENT '결제수단',
	payinfo varchar(40) NOT NULL COMMENT '결제정보',
	PRIMARY KEY (customerid, seq)
) COMMENT = '결제정보';


CREATE TABLE sale
(
	saleid varchar(30) NOT NULL COMMENT 'saleid',
	buyerid varchar(30) NOT NULL COMMENT '구매자 : 아이디',
	destination varchar(200) NOT NULL COMMENT '배송지',
	receiver varchar(20) COMMENT '받는사람',
	invoice varchar(20) COMMENT '운송장번호',
	saledate timestamp NOT NULL COMMENT '주문일자',
	PRIMARY KEY (saleid)
) COMMENT = '주문';


CREATE TABLE size
(
	itemId varchar(30) NOT NULL COMMENT 'itemId',
	size float(3,1) unsigned NOT NULL COMMENT '치수',
	measure float(3,1) unsigned NOT NULL COMMENT '실측치',
	PRIMARY KEY (itemId, size)
) COMMENT = '사이즈';


CREATE TABLE survey
(
	num int unsigned NOT NULL COMMENT '글번호',
	attribute varchar(20) NOT NULL COMMENT '설문항목',
	value tinyint NOT NULL COMMENT '값',
	PRIMARY KEY (num, attribute),
	UNIQUE (attribute)
) COMMENT = '추가설문';


CREATE TABLE transaction
(
	transaction_num int unsigned NOT NULL AUTO_INCREMENT COMMENT '거래번호',
	saleid varchar(30) COMMENT 'saleid',
	itemId varchar(30) NOT NULL COMMENT 'itemId',
	datetime timestamp DEFAULT current_timestamp NOT NULL COMMENT '거래일',
	quantity smallint unsigned NOT NULL COMMENT '거래량',
	PRIMARY KEY (transaction_num),
	UNIQUE (transaction_num)
) COMMENT = '입출고';



/* Create Foreign Keys */

ALTER TABLE adboard
	ADD FOREIGN KEY (num)
	REFERENCES adpost (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE item
	ADD FOREIGN KEY (brandcode)
	REFERENCES brand (brandcode)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE adpost
	ADD FOREIGN KEY (sellerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (customerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE destination
	ADD FOREIGN KEY (customerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE item
	ADD FOREIGN KEY (sellerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE itemlike
	ADD FOREIGN KEY (customerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE itemreview
	ADD FOREIGN KEY (customerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE payment
	ADD FOREIGN KEY (customerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sale
	ADD FOREIGN KEY (buyerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE adboard
	ADD FOREIGN KEY (itemid)
	REFERENCES item (itemId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (itemId)
	REFERENCES item (itemId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE img
	ADD FOREIGN KEY (itemId)
	REFERENCES item (itemId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE itemlike
	ADD FOREIGN KEY (itemId)
	REFERENCES item (itemId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE itemreview
	ADD FOREIGN KEY (itemId)
	REFERENCES item (itemId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE size
	ADD FOREIGN KEY (itemId)
	REFERENCES item (itemId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE transaction
	ADD FOREIGN KEY (itemId)
	REFERENCES item (itemId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE survey
	ADD FOREIGN KEY (num)
	REFERENCES itemreview (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE transaction
	ADD FOREIGN KEY (saleid)
	REFERENCES sale (saleid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



