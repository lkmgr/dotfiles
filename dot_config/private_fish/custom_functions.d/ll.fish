function ll --wraps lsd
    if type -q lsd
        lsd --almost-all $argv
    else
        ls -ah $argv
    end
end
