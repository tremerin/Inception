FROM	debian:11

RUN	apt update -y && apt upgrade -y
RUN	apt install -y nginx vim curl
RUN	mkdir -p /etc/nginx/ssl
# creacion del certificado ssl
RUN	apt install -y openssl
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/L=Malaga/O=42/OU=42/CN=fgalan-r.42.fr/UID=fgalan-r"
RUN	mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html

CMD	["nginx", "-g", "daemon off;"]
