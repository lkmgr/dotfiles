import os

gap = 8
home = os.path.expanduser("~")
terminal = "kitty"
wallpaper = f"{home}/Pictures/Wallpapers/wallhaven-o32do5.jpg"

# Start flavours
theme_colors = [
    "#282C34",
    "#353B45",
    "#434956",
    "#505868",
    "#8D95A7",
    "#ABB2BF",
    "#CFD3DA",
    "#F0F2F4",

    "#E06C75",
    "#D19A66",
    "#E5C07B",
    "#98C379",
    "#56B6C2",
    "#61AFEF",
    "#C678DD",
    "#BE5046",
]

theme = dict(
    # bg=theme_colors[0],
    bg="#00000000",
    fg=theme_colors[6],
    active_border=theme_colors[8],
    inactive_border=theme_colors[4],
    active_border_stack=theme_colors[9],
    inactive_border_stack=theme_colors[3],
    bell_border=theme_colors[10],
    sep=theme_colors[8],
    # GroupBox
    gb_inactive=theme_colors[4],
    gb_active=theme_colors[7],
    gb_selected=theme_colors[8],
    gb_other_screen=theme_colors[11],
)

# End flavours

