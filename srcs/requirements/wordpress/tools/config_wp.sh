#!/bin/bash

cd /var/www/html

if [ ! -f ./wp-config.php ]; then
	# descarga wordpress
	wp core download --allow-root
	# configuar el archivo de wp con los parametros de la base de datos
	wp config create --allow-root --dbname=$SQL_DB --dbuser=$SQL_USER --dbpass=$SQL_PWD --dbhost=mariadb --path='/var/www/html'
	# instala wp
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	# crea el usuario de wp
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
fi

mkdir /run/php
/usr/sbin/php-fpm7.4 -F
