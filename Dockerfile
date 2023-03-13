FROM registry.redhat.io/ubi8
MAINTAINER dan me@me.com

# Add repo file
ADD index.html.tar /var/www/html

# Install cool software
RUN yum --assumeyes --nodocs update && \
yum --assumeyes --nodocs install \
nmap iproute httpd && \
yum clean all

CMD ["httpd", "-D", "FOREGROUND"]
