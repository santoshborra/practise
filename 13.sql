 1. Write shell script which connects to PostgreSQL without a password
-----------------------------------------------------------------------

         #!/bin/sh
         
         export PGUSER='username'
         export PGPASSWORD='password'------------------------> these are environment variables 
         export PGDATABASE='databasename'
         export PGPORT='5432'
         psql-------------------------->command
           
 
 2. Write shell script which connects to PG which prints the PostgreSQL version
-------------------------------------------------------------------------------
         #!/bin/sh
         psql -c "select version();"
 
 3. Write shell script which connects to PG and create a table "test" if it is not exists
-----------------------------------------------------------------------------------------
         #!/bin/sh
         if[`psql -Atc "select conut(*) from information_schema.tables where table_name='test';"` -ne "1"]; then
           psql -c "create table test(t int);"
         else
             echo  'table test exists'
         fi
        
 
 4. Write shell script which displays the number of connection from pg_stat_activitiy view
-------------------------------------------------------------------------------------------
       #!/bin/sh
       psql -c "select count(*) from pg_stat_activity;"
 
 5. Write shell script which prints the "test" table output to /tmp/test.txt
-----------------------------------------------------------------------------

       #!/bin/sh

       psql -c "select * from test" >> /home/postgres/santosh/test.txt------>path of the file