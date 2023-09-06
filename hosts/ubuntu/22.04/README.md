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
### @see [s3fs Install](https://www.nakivo.com/blog/mount-amazon-s3-as-a-drive-how-to-guide/)

## Niceties
* Install [zsh](../../../tools/zsh.md)
