#FROM jboss/wildfly:latest
#FROM arungupta/wildfly-centos
FROM centos/wildfly

ADD mysql-connector-java-5.1.31-bin.jar /opt/wildfly/standalone/deployments/
ADD mysql-sample-ds.xml /opt/wildfly/standalone/deployments/
ADD javaee6angularjsmysql.war /opt/wildfly/standalone/deployments/
