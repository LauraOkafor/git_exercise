#!/bin/bash

# Function to check if a package is installed
check_and_install() {
    PACKAGE_NAME=$1
    if dpkg -l | grep -q "$PACKAGE_NAME"; then
        echo "$PACKAGE_NAME is already installed."
    else
        echo "$PACKAGE_NAME is not installed. Installing..."
        sudo apt-get update -y
        sudo apt-get install -y "$PACKAGE_NAME"
        if [ $? -eq 0 ]; then
            echo "$PACKAGE_NAME installation completed."
        else
            echo "Failed to install $PACKAGE_NAME."
        fi
    fi
}

# Check and install net-tools
check_and_install net-tools

# Check and install tree
check_and_install tree
