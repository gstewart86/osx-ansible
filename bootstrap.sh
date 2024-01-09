#!/bin/bash

# Check if Homebrew is installed, if not, install it
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if Ansible is installed, if not, install it using Homebrew
if ! command -v ansible &>/dev/null; then
    echo "Installing Ansible..."
    brew install ansible
fi
