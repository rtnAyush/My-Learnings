# Installing the Latest Version of Node.js on AWS using NVM

This guide provides step-by-step instructions on how to install the latest version of Node.js on your AWS instance using NVM (Node Version Manager).

## Installation Steps

### 1. Install NVM:
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

### 2. Run (or Close and re-open your terminal):
    source ~/.bashrc

### 3. Install the latest version of Node.js using NVM:
    nvm install node

### 4. Set the installed version as the default:
    nvm alias default node

### 5. Verify the installation:
    node -v && npm -v
# Done
