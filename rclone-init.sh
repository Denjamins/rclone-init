#!/bin/bash

# rclone-init
# Shell Script by Denis Surkov
# GitHub: https://github.com/Denjamins/rclone-init 

# Current version of the script
current_version="1.05"

# Function to check the version
check_version() {
    remote_version=$(curl -s "https://raw.githubusercontent.com/Denjamins/rclone-init/main/rclone-init.sh?$(date +%s)" | grep -oP '^current_version="\K[^"]+')
    
    if [[ "$current_version" != "$remote_version" ]]; then
        echo -e "\nRclone Init $remote_version is available."
        read -p "Would you like to update? (Y/N): " choice
        if [[ "$choice" == "Y" || "$choice" == "y" ]]; then
            wget -O rclone-init.sh "https://raw.githubusercontent.com/Denjamins/rclone-init/main/rclone-init.sh?$(date +%s)"
            echo "Rclone Init updated to $remote_version."
        else
            echo "Update canceled."
        fi
    fi
}

# Check the version when the script is executed
check_version

# Function to display version
display_version() {
    echo "Rclone Init $current_version"
}

# Check if the script should display the version
if [ "$1" == "--ver" ]; then
    display_version
    exit 0
fi

# Vars
rclone_dir=~/rclone
rclone_path=~/rclone/rclone

# Function to install Rclone
install_rclone() {
    cd
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
    unzip rclone-current-linux-amd64.zip
    rm rclone-current-linux-amd64.zip
    mkdir $rclone_dir
    mv rclone-*-linux-amd64/* $rclone_dir
    rm -rf rclone-*-linux-amd64
    if [ -e "$rclone_dir" ]; then
        echo "✅ Rclone installed"
    else
        echo "❌ Rclone not installed, some issue occurred"
    fi
}

echo ""

# Checking for Rclone
if [ -e "$rclone_path" ]; then
    # If Rclone exists
    alias rclone="$rclone_path"
    echo -e "Rclone is running, use 'man-rclone' for the manual"
    alias man-rclone='man ~/rclone/rclone.1'
        
    # Check Rclone versions
    version_info=$(rclone version --check | head -n2)
    
    # Extract versions from the text
    yours_version=$(echo "$version_info" | awk '/yours:/ {print $2}')
    latest_version=$(echo "$version_info" | awk '/latest:/ {print $2}')
    
    # Compare versions
    if [ "$yours_version" != "$latest_version" ]; then
        echo "Rclone is outdated"
        read -p "Update Rclone? (Y/N): " choice
        if [[ "$choice" == "Y" || "$choice" == "y" ]]; then
            install_rclone
            echo "✅ Rclone updated"
        else
            echo "❌ Rclone not updated"
        fi
    fi
else
    # If rclone is not found
    echo "❌ Rclone not found"

    read -p "Install Rclone? (Y/N): " choice
    if [[ "$choice" == "Y" || "$choice" == "y" ]]; then
        # Install Rclone
        install_rclone
    else
        echo "❌ Rclone not installed"
    fi
fi
