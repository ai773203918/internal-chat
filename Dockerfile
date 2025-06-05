FROM node:16-alpine
# 设置工作目录
WORKDIR /usr/src/app
# 复制项目文件到容器中
COPY . .
# 安装项目依赖
RUN npm install && \
    npm cache clean --force
# 暴露端口
EXPOSE 8081
# 启动命令
CMD ["npm", "run", "start"]
