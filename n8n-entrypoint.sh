#!/bin/sh
set -e

# Function to get ngrok public URL
get_ngrok_url() {
    NGROK_URL=""
    echo "Waiting for ngrok to be available..."
    
    # Wait for ngrok to be available
    while ! wget -q -T 1 -O - http://ngrok:4040/api/tunnels > /dev/null 2>&1; do
        echo "Waiting for ngrok API to be ready..."
        sleep 2
    done
    
    echo "ngrok is available, fetching public URL..."
    
    # Get the public URL from ngrok
    ATTEMPTS=0
    MAX_ATTEMPTS=30
    
    while [ $ATTEMPTS -lt $MAX_ATTEMPTS ]; do
        NGROK_URL=$(wget -q -O - http://ngrok:4040/api/tunnels | grep -o '"public_url":"https:[^"]*' | head -1 | cut -d'"' -f4)
        
        if [ -n "$NGROK_URL" ]; then
            echo "ngrok public URL: $NGROK_URL"
            break
        fi
        
        ATTEMPTS=$((ATTEMPTS + 1))
        echo "Attempt $ATTEMPTS: Waiting for ngrok tunnel... (2s)"
        sleep 2
    done
    
    if [ -z "$NGROK_URL" ]; then
        echo "Failed to get ngrok public URL after $MAX_ATTEMPTS attempts"
        exit 1
    fi
}

# Get the ngrok URL
get_ngrok_url

export WEBHOOK_URL="$NGROK_URL"
echo "Set WEBHOOK_URL to: $WEBHOOK_URL"

# Start n8n with the updated environment
exec node /usr/local/lib/node_modules/n8n/bin/n8n
