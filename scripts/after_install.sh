#!/bin/bash
set -e

APP_DIR="/home/ubuntu/app"
cd "$APP_DIR"

echo "=== Creating Python virtual environment ==="
python3 -m venv venv

echo "=== Activating venv and upgrading pip ==="
source venv/bin/activate
pip install --upgrade pip

echo "=== Installing dependencies from requirements.txt ==="
pip install -r requirements.txt

# Ensure the ubuntu user owns the app files
chown -R ubuntu:ubuntu "$APP_DIR"
