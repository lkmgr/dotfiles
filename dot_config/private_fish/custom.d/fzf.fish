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
set -a FZF_DEFAULT_OPTS "--color=fg:$colorfg,bg:$colorbg,hl:$color04"
set -a FZF_DEFAULT_OPTS "--color=fg+:$colorfg,bg+:$color08,hl+:$color04"
set -a FZF_DEFAULT_OPTS "--color=info:$color15,prompt:$color02,pointer:$color05"
set -a FZF_DEFAULT_OPTS "--color=marker:$color05,spinner:$color15,header:$color12"

