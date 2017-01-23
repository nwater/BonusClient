# WeShop.Api

# 基于microsoft/dotnet:latest构建Docker Image
FROM daocloud.io/library/logstash:5.1-alpine

# 进入docker中的/usr/local/src目录
RUN cd /usr/share/logstash

# 创建WeShop.Api目录
RUN bin/logstash-plugin install logstash-output-jdbc

# 设置工作路径
#WORKDIR /usr/local/src/WeShop.Api

# 将当前文件夹下的所有文件全部复制到工作目录
#COPY ./ ./

# 向外界暴露8001端口
EXPOSE 9600
EXPOSE 8514

# 执行dotnet WeShop.Api命令
#CMD ["dotnet", "WeShop.Api.dll"]
