#!/usr/bin/env bash
# ==============================================================================
# Script: setup_and_run_ex6.sh
# Description: Automated ATOMS setup and batch execution of Exercise 6
# ==============================================================================

if ! command -v scilab-cli &> /dev/null; then
    echo "[ERROR] scilab-cli is not installed or not in system PATH."
    exit 1
fi

# 1. Update ATOMS repository index
echo "[INFO] Updating ATOMS package repositories..."
scilab-cli -nb -quit -e "atomsSystemUpdate();"

# 2. Install optional signal processing & numerical extensions
echo "[INFO] Installing ATOMS signal processing modules..."
scilab-cli -nb -quit -e "atomsInstall('signal');"

# 3. Query and verify all installed ATOMS toolboxes
echo "[INFO] Verifying installed ATOMS modules:"
scilab-cli -nb -quit -e "atomsDispInstalled();"

# 4. Execute the linear convolution script in headless batch mode
echo "[INFO] Executing linear convolution simulation (lap4_ex6.sci)..."
scilab-cli -nb -f src/lap4_ex6.sci

echo "[SUCCESS] Batch convolution execution completed successfully!"
