#!/bin/bash

# Define the path to bin directory
BIN_DIR="$HOME/bin"

# Define the repository URL
REPOSITORY_URL="https://github.com/mward19/tomogram_seg.git"

# Check if ~/bin directory exists, if not create it
if [ ! -d "$BIN_DIR" ]; then
    mkdir -p "$BIN_DIR"
    echo "Created $BIN_DIR"
fi

# Add ~/bin and its subdirectories to the $PATH if they're not already added
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    export PATH="$PATH:$BIN_DIR"
fi

# Check if tomogram_seg_scripts directory already exists
if [ -d "$BIN_DIR/tomogram_seg_scripts" ]; then
    echo "tomogram_seg_scripts directory already exists."
else
    # Download scripts from GitHub repository
    git clone "$REPOSITORY_URL" "$BIN_DIR/tomogram_seg_scripts"
    
    # Move contents of Scripts directory to tomogram_seg_scripts
    mv "$BIN_DIR/tomogram_seg_scripts/Scripts/"* "$BIN_DIR/tomogram_seg_scripts/"
    
    # Remove the now empty Scripts directory
    rmdir "$BIN_DIR/tomogram_seg_scripts/Scripts" || echo "Scripts directory is already empty or does not exist."
    
    # Make all scripts executable
    chmod +x "$BIN_DIR/tomogram_seg_scripts"/*
fi

# Check if tomogram_seg_scripts is in the PATH, if not add it
if [[ ":$PATH:" != *":$BIN_DIR/tomogram_seg_scripts:"* ]]; then
    export PATH="$PATH:$BIN_DIR/tomogram_seg_scripts"
fi

# Check if the path has been updated
echo "Updated PATH: $PATH"

