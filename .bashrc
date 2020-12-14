# My bash configuration

system_type=$(uname -s)

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

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
alias yay="emacsclient -c -n -a emacs"
alias em="emacsclient -c -a emacs"

alias tm0="tmux attach -t 0 || tmux"

alias scoopupdateall="scoop update ; scoop update '*' ; sudo scoop update -g '*'"

alias status="git status"
alias push="git push origin"
alias push-sites="git push origin ; git push gh"

eval "$(starship init bash)"

