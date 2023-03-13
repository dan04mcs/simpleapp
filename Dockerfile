FROM registry.redhat.io/ubi8
MAINTAINER dan me@me.com

# Add repo file
ADD index.tar /var/www/html

# Install cool software
RUN yum --assumeyes --nodocs update && \
yum --assumeyes --nodocs install \
nmap iproute httpd && \
yum clean all && \
chown apache:apache /run/httpd.pid



CMD ["httpd", "-D", "FOREGROUND"]
