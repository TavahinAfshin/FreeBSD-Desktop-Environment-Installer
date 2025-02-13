#!/bin/sh
# FreeBSD Desktop Environment Setup Script
# Author: Afshin afshin@tavahin.com
# Date: 2025-2-13


if [ "$(id -u)" -ne 0 ]; then echo "Must be run as root"; exit 1; fi
if ! pkg info -e xorg > /dev/null 2>&1; then
  echo "Xorg not found. Installing Xorg..."
  pkg install -y xorg
fi


pkg install -y hal

echo "Choose a desktop environment to install:"
echo "1) KDE Plasma"
echo "2) GNOME"
echo "3) Xfce"
echo "4) MATE"
echo "5) Cinnamon"
echo "6) LXDE"
echo "7) LXQt"
echo "8) Enlightenment"
echo "9) Lumina"
echo "10) Budgie"
echo -n "Enter the number of your choice: "
read choice

case "$choice" in
    [Kk][Dd][Ee]*|1) choice=1 ;;       # KDE Plasma
    [Gg][Nn][Oo]*|2) choice=2 ;;       # GNOME
    [Xx][Ff]*|3) choice=3 ;;           # Xfce
    [Mm][Aa][Tt]*|4) choice=4 ;;       # MATE
    [Cc][Ii]*|5) choice=5 ;;           # Cinnamon
    [Ll][Xx][Dd][Ee]*|6) choice=6 ;;   # LXDE
    [Ll][Xx][Qq][Tt]*|7) choice=7 ;;   # LXQt
    [Ee][Nn][Ll]*|8) choice=8 ;;       # Enlightenment
    [Ll][Uu][Mm]*|9) choice=9 ;;       # Lumina
    [Bb][Uu][Dd]*|10) choice=10 ;;     # Budgie
esac


dm=""    
dmpkg="" 

case "$choice" in
  1)
    echo "Installing KDE Plasma desktop..."
    pkg install -y kde5 sddm
    dm="sddm"
    dmpkg="sddm"
    ;;
  2)
    echo "Installing GNOME desktop..."
    pkg install -y gnome
    dm="gdm"
    dmpkg="gdm"
    ;;
  3)
    echo "Installing Xfce desktop..."
    pkg install -y xfce lightdm lightdm-gtk-greeter
    dm="lightdm"
    dmpkg="lightdm"
    ;;
  4)
    echo "Installing MATE desktop..."
    pkg install -y mate lightdm lightdm-gtk-greeter
    dm="lightdm"
    dmpkg="lightdm"
    ;;
  5)
    echo "Installing Cinnamon desktop..."
    pkg install -y cinnamon lightdm lightdm-gtk-greeter
    dm="lightdm"
    dmpkg="lightdm"
    ;;
  6)
    echo "Installing LXDE desktop..."
    pkg install -y lxde-meta lightdm lightdm-gtk-greeter
    dm="lightdm"
    dmpkg="lightdm"
    ;;
  7)
    echo "Installing LXQt desktop..."
    pkg install -y lxqt sddm
    dm="sddm"
    dmpkg="sddm"
    ;;
  8)
    echo "Installing Enlightenment desktop..."
    pkg install -y enlightenment lightdm lightdm-gtk-greeter
    dm="lightdm"
    dmpkg="lightdm"
    ;;
  9)
    echo "Installing Lumina desktop..."
    pkg install -y lumina lightdm lightdm-gtk-greeter
    dm="lightdm"
    dmpkg="lightdm"
    ;;
  10)
    echo "Installing Budgie desktop..."
    pkg install -y budgie lightdm lightdm-gtk-greeter
    dm="lightdm"
    dmpkg="lightdm"
    ;;
  *)
    echo "Invalid selection. Exiting."
    exit 1
    ;;
esac

sysrc dbus_enable="YES"

sysrc hald_enable="YES"

if [ -n "$dm" ]; then
    sysrc ${dm}_enable="YES"
fi

if ! grep -q 'proc[[:blank:]]\+/proc' /etc/fstab; then
    echo "proc\t/proc\tprocfs\trw\t0\t0" >> /etc/fstab
fi


echo ""
echo "Installation and configuration complete."
echo "Desktop Environment installed: $choice"
echo "Display Manager configured: $dm"
echo ""
echo "Important: It is recommended to reboot now to start the ${dm} service and use your new desktop."
echo -n "Reboot now? (y/N): "
read reboot_ans
if echo "$reboot_ans" | grep -iq "^y"; then
    reboot
else
    echo "You chose not to reboot now. Remember to reboot later to use the graphical login and desktop."
fi
