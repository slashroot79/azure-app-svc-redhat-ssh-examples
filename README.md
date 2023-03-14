# Examples demonstrating ssh configuration and setup.

These examples are for the below runtimes
- python
- java
- dotnet
- node

Note:
- these examples serve as a reference for deployment on Azure App Services and hence SSH is to be exposed on port 2222.
- do not change the root password!
- if you expose a different port, add WEBSITES_PORT app setting with a corresponding value. It is a good idea to add this app setting regardless. 
- tools such as nmap are useful for trobleshooting network connectivity. Install additional tools as needed.
- while these images have been setup from scratch, it is recommended to use the relavant base images with the runtimes already installed.
- it is also recommended to leverage multi-stage builds. 




