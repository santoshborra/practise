
1. How to drop a parent table without dropping the child table.

2. What is a database system identifier and how to find it.

3. How to find the query execution duration time from log file.

4. What is the difference between TRUNCATE and DELETE statement. (Google)

          TRUNCATE-->It means delete all rows from given table. Using truncate command we can't delete a sigle row.
          DELETE---> It means delete all rows from given table, and we can also delete a single row from the table,using where condition. 

5. Demonstrate the usage of TRANSACTION REPEATABLE READ and SERIALIZATION.
          TRANSACTION REPEATABLE READ
          ----------------------------  
                  SESSION1                                                         SESSION2
                 ---------                                                       -----------                                                        
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN
SELECT * FROM test;
1                                                                            UPDATE TEST SET t=10 WHERE t=1;
                                                                             updated

select * from test;
1 
                        
       SERIALIZATION
     ------------------

 BEGIN TRANSACTION ISOLATION LEVEL SERILIZATION;
BEGIN
SELECT * FROM test WHERE t=1 FOR UPDATE;
  t
 ----
  1
                                                                        BEGIN TRANSACTION ISOLATION LEVEL SERILIZATION;
                                                                        BEGIN
                                                                        SELECT * FROM test WHERE t=1 FOR UPDATE;
                                                                        ---waiting for 1st session commit, because in first session also we had taken 'for update' on same record.
update test set t=10 where t=1;
updated one row
                                                                         ---still waiting for 1st session commit
end;
commit
                                                                        ----once commited in 1st session then automatically we will get out put here like see in the next line
                                                                         COULD NOT SERILIZE ACCESS DUE TO CONCURRENT UPDATE                                         