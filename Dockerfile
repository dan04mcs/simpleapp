FROM registry.redhat.io/ubi8
MAINTAINER dan me@me.com

# Add repo file
ADD index.tar /var/www/html

# Install cool software
RUN yum --assumeyes --nodocs update && \
yum --assumeyes --nodocs install \
nmap iproute httpd && \
chown apache:apache /var/www/html/index.html && \
yum clean all

USER apache

CMD ["httpd", "-D", "FOREGROUND"]
