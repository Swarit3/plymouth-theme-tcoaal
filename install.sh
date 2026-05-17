#!/usr/bin/bash
if [[ "$USER" == "root" ]]; then
	cp -r ./tcoaal /usr/share/plymouth/themes/tcoaal

	
	if [[ -f "/sys/firmware/acpi/bgrt/image" ]]; then
		bgrt=/sys/firmware/acpi/bgrt/image
		
		xoffset=$(cat /sys/firmware/acpi/bgrt/xoffset)
		yoffset=$(cat /sys/firmware/acpi/bgrt/yoffset)
		width=$(cat /sys/class/drm/card*/modes 2>/dev/null | head -1 | cut -dx -f1)
		height=$(cat /sys/class/drm/card*/modes 2>/dev/null | head -1 | cut -dx -f2)
		x_norm=$(echo "scale=4; $xoffset / $width" | bc)
		y_norm=$(echo "scale=4; $yoffset / $height" | bc)
	else
		read -p "Couldn't find a built-in BGRT. Please specify a path to file to use as BGRT/Logo:" bgrt
		read -p "Please enter the X offset (0.5 for middle of the screen):" x_norm
		read -p "Please enter the Y offset (0.5 for middle of the screen):" y_norm
	fi
	magick $bgrt /usr/share/plymouth/themes/tcoaal/bgrt.png
	sed -i "s/bgrt_x1 = .*/bgrt_x1 = $x_norm;/" /usr/share/plymouth/themes/tcoaal/tcoaal.script
	sed -i "s/bgrt_y1 = .*/bgrt_y1 = $y_norm;/" /usr/share/plymouth/themes/tcoaal/tcoaal.script

	
	read -p "You want to set this as the default plymouth theme and regerate initcpio?" snr
	if [[ "$snr" =~ ^[Yy] ]]; then
		plymouth-set-default-theme -R tcoaal
	fi
	unset bgrt
	unset xoffset
	unset yoffset
	unset width
	unset height
	unset x_norm
	unset y_norm
	unset snr
	echo "Done! You can restart if you wanna see it in action."
else
	echo "Need to run this script as root."
fi
