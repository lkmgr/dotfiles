abbr g git
abbr ga 'git add'
abbr gc 'git commit'
abbr gcl 'git clone'
abbr gco 'git checkout'
abbr gd 'git diff'
abbr gdh 'git diff HEAD'
abbr gf 'git fetch'
abbr gl 'git log'
abbr gp 'git push'
abbr gpf 'git push --force-with-lease'
abbr gpl 'git pull'
abbr gr 'git restore'
abbr grb 'git rebase'
abbr grs 'git restore --staged'
abbr gs 'git status'

abbr chz 'chezmoi'
abbr chzd 'chezmoi diff'
abbr chza 'chezmoi apply -v'
abbr chzad 'chezmoi add'
abbr chze 'chezmoi edit'
abbr chzcd 'cd ~/.local/share/chezmoi'

abbr npr 'npm run'

abbr v nvim

abbr k kubectl
abbr kie kubie

# Expand .. to cd .., ... to cd ../../, ...
abbr --add dotdot --regex '^\.\.+$' --function multicd

# Expand !! to last history item
abbr -a !! --position anywhere --function last_history_item

if type -q brew
  abbr bi 'brew install'
  abbr bse 'brew search'
  abbr bud 'brew update'
  abbr bug 'brew upgrade'
  abbr bli 'brew list'
end

if type -q timew
  abbr tw 'timew'
  abbr tws 'timew summary :ids'
  abbr twsw 'timew summary :ids :week'
  abbr twsm 'timew summary :ids :month'
end

if type -q systemctl
  abbr sct 'sudo systemctl'
  abbr sctu 'systemctl --user'
  abbr jrc 'sudo journalctl'
end

if type -q docker
  abbr dco 'docker compose'
  abbr dcou 'docker compose up -d && docker compose logs -f'
end

