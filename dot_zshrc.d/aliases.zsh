alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'

alias aurins='paru --color always -Sl --aur | awk '\''{print $2($4=="" ? "" : " *")}'\'' | fzf --multi --ansi --preview "paru -Si {1}" --reverse | xargs -ro paru -S'
alias pacins='pacman --color always -Sl | awk '\''{print $2($4=="" ? "" : " *")}'\'' | fzf --multi --ansi --preview "paru -Si {1}" --reverse | xargs -ro sudo pacman -S'

export ABBR_QUIET=1

abbr -S g=git
abbr -S ga='git add'
abbr -S gc='git commit'
abbr -S gcl='git clone'
abbr -S gco='git checkout'
abbr -S gd='git diff'
abbr -S gdh='git diff HEAD'
abbr -S gf='git fetch'
abbr -S gl='git log'
abbr -S gp='git push'
abbr -S gpf='git push --force-with-lease'
abbr -S gpl='git pull'
abbr -S gr='git restore'
abbr -S grb='git rebase'
abbr -S grs='git restore --staged'
abbr -S gs='git status'

abbr -S chz='chezmoi'
abbr -S chzd='chezmoi diff'
abbr -S chza='chezmoi apply -v'
abbr -S chzad='chezmoi add'
abbr -S chze='chezmoi edit'
abbr -S chzcd='cd ~/.local/share/chezmoi'

abbr -S npr='npm run'

abbr -S v=nvim

abbr -S k=kubectl
abbr -S kie=kubie

if command_exists brew; then
  abbr -S bi='brew install'
  abbr -S bse='brew search'
  abbr -S bud='brew update'
  abbr -S bug='brew upgrade'
  abbr -S bli='brew list'
fi

if command_exists timew; then
  abbr -S tw='timew'
  abbr -S tws='timew summary :ids'
  abbr -S twsw='timew summary :ids :week'
  abbr -S twsm='timew summary :ids :month'
fi

if command_exists systemctl; then
  abbr -S sct='sudo systemctl'
  abbr -S sctu='systemctl --user'
  abbr -S jrc='sudo journalctl'
fi

if command_exists docker; then
  abbr -S dco='docker compose'
  abbr -S dcou='docker compose up -d && docker compose logs -f'
fi

