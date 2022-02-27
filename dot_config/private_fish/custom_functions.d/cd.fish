function cd
    builtin cd $argv
    if type -q exa
        exa --all --group-directories-first --icons
    else
        ls -ah
    end
end
