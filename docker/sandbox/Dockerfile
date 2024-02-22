FROM ubuntu:23.10

## 設定ファイルをdockerコンテナ内のPHP、Apacheに読み込ませる
#ADD php.ini /usr/local/etc/php/
#ADD 000-default.conf /etc/apache2/sites-enabled/
#
## Composerのインストール
#RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer

# ミドルウェアインストール
RUN apt-get update \
&& apt-get install -y \
git \
zip \
unzip \
vim \
pkg-config \
build-essential \
autoconf \
bison \
re2c \
libxml2-dev \
libsqlite3-dev \
gdb \
gcc \
cmake \
php-ast \
php-pear \
php-dev \
&& pecl install ast

WORKDIR /src
SHELL ["/bin/bash", "-c"]
