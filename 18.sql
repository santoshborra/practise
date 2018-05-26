1. Demonstrate the tps of pgbench using different pool modes
-------------------------------------------------------------



2. Demonstrate the usage of default_pool_size with multiple username/dbname pairs
---------------------------------------------------------------------------------

         Here, default_pool_size is a parameter in pgbouncer usig this we can give max output connections to postgresdb.

     If this parameter set like  "defalult_pool_size = 20"  it means only 20 connections will allow from pgbouncer to postgresdb at a time. if we will get more than 20          connections to pgbouncer, it will hold those excess connections untill they logout from the previous connections from postgresdb. For example they logout 5  sessions         from postgresdb then immediately pgbouncer will send 5 new connections to pgdb, which are hold in pgbouncer.
NOTE:
----

   The above process is for each user/daname pair.

examples:   I have user/dbname pairs (santosh/postgres, postgres/postgres)
---------

How it works:
------------

     pgbench -c 30 -C -T 30 -p 6432 -h 127.0.0.1 -U santosh -d postgres
     pgbench -c 30 -C -T 30 -p 6432 -h 127.0.0.1 -U postgres -d postgres          ------> issue both queires at the same time, we will get the connections status like this
 

     pgbouncer=# show pools;


-[ RECORD 1 ]---------
database   | pgbouncer
user       | pgbouncer
cl_active  | 1
cl_waiting | 0
sv_active  | 0
sv_idle    | 0
sv_used    | 0
sv_tested  | 0
sv_login   | 0
maxwait    | 0
maxwait_us | 0
pool_mode  | statement
-[ RECORD 2 ]---------
database   | postgres
user       | postgres
cl_active  | 21
cl_waiting | 9
sv_active  | 20
sv_idle    | 0
sv_used    | 0
sv_tested  | 0
sv_login   | 0
maxwait    | 0
maxwait_us | 703233
pool_mode  | session
-[ RECORD 3 ]---------
database   | postgres
user       | santosh
cl_active  | 20
cl_waiting | 10
sv_active  | 20
sv_idle    | 0
sv_used    | 0
sv_tested  | 0
sv_login   | 0
maxwait    | 1
maxwait_us | 235861
pool_mode  | session


3. Demonstrate the usage of server_idle_timeout
------------------------------------------------

  server_idle_timeout is a parameter on pgbouncer, the default setting is 600(secs).

  pgbouncer created some pid's, if those pid's will be  idle  in 600 sec, then automatically erase those pid's.


-[ RECORD 3 ]---------
database   | postgres
user       | santosh
cl_active  | 0
cl_waiting | 0
sv_active  | 0
sv_idle    | 0
sv_used    | 20------------------> it means pid's are in idle
sv_tested  | 0
sv_login   | 0
maxwait    | 0
maxwait_us | 0
pool_mode  | session


after 600 sec's

-[ RECORD 3 ]---------
database   | postgres
user       | santosh
cl_active  | o
cl_waiting | 0
sv_active  | 0
sv_idle    | 0
sv_used    | 0--------------------> erase automatically by parameter server_idle_timeout
sv_tested  | 0
sv_login   | 0
maxwait    | 0
maxwait_us | 0
pool_mode  | session



