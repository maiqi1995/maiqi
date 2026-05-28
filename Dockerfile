# 使用官方镜像
FROM ghcr.io/berriai/litellm:main-latest

# 设置工作目录
WORKDIR /app

# 将本地配置文件复制到容器的 /app 目录下
COPY config.yaml /app/config.yaml

# 暴露 LiteLLM Proxy 默认端口
EXPOSE 4000

# 使用环境变量形式启动，确保 LiteLLM 能正确识别并读取配置
# --config 指定配置文件
# --port 指定端口
# --host 设置为 0.0.0.0 以便 Railway 正确映射
# 增加 --telemetry False 以减少不必要的外部请求，提升响应速度
ENTRYPOINT ["litellm"]
CMD ["--config", "/app/config.yaml", "--port", "4000", "--host", "0.0.0.0", "--telemetry", "False"]
