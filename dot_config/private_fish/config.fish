# if status is-interactive
    # Commands to run in interactive sessions can go here
# end

# for file in $__fish_config_fir/custom.d/*.fish
#   source $file
# end

function l --wraps exa --description 'ls with exa'
  if type -q exa
    exa --long --color-scale --icons --all --all --group --header --group-directories-first $argv
  else
    ls -alh $argv
  end
end

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GPG_TTY (tty)

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

abbr v 'nvim'

abbr k 'kubectl'
abbr kie 'kubie'

if type -q starship
  starship init fish | source
end

