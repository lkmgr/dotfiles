function cd
    builtin cd $argv
    # if type -q exa
    #     exa --all --group-directories-first --icons
    if type -q lsd
        lsd --all --group-dirs first --color always --icon always
    else
        ls -ah
    end
end
