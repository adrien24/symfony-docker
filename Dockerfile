FROM php:apache

WORKDIR /app


RUN apt-get update && apt-get install -y \
    sqlite3

RUN composer install 

CMD ["php", "bin/console", "doctrine:database:create"; "php", "bin/console", "doctrine:migrations:diff"; "php", "bin/console", "doctrine:migrations:migrate"; "php", "bin/console", "server:run"; "symfony", "server:start"]


COPY / /app
