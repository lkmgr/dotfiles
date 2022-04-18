import subprocess
from libqtile import widget, bar
from libqtile.config import Screen
from libqtile.lazy import lazy
from .vars import gap, home, wallpaper, theme, shades

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=18,
    padding=8,
)
extension_defaults = widget_defaults.copy()


def sep_circle_l(fg_color, bg_color=None):
    return widget.TextBox(text="\ue0b6", padding=0, fontsize=38, background=bg_color, foreground=fg_color)


def sep_circle_r(fg_color, bg_color=None):
    return widget.TextBox(text="\ue0b4", padding=0, fontsize=38, background=bg_color, foreground=fg_color)


def sep_triangle_l(fg_color, bg_color=None):
    return widget.TextBox(text="\ue0b8 ", padding=0, fontsize=42, background=bg_color, foreground=fg_color)


def sep_triangle_r(fg_color, bg_color=None):
    return widget.TextBox(text="\ue0ba ", padding=0, fontsize=42, background=bg_color, foreground=fg_color)


def sep_arrow_l(fg_color, bg_color=None):
    return widget.TextBox(text="\ue0b2", padding=0, fontsize=36, background=bg_color, foreground=fg_color)


def sep_arrow_r(fg_color, bg_color=None):
    return widget.TextBox(text="\ue0b0", padding=0, fontsize=36, background=bg_color, foreground=fg_color)


def get_pamixer_volume():
    return subprocess.check_output(["pamixer", "--get-volume-human"], universal_newlines=True).strip()


screen1 = Screen(
    top=bar.Bar(
        [
            widget.GroupBox(background=shades[0], foreground="#ffffff"),
            sep_circle_r(shades[0], shades[1]),
            # widget.Prompt(),
            widget.CurrentScreen(background=shades[1]),
            widget.CurrentLayoutIcon(background=shades[1], scale=0.5, padding=0),
            widget.CurrentLayout(background=shades[1]),
            sep_circle_r(shades[1]),
            widget.WindowTabs(selected=("<b>[ ", " ]</b>")),
            # widget.WindowName(),
            widget.Spacer(),
            # widget.Chord(
            #     chords_colors={
            #         "launch": ("#ff0000", "#ffffff"),
            #     },
            #     name_transform=lambda name: name.upper(),
            # ),
            sep_circle_l(shades[7]),
            widget.CheckUpdates(background=shades[7], distro="Arch_checkupdates", update_interval=300),
            sep_circle_l(shades[6], shades[7]),
            widget.CPU(background=shades[6], format="CPU {load_percent}%", update_interval=2),
            sep_circle_l(shades[5], shades[6]),
            widget.Memory(background=shades[5], format="RAM {MemPercent:.0f}%", update_interval=3),
            sep_circle_l(shades[4], shades[5]),
            widget.Net(background=shades[4], format="NET {down} ↓↑ {up}", prefix="M"),
            sep_circle_l(shades[3], shades[4]),
            widget.NvidiaSensors(background=shades[3], format="GPU {temp}°C"),
            sep_circle_l(shades[2], shades[3]),
            widget.Bluetooth(
                background=shades[2],
                fmt="BT {}",
                hci="/dev_38_18_4C_59_FD_55",
                mouse_callbacks={
                    "Button3": lazy.spawn(f"{home}/.local/bin/bluetooth-connect 38:18:4C:59:FD:55"),
                },
            ),
            # widget.Systray(background=shades[1]),
            # widget.Volume(
            #     background=shades[1],
            #     fmt="VOL {}",
            #     get_volume_command="pamixer --get-volume",
            #     mute_command="pamixer -t",
            #     update_interval=0.5,
            #     volume_app="pavucontrol",
            #     volume_down_command="pamixer -d 3",
            #     volume_up_command="pamixer -i 3",
            # ),
            sep_circle_l(shades[1], shades[2]),
            widget.GenPollText(background=shades[1], func=get_pamixer_volume, fmt="VOL {}", update_interval=0.5),
            sep_circle_l(shades[0], shades[1]),
            widget.Clock(background=shades[0], format="%d.%m.%Y %H:%M:%S"),
        ],
        42,
        # opacity=0,
        background="#282C34",
        # border_width=[0, 0, 2, 0],  # Draw top and bottom borders
        # border_color="#00ff00",  # Borders are magenta
        margin=[0, 0, gap, 0],
    ),
    left=bar.Gap(gap),
    right=bar.Gap(gap),
    bottom=bar.Gap(gap),
    wallpaper=wallpaper,
    wallpaper_mode="fill",
)

screen2 = Screen(
    top=bar.Bar(
        [
            widget.GroupBox(),
            widget.WindowName(),
            widget.CurrentLayout(),
            widget.Clock(format="%d.%m.%Y %H:%M:%S"),
        ],
        size=42,
        margin=[0, 0, gap, 0],
    ),
    left=bar.Gap(gap),
    right=bar.Gap(gap),
    bottom=bar.Gap(gap),
    wallpaper=wallpaper,
    wallpaper_mode="fill",
)


screens = [screen1, screen2]
