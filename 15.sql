1. How to find the used cached memory in OS level (Google)
----------------------------------------------------------

 Using top command we can find the used cached memory.


 top - 20:30:39 up 11:22,  2 users,  load average: 0.00, 0.01, 0.05
Tasks: 201 total,   1 running, 200 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.2 sy,  0.0 ni, 99.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3864216 total,  1784176 free,   808400 used,  1271640 buff/cache----------------------> this is the cached memory in os level
KiB Swap:  4063228 total,  4063228 free,        0 used.  2709576 avail Mem


2. Install/Create pgfincore, pg_buffercache extensions in database level
------------------------------------------------------------------------

     

3. Define what is the CHECKPOINT it's background behavior
----------------------------------------------------------

 Desc:  If checkpoint done by manual or automatically it will do flushed data from ram to disk. 

4. Install PostgreSQL 9.3 version, and demonstrate a dblink connection from your current version to the 9.3
-----------------------------------------------------------------------------------------------------------

  step1: Check the 'dblink' extension created or not.
  step2: Create dblink connection
         select dblint_connect('link1', 'dbname=postgres port=5432 user=postgres password=postgres');
         
          dblink_connect
         -------------------------->o/p          -->here 'link1' is a name of dblink_connection, we can with any name as our wish.
              OK
            (1 row)

  step3: connect to the database through dblink, which is created in previous step.

        
        0postgres=# select * from dblink('link1', 'select * from test') as test(t int);--------> here test is a table name of remote mechine. 
 t
---
 1
 2
 3
 4
 5
 6

5. Demonstrate the usage of psql's -H, -R, -A, -t and -F parameters
-------------------------------------------------------------------

 psql -A:  Switches to unaligned output mode.
---------   
   [postgres@localhost data]$ psql -c "select * from santu;"
      t | age
     ---+-----
      4 |  19
      (1 row)


[postgres@localhost data]$ psql -Ac "select * from santu;"
t|age
4|19
(1 row)


psql -t: Print only tuple, this is equivalent to \t command.
-------

[postgres@localhost data]$ psql -tc "select * from santu;"
 4 |  19


psql -H :  Turn on html tabular format output. It is equivalent to /pset format or /H command.
--------
[postgres@localhost data]$ psql -Hc "select * from santu;"
<table border="1">
  <tr>
    <th align="center">t</th>
    <th align="center">age</th>
  </tr>
  <tr valign="top">
    <td align="right">4</td>
    <td align="right">19</td>
  </tr>
</table>
<p>(1 row)<br />
</p>



psql -F: Using separator as the field separator for unaligned output. This is equivalent to /pset fieldsep or /f command.
--------


postgres=# select * from student ;
 sid | sname | contact |  city   | village
-----+-------+---------+---------+---------
   1 | a     |     123 | nellore | tpt
   2 | b     |    1234 | nellore | tpt
   3 | c     |   12345 | ongole  | mdpr
   4 | d     |  123456 | ongole  | mdpr
   5 | e     |   23456 | chittor | kr
(5 rows)



psql -R:   Use separator as the record separator for unaligned output. This is equivalent to the \pset recordsep command.
--------   

