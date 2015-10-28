# apache-php for Docker
Docker image with Apache2 web server and PHP based on the official Debian Jessie image
- Apache2.4 web server 
- HTTPS/SSL enabled
- PHP 5.6
- logging enabled
- all original Debian Packages (not compiled from source)
- this image updates automatically on Docker Hub, when Debian image is updated

## Apache

The Apache HTTP Server, colloquially called Apache, is a Web server application notable for playing a key role in the initial growth of the World Wide Web. Originally based on the NCSA HTTPd server, development of Apache began in early 1995 after work on the NCSA code stalled. Apache quickly overtook NCSA HTTPd as the dominant HTTP server, and has remained the most popular HTTP server in use since April 1996.

> [wikipedia.org/wiki/Apache_HTTP_Server](http://en.wikipedia.org/wiki/Apache_HTTP_Server)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/httpd/logo.png)

## PHP 

PHP is a server-side scripting language designed for web development, but which can also be used as a general-purpose programming language. PHP can be added to straight HTML or it can be used with a variety of templating engines and web frameworks. PHP code is usually processed by an interpreter, which is here implemented as a native module. Apache and PHP requires preforking Apache for best results.

> [wikipedia.org/wiki/PHP](http://en.wikipedia.org/wiki/PHP)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/php/logo.png)

## Usage:

### Example with host mount:

```
docker run -d --name=apache-php \
--restart=always \
-p 8080:80 -p 8443:443 \
-v "$PWD/html":/var/www/html \
chriswayg/apache-php
```

* Webroot: `/var/www/html/`
* Apache2 config: `/etc/apache2/`
* PHP: `/etc/php5/apache2/php.ini`

### Alternatively create a `Dockerfile` for your project

Where `src/` is the directory containing all your php code and `config/` contains your `php.ini` file. 
We recommend that you add a custom `php.ini` configuration. `COPY` it into `/etc/php5/apache2/`.

```Dockerfile
FROM chriswayg/apache-php
COPY src/ /var/www/html/
COPY config/php.ini /etc/php5/apache2/
```

Then, run the commands to build and run the Docker image:

```Console
$ docker build -t my-php-app .
$ docker run -d --name=my-php-app_1 -p 8080:80 -p 8443:443 chriswayg/apache-php
$ docker logs my-php-app_1
```

### Used by Concrete5.7 CMS Docker Image

See https://github.com/chriswayg/concrete5.7 where this image is used and https://hub.docker.com/r/chriswayg/concrete5.7/

---
###### License:
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
