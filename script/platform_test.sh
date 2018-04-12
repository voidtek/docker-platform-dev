#!/bin/bash

docker-compose exec web ./bin/phpcs
docker-compose exec web ./bin/phpunit -c tests/phpunit.xml
docker-compose exec web ./bin/behat -c tests/behat.yml