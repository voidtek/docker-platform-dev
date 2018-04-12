#!/bin/bash

docker-compose exec -u web web ./bin/phpcs
docker-compose exec -u web web ./bin/phpunit -c tests/phpunit.xml
docker-compose exec -u web web ./bin/behat -c tests/behat.yml