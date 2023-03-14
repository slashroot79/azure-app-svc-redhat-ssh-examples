# This is an example on installing dotnet, troubleshooting utilities and ssh on a redhat ubi image. 
# You could modify this as needed and choose a relevant base image if you don't need to setup a custom image from scratch. 
# Ex: FROM registry.access.redhat.com/ubi8/dotnet-60-runtime
# For more try: docker search registry.access.redhat.com/ubi8 | grep -i dotnet 

# Install base image
FROM registry.access.redhat.com/ubi9
LABEL maintainer="Ragu Karuturi"

# Install updates
RUN yum update -y && dnf update -y

# Install dotnet
RUN yum install dotnet-sdk-6.0 -y

# Setup workdir
WORKDIR /app

# Copy src and resources
COPY . ./

# Generate a Framework Dependent Executable which is also the default for .NET 3.1+ runtimes specific to the target OS. 
RUN cd rkubidotnet \
	&& dotnet publish -r linux-x64 --self-contained false -o build

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
ENTRYPOINT ["/app/start.sh"]

