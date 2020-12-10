# My bash configuration

system_type=$(uname -s)

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export SPICETIFY_CONFIG="$HOME/.config/spicetify"

if ["$system_type" = "Linux"]; then
	export PATH=$PATH:/usr/local/go/bin
fi

source ~/.bash_default
. ~/.config/yadm/illumina

shopt -s autocd
shopt -s cdspell

# Aliases
alias yay=""
alias push-sites="git push origin ; git push gh"

eval "$(starship init bash)"

