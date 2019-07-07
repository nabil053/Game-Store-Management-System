set serveroutput on;
DECLARE
begin
	
	DBMS_OUTPUT.PUT_LINE('Insert a New Product Info:');

end;
/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE insert_a_products
(id1 products.p_id%type, cat1  products.cat_id%type, dev1 products.dev_id%type,  title1 products.title%type,  
	price1 products.price%type, platform1 products.platform%type, keyword1 products.keyword%type, quantity1 products.quantity%type)
IS
BEGIN
		IF platform1 = 'PC' THEN	
			INSERT INTO products@site_link5
			VALUES(id1,cat1,dev1,title1,price1,platform1,keyword1,quantity1);
		ELSE
			INSERT INTO products@site_link6
			VALUES(id1,cat1,dev1,title1,price1,platform1,keyword1,quantity1);

		END IF;

END;

/


SET SERVEROUTPUT ON;
DECLARE 
BEGIN

	
		insert_a_products(15,1,4,'KOF',250,'PC','adventure',15);

		commit;
END;

/