# 基础镜像node
FROM  node 
# ADD是将当前文件夹下的哪些文件添加到镜像中 参数是 [src,target]
ADD . /app/
# EXPOSE 指令是声明运行时容器提供服务端口，这只是一个声明，在运行时并不会因为这个声明应用就会开启这个端口的服务。在 Dockerfile 中写入这样的声明有两个好处，一个是帮助镜像使用者理解这个镜像服务的守护端口，以方便配置映射；另一个用处则是在运行时使用随机端口映射时，也就是 docker run -P 时，会自动随机映射 EXPOSE 的端口。
EXPOSE 3008
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

# 查看最近5个容器
# docker ps -n 5
# 删除容器
# docker rm

# 运行docker
#docker run --rm -d  -p 3008:3008/tcp app:latest

# 查看所有镜像
# docker images

