#!/bin/bash

# Set the server name variable
DOMAIN_NAME=""

# Install Certbot for SSL
echo "Installing Certbot..."
sudo apt install certbot python3-certbot-nginx -y

# Obtain SSL certificate
echo "Obtaining SSL certificate..."
sudo certbot --nginx -d $DOMAIN_NAME

# Setup cron job for certbot renewal
echo "Setting up cron job for certbot renewal..."
(crontab -l 2>/dev/null; echo "0 0 * * * /usr/bin/certbot renew --quiet") | crontab -

# Check if the cron job was added
crontab -l | grep "certbot renew" > /dev/null
if [ $? -eq 0 ]; then
    echo "Cron job for certbot renewal added successfully."
else
    echo "Failed to add cron job for certbot renewal."
fi

echo "SSL setup complete for $DOMAIN_NAME"
