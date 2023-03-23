FROM php:apache

WORKDIR /app


RUN apt-get update && apt-get install -y \
    sqlite3

RUN php bin/console doctrine:database:create
RUN php bin/console doctrine:migrations:diff
RUN php bin/console doctrine:migrations:migrate   



COPY / /app
