commonpaths=(
  ~/.local/bin
  ~/.npm-global/bin
  ~/go/bin
  /usr/local/sbin
)

for commonpath in $commonpaths; do
  [[ -d $commonpath ]] && path+=($commonpath)
done

path=('/opt/homebrew/opt/coreutils/libexec/gnubin' $path)

if command_exists aqua; then
  path+=("$AQUA_ROOT_DIR/bin")
fi

export PATH
