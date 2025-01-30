#!/usr/bin/env bash

# Function to detect the shell
detect_shell() {
    if [[ -n "$BASH_VERSION" ]]; then
        echo "bash"
    elif [[ -n "$ZSH_VERSION" ]]; then
        echo "zsh"
    elif [[ -n "$FISH_VERSION" ]]; then
        echo "fish"
    else
        echo "unsupported"
    fi
}

# Function to enable command history
enable_history() {
    case "$1" in
        bash|zsh)
            unset HISTFILE
            echo "✅ Command history is now ENABLED for $1."
            ;;
        fish)
            set -U fish_history
            echo "✅ Command history is now ENABLED for fish."
            ;;
        *)
            echo "⚠️ Unsupported shell: $1"
            ;;
    esac
}

# Function to disable command history
disable_history() {
    case "$1" in
        bash|zsh)
            export HISTFILE=/dev/null
            echo "🚫 Command history is now DISABLED for $1."
            ;;
        fish)
            set -U fish_history ''
            echo "🚫 Command history is now DISABLED for fish."
            ;;
        *)
            echo "⚠️ Unsupported shell: $1"
            ;;
    esac
}

# Detect shell type
SHELL_TYPE=$(detect_shell)

if [[ "$SHELL_TYPE" == "unsupported" ]]; then
    echo "❌ Unsupported shell. This script supports Bash, Zsh, and Fish."
    exit 1
fi

# User prompt
echo "🔄 Toggle command history tracking"
echo "1) Enable history tracking"
echo "2) Disable history tracking"
read -rp "Choose an option (1/2): " CHOICE

case "$CHOICE" in
    1) enable_history "$SHELL_TYPE" ;;
    2) disable_history "$SHELL_TYPE" ;;
    *) echo "❌ Invalid option. Exiting." ;;
esac
