# BasedAI Node Operator (ops) Repository

## Overview

This repository provides a fully automated, reliable, and validated method for setting up a functional **BasedAI `basednode`**.

The standard installation process has several pitfalls, including critical build errors and outdated network information. This toolkit is designed to handle those issues automatically, providing a smooth setup experience from a fresh server to a syncing node.

---

### Validated Commit

This setup is tested and confirmed to work for the `bf1337/basednode` repository at the following commit:

- **Commit Hash:** `5d12d0d65b50c72adf1726d9a7b64c44ad5758b8`

If you are trying to build a newer version of the node, these scripts may need to be adapted.

---

## Prerequisites

- A server running a fresh Debian-based Linux OS (e.g., **Ubuntu 22.04**).
- `sudo` (administrator) privileges.

---

## Usage

For a complete setup, you only need to run two commands.

1.  **Clone this repository:**
    ```bash
    git clone <URL_OF_THIS_REPO>
    cd <REPO_DIRECTORY>
    ```

2.  **Run the master setup script:**
    ```bash
    bash setup_node.sh
    ```

---

## The Process

The `setup_node.sh` script is fully automated and will guide you through the following steps:

1.  **Install Dependencies:** It will ask for your `sudo` password to install required packages like `git`, `curl`, `clang`, and `patch`.
2.  **Clone Source:** It downloads the correct version of the `basednode` source code.
3.  **Apply Patches:** It automatically applies critical fixes to the source code to resolve known build-stopping bugs.
4.  **Build Node:** It compiles the `basednode` binary. **This is a long process and can take over an hour.** Please be patient.
5.  **Create Scripts:** It generates helper scripts (`start.sh`, `monitor.sh`) inside the `basednode/` directory for you to easily run and manage your node.

Once the script is finished, it will print final instructions on how to start your node.
