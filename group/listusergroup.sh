#!/bin/bash

# Prompt the user for the desired group name
read -p "Enter the group name you want to search for: " group_name

# Get the group details
group_info=$(getent group "$group_name")

# Check if the group exists
if [ -z "$group_info" ]; then
    echo "Group name not found."
    exit 1
fi

# Extract the group ID (GID)
group_id=$(echo "$group_info" | awk -F: '{print $3}')

# Get primary users (users whose primary GID matches the group's GID)
primary_users=$(getent passwd | awk -F: -v gid="$group_id" '$4 == gid {print $1}')

# Get secondary users (users listed in the group's entry)
secondary_users=$(echo "$group_info" | awk -F: '{print $4}' | tr ',' ' ')

# Display results
echo -e "\nPrimary Users:"
if [ -n "$primary_users" ]; then
    i=1
    for user in $primary_users; do
        echo "$i. $user"
        ((i++))
    done
else
    echo "None"
fi

echo -e "\nSecondary Users:"
if [ -n "$secondary_users" ]; then
    i=1
    for user in $secondary_users; do
        echo "$i. $user"
        ((i++))
    done
else
    echo "None"
fi
