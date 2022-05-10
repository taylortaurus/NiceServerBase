FROM python:3.8.12
ARG IMAGE_NAME=base-server
COPY . /${IMAGE_NAME}
WORKDIR /${IMAGE_NAME}
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

ARG PIP_MIRROR=https://mirrors.aliyun.com/pypi/simple/
RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip -i ${PIP_MIRROR}\
    && pip install --no-cache-dir --upgrade -r /${IMAGE_NAME}/requirements.txt -i ${PIP_MIRROR}