# A05s-Custom-Recovery-Flashkit
Toolkit to flash custom recovery + disable AVB on Samsung A05s
# A05s Custom Recovery Flash Kit (by Mullins)

This is a Termux-friendly toolkit to safely flash custom recovery images on the Samsung Galaxy A05s (SM-A055F) with root access.

## 📦 Contents
- `recovery.img` – Touch-enabled custom recovery (compatible with Android 14)
- `vbmeta.img` – Empty image to disable AVB/verity
- `flash-via-dd.sh` – Flash recovery and vbmeta via `dd`
- `install-busybox.sh` – One-click BusyBox setup

## 🛠️ Requirements
- Rooted A05s (Magisk)
- Termux with root access
- Images placed in `/sdcard/a05s_bundle/`

## 💣 Usage
```bash
cd /sdcard/a05s_bundle
bash flash-via-dd.sh
