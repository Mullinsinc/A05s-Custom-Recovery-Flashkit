#!/data/data/com.termux/files/usr/bin/bash

echo "[*] Installing local BusyBox..."

chmod +x ./busybox
mkdir -p /data/local/tmp/bbox
./busybox --install -s /data/local/tmp/bbox

echo "export PATH=/data/local/tmp/bbox:\$PATH" >> ~/.bashrc
source ~/.bashrc

echo "[✓] BusyBox linked. Use it with: busybox <command>"
