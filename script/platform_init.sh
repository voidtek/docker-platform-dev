#!/bin/bash

cd ..

git clone https://github.com/ec-europa/platform-dev.git
git clone https://github.com/ec-europa/atomium.git
git clone https://github.com/ec-europa/ec_resp.git
git clone https://github.com/ec-europa/ec_europa.git

cp build.properties.local platform-dev/

docker-compose build
docker-compose up --no-start
docker-compose start

docker-compose exec web composer install
docker-compose exec web ./bin/phing build-platform-dev
docker-compose exec web ./bin/phing install-platform

sudo rm -rf platform-dev/profiles/multisite_drupal_standard/themes/*
sudo ln -s ../../../../atomium ./platform-dev/profiles/multisite_drupal_standard/themes/
sudo ln -s ../../../../ec_resp ./platform-dev/profiles/multisite_drupal_standard/themes/
sudo ln -s ../../../../ec_europa ./platform-dev/profiles/multisite_drupal_standard/themes/