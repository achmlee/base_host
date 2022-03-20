# DDev (Last Updated: 2021.09.26)

## Assumptions:
* All DDev projects are located in ~/DDev

## Terminology:
* **Host:** This is the hosting computer, i.e. your Mac, Windows PC, Linux Machine.
* **Container:** This is the Docker container containing part of the project LAMP stack, i.e. the webserver container, database container, solr container, etc. Each container can see each other, however they are referenced differently from container to container vs host to container.

## Directories
* `.ddev/global_config.yaml` - Global config.
* `<project_dir>/.config.yaml - Project level config.

## Requirements/Pre-Install (@see https://ddev.readthedocs.io/en/stable/)
* Git is setup locally
* Install Docker Desktop for Mac / Docker for Linux (@see docker.md)
* Homebrew installed (@see linuxbrew.md)

## Install DDev
* `$ brew install drud/ddev/ddev`
* `$ mkcert -install`

## DDev External Access / Customization
* @see https://ddev.readthedocs.io/en/latest/users/alternate-uses/#casual-project-webosting-on-the-internet-including-lets-encrypt
* `~/.ddev/global_config.yaml` - Open up access to whole network and disable tools. SSH agent stores hosts keys so can be a security issue. Set via `ddev config --option` or `ddev config global --option`.
  * `ddev config global --router-bind-all-interfaces --omit-containers=dba,ddev-ssh-agent --use-hardened-images --use-letsencrypt --letsencrypt-email=you@example.com`
  * router\_bind\_all\_interfaces: true 
  * omit\_containers: 	["dba", "ddev-ssh-agent"]
  * use\_hardened\_images: true (run using restricted permissions)
  * use\_letsencrypt: true (use Let's Encrypt for certificate management, if using Cloudflare, ignore this as CF has its own certs.)
  * letsencrypt\_email: <email> (Email to use for Let's Encrypt certificates)
* `$ ddev debug compose-config` - Print final docker-compose configuration.
  
## Upgrade DDev
* `$ ddev poweroff`
* `$ brew update`
* `$ brew upgrade drud/ddev/ddev`

## Project Setup
### New Project
1. `$ cd ~/DDev`
2. `$ mkdir <project_dir>`
3. `$ cd <project_dir>`
4. `$ ddev config`

### One Time
* `$ cd ~/DDev`
* `$ git clone <repo> <project_dir>`

### Rebuild Environment (Warning, this will delete current database)
* Start Up Project (see below)
* Download proper database.
* `$ cd ~/DDev/<project_dir>`
* `$ ddev import-db --src=<filename>.gz`

## Start Up Project
* `$ ddev auth ssh` - Copies ssh keys from host web container (**Only needed once per system boot**)
  * To verify, run `ssh-add -l` in web container
* `$ ddev start` - Start DDev containers
* Import databases, if necessary (see above).

## Additional Services
@see https://ddev.readthedocs.io/en/stable/users/extend/additional-services

### Memcached
* Can be accessed on host via: `ddev-<projectname>-memcached:11211`

## Command Reference
* `https://ddev.readthedocs.io/en/latest/users/cli-usage/#favorite-commands`
* Common commands:
  * `$ ddev version` - Get current version
  * `$ ddev describe` - Get project info, ports, pws, etc.
  * `$ ddev mysql` - MySQL client
  * `$ ddev import-db --src="<source>.tgz"`
  * `$ ddev sequelpro` - MySQL SequelPro client (OsX only)
  * `$ ddev ssh` - SSH into web server
  * `$ ddev ssh --service <service>` - SSH into another container (db, memcached, etc)
  * `$ dev list` - Show running projects.
  * `$ ddev [start|stop|restart]` - Stop/Start/Restart Project Containers.
  * `$ ddev stop -RO` - Remove stored data with no snapshot, i.e. deletes databases.
  * `$ ddev poweroff` - Shut down DDev.
* Docker:
	* `$ docker ps` - Get list of all running images.
	* `$ docker inspect <container_id>` - Get information about container.
	* `$ docker cp [OPTIONS] SRC_PATH DEST_PATH` - Copy files in/out of container. (Container indicated as CONTAINER:PATH)
