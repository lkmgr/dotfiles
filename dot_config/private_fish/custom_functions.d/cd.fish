functions -c cd orig_cd
function cd
    orig_cd $argv
    if type -q exa
        exa --all --group-directories-first --icons
    else
        ls -ah
    end
end
