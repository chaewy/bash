#!/bin/bash

backup_dir="$HOME/varlog_backups"
mkdir -p $backup_dir
tar -czvf $backup_dir/varlog_backup_$(date +%F).tar.gz /var/log
echo "backup for boot completedd"
