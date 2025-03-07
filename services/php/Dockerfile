ARG PHP_VERSION=8.1

FROM php:${PHP_VERSION}-fpm-alpine

# Установка постоянных зависимостей
RUN apk add --no-cache \
    libpng \
    libjpeg-turbo \
    libwebp \
    freetype \
    libzip \
    icu-libs \
    libxml2 \
    oniguruma \
    mysql-client

# Установка временных зависимостей для сборки расширений
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    libzip-dev \
    icu-dev \
    libxml2-dev \
    oniguruma-dev

# Установка и настройка основных расширений PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        mysqli \
        gd \
        intl \
        zip \
        bcmath \
        mbstring \
        opcache \
        xml \
        exif \
    # Очистка временных файлов
    && apk del .build-deps \
    && rm -rf /tmp/*

# Настройка opcache
RUN { \
        echo 'opcache.memory_consumption=128'; \
        echo 'opcache.interned_strings_buffer=8'; \
        echo 'opcache.max_accelerated_files=4000'; \
        echo 'opcache.revalidate_freq=2'; \
        echo 'opcache.fast_shutdown=1'; \
        echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Установка Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Настройка рабочей директории
WORKDIR /var/www/html

# Установка пользователя и прав
RUN addgroup -g 1000 www && \
    adduser -u 1000 -G www -s /bin/sh -D www && \
    chown -R www:www /var/www

# Запуск от пользователя www
USER www

# Команда для запуска
CMD ["php-fpm"] 