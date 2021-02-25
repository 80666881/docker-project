# 基础镜像node
FROM  node 
# ADD是将当前文件夹下的哪些文件添加到镜像中 参数是 [src,target]
ADD . /app/
# EXPOSE是向外暴露的端口号
EXPOSE 3001
# WORKDIR是说工作目录，我们这里将文件添加到的是app目录，所以配置app目录为工作目录，这样就不用在命令行前面加/app了
WORKDIR /app
# 换镜像加速
RUN sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list
RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN sed -i "s/security.debian.org/mirrors.aliyun.com\/debian-security/g" /etc/apt/sources.list
RUN npm install
CMD ["node","./index.js"]

# shell
# app是镜像名称
# docker image build ./ -t app