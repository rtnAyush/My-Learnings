# Add inside deploy.sh of the nextjs file after setting 
nginx, nodeJs, mongoDB, pm2 see this <https://github.com/Ayush211107/My-Learnings/tree/main/server>
```
#!/bin/bash

PORT=<Open port of the server>
serviceName="<name of your deployment>-$PORT"

echo "-------------------Start Deploy under $PWD dir--------------"

git checkout main

git pull origin main

echo "-------------------Installing pakages...---------"

if [ -f package.json ]; then
  npm install .
  npm run build
fi


echo "----------------------Check if PM2 is running and restart if necessary"

pm2 show $serviceName > /dev/null

if [ $? -eq 0 ]; then
  pm2 restart $serviceName
else
  pm2 start npm --name $serviceName -- start --port $PORT
fi

pm2 save

echo "--------------------------done------------------"
```
