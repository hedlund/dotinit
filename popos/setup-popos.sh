#!/bin/bash -e

# Enable U2F devices
if [ ! -f /etc/udev/rules.d/70-u2f.rules ]; then
  echo "Copying U2F udev rules (requires sudo)..."
  sudo cp "${SCRIPT_DIR}/../common/70-u2f.rules" /etc/udev/rules.d/70-u2f.rules
fi

# Configure touchpad
dconf write /org/gnome/desktop/peripherals/touchpad/two-finger-scrolling-enabled true
dconf write  /org/gnome/desktop/peripherals/touchpad/natural-scroll true

# Automatic suspend
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-type "'suspend'"
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-timeout 1200
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-type "'suspend'"
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout 3600

# Configure launch on Super + Space
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source-backward "@as []"
dconf write /org/gnome/shell/extensions/pop-shell/search "['<Super>space']"

# Set up 24 h clock
dconf write /org/gnome/desktop/interface/clock-format "'24h'"
dconf write /org/gtk/settings/file-chooser/clock-format "'24h'"
#dconf write /system/locale/region "'en_DK.UTF-8'"

# Add week numbers to calendar
dconf write /org/gnome/desktop/calendar/show-weekdate true
