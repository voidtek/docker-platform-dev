#!/bin/bash
echo '============== Composer Install ============='
docker-compose exec -u root web composer install
echo '============== Build Platform ============='
docker-compose exec -u root web ./bin/phing build-platform-dev
echo '============== Install Platform ============='
docker-compose exec -u root web ./bin/phing install-platform

echo '============== Manage owner/permission ============='
docker-compose exec -u root web chown -R ec2-user:ec2-user .
docker-compose exec -u root web chmod -R ug+w .