Docker with boot2docker for Windows Java EE + MySQL
===================================================

This tutorial walks you through using a Java EE application server and MySQL, both running in Docker Linux containers on a Windows host via boot2docker.

* * *
##### Prerequisites & Assumptions:*
* You completed the first Docker Tutorial that walks through the basics of standing up a Java EE application server in a Docker container
* You have MySQL Workbench installed on your Windows host
* You have Maven installed on your Windows host machine
* * *


1. Boot2docker Start

    ![Alt text](/screenshots/boot2docker_start_menu.png?raw=true "Start Menu")

    ![Alt text](/screenshots/start_sh_running.png?raw=true "Boot2Docker Command Prompt")

2.  `docker pull mysql`

    > Note: I had previously removed all images and re-initialized my environment.  You will likely have other images from the previous tutorial.

![Alt text](/screenshots/docker_pull_mysql.png?raw=true "docker pull mysql")

3. Now, we run MySQL inside of the boot2docker-vm, inside of a Docker container

`docker run --name mysqldb -p 3306:3306 -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_DATABASE=sample -e MYSQL_ROOT_PASSWORD=supersecret -d mysql`

    ![Alt text](/screenshots/docker_run_mysql.png?raw=true "docker run mysql")

    > Note: I am using -p 3306:3306 to connect from a Windows (host) MySQL Workbench and from a Windows/host based Wildfly instance.   3306 is the normal port for MySQL

4.

Then build a new docker image containing the javaee6angularjsmysql.war

docker build --tag=mysqlapp .

Then run it

docker run --name mysqlapp --link mysqldb:db -it -p 8080:8080 -d mysqlapp

results in "no such file or directory"
