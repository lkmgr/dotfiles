function ll --wraps exa
    if type -q exa
        exa --all --group-directories-first --icons $argv
    else
        ls -ah $argv
    end
end
