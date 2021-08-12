FROM php:8.0.2-fpm

ENV USER_ID=1000
ENV USER_NAME=ubuntu

RUN apt-get update && apt-get install -y \
	git \ 
	curl \
	zip \
	unzip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# COPY
COPY ./src /var/www

# Add a new user "ubuntu" with user id 8877
RUN useradd -u ${USER_ID} ${USER_NAME}

# Change to non-root privilege
USER ubuntu

WORKDIR /var/www
