#!/bin/bash

# Prompt for user inputs
read -p "Enter your username: " name
read -p "Enter your full name: " fullname

# Create the user with the specified options
sudo useradd -m -s /bin/bash -c "$fullname" -U "$name"

# Set a password for the new user
sudo passwd "$name"

# Confirm successful user creation
echo "Thank you! The user '$name' with full name '$fullname' has been successfully created."

