#!/usr/bin/env bash
# ==========================================================
# Script: install_atoms_image.sh
# Description: Automated installation of IPCV toolbox via CLI
# ==========================================================

if ! command -v scilab-cli &> /dev/null; then
    echo "Error: scilab-cli not found in system PATH."
    exit 1
fi

echo "Updating Scilab ATOMS repository metadata..."
scilab-cli -nb -quit -e "atomsSystemUpdate();"

echo "Installing IPCV (Image Processing & Computer Vision)..."
scilab-cli -nb -quit -e "atomsInstall('IPCV');"

echo "Verifying IPCV installation and auto-loading..."
scilab-cli -nb -quit -e "if atomsIsLoaded('IPCV') then disp('IPCV active'); else atomsLoad('IPCV'); disp('IPCV loaded successfully'); end"

echo "Image processing toolbox installed and ready for use!"
