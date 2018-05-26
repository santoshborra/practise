1. Configure pgbouncer 1 to pgbouncer 2, which pgbouncer 2 connects to pgbouncer 3, which pgbouncer 3 connects to pgbouncer 1
------------------------------------------------------------------------------------------------------------------------------

     For this configuration we need three pgbouncers with different ports.

    How to config:
   ---------------

             pgbouncer1: config the pgbouncer.ini file in pgbouncer1. 

                         database = port=2222 host=localhost dbname=postgres  --------->these are pgbouncer2 credetials
                         logfile = <path of the pgbouncer1 log file>
                         pidfile = <path of the pabouncer pid file> 
                         auth_file= <path of the userlist.txt file>

            pgbouncer2: config the pgbouncer.ini file in pgbouncer2
           
                         database = port=3333 host=localhost dbname=postgres  --------->these are pgbouncer3 credetials
                         logfile = <path of the pgbouncer2 log file>
                         pidfile = <path of the pabouncer pid file> 
                         auth_file= <path of the userlist.txt file>


           pgbouncer3: conig the pgbouncer.ini file in pgbouncer3

                         database = port=1111 host=localhost dbname=postgres  --------->these are pgbouncer1 credetials
                         logfile = <path of the pgbouncer3 log file>
                         pidfile = <path of the pabouncer pid file> 
                         auth_file= <path of the userlist.txt file>

    After done these config run all pgbouncers and check the pgbouncer are running or not. Connect to pgbouncer1, after few seconds we will get msg like (psql: ERROR:          pgbouncer cannot connect to server).



2. Create two postgresql clusters along with 3 pgbouncers.
-----------------------------------------------------------
      For this query we need three pgbouncers with these ports 6432(pgbouncer),1111(pgbouncer1),2222(pgbouncer2) and also need two postgreses with these ports 8989,5432.

  Config pgbouncer(6432) with these parameters.
         
        database: 

           pg1 = port=1111 host=127.0.0.1 dbname=postgres
           pb2 = port=2222 host=localhost dbname=postgres

        pgbouncer:

           logfile = <path of the pgbouncer log file>
           pidfile = <path of the pabouncer pid file> 
           auth_file= <path of the userlist.txt file>

      
 Config pgbouncer1(1111) with these parameters.

        database: 

           postgres = port=8989 host=127.0.0.1 dbname=postgres
        

        pgbouncer:

           logfile = <path of the pgbouncer1 log file>
           pidfile = <path of the pabouncer1 pid file> 
           auth_file= <path of the userlist.txt file>


 Config pgbouncer2(2222) with these parameters.

        database: 

           postgres = port=5432 host=127.0.0.1 dbname=postgres
        

        pgbouncer:

           logfile = <path of the pgbouncer2 log file>
           pidfile = <path of the pabouncer2 pid file> 
           auth_file= <path of the userlist.txt file>



How it works:
--------------

 Run all pgbouncers and postgress, then try to connect 

[postgres@localhost ~]$ psql -p 6432 -d pg1
psql (9.6.8)
Type "help" for help.

pg1=# show port;
 port
------
 8989
(1 row)



[postgres@localhost ~]$ psql -p 6432 -d pg2
psql (9.6.8, server 9.3.0)
Type "help" for help.

pg2=# show port;
 port
------
 5432
(1 row)





