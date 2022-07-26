import keyboard
import themes
import widgets
import os
import re
import socket
import subprocess 

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
font_family = themes.font
font_size = themes.font_size
icon_size = themes.icon_size

keys = keyboard.shortcuts(mod)
theme = themes.current_theme

# Initialize groups
groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7"]
#group_labels = ["1", "2", "3", "4", "5", "6", "7"]
group_labels = ["I", "II", "III", "IV", "V", "VI", "VII"]
#group_labels = ["", "", "", "", "", "", ""]
#group_labels = ["", "", "", "", "", "ﱮ", ""]
group_layouts = ["max", "monadtall", "monadtall", "max", "max", "floating", "floating"]

for i in range(len(group_names)):
    groups.append(
            Group(
                name=group_names[i],
                layout=group_layouts[i].lower(),
                label=group_labels[i],
                ))

# Group behaviour
for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
                ),
        ]
    )

# Layouts and layout theme
layout_theme = {
        "margin": themes.window_margin,
        "border_width": 2,
        "border_focus": theme.windowfocus,
        "border_normal": theme.background
        }

layout_theme_max = {
        "margin": 20,
        "border_width": 2,
        "border_focus": theme.windowfocus,
        "border_normal": theme.background
        }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Floating(**layout_theme),
]

# Widgets, bar and screens
widget_defaults = dict(
    font=font_family,
    fontsize=font_size,
    padding=5
)

extension_defaults = widget_defaults.copy()

placeholder = bar.Bar(
            [],
            48,
            opacity = 0,
        )

topWidgetBar = bar.Bar(
            widgets.topBarWidgets,
            themes.bar_size,
            background = theme.background,
            foreground = theme.foreground,
            #border_width = 2,
            #border_color = theme.windowfocus,
            opacity = 1,
        )

screens = [
    Screen(
            top=placeholder,
        ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

floating_types = ["notification", "toolbar", "splash", "dialog"]

main = None

@hook.subscribe.startup_once
def startup_once():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

@hook.subscribe.startup
def start_always():
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

@hook.subscribe.client_new
def set_floating(window):
    # theme.current_theme = theme.getTheme()

    if (window.window.get_wm_transient_for() or window.window.get_wm_type() in floating_types):
        window.floating = True

@hook.subscribe.client_managed
@hook.subscribe.client_urgent_hint_changed
@hook.subscribe.client_killed
@hook.subscribe.setgroup
@hook.subscribe.group_window_add
@hook.subscribe.current_screen_change
@hook.subscribe.changegroup
def hook_response(*args, **kwargs):
    file = os.path.expanduser('~/.cache/workspaces')
    with open(file, 'a') as f:
        print('workspace changed', file=f)

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules, 
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="logout-manager"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    fullscreen_border_width = 0,
    border_width = 0
)

# dgroups_key_binder = None
# dgroups_app_rules = []  # type: list
# reconfigure_screens = True
# auto_minimize = True

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "focus" #"smart"
wl_input_rules = None
wmname = "Qtile" #"LG3D" for java (maybe...)
