CREATE TABLE tbl_product_01 (
    pcode VARCHAR2(10) NOT NULL,       
    name VARCHAR2(20),                   
    cost NUMBER(10),                    
    CONSTRAINT pk_product PRIMARY KEY (pcode)  

CREATE TABLE tbl_shop_01 (
    scode VARCHAR2(10) NOT NULL,         
    sname VARCHAR2(20),                
    CONSTRAINT pk_shop PRIMARY KEY (scode)  

CREATE TABLE tbl_salelist_01 (
    saleno NUMBER(10) NOT NULL,          
    pcode VARCHAR2(10) NOT NULL,          
    saledate DATE,                        
    scode VARCHAR2(10) NOT NULL,          
    amount NUMBER(10),                  
    CONSTRAINT pk_salelist PRIMARY KEY (saleno),  
    CONSTRAINT fk_salelist_product FOREIGN KEY (pcode) REFERENCES tbl_product_01(pcode), 
    CONSTRAINT fk_salelist_shop FOREIGN KEY (scode) REFERENCES tbl_shop_01(scode)  
);

INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA01', '아메리카노', 3000);
INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA02', '에스프레소', 3500);
INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA03', '카페라떼', 4000);
INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA04', '카라멜마끼', 4500);
INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA05', '카푸치노', 5000);
INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA06', '초코롤케익', 6000);
INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA07', '녹차롤케익', 6500);
INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA08', '망고쥬스', 7000);
INSERT INTO tbl_product_01 (pcode, name, cost) VALUES ('AA09', '핫초코', 2500);


INSERT INTO tbl_shop_01 (scode, sname) VALUES ('S001', '강남점');
INSERT INTO tbl_shop_01 (scode, sname) VALUES ('S002', '강서점');
INSERT INTO tbl_shop_01 (scode, sname) VALUES ('S003', '강동점');
INSERT INTO tbl_shop_01 (scode, sname) VALUES ('S004', '강북점');
INSERT INTO tbl_shop_01 (scode, sname) VALUES ('S005', '동대문점');
INSERT INTO tbl_shop_01 (scode, sname) VALUES ('S006', '인천점');


INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100001, 'AA01', TO_DATE('20180902', 'YYYYMMDD'), 'S001', 50);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100002, 'AA03', TO_DATE('20180902', 'YYYYMMDD'), 'S002', 40);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100003, 'AA04', TO_DATE('20180902', 'YYYYMMDD'), 'S002', 20);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100004, 'AA04', TO_DATE('20180902', 'YYYYMMDD'), 'S001', 30);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100005, 'AA05', TO_DATE('20180902', 'YYYYMMDD'), 'S004', 40);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100006, 'AA03', TO_DATE('20180902', 'YYYYMMDD'), 'S004', 30);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100007, 'AA01', TO_DATE('20180902', 'YYYYMMDD'), 'S003', 40);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100008, 'AA04', TO_DATE('20180902', 'YYYYMMDD'), 'S004', 10);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100009, 'AA01', TO_DATE('20180902', 'YYYYMMDD'), 'S003', 20);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100010, 'AA05', TO_DATE('20180902', 'YYYYMMDD'), 'S003', 30);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100011, 'AA01', TO_DATE('20180902', 'YYYYMMDD'), 'S001', 40);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100012, 'AA03', TO_DATE('20180902', 'YYYYMMDD'), 'S002', 50);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100013, 'AA04', TO_DATE('20180902', 'YYYYMMDD'), 'S002', 50);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100014, 'AA05', TO_DATE('20180902', 'YYYYMMDD'), 'S004', 20);
INSERT INTO tbl_salelist_01 (saleno, pcode, saledate, scode, amount) VALUES (100015, 'AA01', TO_DATE('20180902', 'YYYYMMDD'), 'S003', 30);

select B.saleno, A.pcode, TO_CHAR(B.saledate, 'YYYY-MM-DD') SALEDATE,
		C.scode, A.name, A.amount, TO_CHAR(B.amount*A.cost, '999,999,999') cost
from tbl_product_01 A, tbl_salelist_01 B, tbl_shop_01 C
where A.pcode =B.pcode AND C.scode = B.scode;

select C.scode, c.sname, To_CHAR(SUM(B.amount*A.cost), '999,999,999') cost
from tbl_product_01 A, tbl_salelist_01 B, tbl_shop_01 c
where a.pcode = b.pcode and c.scode = b.scode
group by c.scode, c.sname
order by 1;

select c.scode, c.sname, TO_CHAR(sum(b.amount*a.cost), '999,999,999') cost
from tbl_product_01 a, tbl_salelist_01 b, tbl_shop_01 c
where a.pcode = b.pcode and c.scode = b.scode
group by a.pcode, a.name
order by 1;

select max(saleno)+1 saleno from tbl_salelist_01;
