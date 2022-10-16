from libqtile.command.client import CommandClient
c = CommandClient()


groups = {}

icons = {
        "1": "",
        "2": "",
        "3": "",
        "4": "",
        "5": "",
        "6": "",
        "7": "",
        "8": "",
        "9": "",
        }

for name, group in c.call('groups').items():
    if name == "scratchpad":
        continue
    occupied = len(group["windows"]) > 0
    focused = group['screen'] is not None
    groups[name] = {"occupied": occupied, "focused": focused}

output = '(box	:class "workspaces"	:orientation "h" :spacing 5 :space-evenly "false" '
for name, prop in groups.items():
    command = f"scripts/qtile switch {name}"
    class_ = "free"
    focused, occupied = prop['focused'], prop['occupied']

    if focused:
        class_ = "focused"
    elif occupied:
        class_ = "occupied"
    else:
        class_ = "free"

    icon = icons[name]

    output += f'(button :onclick "{command}"	:class	"{class_}"	"{icon}") '

output += ')'
print(output)
