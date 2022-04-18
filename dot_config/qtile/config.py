from modules.keys import keys  # noqa: F401
from modules.groups import groups  # noqa: F401
from modules.layouts import layouts, floating_layout  # noqa: F401
from modules.mouse import mouse  # noqa: F401
from modules.hooks import *  # noqa: F401,F403
from modules.screens import screens  # noqa: F401

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
