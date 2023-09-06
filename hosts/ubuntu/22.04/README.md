# Ubuntu 22.04.2 x64 Jammy Jellyfish (Last Updated: 2023.09.01)

## Assumptions
* Git installed and this repo has been downloaded

## Setup Overview
1. Follow generic host setup.
2. Copy customization files into place. Optional but helpful.

## Customization Files (If not changing, can directly be symlinked)
Mostly cosmetic customizations.

### ZSH Shell Files (see below for installation)
* .zsh\_aliases (global alias file, designed not to be changed, ff oh-my-zsh is being used, add to ZSH_CUSTOM directory as aliases.zsh)
* .zsh\_aliases\_local (User specific alias file template)
* .zshenv (Environment variables)
* .zprofile (startup config file)
* README.md (this file)
* .vimrc (VIM specific customization)

## Install Tools
### Homebrew
@see [Homebrew](https://brew.sh/)

### Install PHP 7.4 (Via Homebrew) - Skipped
* `$ brew install php@7.4`
* `brew link --force php@7.4` - Since this is an alternate version, create symlinks in `/home/linuxbrew/.linuxbrew/bin`

## Install MySQL Client (For Data Backup Operations) - Skipped
* `$ apt-get install mariadb-client`

## Set Up s3fs.
### @see https://www.nakivo.com/blog/mount-amazon-s3-as-a-drive-how-to-guide/

# Niceties
* Install zsh (Global):
  * `$ sudo apt-get install zsh`
  * Verify version: `$ zsh --version`
  * Change default shell: `$ chsh -s $(which zsh)`
  * Install Powerline fonts:
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
