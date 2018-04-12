        1. Demonstrate the usage of GROUP BY with UNION            =============> select column's from tablename1 union select columns from tablename2 group by column;
  
	2. Demonstrate the usage of HAVING CLAUSE                    ============>  use in aggregade functions
  
	3. Demonstrate the difference between GROUP BY AND DISTINCT.    ========>  in distinct we can't use functions like max, avg, sum..
  
	 SELECT t FROM newtest GROUP BY t;
	 vs
	 SELECT DISTINCT t FROM newtest;

	4. Display only even numbers from the below table.  ==========>>>    select * from student where mod(sid,2)=0
  
			table_num
			---------
			5
			2
			4
			6
			10
	5. Display the second maximum(6) number from the above table.
            
              ===> select * from tablenamee inn where 2= (select count(*) from tablename out where inn<=out);

        6. How to find only duplicate rows from a table.
           
              ===> select * from test inn where 2= (select count(*) from test out where inn.t=out.t);  
   t
---------
   1
   2
   3
   4           ============>>> example table is test
   5
   6
   7
   8
   9
   1