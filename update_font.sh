#!/bin/bash

# Create the .termux directory if it doesn't exist
mkdir -p ~/.termux

# URL of the font file (URL-encoded)
FONT_URL="https://github.com/owittek/jetbrains-mono-nf/raw/refs/heads/main/JetBrains%20Mono%20Light%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf"

# Destination path for the font
DEST_PATH="$HOME/.termux/font.ttf"

# Download using curl if available
if command -v curl &> /dev/null; then
    curl -L -o "$DEST_PATH" "$FONT_URL"
# Fallback to wget if curl isn't available
elif command -v wget &> /dev/null; then
    wget -O "$DEST_PATH" "$FONT_URL"
else
    echo "Error: Both curl and wget are missing. Please install one to continue."
    exit 1
fi

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Font successfully downloaded to $DEST_PATH"
else
    echo "Download failed. Please check your internet connection or the URL."
    exit 1
fi
