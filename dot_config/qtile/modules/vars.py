import os

gap = 5
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
    bg=theme_colors[0],
    fg=theme_colors[5],
    active_border=theme_colors[8],
    inactive_border=theme_colors[4],
    active_border_stack=theme_colors[9],
    inactive_border_stack=theme_colors[3],
    bell_border=theme_colors[10],
    sep=theme_colors[8],
)

# End flavours

# Catppuccin
# https://github.com/catppuccin/catppuccin
# https://github.com/catppuccin/style-guide
# theme_colors = dict(
#     black2="#1E1E2E",
#     white="#D9E0EE",
#     lavender="#C9CBFF",
#     black4="#575268",
#     yellow="#FAE3B0",
#     peach="#F8BD96",
#     gray1="#988BA2",
#     rosewater="#F5E0DC",
#     black1="#1A1826",
#     blue="#96CDFB",
#     black3="#302D41",
# )
#
# theme = dict(
#     bg=theme_colors["black2"],
#     fg=theme_colors["white"],
#     active_border=theme_colors["lavender"],
#     inactive_border=theme_colors["black4"],
#     active_border_stack=theme_colors["blue"],
#     inactive_border_stack=theme_colors["black3"],
#     bell_border=theme_colors["yellow"],
#     sep=theme_colors["peach"],
# )

