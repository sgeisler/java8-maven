#
# Java 1.8 & Maven Dockerfile
#

# pull base image.
FROM debian:8

# maintainer details
MAINTAINER Sebastian Geisler "sgeisler@wh2.tu-dresden.de"

RUN \
  echo "deb http://ftp.de.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

# update packages and install maven
RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y wget curl git openjdk-8-jdk

RUN \
  update-java-alternatives -s /usr/lib/jvm/java-1.8.0-openjdk-amd64

RUN \
  apt-get install -y --no-install-recommends maven

# attach volumes
VOLUME /volume/git

# create working directory
RUN mkdir -p /local/git
WORKDIR /local/git

# run terminal
CMD ["/bin/bash"]
