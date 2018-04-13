1. Demonstrate compress and zipping files using tar command

        ======>how to zip a file       ==>zip myzip.zip <filename>
        ======>how to unzip a file    ===>unzip <filename>
        ======>how to compres a file or folder  ==>zip -zcvf <new name to ziping file like test.tar>  <source file name>
        ======> if we need to compress more then use this option in zip command     ====>zip -cjvf <new name to ziping file like test.tar>  <source file name>
        ======>how to unzip a file or folder  =====> zip -zxvf <filename>           ====>zip -xjvf <filename>


2. Deomonstrate the usage of sed command
     ------>sed is a linux/unix command. It can perform lot's of functions on a file like searching,insertion,replace and deletion
      

              1.REPLACING AND SUBTITUTING STRING:-    sed command is mostly used to replace the text in a file
                                       syntax:   sed 's/santosh/kumar/' filename
                                                              here, 's' is specifies the subtitution operation. '/' are deliminator, 'santosh' is search pattern and 'kumar' is replaces the 
                                                                     word 'santosh'.
                      NOTE: By default, sed command replaces the first occurances of the pattren in each line and it won't replaces the second, third, .....occurences in the line.
 
              2. REPLACING THE NTH OCCURENCE OF A PATTREN IN A LINE : sed 's/santosh/kumar/2' file name
  for more check here       https://www.geeksforgeeks.org/sed-command-in-unix/

                                                     

3. Create citext extension and demonstrate it's usage
      =======> data type for case-insensitive character strings
   with out citext extension:     we have a table 'test'  ----columns(id, name)------rows(1, 'SANTOSH');

           NOW, select * from test where name='santosh';   out put:  0 rows    -----> because actual data is 'SANTOSH' but we had given in where condition is 'santosh' here case sensitive.
  
  with citext extension:      use same table and same quiry 
                  output:  1   SANTOSH    ----	one row     ------------> here no case sensitive.
   
         

4. How to check the table size from OS level
                  pg_relation_pathfile=('tablename'::regclass);  -----> output:  base   /5656564/6565----> path is     /opt/postgresql/data/pg96

5. Demonstrate the usage of LEFT and RIGHT outer joins

6. How to find the exact number of rows in a table without using COUNT(*) and reltuples from pg_class

7. What is the usage of ANALYZE command
       
      analyze=vaccum    -----> it will update  statistics of all tables.