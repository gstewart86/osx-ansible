#!/bin/bash

# Dynamically set the user's home directory
USER_HOME=$(eval echo ~$USER)

# Check if Homebrew is installed, if not, install it
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Dynamically update PATH in the user's shell profile
    SHELL_PROFILE="${USER_HOME}/.zprofile" # Change this if using a different shell
    echo "Adding Homebrew to PATH in ${SHELL_PROFILE}..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${SHELL_PROFILE}"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Check if Ansible is installed, if not, install it using Homebrew
if ! command -v ansible &>/dev/null; then
    echo "Installing Ansible..."
    brew install ansible
fi
