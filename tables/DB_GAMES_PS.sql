clear screen;

DROP TABLE categories CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE developers CASCADE CONSTRAINTS;
DROP TABLE invoice CASCADE CONSTRAINTS;
DROP TABLE products CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS; 
DROP TABLE emp_1 CASCADE CONSTRAINTS; 
DROP TABLE emp_2 CASCADE CONSTRAINTS; 

CREATE TABLE categories(
	cat_id number, 
	cat_name varchar2(20), 
	PRIMARY KEY(cat_id));

CREATE TABLE developers(
	dev_id number, 
	dev_name varchar2(20), 
	PRIMARY KEY(dev_id));

CREATE TABLE invoice(
	ivc_id number,
	c_name varchar2(30),
	p_id number,
	p_quantity number,
	total_price number,
	ivc_date date);

CREATE TABLE products(
	p_id number, 
	cat_id number,
	dev_id number,
	title varchar2(20),
	price number,
	platform varchar2(20),
	keyword varchar2(20),
	quantity number,
    PRIMARY KEY(p_id));

CREATE TABLE pro1(
	p_id number, 
	cat_name varchar2(20),
	title varchar2(20),
	price number,
	platform varchar2(20));

CREATE TABLE pro2(
	p_id number, 
	cat_name varchar2(20),
	title varchar2(20),
	price number,
	platform varchar2(20));
	
CREATE TABLE employees(
	e_id number,
	e_name varchar2(30),
	e_age number,
	e_salary number,
	e_join_date date,
	e_gender varchar2(30),
	PRIMARY KEY(e_id)
    );

CREATE TABLE emp_1(
	e_id number,
	e_name varchar2(30),
	e_age number,
	e_salary number,
	e_join_date date,
	e_gender varchar2(30)
	);
	
CREATE TABLE emp_2(
	e_id number,
	e_name varchar2(30),
	e_age number,
	e_salary number,
	e_join_date date,
	e_gender varchar2(30)
    );

insert into categories (cat_id, cat_name) values(1, 'Action');
insert into categories (cat_id, cat_name) values(2, 'Adventure');
insert into categories (cat_id, cat_name) values(3, 'Card');
insert into categories (cat_id, cat_name) values(4, 'Puzzle');
insert into categories (cat_id, cat_name) values(5, 'Racing');
insert into categories (cat_id, cat_name) values(6, 'RPG');
insert into categories (cat_id, cat_name) values(7, 'Sports');
insert into categories (cat_id, cat_name) values(8, 'Strategy');
insert into categories (cat_id, cat_name) values(9, 'Simulation');
insert into categories (cat_id, cat_name) values(10, 'FPS');

insert into developers (dev_id, dev_name) values(1, '2K Games');
insert into developers (dev_id, dev_name) values(2, 'Activision');
insert into developers (dev_id, dev_name) values(3, 'Capcom'); 
insert into developers (dev_id, dev_name) values(4, 'Electronic Arts');
insert into developers (dev_id, dev_name) values(5, 'Gameloft'); 
insert into developers (dev_id, dev_name) values(6, 'Maxis Software');
insert into developers (dev_id, dev_name) values(7, 'Rockstar Games');
insert into developers (dev_id, dev_name) values(8, 'Ubisoft'); 
insert into developers (dev_id, dev_name) values(9, 'Nintendo');
insert into developers (dev_id, dev_name) values(10, 'Telltale Games');
insert into developers (dev_id, dev_name) values(11, 'Insomniac Games');
insert into developers (dev_id, dev_name) values(12, 'Quantico');
insert into developers (dev_id, dev_name) values(13, 'Naughty Dog');
insert into developers (dev_id, dev_name) values(14, 'SIE');

insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(1, 'Riad Hossain', 1, 2, 700, TO_DATE('2019/01/15 11:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(2, 'Samantha Akter', 3, 1, 350, TO_DATE('2019/04/14 12:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(2, 'Samantha Akter', 4, 1, 200, TO_DATE('2019/04/14 12:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(2, 'Samantha Akter', 7, 1, 400, TO_DATE('2019/04/14 12:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(2, 'Samantha Akter', 9, 1, 300, TO_DATE('2019/04/14 12:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(3, 'Rubban Ali', 2, 1, 400, TO_DATE('2019/04/14 10:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(3, 'Rubban Ali', 8, 1, 300, TO_DATE('2019/04/14 10:02:00', 'yyyy/mm/dd hh24:mi:ss'));


insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(1, 5, 4, 'NFSMW', 350, 'PS', 'racing',5);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(2, 6, 8, 'AC:Revelations', 400, 'PS', 'action',6);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(3, 6, 3, 'DMC 5', 350, 'PS', 'action',8);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(4, 8, 10, 'TWD Season 1', 200, 'PS', 'adventure',7);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(5, 2, 11, 'Spider-Man 2', 250, 'PS', 'adventure',5);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(6, 1, 7, 'RDR 2', 500, 'PS', 'western',9);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(7, 6, 12, 'Detroit', 400, 'PS', 'interactive',10);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(8, 2, 13, 'Uncharted 4', 300, 'PS', 'adventure',5);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(9, 2, 14, 'God of War', 300, 'PS', 'adventure',12);

insert into pro1 (p_id, cat_name, title, price, platform) values(4, 'Strategy','TWD Season 1', 200, 'PS' );
insert into pro1 (p_id, cat_name, title, price, platform) values(5, 'Advenure', 'Spider-Man 2', 250, 'PS');
insert into pro2 (p_id, cat_name, title, price, platform) values(1, 'Racing', 'NFSMW', 350, 'PS');
insert into pro2 (p_id, cat_name, title, price, platform) values(2, 'RPG', 'AC:Revelations', 400, 'PS');
insert into pro2 (p_id, cat_name, title, price, platform) values(3, 'RPG', 'DMC 5', 350, 'PS');
insert into pro2 (p_id, cat_name, title, price, platform) values(6, 'Action', 'RDR 2', 500, 'PS');
insert into pro2 (p_id, cat_name, title, price, platform) values(7, 'RPG', 'Detroit', 400, 'PS');
insert into pro2 (p_id, cat_name, title, price, platform) values(8, 'Adventure', 'Uncharted 4', 300, 'PS');
insert into pro2 (p_id, cat_name, title, price, platform) values(9, 'Adventure', 'God of War', 300, 'PS');



insert into emp_1 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(1, 'Nobil', 18, 2500, TO_DATE('2018/10/09', 'yyyy/mm/dd'),'male');
insert into emp_1 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(2, 'Sagor', 20, 3000, TO_DATE('2018/07/04', 'yyyy/mm/dd'),'male');
insert into emp_2 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(3, 'Kriti', 19, 5000, TO_DATE('2017/05/02', 'yyyy/mm/dd'),'female');
insert into emp_1 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(4, 'Reza', 22, 3000, TO_DATE('2019/02/01', 'yyyy/mm/dd'),'female');

insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(1, 'Rahim', 22, 5000, TO_DATE('2017/11/09', 'yyyy/mm/dd'),'male');
insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(2, 'Karim', 23, 3000, TO_DATE('2018/10/04', 'yyyy/mm/dd'),'male');
insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(3, 'Selina', 18, 5000, TO_DATE('2019/03/02', 'yyyy/mm/dd'),'female');
insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(4, 'Raba', 19, 3000, TO_DATE('2018/12/01', 'yyyy/mm/dd'),'female');
insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(5, 'Robin', 22, 4000, TO_DATE('2018/06/09', 'yyyy/mm/dd'),'male');


commit;