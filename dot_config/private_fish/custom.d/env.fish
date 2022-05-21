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

if type -q aqua
  set -gx AQUA_CONFIG ~/.config/aqua/aqua.yaml
  set -gx AQUA_GLOBAL_CONFIG ~/.config/aqua/aqua.yaml
  set -gx AQUA_ROOT_DIR ~/.local/share/aqua
end

if type -q volta
  set -gx VOLTA_HOME ~/.volta
end

set -gx GPG_TTY (tty)
set -gx SOPS_AGE_KEY_FILE ~/.config/sops/age/keys.txt

set -gx BAT_THEME base16-256

