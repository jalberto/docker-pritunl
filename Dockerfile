FROM centos:latest
MAINTAINER jalberto

# initial upgrade (+ dependencies installation)
RUN yum upgrade -y && yum install -y epel-release openssl

# add Pritunl repository
COPY pritunl.repo /etc/yum.repos.d/pritunl.repo
COPY mongo.repo /etc/yum.repos.d/mongo.repo

RUN \
    gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A && \
    gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A > key.tmp; rpm --import key.tmp; rm -f key.tmp && \
    yum upgrade -y && yum install -y pritunl mongodb-org

# use predefined Pritunl config for local MongoDB server
COPY pritunl.conf /etc/pritunl.conf

# support files
COPY pritunl.sh /usr/local/bin/pritunl.sh
RUN \
  chmod +x /usr/local/bin/pritunl.sh && \
  yum clean all && \
  rm -rf /var/tmp/* /tmp/*

# meta
CMD /usr/local/bin/pritunl.sh
EXPOSE 1194/udp 1194/tcp 443/tcp 9700/tcp 80/tcp
VOLUME /var/lib/mongodb /var/lib/pritunl
