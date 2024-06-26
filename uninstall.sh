#!/bin/bash

INSTALL_DIR="/usr/local/bin"
SCRIPT_FILE="${INSTALL_DIR}/locationchanger"
LAUNCH_AGENTS_DIR="${HOME}/Library/LaunchAgents"
PLIST_FILE="${LAUNCH_AGENTS_DIR}/LocationChanger.plist"
DOTFILE_DIR="${HOME}/.locationchanger"
LOG_FILE="${HOME}/Library/Logs/LocationChanger.log"

echo "This will uninstall LocationChanger and its config files and scripts from your Mac.\n"
echo "Are you sure you want to uninstall LocationChanger (y/n)?"
read reply
if [ "$reply" != "y" ]; then
    echo "Aborting uninstall command."
    exit
fi

sudo rm "$SCRIPT_FILE"
launchctl unload "$PLIST_FILE"
rm "$PLIST_FILE"
rm -rf "$DOTFILE_DIR"
rm -rf "$LOG_FILE"

echo "Uninstall complete."
