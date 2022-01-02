FROM registry.lan/krichy/webhost-php8

ARG RC_VER=1.5.2

USER 0

RUN apk --no-cache add curl tar && \
    mkdir /var/www/html

RUN curl -sL https://github.com/roundcube/roundcubemail/releases/download/${RC_VER}/roundcubemail-${RC_VER}-complete.tar.gz | tar xzf - -C /var/www/html --strip-components=1 && \
    chown 8080:8080 /var/www/html/logs

USER 8080

CMD ["/usr/local/sbin/httpd"]
