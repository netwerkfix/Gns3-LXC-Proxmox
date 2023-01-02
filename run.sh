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

##########################################################
#                    Installing GNS3                     #
#                                                        #
#         download fist tools than installation          #
#                                                        #
##########################################################

cd /etc/systemd/system/
wget https://raw.githubusercontent.com/netwerkfix/Gns3-prep/378e4aa4ddcddf12c6cf1829003ccee08b5d8a5c/installer.service
chmod 755 installer.service
mkdir -p /tmp/gns-installer
cd /tmp/gns-installer
wget https://raw.githubusercontent.com/netwerkfix/Gns3-prep/main/remote-install.sh
chmod 755 remote-install.sh
systemctl enable installer.service
sleep 5
clear
######################################################
#             The Tools has been installed           #
#                Server shutdown 5 sec              #
#                                                    #
######################################################
sleep 5 ; shutdown
