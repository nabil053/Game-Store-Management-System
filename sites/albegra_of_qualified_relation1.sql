SET SERVEROUTPUT ON;
DECLARE 

Eid employees.e_id%TYPE; 
Ename employees.e_name%TYPE;
Age employees.e_age%TYPE;
Salary employees.e_salary%TYPE; 
JoinDate employees.e_join_date%TYPE; 
Gender employees.e_gender%TYPE; 

error_raise EXCEPTION;
input number := 1;

cursor emp_frag1 is select e_id, e_name, e_age, e_salary, e_join_date, e_gender from emp_2 where e_age >20;
cursor emp_frag2 is select e_id, e_name, e_age, e_salary, e_join_date, e_gender from employees where e_salary>3000  and e_Age >20;

BEGIN
	DBMS_OUTPUT.PUT_LINE('1.the algebra of qualified relations: ');
	DBMS_OUTPUT.PUT_LINE('SLf[R:qR]');
	OPEN emp_frag1;
		LOOP
			FETCH emp_frag1 into Eid,Ename,Age,Salary,JoinDate,Gender;
			exit when emp_frag1%notfound;
			DBMS_OUTPUT.PUT_LINE('| Id: '|| TO_CHAR(Eid) ||' | Name: '||TO_CHAR(Ename)||' | Age: '||TO_CHAR(Age)||' | Salary: '||TO_CHAR(Salary)||' | Join Date: '||TO_CHAR(JoinDate)||' | Gender: '||TO_CHAR(Gender)||' | '||chr(13)||chr(10));
		END LOOP;
	CLOSE emp_frag1;

	DBMS_OUTPUT.PUT_LINE('[SLfR:qR and F]');
	OPEN emp_frag2;
		LOOP
			FETCH emp_frag2 into Eid,Ename,Age,Salary,JoinDate,Gender;
			exit when emp_frag2%notfound;
			DBMS_OUTPUT.PUT_LINE('| Id: '|| TO_CHAR(Eid) ||' | Name: '||TO_CHAR(Ename)||' | Age: '||TO_CHAR(Age)||' | Salary: '||TO_CHAR(Salary)||' | Join Date: '||TO_CHAR(JoinDate)||' | Gender: '||TO_CHAR(Gender)||' | '||chr(13)||chr(10));
		END LOOP;
	CLOSE emp_frag2;

	EXCEPTION
	 When error_raise THEN
	 	DBMS_OUTPUT.PUT_LINE('Invalid Input:');
		
END;

/