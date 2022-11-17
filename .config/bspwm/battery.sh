#!/bin/bash

while(true); do
  battery_stat="$(acpi --battery)"
  battery_greped_status="$(echo $battery_stat | grep -Pio 'remaining|charged')"
  battery_percentage_v="$(echo $battery_stat | grep -Po '(\d+%)' | grep -Po '\d+')"


  if [ "$battery_greped_status" == "remaining" ]; then
          runtime="$(echo $battery_stat | grep -Po '[0-9]+:[0-9]+:[0-9]+')"

          if [ "$battery_percentage_v" -lt 31 ]; then
                  dunstify -u critical "${battery_percentage_v}% left." -i ~/.icons/Papirus-Dark/16x16/panel/battery-empty.svg
          fi

          if [ "$battery_percentage_v" -lt 16 ]; then
                  dunstify -u "${battery_percentage_v}%" -i ~/.icons/Papirus-Dark/16x16/panel/battery-empty.svg
          fi

  # Remind to disconnect charger if battery >=85%
  elif [ "$battery_greped_status" == "charged" ]; then
      if [ "$battery_percentage_v" -ge 95 ]; then
          dunstify -u normal "Battery ${battery_percentage_v}%" "Disconnect Charger please."
      fi
  fi
  sleep 60
done

