# This is an example on installing nodejs, pm2, troubleshooting utilities and ssh on a redhat ubi image. 
# You could modify this as needed and choose a relevant base image if you don't need to setup a custom image from scratch. 
# Ex: FROM registry.access.redhat.com/ubi9/nodejs-18
# For more try: docker search registry.access.redhat.com/ubi9 | grep -i node 

# Install base image
FROM registry.access.redhat.com/ubi9
LABEL maintainer="Ragu Karuturi"

# Install updates
RUN yum update -y && dnf update -y

# Install nodejs
RUN dnf install nodejs npm -y

# Setup workdir
WORKDIR /app

# Install packages
COPY package.json ./
RUN npm install \
    && npm i -g pm2

# Copy src and artifacts
COPY . ./

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
EXPOSE 8080 2222

#Start shell script (exec mode).
ENTRYPOINT ["./start.sh"]

