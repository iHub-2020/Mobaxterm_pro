# Title: MobaXterm Pro KeyGen Dockerfile
# Version: 1.0.0
# Author: Reyanmatic
# Description: Dockerfile to build the MobaXterm KeyGen container.

FROM python:3.9-slim

MAINTAINER Reyanmatic

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./app.py" ]
