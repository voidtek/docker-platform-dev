#!/bin/bash

docker-compose exec -u web web composer install
docker-compose exec -u web web ./bin/phing build-platform-dev
docker-compose exec -u web web ./bin/phing install-platform
