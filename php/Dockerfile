# Use the official PHP image as a base image
ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm

# Install  extensions
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql

# groupmod -o -g 1000 www-data: This command modifies the group with the name www-data to have the group ID (gid) of 1000. 
# usermod -o -u 1000 -g www-data www-data: This command modifies the user with the name www-data to have the user ID (uid) of 1000 and assigns it to the group www-data.
# The -o option  allows changing the group ID even if it is already in use by another group.
RUN groupmod -o -g 1000 www-data && \
    usermod -o -u 1000 -g www-data www-data

WORKDIR /var/www

# The CMD directive specifies the command to run when the container starts
CMD ["php-fpm"]
