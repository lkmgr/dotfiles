if test $TERM = xterm-kitty
    function ssh --wraps ssh --description 'kitty ssh'
        kitty +kitten ssh $argv
    end
end
