# How to delete the last commits 
1. To only delete the commit not the changes
```
git reset --soft HEAD^
```

2. To delete the commit and as well as changes
```
git reset --hard HEAD^
```

# How to regain the files if you have done --hard mistakly
1. first see the ref logs
```
git reflog
```
2. Grab the hash string that represent your delete work
3. Do reset again to take the commit back
```
git reset --hard <hash key>
```
4. the do the soft reset to only delete the commit
```
git reset --soft HEAD^
```
