fish_add_path ~/.local/bin
fish_add_path ~/.npm-global/bin
fish_add_path ~/go/bin
fish_add_path /usr/local/sbin

if type -q ruby
  fish_add_path /usr/local/lib/ruby/gems/3.1.0/bin
  fish_add_path ~/.gem/ruby/3.1.0/bin
end

if type -q aqua
  # add to end of global PATH
  fish_add_path -aP "$AQUA_ROOT_DIR/bin"
end

fish_add_path ~/.krew/bin

# Mac Only
fish_add_path ~/.rd/bin
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# if type -q gem; and test -d (gem environment gemdir)
#   fish_add_path (gem environment gemdir)/bin
# end

# if type -q ruby; and type -q gem
#   fish_add_path (ruby -e 'puts Gem.user_dir')/bin
# end
