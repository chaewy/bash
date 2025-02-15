#!/bin/bash

backup_dir="$HOME/backups"
mkdir -p $backup_dir
tar -czvf $backup_dir/etc_backup_$(date +%F).tar.gz /etc
echo "Backup stored in $backup_dir"

