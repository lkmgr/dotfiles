if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
else if type -q vim
    set -gx EDITOR vim
    set -gx VISUAL vim
else
    set -gx EDITOR vi
    set -gx VISUAL vi
end

set -gx GPG_TTY (tty)
set -gx SOPS_AGE_KEY_FILE ~/.config/sops/age/keys.txt
