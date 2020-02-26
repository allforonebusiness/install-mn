#!/bin/bash

COIN_REPO_16='https://github.com/allforonebusiness/allforonebusiness/releases/download/4.1.2.1/AFO_4.1.2.1_Linux1604_daemon.tar.gz'
COIN_REPO_18='https://github.com/allforonebusiness/allforonebusiness/releases/download/4.1.2.1/AFO_4.1.2.1_Linux1804_daemon.tar.gz'
COIN_NAME='allforonebusiness'

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function detect_ubuntu() {
 if [[ $(lsb_release -d) == *18.04* ]]; then
   UBUNTU_VERSION=18
 elif [[ $(lsb_release -d) == *16.04* ]]; then
   UBUNTU_VERSION=16
 elif [[ $(lsb_release -d) == *14.04* ]]; then
   UBUNTU_VERSION=14
else
   echo -e "${RED}You are not running Ubuntu 14.04, 16.04 or 18.04 Installation is cancelled.${NC}"
   exit 1
fi
}

function update_node_16() {
  echo -e "Updating to latest version of $COIN_NAME for Ubuntu 16"
  TMP_FOLDER=$(mktemp -d)
  cd $TMP_FOLDER
  wget $COIN_REPO_16 2>&1
  COIN_ZIP_16=$(echo $COIN_REPO_16 | awk -F'/' '{print $NF}')
  tar xvzf $COIN_ZIP_16 >/dev/null 2>&1
  rm -f $COIN_ZIP_16 >/dev/null 2>&1
  chmod +x $COIN_NAME*
  cp $COIN_NAME* /usr/local/bin
  cd -
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  clear
}

function update_node_18() {
  echo -e "Updating to latest version of $COIN_NAME for Ubuntu 18"
  TMP_FOLDER=$(mktemp -d)
  cd $TMP_FOLDER
  wget $COIN_REPO_18 2>&1
  COIN_ZIP_18=$(echo $COIN_REPO_18 | awk -F'/' '{print $NF}')
  tar xvzf $COIN_ZIP_18 >/dev/null 2>&1
  rm -f $COIN_ZIP_18 >/dev/null 2>&1
  chmod +x $COIN_NAME*
  cp $COIN_NAME* /usr/local/bin
  cd -
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  clear
}



##### Main #####
clear

echo -e "Starting update script to latest version of $COIN_NAME"

systemctl stop $COIN_NAME.service

detect_ubuntu

if [[ $UBUNTU_VERSION == 18 ]]
then
  update_node_18
else
  update_node_16
fi

systemctl start $COIN_NAME.service

echo -e "Finished updating to latest version of $COIN_NAME"
