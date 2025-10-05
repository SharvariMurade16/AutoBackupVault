#!/bin/bash

# AutoBackup Vault - Restore Script

BACKUP_DIR="$HOME/AutoBackupVault/Backups"
RESTORE_DIR="$HOME/Documents"   # Where files will be restored
LOG_FILE="$HOME/AutoBackupVault/report.txt"

mkdir -p "$RESTORE_DIR"

echo "===== Restore started at $(date) =====" >> "$LOG_FILE"
rsync -av "$BACKUP_DIR"/ "$RESTORE_DIR"/ >> "$LOG_FILE" 2>&1
echo "Restore completed at $(date)" >> "$LOG_FILE"
echo "=====================================" >> "$LOG_FILE"

echo "✅ Restore completed successfully!"

