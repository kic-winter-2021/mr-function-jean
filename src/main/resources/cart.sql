DROP TABLE IF EXISTS cart;

CREATE TABLE cart
(
	customerid varchar(30) NOT NULL COMMENT 'customerid : 아이디',
	itemId varchar(30) NOT NULL COMMENT 'itemId',
	quantity int unsigned DEFAULT 1 NOT NULL COMMENT '개수',
	PRIMARY KEY (customerid, itemId),
	UNIQUE (customerid)
) COMMENT = '장바구니';

ALTER TABLE cart
	ADD FOREIGN KEY (customerid)
	REFERENCES customer (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

ALTER TABLE cart
	ADD FOREIGN KEY (itemId)
	REFERENCES item (itemId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;