set serveroutput on;
DECLARE
begin
	
	DBMS_OUTPUT.PUT_LINE('Search a Specific Products');

end;
/

SET SERVEROUTPUT ON;
CREATE OR REPLACE function searchFunc(svalue in varchar2)
		return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin 
		open pro_cur
	    for select p.p_id, c.cat_name, d.dev_name, p.title, p.price,p.platform, p.keyword, p.quantity from categories c, developers d, products p Where p.cat_id = c.cat_id and p.dev_id = d.dev_id and (p.title LIKE svalue or c.cat_name LIKE svalue or d.dev_name LIKE svalue or p.keyword LIKE svalue);
	    return pro_cur;
	 
		
END searchFunc;

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

BEGIN

	pro_cur := searchFunc('%&search_value%');
	loop
	fetch pro_cur into Id,Cat,Dev,Name,Taka,Platform,Key,Qty;
	exit when pro_cur%notfound;
		DBMS_OUTPUT.PUT_LINE('| SNo: '|| Id ||' | Category Name: '||TO_CHAR(Cat)||' | Developer Name: '||TO_CHAR(Dev)||' | Game Name: '||TO_CHAR(Name)||' | Price: '||TO_CHAR(Taka)||' | Platform: '||TO_CHAR(Platform)||' | Keyword: '||TO_CHAR(Key)||' | Quentity: '||TO_CHAR(Qty)||' | '||chr(13)||chr(10));
	end loop;
		
END;

/