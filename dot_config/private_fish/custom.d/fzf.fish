# if type -q exa
#     set fzf_preview_dir_cmd exa --all --group-directories-first --icons --color=always
# end
if type -q lsd
    set fzf_preview_dir_cmd lsd --almost-all --group-dirs first --color always --icon always
end

# excludes in ~/.config/fd/ignore
set fzf_fd_opts --hidden

fzf_configure_bindings --directory=\ef --git_log=\e\cl --git_status=\es --history=\er --variables=\ev --processes=\e\cp

set -gx FZF_DEFAULT_OPTS "--cycle --layout=reverse --border=rounded --height=80% --preview-window=wrap"
set -a FZF_DEFAULT_OPTS "--scroll-off=4 --prompt=' ' --pointer='❯' --marker='*'"
set -a FZF_DEFAULT_OPTS "--color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"
set -a FZF_DEFAULT_OPTS "--color=fg:$color06,header:$color0D,info:$color0A,pointer:$color0C"
set -a FZF_DEFAULT_OPTS "--color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

