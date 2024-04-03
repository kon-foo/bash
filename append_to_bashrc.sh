#!/bin/bash

# Determine the directory where this script resides. 
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CUSTOM_BASHRC="$SCRIPT_DIR/.bashrc"

# Check if the custom .bashrc is already sourced in the existing .bashrc; if not, add it.
if [[ -f "$CUSTOM_BASHRC" ]]; then
    grep -qxF "source $CUSTOM_BASHRC" ~/.bashrc || echo "source $CUSTOM_BASHRC" >> ~/.bashrc
    source ~/.bashrc
    echo "Custom .bashrc has been successfully sourced in ~/.bashrc"
else
    echo "Error: Custom .bashrc file not found at $CUSTOM_BASHRC"
fi