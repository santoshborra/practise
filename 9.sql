
1. How to drop a parent table without dropping the child table.

             Create a table parent with primary key, and create child table with foreign key reference to parent table. Now try to drop the parent table.
 
       drop table parent;

       error: cannot drop parent table because other objects depents on it.             ----------------o/p
       DETAILS: Constrain child_column_fkey on table child depends on parent table.
 
      ---------> So, use cascade to drop the parent table

   drop table parent cascade;
     
   drop table------------o/p 


2. What is a database system identifier and how to find it.

     Desc: Each database server has a system identifier assigned when the database intialized(intidb).
     Use: When we are taking backup, cloned ,...etc internally postgres uses this identifier.
     How to find it: 'pg_controldata' using this command we will find it.

    Go to command location /opt/postgres/pg96/bin ---> Make sure command is there or not. If command is exists then follow this command. 
    Run this command as postgres user or another user with execute priviliges on the server software.

  ./pg_controldata /opt/postgres/data/pg96 | grep "system identifier"

  database system identifier:          6540654384139812647    ----------o/p



3. How to find the query execution duration time from log file.

         ---->check the parameter    log_mim_duration_statement; 
         -----> Default value will be  '-1' ,  so we need to change the default value to '0' then reload the conf.file. then run a aquery.
         -----> Here, '0' means--  0 milli seconds(ms), print all querys when query exicution duration should be min 0 milli seconds.
        ------>If we gave '5' insted of '0'.  It means query exicution duration should be min '5ms'. 
        ------> Go to log files and check the duration of the previous queries.

4. What is the difference between TRUNCATE and DELETE statement. (Google)

          TRUNCATE-->It means delete all rows from given table. Using truncate command we can't delete a sigle row. We con't rollback. Not require autovaccum to clear dead tuple.
          DELETE---> It means delete all rows from given table, and we can also delete a single row from the table,using where condition. We can rollback. It requires autovaccum to clear                                                                                                                                                                          dead tuple. 

5. Demonstrate the usage of TRANSACTION REPEATABLE READ and SERIALIZATION.
                REPEATABLE READ
          ----------------------------  
                  SESSION1                                                         SESSION2
                 ---------                                                       -----------                                                        
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN
SELECT * FROM test;
1     -------o/p                                                            UPDATE TEST SET t=10 WHERE t=1;
                                                                             updated     -----o/p

select * from test;
1   -------o/p 
                        
       SERIALIZATION
     ------------------

 BEGIN TRANSACTION ISOLATION LEVEL SERILIZATION;
BEGIN
SELECT * FROM test WHERE t=1 FOR UPDATE;
  t
 ----
  1   ---o/p
                                                                        BEGIN TRANSACTION ISOLATION LEVEL SERILIZATION;
                                                                        BEGIN
                                                                        SELECT * FROM test WHERE t=1 FOR UPDATE;
                                                                        ---waiting for 1st session commit, because in first session also we had taken 'for update' on same record.
update test set t=10 where t=1;
updated one row     ------o/p
                                                                         ---still waiting for 1st session commit
end;
commit     ----o/p
                                                                        ----once commited in 1st session then automatically we will get out put here like see in the next line
                                                                         COULD NOT SERILIZE ACCESS DUE TO CONCURRENT UPDATE                                         