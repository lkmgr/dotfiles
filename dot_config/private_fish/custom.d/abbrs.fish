abbr g git
abbr ga 'git add'
abbr gs 'git status'
abbr gc 'git commit'
abbr gco 'git checkout'
abbr gp 'git push'
abbr gpf 'git push --force-with-lease'
abbr gpl 'git pull'
abbr gcl 'git clone'
abbr gf 'git fetch'
abbr gdiff 'git diff'
abbr glog 'git log'
abbr grb 'git rebase'

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
end

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
