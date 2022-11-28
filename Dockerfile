# 基础镜像
FROM alpine:3.9

#因为我们需要运行 Python，所以需要配置环境：安装 Python 和 pip 到Apline Linux 中，该命令不仅会安装 pip 包，也会安装其他的依赖（如 Python 的解释器）
# RUN 是 Docker 的命令， apk add --update py2-pip 类似于 Linux 命令
RUN apk add --update py2-pip

# 拷贝本地文件 requirements.txt（默认与 Dockerfile 同一文件夹）到 容器的 /usr/src/app/ 文件夹下，会自动创建
COPY requirements.txt /usr/src/app/

# 安装 所需要的 python 包
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# 拷贝其他文件
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# 容器需要暴露端口，Flask 程序运行的端口
EXPOSE 5000

# 运行 python程序，该命令的意思是 python /usr/src/app/app.py
CMD ["python", "/usr/src/app/app.py"]
