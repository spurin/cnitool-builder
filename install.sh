#!/bin/bash

set -e

echo "🚀 Starting cnitool build..."

# Build the container image
docker build -t cnitool-builder .

echo "🏗️ Extracting built cnitool binary..."
# Create a temporary container
container_id=$(docker create cnitool-builder)

# Copy the cnitool binary out
docker cp "$container_id:/cnitool" ./cnitool

# Cleanup the temp container
echo "🧹 Removing temporary container..."
docker rm "$container_id"

# Cleanup the image
echo "🧹 Removing temporary builder image..."
docker rmi cnitool-builder

# Move to /usr/local/bin (requires sudo)
echo "🔧 Installing cnitool to /usr/local/bin (sudo may prompt you)..."
sudo mv ./cnitool /usr/local/bin/
sudo chmod +x /usr/local/bin/cnitool

echo "✅ Done! cnitool is now available at /usr/local/bin/cnitool 🎉"
