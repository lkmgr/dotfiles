source $__fish_config_dir/colors/catppuccin-mocha-global-colors.fish
source $__fish_config_dir/colors/catppuccin-mocha.fish

if test -f /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

source $__fish_config_dir/custom.d/paths.fish
source $__fish_config_dir/custom.d/abbrs.fish
source $__fish_config_dir/custom.d/env.fish
source $__fish_config_dir/custom.d/fzf.fish

# prepend custom function path to fish_function_path
if test -d $__fish_config_dir/custom_functions.d
    set -gp fish_function_path $__fish_config_dir/custom_functions.d
end

if type -q starship
    starship init fish | source
end

# if type -q keychain
#     keychain --eval --quiet id_ed25519 | source
# end

if type -q atuin
    atuin init fish --disable-up-arrow | source
end

if type -q mise
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
end
