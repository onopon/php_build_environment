FROM ubuntu:23.10

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
RUN pecl install ast

WORKDIR /src
SHELL ["/bin/bash", "-c"]
