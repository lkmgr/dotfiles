function ll --wraps lsd
    # if type -q lsd
    #     lsd --almost-all $argv
    if type -q eza
        eza -a $argv
    else
        ls -ah $argv
    end
end
