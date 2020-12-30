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

## personal Emacs Daemon
alias pe="emacsclient --server-file=personal --create-frame --no-wait"
alias pew="emacsclient --server-file=personal"
## work Emacs Daemon
alias we="emacsclient --server-file=work --create-frame --no-wait"
alias wew="emacsclient --server-file=work"

# windows Git bash only
alias est="emacs --daemon=personal > /dev/null 2>&1 & disown ; emacs --daemon=work > /dev/null 2>&1 & disown"

alias tm0="tmux attach -t 0 || tmux"

alias scoopupdateall="scoop update ; scoop update '*' ; sudo scoop update -g '*'"

alias status="git status"
alias push="git push origin"

eval "$(starship init bash)"

