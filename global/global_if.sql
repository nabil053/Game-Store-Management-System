/*Menu*/
set serveroutput on;
DECLARE
begin
	
	DBMS_OUTPUT.PUT_LINE('Select option from below:');
	DBMS_OUTPUT.PUT_LINE('1. View All Games');
	/*DBMS_OUTPUT.PUT_LINE('2. Search a specific Game.');*/
	DBMS_OUTPUT.PUT_LINE('2. View All Employees.');
	DBMS_OUTPUT.PUT_LINE('3. View All Sell Record.');
	DBMS_OUTPUT.PUT_LINE('4. View Branch Wise Total Sell Info.');


end;
/

SET SERVEROUTPUT ON;

accept value NUMBER prompt 'Enter(1-4):'

DECLARE
	/*view all*/
	input products.title%TYPE;
	pro_cur2   sys_refcursor;
	pro_cur   sys_refcursor;
	/*Id products.p_id%TYPE;*/ 
	Cat categories.cat_name%TYPE; 
	Dev developers.dev_name%TYPE; 
	Name products.title%TYPE; 
	Platform products.platform%TYPE; 
	Taka products.price%TYPE; 
	Key products.keyword%TYPE;
	Qty products.quantity%TYPE;


	/*view Employees*/
	eid employees.e_id%TYPE; 
	ename employees.e_name%TYPE; 
	eage employees.e_age%TYPE; 
	esalary employees.e_salary%TYPE; 
	ejoin_date employees.e_join_date%TYPE;  
	e_gender employees.e_gender%TYPE;

	/*view Selling Record*/
	i_id invoice.ivc_id%TYPE; 
	cus_name invoice.c_name%TYPE; 
	pro_id invoice.p_id%TYPE; 
	pro_qty invoice.p_quantity%TYPE; 
	total_price invoice.total_price%TYPE; 
	i_date invoice.ivc_date%TYPE;

	wrong_input EXCEPTION;
	v_msg VARCHAR2(100);
	sno number:=0;
BEGIN
		
	--DBMS_OUTPUT.PUT_LINE('| N | C | D | Title | Price | Keyword | Qty |'||chr(13)||chr(10));
	input := &value;

	IF input = 1 THEN
			pro_cur := global_all.ViewAll('Online Game Store Product List');
			loop
				sno := sno + 1;
			fetch pro_cur into Cat,Dev,Name,Taka,Platform,Key,Qty;
			exit when pro_cur%notfound;
				DBMS_OUTPUT.PUT_LINE('| SNo: '|| sno ||' | Category Name: '||TO_CHAR(Cat)||' | Developer Name: '||TO_CHAR(Dev)||' | Game Name: '||TO_CHAR(Name)||' | Price: '||TO_CHAR(Taka)||' | Platform: '||TO_CHAR(Platform)||' | Keyword: '||TO_CHAR(Key)||' | Quentity: '||TO_CHAR(Qty)||' | '||chr(13)||chr(10));
			end loop;
	/*ELSIF input = 2 THEN
		pro_cur2 := global_all.SearchFunc('%NFSMW%');

			loop
			sno := sno + 1;
			fetch pro_cur2 into Cat,Dev,Name,Taka,Platform,Key,Qty;
			exit when pro_cur2%notfound;
				DBMS_OUTPUT.PUT_LINE('| SNo: '|| sno ||' | Category Name: '||TO_CHAR(Cat)||' | Developer Name: '||TO_CHAR(Dev)||' | Game Name: '||TO_CHAR(Name)||' | Price: '||TO_CHAR(Taka)||' | Platform: '||TO_CHAR(Platform)||' | Keyword: '||TO_CHAR(Key)||' | Quentity: '||TO_CHAR(Qty)||' | '||chr(13)||chr(10));
			end loop;*/
	ELSIF input = 2 THEN
		pro_cur := global_all.ViewAllEmployees('Employees List:');
			loop
			sno := sno + 1;
			fetch pro_cur into ename,eage,esalary,ejoin_date,e_gender;
			exit when pro_cur%notfound;
				DBMS_OUTPUT.PUT_LINE('| Sno: '||sno||' | Employee Name: '||TO_CHAR(ename)||' | Age: '||TO_CHAR(eage)||' | Salary: '||TO_CHAR(esalary)||' | Join Date: '||TO_CHAR(ejoin_date)||' | Gender: '||TO_CHAR(e_gender)||' | '||chr(13)||chr(10));
			end loop;
			/*DBMS_OUTPUT.PUT_LINE('Select from below:');
			DBMS_OUTPUT.PUT_LINE('1. Insert new selling record');
			DBMS_OUTPUT.PUT_LINE('2. View selling record');
			DBMS_OUTPUT.PUT_LINE('3. Update a selling record.');
			DBMS_OUTPUT.PUT_LINE('4. Exit');*/
	ELSIF input = 3 THEN
		pro_cur := global_all.ViewAllSellRecord('Selling Record List:');
			loop
			sno := sno + 1;
			fetch pro_cur into cus_name,pro_id,pro_qty,total_price,i_date;
			exit when pro_cur%notfound;
				DBMS_OUTPUT.PUT_LINE('| SNo: '||sno||' | Customer Name: '||TO_CHAR(cus_name)||' |  Product Id: '||TO_CHAR(pro_id)||' | Quantity: '||TO_CHAR(pro_qty)||' | SubTotal: '||TO_CHAR(total_price)||' | Purchase Date: '||TO_CHAR(i_date)||' | '||chr(13)||chr(10));
			end loop;
	ELSIF input = 4 THEN
		global_all.ViewBranchWiseTotalSellInfo('Todays Total Selling: ');
	--ELSIF input = 5 THEN
		/*site1_all.insertANewSellingRecord('Inserting Selling Record:');*/
			
	ELSE 
		RAISE wrong_input;	
	END IF;


EXCEPTION
	WHEN no_data_found THEN
		 DBMS_OUTPUT.PUT_LINE(CHR(10) ||'No Record Available!!!');
	WHEN wrong_input THEN
		DBMS_OUTPUT.PUT_LINE(CHR(10) ||'You have selected a wrong option.!!!');
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Error!!!');

END;
/

