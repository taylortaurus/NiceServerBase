# NiceServerBase

## Develop

```bash
# 构建镜像
docker build -t nice-server-base .

# 启动镜像
docker run -d --name nice-server-base -p 80:80 nice-server-base
docker run -d --name nice-server-base -p 80:80 --mount type=bind,source=/home/taurus/NiceServer/EasyOCR/model,target=/root/NiceServer/EasyOCR/model nice-server-base

################
# M1构建镜像
# 参考链接：https://docs.docker.com/desktop/multi-arch/

# 查看构建器
docker buildx ls

# 新增构建器m1builder并使用
docker buildx create --name m1builder --use

# 查看当前的构建器
docker buildx inspect --bootstrap

# 构建镜像，使用了amd64和arm64平台，并推送远程仓库
docker buildx build --platform linux/amd64,linux/arm64 -t taylortaurus/nice-server-base:latest --push .
```