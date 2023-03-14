# This is an example on installing tomcat, java 17, supervisor, troubleshooting utilities and ssh on a redhat ubi image. 
# You could modify this as needed and choose a relevant base image if you don't need to setup a custom image from scratch. 
# Ex: FROM registry.access.redhat.com/ubi9/openjdk-17-runtime
# For more try: docker search registry.access.redhat.com/ubi9 | grep -i jdk 

# Install base image
FROM registry.access.redhat.com/ubi9
LABEL maintainer="Ragu Karuturi"

#Install java v17 and set env vars
RUN yum update -y && yum install -y java-17-openjdk-devel

#Download and install tomcat v10.
RUN curl -k https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz -o /tmp/apache-tomcat-10.0.27.tar.gz 

WORKDIR /usr/local
RUN tar -xf /tmp/apache-tomcat-10.0.27.tar.gz -C .
RUN mv apache-tomcat-10.0.27 tomcat
ENV CATALINA_HOME /usr/local/tomcat
WORKDIR /usr/local/tomcat

#Create tomcat user (recommended)
RUN useradd -d /usr/local/tomcat -U tomcat
RUN chown -R tomcat: /usr/local/tomcat

#Install troubleshooting tools. 
RUN yum install procps -y \
	&& yum install net-tools -y \
	&& yum install bind-utils -y \
	&& yum install nmap -y \
	&& yum install sudo -y

#Delete existing apps and copy primary build artifact
RUN rm -rf webapps/*
COPY target/cenlinsbw1-0.0.1-SNAPSHOT.war webapps/ROOT.war

#Install and configure ssh
RUN yum install -y openssh-server openssh-clients
RUN echo "root:Docker!" | chpasswd
COPY sshd_config /etc/ssh/

#Custom startup script to launch multiple services.
COPY start.sh .
RUN chmod +x start.sh

#Expose app and ssh ports.
EXPOSE 8080 2222

#Start shell script (exec mode).
ENTRYPOINT ["./start.sh"]

