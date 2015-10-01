FROM debian:wheezy

MAINTAINER mickael.canevet@camptocamp.com

ENV PUPPET_VERSION 3.8.2-1puppetlabs1

RUN apt-get update \
  && apt-get install -y curl \
  && curl -O http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb \
  && dpkg -i puppetlabs-release-wheezy.deb \
  && apt-get clean

RUN apt-get update \
  && apt-get install -y puppet=$PUPPET_VERSION puppet-common=$PUPPET_VERSION \
  && apt-get clean
