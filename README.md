# A05s Custom Recovery Flash Kit (by Mullinsinc)

This is a Termux-friendly toolkit to safely flash a custom recovery and disable Android Verified Boot (AVB) on the **Samsung Galaxy A05s (SM-A055F)**.

---

## 📦 Contents

| File               | Purpose                                           |
|--------------------|---------------------------------------------------|
| `recovery.img`     | Custom TWRP-style recovery for Android 14         |
| `vbmeta.img`       | Empty AVB image to disable verification/encryption|
| `flash-via-dd.sh`  | Script to flash recovery + vbmeta from Termux     |
| `install-busybox.sh` | Local BusyBox setup tool for rooted devices     |

---

## 🛠️ Requirements

- Rooted Samsung Galaxy A05s (Magisk or equivalent)
- Termux with superuser (su) access
- BusyBox (optional, included in this bundle)
- `.img` files and scripts placed in `/sdcard/a05s_bundle/`

---

## 💣 Usage

### Step 1: Prepare the Folder and Files

Open Termux and run:

```bash
mkdir -p /sdcard/a05s_bundle
cd /sdcard/a05s_bundle

# Download recovery & vbmeta images directly
curl -O https://github.com/Mullinsinc/A05s-Custom-Recovery-Flashkit/releases/download/v1.0.0/recovery.img
curl -O https://github.com/Mullinsinc/A05s-Custom-Recovery-Flashkit/releases/download/v1.0.0/vbmeta.img

# (Optional) move script file if not already in folder
cp ~/storage/downloads/flash-via-dd.sh

Step 2: Flash Recovery + Disable AVB
bash flash-via-dd.sh

Step 3: (Optional) Install Local BusyBox
bash install-busybox.sh

---

📥 Direct Downloads

File	Link

recovery.img	Download
vbmeta.img	Download

---

🧙‍♂️ Maintained By

Mullinsinc
Your local digital wizard, freedom-flasher & rooted-Android evangelist.
Custom recovery never looked this smooth. 😎

---
