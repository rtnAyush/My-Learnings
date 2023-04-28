# Clone with SSH

## 1. Genrate and save ssh key on the computer where you want to clone private repo

### 1. To Genrate key
        ssh-keygen -t rsa -C "<YOUR_EMAIL>"
        
![image](https://user-images.githubusercontent.com/98096047/235223354-c5908668-9d09-43c6-bd56-d001174687a1.png)

        
### 2. To save inside your host
        ssh-add ~/.ssh/id_rsa
### (or)
        ssh-agent -s


### 3. Copy the ssh key
        cat ~/.ssh/id_rsa.pub
        
![image](https://user-images.githubusercontent.com/98096047/235225306-89d08d7e-595b-403f-9549-a51463459347.png)


## 2. Open your Github and add that ssh into settings --> SSH and GPG key section

![image](https://user-images.githubusercontent.com/98096047/235224528-6502683d-b6a6-49e3-aa48-c3ed9bd998e1.png)


## 3. Copy the ssh key from repo and goto your computer where to setup the ssh key and clone the repo
        git clone <SSH>
