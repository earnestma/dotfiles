# My dotfiles

These are my dotfiles 🙃, managed using the wonderful [yadm](https://yadm.io).

## Setup

``` sh
git clone https://github.com/TheLocehiliosan/yadm.git ~/source/other/yadm
git checkout 2.5.0 # or whatever the last tag is
ln -s ~/source/other/yadm/yadm ~/bin/yadm # on Win10, use LinkShellExtension to symlink instead
export PATH=$PATH:~/bin
yadm config local.os Win10 # only on Win10
yadm clone --bootstrap https://git.earnestma.xyz/earnestma/dotfiles
```

## Doom Emacs

My Doom Emacs config is stored [in a separate repo](https://git.earnestma.xyz/earnestma/doom.d) for now.

## `bin` - random scripts

## Windows-specific

- (I use Git Bash): `uname -s` produces something weird like `MINGW64_NT-10.0-19041`. Override by using `yadm config local.os Win10` instead.
- Environment Variables: `HOME C:\Users\earne` `GOPATH C:\Users\earne\go` `HUGO_ENV production` `PATH C:\Users\earne\scoop\shims C:\Users\earne\bin C:\Users\earne\.config\emacs\bin C:\Go\bin C:\Users\earne\go\bin`
- Pre-requisites:
  - [Git](https://git-scm.com/)
  - [Gpg4win](https://gpg4win.org/index.html)
  - Windows Terminal (for now, the best terminal emulator)
  - [Scoop](https://scoop.sh/) (Powershell: `Set-ExecutionPolicy RemoteSigned -scope CurrentUser` and then `iwr -useb get.scoop.sh | iex`)

