#!/bin/bash
cd /home/ec2-user/server/src
npm install
pm2 start npm - name "react" - start
pm2 save
pm2 startup
pm2 restart all