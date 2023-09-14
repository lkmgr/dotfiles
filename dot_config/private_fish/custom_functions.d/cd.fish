function cd
    builtin cd $argv
    if type -q exa
        eza --all --group-directories-first --icons --color=always
    # if type -q lsd
    #     lsd --almost-all --group-dirs first --color always --icon always
    else
        ls -ah
    end
end
