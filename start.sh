#!/bin/bash
# 啟動 Express (port 3000)，在後台執行
node /app/express/server.js &

# 以前景模式執行 Nginx（才能維持容器不結束）
nginx -g 'daemon off;'
