  
1. Modify PostgreSQL authentication from md5 to pam   
   
       =====> 4 modules those are AUTH, ACCOUNT, PASSWORD, SESSIONS



2. Add a foriegn key to the table after inserting records into the child table  

    ====> create table and insert values====> parent table is dept with these columns deptno,dname,loc      and child table is emp with these columns  empno,ename,job,sal,deptno.
    ====> alter table emp add foreign key (deptno) references dept(deptno);
    ====> alter table emp add foreign key (deptno) references dept(deptno) not valid;====> if chaild table had extra rows where not in parent table then use this syntax for foreign key 



3. What is the alternative way to reload configuration file settings

    ====> pg_ctl reload -D datadirectorypath



4. How to check whether a paremeter change requires reload OR restart of the instance (SQL query)

       =====>select name, context from pg_settings where name='give parameter name';
      ======> context column contains 4 types of data 1. postmaster--it means, if paramater changes requires restart
                                                      2. sighup  ---it means, it requires reload
                                                      3. user----not require both, but if we change parameter, it contains only for that session. once we close this session changed                                                                           parameter will be reset to previous value.
                                                      4.superuser--
 

5. Display top 5 biggest tables from the database.


    =====>  SELECT table_name, pg_relation_size(table_schema || '.' || table_name)  FROM information_schema.tables 
       
                                       WHERE table_schema NOT IN ('information_schema', 'pg_catalog') ORDER BY size DESC LIMIT 10;




























+















//////////////////////////////////////////*
-........................................................................................................................................./***********/////