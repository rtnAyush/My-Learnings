# SERVER SETUP

### connect with server
    ssh root@<server ip address> 
    
### Installing Nginx
    sudo apt install nginx
    
### mkdir servering folder
    sudo mkdir /var/www/folder_name
```
sudo chmod 755 -R /var/www/folder_name
```   
    sudo chown -R <user_name>:www-data /var/www/folder_name
```
sudo nano /etc/nginx/sites-available/folder_name
```
 ### add this to in it
     
     server {
          listen 80;

          location / {
                root /var/www/folder_name;
                index  index.html index.htm;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
                try_files $uri $uri/ /index.html;
          }


          location /api {
                proxy_pass http://<YOUR_IP>:<PORT_OF_API>;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
          }
    }

### restart nginx
    sudo nginx -t
  ![image](https://user-images.githubusercontent.com/98096047/233639231-28c1733d-85c1-4fd7-a6f9-35a6c3e07423.png)

### unlink and link
    sudo unlink /etc/nginx/sites-enabled/default
```   
sudo ln -s /etc/nginx/sites-available/folder_name /etc/nginx/sites-enabled/
```           
        
### restart nginx
    sudo nginx -t
  ![image](https://user-images.githubusercontent.com/98096047/233639231-28c1733d-85c1-4fd7-a6f9-35a6c3e07423.png)

### restart nginx
    sudo systemctl restart nginx


### restart nginx
    sudo nginx -t
  ![image](https://user-images.githubusercontent.com/98096047/233639231-28c1733d-85c1-4fd7-a6f9-35a6c3e07423.png)


## Now you two options
### 1. Upload only build folder to the /var/www/folder_name
### make a deploy.sh file 
    # echo "switching to branch main"
    # git checkout main
    # git add .
    # git commit -m "add add-business pages"


    echo "Building app..."
    npm run build

    echo "Deploying files to server..."
    scp -r build/* root@<server_ip_address>/var/www/folder_name/

    echo "Done!"
        
### then run this in git_bash shell as ./deploy.sh and hit the password and now you can see your code on your public ip

### Installing and configure Firewall(No use in AWS)
    sudo apt install ufw
    
    sudo ufw enable
    
    sudo ufw allow "Nginx Full"

### Start Nginx and check the page
    systemctl start nginx

# REACT DEPLOY
