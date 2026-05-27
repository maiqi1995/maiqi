# 使用官方 GitHub 容器注册表源，避免 Docker Hub 的拉取限制
FROM ghcr.io/berriai/litellm:main-latest

# 将本地 config.yaml 复制到容器的 /app 目录下
COPY config.yaml /app/config.yaml

# 暴露端口
EXPOSE 4000

# 启动命令
CMD ["--config", "/app/config.yaml", "--port", "4000", "--host", "0.0.0.0"]
