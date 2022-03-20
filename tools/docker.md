# Docker Install (Last Updated: 2021.08.29)

## Install Docker CE via Repository (@see https://docs.docker.com/engine/install/ubuntu/)
### Set Up Repository
1. Update apt index:
   * `$ sudo apt-get update`
2. Install https support packages:
   * `$ sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release`
3. Add Docker GPG key:
   * `$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
4. Set up the stable repository:

   ```
   echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

### Install Docker Engine
1. Update apt index:
   * `$ sudo apt-get update`
2. Install Docker package:
   * `$ sudo apt-get install docker-ce docker-ce-cli containerd.io`
3. On production systems, use SPECIFIC version of Docker.
	1. `$ apt-cache madison docker-ce` - List available versions.
	2. `$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io`
4. Verify:
   * `$ sudo docker run hello-world`

### Install Docker Compose (Tool For Defining and Running Multiple Docker applications)
1. Get latest Compose:
   *  `$ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`

2. Change permissions:
   * `$ sudo chmod +x /usr/local/bin/docker-compose`

### Docker Post Install (https://docs.docker.com/engine/install/linux-postinstall/)
1. Create docker group: `$ sudo groupadd docker`
2. Add user to docker group: `$ sudo usermod -aG docker $USER`
3. Check docker services start on boot (this are auto-enabled for Ubuntu/Debian):
	* `$ sudo systemctl status docker.service` 
	* `$ sudo systemctl containerd.service` 
	* If not enabled, enable with: `$ sudo systemctl enable <service>`

### For external access to local projects, Set up ngrok.
1. Install ngrok: `$ snap install ngrok`

### Common Commands
* `docker --version` - Get version
* `docker-compose --version` - Get version

