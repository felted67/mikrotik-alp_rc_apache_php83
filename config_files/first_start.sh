#!/bin/ash
mv /etc/apache2/httpd.conf /etc/apache2/httpd.conf.orig
mv /etc/apache2/httpd.new.conf /etc/apache2/httpd.conf
mv /etc/php83/php-fpm.conf /etc/php83/php-fpm.conf.orig
mv /etc/php83/php-fpm.new.conf /etc/php83/php-fpm.conf
mv /etc/php83/php-fpm.d/www.conf /etc/php83/php-fpm.d/www.conf.orig
mv /etc/php83/php-fpm.d/www.new.conf /etc/php83/php-fpm.d/www.conf
mv /root/index.html /var/www/localhost/htdocs/
mv /root/index.php /var/www/localhost/htdocs/
mv /root/phpinfo.php /var/www/localhost/htdocs/
chown apache:apache /var/www/localhost/htdocs/index.html
chown apache:apache /var/www/localhost/htdocs/index.php
chown apache:apache /var/www/localhost/htdocs/phpinfo.php
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
/sbin/php_configure.sh
rc-update add sshd 
rc-update add php-fpm83
rc-update add apache2
rc-service sshd start
rc-service php-fpm83 start
rc-service apache2 start
echo "****"
echo "'"
echo "Don't forget to set root-ssh password !!!"
echo "*"
echo "****"
echo "*"
echo "first_start.sh completed !"
echo "*"
echo "****"