#!/bin/bash
######################################################
#### WARNING PIPING TO BASH IS STUPID: DO NOT USE THIS
######################################################
# modified from: jcppkkk/prepare-ubuntu-template.sh
# TESTED ON UBUNTU 18.04 LTS (Alternate installer, without cloud-init)
# TESTED ON UBUNTU 22.04.1 LTS (Works for me)

if [ `id -u` -ne 0 ]; then
	echo Need sudo
	exit 1
fi

set -v

sleep 10
clear

##########################################################
#                    Installing GNS3                     #
#                                                        #
#       download fist tools than it be running           #
#                                                        #
##########################################################

apt update ; apt upgrade -y
mkdir -p /tmp/gns-installer
cd /tmp/gns-installer
curl https://raw.githubusercontent.com/GNS3/gns3-server/master/scripts/remote-install.sh > gns3-remote-install.sh
bash gns3-remote-install.sh --with-openvpn --with-iou --with-i386-repository

clear

######################################################
#             Installation Succesful                 #
#                 Server rebooting 5sec              #
#                                                    #
######################################################
sleep 5 ; reboot
