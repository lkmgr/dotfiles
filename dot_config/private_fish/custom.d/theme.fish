set -l color0 282C34
set -l color1 E06C75
set -l color2 98C379
set -l color3 E5C07B
set -l color4 61AFEF
set -l color5 C678DD
set -l color6 56B6C2
set -l color7 ABB2BF

set -l color8 505868
set -l color15 F0F2F4

set -l darkgray 8D95A7

# Syntax Highlighting
set -g fish_color_normal $color5
set -g fish_color_command $color4
set -g fish_color_param $color3
set -g fish_color_keyword $color1
set -g fish_color_quote $color2
set -g fish_color_redirection $color5
set -g fish_color_end $color6
set -g fish_color_error $color1
set -g fish_color_gray $color7
set -g fish_color_selection --background=$color8
set -g fish_color_search_match --background=$color8
set -g fish_color_operator $color5
set -g fish_color_escape $color3
set -g fish_color_autosuggestion $darkgray
set -g fish_color_cancel $color1

# Prompt
set -g fish_color_cwd $color3
set -g fish_color_user $color6
set -g fish_color_host $color4

# Completion Pager
set -g fish_pager_color_progress $color7
set -g fish_pager_color_prefix $color5
set -g fish_pager_color_completion $color5
set -g fish_pager_color_description $color7

