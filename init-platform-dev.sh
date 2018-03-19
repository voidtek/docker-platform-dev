#!/bin/bash

sudo sysctl vm.dirty_background_ratio=100
sudo sysctl vm.dirty_ratio=100
sudo sysctl vm.swappiness=0

DIR=$HOME/environment
[ -d $DIR/cloud9/conf.d ]||mkdir -p $DIR/cloud9/conf.d
KONF=$DIR/cloud9/conf.d/cloud9.conf
if [ -f $KONF ];then source $KONF;else
read -p "GITHUB USER (Name Surname) = " USER;USER=${USER:-NOUSER};echo USER=\"$USER\">>$KONF
read -p "GITHUB EMAIL (user@domain) = " EMAIL;EMAIL=${EMAIL:-"NOUSER@NOMAIL"};echo EMAIL=$EMAIL>>$KONF
read -p "GITHUB_USER (Github username) = " GITHUB_USER;GITHUB_USER=${GITHUB_USER:-NOUSER};echo GITHUB_USER=$GITHUB_USER>>$KONF
git config --global user.name $USER;git config --global user.email $EMAIL
fi

BASHRC=$HOME/.bashrc
grep -q ^HISTSIZE=1000000 $BASHRC||(sed -i /HIST/d $BASHRC&&echo HISTSIZE=1000000>>$BASHRC&&echo HISTFILESIZE=1000000>>$BASHRC&&echo 'HISTTIMEFORMAT="%F %T "'>>$BASHRC&&source $BASHRC)
SSH=$HOME/.ssh/authorized_keys
PUB=$DIR/cloud9/.devops.pub
grep -q devops $SSH||(sudo cat $PUB>>$SSH&&curl https://github.com/$GITHUB_USER.keys>>$SSH)

git clone git@github.com:ec-europa/platform-dev.git
git clone git@github.com:ec-europa/atomium.git
git clone git@github.com:ec-europa/ec_resp.git
git clone git@github.com:ec-europa/ec_europa.git

cp build.properties.local platform-dev/

docker-compose build
docker-compose up --no-start
docker-compose start
docker-compose run web composer install
docker-compose run web ./bin/phing build-platform-dev
docker-compose run web ./bin/phing install-platform

rm -rf platform-dev/profiles/multisite_drupal_standard/themes/*
ln -s ../../../../atomium ./platform-dev/profiles/multisite_drupal_standard/themes/
ln -s ../../../../ec_resp ./platform-dev/profiles/multisite_drupal_standard/themes/
ln -s ../../../../ec_europa ./platform-dev/profiles/multisite_drupal_standard/themes/
