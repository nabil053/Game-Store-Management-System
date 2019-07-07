set serveroutput on;
DECLARE
begin
	
	DBMS_OUTPUT.PUT_LINE('View Games Based on price');
	DBMS_OUTPUT.PUT_LINE('1. Low Price All Games');
	DBMS_OUTPUT.PUT_LINE('2. High Price All Games');
	DBMS_OUTPUT.PUT_LINE('3. Low Price Pc Games');
	DBMS_OUTPUT.PUT_LINE('4. HIGH Price Pc Games');
	DBMS_OUTPUT.PUT_LINE('5. Low Price PS Games');
	DBMS_OUTPUT.PUT_LINE('6. High Price PS Games');


end;
/

SET SERVEROUTPUT ON;
CREATE OR REPLACE function getLowHighProducts(svalue in varchar2)
		return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin 

		IF svalue = 1 THEN
			open pro_cur
		    for select c1.cat_name, d1.dev_name, p1.title, p1.price, p1.platform, p1.keyword, p1.quantity from categories@site_link5 c1, developers@site_link5 d1, products@site_link5 p1 Where p1.cat_id = c1.cat_id and p1.dev_id = d1.dev_id and (p1.price<=250)
			union
		        select c2.cat_name, d2.dev_name, p2.title, p2.price, p2.platform, p2.keyword, p2.quantity from categories@site_link6 c2, developers@site_link6 d2, products@site_link6 p2 Where p2.cat_id = c2.cat_id and p2.dev_id = d2.dev_id and (p2.price<=250);
		    return pro_cur;
		ELSIF svalue =2 THEN
			open pro_cur
		    for select c1.cat_name, d1.dev_name, p1.title, p1.price, p1.platform, p1.keyword, p1.quantity from categories@site_link5 c1, developers@site_link5 d1, products@site_link5 p1 Where p1.cat_id = c1.cat_id and p1.dev_id = d1.dev_id and (p1.price>250)
			union
		        select c2.cat_name, d2.dev_name, p2.title, p2.price, p2.platform, p2.keyword, p2.quantity from categories@site_link6 c2, developers@site_link6 d2, products@site_link6 p2 Where p2.cat_id = c2.cat_id and p2.dev_id = d2.dev_id and (p2.price>250);
		    return pro_cur;
		 ELSIF svalue =3 THEN 
		 	open pro_cur
		    for select c1.cat_name, d1.dev_name, p1.title, p1.price, p1.platform, p1.keyword, p1.quantity from categories@site_link5 c1, developers@site_link5 d1, products@site_link5 p1 Where p1.cat_id = c1.cat_id and p1.dev_id = d1.dev_id and (p1.price<=250);
		    return pro_cur;
		 ELSIF svalue =4 THEN 
		 	open pro_cur
		    for select c1.cat_name, d1.dev_name, p1.title, p1.price, p1.platform, p1.keyword, p1.quantity from categories@site_link5 c1, developers@site_link5 d1, products@site_link5 p1 Where p1.cat_id = c1.cat_id and p1.dev_id = d1.dev_id and (p1.price>250);
		    return pro_cur;
		 ELSIF svalue =5 THEN 
		 	open pro_cur
		    for select c2.cat_name, d2.dev_name, p2.title, p2.price, p2.platform, p2.keyword, p2.quantity from categories@site_link6 c2, developers@site_link6 d2, products@site_link6 p2 Where p2.cat_id = c2.cat_id and p2.dev_id = d2.dev_id and (p2.price<=250);
		    return pro_cur;
		ELSE
			open pro_cur
		    for select c2.cat_name, d2.dev_name, p2.title, p2.price, p2.platform, p2.keyword, p2.quantity from categories@site_link6 c2, developers@site_link6 d2, products@site_link6 p2 Where p2.cat_id = c2.cat_id and p2.dev_id = d2.dev_id and (p2.price>250);
		    return pro_cur;
		END IF;
END getLowHighProducts;

/


SET SERVEROUTPUT ON;
DECLARE 
pro_cur sys_refcursor;
Id products.p_id%TYPE; 
Cat CATEGORIES.cat_name%TYPE;
Dev DEVELOPERS.dev_name%TYPE;
Name products.title%TYPE; 
Platform products.platform%TYPE; 
Taka products.price%TYPE; 
Key products.keyword%TYPE;
Qty products.quantity%TYPE;

error_raise EXCEPTION;
input number := &enter_value;
sno number:=0;
BEGIN
	CASE input
	WHEN 1 THEN
		pro_cur := getLowHighProducts(input);
		
	WHEN 2 THEN
		pro_cur := getLowHighProducts(input);
	WHEN 3 THEN
		pro_cur := getLowHighProducts(input);
	WHEN 4 THEN
		pro_cur := getLowHighProducts(input);
	WHEN 5 THEN
		pro_cur := getLowHighProducts(input);
	WHEN 6 THEN
		pro_cur := getLowHighProducts(input);
		
	ELSE
		raise error_raise;
	END CASE;
	
		loop
		sno := sno + 1;
		fetch pro_cur into Cat,Dev,Name,Taka,Platform,Key,Qty;
		exit when pro_cur%notfound;
			DBMS_OUTPUT.PUT_LINE('| SNo: '|| sno ||' | Category Name: '||TO_CHAR(Cat)||' | Developer Name: '||TO_CHAR(Dev)||' | Game Name: '||TO_CHAR(Name)||' | Price: '||TO_CHAR(Taka)||' | Platform: '||TO_CHAR(Platform)||' | Keyword: '||TO_CHAR(Key)||' | Quentity: '||TO_CHAR(Qty)||' | '||chr(13)||chr(10));
		end loop;

	EXCEPTION
	 When error_raise THEN
	 	DBMS_OUTPUT.PUT_LINE('Invalid Input:');
		
END;

/