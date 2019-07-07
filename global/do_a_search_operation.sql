set serveroutput on;
DECLARE
begin
	
	DBMS_OUTPUT.PUT_LINE('Search a Specific Products');

end;
/

SET SERVEROUTPUT ON;
CREATE OR REPLACE function searchFuncGlobal(svalue in varchar2)
		return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin 
		open pro_cur
	    for select c1.cat_name, d1.dev_name, p1.title, p1.price, p1.platform, p1.keyword, p1.quantity from
	     categories@site_link5 c1, developers@site_link5 d1, products@site_link5 p1 Where
	      p1.cat_id = c1.cat_id and p1.dev_id = d1.dev_id and
	       (c1.cat_name like svalue or d1.dev_name like svalue or p1.title like svalue or p1.keyword like svalue)
		union
	        select c2.cat_name, d2.dev_name, p2.title, p2.price, p2.platform, p2.keyword, p2.quantity from
	         categories@site_link6 c2, developers@site_link6 d2, products@site_link6 p2 Where
	          p2.cat_id = c2.cat_id and p2.dev_id = d2.dev_id and
	           (c2.cat_name like svalue or d2.dev_name like svalue or p2.title like svalue or p2.keyword like svalue);
	    return pro_cur;
END searchFuncGlobal;
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
sno number:=0;

BEGIN

			pro_cur := searchFuncGlobal('%&search_value%');

			loop
			sno := sno + 1;
			fetch pro_cur into Cat,Dev,Name,Taka,Platform,Key,Qty;
			exit when pro_cur%notfound;
				DBMS_OUTPUT.PUT_LINE('| SNo: '|| sno ||' | Category Name: '||TO_CHAR(Cat)||' | Developer Name: '||TO_CHAR(Dev)||' | Game Name: '||TO_CHAR(Name)||' | Price: '||TO_CHAR(Taka)||' | Platform: '||TO_CHAR(Platform)||' | Keyword: '||TO_CHAR(Key)||' | Quentity: '||TO_CHAR(Qty)||' | '||chr(13)||chr(10));
			end loop;
		
END;

/