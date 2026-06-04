#!/bin/bash

# This script runs when the build completes on Railway

set -e

echo "Building Hexaglass application..."

# Install PHP dependencies
composer install --no-interaction --optimize-autoloader --no-dev

# Install and build Node dependencies
npm install
npm run build

# Create symbolic link for storage
php artisan storage:link || true

echo "Build complete!"
