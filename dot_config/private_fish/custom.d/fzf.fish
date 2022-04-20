# if type -q exa
#     set fzf_preview_dir_cmd exa --all --group-directories-first --icons --color=always
# end
if type -q lsd
    set fzf_preview_dir_cmd lsd --almost-all --group-dirs first --color always --icon always
end

# excludes in ~/.config/fd/ignore
set fzf_fd_opts --hidden

fzf_configure_bindings --directory=\ef --git_log=\e\cl --git_status=\es --history=\er --variables=\ev --processes=\e\cp

set -Ux FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

