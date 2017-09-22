[![Build Status](https://travis-ci.org/voidtek/docker-platform-dev.svg?branch=master)](https://travis-ci.org/voidtek/docker-platform-dev)

# docker-platform-dev
NextEuropa platform on Docker

## Initialisation

- $ git clone git@github.com:ec-europa/platform-dev.git
- $ git clone git@github.com:ec-europa/ec_resp.git
- $ git clone git@github.com:ec-europa/ec_europa.git
- $ git clone git@github.com:ec-europa/ec_atomium.git
- $ cp build.properties.local platform-dev/
- $ docker-compose up -d
- $ docker-compose run web composer install
- $ docker-compose run web ./bin/phing build-platform-dev
- $ docker-compose run web ./bin/phing install-platform
- $ ln -s ../../../../atomium ./platform-dev/profiles/multisite_drupal_standard/themes/
- $ ln -s ../../../../ec_resp ./platform-dev/profiles/multisite_drupal_standard/themes/
- $ ln -s ../../../../ec_europa ./platform-dev/profiles/multisite_drupal_standard/themes/

or use the script: init-platform-dev.sh

### Development

- $ docker-compose run web drush cc all -r ./build
- $ docker-compose exec web sh

### Stop containers

- $ docker-compose down

## More informations

### Persitent database

Docker will create the volume for you in the /var/lib/docker/volumes folder. This volume persist as long as you are not typing docker-compose down -v

### Tools/links

- Site: http://your-site/build
- Phpmyadmin: http://your-site/phpmyadmin
- Shell: http://your-site/shell
