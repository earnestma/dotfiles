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

alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias pe="emacsclient"
alias pew="emacsclient --create-frame --no-wait"
alias pk="emacsclient -e '(kill-emacs)'"

alias tm0="tmux attach -t 0 || tmux"

alias scoopupdateall="scoop update ; scoop update '*' ; sudo scoop update -g '*'"

alias status="git status"
alias push="git push origin"
alias wikideploy="rsync -av --delete ~/sites/wiki/ root@earnestma.xyz:/var/www/wiki -e 'ssh -p 69 -i ~/.ssh/tycho_id'"

eval "$(starship init bash)"

