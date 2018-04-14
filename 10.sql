1. Create a database user with some password and try to change password it later.


        create user username with password 'password';-------------> create as a superuser.

    How to change password:
  -------------------------
          alter user username with password 'newpassword';---------> alter as same user or superuser.

2. Convert existing normal user to super user (Google)

           alter user username superuser;  ----------> alter as a superuser.

3. How to find the postgresql uptime

       Postgres stores the server start time, So we can access it directly, as follows

   select pg_postmaster_start_time();

              pg_postmaster_start_time
        ----------------------------------        --------->o/p
          2018-04-14 12:27:24.413435+05:30
  
   In simple or another format:
 
   select current_timestamp - pg_postmaster_start_time() as uptime;

              uptime
        -----------------   -----------> o/p
         04:39:26.666193

4. Demonstrate the usage of 'include' in postgresql.conf by giving
	1. work_mem, shared_buffers and temp_buffers into memory.conf
	2. max_connections, port and listen_addresses into conn.conf

    Usage of include: It will organize the parameter settings, what  parameter values we need change from default values  to manual values.

   How:  Go to postgresql.conf then remove the '#' before to include='memory.conf'  then save the postgresql.conf
         
         Create a configure file with name what we had given  in  include, that is (memory.conf). Here 'momory' is give any name that's our wish but, after that we should give continusion             with '.conf'
      
         '.conf'  is mandatory. because it indicates that file is a configuration file, which are created before. Make sure we should create those file data directory location only.


          1. work_mem, shared_buffers and temp_buffers into memory.conf:
  -------------------------------------------------------------------------

                   vim memory.conf----------------------> from data dir location only

                 work_mem=30MB
                 shared_buffers=150MB  ------------------> insert parameters with our required values
                 temp_buffers=70MB


  Then, restart the server.

          2. max_connections, port and listen_addresses into conn.conf :
  -------------------------------------------------------------------------


   include='conn.conf'  -----------> insert  in postgresql.conf  at bottom of the file.

  vim conn.conf-------------->  from data dir location only

    max_connections=300
    port=8888                     ----------->insert parameters with our required values 
    listen_address='198.123.70.1'
 
Then restart the server.
  
------->  Now check the given parameter values are overwrite or not.


 
5. Define the parameter affect hirerachy levels.
 

    Parameter affect hirerachy possible in 5 ways, those are given bellow 


     1.  User assigned
     2.  Database assigned
     3.  User and databse assigned
     4.  Postgresql.auto.conf-----------------> These parameter values are set by  'alter system set parameter_name=value'
     5.  postgresql.conf----------------------> Default







