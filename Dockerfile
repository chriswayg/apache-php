FROM debian:jessie
MAINTAINER Christian Wagner chriswayg@gmail.com

# Usage:
# docker run -d --name=apache-php -p 8080:80 -p 8443:443 chriswayg/apache-php
# webroot: /var/www/html/
# Apache2 config: /etc/apache2/

RUN apt-get -y update && \
      DEBIAN_FRONTEND=noninteractive apt-get -y install \
      apache2 \
      libapache2-mod-php5 \
      php5 && \
    apt-get clean && rm -r /var/lib/apt/lists/*

# Apache + PHP requires preforking Apache for best results & enable Apache SSL
RUN a2dismod mpm_event && \
    a2enmod mpm_prefork \
            ssl \
            rewrite && \
    a2ensite default-ssl

WORKDIR /var/www/html

COPY apache2-foreground /usr/local/bin/

EXPOSE 80
EXPOSE 443

CMD ["/usr/local/bin/apache2-foreground"]
