FROM ghcr.io/rkojedzinszky/webhost-images/php83

LABEL org.opencontainers.image.authors "Richard Kojedzinszky <richard@kojedz.in>"
LABEL org.opencontainers.image.source https://github.com/kubernetize/roundcube

ARG RC_VER=1.6.8

USER 0

RUN mkdir -p /var/www/html

RUN curl -sL https://github.com/roundcube/roundcubemail/releases/download/${RC_VER}/roundcubemail-${RC_VER}-complete.tar.gz | tar xzf - -C /var/www/html --strip-components=1 && \
    chown 8080:8080 /var/www/html/logs

COPY assets/ /

USER 8080
