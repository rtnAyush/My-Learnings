# SSL Setup Script Documentation

This documentation covers a script designed to automate the SSL certificate setup process using Certbot with Nginx on Linux systems.

## Overview

The SSL setup script automates the following tasks:

1. **Certbot Installation**: Installs Certbot and the Nginx plugin
2. **SSL Certificate Acquisition**: Obtains SSL certificates for your specified domain
3. **Automatic Renewal**: Sets up a cron job for certificate renewal
4. **Verification**: Confirms the cron job was successfully added

## Prerequisites

- Ubuntu/Debian-based Linux system
- Sudo privileges
- Nginx already installed and configured
- Domain name with DNS correctly configured to point to your server
- Port 80 and 443 open in your firewall/security group

## Configuration

Before running the script, make sure to:

1. Set your domain name in the script:
```bash
DOMAIN_NAME="your-domain.com"
```

2. Ensure Nginx is properly configured for the domain

## Usage Instructions

### 1. Initial Setup

```bash
# Download the SSL setup script
wget https://github.com/rtnAyush/My-Learnings/Free_SSL/setup-ssl.sh

# Make the script executable
chmod +x setup-ssl.sh

# Edit the script to set your domain name
nano setup-ssl.sh  # Replace empty DOMAIN_NAME="" with your domain

# Run the script
./setup-ssl.sh
```

### 2. After Running the Script

After the script completes:

1. Verify that HTTPS is working by visiting your domain with `https://` prefix
2. Check the Nginx configuration to ensure redirects are properly set up
3. Test certificate auto-renewal:
   ```bash
   sudo certbot renew --dry-run
   ```

## How It Works

1. **Certbot Installation**: Installs Certbot and the Nginx plugin using apt
2. **Certificate Acquisition**: 
   - Runs Certbot with the `--nginx` flag to both obtain certificates and configure Nginx
   - Creates a certificate for the domain specified in `DOMAIN_NAME`
3. **Automatic Renewal**:
   - Sets up a cron job that runs at midnight every day
   - The job executes `certbot renew` which only renews certificates nearing expiration
   - The `--quiet` flag prevents unnecessary output

## Troubleshooting

If you encounter issues:

1. **Certificate acquisition fails**:
   - Ensure your domain points to your server's IP address
   - Check that port 80 is accessible from the internet
   - Verify Nginx is running: `sudo systemctl status nginx`
   - Check Nginx configuration: `sudo nginx -t`

2. **Renewal doesn't work**:
   - Manually run: `sudo certbot renew --dry-run`
   - Check cron job: `crontab -l`
   - Review Certbot logs: `sudo journalctl -u certbot`

## Additional Notes

- This script uses Certbot's Nginx plugin to automatically configure HTTPS in Nginx
- Let's Encrypt certificates are valid for 90 days
- The renewal cron job runs daily but only renews certificates that expire within 30 days
- Certbot automatically handles backing up and restoring your Nginx configuration

## Security Improvements

For enhanced security, consider:

1. Implementing stronger SSL parameters in Nginx
2. Adding security headers to your Nginx configuration
3. Setting up HSTS (HTTP Strict Transport Security)
4. Configuring Content Security Policy (CSP)
