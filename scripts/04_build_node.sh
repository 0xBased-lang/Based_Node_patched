#!/bin/bash
set -e

echo "--- BasedAI Node Setup: 04 - Building the Node Binary ---"
echo ""
echo "This is the final build step. It will compile the patched source code."
echo "⚠️  This process will take a long time (30-90 minutes) and will print many warnings."
echo "Please be patient."
echo ""

# Navigate into the source code directory
cd basednode

echo "[+] Cleaning previous build artifacts..."
cargo clean

echo "[+] Starting the release build..."
cargo build --release

echo ""
echo "✅ Node binary compiled successfully!"
echo "   It is located at: ./basednode/target/release/basednode"
echo "--------------------------------------------------------"
echo ""

# Navigate back to the root of the ops repo
cd ..
