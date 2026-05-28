# 使用官方 LiteLLM 镜像，确保环境稳定
FROM ghcr.io/berriai/litellm:main-latest

# 设置工作目录
WORKDIR /app

# 确保配置文件被正确复制
COPY config.yaml /app/config.yaml

# 暴露端口，Railway 会自动识别
EXPOSE 4000

# 启动命令：这里去掉了 --start，因为新版镜像在检测到 config 时会自动进入 server 模式
# telemetry 设为 False 可以避免启动时的网络延迟校验
CMD ["litellm", "--config", "/app/config.yaml", "--port", "4000", "--host", "0.0.0.0", "--telemetry", "False"]
