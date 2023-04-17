export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'

if command_exists nvim; then
  export EDITOR=nvim
  export VISUAL=nvim
elif command_exists vim; then
  export EDITOR=vim
  export VISUAL=vim
else
  export EDITOR=vi
  export VISUAL=vi
fi

export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"

if command_exists aqua; then
  export AQUA_CONFIG="$HOME/.config/aqua/aqua.yaml"
  export AQUA_GLOBAL_CONFIG="$HOME/.config/aqua/aqua.yaml"
  export AQUA_ROOT_DIR="$HOME/.local/share/aqua"
fi
