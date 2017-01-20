#!/bin/bash -e
set -e
# Apache2 custom servername, alias and documentroot
sed -i "s/MYSERVERNAME/$XDEBUG_SERVERNAME/g" /etc/apache2/apache2.conf
sed -i "s/MYSERVERALIAS/$XDEBUG_SERVERALIAS/g" /etc/apache2/apache2.conf
sed -i "s/MYDOCUMENTROOT/$DOCUMENTROOT/g" /etc/apache2/apache2.conf

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

chown -R www-data:www-data /var/www/
# Start Apache in foreground
/usr/sbin/apache2 -DFOREGROUND
