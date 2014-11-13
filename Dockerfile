##
# CentOS 7 plus Oracle JDK 8
##
FROM centos:centos7
MAINTAINER Dawid Malinowski <dawidmalina@gmail.com>

# some env
ENV REFRESHED_AT 2014-11-06
ENV JDK_VERSION 8u25
ENV JDK_BUILD_VERSION b17

# install curl
RUN yum -y install curl

# download jdk
RUN curl -LO "http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-$JDK_BUILD_VERSION/jdk-$JDK_VERSION-linux-x64.rpm" -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN rpm -i jdk-$JDK_VERSION-linux-x64.rpm && rm -f jdk-$JDK_VERSION-linux-x64.rpm

# set java home
ENV JAVA_HOME /usr/java/default

# clean all cache to clean space
RUN yum clean all

# default command
CMD ["java"]

# clean packages
RUN yum clean all
