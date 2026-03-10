#!/bin/sh
# This script checks battery status and notifies the user when:
# - Battery is discharging and below the threshold (20%)
# - Battery is charging and full (80%)

discharge_threshold=35  # Discharging threshold percentage to trigger alert
charge_threshold=80     # Charging threshold percentage to trigger alert

# Use `acpi` to get battery status and capacity
acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
  read -r status capacity

  # If battery is discharging and capacity is below the discharge threshold
  if [ "${status}" = "Discharging" ] && [ "${capacity}" -lt "${discharge_threshold}" ]; then
    # Send a notification that appears for 5 minutes
    notify-send -t 300000 "Charge your battery u fool (${capacity}%)"
  
  # If battery is charging and capacity is above the charge threshold (80%)
  elif [ "${status}" = "Charging" ] && [ "${capacity}" -ge "${charge_threshold}" ]; then
    # Send a notification to stop charging to preserve battery life
    notify-send -t 300000 "Battery fully charged at ${capacity}%. Unplug to preserve battery health."
  fi
}
