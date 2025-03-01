#!/bin/bash
LOGFILE="/var/log/myscript.log"

echo "[$(date)] Script started" >> "$LOGFILE"

# Example: List all users
echo "[$(date)] Listing users:" >> "$LOGFILE"
cat /etc/passwd >> "$LOGFILE" 2>&1

echo "[$(date)] Script finished" >> "$LOGFILE"



