function l --wraps lsd --description 'ls with lsd'
    # if type -q exa
        # exa --long --color-scale --icons --all --all --group --header --group-directories-first $argv
    if type -q lsd
        lsd --all --long --group-dirs first --color always --icon always $argv
    else
        ls -alh $argv
    end
end
