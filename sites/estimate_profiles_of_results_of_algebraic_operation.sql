SET SERVEROUTPUT ON;
DECLARE 

cardinality number;
type namesarray IS VARRAY(6) OF VARCHAR2(100);
columnName namesarray;
columnSize integer;
total := columnName.count;
distinctValue1 integer :=0;
distinctValue2 integer :=0;
distinctValue3 integer :=0;
distinctValue4 integer :=0;
distinctValue5 integer :=0;
distinctValue6 integer :=0;
distinctValue7 integer :=0;
distinctValue8 integer :=0;
totalSize integer := 0;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Estimate profiles of results of algebraic operation: ');

	select count(*) into cardinality from products;
	 DBMS_OUTPUT.PUT_LINE('Cardinality of products: ' || cardinality);
	 
	 dbms_output.put_line('Distinct no of row in attribute');

	  SELECT count(DISTINCT p_id) into distinctValue1 from products;
	  SELECT count(DISTINCT cat_id) into distinctValue2 from products;
	  SELECT count(DISTINCT dev_id) into distinctValue3 from products;
	  SELECT count(DISTINCT title) into distinctValue4 from products;
	  SELECT count(DISTINCT price) into distinctValue5 from products;
	  SELECT count(DISTINCT platform) into distinctValue6 from products;
	  SELECT count(DISTINCT keyword) into distinctValue7 from products;
	  SELECT count(DISTINCT quantity) into distinctValue8 from products;

      dbms_output.put_line('Pid Distinct Value' || distinctValue1);
      dbms_output.put_line('Pid Distinct Value' || distinctValue1);
	
	columnName := namesarray('p_id','cat_id','dev_id','email','title','price','platform','keyword','quantity');

	FOR i in 1 .. total 
	LOOP
	  SELECT max(lengthb(columnName(i))) into columnSize from products;
	  
	  totalSize := totalSize + columnSize;
      dbms_output.put_line(columnName(i)|| ' = ' || columnSize); 
    END LOOP; 

    dbms_output.put_line('SUM OF SIZE (ALL ATTRIBUTES) : ' || totalSize); 
	
	EXCEPTION
	 When error_raise THEN
	 	DBMS_OUTPUT.PUT_LINE('Invalid Input:');
END;
/