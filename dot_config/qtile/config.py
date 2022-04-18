import subprocess
import os

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy


home = os.path.expanduser("~")
wallpaper = f"{home}/Pictures/Wallpapers/wallhaven-o32do5.jpg"

mod = "mod4"
alt = "mod1"
terminal = "kitty"

border_width = 5
gap = 5
widget_padding = 18


keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    # Layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Next layout"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Previous layout"),
    # Groups
    Key([mod], "bracketleft", lazy.screen.prev_group(), desc="Move to group on the left"),
    Key([mod], "bracketright", lazy.screen.next_group(), desc="Move to group on the right"),
    Key([mod], "grave", lazy.screen.toggle_group(), desc="Move to the last visited group"),
    # Screens
    Key([mod], "comma", lazy.to_screen(1), desc="Focus left Screen"),
    Key([mod], "period", lazy.to_screen(0), desc="Focus right Screen"),
    # Window state
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    # Media
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t"), desc="Toggle Audio Mute"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 3"), desc="Decrease Volume"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 3"), desc="Increase Volume"),
    Key([mod], "F9", lazy.spawn("playerctl play-pause"), desc="Play/Pause Media"),
    Key([mod], "F10", lazy.spawn("playerctl previous"), desc="Previous Media"),
    Key([mod], "F11", lazy.spawn("playerctl next"), desc="Next Media"),
    # System
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "control", "shift"], "l", lazy.spawn("betterlockscreen -l blur"), desc="Lock Screen"),
    # Launch
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "space", lazy.spawn("rofi -show drun"), desc="rofi drun"),
    Key([mod, "shift"], "space", lazy.spawn("rofi -show calc"), desc="rofi calc"),
    Key([mod, "control"], "space", lazy.spawn("rofi -show run"), desc="rofi run"),
    Key([mod, "control"], "Return", lazy.group["scratchpad"].dropdown_toggle("term")),
]

usable_group_keys = [i for i in "123456789"]
# groups = [Group(i) for i in "123456789"]
groups = [Group(i, layout="columns") for i in "12345"]
groups.extend([Group(i, layout="column") for i in "6789"])

for i, group in enumerate(groups):
    keys.append(
        Key(
            [mod],
            usable_group_keys[i],
            lazy.group[group.name].toscreen(),
            desc="Switch to group {}".format(group.name),
        ),
    )
    keys.append(
        Key(
            [mod, "shift"],
            usable_group_keys[i],
            lazy.window.togroup(group.name),
            desc="move focused window to group {}".format(group.name),
        ),
    )

groups.extend(
    [
        ScratchPad(
            "scratchpad",
            [DropDown("term", "kitty", opacity=1.0, height=0.4, width=0.6, x=0.2, y=0.05)],
        )
    ]
)

layouts = [
    # layout.MonadTall(border_width=4, margin=10, ratio=0.65),
    layout.Columns(
        border_focus="#881111",
        border_focus_stack="#881111",
        border_normal="#220000",
        border_normal_stack="#220000",
        border_on_single=True,
        border_width=border_width,
        grow_amount=5,
        insert_position=1,
        margin=gap,
        margin_on_single=gap,
    ),
    layout.Columns(
        name="column",
        num_columns=1,
        border_focus="#881111",
        border_focus_stack="#881111",
        border_normal="#220000",
        border_normal_stack="#220000",
        border_on_single=True,
        border_width=border_width,
        grow_amount=5,
        insert_position=1,
        margin=gap,
        margin_on_single=gap,
    ),
    layout.Max(
        border_focus="#881111",
        border_normal="#220000",
        border_width=border_width,
        margin=gap,
    ),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(
        border_focus="#881111",
        border_normal="#220000",
        border_width=border_width,
        margin=gap,
        ratio=0.65,
        single_border_width=border_width,
        single_margin=gap,
    ),
    # layout.MonadWide(),
    # layout.RatioTile(ratio=1.77778),
    # layout.Tile(),
    # layout.TreeTab(),
    layout.VerticalTile(
        border_focus="#881111",
        border_normal="#220000",
        border_width=border_width,
        margin=gap,
    ),
    # layout.Zoomy(),
]

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


shades = ["#1A237E", "#283593", "#303F9F", "#3949AB", "#3F51B5", "#5C6BC0", "#7986CB", "#9FA8DA"]


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

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]


@hook.subscribe.startup
def start():
    subprocess.run([f"{home}/.config/qtile/autostart.sh"])


floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        # Match(wm_class="confirmreset"),  # gitk
        # Match(wm_class="makebranch"),  # gitk
        # Match(wm_class="maketag"),  # gitk
        # Match(wm_class="ssh-askpass"),  # ssh-askpass
        # Match(title="branchdialog"),  # gitk
        # Match(title="pinentry"),  # GPG key password entry
    ],
    border_focus="#881111",
    border_normal="#220000",
    border_width=border_width,
    fullscreen_border_width=border_width,
    max_border_width=border_width,
)


dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
