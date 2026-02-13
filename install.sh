#!/bin/bash

# Check if running in panel root
if [ ! -d "public" ] || [ ! -d "resources" ]; then
    echo "Error: Run this inside /var/www/pterodactyl"
    exit 1
fi

echo "Backing up existing theme..."
tar -czvf panel-theme-backup-$(date +%F).tar.gz public resources

echo "Downloading theme from GitHub..."
curl -L https://github.com/sikander-saleem/salaar-s-garage-panel/archive/refs/heads/main.tar.gz -o theme.tar.gz
tar -xzf theme.tar.gz --strip-components=1

echo "Clearing caches..."
php artisan view:clear
php artisan cache:clear
php artisan config:clear
php artisan optimize:clear

<<<<<<< HEAD
echo "Theme installation complete!"
=======
echo "Theme installation complete!"
