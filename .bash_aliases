# ~/.bash_aliases

# Directories
alias c="cd"
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# Emacs
alias pe="emacsclient"
alias pew="emacsclient --create-frame --no-wait"
alias pk="emacsclient -e '(kill-emacs)'"

# Terminal
# alias tm0="tmux attach -t 0 || tmux"

# Scoop
alias scoopupdateall="scoop update ; scoop update '*' ; sudo scoop update -g '*'"
scoop-up () {
	scoop uninstall $@ 2>&1 >/dev/null && scoop install $@
}

# Git
alias st="git status"
alias pu="git push origin"

# Misc
alias wikideploy="rsync -av --delete ~/sites/wiki/ root@snowfall:/var/www/wiki"
