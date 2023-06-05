## 1. set ssh key to clone the git code on server
 Link : <https://github.com/Ayush211107/My-Learnings/blob/main/Git%20Cheat%20Code/Clone_With_SSH.md>
 
## 2. Set You .env files

## 3. Do the server setUp once for inginx
Link <https://github.com/Ayush211107/My-Learnings/tree/main/Deploy_React_node>

## 3.a. Install Nodejs
Link <https://github.com/Ayush211107/My-Learnings/blob/main/server/Node.md>

## 3.b. MongoDB(if your are using mongodb local)
Link <https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/>

## 6. Install pm2 to keep alive your backend code
    npm i pm2 -g
    
## 5. Automate your deployement with these shell script code

### 1.make a deploy.sh file under the coloned repo folder
    sudo nano deploy.sh

### 2.Add This code to the it
    #!/bin/bash

    echo "-------------------Start Deploy under <Your_folder> dir-------"
    # git stash
    git checkout main

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

    echo "--------------------------coping to www/...-------"
    sudo cp -R build/* /var/www/qscreen/

    echo "--------------------------------done...--------------------"
    echo "----------------------now go to the api folder"

    cd ../api

    if [ -f package.json ]; then
      npm install
    fi


    echo "----------------------Check if PM2 is running and restart if necessary"
    pm2 show api-8080 > /dev/null
    if [ $? -eq 0 ]; then
      pm2 restart api-8080
    else
      pm2 start index.js --name api-8080
    fi
    pm2 save
    echo "--------------------------done------------------"
    
### 3.Give read write access
    sudo chmod +x deploy.sh
    
### 4.then run script as
    ./deploy.sh
    
# 6. Done
