#!/bin/bash
set -e

# The specific commit from the basednode repository that our patches are known to work with.
# This was retrieved from the live, working server to ensure 100% reproducibility.
VALIDATED_COMMIT="5d12d0d65b50c72adf1726d9a7b64c44ad5758b8"

echo "--- BasedAI Node Setup: 02 - Cloning and Preparing Source ---"
echo ""

if [ -d "basednode" ]; then
    echo "[+] 'basednode' directory already exists. Skipping clone."
else
    echo "[+] Cloning the basednode repository from GitHub..."
    git clone https://github.com/bf1337/basednode.git
fi

cd basednode

echo "[+] Checking out the specific commit known to be compatible with our patches..."
echo "    Commit: $VALIDATED_COMMIT"
git checkout $VALIDATED_COMMIT

echo ""
echo "[+] Pre-downloading all dependencies for patching..."
echo "    (This may take a few minutes and will show many warnings... this is normal)"
# We pipe to `cat` to avoid the output buffer hiding real-time progress, and `|| true` to ignore the expected error.
cargo check 2>&1 | cat || true


echo ""
echo "✅ Source code is checked out and dependencies are downloaded."
echo "--------------------------------------------------------"
echo ""
