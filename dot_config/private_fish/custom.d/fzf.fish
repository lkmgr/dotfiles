if type -q exa
    set fzf_preview_dir_cmd exa --all --group-directories-first --icons --color=always
end

set fzf_fd_opts --hidden --exclude=.git --exclude=node_modules --exclude=.cache

fzf_configure_bindings --directory=\ef --git_log=\e\cl --git_status=\es --history=\er --variables=\ev --processes=\e\cp
