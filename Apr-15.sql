 1. Describe each character meaning in SELECT current_timestamp.
----------------------------------------------------------------
         postgres=# select current_timestamp;
                        now
           ----------------------------------
           2018-04-15 17:01:25.682969+05:30
GMT UK
UTC UK

      Times are expressed in UTC (Coordinated Universel Time) format.

    Here, yy-mm-dd hh:mm:ss.s+ahead of UTC
    
    +05:30  or -04:00   (+hh:mm or -hh:mm)
   
    Here, + means ahead of UTC
          - means behind of UTC
   


 2. Demonstrate the temporary file generation
-----------------------------------------------
     What is temporary file: If we ran a sql sort query to sort the data, it will uses some memory from 'work_mem' or 'disk' depends on the output data. If                                              this query uses memory from work_mem temparory file will not create internally. If that query uses disk, then temporary file will be                                        created internally, after fetched data that temp file will be deleted automatically. We can check weather the temp file is created or not.

     How to check: First we need to check the "log_temp_files" parameter is enabled or not. If it's not enable, now enable it.

     show log_temp_files;

         0------------>o/p
      Now it will write into logfile. If you want to check that file was created or not, first run that query then go to log_files and then check pg_log file. 


      In log_file:
    --------------
             
2018-04-15 19:08:03 IST [16796]: [29-1] user=postgres,db=postgres,app=psql,client=[local] LOG:  temporary file: path "base/pgsql_tmp/pgsql_tmp16796.1", size 1400832
2018-04-15 19:08:03 IST [16796]: [30-1] user=postgres,db=postgres,app=psql,client=[local] STATEMENT:  explain analyze select * from temp order by t desc;
2018-04-15 19:08:03 IST [16796]: [31-1] user=postgres,db=postgres,app=psql,client=[local] LOG:  duration: 60.943 ms  statement: explain analyze select * from temp order by t desc;


 
 3. How to kill a postgres process manually (Google)
----------------------------------------------------

          	Kill desc: Using this command we can kill a process which are running in background by using it's process id.
 
       How to get pid's:

                ps -a  ----------> this command will displays all running process and their pid's

              For example run this command in background 
 
           sleep 200 &-------------> Here '&' it means run given command in background.
 
             Now, we need to kill that process get that process id using it 'ps -a'.

           [postgres@localhost pg96]$ ps -a
                         PID TTY          TIME CMD
                       20076 pts/2    00:00:00 man
                       20088 pts/2    00:00:00 less
                       20303 pts/0    00:00:00 sleep
                       20323 pts/0    00:00:00 ps

        How to kill
       -------------

             kill 20303----------->Here '20303' is pid of sleep command.---->soft kill
             or
             kill -9 20303----------->force kill

       How to kill postgre process
     -----------------------------

      select pg_sleep(200);

          Then go to the another session and get the pid, which one we are going to kill.

  
           postgres=# select pid,query from pg_stat_activity ;------------> select query to get the pid's
                      pid  |                  query
                    -------+------------------------------------------        .........>  o/p
                     14771 | select pg_sleep(100);
                     14808 | select pid,query from pg_stat_activity ;
       

     Then go to os terminal and run the kill command with pid.

      [postgres@localhost ~]$ kill  14771--------------------->soft kill 

      [postgres@localhost ~]$ kill -9 14771------------------->force kill----------->Don't use this option '-9' in production, because server will be shutdown.

 4. Demonstrate the password less access between two machines (ssh)
------------------------------------------------------------------





 5. Demonstrate the usage of scp and rsync
------------------------------------------

