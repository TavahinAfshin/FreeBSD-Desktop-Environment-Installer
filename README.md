# FreeBSD Desktop Environment Installer 🚀

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A simple, all-in-one script to install and configure a **FreeBSD** desktop environment with minimal effort. Choose from a variety of popular desktops, and after a reboot you’ll be greeted by a full graphical login screen—no manual tinkering required.

---

## ✨ Features

- **Automated Check for Xorg**  
  If Xorg isn’t installed, the script takes care of it.

- **Multiple Desktop Choices**  
  Offering 10 popular environments:
  | Number | Environment       |
  |--------|-------------------|
  | 1      | KDE Plasma        |
  | 2      | GNOME             |
  | 3      | Xfce              |
  | 4      | MATE              |
  | 5      | Cinnamon          |
  | 6      | LXDE              |
  | 7      | LXQt              |
  | 8      | Enlightenment     |
  | 9      | Lumina            |
  | 10     | Budgie            |

- **Automatic Configuration**  
  - Installs display manager (LightDM, GDM, or SDDM) depending on your chosen desktop.  
  - Enables `dbus`, `hald` (if available), and the display manager service in `/etc/rc.conf`.  
  - Adds `/proc` to `/etc/fstab` if not present.

- **Root Privilege Enforcement**  
  Exits if not run as `root` (or via `sudo`).

- **Reboot Prompt**  
  Gives you the option to reboot and start enjoying your new desktop right away.

---

## 📋 Requirements

1. **FreeBSD 13+** (should work on most modern releases).  
2. **Root Access** (run as `root` or with `sudo`).  
3. **Active Network Connection** (to install packages via `pkg`).  
4. (Recommended) **Updated pkg Repo**: run `pkg update` before using the script if desired.

---

## 🚀 Quick Start

1. **Clone this repository:**
   ```sh
   git clone https://github.com/TavahinAfshin/FreeBSD-Desktop-Environment-Installer.git
   cd FreeBSD-Desktop-Installer
