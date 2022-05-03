from libqtile.config import Key
from libqtile.lazy import lazy
from .vars import terminal

mod = "mod4"
alt = "mod1"

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
    Key([], "Print", lazy.spawn("flameshot gui"), desc="Open Flameshot GUI"),
    # Launch
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "space", lazy.spawn("rofi -show drun"), desc="rofi drun"),
    Key([mod, "shift"], "space", lazy.spawn("rofi -show calc"), desc="rofi calc"),
    Key([mod, "control"], "space", lazy.spawn("rofi -show run"), desc="rofi run"),
    Key([mod, "control"], "Return", lazy.group["scratchpad"].dropdown_toggle("term")),
]
