# Server Setup Script Documentation

This documentation covers a server setup script designed to configure a production environment for web applications using Node.js, Nginx, and PM2 on Linux systems.

## Overview

The setup script automates the following:

1. **System Updates**: Updates system packages
2. **Node.js Installation**: Installs Node.js using NVM
3. **Nginx Configuration**: Sets up Nginx as a reverse proxy for your applications
4. **Process Management**: Installs PM2 for Node.js application management and auto-restart

## Prerequisites

- Ubuntu/Debian-based Linux system
- Sudo privileges
- Server with a static IP address if boot is in requirnrment then please use elastic IP

## Configuration

Before running the script, customize these variables:

```bash
APP_NAME="your-app-name"     # Used for naming configuration files
SERVER_NAME="your-ip-or-domain"  # Your server's IP address or domain name
```

## Usage Instructions

### 1. Initial Setup

```bash
# Download the setup script
wget https://github.com/rtnAyush/My-Learnings/Server_Setup/server-setup.sh

# Make the script executable
chmod +x server-setup.sh

# Edit the script to update variables
nano server-setup.sh

# Run the script
./server-setup.sh
```

### 2. Post-Installation Steps

After the script completes:

1. Excute the output command of pm2 startup(important)
2. Start your Node.js applications with PM2:
3. Read the deploy script

## Nginx Configuration Details

The script configures Nginx with the following endpoints:

- `/ws/` → WebSocket connections (port 8081)
- `/api/auth/` → Authentication API (port 3000)
- `/api/` → Main API (port 8080)
- `/` → Frontend application (port 3000)

You can modify these paths and ports in the script to match your application's requirements.
This config is not for static apps line react.

## SSL Configuration (Optional)

For SSL setup, use a separate SSL configuration script that:

1. Installs Certbot
2. Obtains SSL certificates
3. Configures automatic renewal

## Automatic Restart

This setup ensures your applications restart automatically when the server reboots:

- Nginx starts via systemd
- PM2 starts via its startup script
- Your applications start via PM2's saved process list

## Troubleshooting

If services don't start automatically after reboot:

1. Check Nginx status:
   ```bash
   sudo systemctl status nginx
   ```

2. Check PM2 status:
   ```bash
   pm2 list
   ```

3. Verify PM2 startup configuration:
   ```bash
   pm2 startup
   ```
   Run the command it suggests if needed

4. Review logs:
   ```bash
   pm2 logs
   sudo journalctl -u nginx
   ```

## Customization

To adapt this script for different applications:

1. Modify the Nginx location blocks to match your application architecture
2. Adjust port numbers to match your application services
3. Add or remove proxy configurations based on your needs

## Security Considerations

This script provides a basic setup. For production environments, consider:

- Configuring a firewall
- Setting up SSL/TLS (in separate SSL script)
- Implementing additional security headers in Nginx
- Creating a dedicated user for running your applications
