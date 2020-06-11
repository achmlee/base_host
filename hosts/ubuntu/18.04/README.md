# Ubuntu 18.04.3 x64 Bionic Beaver (Last Updated: 2020.04.13)

## Assumptions
* Git installed and this repo has been downloaded

## Setup Overview
1. Follow generic host setup.
2. Copy customization files into place. Optional but helpful.
3. Set up Logz.io integration

## Customization Files
Mostly cosmetic customizations.
* .bash_aliases (global alias file, designed not to be changed)
* .bash_aliases_local (*Example* user specific alias file)
* .bash_profile (startup config file)
* README.md (this file)
* .vimrc (VIM specific customization)

## Install MySQL Client (For Data Backup Operations)
* `$ apt-get install mariadb-client`

## Set Up s4cmd for S3 Backups
* `$ apt-get install s4cmd` - Current v2.0.1
* Add credentials to .bashrc
  * export S3_ACCESS_KEY="<S3_ACCESS_KEY>"
  * export S3_SECRET_KEY="<S3_SECRET_KEY>"

# Niceties
* Install zsh:
  * `$ sudo apt-get install zsh`
  * `$ sudo usermod -s /usr/bin/zsh $(whoami)`
  * `$ sudo apt-get install powerline fonts-powerline`
* Install oh-my-zsh
  * `$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
* Install powerlevel10k theme
  * `$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k`
  * In .zshrc, update ZSH_THEME to: powerlevel10k/powerlevel10k
  * To reconfigure: `$ p10k configure`
    * Config file: `~/.p10k.zsh`
* Install Fonts (https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k):
  * Catalina: Open Font Book → Validate and Install
  * iTerm2: iTerm2 → Preferences → Profiles → Text → Choose MesloLGS NF
