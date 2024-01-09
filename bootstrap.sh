#!/bin/bash

# Detect user's home directory
USER_HOME=$(eval echo ~$USER)

# Flag to indicate if shell is supported for automatic PATH update
SHELL_SUPPORTED=true

# Detect the user's shell and determine the appropriate profile file
if [[ $SHELL == *"/zsh" ]]; then
    SHELL_PROFILE="${USER_HOME}/.zshrc"
elif [[ $SHELL == *"/bash" ]]; then
    SHELL_PROFILE="${USER_HOME}/.bash_profile"
    [[ ! -f "${SHELL_PROFILE}" ]] && SHELL_PROFILE="${USER_HOME}/.bashrc"
else
    echo "Warning: Unsupported shell for automatic PATH update: $SHELL"
    SHELL_SUPPORTED=false
fi

# Check if Homebrew is installed, if not, install it
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [ "$SHELL_SUPPORTED" = true ]; then
        # Dynamically update PATH in the user's shell profile
        echo "Adding Homebrew to PATH in ${SHELL_PROFILE}..."
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${SHELL_PROFILE}"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "Please manually add Homebrew to your PATH in your shell's profile file."
    fi
fi

# Check if Ansible is installed, if not, install it using Homebrew
if ! command -v ansible &>/dev/null; then
    echo "Installing Ansible..."
    brew install ansible
fi
