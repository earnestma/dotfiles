# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Set PATH if exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "/envs/bin" ] && export PATH=$PATH:/envs/bin # envs specific

# Defaults
# when connected over SSH, use tty for gpg instead of failing
if [ -n "$SSH_CLIENT" ] && [ -t 1 ] || [ -n "$SSH_TTY" ] && [ -t 1 ]; then
	export GPG_TTY="$(tty)"
fi

export EDITOR="nvim"

# set $MANPAGER
if bat -V 2>/dev/null 1>&2; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'" # bat as manpager
elif nvim -v 2>/dev/null 1>&2; then
	export MANPAGER="nvim -c 'set ft=man' -" # neovim as manpager
fi

# bbj for envs (I don't use)
#export BBJ_USER=$USER
# latest GO (for envs)
#export GOROOT=/usr/local/go
#export PATH=$GOROOT/bin:$PATH

system_type=$(uname -s) ; if [ "$system_type" = "Linux" ]; then
	export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin # go
fi

# hugo cachedir (from envs)
#export HUGO_CACHEDIR="/tmp/hugo_cache_$USER"

if [[ ! $TERM =~ screen ]] || [[ ! $TMUX =~ tmux ]]; then
	_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
	# when we use `byobu-disable` we have an emtpy if..
	true
fi
