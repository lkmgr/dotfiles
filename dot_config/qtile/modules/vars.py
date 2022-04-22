import os

gap = 5
home = os.path.expanduser("~")
terminal = "kitty"
wallpaper = f"{home}/Pictures/Wallpapers/wallhaven-o32do5.jpg"

# Catppuccin
# https://github.com/catppuccin/catppuccin
# https://github.com/catppuccin/style-guide
theme_colors = dict(
    black2="#1E1E2E",
    white="#D9E0EE",
    lavender="#C9CBFF",
    black4="#575268",
    yellow="#FAE3B0",
    peach="#F8BD96",
    gray1="#988BA2",
    rosewater="#F5E0DC",
    black1="#1A1826",
    blue="#96CDFB",
    black3="#302D41",
)

theme = dict(
    bg=theme_colors["black2"],
    fg=theme_colors["white"],
    active_border=theme_colors["lavender"],
    inactive_border=theme_colors["black4"],
    active_border_stack=theme_colors["blue"],
    inactive_border_stack=theme_colors["black3"],
    bell_border=theme_colors["yellow"],
    sep=theme_colors["peach"],
)

# Gruvbox
# theme = dict(
#     bg="#32302f",  # soft
#     fg="#d4be98",
#     red="#ea6962",
#     green="#a9b665",
#     yellow="#e78a4e",
#     blue="#7daea3",
#     magenta="#d3869b",
#     cyan="#89b482",
# )
