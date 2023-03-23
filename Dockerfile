FROM trafex/php-nginx:latest

WORKDIR /app

# Install sqlite
RUN apk add --no-cache sqlite
RUN php bin/console doctrine:database:create
RUN php bin/console doctrine:migrations:diff
RUN php bin/console doctrine:migrations:migrate


COPY / /app
