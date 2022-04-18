from libqtile.config import Group, Key, ScratchPad, DropDown
from libqtile.lazy import lazy
from .keys import keys, mod

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
