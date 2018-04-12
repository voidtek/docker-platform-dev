#!/bin/bash

docker-compose build
docker-compose up --no-start
docker-compose start

docker-compose exec web composer install
docker-compose exec web ./bin/phing build-platform-dev
docker-compose exec web ./bin/phing install-platform
