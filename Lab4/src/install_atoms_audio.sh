#!/usr/bin/env bash
# ==========================================================
# Script: install_atoms_audio.sh
# Description: Automated installation of Audio/Sound toolbox
# ==========================================================

if ! command -v scilab-cli &> /dev/null; then
    echo "Error: scilab-cli not found in system PATH."
    exit 1
fi

echo "Updating ATOMS package catalog..."
scilab-cli -nb -quit -e "atomsSystemUpdate();"

echo "Installing Sound / Audio processing toolbox via ATOMS..."
scilab-cli -nb -quit -e "atomsInstall('sound');"

echo "Verifying installation and loading toolbox..."
scilab-cli -nb -quit -e "if atomsIsLoaded('sound') then disp('Audio toolbox active'); else atomsLoad('sound'); disp('Loaded successfully'); end"

echo "Audio toolbox installation finished!"
