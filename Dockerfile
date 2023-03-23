FROM richarvey/nginx-php-fpm:latest

COPY ./ /var/www/html

EXPOSE 80:80

RUN composer install
RUN php bin/console doctrine:database:create
RUN php bin/console doctrine:migrations:migrate
RUN php bin/console doctrine:fixtures:load

ENV WEBROOT /var/www/html/public
ENV APP_ENV prod



