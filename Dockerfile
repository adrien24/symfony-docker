FROM richarvey/nginx-php-fpm:latest

EXPOSE 80

COPY ./ /var/www/html

RUN composer install
RUN php bin/console doctrine:database:create
RUN php bin/console doctrine:migrations:migrate
RUN php bin/console doctrine:fixtures:load

ENV WEBROOT /var/www/html/public
ENV APP_ENV prod



