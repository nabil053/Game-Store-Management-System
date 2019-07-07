set serveroutput on;
DECLARE
begin
	
	DBMS_OUTPUT.PUT_LINE('View Games Based on price');
	DBMS_OUTPUT.PUT_LINE('1. Low Price Games');
	DBMS_OUTPUT.PUT_LINE('1. High Price Games');

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
		    for select p.p_id, c.cat_name, d.dev_name, p.title, p.price,p.platform, p.keyword, p.quantity from categories c, developers d, products p Where p.cat_id = c.cat_id and p.dev_id = d.dev_id and (p.price<=250);
		    return pro_cur;
		ELSE
			open pro_cur
		    for select p.p_id, c.cat_name, d.dev_name, p.title, p.price,p.platform, p.keyword, p.quantity from categories c, developers d, products p Where p.cat_id = c.cat_id and p.dev_id = d.dev_id and (p.price>250);
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
BEGIN
	CASE input
	WHEN 1 THEN
		pro_cur := getLowHighProducts(input);
		
	WHEN 2 THEN
		pro_cur := getLowHighProducts(input);
		
	ELSE
		raise error_raise;
	END CASE;
	
		loop
		fetch pro_cur into Id,Cat,Dev,Name,Taka,Platform,Key,Qty;
		exit when pro_cur%notfound;
			DBMS_OUTPUT.PUT_LINE('| SNo: '|| Id ||' | Category Name: '||TO_CHAR(Cat)||' | Developer Name: '||TO_CHAR(Dev)||' | Game Name: '||TO_CHAR(Name)||' | Price: '||TO_CHAR(Taka)||' | Platform: '||TO_CHAR(Platform)||' | Keyword: '||TO_CHAR(Key)||' | Quentity: '||TO_CHAR(Qty)||' | '||chr(13)||chr(10));
		end loop;

	EXCEPTION
	 When error_raise THEN
	 	DBMS_OUTPUT.PUT_LINE('Invalid Input:');
		
END;

/