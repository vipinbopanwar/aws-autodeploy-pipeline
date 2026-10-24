#!/bin/bash
set -e

# Update packages and install Python, pip, and venv prerequisites
echo "=== Updating packages and installing Python ==="
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip python3-venv curl

# Clean existing app directory if it exists
APP_DIR="/home/ubuntu/app"
if [ -d "$APP_DIR" ]; then
    echo "=== Cleaning previous app deployment directory ==="
    rm -rf "$APP_DIR"
fi

mkdir -p "$APP_DIR"
