SET SERVEROUTPUT ON;
DECLARE 

Id products.p_id%TYPE; 
Cat CATEGORIES.cat_name%TYPE;
Dev DEVELOPERS.dev_name%TYPE;
Name products.title%TYPE; 
Platform products.platform%TYPE; 
Taka products.price%TYPE; 
Key products.keyword%TYPE;
Qty products.quantity%TYPE;

error_raise EXCEPTION;
input number := 1;

cursor pro_frag1 is select p_id, cat_name, title, price, platform from pro2 where cat_name = 'RPG';
cursor pro_frag2 is select p.p_id, c.cat_name, p.title, p.price, p.platform from products p, categories c where p.cat_id = c.cat_id and cat_name = 'RPG' and price >250;

BEGIN
	DBMS_OUTPUT.PUT_LINE('the algebra of qualified relations: ');
	DBMS_OUTPUT.PUT_LINE('SLf[R:qR]');
	OPEN pro_frag1;
		LOOP
			FETCH pro_frag1 into Id, Cat,Name,Taka,Platform;
			exit when pro_frag1%notfound;
			DBMS_OUTPUT.PUT_LINE('| SNo: '|| Id ||' | Category Name: '||TO_CHAR(Cat)||' | Game Name: '||TO_CHAR(Name)||' | Price: '||TO_CHAR(Taka)||' | Platform: '||TO_CHAR(Platform)||' | '||chr(13)||chr(10));
		END LOOP;
	CLOSE pro_frag1;

	DBMS_OUTPUT.PUT_LINE('[SLfR:qR and F]');
	OPEN pro_frag2;
		LOOP
			FETCH pro_frag2 into Id, Cat,Name,Taka,Platform;
			exit when pro_frag2%notfound;
			DBMS_OUTPUT.PUT_LINE('| SNo: '|| Id ||' | Category Name: '||TO_CHAR(Cat)||' | Game Name: '||TO_CHAR(Name)||' | Price: '||TO_CHAR(Taka)||' | Platform: '||TO_CHAR(Platform)||' | '||chr(13)||chr(10));
		END LOOP;
	CLOSE pro_frag2;

	EXCEPTION
	 When error_raise THEN
	 	DBMS_OUTPUT.PUT_LINE('Invalid Input:');
		
END;

/