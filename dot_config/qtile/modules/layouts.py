from libqtile import layout
from .vars import gap, theme

border_width = 6
border_focus = theme["active_border"]
border_normal = theme["inactive_border"]
border_focus_stack = theme["active_border_stack"]
border_normal_stack = theme["inactive_border_stack"]

layouts = [
    # layout.MonadTall(border_width=4, margin=10, ratio=0.65),
    layout.Columns(
        border_focus=border_focus,
        border_focus_stack=border_focus_stack,
        border_normal=border_normal,
        border_normal_stack=border_normal_stack,
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
        border_focus=border_focus,
        border_focus_stack=border_focus_stack,
        border_normal=border_normal,
        border_normal_stack=border_normal_stack,
        border_on_single=True,
        border_width=border_width,
        grow_amount=5,
        insert_position=1,
        margin=gap,
        margin_on_single=gap,
    ),
    layout.Max(
        border_focus=border_focus,
        border_normal=border_normal,
        border_width=border_width,
        margin=gap,
    ),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(
        border_focus=border_focus,
        border_normal=border_normal,
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
        border_focus=border_focus,
        border_normal=border_normal,
        border_width=border_width,
        margin=gap,
    ),
    # layout.Zoomy(),
]

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
    border_focus=border_focus,
    border_normal=border_normal,
    border_width=border_width,
    fullscreen_border_width=border_width,
    max_border_width=border_width,
)
