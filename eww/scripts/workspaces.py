from libqtile.command.client import CommandClient
c = CommandClient()


groups = {}

for name, group in c.call('groups').items():
    if name == "scratchpad":
        continue
    occupied = len(group["windows"]) > 0
    focused = group['screen'] is not None
    groups[name] = {"occupied": occupied, "focused": focused}

output = '(box	:class "workspaces"	:orientation "h" :spacing 5 :space-evenly "false" '
for name, prop in groups.items():
    command = f"scripts/qtile switch {name}"
    class_ = "0"
    focused, occupied = prop['focused'], prop['occupied']

    if focused:
        icon = ""
        class_ = "focused"
    elif occupied:
        icon = ""
        class_ = "occupied"
    else:
        icon = ""
        class_ = "free"

    output += f'(button :onclick "{command}"	:class	"{class_}"	"{icon}") '

output += ')'
print(output)
