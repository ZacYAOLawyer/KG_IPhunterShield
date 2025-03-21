# 1. 使用官方 node 18 作為基底
FROM node:18

# 2. 建立工作目錄
WORKDIR /app

# 3. 安裝 Express 依賴
COPY express/package.json .
RUN npm install

# 4. 複製 express 裡所有程式檔案
COPY express ./express

# 5. 安裝 Nginx
RUN apt-get update && apt-get install -y nginx

# 6. 覆蓋 Nginx 預設配置
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# 7. 複製並設置 start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 8. 對外暴露 80 埠
EXPOSE 80

# 9. 指定容器啟動指令，同時跑 Node & Nginx
CMD ["/start.sh"]
