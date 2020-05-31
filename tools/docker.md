# Docker Install

## Install Docker CE via Repository (@see https://docs.docker.com/engine/install/ubuntu/)
### Set Up Repository
1. Update apt index:
   * `$ sudo apt-get update`
2. Install https support packages:
   * `$ sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common`
3. Add Docker GPG key:
   * `$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
4. Optional, verify GPG key fingerprint:
   * `$ sudo apt-key fingerprint <key>`
5. Set up the stable repository:
   * `$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`

### Install Docker Engine
1. Update apt index:
   * `$ sudo apt-get update`
2. Install Docker package:
   * `$ sudo apt-get install docker-ce docker-ce-cli containerd.io`
3. On production systems, use SPECIFIC version of Docker.
4. Verify:
   * `$ sudo docker run hello-world`

### Install Docker Compose
1. Get latest Compose:
   * `sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`

2. Change permissions:
   * `sudo chmod +x /usr/local/bin/docker-compose`

### Docker Post Install (https://docs.docker.com/engine/install/linux-postinstall/)
1. Create docker group: `$ sudo groupadd docker`
2. Add user to docker group: `$ sudo usermod -aG docker $USER`
3. Config docker to autostart at boot: `$ sudo systemctl enable docker`

### For external access to local projects, Set up ngrok.
1. Install ngrok: `$ snap install ngrok`

### DDev External Access
* `~/.ddev/global_config.yaml` - Open up access to whole network and disable tools
  * router_bind_all_interfaces: true
  * omit_containers: [dba]
