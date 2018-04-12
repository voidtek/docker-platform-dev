#!/bin/bash

cd ..
git clone https://github.com/ec-europa/platform-dev.git
git clone https://github.com/ec-europa/atomium.git
git clone https://github.com/ec-europa/ec_resp.git
git clone https://github.com/ec-europa/ec_europa.git

cp build.properties.local platform-dev/

cd script
./platform_start.sh
./platform_build.sh

cd ..
rm -rf platform-dev/profiles/multisite_drupal_standard/themes/*
ln -s ../../../../atomium ./platform-dev/profiles/multisite_drupal_standard/themes/
ln -s ../../../../ec_resp ./platform-dev/profiles/multisite_drupal_standard/themes/
ln -s ../../../../ec_europa ./platform-dev/profiles/multisite_drupal_standard/themes/

rm -rf platform-dev/profiles/multisite_drupal_communities/themes/*
ln -s ../../../../atomium ./platform-dev/profiles/multisite_drupal_communities/themes/
ln -s ../../../../ec_resp ./platform-dev/profiles/multisite_drupal_communities/themes/
ln -s ../../../../ec_europa ./platform-dev/profiles/multisite_drupal_communities/themes/