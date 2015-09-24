# apache-php for Docker
Docker image with Apache2.4 web server with PHP 5.6 based on the official Debian Jessie image

### Usage:

```docker run -d --name=apache-php -p 8080:80 -p 8443:443 chriswayg/apache-php```

* Webroot: ```/var/www/html/```
* Apache2 config: ```/etc/apache2/```

see https://github.com/chriswayg/concrete5.7 where this image is used and https://hub.docker.com/r/chriswayg/concrete5.7/

---
###### License:
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
