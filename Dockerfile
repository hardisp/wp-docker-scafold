# Use official WordPress base with PHP FPM
ARG WORDPRESS_VERSION=6.8.2-php8.2-fpm
FROM wordpress:${WORDPRESS_VERSION}

# Update PHP-FPM to listen on TCP (for nginx)
RUN sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /usr/local/etc/php-fpm.d/zz-docker.conf

## Uncomment the line below to copy from existing wp-content. E.g. if you already pulled from a repository
# and want to use the existing wp-content directory.
# This is optional and can be removed if not needed. ##

# COPY ./app/wp-content /var/www/html/wp-content