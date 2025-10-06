#!/bin/bash
# AutoBackup Vault - Cron Automation Script
# Mohit - 6 Oct

# Backup folder path
BACKUP_DIR=~/Desktop/AutoBackupVault/Backups
SOURCE_DIR=~/Desktop/AutoBackupVault/SourceFiles

# Create backup folder if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Copy files to backup folder
cp -r "$SOURCE_DIR"/* "$BACKUP_DIR"

# Log the backup
echo "$(date): Backup completed successfully" >> ~/Desktop/AutoBackupVault/report.txt

