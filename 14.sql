 1. Define the difference between kill commannd signal TERM and SIGKILL (Google)
--------------------------------------------------------------------------------

      Kill -TERM :  When we are uses this command it will kill a process, when that process does't have any child process. If this process have any child process it will                       wait to kill that process untill child process to complete.

      kill -9 (sigkill) : It will kills the process immediatly. It won't wait for child process.



 2. Define the usage of .bash_profile(CentOS) OR .profile(Ubuntu)
-------------------------------------------------------------------

      If you want to export the environment variable for all sessions, put those environment variable in ".bash_profile" file.
        
 
 3. Demonstrate the usage of CHECK constraint
----------------------------------------------

    The CHECK Constraint enables a condition to check the value being entered into a record. If the condition evaluates to false, the record violates the constraint and         isn't entered the table.

    EXAMPLE
    -------

      CREATE TABLE tablename(t int, age int CHECK ( age > 18 ) );
      
     postgres=# insert into santu values (1, 18);
                ERROR:  new row for relation "santu" violates check constraint "santu_age_check"
                DETAIL:  Failing row contains (1, 18).
      
 
 4. Write a SQL query which prints the second "i" position from the string "India"
-----------------------------------------------------------------------------------

     
     postgres=# select substring('india', 4, 1);
                substring
               -----------
                   i
                (1 row)

    

 
 5. Write a SQL query which replace the character 'c' with 'C' in the string 'chuck'
-----------------------------------------------------------------------------------

   select replace('chuck', 'c', 'C');
   
   ChuCk ----------->o/p