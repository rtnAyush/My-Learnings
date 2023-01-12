### (HEAD -> master) -> is local repo

### (origin/master) -> is gitHub repo

### --> initialize the directory
      git init

### --> add files inti staging area
      $ git add <fileName or . >
      
### --> See the status of staging area
      $ git status


### --> Commit file to making end-point
      $ git commit -m "description about commit"

###  --> undo commit
      $ git rm --cached -r .

###  --> to view all the commit detais
      $ git log

### --> To view the changes in any files
      $ git diff <file-name>

###  --> for going to the last saved commit
      $ git checkout <file-name>

###  --> to set remote repo to git Hub
      $ git remote add origin <url>

###  --> push files to the gitHub
      $ git push -u origin master

### --> to clone any  repository 
      $ git clone <url>

### --> To view all branches
      $ git branch

### --> To create new branches
      $ git branch <new-branch-name>

### --> To see other branches changes
      $ git checkout <branch-name>

###  --> To merge branches
      $ git merge <name-of-main-branch>

### to close vim ->  :q!
