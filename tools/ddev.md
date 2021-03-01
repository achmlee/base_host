# DDev (Last Updated: 2020.11.29)

## Assumptions:
* All DDev projects are located in ~/DDev

## Terminology:
* **Host:** This is the hosting computer, i.e. your Mac, Windows PC, Linux Machine.
* **Container:** This is the Docker container containing part of the project LAMP stack, i.e. the webserver container, database container, solr container, etc. Each container can see each other, however they are referenced differently from container to container vs host to container.

## Requirements/Pre-Install (@see https://ddev.readthedocs.io/en/stable/)
* Git is setup locally
* Install Docker Desktop for Mac / Docker for Linux
* For Macs, install Homebrew (out of scope of this document)
* Install DDev via Homebrew
  * `$ brew tap drud/ddev && brew install ddev`

## Install DDev
* @todo

## Upgrade DDev
* `ddev poweroff`
* `brew update`
* `brew upgrade drud/ddev/ddev`

## Project Setup
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

## DDev External Access
* `~/.ddev/global_config.yaml` - Open up access to whole network and disable tools
  * router_bind_all_interfaces: true
  * omit_containers: [dba]

## Command Reference
* `https://ddev.readthedocs.io/en/latest/users/cli-usage/#favorite-commands`
* Common commands:
  * `$ ddev version` - Get current version
  * `$ ddev describe` - Get project info, ports, pws, etc.
  * `$ ddev mysql` - MySQL client
  * `$ ddev ssh` - SSH into web server
  * `$ ddev ssh --service <service>` - SSH into another container (db, memcached, etc)
  * `$ ddev [start|stop|restart]` - Stop/Start/Restart Project Containers
  * `$ ddev stop -RO` - Remove stored data with no snapshot, i.e. deletes databases
