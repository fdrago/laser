#!/bin/bash 
#set -x

source common.sh
IP=192.168.10.107
mkdir /tmp/mnt
sudo sshfs -o allow_other,reconnect root@$IP:/ /tmp/mnt/

