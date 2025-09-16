

# 微信 VNC Docker


[English README](../README.md)

本项目为 Linux 下微信的 VNC 桌面环境 Docker 镜像，专为中文用户优化。

![WeChat VNC Demo](docs/wechat-vnc-demo.png)


## 功能
- 自动启动微信，Web 浏览器访问 VNC 桌面
- 中文语言和字体支持
- 持久化配置和数据存储
- 支持 HTTP 基本认证（可选）

## 使用方法

1. **构建并运行容器：**
   ```bash
   docker compose up --build
   ```
   通过浏览器访问 `http://localhost:3000`。

2. **认证：**
   如需开启 HTTP 基本认证，请在 `docker-compose.yml` 中设置 `CUSTOM_USER` 和 `PASSWORD`。

3. **中文支持：**
   容器已预设中文环境和字体。如需其他语言，可修改 `LC_ALL` 环境变量。

4. **输入法（IME）与剪贴板同步：**
   - **IME 输入法模式：**
     - 启动 VNC 桌面后，点击右上角齿轮图标进入设置菜单。
     - 启用“IME Input Mode”以使用本地输入法。
   - **剪贴板同步：**
     - 在设置菜单中启用“Sync clipboard to container”和“Sync clipboard to client”，实现双向剪贴板共享。
   - 这些设置为浏览器会话级，可能每次需手动开启。

## 数据持久化
- 所有微信数据存储在主机的 `wechat_data` 目录，并映射到容器的 `/config`。
- 例如，微信收到的文件会保存在 `./wechat_data/xwechat_files/wxid_<XXX>/msg/file/<DATE>/<FILE_NAME>`。

## 问题排查
- 如微信未启动，请检查 Docker 日志。
- 字体或输入问题，请确认 Web UI 设置及主机输入法支持。

## 自定义
- 可通过编辑 Dockerfile 和 autostart 文件进一步自定义桌面环境或添加应用。

---

更多详情请参考 [KasmVNC 基础镜像文档](https://docs.linuxserver.io/images/docker-baseimage-kasmvnc/)。
