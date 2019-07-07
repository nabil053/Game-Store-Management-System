-- Product Details Update:Trigger
create or replace trigger update_quantity
before delete or insert or update on invoice
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
/

set serveroutput on;
DECLARE
begin
	
	DBMS_OUTPUT.PUT_LINE('Insert a new invoice record:');

end;
/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE insert_a_new_invoice_record
(id invoice.ivc_id%type, name  invoice.c_name%type,  product_id  invoice.p_id%type,  product_qty invoice.p_quantity%type,  
	total_price  invoice.total_price%type, invoice_date invoice.ivc_date%type)
IS
BEGIN
			
		INSERT INTO invoice
			VALUES(id,name,product_id,product_qty,total_price,invoice_date);
		
END;

/


SET SERVEROUTPUT ON;
DECLARE 
BEGIN

	insert_a_new_invoice_record(&id,'&name',&product_id,&product_quantity,&total_price,trunc(sysdate));
		
END;

/