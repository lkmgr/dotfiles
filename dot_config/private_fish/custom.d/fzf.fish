if type -q exa
    set fzf_preview_dir_cmd exa --all --group-directories-first --icons --color=always
end

set fzf_fd_opts --hidden --exclude=.git --exclude=node_modules --exclude=.cache

fzf_configure_bindings --directory=\cf --git_log=\e\cl --git_status=\cs --history=\cr --variables=\cv --processes=\e\cp
