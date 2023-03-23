FROM php:apache

WORKDIR /app


RUN apt-get update && apt-get install -y && sqlite3

RUN bin/console doctrine:database:create
RUN bin/console doctrine:migrations:diff
RUN bin/console doctrine:migrations:migrate   


COPY / /app
