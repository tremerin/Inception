FROM	debian:11

RUN	apt update -y && apt upgrade -y
RUN	apt install -y php7.4 php-fpm php-mysql mariadb-client curl
RUN	mkdir -p /var/www/html
RUN	adduser -D -H -S -G www-data www-data # usuario que necesitamos para acceder a nginx
RUN	chown -R www-data:www-data /var/www/html
RUN	cd /var/www/html
# descargar el clip de wordpress
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d
COPY	tools/config_wp.sh /config_wp.sh
RUN	chmod +x config_wp.sh

CMD	["/config_wp.sh"]
