FROM ubuntu:14.04
MAINTAINER dinglong
RUN apt-get update
RUN apt-get install -y libssl-dev libpcre3 libpcre3-dev \
	ruby ruby-dev python-pip make curl telnet 
RUN gem install fpm
RUN pip install aliyuncli aliyun-python-sdk-oss