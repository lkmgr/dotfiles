if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q starship
  starship init fish | source
end

abbr g 'git'
abbr ga 'git add'
abbr gs 'git status'
abbr gc 'git commit'
abbr gco 'git checkout'
abbr gp 'git push'
abbr gpl 'git pull'
abbr gcl 'git clone'
abbr gf 'git fetch'
abbr gdiff 'git diff'
abbr glog 'git log'

abbr bi 'brew install'
abbr bse 'brew search'
abbr bud 'brew update'
abbr bug 'brew upgrade'
abbr bli 'brew list'

abbr npr 'npm run'

