# Ubuntu 20.04.2 x64 Focal Fossa (Last Updated: 2021.10.20)

## Assumptions
* Git installed and this repo has been downloaded

## Setup Overview
1. Follow generic host setup.
2. Copy customization files into place. Optional but helpful.
3. Set up Logz.io integration (optional, sometimes easier to limit login access).

## Customization Files (If not changing, can directly be symlinked)
Mostly cosmetic customizations.

* .zsh\_aliases (global alias file, designed not to be changed, ff oh-my-zsh is being used, add to ZSH_CUSTOM directory as aliases.zsh)
* .zsh\_aliases\_local (User specific alias file template)
* .zprofile (startup config file)
* README.md (this file)
* .vimrc (VIM specific customization)

## Install PHP 7.3 (NOT INSTALLED - currently handled via brew)
* `$ sudo add-apt-repository ppa:ondrej/php`
* `$ sudo apt-get update`
* `$ sudo apt-get install php7.3`
* `$ sudo apt-get install php7.3-xml` - For ext dom
* `$ sudo apt-get install php7.3-gd` - For ext gd

## Install MySQL Client (For Data Backup Operations)
* `$ apt-get install mariadb-client`

## Set Up s4cmd for S3 Backups
* `$ sudo apt-get install s4cmd` - Current v2.1.0
* Create ~/.s3cfg file

```
[default]
access_key = YOUR_ACCESS_KEY
secret_key = YOUR_SECRET_KEY
```

# Niceties
* Install zsh (Global):
  * `$ sudo apt-get install zsh`
  * Verify version: `$ zsh --version`
  * Change default shell: `chsh -s $(which zsh)`
  * @todo Recommended font: 
  * `$ sudo apt-get install powerline fonts-powerline`
* Install oh-my-zsh (Per user - easier to manage)
  * `$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
* Install powerlevel10k theme (Per user - easier to manage)
  * `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
  * In .zshrc, update ZSH_THEME to: `powerlevel10k/powerlevel10k`
  * To reconfigure: `$ p10k configure`
    * Config file: `~/.p10k.zsh`
  * Preset options: After icon check, use 2-1-3-3-1-1-1-1-2-2-1-y-3-y
* Install Fonts on Host Terminal (https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k):
  * Configuration should ask to install - or -
  * Catalina: Open Font Book → Validate and Install
    * iTerm2: iTerm2 → Preferences → Profiles → Text → Choose MesloLGS NF
