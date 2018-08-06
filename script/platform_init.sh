#!/bin/bash

cd ..
echo '============== Clone other repositories ============='
git clone https://github.com/ec-europa/platform-dev.git
git clone https://github.com/ec-europa/atomium.git
git clone https://github.com/ec-europa/ec_resp.git
git clone https://github.com/ec-europa/ec_europa.git

echo '============== Copy properties file inside the platform ============='
cp build.properties.local platform-dev/


script/platform_start.sh
script/platform_build.sh



echo '============== Symlinks Standard profile ============='
rm -rf platform-dev/profiles/multisite_drupal_standard/themes/*
ln -s ../../../../atomium ./platform-dev/profiles/multisite_drupal_standard/themes/
ln -s ../../../../ec_resp ./platform-dev/profiles/multisite_drupal_standard/themes/
ln -s ../../../../ec_europa ./platform-dev/profiles/multisite_drupal_standard/themes/

echo '============== Symlinks Communities profile ============='
rm -rf platform-dev/profiles/multisite_drupal_communities/themes/*
ln -s ../../../../atomium ./platform-dev/profiles/multisite_drupal_communities/themes/
ln -s ../../../../ec_resp ./platform-dev/profiles/multisite_drupal_communities/themes/
ln -s ../../../../ec_europa ./platform-dev/profiles/multisite_drupal_communities/themes/