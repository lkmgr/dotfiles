# custom configs
for file in $__fish_config_dir/custom.d/*.fish
    source $file
end

# prepend custom function path to fish_function_path
if test -d $__fish_config_dir/custom_functions.d
    set -gp fish_function_path $__fish_config_dir/custom_functions.d
end

# if type -q asdf; and test -f /usr/local/opt/asdf/libexec/asdf.fish
#     source /usr/local/opt/asdf/libexec/asdf.fish
# end

if type -q starship
    starship init fish | source
end

# if type -q keychain
#     keychain --eval --quiet id_ed25519 | source
# end

if type -q direnv
    direnv hook fish | source
end
