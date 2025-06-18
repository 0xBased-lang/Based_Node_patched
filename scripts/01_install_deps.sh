#!/bin/bash
set -e

echo "--- BasedAI Node Setup: 01 - Installing Dependencies ---"
echo ""
echo "This script will install required system packages using apt."
echo "You may be prompted for your password to grant sudo privileges."
echo ""

# Request sudo privileges upfront so the script can run unattended later
sudo -v

# Update package lists
echo "[+] Updating package lists with apt..."
sudo apt-get update -y

# Install essential packages
echo "[+] Installing git, curl, build-essential, clang, pkg-config, libssl-dev, and patch..."
sudo apt-get install -y git curl build-essential clang pkg-config libssl-dev patch

# Final check for rust/cargo, prompt user if not found
if ! command -v cargo &> /dev/null
then
    echo ""
    echo "⚠️  Rust/Cargo not found."
    echo "Please install Rust by running the following command, then run the main setup script again:"
    echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi

echo ""
echo "✅ All dependencies are installed."
echo "--------------------------------------------------------"
echo ""
