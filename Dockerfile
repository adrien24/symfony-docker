FROM php:apache

WORKDIR /app


RUN apt-get update && apt-get install -y \
    sqlite3
   


COPY / /app
