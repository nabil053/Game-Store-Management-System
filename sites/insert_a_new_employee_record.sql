set serveroutput on;
DECLARE
begin
	
	DBMS_OUTPUT.PUT_LINE('Insert a New Employee Info:');

end;
/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE insert_a_new_employees_record
(id employees.e_id%type, name  employees.e_name%type, age employees.e_age%type,  salary employees.e_salary%type,  
	join_date employees.e_join_date%type, gender employees.e_gender%type)
IS
BEGIN
			
		INSERT INTO employees
			VALUES(id,name,age,salary,join_date,gender);
		
END;

/


SET SERVEROUTPUT ON;
DECLARE 
BEGIN

	insert_a_new_employees_record(&id,'&name',&age,&salary,trunc(sysdate),'&gender');
		
END;

/