# This is an example on installing python, troubleshooting utilities and ssh on a redhat ubi image. 
# You could modify this as needed and choose a relevant base image if you don't need to setup a custom image from scratch. 
# Ex: FROM registry.access.redhat.com/ubi9/python-39
# For more try, docker search registry.access.redhat.com/ubi9 | grep -i python 

# Install base image
FROM registry.access.redhat.com/ubi8
LABEL maintainer="Ragu Karuturi"

# Install updates
RUN yum update -y && dnf update -y

# Install python 3.9
RUN dnf install python39 -y 

# Setup workdir
WORKDIR /app

# Install src
COPY . ./

# Install packages
RUN dnf install -y python3-pip \
	&& pip3 install --upgrade pip \
	&& pip3 install -r requirements.txt

#Install troubleshooting tools. 
RUN yum install procps -y \
	&& yum install net-tools -y \
	&& yum install bind-utils -y \
	&& yum install nmap -y \
	&& yum install sudo -y

#Install and configure ssh
RUN yum install -y openssh-server openssh-clients \
    && echo "root:Docker!" | chpasswd \
    && chmod +x start.sh

# Copy over the sshd config file
COPY sshd_config /etc/ssh/

#Expose app and ssh ports.
EXPOSE 8000 2222

#Start shell script (exec mode).
ENTRYPOINT ["./start.sh"]

