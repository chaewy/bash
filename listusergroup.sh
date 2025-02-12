#!/bin/bash

# Prompt the user for the desired group name
read -p "Enter the group name you want to search for: " group_name

# Get the group ID for the given group name
group_id=$(getent group "$group_name" | awk -F: '{print $3}')

# Display the usernames with the specified group ID
if [ -n "$group_id" ]; then
    getent passwd | awk -F: -v gid="$group_id" '$4 == gid {print $1}'
else
    echo "Group name not found."
fi
