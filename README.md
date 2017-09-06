# docker-platform-dev
NextEuropa platform on Docker

## Initialisation

- $ git clone git@github.com:ec-europa/platform-dev.git
- $ docker-compose up -d
- $ docker-compose run web composer install
- $ docker-compose run web ./bin/phing build-platform-dev
- $ docker-compose run web ./bin/phing install-platform
- ...
- $ docker-compose down
