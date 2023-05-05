# 1. set ssh key to clone the git code on server
 Link : <https://github.com/Ayush211107/My-Learnings/blob/main/Git%20Cheat%20Code/Clone_With_SSH.md>
 
# 2. Set You .env files

# 3. Do the server setUp once for inginx
Link <https://github.com/Ayush211107/My-Learnings/tree/main/Deploy_React_node>

# 4. Do all other thing in 1 step when you change some thing

## 1.make a deploy.sh file using
    sudo nano deploy.sh

## 2.Add This code to the it
    #!/bin/bash

    echo "-------------------Changing to QScreen dir-------"
    cd QScreen
    # git stash
    git checkout master

    git pull

    echo "-------------------Installing pakages...---------"

    cd client
    if [ -f package.json ]; then
      npm install .
      echo "------------------------making build dir--------"
      npm run build
      echo "------------------------deleting pakeages"
      sudo rm -rf node_modules
    fi

    if [ -f Makefile ]; then
      make
    fi

    echo "--------------------------coping to www/...-------"
    sudo cp -R build/* /var/www/qscreen/

    echo "--------------------------------done...--------------------"
    echo "----------------------now go to the api folder"

    cd ../api

    if [ -f package.json ]; then
      npm install
    fi
    
    
    echo "----------------------Check if PM2 is running and restart if necessary"
    pm2 show qascreen-api-8080 > /dev/null
    if [ $? -eq 0 ]; then
      pm2 restart qascreen-api-8080
      pm2 save
    else
      pm2 start index.js --name qascreen-api-8080
      pm2 save
    fi

    echo "--------------------------done------------------"
    
## 3.Give read write access
    sudo chmod +x deploy.sh
    
## 4.then run script as
    ./deploy.sh
