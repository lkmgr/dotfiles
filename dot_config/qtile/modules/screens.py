import subprocess
from libqtile import widget, bar
from libqtile.config import Screen
from libqtile.lazy import lazy
from .vars import gap, home, wallpaper, theme

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=19,
    padding=10,
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


def sep_qtile():
    return widget.Sep(background=theme["bg"], foreground=theme["sep"], linewidth=3, padding=12, size_percent=60)


def get_pamixer_volume():
    return subprocess.check_output(["pamixer", "--get-volume-human"], universal_newlines=True).strip()


screen1 = Screen(
    top=bar.Bar(
        [
            # sep_circle_l(theme["bg"]),
            widget.GroupBox(
                active=theme["gb_active"],
                background=theme["bg"],
                block_highlight_text_color=theme["gb_active"],
                borderwidth=5,
                disable_drag=True,
                foreground=theme["fg"],
                highlight_color="#00000000",
                highlight_method="block",
                inactive=theme["gb_inactive"],
                margin_x=1,
                margin_y=4,
                other_current_screen_border=f'{theme["gb_other_screen"]}66',
                other_screen_border=f'{theme["gb_other_screen"]}99',
                padding=8,
                this_current_screen_border=theme["gb_selected"],
                this_screen_border=f'{theme["gb_selected"]}99',
                urgent_border="#FF0000",
                urgent_text="#FF0000",
                use_mouse_wheel=False,
            ),
            sep_qtile(),
            # widget.Prompt(),
            # widget.CurrentScreen(background=theme["bg"], foreground=theme["fg"]),
            # widget.CurrentLayoutIcon(background=theme["bg"], foreground=theme["fg"], scale=0.5, padding=0),
            widget.CurrentLayout(background=theme["bg"], foreground=theme["fg"]),
            sep_qtile(),
            # widget.WindowName(),
            # sep_circle_r(theme["bg"]),
            # widget.Spacer(length=30),
            # sep_circle_l(theme["bg"]),
            widget.WindowTabs(
                background=theme["bg"],
                foreground=theme["fg"],
                # selected=(f'<span foreground="{theme["magenta"]}"><b>[ ', " ]</b></span>"),
                selected=("<b>[ ", " ]</b>"),
            ),
            # sep_circle_r(theme["bg"]),
            # widget.Spacer(length=30),
            # sep_circle_l(theme["bg"]),
            widget.CheckUpdates(
                background=theme["bg"],
                foreground=theme["fg"],
                colour_have_updates=theme["fg"],
                colour_no_updates=theme["fg"],
                distro="Arch_checkupdates",
                update_interval=300,
            ),
            sep_qtile(),
            widget.CPU(background=theme["bg"], foreground=theme["fg"], format="CPU {load_percent}%", update_interval=2),
            sep_qtile(),
            widget.Memory(
                background=theme["bg"], foreground=theme["fg"], format="RAM {MemPercent:.0f}%", update_interval=3
            ),
            sep_qtile(),
            widget.Net(background=theme["bg"], foreground=theme["fg"], format="NET {down} ↓↑ {up}", prefix="M"),
            sep_qtile(),
            widget.NvidiaSensors(background=theme["bg"], foreground=theme["fg"], format="GPU {temp}°C"),
            sep_qtile(),
            widget.Bluetooth(
                background=theme["bg"],
                foreground=theme["fg"],
                fmt="BT {}",
                hci="/dev_38_18_4C_59_FD_55",
                mouse_callbacks={
                    "Button3": lazy.spawn(f"{home}/.local/bin/bluetooth-connect 38:18:4C:59:FD:55"),
                },
            ),
            # widget.Systray(),
            sep_qtile(),
            widget.GenPollText(
                background=theme["bg"],
                foreground=theme["fg"],
                func=get_pamixer_volume,
                fmt="VOL {}",
                update_interval=0.5,
            ),
            sep_qtile(),
            widget.Clock(background=theme["bg"], foreground=theme["fg"], format="%d.%m.%Y %H:%M:%S"),
            # sep_circle_r(theme["bg"]),
        ],
        48,
        background="#00000000",
        margin=[0, 10, 0, 10],
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
            # sep_circle_l(theme["bg"]),
            widget.GroupBox(
                active=theme["gb_active"],
                background=theme["bg"],
                block_highlight_text_color=theme["gb_active"],
                borderwidth=5,
                disable_drag=True,
                foreground=theme["fg"],
                highlight_color="#00000000",
                highlight_method="block",
                inactive=theme["gb_inactive"],
                margin_x=1,
                margin_y=4,
                other_current_screen_border=f'{theme["gb_other_screen"]}66',
                other_screen_border=f'{theme["gb_other_screen"]}99',
                padding=8,
                this_current_screen_border=theme["gb_selected"],
                this_screen_border=f'{theme["gb_selected"]}99',
                urgent_border="#FF0000",
                urgent_text="#FF0000",
                use_mouse_wheel=False,
            ),
            sep_qtile(),
            # widget.CurrentScreen(background=theme["bg"], foreground=theme["fg"]),
            # widget.CurrentLayoutIcon(background=theme["bg"], foreground=theme["fg"], scale=0.5, padding=0),
            widget.CurrentLayout(background=theme["bg"], foreground=theme["fg"]),
            sep_qtile(),
            # sep_circle_r(theme["bg"]),
            # widget.Spacer(length=20),
            # sep_circle_l(theme["bg"]),
            # widget.WindowName(background=theme["bg"]),
            widget.WindowTabs(
                background=theme["bg"],
                foreground=theme["fg"],
                # selected=(f'<span foreground="{theme["magenta"]}"><b>[ ', " ]</b></span>"),
                selected=("<b>[ ", " ]</b>"),
            ),
            # sep_circle_r(theme["bg"]),
            # widget.Spacer(length=20),
            # sep_circle_l(theme["bg"]),
            widget.Clock(background=theme["bg"], foreground=theme["fg"], format="%d.%m.%Y %H:%M:%S"),
            # sep_circle_r(theme["bg"]),
        ],
        42,
        background="#00000000",
        margin=[0, 10, 0, 10],
    ),
    left=bar.Gap(gap),
    right=bar.Gap(gap),
    bottom=bar.Gap(gap),
    wallpaper=wallpaper,
    wallpaper_mode="fill",
)


screens = [screen1, screen2]
