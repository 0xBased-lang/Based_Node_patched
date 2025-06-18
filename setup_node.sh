#!/bin/bash
set -e

# Get the directory of the currently executing script to run other scripts relative to it.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "========================================================"
echo "    BasedAI Node Operator (ops) Setup Script"
echo "========================================================"
echo ""
echo "This script will automate the entire process of setting up a"
echo "functional, patched BasedAI node."
echo ""
echo "The process will be:"
echo "1. Install system dependencies (will ask for sudo password)."
echo "2. Clone the correct version of the basednode source code."
echo "3. Apply critical patches to fix known build issues."
echo "4. Compile the node (this will take a very long time)."
echo "5. Create helper scripts to run and monitor the node."
echo ""
read -p "Press [Enter] to begin the setup..."

# --- Execute Scripts in Order ---

bash "${SCRIPT_DIR}/scripts/01_install_deps.sh"
bash "${SCRIPT_DIR}/scripts/02_clone_and_prep.sh"
bash "${SCRIPT_DIR}/scripts/03_apply_patches.sh"
bash "${SCRIPT_DIR}/scripts/04_build_node.sh"
bash "${SCRIPT_DIR}/scripts/05_create_runtime_scripts.sh"


# --- Final Instructions ---
echo "========================================================"
echo "✅ ✅ ✅   SETUP COMPLETE!   ✅ ✅ ✅"
echo "========================================================"
echo ""
echo "The basednode binary has been built and is ready to run."
echo ""
echo "To start your node, navigate to the 'basednode' directory"
echo "and run the generated startup script:"
echo ""
echo "  cd basednode"
echo "  screen -S basednode"
echo "  ./start.sh"
echo ""
echo "To monitor your node later, you can use:"
echo ""
echo "  cd basednode"
echo "  ./monitor.sh"
echo ""
echo "To re-attach to the running node's console:"
echo ""
echo "  screen -r basednode"
echo ""
echo "========================================================"
