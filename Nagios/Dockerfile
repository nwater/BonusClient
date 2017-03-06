#基础镜像
FROM daocloud.io/library/centos:latest

#更新
#RUN yum upgrade

#安装基础软件
RUN yum install -y wget gcc glibc glibc-common gd gd-devel xinetd openssl-devel perl unzip zip

#安装Apache
RUN yum -y install httpd
#安装Apache扩展包
RUN yum -y install httpd-manual mod_ssl mod_perl
#安装php
RUN yum -y install php
#安装PHP扩展包
RUN yum -y install php-gd php-xml php-mbstring php-ldap php-pear php-xmlrpc php-devel

#创建nagios用户和用户组
RUN useradd -s /sbin/nologin nagios
RUN mkdir /usr/local/nagios
RUN chown -R nagios.nagios /usr/local/nagios

#查看nagios 目录的权限
RUN ll -d /usr/local/nagios/

#编译安装Nagios
RUN wget https://downloads.sourceforge.net/project/nagios/nagios-4.x/nagios-4.3.1/nagios-4.3.1.tar.gz
RUN tar zxvf nagios-4.3.1.tar.gz
RUN cd nagios-4.3.1
RUN ./configure --prefix=/usr/local/nagios
RUN make all
RUN make install
RUN make install-init
RUN make install-commandmode
RUN make install-config
RUN make install-webconf
RUN chkconfig --add nagios
RUN chkconfig --level 35 nagios on
RUN chkconfig --list nagios

#验证程序是否被正确安装
RUN ls /usr/local/nagios

#安装Nagios 插件
RUN cd ..
RUN wget https://nagios-plugins.org/download/nagios-plugins-2.1.4.tar.gz
RUN tar zxvf nagios-plugins-2.1.4.tar.gz
RUN cd nagios-plugins-2.1.4
RUN ./configure --prefix=/usr/local/nagios
RUN make && make install

#设置安全认证
RUN htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiosadmin

#启动服务
#RUN systemctl enable httpd.service
#RUN /etc/init.d/httpd restart
#RUN chkconfig httpd on; chkconfig naigos on


# 向外界暴露80端口
EXPOSE 80