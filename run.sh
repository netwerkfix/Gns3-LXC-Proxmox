#!/bin/bash
######################################################
#### WARNING PIPING TO BASH IS STUPID: DO NOT USE THIS
######################################################
# TESTED ON UBUNTU 22.04 LTS (Works for me)
## Made by Damien Coopmans & Sven Ronsmans ##

if [ `id -u` -ne 0 ]; then
	echo Need sudo
	exit 1
fi

set -v
sleep 2 ; clear
##########################################################
#                    Installing GNS3                     #
#                                                        #
#         download fist tools than installation          #
#                                                        #
##########################################################
sleep 3 ; clear
sleep 3
dhclient -r
sleep 2
systemctl restart networking
sleep 2
cd /root
docker-compose up -d
sleep 2
systemctl disable installer.service
sleep 1
systemctl stop installer.service
sleep 1
rm /etc/systemd/system/installer.service
sleep 2
clear
######################################################
#             The Tools has been installed           #
#                Server reboot 5 sec                 #
#                                                    #
######################################################
sleep 5 ; reboot
