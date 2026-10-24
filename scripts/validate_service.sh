#!/bin/bash
set -e

echo "=== Validating application health check endpoint ==="

# Wait up to 30 seconds for the service to bind and respond
for i in {1..6}; do
    response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/health || true)
    if [ "$response" == "200" ]; then
        echo "Health check passed with HTTP 200!"
        exit 0
    fi
    echo "Waiting for app to start... (attempt $i/6)"
    sleep 5
done

echo "Health check failed!"
exit 1
