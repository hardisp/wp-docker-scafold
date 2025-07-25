# Use official WordPress base with PHP FPM
ARG WORDPRESS_VERSION=6.8.2-php8.2-fpm
FROM wordpress:${WORDPRESS_VERSION}

# Update PHP-FPM to listen on TCP (for nginx)
RUN sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /usr/local/etc/php-fpm.d/zz-docker.conf

# Optional: pre-copy wp-content if needed
COPY ./app/wp-content /var/www/html/wp-content