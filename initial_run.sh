#! bin/sh
# php-srcをclone
git clone git@github.com:php/php-src.git .

# dockerの準備・立ち上げ
docker-compose build
docker-compose up -d

# composer install
docker-compose run sandbox composer install

# php build
docker compose exec sandbox bash -c "
    cd php-src &&\
    ./buildconf &&\
    ./configure --enable-debug &&\
    make -j4 &&\
    make install
    "
