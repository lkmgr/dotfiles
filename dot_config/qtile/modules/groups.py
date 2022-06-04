from libqtile.config import Group, Key, ScratchPad, DropDown, Match, Rule
from libqtile.lazy import lazy
from .keys import keys, mod

usable_group_keys = [i for i in "123456789"]
# groups = [Group(i) for i in "123456789"]
# groups = [Group(i, layout="columns") for i in "12345"]
# groups.extend([Group(i, layout="column") for i in "6789"])

# def class_matches(classes):
#     return [Match(wm_class=[x]) for x in classes]

groups = [
    Group("1", layout="columns", matches=[Match(wm_class=["firefox"])]),
    Group("2", layout="columns"),
    Group("3", layout="columns", matches=[Match(wm_class=["Steam"])]),
    Group("4", layout="columns", matches=[Match(wm_class=["Lens"])]),
    Group("5", layout="columns", matches=[Match(wm_class=["discord"])]),
    Group("6", layout="column", matches=[Match(wm_class=["chromium"])]),
    Group("7", layout="column", matches=[Match(wm_class=["Thunderbird"])]),
    Group("8", layout="column"),
    Group("9", layout="column"),
]

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
