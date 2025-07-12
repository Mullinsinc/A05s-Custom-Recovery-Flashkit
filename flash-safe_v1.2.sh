#!/system/bin/sh

# ================== CONFIG ==================
IMG_DIR="/sdcard/a05s_bundle"
LOG_FILE="/sdcard/flash_safe.log"
BACKUP_DIR="/sdcard/.safe_recovery_backup"

echo "=== A05s Safe Flash Script v1.2 ===" | tee "$LOG_FILE"
echo "[*] Dry-run mode active. No flashing will occur unless --force is passed." | tee -a "$LOG_FILE"

# ============== PRECHECKS ==============
command -v su >/dev/null || { echo "[✘] Root access (su) not found!" | tee -a "$LOG_FILE"; exit 1; }
command -v dd >/dev/null || { echo "[✘] 'dd' command missing!" | tee -a "$LOG_FILE"; exit 1; }

# ============== FILE CHECK ==============
check_file() {
    if [ ! -f "$1" ]; then
        echo "[✘] Missing: $1" | tee -a "$LOG_FILE"
        exit 1
    elif [ ! -s "$1" ]; then
        echo "[✘] Empty file: $1" | tee -a "$LOG_FILE"
        exit 1
    else
        echo "[✓] Found: $1" | tee -a "$LOG_FILE"
    fi
}

mkdir -p "$IMG_DIR" "$BACKUP_DIR"

check_file "$IMG_DIR/boot.img"
check_file "$IMG_DIR/vbmeta.img"
check_file "$IMG_DIR/recovery.img"

# ============== DRY RUN OR REAL FLASH ==============

if [ "$1" != "--force" ]; then
    echo "[INFO] This was a dry run. To flash for real, re-run with:" | tee -a "$LOG_FILE"
    echo "       bash flash-safe_v1.2.sh --force" | tee -a "$LOG_FILE"
    exit 0
fi

# ============== BACKUPS ==============
echo "[*] Backing up current partitions..." | tee -a "$LOG_FILE"
su -c "dd if=/dev/block/by-name/boot of=$BACKUP_DIR/boot_backup.img bs=4096" >> "$LOG_FILE" 2>&1 || exit 1
su -c "dd if=/dev/block/by-name/vbmeta of=$BACKUP_DIR/vbmeta_backup.img bs=4096" >> "$LOG_FILE" 2>&1 || exit 1
su -c "dd if=/dev/block/by-name/recovery of=$BACKUP_DIR/recovery_backup.img bs=4096" >> "$LOG_FILE" 2>&1 || exit 1
echo "[✓] Backup complete to $BACKUP_DIR" | tee -a "$LOG_FILE"

# ============== FLASHING ==============
echo "[*] Flashing vbmeta.img..." | tee -a "$LOG_FILE"
su -c "dd if=$IMG_DIR/vbmeta.img of=/dev/block/by-name/vbmeta bs=4096" >> "$LOG_FILE" 2>&1 || exit 1

echo "[*] Flashing boot.img..." | tee -a "$LOG_FILE"
su -c "dd if=$IMG_DIR/boot.img of=/dev/block/by-name/boot bs=4096" >> "$LOG_FILE" 2>&1 || exit 1

echo "[*] Flashing recovery.img..." | tee -a "$LOG_FILE"
su -c "dd if=$IMG_DIR/recovery.img of=/dev/block/by-name/recovery bs=4096" >> "$LOG_FILE" 2>&1 || exit 1

echo "[✓] Flashing complete. No errors detected." | tee -a "$LOG_FILE"

# ============== DONE ==============
# Uncomment to auto-reboot if needed
# su -c "reboot recovery"

exit 0
