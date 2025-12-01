# Title: MobaXterm Pro KeyGen Dockerfile
# Version: 1.0.2
# Author: Reyanmatic
# Description: Dockerfile to build the MobaXterm KeyGen container (Production Ready).

FROM python:3.9-slim

# 使用 LABEL 替代已废弃的 MAINTAINER 指令
LABEL maintainer="Reyanmatic"
LABEL version="1.0.2"
LABEL description="MobaXterm KeyGen Container"

WORKDIR /usr/src/app

COPY requirements.txt ./

# 增加国内源配置（可选，如果构建速度慢可以取消注释下面这行）
# RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 安装依赖（包含了 gunicorn）
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# --- 生产环境启动命令修改说明 ---
# 使用 Gunicorn 启动 Flask 应用，替代 Flask 自带的开发服务器
# -w 4 : 启动 4 个 worker 进程处理并发请求
# -b 0.0.0.0:5000 : 绑定到 5000 端口
# app:app : 第一个 app 指文件名(app.py)，第二个 app 指 Flask 实例名(app = Flask(__name__))
CMD [ "gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app" ]
