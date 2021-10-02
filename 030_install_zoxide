#!/bin/sh

{{ if eq .chezmoi.os "linux" }}

{{ if ne .chezmoi.osRelease.id "arch" }}
command -v z > /dev/null || curl -sS https://webinstall.dev/zoxide | bash
{{ end }}

{{ else if eq .chezmoi.os "darwin" }}
command -v z > /dev/null || brew install zoxide

{{ end }}
