#!/bin/bash

# Post-create script for devcontainer setup
# This script runs after the container is created

set -e

echo "Running post-create setup..."

# Initialize and update git submodules
echo "Initializing git submodules..."
git submodule update --init --recursive

# Install Claude Code using native installer
echo "Installing Claude Code CLI..."
curl -fsSL https://claude.ai/install.sh | bash

# Update npm to latest version
echo "Updating npm..."
npm install -g npm@latest

# Install npm dependencies
echo "Installing npm dependencies..."
npm install

# Ensure ~/.local/bin is in PATH for claude
if ! grep -q '.local/bin' ~/.bashrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

echo "Post-create setup complete!"
