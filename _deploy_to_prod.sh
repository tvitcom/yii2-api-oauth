#!/bin/bash

#Script Will be launched from dev host approot (!!!not webroot) directory:
# Using: sh deploy_to_prod.sh 

PROJNAME="ownproject"
TIMESTAMP=$(date +%N);
TMPPATH="/tmp/"$PROJNAME$TIMESTAMP
REMOTE_SERVER='192.168.10.122';
REMOTE_USER="abc";
LOCAL_PATH='/var/www/ownassets/'; # !!! With slash
REMOTE_PATH='/var/www/htdocs/';   # !!! With slash

if [ -f /usr/bin/php ];then
    php ./yii cache/flush-all;
else
    echo "Error: PHP is not available!!!";
fi

#Delete frontend: web/assets files:
sudo mkdir -m 777 $TMPPATH 
sudo mv ./web/assets/.gitignore $TMPPATH
sudo mv ./web/assets/index.html $TMPPATH
sudo mv ./web/assets/.htaccess $TMPPATH
sudo rm -rf ./web/assets/*
sudo mv $TMPPATH/.gitignore ./web/assets/
sudo mv $TMPPATH/index.html ./web/assets/
sudo mv $TMPPATH/.htaccess ./web/assets/
sudo rm -rf $TMPPATH

#Delete web/backend/assets files:
sudo mkdir -m 777 $TMPPATH 
sudo mv ./web/backend/assets/.gitignore $TMPPATH
sudo mv ./web/backend/assets/index.html $TMPPATH
sudo mv ./web/backend/assets/.htaccess $TMPPATH
sudo rm -rf ./web/backend/assets/*
sudo mv $TMPPATH/.gitignore ./web/backend/assets/
sudo mv $TMPPATH/index.html ./web/backend/assets/
sudo mv $TMPPATH/.htaccess ./web/backend/assets/
sudo rm -rf $TMPPATH

#Delete web/rest/assets files:
sudo mkdir -m 777 $TMPPATH 
sudo mv ./web/rest/assets/.gitignore $TMPPATH
sudo mv ./web/rest/assets/index.html $TMPPATH
sudo mv ./web/rest/assets/.htaccess $TMPPATH
sudo rm -rf ./web/rest/assets/*
sudo mv $TMPPATH/.gitignore ./web/rest/assets/
sudo mv $TMPPATH/index.html ./web/rest/assets/
sudo mv $TMPPATH/.htaccess ./web/rest/assets/
sudo rm -rf $TMPPATH

if [ ! ping -c 2 192.168.10.2 | grep 'bytes from' ] 
then
    echo "Вы не в домашней сети!";exit 127
fi

## SYNC DWNL FOLDER: ###
echo "Syncing site with "$SERVER;
#!!!Dont updated index,php:  rsync -e 'ssh -p 12222' -DOPHhporgvutzil --delete $LOCAL_PATH $SERVER:$REMOTE_PATH
echo 'sync -e "ssh -p 12222" -PLSluvr --exclude=".git" --exclude=".gitignore" --exclude="runtime/logs" --no-perms --no-t '$LOCAL_PATH $REMOTE_USER@$REMOTE_SERVER:$REMOTE_PATH;

echo "Deploy on REMOTE_SERVER is successfully!!!";
