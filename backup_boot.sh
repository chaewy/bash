#!/bin/bash

backup_dir="$HOME/boot_backups"
mkdir -p $backup_dir
tar -czvf $backup_dir/boot_backup_$(date +%F).tar.gz /boot
echo "backup for boot completedd"
