########################################################
# Dockerfile - Nginx + Express 同容器最完整範例
########################################################

# 1. 指定使用 Node 18 作為基底鏡像
FROM node:18

# 2. 建立一個工作目錄 /app
WORKDIR /app

# 3. 複製 express/package.json 並安裝依賴
#    (假設你的 Express 後端在 express/ 這個資料夾)
COPY express/package.json .
RUN npm install

# 4. 再將整個 express/ 資料夾複製到容器的 /app/express
COPY express ./express

# 5. 安裝 Nginx
RUN apt-get update && apt-get install -y nginx

# 6. 複製我們自訂的 default.conf 覆蓋到 /etc/nginx/conf.d/default.conf
#    !!! 這一行就是重點 !!!
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# 7. 複製並設定 start.sh（同時啟動 Express 與 Nginx）
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 8. 對外暴露 80 埠（Nginx 監聽的對外入口）
EXPOSE 80

# 9. 容器啟動時，執行 /start.sh
CMD ["/start.sh"]
