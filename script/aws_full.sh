#!/bin/bash

sudo sysctl vm.dirty_background_ratio=100
sudo sysctl vm.dirty_ratio=100
sudo sysctl vm.swappiness=0

sudo growpart /dev/xvda 1;sudo resize2fs /dev/xvda1

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