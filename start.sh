#!/bin/bash

# Railway start script for Go application
echo "Starting Go application..."

# Check if go.mod exists
if [ -f "go.mod" ]; then
    echo "Building Go application..."
    go build -o main .
    
    if [ $? -eq 0 ]; then
        echo "Starting main executable..."
        ./main
    else
        echo "Build failed!"
        exit 1
    fi
else
    echo "No go.mod found. Cannot build Go application."
    exit 1
fi