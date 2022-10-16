import themes
import customWidgets

from libqtile.lazy import lazy
from libqtile import widget

theme = themes.current_theme
font_size = themes.font_size
icon_size = themes.icon_size

topBarWidgets = [
        # widget.GroupBox(
        #      fontsize=icon_size+2,
        #      margin_y=2,
        #      margin_x=0,
        #      padding_y=10,
        #      padding_x=15,
        #      #borderwidth=0,
        #      #rounded=False,
        #      font="monofur Nerd Font",
        #      highlight_method="text",
        #      inactive=theme.group_inactive,
        #      active=theme.group_highlight,
        #      highlight_color=theme.background,
        #      this_current_screen_border=theme.group_current,
        #      block_highlight_text_color=theme.background,
        #      ),
        widget.Sep(
            linewidth=0,
            padding=25,
            background=theme.background
            ),
        widget.AGroupBox(
            background=theme.background,
            foreground=theme.accent_1,
            borderwidth=0,
            font=themes.font,
            fontsize=icon_size,
            padding_x=0,
            ),
        widget.Sep(
            foreground=theme.group_bg,
            linewidth=3,
            padding=0,
            ),
        widget.Sep(
            linewidth=0,
            padding=20
            ),
        customWidgets.WindowIcon(
            fontsize=icon_size
            ),
        customWidgets.WindowName(
            foreground=theme.foreground
            ),
        widget.Sep(
            foreground=theme.group_bg,
            linewidth=3,
            padding=25,
            ),
        widget.CurrentLayout(
            foreground=theme.foreground,
            ),
        widget.Spacer(),
        widget.Clock(
            format = "%d-%m-%y %H:%M",
            foreground = theme.foreground, 
            mouse_callbacks = {"Button1": lazy.spawn("gnome-calendar")},
            ),
        widget.Spacer(),
        widget.TextBox(
            text="",
            fontsize=icon_size,
            foreground=theme.accent_1,
            mouse_callbacks = {"Button1": lazy.spawn("gnome-system-monitor")},
            ),
        widget.Memory(
            measure_mem = "G", 
            format = "{MemUsed: .1f}/8G",
            padding = 0,
            foreground = theme.foreground,
            mouse_callbacks = {"Button1": lazy.spawn("gnome-system-monitor")},
            ),
        widget.CPU(
            format = "{load_percent: .0f}%",
            foreground=theme.foreground,
            padding = 0,
            mouse_callbacks = {"Button1": lazy.spawn("gnome-system-monitor")},
            ),
        widget.ThermalZone(
            foreground = theme.foreground,
            fgcolor_normal = theme.foreground,
            fgcolor_high = theme.red,
            fgcolor_crit = theme.red,
            format ="{temp}°",
            zone = "/sys/class/thermal/thermal_zone5/temp",
            foreground_alert = theme.foreground,
            threshold = 60,
            mouse_callbacks = {"Button1": lazy.spawn("gnome-system-monitor")},
            ),
        widget.Sep(
            linewidth = 3,
            foreground = theme.group_bg,
            padding = 15,
            ),
        widget.TextBox(
            text = "墳",
            fontsize = icon_size,
            foreground = theme.accent_1
            ),
        widget.Volume(
            foreground = theme.foreground,
            ),
        widget.Sep(
            linewidth = 3,
            foreground = theme.group_bg,
            padding = 20,
            ),
        widget.Battery(
            foreground = theme.accent_2,
            format = "{char}",
            padding = 0,
            fontsize = icon_size,
            full_char = "",
            charge_char = "",
            discharge_char = "",
            empty_char = "",
            ),
        widget.Battery(
            foreground = theme.foreground,
            padding = 0,
            format = "{percent: 2.0%}",
            full_char="100%"
            ),
        widget.Sep(
            linewidth = 0,
            padding = 15,
            ),
       ]
  
