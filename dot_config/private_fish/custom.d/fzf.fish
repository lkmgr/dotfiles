# if type -q exa
#     set fzf_preview_dir_cmd exa --all --group-directories-first --icons --color=always
# end
if type -q lsd
    set fzf_preview_dir_cmd lsd --almost-all --group-dirs first --color always --icon always
end

# excludes in ~/.config/fd/ignore
set fzf_fd_opts --hidden

fzf_configure_bindings --directory=\ef --git_log=\e\cl --git_status=\es --history=\er --variables=\ev --processes=\e\cp
