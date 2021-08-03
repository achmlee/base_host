# ~/.bash_aliases
lt_blue=$(tput -Txterm setaf 6)
PS1='\[$lt_blue\]${debian_chroot:+($debian_chroot)}\u(\h) \w> '

# General
alias cp='cp -iv'
alias grep='grep --color=auto -in'
alias ls='ls -F --color=always'
alias mv='mv -iv'
alias rm='rm -i'

# System specific aliases
if [ -f ~/.bash_aliases_local ]; then
  . ~/.bash_aliases_local
fi

