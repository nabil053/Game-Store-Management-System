CREATE OR REPLACE PACKAGE BODY global_all AS 
	-- View All Products:
	 function ViewAll(msg in products.title%type)
		return sys_refcursor
	  is
	  pro_cur   sys_refcursor; 

	begin
		DBMS_OUTPUT.PUT_LINE(chr(13)||chr(10)||msg||chr(13)||chr(10));
		open pro_cur
	    for select c1.cat_name, d1.dev_name, p1.title, p1.price, p1.platform, p1.keyword, p1.quantity from categories@site_link5 c1, developers@site_link5 d1, products@site_link5 p1 Where p1.cat_id = c1.cat_id and p1.dev_id = d1.dev_id
	     union
	        select c2.cat_name, d2.dev_name, p2.title, p2.price, p2.platform, p2.keyword, p2.quantity from categories@site_link6 c2, developers@site_link6 d2, products@site_link6 p2 Where p2.cat_id = c2.cat_id and p2.dev_id = d2.dev_id;
	    return pro_cur;
	end ViewAll; 

	/*-- View All Products using search:
	function searchFunc(svalue in products.title%type)
		return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin 
		DBMS_OUTPUT.PUT_LINE(' Online Game Store Product List '||chr(13)||chr(10));
		open pro_cur
	    for select c1.cat_name, d1.dev_name, p1.title, p1.price, p1.platform, p1.keyword, p1.quantity from categories@site_link5 c1, developers@site_link5 d1, products@site_link5 p1 Where p1.cat_id = c1.cat_id and p1.dev_id = d1.dev_id and (c1.cat_name like svalue or d1.dev_name like svalue or p1.title like svalue)
	     union
	        select c2.cat_name, d2.dev_name, p2.title, p2.price, p2.platform, p2.keyword, p2.quantity from categories@site_link6 c2, developers@site_link6 d2, products@site_link6 p2 Where p2.cat_id = c2.cat_id and p2.dev_id = d2.dev_id and (c2.cat_name like svalue or d2.dev_name like svalue or p2.title like svalue);
	    return pro_cur;
	end searchFunc; */

	-- View All Employees:
	 function ViewAllEmployees(msg in employees.e_name%type)
  	 return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin
		
		DBMS_OUTPUT.PUT_LINE(msg);
		open pro_cur
	    for select e1.e_name, e1.e_age, e1.e_salary, e1.e_join_date, e1.e_gender from employees@site_link5 e1 
	    union
	    select e2.e_name, e2.e_age, e2.e_salary, e2.e_join_date, e2.e_gender from employees@site_link6 e2;
	    return pro_cur;
	end ViewAllEmployees; 

	 -- View All Sell Record:
   	function ViewAllSellRecord(msg in invoice.c_name%type)
   	return sys_refcursor
	  is
	  pro_cur sys_refcursor; 

	begin
	DBMS_OUTPUT.PUT_LINE(msg);
		
		open pro_cur
	    for select i1.c_name, i1.p_id, i1.p_quantity, i1.total_price, i1.ivc_date from invoice@site_link5 i1
	    union
	    select i2.c_name, i2.p_id, i2.p_quantity, i2.total_price, i2.ivc_date from invoice@site_link6 i2;
	    return pro_cur;
	end ViewAllSellRecord;

	-- View All Sell Record:
   	 PROCEDURE ViewBranchWiseTotalSellInfo(msg in invoice.c_name%type)
   		is
   	pqty1 invoice.p_quantity%TYPE;
   	pprice1 invoice.total_price%TYPE;
   	pqty2 invoice.p_quantity%TYPE;
   	pprice2 invoice.total_price%TYPE;
	begin
	DBMS_OUTPUT.PUT_LINE(msg);
	select sum(i1.p_quantity),sum(i1.total_price) into pqty1, pprice1 from invoice@site_link5 i1 where i1.ivc_date >= trunc(sysdate);
	select sum(i2.p_quantity),sum(i2.total_price) into pqty2, pprice2 from invoice@site_link6 i2 where i2.ivc_date >= trunc(sysdate);
	

	DBMS_OUTPUT.PUT_LINE(chr(13)||chr(10)||'	Branch 1 Data:		Branch 2 Data:'||chr(13)||chr(10));
	DBMS_OUTPUT.PUT_LINE('Total Quantity: '||pqty1||' pcs.		'||pqty2||' pcs.');
	DBMS_OUTPUT.PUT_LINE('Total Amount: '||pprice1||' tk.		'||pprice2||' tk.');

	IF pprice1 > pprice2 THEN
		DBMS_OUTPUT.PUT_LINE(chr(13)||chr(10)||'Branch1 got more profit today');
	ELSE
		DBMS_OUTPUT.PUT_LINE(chr(13)||chr(10)||'Branch2 got more profit today');
	END IF;
	end ViewBranchWiseTotalSellInfo;  

  	/*
	PROCEDURE insertANewSellingRecord(msg in invoice.c_name%type)
	is
   begin 
  
   		DBMS_OUTPUT.PUT_LINE(msg);
      insert into invoice (ivc_id, c_name, p_id, p_quantity, total_price, ivc_date) values(5, 'Rs Esrat', 7, 2, 200, TO_DATE('2019/04/18 11:02:44', 'yyyy/mm/dd hh24:mi:ss'));
   end insertANewSellingRecord;*/

END global_all; 
/

/*-- Product Details Update:Trigger
create or replace trigger update_quantity
after delete or insert or update on invoice
for each row
when (NEW.ivc_id>0)
DECLARE 
   diff number;
   old_qty invoice.p_quantity%type;
begin
  select quantity into old_qty from products where p_id = :NEW.p_id;

  diff := old_qty  - :NEW.p_quantity; 
  DBMS_OUTPUT.PUT_LINE('Product details updated');
  update products set quantity = diff where p_id = :NEW.p_id;

end;
/*/