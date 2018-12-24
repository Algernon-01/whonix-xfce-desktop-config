#!/bin/bash

## Copyright (C) 2018 - 2018 ENCRYPTED SUPPORT LP <adrelanos@riseup.net>
## Copyright (C) 2018 Algernon <33966997+Algernon-01@users.noreply.github.com>
## See the file COPYING for copying conditions.

set -e

if grep -qs "boot=live" /proc/cmdline; then
   # live mode is enabled
   if [ -n "$(lsblk /dev/disk/by-uuid/26ada0c0-1165-4098-884d-aafd2220c2c6 -o RO | grep "1")" ]; then
      # disk is set to RO, too
      echo "<img>/usr/share/icons/gnome-colors-common/16x16/actions/dialog-apply.png</img>"
      echo "<txt>Live</txt>"
      echo "<tool>Live mode is enabled. All changes to the disk will be gone after a reboot. See: https://whonix.org/wiki/Whonix_Live or click on the icon for more information.</tool>"
      echo "<click>x-www-browser https://whonix.org/wiki/Whonix_Live</click>"
      echo "<txtclick>x-www-browser https://whonix.org/wiki/Whonix_Live</txtclick>" 
   else
      # disk is not set to RO
      echo "<img>/usr/share/icons/Adwaita/16x16/status/dialog-warning.png</img>"
      echo "<txt>Live</txt>"
      echo "<tool>Live mode is enabled but it is still possible to write to the disk. Please power off the machine and set the disk to read-only. See: https://whonix.org/wiki/Whonix_Live or click on the icon for more information.</tool>"
      echo "<click>x-www-browser https://whonix.org/wiki/Whonix_Live</click>" 
      echo "<txtclick>x-www-browser https://whonix.org/wiki/Whonix_Live</txtclick>"
   fi
else
   # live mode is disabled
   echo "<img>/usr/share/icons/gnome-colors-common/22x22/status/gtk-info.png</img>"
   echo "<tool>You are using persistent mode. All changes to the disk will be preserved after a reboot. For using live mode, see: https://whonix.org/wiki/Whonix_Live or click on the icon for more information.</tool>"
   echo "<click>x-www-browser https://whonix.org/wiki/Whonix_Live</click>"
fi
