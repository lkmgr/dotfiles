export LS_COLORS="$(vivid generate catppuccin-macchiato)"

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

export GPG_TTY=$TTY
export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"

if command_exists aqua; then
  export AQUA_CONFIG="$HOME/.config/aqua/aqua.yaml"
  export AQUA_GLOBAL_CONFIG="$HOME/.config/aqua/aqua.yaml"
  export AQUA_ROOT_DIR="$HOME/.local/share/aqua"
fi

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
