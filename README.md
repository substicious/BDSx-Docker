
![logo](https://github.com/substicious/bdsx-linux-docker/blob/master/BDSX-Linux.png)

# BDSX For Linux Docker
### BDSX: Minecraft Bedrock Dedicated Server + node.js!

#### *DISCLAIMER:*
*I **DO NOT** take any credit for the great work behind Minecraft BDSX software. The credit goes to @karikera and you can view the github [repo](https://github.com/karikera/bdsx).*

### INSTALLATION

   1. Be sure you have Docker installed.
   2. Create a folder named **bdsx** in **/opt/**.
   3. Run the following command *(You may need to run with root privileges)*
        > docker run -d -it --name **bdsx** -e EULA=TRUE --network="host" -p 19132:19132/udp -p 19133:19133/udp -p 57863:57863/udp -p 56772:56772/udp -p 19132:19132/tcp -p 19133:19133/tcp -p 57863:57863/tcp -p 56772:56772/tcp -v /opt/bdsx:/data substicious/bdsx-linux:latest
        
        * **You do not need to name the container bdsx. You can choose your own name!**
    4. You will then need to attach the docker:
        > docker attach **[YOUR CHOSEN NAME]**
    
    5. Follow the prompt, until the server starts.
  