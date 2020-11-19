# ~/.bashrc

system_type=$(uname -s)

# Default .bashrc options
if [ -f ~/.bash/bash-defaults.sh ]; then
source ~/.bash/bash-defaults.sh
fi

# autocd
shopt -s autocd

# Shell color on launch
source ~/.bash/shell-color-scripts/colorscripts/illumina

# Powerline
source ~/.bash/bash-powerline/bash-powerline.sh

# Aliases

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias yay="emacsclientw -c -n -a runemacs"
alias em="emacsclientw"
alias killemacs="emacsclientw -e '(save-buffers-kill-emacs)'"

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias addall='git add -A'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit --verbose'
alias fetch='git fetch'
alias pull='git pull'
alias push='git push'
alias status='git status'

if [ -x "$(command -v thefuck)" ]; then
    eval $(thefuck --alias)
fi

# Git - which branch you're on
#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}
#export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# Exports
export EDITOR=nvim
export PATH=$PATH:~/.local/bin
export SPICETIFY_CONFIG=~/.config/spicetify

if [ "$system_type" = "Linux" ]; then
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:~/.config/emacs/bin
fi
