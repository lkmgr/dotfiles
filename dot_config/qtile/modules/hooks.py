import subprocess
from libqtile import hook
from .vars import home


@hook.subscribe.startup
def hook_startup():
    subprocess.run([f"{home}/.config/qtile/autostart.sh"])
