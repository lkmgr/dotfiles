set -l darkgray 8D95A7

# Syntax Highlighting
set -g fish_color_normal {color5.strip}
set -g fish_color_command {color4.strip}
set -g fish_color_param {color3.strip}
set -g fish_color_keyword {color1.strip}
set -g fish_color_quote {color2.strip}
set -g fish_color_redirection {color5.strip}
set -g fish_color_end {color6.strip}
set -g fish_color_error {color1.strip}
set -g fish_color_gray {color7.strip}
set -g fish_color_selection --background={color8.strip}
set -g fish_color_search_match --background={color8.strip}
set -g fish_color_operator {color5.strip}
set -g fish_color_escape {color3.strip}
set -g fish_color_autosuggestion $darkgray
set -g fish_color_cancel {color1.strip}

# Prompt
set -g fish_color_cwd {color3.strip}
set -g fish_color_user {color6.strip}
set -g fish_color_host {color4.strip}

# Completion Pager
set -g fish_pager_color_progress {color7.strip}
set -g fish_pager_color_prefix {color5.strip}
set -g fish_pager_color_completion {color5.strip}
set -g fish_pager_color_description {color7.strip}
