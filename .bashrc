# My bash configuration

system_type=$(uname -s)
if [[ $system_type = MINGW64_NT-10.0* ]]; then
	export USER=$USERNAME
fi

source $HOME/.bash_default


# Exports
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # bat as manpager
#export MANPAGER="nvim -c 'set ft=man' -" # neovim as manpager


# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
# linux-specific:
if [ "$system_type" = "Linux" ]; then
	export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin # go
fi


PS1='[\u@\h \W]\$ ' # if starship available, it should overwrite this


case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007${1}"' ;;
#  screen*) I do not use screen
#    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"' ;;
esac


shopt -s autocd
shopt -s cdspell
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # check term size when bash regains control
bind "set completion-ignore-case on" # w/ TAB completion, ignore upper/lower case


# Aliases
alias c="cd"
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias pe="emacsclient"
alias pew="emacsclient --create-frame --no-wait"
alias pk="emacsclient -e '(kill-emacs)'"

alias tm0="tmux attach -t 0 || tmux"

alias scoopupdateall="scoop update ; scoop update '*' ; sudo scoop update -g '*'"
function scoop-up () {
	scoop uninstall $@ 2>&1 >/dev/null && scoop install $@
}

alias status="git status"
alias pu="git push origin"
alias wikideploy="rsync -av --delete ~/sites/wiki/ root@snowfall:/var/www/wiki"


# Autocompletion
eval $(gh completion -s bash)


# Display
eval "$(starship init bash)"

if [ -t 1 ]; then
	source $HOME/.config/yadm/illumina
fi
