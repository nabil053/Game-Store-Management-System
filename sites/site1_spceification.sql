CREATE OR REPLACE PACKAGE site1_all AS 
   -- View Products 
   function ViewAll(msg in products.title%type)
   return sys_refcursor;
   
   -- View Prodcuts using search 
   /*function searchFunc(svalue in products.title%type)
   return sys_refcursor;*/

   -- View All Employees:
   function ViewAllEmployees(msg in employees.e_name%type)
   return sys_refcursor;

   -- View All Sell Record:
   function ViewAllSellRecord(msg in invoice.c_name%type)
   return sys_refcursor;

   PROCEDURE ViewBranchWiseTotalSellInfo(msg in invoice.c_name%type);
  
END site1_all; 
/