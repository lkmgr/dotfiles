#!/usr/bin/env bash

# Wayland
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Lighter'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

# Xorg
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus"

