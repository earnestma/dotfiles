# My bash configuration

system_type=$(uname -s)
if [[ $system_type = MINGW64_NT-10.0* ]]; then
	export USER=$USERNAME
fi

source $HOME/.bash_default


# Exports
export EDITOR="nvim"

# set $MANPAGER
if bat -V 2>/dev/null 1>&2; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'" # bat as manpager
elif nvim -v 2>/dev/null 1>&2; then
	export MANPAGER="nvim -c 'set ft=man' -" # neovim as manpager
fi


# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
# linux-specific:
if [ "$system_type" = "Linux" ]; then
	export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin # go
fi

case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007${1}"' ;;
#  screen*) I do not use screen
#    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"' ;;
esac


# if connected over SSH, 
if [ -n "$SSH_CLIENT" ] && [ -t 1 ] || [ -n "$SSH_TTY" ] && [ -t 1 ]; then
	export GPG_TTY="$(tty)" # use tty for gpg
	if [ -z "$TMUX" ]; then
		printf "%0.s-" {1..50} ; tmux ls
		tmux attach -t 0 || tmux # start or join the first tmux session
	fi
fi

shopt -s autocd
shopt -s cdspell
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # check term size when bash regains control


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


# if interactive session,
if [ -t 1 ]; then
	source $HOME/.config/yadm/illumina
	eval $(gh completion -s bash)
	eval "$(starship init bash)"
fi

