# My bash configuration

system_type=$(uname -s)

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# linux-specific
if [ "$system_type" = "Linux" ]; then
	# go
	export PATH=$PATH:/usr/local/go/bin
fi

source ~/.bash_default

if [ -t 1 ]; then
	. ~/.config/yadm/illumina
fi

shopt -s autocd
shopt -s cdspell

# Aliases
alias emdaemon="emacs -daemon > /dev/null 2>&1 & disown"
alias emkill="emacsclient -e '(kill-emacs)'"

## personal Emacs Daemon
alias pe="emacsclient --server-file=personal --create-frame --no-wait"
alias pew="emacsclient --server-file=personal"
## work Emacs Daemon
alias we="emacsclient --server-file=personal --create-frame --no-wait"
alias wew="emacsclient --server-file=personal"


alias tm0="tmux attach -t 0 || tmux"

alias scoopupdateall="scoop update ; scoop update '*' ; sudo scoop update -g '*'"

alias status="git status"
alias push="git push origin"

eval "$(starship init bash)"

