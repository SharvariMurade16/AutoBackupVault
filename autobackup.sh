# Log rotation
LOG_FILE=~/Desktop/AutoBackupVault/report.txt
MAX_SIZE=1048576  # 1 MB in bytes

if [ -f "$LOG_FILE" ]; then
    FILE_SIZE=$(stat -f%z "$LOG_FILE")
    if [ "$FILE_SIZE" -ge "$MAX_SIZE" ]; then
        mv "$LOG_FILE" "~/Desktop/AutoBackupVault/report_$(date +%Y%m%d).txt"
        touch "$LOG_FILE"
    fi
fi
#!/bin/bash

# AutoBackup Vault - Smart File Backup & Recovery System

SOURCE_DIR="$HOME/Documents"       # Folder to backup
BACKUP_DIR="$HOME/AutoBackupVault/Backups"   # Folder where backups will be stored
LOG_FILE="$HOME/AutoBackupVault/report.txt"

mkdir -p "$BACKUP_DIR"

echo "===== Backup started at $(date) =====" >> "$LOG_FILE"
rsync -av --delete "$SOURCE_DIR"/ "$BACKUP_DIR"/ >> "$LOG_FILE" 2>&1
echo "Backup completed at $(date)" >> "$LOG_FILE"
echo "===================================" >> "$LOG_FILE"

echo "✅ Backup completed successfully!"

# Recovery option
if [ "$1" == "--restore" ]; then
    echo "Restoring files..."
    rsync -av "$BACKUP_DIR"/ "$SOURCE_DIR"/ >> "$LOG_FILE" 2>&1
    echo "Restore completed at $(date)" >> "$LOG_FILE"
    echo "✅ Restore completed!"
    exit 0
fi

