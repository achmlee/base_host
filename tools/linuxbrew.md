# Homebrew on Linux (2023.09.04)

## Resources
* @see `https://brew.sh/`

## Install
* Use default install to `/home/linuxbrew/.linuxbrew` for maximum flexibility. Sudo access required only for install and not for future use:
  * `$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* Add to .profile/.zprofile: `eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"`
* Recommended:
	* `sudo apt-get install build-essential`
	* `brew install gcc`

## Test And Use
* List Packages: `brew list`
