#!/bin/bash

# Получаем текущую громкость с помощью pactl
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -1)

# Проверяем статус отключения звука
mute_status=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes')

if [ "$mute_status" = "yes" ]; then
  echo " Muted"
else
  echo " $volume"
fi
