[![Build Status](https://travis-ci.org/voidtek/docker-platform-dev.svg?branch=master)](https://travis-ci.org/voidtek/docker-platform-dev)

# docker-platform-dev
NextEuropa platform on Docker

## Initialisation

```
$ cd script
$ ./platform_init.sh
```

### Development

```
$ docker-compose exec web ./bin/phpcs
$ docker-compose exec web ./bin/phpunit -c tests/phpunit.xml
$ docker-compose exec web ./bin/behat -c tests/behat.yml -p standard_ec_resp

$ docker-compose exec web drush cc all -r ./build

$ docker-compose exec web bash
```

### Stop containers

```
$ docker-compose down
```

## More informations

### Persitent database

Docker will create the volume for you in the /var/lib/docker/volumes folder. This volume persist as long as you are not typing 
```
$ docker-compose down -v
```

### Tools/links

- Site: http://localhost:8080/build
- Phpmyadmin: http://localhost:8080/phpmyadmin
- Shell: http://localhost:8080/shell
