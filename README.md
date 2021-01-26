# My dotfiles

[![git repo](https://img.shields.io/badge/repo-git-informational)](https://git.earne.link/earnestma/dotfiles)
[![github mirror](https://img.shields.io/badge/mirror-github-lightgrey)](https://github.com/earnestma/dotfiles)

My personal dotfiles, managed using [yadm](https://yadm.io/).

## Programs I use

- Dotfiles management: [yadm](https://yadm.io/)
- Git repos management: [ghq](https://github.com/x-motemen/ghq/)

A more comprehensive list is available [on my wiki (when it's fixed)](wiki.earnestma.xyz/page/apps%20i%20use).

## Compatibility

I use these on a daily basis:

- Windows 10 (primary laptop, sadly)
	- Install:
		- Windows Terminal, Git Bash, Gpg4Win
		- Scoop (Powershell:
			- `Set-ExecutionPolicy RemoteSigned -scope CurrentUser`
			- `iwr -useb get.scoop.sh | iex`
		- Install yadm:
			- `scoop install curl ; curl -L https://github.com/TheLocehiliosan/yadm/raw/3.0.2/yadm -o ~/bin/yadm ; export PATH=$HOME/bin:$PATH`
			- `yadm config local.os Win10 ; yadm clone https://git.earne.link/earnestma/dotfiles.git -b dots ; yadm checkout dots`
	- Manually symlink/ junction paths as needed 🤔
	- Environment variables to set through control panel
- GNU/Linux Ubuntu 20.04 LTS (regular and Xubuntu)
    - Install ghq: `go get github.com/x-motemen/ghq`

## Related repositories

- [My Emacs configuration](https://git.earne.link/earnestma/earnemacs)
- [Development VM script (Emacs on Windows)](git.earne.link/earnestma/dev-vm)
