# apache-php for Docker

Docker image with Apache2 web server and PHP based on the official Debian Jessie image

[![](https://badge.imagelayers.io/chriswayg/apache-php:latest.svg)](https://imagelayers.io/?images=chriswayg/apache-php:latest)

- Apache 2.4 web server 
- HTTPS/SSL enabled
- PHP 5.6
- logging enabled
- all original Debian Packages (not compiled from source)
- this image automatically updates on Docker Hub, each time the Debian image is updated

## Apache

The Apache HTTP Server, colloquially called Apache, is a Web server application notable for playing a key role in the initial growth of the World Wide Web. Originally based on the NCSA HTTPd server, development of Apache began in early 1995 after work on the NCSA code stalled. Apache quickly overtook NCSA HTTPd as the dominant HTTP server, and has remained the most popular HTTP server in use since April 1996.

> [wikipedia.org/wiki/Apache_HTTP_Server](http://en.wikipedia.org/wiki/Apache_HTTP_Server)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/httpd/logo.png)

## PHP 

PHP is a server-side scripting language designed for web development, but which can also be used as a general-purpose programming language. PHP can be added to straight HTML or it can be used with a variety of templating engines and web frameworks. PHP code is usually processed by an interpreter, which is here implemented as a native module. Apache and PHP requires preforking Apache for best results.

> [wikipedia.org/wiki/PHP](http://en.wikipedia.org/wiki/PHP)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/php/logo.png)

## Quickstart:

### Example with host mount:

```
mkdir -p html && echo "<?php phpinfo(); ?>" > html/index.php

docker run -d --name=apache-php \
--restart=always \
-p 80:80 -p 443:443 \
-v "$PWD/html":/var/www/html \
chriswayg/apache-php
```

### Alternatively create a `Dockerfile` for your project

The `./html/` directory contains all your php files and the `./config/` directory contains your `php.ini` file. It is recommended to add a custom `php.ini` configuration. `COPY` it into `/etc/php5/apache2/`.

`Dockerfile`
```
FROM chriswayg/apache-php
COPY ./html/ /var/www/html/
COPY ./config/php.ini /etc/php5/apache2/
```

Then, run the commands to build and run the Docker image:

```
docker build -t my-php-site .
docker run -d --name=my-php-site_1 -p 80:80 -p 443:443 my-php-site
docker logs my-php-site_1
```

### SSL Certificate & Key

By default, Apache will use the Debian generated "snakeoil" key when serving SSL. Obviously this isn't sufficient or advisable for production, so you'll want to mount or copy a real certificate into `/etc/ssl/certs/` and the coreesponding key into `/etc/ssl/private/`. Edit `default-ssl.conf` to include the paths to your new cert and key and mount or copy it into `/etc/apache2/sites-available/` If you don't want to use SSL, you don't need to forward port 443 when running the container.

### Directories with important data:

Copy or mount needed data for these directories as described above or use [Data Volume Containers](https://docs.docker.com/userguide/dockervolumes/) to store the data.

* Webroot: `/var/www/html/`
* Apache2 config: `/etc/apache2/`
* SSL: `/etc/ssl/`
* PHP: `/etc/php5/apache2/php.ini`

### Used by Concrete5.7 CMS Docker Image

See how this image is used as the base of my [Concrete5.7 CMS Docker Image](https://hub.docker.com/r/chriswayg/concrete5.7/) and the corresponding Github repository here: https://github.com/chriswayg/concrete5.7

---
###### License:
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
