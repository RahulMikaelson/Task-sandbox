FROM php:7.2-fpm

# RUN apt-get update && apt-get install -y \
#     libicu-dev \
#     zip \
#     unzip \
#     git \
#     curl \
#     && docker-php-ext-install intl

RUN apt-get update && \
    apt-get install -y \
        git \
        unzip \
        libicu-dev \
        libzip-dev \
        libonig-dev \
        && \
    docker-php-ext-install \
        intl \
        pdo_mysql \
        zip \
        && \
    pecl install \
        apcu \
        && \
    docker-php-ext-enable \
        apcu

# curl
RUN apt-get install -y curl
# Install Composer 1.10
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.24

# Install NodeJS V-13
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash
# Set the working directory to /app
WORKDIR /app

# Copy the contents of the local application folder to the Docker working directory
COPY ./app /app

VOLUME /app


