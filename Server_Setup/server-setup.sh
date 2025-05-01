#!/bin/bash
APP_NAME="<Put You Name Here>"
SERVER_NAME="<Your IP>"

# Update the package list
sudo apt update
sudo apt upgrade -y

# Install Node.js and npm
echo "Installing Node.js and npm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install node
node -v && npm -v

# Install nginx
echo "Installing nginx..."
sudo apt install nginx -y

# Create Nginx configuration file
cat > /tmp/nginx-$APP_NAME << EOF
server {
    listen 80;
    server_name $SERVER_NAME;

    # Proxy for WebSocket (ws://)
    location /ws/ {
        proxy_pass http://localhost:8081;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
   
    location /api/auth/ {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
    }

    # API requests
    location /api/ {
        proxy_pass http://localhost:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
    }

    # Frontend
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
    }
}
EOF

# Move nginx config to proper location
sudo mv /tmp/nginx-$APP_NAME /etc/nginx/sites-available/$APP_NAME

# Test nginx configuration
sudo nginx -t

# Enable site and restart nginx
sudo unlink /etc/nginx/sites-enabled/default 2>/dev/null || true
sudo ln -s /etc/nginx/sites-available/$APP_NAME /etc/nginx/sites-enabled/

# Restart nginx
sudo systemctl restart nginx
echo "Nginx installed and configured."

# Install PM2
echo "Installing PM2..."
npm install pm2 -g

# Configure PM2 to start on boot
pm2 startup
# The above command will generate a command that needs to be executed
# Make sure to run that command manually

# Save PM2 process list after you've started your applications
# pm2 save

# Enable and start nginx on boot
sudo systemctl enable nginx

echo "Setup complete! Remember to manually start your Node.js applications with PM2 and then run 'pm2 save'"
