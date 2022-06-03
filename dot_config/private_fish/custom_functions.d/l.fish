function l --wraps lsd --description 'ls with lsd'
    if type -q lsd
        lsd --all --long $argv
    else
        ls -alh $argv
    end
end
