#!/bin/bash
set -e

echo "--- BasedAI Node Setup: 03 - Applying Critical Patches ---"
echo ""

# Navigate into the source code directory where cargo commands must be run
cd basednode

# Find the path to the cached Substrate source code.
# This uses the home directory to be user-agnostic.
echo "[+] Locating Substrate dependency source code..."
SUBSTRATE_SRC_DIR=$(find "$HOME/.cargo/git/checkouts/" -name "substrate-*" -type d | head -n 1)

if [ -z "$SUBSTRATE_SRC_DIR" ]; then
    echo "❌ ERROR: Could not find the cached Substrate source directory."
    echo "    Please ensure dependencies were downloaded correctly in the previous step."
    exit 1
fi
echo "    Substrate source found at: $SUBSTRATE_SRC_DIR"
echo ""

# --- Apply Patch 1: Fix the sc-network Enum Conflict ---
echo "[+] Applying patch 0001-fix-sc-network-enum-conflict.patch"
MESSAGE_RS_PATH=$(find $SUBSTRATE_SRC_DIR -name "message.rs" -path "*/network/src/protocol/*")
if [ -z "$MESSAGE_RS_PATH" ]; then
    echo "❌ ERROR: Could not find message.rs to patch."
    exit 1
fi
# Apply the patch directly to the target file. This is the most robust method.
patch "$MESSAGE_RS_PATH" < "../patches/0001-fix-sc-network-enum-conflict.patch"


# --- Apply Patch 2: Fix the sp-io no_mangle Conflict ---
echo "[+] Applying patch 0002-fix-sp-io-no_mangle-conflict.patch"
IO_LIB_RS_PATH=$(find $SUBSTRATE_SRC_DIR -name "lib.rs" -path "*/primitives/io/src/*")
if [ -z "$IO_LIB_RS_PATH" ]; then
    echo "❌ ERROR: Could not find io/src/lib.rs to patch."
    exit 1
fi
# Apply the patch directly to the target file.
patch "$IO_LIB_RS_PATH" < "../patches/0002-fix-sp-io-no_mangle-conflict.patch"


echo ""
echo "✅ All patches applied successfully."
echo "--------------------------------------------------------"
echo ""

# Navigate back to the root of the ops repo
cd ..
