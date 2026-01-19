# PM2
- **pm2 start [pkg M name] --name [app name] -- [whatever command you want to append after npm]**
  - ```pm2 start npm --name client -- run dev -- -p 6300```
  - PM2 will run the command npm run dev -- -p 6300
  - after the dev [-- -p 6300] is for overwrtting the port in nextjs
 
- **pm2 log [app name] --lines [how many lines from end you want to see]**
  - It will print the logs of pm2 on terminal
  - ```pm2 log client --lines 30```   
