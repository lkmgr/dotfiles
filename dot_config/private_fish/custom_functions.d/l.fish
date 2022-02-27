function l --wraps exa --description 'ls with exa'
    if type -q exa
        exa --long --color-scale --icons --all --all --group --header --group-directories-first $argv
    else
        ls -alh $argv
    end
end
