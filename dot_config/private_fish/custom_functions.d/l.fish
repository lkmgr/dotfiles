function l --wraps lsd --description 'ls with eza'
    # if type -q lsd
    #     lsd --all --long $argv
    if type -q eza
        eza -al $argv
    else
        ls -alh $argv
    end
end
