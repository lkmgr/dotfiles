fish_add_path ~/.local/bin
fish_add_path ~/.npm-global/bin
fish_add_path ~/go/bin
fish_add_path /usr/local/sbin

if type -q ruby
  fish_add_path /usr/local/lib/ruby/gems/3.1.0/bin
  fish_add_path ~/.gem/ruby/3.1.0/bin
end

if type -q aqua
  # fish_add_path ~/.local/share/aqua/bin
  fish_add_path "$AQUA_ROOT_DIR/bin"
end

# if type -q gem; and test -d (gem environment gemdir)
#   fish_add_path (gem environment gemdir)/bin
# end

# if type -q ruby; and type -q gem
#   fish_add_path (ruby -e 'puts Gem.user_dir')/bin
# end
