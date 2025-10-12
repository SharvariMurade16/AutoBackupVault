#!/bin/bash

# AutoBackup Vault - Restore Script

BACKUP_DIR="$HOME/AutoBackupVault/Backups"
RESTORE_DIR="$HOME/Documents"    # Where files will be restored
LOG_FILE="$HOME/AutoBackupVault/report.txt"

mkdir -p "$RESTORE_DIR"

# --- Confirmation Prompt Starts Here ---
echo "This action will restore files to '$RESTORE_DIR' and may overwrite existing files."
echo "Are you sure you want to continue? [y/n]"
read -r response
# --- Confirmation Prompt Ends Here ---

# Check the user's answer
if [[ "$response" =~ ^[Yy]$ ]]; then
    # This block only runs if the user typed 'y' or 'Y'
    echo "Proceeding with restore..."

    echo "===== Restore started at $(date) =====" >> "$LOG_FILE"
    rsync -av "$BACKUP_DIR"/ "$RESTORE_DIR"/ >> "$LOG_FILE" 2>&1
    echo "Restore completed at $(date)" >> "$LOG_FILE"
    echo "=====================================" >> "$LOG_FILE"

    echo "✅ Restore completed successfully!"

else
    # This block runs if the user typed anything else
    echo "Restore operation cancelled."
    exit 1 # This stops the script
fi