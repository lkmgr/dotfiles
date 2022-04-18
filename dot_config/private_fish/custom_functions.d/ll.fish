function ll --wraps lsd
    # if type -q exa
    #     exa --all --group-directories-first --icons $argv
    if type -q lsd
        lsd --almost-all --group-dirs first --color always --icon always $argv
    else
        ls -ah $argv
    end
end
