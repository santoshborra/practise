 1. Demonstrate installing PostgreSQL with source code compilation
---------------------------------------------------------------------
 
 source code installation steps:
-------------------------------


     mkdir postgresql
     cd postgresql
     wget copylink  ---> How to get the link-->go to postgresql.org-->downloads-->source---->select latest version-->copy the file link, file should be end with  .tar.gz                                 
     ----->It should be a zip file, so unzip the file
        
     tar -xzvf filename
     
     prerequisites:
   ---------------
     READLINE-----> it is a library which can be helpful to edit the commands at runtime.
     BISON-------->postgresql syntax compilation.
     FLEX--------->same as bison
     GCC---------->It is a c-code linux compiler
 
     yum install readline*
     yum install bison*
     yum install flex*
     yum install gcc*

     mkdir postgresqlinstall

     ./configure --prefix=/home/santosh/postgres/postgresqlinstall--------->go to the configure location path then run this command. 

     make

     make install

     ./initdb -D /home/santosh/postgres/data---------> It will create all the database files and directory structures.--->go to the initdb file path then run this command.  
     



 2. How to run a SQL query from psql without login to the server
----------------------------------------------------------------


      psql -c "sql query;"




 
 3. Demonstrate the usage of (\watch meta command) in psql (Google) 
--------------------------------------------------------------------

    Desc: Using this meta command we can run the previous query repeatedly

   \watch 5----------> It means run the previous query every 5 seconds.




 
 
 4. Write a sql query to display all user tables along with's schema names
--------------------------------------------------------------------------

      select * from information_schema.tables where table_schema='public';



 
 5. Describe the usage of search_path, and demonstrate how we need to set a perticular schema name as default search_path to a database.
----------------------------------------------------------------------------------------------------------------------------------------

          Desc: By using search_path parameter we can set the default schema to a user or database.

          ----->following these sql query we can set the default search_path.

          alter database databasename set search_path to 'schemaname';------------>for database
    
          alter user username set search_path to 'schemaname';----------------->for a user    

    

 
 6. How to log only DDL(CREATE, ALTER, DROP, TRUNCATE) statements in log file (Google).
---------------------------------------------------------------------------------------


         Before we are going to solve this query, we need to know about two parameters, because this query is depends on those two parameters.

        1. log_min_duration_statement, this parameter should be in off(-1).

        2. log_statement ----> In this parameter we have 4 values, those are none(off),ddl,mod,all (all statements).
                               Here 'ddl' means log all data definition statements. i.e CREATE, ALTER and DROP statements.
                               Here 'mod' means log all ddl statements, plus data-modifying statements such as UPDATE, TRUNCATE, DELETE and INSERT statements.and COPY                                FROM. PREPARE, EXECUTE, and EXPLAIN ANALYZE statements are also logged.

       As per our requirement we should need to change those two parameters

       log_min_duration_statement= '-1' --------> it means off
    
       log_statement='mod'---------------> it means log these statements, ddl and data-modifying statements.
 