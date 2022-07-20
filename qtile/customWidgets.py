# Copyright (c) 2008, 2010 Aldo Cortesi
# Copyright (c) 2010 matt
# Copyright (c) 2011 Mounier Florian
# Copyright (c) 2012 Tim Neumann
# Copyright (c) 2013 Craig Barnes
# Copyright (c) 2014 Sean Vig
# Copyright (c) 2014 Tycho Andersen
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, hook, pangocffi
from libqtile.log_utils import logger
from libqtile.widget import base
import themes

theme = themes.current_theme

class WindowIcon(base._TextBox):
    """Displays the name of the window that currently has focus"""

    defaults = [
        ("for_current_screen", False, "instead of this bars screen use currently active screen"),
        (
            "empty_group_string",
            "",
            "string to display when no windows are focused on current group",
        ),
        ("format", "{class}", "format of the text"),
    ]

    

    def __init__(self, width=bar.CALCULATED, **config):
        base._TextBox.__init__(self, width=width, **config)
        self.add_defaults(WindowIcon.defaults)

    def _configure(self, qtile, bar):
        base._TextBox._configure(self, qtile, bar)
        hook.subscribe.client_name_updated(self.hook_response)
        hook.subscribe.focus_change(self.hook_response)
        hook.subscribe.float_change(self.hook_response)

        @hook.subscribe.current_screen_change
        def on_screen_changed():
            if self.for_current_screen:
                self.hook_response()

    
    def icons_and_colors(self):
        list = {
            "kitty": ["", theme.red],
            "Navigator": ["", theme.orange],
            "spotify": ["阮", theme.green],
            "thunar": ["", theme.yellow],
            "gimp-2.10": ["", theme.red],
            "steam": ["", theme.green],
            "Popcorn-Time": ["嵐", theme.red]
        }
        return list

    def hook_response(self, *args):
        corresponding = self.icons_and_colors()

        icon = "ﬓ"
        color = theme.cyan

        if self.for_current_screen:
            w = self.qtile.current_screen.group.current_window
        else:
            w = self.bar.screen.group.current_window

        if w:
            wm_class = w.get_wm_class()

            var = {}
            var["class"] = wm_class[0] if wm_class else ""

            try:
                # Grab corresponding color and icon
                icon = corresponding[var["class"]][0]
                color = corresponding[var["class"]][1]
            except:  # noqa: E722
                logger.exception("Window icon parsing failed")
        else:
            icon = self.empty_group_string

        self.foreground = color 

        self.update(pangocffi.markup_escape_text(icon))
        



class WindowName(base._TextBox):
    """Displays the name of the window that currently has focus"""

    defaults = [
        ("for_current_screen", False, "instead of this bars screen use currently active screen"),
        (
            "empty_group_string",
            "",
            "string to display when no windows are focused on current group",
        ),
        ("format", "{name}", "format of the text"),
    ]

    

    def __init__(self, width=bar.CALCULATED, **config):
        base._TextBox.__init__(self, width=width, **config)
        self.add_defaults(WindowName.defaults)

    def _configure(self, qtile, bar):
        base._TextBox._configure(self, qtile, bar)
        hook.subscribe.client_name_updated(self.hook_response)
        hook.subscribe.focus_change(self.hook_response)
        hook.subscribe.float_change(self.hook_response)

        @hook.subscribe.current_screen_change
        def on_screen_changed():
            if self.for_current_screen:
                self.hook_response()


    def parseName(self, text): 
        for string in [
                "Chromium",
                "Firefox",
                "~",
                "GNU Image Manipulation Program",
                "GIMP"]:
            if string in text and string == "~":
                text = "Kitty"
            elif string in text and string == "Firefox":
                text = "Firefox" 
            elif string in text and (string == "GNU Image Manipulation Program" or string == "GIMP"):
                text = "GIMP"
            else:
                text = text

        return text

    def hook_response(self, *args):
        if self.for_current_screen:
            w = self.qtile.current_screen.group.current_window
        else:
            w = self.bar.screen.group.current_window
        if w:
            var = {}
            var["name"] = w.name
            try:
                var["name"] = self.parseName(var["name"])
            except:  # noqa: E722
                logger.exception("parse_text function failed:")
            unescaped = self.format.format(**var)
        else:
            unescaped = self.empty_group_string
        self.update(pangocffi.markup_escape_text(unescaped))

