clear screen;

DROP TABLE categories CASCADE CONSTRAINTS;
DROP TABLE developers CASCADE CONSTRAINTS;
DROP TABLE invoice CASCADE CONSTRAINTS;
DROP TABLE products CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS; 
DROP TABLE pro1 CASCADE CONSTRAINTS; 
DROP TABLE pro2 CASCADE CONSTRAINTS; 
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
insert into developers (dev_id, dev_name) values(11, 'Rocksteady Games');

insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(1, 'Rahim Ali', 10, 1, 450, TO_DATE('2019/02/18 11:02:44', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(2, 'Zarin Akter', 5, 1, 250, TO_DATE('2019/03/19 12:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(2, 'Zarin Akter', 4, 1, 500, TO_DATE('2019/04/14 12:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(2, 'Zarin Akter', 7, 1, 450, TO_DATE('2019/04/14 12:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(2, 'Zarin Akter', 1, 2, 700, TO_DATE('2019/04/14 12:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(3, 'Rumman Sikdar', 9, 1, 500, TO_DATE('2019/04/14 09:02:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(3, 'Rumman Sikdar', 10, 1, 450, TO_DATE('2019/04/14 09:02:00', 'yyyy/mm/dd hh24:mi:ss'));


insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(1, 5, 4, 'NFSMW', 350, 'PC', 'racing',15);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(2, 6, 8, 'AC:Revelations', 400, 'PC', 'action',5);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(3, 6, 3, 'DMC 4', 350, 'PC', 'action',4);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(4, 8, 10, 'TWD Season 1', 200, 'PC', 'adventure',13);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(5, 9, 6, 'SIMCITY 5', 250, 'PC',  'simulation',12);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(6, 6, 7, 'GTA IV', 500, 'PC', 'rpg',6);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(7, 10, 8, 'Far Cry 3', 450, 'PC', 'fps',8);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(8, 6, 3, 'RE 5', 400, 'PC', 'survival',7);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(9, 7, 1, 'WWE 2K15', 500, 'PC', 'wwe',9);
insert into products (p_id, cat_id, dev_id, title, price, platform, keyword, quantity) values(10, 1, 11, 'Batman AK', 450, 'PC', 'adventure',2);

insert into pro1 (p_id, cat_name, title, price, platform) values(4, 'Strategy', 'TWD Season 1', 200, 'PC');
insert into pro1 (p_id, cat_name, title, price, platform) values(5, 'Simulation', 'SIMCITY 5', 250, 'PC');
insert into pro2 (p_id, cat_name, title, price, platform) values(1, 'Racing', 'NFSMW', 350, 'PC');
insert into pro2 (p_id, cat_name, title, price, platform) values(2, 'RPG', 'AC:Revelations', 400, 'PC');
insert into pro2 (p_id, cat_name, title, price, platform) values(3, 'RPG', 'DMC 4', 350, 'PC');
insert into pro2 (p_id, cat_name, title, price, platform) values(6, 'RPG', 'GTA IV', 500, 'PC');
insert into pro2 (p_id, cat_name, title, price, platform) values(7, 'FPS', 'Far Cry 3', 450, 'PC');
insert into pro2 (p_id, cat_name, title, price, platform) values(8, 'RPG','RE 5', 400, 'PC');
insert into pro2 (p_id, cat_name, title, price, platform) values(9, 'Sports', 'WWE 2K15', 500, 'PC');
insert into pro2 (p_id, cat_name, title, price, platform) values(10, 'Action', 'Batman AK', 450, 'PC');

insert into emp_2 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(1, 'Rahim', 22, 5000, TO_DATE('2017/11/09', 'yyyy/mm/dd'),'male');
insert into emp_1 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(2, 'Karim', 23, 3000, TO_DATE('2018/10/04', 'yyyy/mm/dd'),'male');
insert into emp_2 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(3, 'Selina', 18, 5000, TO_DATE('2019/03/02', 'yyyy/mm/dd'),'female');
insert into emp_1 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(4, 'Raba', 19, 3000, TO_DATE('2018/12/01', 'yyyy/mm/dd'),'female');
insert into emp_2 (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(5, 'Robin', 22, 4000, TO_DATE('2018/06/09', 'yyyy/mm/dd'),'male');

insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(1, 'Rahim', 22, 5000, TO_DATE('2017/11/09', 'yyyy/mm/dd'),'male');
insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(2, 'Karim', 23, 3000, TO_DATE('2018/10/04', 'yyyy/mm/dd'),'male');
insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(3, 'Selina', 18, 5000, TO_DATE('2019/03/02', 'yyyy/mm/dd'),'female');
insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(4, 'Raba', 19, 3000, TO_DATE('2018/12/01', 'yyyy/mm/dd'),'female');
insert into employees (e_id, e_name, e_age, e_salary, e_join_date, e_gender) values(5, 'Robin', 22, 4000, TO_DATE('2018/06/09', 'yyyy/mm/dd'),'male');

commit;