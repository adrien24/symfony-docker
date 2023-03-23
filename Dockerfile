FROM trafex/php-nginx:latest

WORKDIR /app



RUN chown -R nginx:nginx /var/lib/nginx && chown -R nginx:nginx /var/tmp/nginx && apk add --no-cache sqlite && php bin/console doctrine:database:create && php bin/console doctrine:migrations:diff && php bin/console doctrine:migrations:migrate


COPY / /app
