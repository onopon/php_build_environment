#! bin/sh
# php-srcをclone
git clone git@github.com:php/php-src.git 

# dockerの準備・立ち上げ
docker-compose build
docker-compose up -d

# php-src make install
docker compose exec sandbox bash -c "
    cd php-src &&\
    ./buildconf &&\
    ./configure --enable-opcache --enable-debug &&\
    make -j4 &&\
    make install
    "

cp test.php php-src/
cp -r .vscode php-src/
