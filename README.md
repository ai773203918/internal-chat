# 发个东西
一个局域网文字/文件P2P传输工具
> 项目中仅在线用户列表和WebRTC信令迫不得已需要一个轻量化的服务，其他数据传输都采用了基于WebRTC的点对点传输，不经过中间服务器，所以局域网内互传一些文字/文件都比较快。

demo演示：https://fagedongxi.com

## 优点
无需安装任何软件，打开浏览器，无需登录直接传输。

## 缺点
接收大文件比较吃内存（单文件几百兆一般没问题）

## 场景：
比如新装的win系统需要从mac系统传一些需要🪜才能下载的软件或者搜到的一些东西

## 部署/启动
> 自`1.1.0`版本后，不再需要单独部署网页端了，仅启动一个服务端即可

参考视频：https://v.douyin.com/zp_dXkV1fys/

### 源码方式
1. 安装nodejs，node版本没有测试，我用的是 `16.20.2`
2. 下载源码
3. 进入 项目根目录，运行 `npm install`
4. 运行 `npm run start [port]` ，例如 `npm run start 8081`

### 二进制方式
* 下载对应平台的可执行文件，直接执行即可（服务端）
* 默认监听 `8081` 端口，可通过参数指定端口，例如 `./internal-chat-linux 8082`
* 如果你用windows，可参考 https://v.douyin.com/CeiJahpLD/ 注册成服务

### nginx代理配置样例
```
server
{
  server_name fagedongxi.com;
  index index.html;
  listen 80;

  location / {
    proxy_pass  http://127.0.0.1:8081/;
  }

  location /ws/ {
      proxy_pass http://127.0.0.1:8081/ws/;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }

}
```
## 免责声明：
本项目仅用于学习交流，请勿用于非法用途，否则后果自负。
