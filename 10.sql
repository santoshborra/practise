1. Create a database user with some password and try to change password it later.


        create user username with password 'password';-------------> create as a superuser.

    How to change password:
  -------------------------
          alter user username with password 'newpassword';---------> alter as same user or superuser.

2. Convert existing normal user to super user (Google)

           alter user username superuser;  ----------> alter as a superuser.

3. How to find the postgresql uptime

4. Demonstrate the usage of 'include' in postgresql.conf by giving
	1. work_mem, shared_buffers and temp_buffers into memory.conf
	2. max_connections, port and listen_addresses into conn.conf

5. Define the parameter affect hirerachy levels.







