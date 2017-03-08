FROM ubuntu:14.04
MAINTAINER dinglong
RUN apt-get update && apt-get install -y libssl-dev libpcre3 libpcre3-dev \
	ruby ruby-dev python-pip make curl telnet 
RUN gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
RUN gem install fpm
RUN pip install aliyuncli aliyun-python-sdk-oss
COPY osscmd /usr/bin/
COPY qshell_linux_amd64 /usr/bin/qshell
RUN chmod u+x /usr/bin/osscmd
RUN chmod u+x /usr/bin/qshell
ADD http://xiaoer-packages.oss-cn-shenzhen.aliyuncs.com/jdk-7u79-linux-x64.tar.gz /usr/local/
ADD http://mirrors.cnnic.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz /usr/local/
ADD https://nodejs.org/download/release/v0.12.9/node-v0.12.9.tar.gz /usr/local/

RUN tar -xf /usr/local/jdk-7u79-linux-x64.tar.gz && rm /usr/local/jdk-7u79-linux-x64.tar.gz
RUN tar -xf /usr/local/apache-maven-3.3.9-bin.tar.gz && rm /usr/local/apache-maven-3.3.9-bin.tar.gz
RUN mkdir /usr/local/node-v0.12.9 &&  tar -xf /usr/local/node-v0.12.9.tar.gz -C /usr/local/node-v0.12.9 && rm /usr/local/node-v0.12.9.tar.gz

ENV MVN_HOME /usr/local/apache-maven-3.3.9
ENV JAVA_HOME /usr/local/jdk1.7.0_79
ENV PATH /usr/local/node-v0.12.9/bin:${JAVA_HOME}/bin:${MVN_HOME}/bin:$PATH
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN npm install npm -g
RUN npm install -g bower
