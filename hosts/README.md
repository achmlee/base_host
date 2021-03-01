# Generic Setup for All Hosts (Last Updated: 2020.04.13)

## Assumptions
* Git installed and configured properly.
* SSH key generated.
 * @see `https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/`
 * Use email that includes server as an identifier.

## Security (@see https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)
### Secure Root
1. Add ssh keys to root user. (DigitalOcean handles this at Droplet creation)

### Create non-root user (as root user)
1. `# adduser <user>`
2. `# usermod -aG sudo <user>` (Adds user to sudo group)
3. Log into new user and create SSH key.
4. Create `.ssh/authorized_keys` for new user and reassign ownership to new user.

### Secure SSH Access (https://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html)
Disable password authentication and root access
1. Edit `/etc/ssh/sshd_config`
   * PermitRootLogin no
   * ChallengeResponseAuthentication no
   * PasswordAuthentication no
   * UsePAM no (password authentication module)
2. Restart sshd service: `$ sudo systemctl reload sshd`
3. Test
    * `$ ssh -v <server>` - Verify available Authentication Methods
    * `$ ssh root@server` - Permission denied (publickey)
    * `$ ssh mike@server -o PubkeyAuthentication=no` - Permission denied (publickey)

### Enable firewall
* Either use ufw or firewall tool provided by host.

### Enable File Integrity Tool (optional)
* @see `https://https://logz.io/'

### Updates/Upgrades
* `$ sudo apt-get update` - Update package lists
* `$ sudo apt-get upgrade` - Upgrade packages
