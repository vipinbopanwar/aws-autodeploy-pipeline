#!/bin/bash
set -e

APP_DIR="/home/ubuntu/app"
cd "$APP_DIR"

echo "=== Stopping any previously running Gunicorn instance ==="
pkill -f gunicorn || true

echo "=== Activating virtual environment ==="
source venv/bin/activate

echo "=== Starting Flask application via Gunicorn ==="
# Runs Gunicorn in the background on port 5000 with 3 worker processes
nohup gunicorn --workers 3 --bind 0.0.0.0:5000 app:app > "$APP_DIR/app.log" 2>&1 &

echo "=== Application successfully started ==="
