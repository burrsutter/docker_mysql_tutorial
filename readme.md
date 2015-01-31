Docker with boot2docker for Windows Java EE + MySQL
===================================================

This tutorial walks you through using a Java EE application server and MySQL, both running in Docker Linux containers on a Windows host via boot2docker.

* * *
##### Prerequisites & Assumptions:
* You completed the first Docker Tutorial that walks through the basics of standing up a Java EE application server in a Docker container
* You have MySQL Workbench installed on your Windows host
* You have Maven installed on your Windows host machine
* * *


1. Boot2docker Start

    ![Alt text](/screenshots/boot2docker_start_menu.png?raw=true "Start Menu")

    ![Alt text](/screenshots/start_sh_running.png?raw=true "Boot2Docker Command Prompt")

2. `docker pull mysql`

    > Note: I had previously removed all images and re-initialized my environment.  You will likely have other images from the previous tutorial.

    ![Alt text](/screenshots/docker_pull_mysql.png?raw=true "docker pull mysql")


3. Now we run MySQL inside of the boot2docker-vm, inside of a Docker container

    ````
    docker run --name mysqldb -p 3306:3306 -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_DATABASE=sample -e  MYSQL_ROOT_PASSWORD=supersecret -d mysql
    ````

    ![Alt text](/screenshots/docker_run_mysql.png?raw=true "docker run mysql")

    > Note: I am using -p 3306:3306 to connect from a Windows (host) MySQL Workbench and from a Windows/host based Wildfly instance. 3306 is the normal port for MySQL.  You will see this port listed in the `docker ps` results as well.

    * * *
    ##### Tip: Copy & Paste in the default Windows Command Prompt is possible.  
    Click on the top-left icon for the pull-down menu.  Select Mark, highlight the text you wish to copy, then hit Enter. Then for Paste, simply use the menu option.
    ![Alt text](/screenshots/mark_paste.png?raw=true "DOS/Command Prompt Copy & Paste")

    * * *

4. Back in Windows run MySQL Workbench.  You will need the IP address you saw when running Boot2Docker Start or `boot2docker ip`.

    > Select New Connection

    ![Alt text](/screenshots/mysql_workbench_new_connection.png?raw=true "new connection")

    > Give the connection a name like "docker_mysql_104" as the IP address will change from time to time. Enter the correct IP address.  You will notice that some of the screenshots use different IPs.

    ![Alt text](/screenshots/connect_to_database.png?raw=true "New Connection Dialog")

    > The root password was defined via the `docker run` command, look for MYSQL_ROOT_PASSWORD

    ![Alt text](/screenshots/mysql_root_password.png?raw=true "Root Password Prompt")

    > You can double-click on the connection to open up the SQL Editor

    ![Alt text](/screenshots/mysql_sql_editor.png?raw=true "SQL Editor")


    > By default you get a "sample" database with no tables.  A table will be created when we launch the Java EE application.

    > Now that your MySQL instance is running happily inside of a Docker container (inside the boot2docker-vm)
let's configure the Java EE app to use your MySQL

5.  `mkdir /c/Users/Burr/docker_projects/mysqlapp`

    > Replace "Burr" with your user name.  Remember boot2docker 1.3 and higher have VirtualBox Guest Additions preconfigured to map the Linux `/c/Users/` to `c:\Users`

6. step 6
    blah, blah
