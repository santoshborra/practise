1. Load a table into OS cache using pgfincore, and demonstrate it's performance (Google)

2. How to flush OS cache linux (Google)
---------------------------------------

  Every linux system has three options to clear cache without interrupting any processes or service.

    free && sync && echo 1 > /proc/sys/vm/drop_caches  -------> Clear pagecahe only.
    free && sync && echo 2 > /proc/sys/vm/drop_caches  -------> clear dentries and inodes.
    free && sync && echo 3 > /proc/sys/vm/drop_caches  -------> clear pageCache, dentries and inodes.
    
    Explanation of above command.
         sync will flush the file system buffer. Command Separated by “;” run sequentially. The shell wait for each command to terminate before executing the next command          in the sequence. As mentioned in kernel documentation, writing to drop_cache will clean cache without killing any application/service, command echo is doing the          job of writing to file.
         If you have to clear the disk cache, the first command is safest in enterprise and production as “...echo 1 > ….” will clear the PageCache only. It is not                  recommended to use third option above “...echo 3 >” in production until you know what you are doing, as it will clear PageCache, dentries and inodes(when we cal          the table from disk it creates a num for that table in os level).

3. Define the usage of PATH environment variable
------------------------------------------------

 This variable contains more paths of the executable files in our system, each path separated by a colon(:) symbol. 
 When we enter a command on terminal, the shell looks for the command in different directories mentioned in the $PATH variable. If the command is found, it executes.  Otherwise, it returns error like 'command not found'. 

4. Define the linux folder structure and define the usage of opt, var, etc, usr, bin, sbin and home
----------------------------------------------------------------------------------------------------

 (https://www.thegeekstuff.com/2010/09/linux-file-system-structure/?utm_source=tuicool)


    Linux folder start with root dir (/), it contains more sub dir those are (bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp      usr  var)

    bin: Contains binary executables.
         Common linux commands you need to use in single-user modes are located under this directory.
         Commands used by all the users of the system are located here.
         For example: ps, ls, ping, grep, cp.

   opt:  /opt – Optional add-on Applications
         opt stands for optional
         contains add-on applications from individual vendors.
         add-on applications should be installed under either /opt or /opt/sub-dir.

   var:  var stands for variable files.
         Content of the files that are expected to grow can be found under this directory.
         This includes — system log files (/var/log); packages and database files (/var/lib); emails (/var/mail); print queues (/var/spool); lock files (/var/lock); temp          files needed across reboots (/var/tmp);    
   
   etc:  Contains configuration files required by all programs.
         This also contains startup and shutdown shell scripts used to start/stop individual programs.
         For example: /etc/resolv.conf, /etc/logrotate.conf

   usr:  Contains binaries, libraries, documentation, and source-code for second level programs.
         /usr/bin contains binary files for user programs. If you can’t find a user binary under /bin, look under /usr/bin. For example: at, awk, cc, less, scp
         /usr/sbin contains binary files for system administrators. If you can’t find a system binary under /sbin, look under /usr/sbin. For example: atd, cron, sshd,               useradd, userdel
         /usr/lib contains libraries for /usr/bin and /usr/sbin
         /usr/local contains users programs that you install from source. For example, when you install apache from source, it goes under /usr/local/apache2

  sbin:  Just like /bin, /sbin also contains binary executables.
         But, the linux commands located under this directory are used typically by system aministrator, for system maintenance purpose.
         For example: iptables, reboot, fdisk, ifconfig, swapon

  home:  Home directories for all users to store their personal files.
         For example: /home/john, /home/nikita 

5. Define what is the shared memory in Linux
--------------------------------------------

        If we are using three sessions in pgsql, these sessions should be required some memory at the time of sql query runs, required memory takes from main memory. In            this process main memory divided into three sessions. divide the size of Memory depeds on the sessions requirement. 

