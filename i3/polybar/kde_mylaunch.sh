#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar2.log
# polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
if type 'xrandr'; then
  for m in $(xrandr --query | grep ' connected' | cut -d" " -f1); do
    POLYBAR_MONITOR=$m polybar -c ~/.config/polybar/kde_config.ini --reload example 1>/dev/null 2>&1 | tee -a /tmp/polybar2.log & disown
  done
else
  polybar -c ~/.config/polybar/kde_config.ini example 1>/dev/null 2>&1 | tee -a /tmp/polybar2.log & disown
fi


echo "Bars launched..."
