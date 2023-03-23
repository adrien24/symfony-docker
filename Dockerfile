FROM trafex/php-nginx:latest

WORKDIR /app

# Install bash

RUN apk add --no-cache bash 
RUN php bin/console doctrine:database:create
RUN php bin/console doctrine:migrations:diff
RUN php bin/console doctrine:migrations:migrate


COPY / /app
