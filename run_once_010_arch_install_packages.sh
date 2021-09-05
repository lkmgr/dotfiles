{{ if and (eq .chezmoi.os "linux") (eq .chezmoi.osRelease.id "arch") -}}
#!/bin/sh

PKGS="zsh fzf exa fd bat age zoxide"
pacman -Qi $PKGS > /dev/null || sudo pacman -Syu --needed --noconfirm $PKGS
{{ end -}}
