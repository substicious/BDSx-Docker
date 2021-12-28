
![logo](https://github.com/substicious/bdsx-linux-docker/blob/BDSx-1.3.35/BDSX-Linux.png)

# BDSx For Linux Docker
### BDSx: Minecraft Bedrock Dedicated Server + node.js!

https://img.shields.io/github/workflow/status/substicious/BDSx-Docker/Publish%20BDSx-Docker:alpine?style=for-the-badge

#### *DISCLAIMER:*
*I **DO NOT** take any credit for the great work behind Minecraft BDSx software. The credit goes to @karikera and you can view the github [repo](https://github.com/karikera/bdsx).*

### INSTALLATION

   1. Be sure you have Docker installed.
   2. Create a folder named **bdsx** in **/opt/**.
   3. Run the following command *(You may need to run with root privileges)*
        > docker run -d -it --name **bdsx** --network="host" -v /opt/bdsx:/data substicious/bdsx-linux:latest
        
        * **You do not need to name the container bdsx. You can choose your own name!**
   4. You will then need to attach the docker:
        > docker attach **[YOUR CHOSEN NAME]**
   5. Follow the prompt for agreeing to the EULA and hey presto, you are away.
  
