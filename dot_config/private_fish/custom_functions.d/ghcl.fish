function ghcl --description 'Clone GitHub repo into nested directory'
  git clone https://github.com/$argv.git $argv
end

