CREATE OR REPLACE PACKAGE BODY site1_all AS 
	-- View All Products:
	 function ViewAll(msg in products.title%type)
		return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin

		DBMS_OUTPUT.PUT_LINE(msg);
		DBMS_OUTPUT.PUT_LINE('| ID | CAT | DEV | Title | Price | Keyword | Qty |'||chr(13)||chr(10));
		open pro_cur
	    for select p.p_id, c.cat_name, d.dev_name, p.title, p.price,p.platform,p.keyword, p.quantity from categories c, developers d, products p Where p.cat_id = c.cat_id and p.dev_id = d.dev_id;
	    return pro_cur;
	end ViewAll; 

	/*-- View All Products using search:
	function searchFunc(svalue in products.title%type)
		return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin 
		DBMS_OUTPUT.PUT_LINE('| ID | CAT | DEV | Title | Price | Keyword | Qty |'||chr(13)||chr(10));
		open pro_cur
	    for select p.p_id, c.cat_name, d.dev_name, p.title, p.price,p.platform, p.keyword, p.quantity from categories c, developers d, products p Where p.cat_id = c.cat_id and p.dev_id = d.dev_id and (p.title LIKE svalue or c.cat_name LIKE svalue or d.dev_name LIKE svalue);
	    return pro_cur;
	end searchFunc; */

	-- View All Employees:
	 function ViewAllEmployees(msg in employees.e_name%type)
  	 return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin
		
		DBMS_OUTPUT.PUT_LINE(msg);
		DBMS_OUTPUT.PUT_LINE('| ID | Name | AGE | SALARY | J_DATE | GENDER|'||chr(13)||chr(10));
		open pro_cur
	    for select * from employees;
	    return pro_cur;
	end ViewAllEmployees; 

	 -- View All Sell Record:
   	function ViewAllSellRecord(msg in invoice.c_name%type)
   	return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin
	DBMS_OUTPUT.PUT_LINE(msg);
	DBMS_OUTPUT.PUT_LINE('| ID | CName | ProID | ProQty | Price | Date|'||chr(13)||chr(10));
		
		open pro_cur
	    for select * from invoice;
	    return pro_cur;
	end ViewAllSellRecord; 

	 -- View All Sell Record:
   	 PROCEDURE ViewBranchWiseTotalSellInfo(msg in invoice.c_name%type)
   		is
   	pqty invoice.p_quantity%TYPE;
   	pprice invoice.total_price%TYPE;
	begin
	DBMS_OUTPUT.PUT_LINE(msg);
	select sum(p_quantity),sum(total_price) into pqty, pprice from invoice where ivc_date <= trunc(sysdate);
	DBMS_OUTPUT.PUT_LINE('Quantity: '||pqty||' pcs.');
	DBMS_OUTPUT.PUT_LINE('Amount: '||pprice||' tk.');
	end ViewBranchWiseTotalSellInfo; 


END site1_all; 
/