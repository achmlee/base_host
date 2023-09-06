# ZSH Install (Last Updated: 2023.09.04)

```
# If zsh not already installed.
$ sudo apt install zsh

$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# If permission errors are detected, sudo chmod 755 <dir>
# to remove group/other writability.

# Install Powerlevel10k (https://github.com/romkatv/powerlevel10k)
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Update theme in .zshrc to 'powerlevel10k/powerlevel10k'
# Configure p10k (After icon check: 213-311-112-21-y3y)
# Configure p10k (After icon check: 213-111-112-311-112-21-y3y)
# Config saved to .p10k.zsh.

# If client needs them, download NerdFonts.
# New shell window will auto prompt for the install.
```
