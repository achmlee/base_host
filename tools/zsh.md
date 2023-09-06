# ZSH Install (Last Updated: 2023.09.04)

* Install zsh if not already installed (global):
  * `$ sudo apt-get install zsh`
  * Verify version: `$ zsh --version`
  * Change default shell: `$ chsh -s $(which zsh)`

* Install oh-my-zsh
	* `$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
	* If permission errors are detected, sudo chmod 755 <dir> to remove group/other writability.

* Install Powerlevel10k Theme (https://github.com/romkatv/powerlevel10k)
	* `$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k`

* Update theme in .zshrc to 'powerlevel10k/powerlevel10k'
	* Configure p10k (After icon check: 213-311-112-21-y3y)
	* To reconfigure: `$ p10k configure`
	* Config saved to `.p10k.zsh`

* Install Fonts on Host Terminal (https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k):
  * Configuration should ask to install - or -
  * iTerm2: iTerm2 → Preferences → Profiles → Text → Choose MesloLGS NF