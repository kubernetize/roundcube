FROM ghcr.io/rkojedzinszky/webhost-images/php83

LABEL org.opencontainers.image.authors "Richard Kojedzinszky <richard@kojedz.in>"
LABEL org.opencontainers.image.source https://github.com/kubernetize/roundcube

ARG RC_VER=1.6.18

USER 0

COPY assets/ /

RUN phpver=$(php -r 'echo PHP_MAJOR_VERSION . PHP_MINOR_VERSION;') && \
    rm -rf "/etc/php${phpver}/conf.d" && \
    ln -sf /etc/php/conf.d "/etc/php${phpver}/conf.d" && \
    mkdir -p /var/www/html && \
    curl -sL https://github.com/roundcube/roundcubemail/releases/download/${RC_VER}/roundcubemail-${RC_VER}-complete.tar.gz | tar xzf - -C /var/www/html --strip-components=1 && \
    chown 8080:8080 /var/www/html/logs

USER 8080
