#!/bin/bash

docker-compose build
docker-compose up --no-start
docker-compose start
