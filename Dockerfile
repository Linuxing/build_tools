FROM debian
MAINTAINER dinglong
RUN apt-get update && apt-get install -y libssl-dev libpcre3 libpcre3-dev \
	ruby ruby-dev python-pip make curl telnet 
RUN gem install fpm
RUN pip install aliyuncli aliyun-python-sdk-oss
COPY osscmd /usr/bin/
COPY qshell_linux_amd64 /usr/bin/qshell
RUN chmod u+x /usr/bin/osscmd
RUN chmod u+x /usr/bin/qshell

ENV JDK jdk-7u79-linux-x64
ENV MVN apache-maven-3.3.9-bin
ENV NODE node-v6.10.0
ENV MVN_HOME /usr/local/apache-maven-3.3.9
ENV JAVA_HOME /usr/local/jdk1.7.0_79
ENV NODE_HOME /usr/local/node-v6.10.0

ADD http://xiaoer-packages.oss-cn-shenzhen.aliyuncs.com/${JDK}.tar.gz /usr/local/
ADD http://mirrors.cnnic.cn/apache/maven/maven-3/3.3.9/binaries/${MVN}.tar.gz /usr/local/
ADD https://nodejs.org/dist/v6.10.0/${NODE}.tar.gz /usr/local/

RUN mkdir ${JAVA_HOME} \
    && tar -xf /usr/local/${JDK}.tar.gz -C /usr/local \
    && rm /usr/local/${JDK}.tar.gz
RUN mkdir ${MVN_HOME} \
    && tar -xf /usr/local/${MVN}.tar.gz /usr/local \
    && rm /usr/local/${MVN}.tar.gz
RUN mkdir ${NODE_HOME} \
    && tar -xf /usr/local/${NODE}.tar.gz /usr/local \
    && rm /usr/local/${NODE}.tar.gz


ENV PATH ${NODE_HOME}/bin:${JAVA_HOME}/bin:${MVN_HOME}/bin:$PATH
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
