#!/system/bin/sh

# Mount point: /sdcard/a05s_bundle
mkdir -p /sdcard/a05s_bundle
cd /sdcard/a05s_bundle || exit 1

echo "[*] Flashing recovery..."
su -c "dd if=recovery.img of=/dev/block/by-name/recovery bs=4096"
echo "[+] Recovery flashed."

echo "[*] Flashing vbmeta (disable AVB)..."
su -c "dd if=vbmeta.img of=/dev/block/by-name/vbmeta bs=4096"
echo "[+] vbmeta flashed."

echo "[✓] Done. You can now reboot into recovery!"
