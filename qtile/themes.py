import datetime

font = "JetBrains Mono Nerd Font" #"Bitstream Vera Sans Mono Nerd Font"
icon_size = 20
font_size = 16
window_margin = 15
bar_size = 34
right_sep = " "
left_sep = " "
inner_right_sep = "" # " "
inner_left_sep = "" # " "

# Based on catppuccin mocha flavour
class melange():
    background ="#282828"#"#1E1E2E"
    group_bg = "#1f1f1f"
    foreground = "#CAD3F5"

    windowfocus = "#504945"

    group_current = "#ED8796"
    group_highlight = "#F5BDE6"
    group_inactive = "#494D64"

    windowname = "#F5BDE6"

    accent_1 = "#ED8796" # "#8BD5CA"
    accent_2 = "#F5BDE6" # "#A6DA95"

    red = "#F38BA8"
    green = "#A6E3A1"
    orange = "#F3A18F"
    yellow = "#F9E2AF"
    blue = "#89B4FA"
    magenta = "#F5C2E7"
    cyan = "#94E2D5"


class darkPastel():
    background = "#282828"
    group_bg = "#1f1f1f"
    foreground = "#EBDBB2"

    windowfocus = "#414141"

    group_current = "#EBDBB2"
    group_highlight = "#B88460"
    group_inactive = "#3c3c3c"

    accent_1 = "#B88460"
    accent_2 = "#B88460"

    red = "#ea6962"
    green = "#a9b665"
    orange = "#e78a4e"
    yellow = "#d8a657"
    blue = "#7daea3"
    magenta = "#d3869b"
    cyan = "#89b482"



class gruvbox():
    background = "#282828"
    foreground = "#d4be98"

    windowfocus = "#414141"

    group_current = "#89b482"
    group_highlight = "#89b482"
    group_inactive = "#1c1c1c"

    accent_1 = "#e78a4e"
    accent_2 = "#a9b665"

    red = "#ea6962"
    green = "#a9b665"
    orange = "#e78a4e"
    yellow = "#d8a657"
    blue = "#7daea3"
    magenta = "#d3869b"
    cyan = "#89b482"

class kanagawa():
    background = "#1F1F28"
    foreground = "#DDD8BB"

    windowfocus = "#3C3C51" #"#49473E"

    group_current = "#957FB8"
    group_highlight = "#957FB8"
    group_inactive = "#3C3C51"

    accent_1 = "#98BC6D"
    accent_2 = "#6C938C"

    red = "#EC818C"
    green = "#9EC967"
    orange = "#E59283"
    yellow = "#F1C982"
    blue = "#7EB3C9"
    magenta = "#A98FD2"
    cyan = "#7BC2DF"



# based on alduin vim theme
class darkLowcontrast():
    background = "#1C1C1C"
    foreground = "#DFDFDF" #"#DFDFAF"

    windowfocus = "#5F5F5F"

    group_highlight = "#875F5F"
    group_inactive = "#1C1C1C"

    windowname = "#AF875F" #"#87875F"

    widget_bg_1 = "#2D2D2D"
    widget_bg_2 = "#343434"#"#3A3A3A"
    widget_bg_3 = "#2D2D2D"

    accent_1 = "#875F5F" 
    accent_2 = "#AF875F"
    accent_3 = "#875F5F"
    accent_4 = "#AF875F"
    accent_5 = "#875F5F"
    accent_6 = "#AF875F"


class nordDark():
    background = "#353C4A" #"#2E3440"
    foreground = "#eceff4"

    windowfocus = "#4c566a"

    group_highlight = "#d08770"
    group_inactive = "#353C4A"

    windowname = "#ebcb8b"

    widget_bg_1 = "#434c5e"
    widget_bg_2 = "#4c566a"
    widget_bg_3 = "#434c5e"

    accent_1 = "#b48ead" 
    accent_2 = "#8fbcbb"
    accent_3 = "#b48ead"
    accent_4 = "#8fbcbb"
    accent_5 = "#b48ead"
    accent_6 = "#8fbcbb"

current_theme = melange()

# Switch theme based on the day
# However qtile needs to be reloaded
#def getTheme():
#  ct = datetime.datetime.now() 
#  if ct.hour < 16 and ct.hour > 8:
#      return catppuccin()
#  else:
#      return catppuccin()
#
#current_theme = getTheme()

