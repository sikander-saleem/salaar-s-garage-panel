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

echo "Installing dependencies & building frontend..."
npm install
npm run build

echo "Clearing caches..."
php artisan view:clear
php artisan cache:clear
php artisan config:clear
php artisan optimize:clear

<<<<<<< HEAD
echo "Theme installation complete!"
=======
echo "Theme installation complete!"
>>>>>>> 5fb41fe8300959c66ab3bcd6bdf0eacba645f907
