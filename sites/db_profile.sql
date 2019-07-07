SET SERVEROUTPUT ON size 10000;
DECLARE 

cardinality number;
type namesarray IS VARRAY(9) OF VARCHAR2(100);
columnName namesarray;
columnSize integer;
total integer;
distinctValue1 integer;
distinctValue2 integer;
distinctValue3 integer;
distinctValue4 integer;
distinctValue5 integer;
distinctValue6 integer;
distinctValue7 integer;
distinctValue8 integer;
totalSize integer := 0;
BEGIN
	columnName := namesarray('p_id','cat_id','dev_id','email','title','price','platform','keyword','quantity');
	total := columnName.count;

	DBMS_OUTPUT.PUT_LINE('Estimate profiles of results of algebraic operation: ');

	select count(*) into cardinality from products;
	 DBMS_OUTPUT.PUT_LINE('Cardinality of products: ' || cardinality);

	 
	 dbms_output.put_line('Distinct no of row in attribute: '||chr(13)||chr(10));
	  SELECT count(DISTINCT p_id) into distinctValue1 from products;
	  SELECT count(DISTINCT cat_id) into distinctValue2 from products;
	  SELECT count(DISTINCT dev_id) into distinctValue3 from products;
	  SELECT count(DISTINCT title) into distinctValue4 from products;
	  SELECT count(DISTINCT price) into distinctValue5 from products;
	  SELECT count(DISTINCT platform) into distinctValue6 from products;
	  SELECT count(DISTINCT keyword) into distinctValue7 from products;
	  SELECT count(DISTINCT quantity) into distinctValue8 from products;

      dbms_output.put_line('Pid Distinct Value: ' || distinctValue1);
      dbms_output.put_line('cat_id Distinct Value: ' || distinctValue2);
      dbms_output.put_line('dev_id Distinct Value: ' || distinctValue3);
      dbms_output.put_line('title Distinct Value: ' || distinctValue4);
      dbms_output.put_line('price Distinct Value: ' || distinctValue5);
      dbms_output.put_line('platform Distinct Value: ' || distinctValue6);
      dbms_output.put_line('keyword Distinct Value: ' || distinctValue7);
      dbms_output.put_line('quantity Distinct Value: ' || distinctValue8);
	
	
    dbms_output.put_line('Max Size of row for every attribute: '||chr(13)||chr(10));  
	FOR i in 1 .. total 
	LOOP
	  SELECT max(lengthb(columnName(i))) into columnSize from products;
	  
	  totalSize := totalSize + columnSize;
	  
      dbms_output.put_line(columnName(i)|| ' = ' || columnSize); 
    END LOOP; 

    dbms_output.put_line('Sum of size of all attribute: ' || totalSize); 

END;

/