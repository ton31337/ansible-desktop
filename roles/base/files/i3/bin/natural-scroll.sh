#!/bin/bash

SENSITIVITY="${1:-0.7}"

# Get id of touchpad and the id of the field corresponding to
# natural scrolling
for id in `xinput list | grep pointer | grep -Ei "Razer|Mouse|Touchpad" | cut -d'=' -f2 | cut -d'[' -f1`
do
	# Set the property to true
	xinput --set-prop $id 'libinput Natural Scrolling Enabled' 1 2>/dev/null

	# Sensitivity
	xinput --set-prop $id 'libinput Accel Speed' "${SENSITIVITY}" 2>/dev/null
done
