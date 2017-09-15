FROM alpine:3.6
MAINTAINER Marcio Bigolin <marcio.bigolinn@gmail.com>
LABEL Description="Uma pequena imagem para você testar o poder do Eyalius"

RUN apk --update add apache2 php7-apache2 curl php7-curl php7-json php7-pgsql php7-openssl php7-xml php7-gd php7-xdebug 

RUN rm -f /var/cache/apk/* \
    && mkdir /run/apache2 \
    && mkdir -p /opt/utils 


EXPOSE 80

ADD start.sh /opt/utils/

RUN chmod +x /opt/utils/start.sh

ENTRYPOINT ["/opt/utils/start.sh"]
